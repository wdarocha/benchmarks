#!/bin/bash
set -Eeuo pipefail
export LC_ALL=C

# =========================
# Config
# =========================
dir="results"
out="results.dat"
pdb_order_file="pdb_ids.txt"

# =========================
# Reset output file
# =========================
: > "$out"

# =========================
# Helpers
# =========================
extract_float() {
	awk 'match($0,/[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?/){print substr($0,RSTART,RLENGTH)}' <<<"${1:-}"
}

extract_int() {
	awk 'match($0,/[-+]?[0-9]+/){print substr($0,RSTART,RLENGTH)}' <<<"${1:-}"
}

fmt_int() {
	local val="$1"
	local outstr

	if [[ -z "$val" ]]; then
		outstr="---"
	else
		outstr=$(awk -v n="$val" '
			function add_thousands(s,    sign, intpart, prefix, i, len, out) {
				sign = ""
				if (substr(s, 1, 1) == "-") {
					sign = "-"
					s = substr(s, 2)
				}
				len = length(s)
				prefix = len % 3
				out = sign
				if (prefix > 0) {
					out = out substr(s, 1, prefix)
					if (len > prefix) {
						out = out "."
					}
				}
				for (i = prefix + 1; i <= len; i += 3) {
					out = out substr(s, i, 3)
					if (i + 2 < len) {
						out = out "."
					}
				}
				return out
			}
			BEGIN {
				printf "%s", add_thousands(sprintf("%.0f", n))
			}
		')
	fi

	printf "%s" "$outstr"
}

fmt_float() {
	local val="$1"
	local prec="${2:-}"
	local outstr
	local sign intpart fracpart round_digit keep digits total_width carry i d newd

	add_thousands() {
		local s="$1"
		local out=""
		while ((${#s} > 3)); do
			out=".${s: -3}${out}"
			s="${s:0:${#s}-3}"
		done
		printf "%s%s" "$s" "$out"
	}

	if [[ -z "$val" ]]; then
		outstr="---"
	else
		sign=""
		if [[ "$val" == -* ]]; then
			sign="-"
			val="${val#-}"
		fi

		if [[ "$val" == *.* ]]; then
			intpart="${val%%.*}"
			fracpart="${val#*.}"
		else
			intpart="$val"
			fracpart=""
		fi

		[[ -n "$intpart" ]] || intpart="0"

		if [[ -z "$prec" ]]; then
			fracpart="${fracpart%"${fracpart##*[!0]}"}"
			outstr="${sign}$(add_thousands "$intpart")"
			if [[ -n "$fracpart" ]]; then
				outstr="${outstr},${fracpart}"
			fi
		else
			while ((${#fracpart} < prec + 1)); do
				fracpart+="0"
			done

			keep="${fracpart:0:prec}"
			round_digit="${fracpart:prec:1}"
			digits="${intpart}${keep}"
			total_width=$((${#intpart} + prec))

			if [[ -z "$digits" ]]; then
				digits="0"
			fi

			if [[ -n "$round_digit" && "$round_digit" =~ [5-9] ]]; then
				carry=1
				for ((i=${#digits}-1; i>=0 && carry; i--)); do
					d="${digits:i:1}"
					newd=$((10#$d + carry))
					if ((newd >= 10)); then
						digits="${digits:0:i}$((newd - 10))${digits:i+1}"
						carry=1
					else
						digits="${digits:0:i}${newd}${digits:i+1}"
						carry=0
					fi
				done
				if ((carry)); then
					digits="1${digits}"
				fi
			fi

			if ((${#digits} < total_width)); then
				digits="$(printf "%0${total_width}d" "$digits")"
			fi

			if ((prec > 0)); then
				if ((${#digits} <= prec)); then
					digits="$(printf "%0$((prec + 1))d" "$digits")"
				fi
				intpart="${digits:0:${#digits}-prec}"
				fracpart="${digits: -prec}"
				outstr="${sign}$(add_thousands "$intpart"),${fracpart}"
			else
				outstr="${sign}$(add_thousands "$digits")"
			fi
		fi
	fi

	printf "%s" "$outstr"
}

get_pdb_order() {
	local base_dir="$1"
	local pdb_dir
	local pdb
	local raw
	local same_sets=1
	local -a dir_pdbs=()
	local -a file_pdbs=()
	local -A seen_dir=()
	local -A seen_file=()

	for pdb_dir in "$base_dir"/*; do
		[[ -d "$pdb_dir" ]] || continue
		pdb="${pdb_dir##*/}"
		dir_pdbs+=("$pdb")
		seen_dir["$pdb"]=1
	done

	if [[ -f "$pdb_order_file" ]]; then
		while IFS= read -r raw; do
			raw="${raw%$'\r'}"
			pdb="${raw#"${raw%%[![:space:]]*}"}"
			pdb="${pdb%"${pdb##*[![:space:]]}"}"
			[[ -n "$pdb" ]] || continue
			file_pdbs+=("$pdb")
			seen_file["$pdb"]=1
		done < "$pdb_order_file"

		if [[ ${#file_pdbs[@]} -eq ${#dir_pdbs[@]} ]]; then
			for pdb in "${dir_pdbs[@]}"; do
				if [[ -z "${seen_file[$pdb]:-}" ]]; then
					same_sets=0
					break
				fi
			done

			if [[ $same_sets -eq 1 ]]; then
				for pdb in "${file_pdbs[@]}"; do
					if [[ -z "${seen_dir[$pdb]:-}" ]]; then
						same_sets=0
						break
					fi
				done
			fi

			if [[ $same_sets -eq 1 ]]; then
				printf "%s\n" "${file_pdbs[@]}"
				return
			fi
		fi
	fi

	printf "%s\n" "${dir_pdbs[@]}" | sort
}

# =========================
# Main traversal
# =========================
shopt -s nullglob

printf "sample_size\tmethod\tinterval_width\tPDB id\tl.e.v.\tCPU time\tn.o.e.v.\tn.o.f.s.\tn.o.c.s.\tmaxMDE\tmaxLDE\tminRMSD\n" >> "$out"

for sample_dir in "$dir"/sample_size=*; do
	[[ -d "$sample_dir" ]] || continue

	sample_basename="${sample_dir##*/}"
	sample_size="${sample_basename#sample_size=}"

	for method_dir in "$sample_dir"/*; do
		[[ -d "$method_dir" ]] || continue

		method="${method_dir##*/}"

		for inter_dir in "$method_dir"/*; do
			[[ -d "$inter_dir" ]] || continue

			inter_wl="${inter_dir##*/}"
			mapfile -t ordered_pdbs < <(get_pdb_order "$inter_dir")

			for pdb in "${ordered_pdbs[@]}"; do
				[[ -n "$pdb" ]] || continue
				pdb_dir="$inter_dir/$pdb"
				fname="$pdb_dir/results.txt"

				cpu=""
				lev=""
				noev=""
				nofs=""
				nocs=""
				maxMDE=""
				maxLDE=""
				minRMSD=""

				if [[ -e "$fname" ]]; then
					cpu=$(awk -F' *= *' '/CPU time/ {print $2; exit}' "$fname" || true)
					lev=$(awk -F' *= *' '/Last embedded vertex/ {split($2,a,"/"); gsub(/^ *| *$/,"",a[1]); print a[1]; exit}' "$fname" || true)
					noev=$(awk -F' *= *' '/Number of embedded vertices/ {print $2; exit}' "$fname" || true)
					nofs=$(awk -F' *= *' '/Number of solutions found/ {print $2; exit}' "$fname" || true)
					nocs=$(awk -F' *= *' '/Number of considered solutions/ {print $2; exit}' "$fname" || true)
					maxMDE=$(awk -F' *= *' '/maximum MDE/ {print $2; exit}' "$fname" || true)
					maxLDE=$(awk -F' *= *' '/maximum LDE/ {print $2; exit}' "$fname" || true)
					minRMSD=$(awk -F' *= *' '/minimum RMSD/ {print $2; exit}' "$fname" || true)
				fi

				lev_num=$(extract_int "$lev")
				cpu_num=$(extract_float "$cpu")
				noev_num=$(extract_int "$noev")
				nofs_num=$(extract_int "$nofs")
				nocs_num=$(extract_int "$nocs")
				mMDE_num=$(extract_float "$maxMDE")
				mLDE_num=$(extract_float "$maxLDE")
				minR_num=$(extract_float "$minRMSD")

				{
					printf "%s\t" "$sample_size"
					printf "%s\t" "$method"
					printf "%s\t" "$inter_wl"
					printf "%s\t" "$pdb"
					printf "%s\t" "$(fmt_int "$lev_num")"
					printf "%s\t" "$(fmt_float "$cpu_num" 4)"
					printf "%s\t" "$(fmt_int "$noev_num")"
					printf "%s\t" "$(fmt_int "$nofs_num")"
					printf "%s\t" "$(fmt_int "$nocs_num")"
					printf "%s\t" "$(fmt_float "$mMDE_num" 8)"
					printf "%s\t" "$(fmt_float "$mLDE_num" 4)"
					printf "%s\n" "$(fmt_float "$minR_num" 4)"
				} >> "$out"
			done
		done
	done
done
