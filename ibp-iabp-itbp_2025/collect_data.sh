#!/bin/bash
set -Eeuo pipefail
export LC_ALL=C

# =========================
# Config
# =========================
# Root directory containing "sample_size=*"
dir="results"
# File listing PDB IDs in the desired order
pdb_file="pdb_ids.txt"
# Output LaTeX file
out="results.dat"

# =========================
# Read PDB IDs preserving file order
# =========================
mapfile -t pdbIDs < "$pdb_file"

# Reset output file
: > "$out"

# =========================
# Helpers
# =========================
# Extract the first floating-point number (incl. sign and exponent) from a string
extract_float() {
	awk 'match($0,/[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?/){print substr($0,RSTART,RLENGTH)}' <<<"${1:-}"
}

# Extract the first integer (incl. sign) from a string
extract_int() {
	awk 'match($0,/[-+]?[0-9]+/){print substr($0,RSTART,RLENGTH)}' <<<"${1:-}"
}

# Format integer with fixed width W.
# If missing, return a right-aligned "---" padded to width.
fmt_int() {
	local val="$1" width="$2" outstr
	if [[ -z "$val" ]]; then
		printf -v outstr "%${width}s" "---"
	else
		printf -v outstr "%${width}d" "$val"
	fi
	printf "%s" "$outstr"
}

# Format float with fixed width W and precision P.
# If missing, return a right-aligned "---" padded to width.
fmt_float() {
	local val="$1" width="$2" prec="$3" outstr
	if [[ -z "$val" ]]; then
		printf -v outstr "%${width}s" "---"
	else
		printf -v outstr "%${width}.${prec}f" "$val"
	fi
	printf "%s" "$outstr"
}

# Format float with leading space for positives (like "% 11.4f").
# If missing, return a right-aligned "---" padded to width.
fmt_float_leadspace() {
	local val="$1" width="$2" prec="$3" outstr
	if [[ -z "$val" ]]; then
		printf -v outstr "%${width}s" "---"
	else
		printf -v outstr "% ${width}.${prec}f" "$val"
	fi
	printf "%s" "$outstr"
}

# Format float in scientific notation with fixed width W and precision P.
# If missing, return a right-aligned "---" padded to width.
fmt_sci() {
	local val="$1" width="$2" prec="$3" outstr
	if [[ -z "$val" ]]; then
		printf -v outstr "%${width}s" "---"
	else
		printf -v outstr "%${width}.${prec}e" "$val"   # use %E for uppercase exponent
	fi
	printf "%s" "$outstr"
}


# =========================
# Main traversal
# =========================
shopt -s nullglob
for sample_dir in "$dir"/sample_size=*; do
	[[ -d "$sample_dir" ]] || continue
	sample_basename="${sample_dir##*/}"            # e.g., "sample_size=5"
	sample_size="${sample_basename#sample_size=}"  # e.g., "5"

	# LaTeX section
	printf "\\\\section{Sample Size = %s}\n\n" "$sample_size" >> "$out"

	# Methods are subdirectories inside each sample_size
	for method_dir in "$sample_dir"/*; do
		[[ -d "$method_dir" ]] || continue
		method="${method_dir##*/}"

		# LaTeX subsection and table header
		printf "\\\\subsection{%s}\n\n" "$method" >> "$out"
		printf "\\\\begin{table}[H]\n"                        >> "$out"
		printf "\\\\centering\n"                              >> "$out"
		printf "\\\\begin{tabular}{|c|c|r|r|c|c|r|r|r|}\n"    >> "$out"
		printf "\\\\hline\n"                                  >> "$out"
		printf "PDB id & l.e.v. & CPU time & n.o.e.v. & n.o.f.s. & n.o.c.s. & maxMDE & maxLDE & minRMSD \\\\\\\\ \n" >> "$out"

		# One row per PDB, in the exact order from pdb_ids.txt
		for pdb in "${pdbIDs[@]}"; do
			dirname="$method_dir/$pdb"
			fname="$dirname/results.txt"

			cpu="" lev="" noev="" nofs="" nocs="" maxMDE="" maxLDE="" minRMSD=""
			if [[ -e "$fname" ]]; then
				cpu=$(awk -F' *= *' '/CPU time/ {print $2}' "$fname" || true)
				lev=$(awk -F' *= *' '/Last embedded vertex/ {split($2,a,"/"); gsub(/^ *| *$/,"",a[1]); print a[1]}' "$fname" || true)
				noev=$(awk -F' *= *' '/Number of embedded vertices/ {print $2}' "$fname" || true)
				nofs=$(awk -F' *= *' '/Number of solutions found/ {print $2}' "$fname" || true)
				nocs=$(awk -F' *= *' '/Number of considered solutions/ {print $2}' "$fname" || true)
				maxMDE=$(awk -F' *= *' '/maximum MDE/ {print $2}' "$fname" || true)
				maxLDE=$(awk -F' *= *' '/maximum LDE/ {print $2}' "$fname" || true)
				minRMSD=$(awk -F' *= *' '/minimum RMSD/ {print $2}' "$fname" || true)
			fi

			# Numeric normalization (empty -> missing)
			lev_num=$(extract_int   "$lev")
			cpu_num=$(extract_float "$cpu")
			noev_num=$(extract_int  "$noev")
			nofs_num=$(extract_int  "$nofs")
			nocs_num=$(extract_int  "$nocs")
			mMDE_num=$(extract_float "$maxMDE")
			mLDE_num=$(extract_float "$maxLDE")
			minR_num=$(extract_float "$minRMSD")

			# Render one LaTeX table row with requested specifiers:
			# %s %53d %10.4f %7.1e %7.1e %1d %7.1e %7.1e %4.2f
			printf "\\\\hline\n" >> "$out"
			{
				# 1) %s (PDB ID)
				printf "%s & " "$pdb"
				# 2) %5d (l.e.v.)
				printf "%s & " "$(fmt_int "$lev_num" 3)"
				# 3) % 11.4f (CPU time, leading space for positives)
				printf "%s & " "$(fmt_float "$cpu_num" 10 4)"
				# 4) %16d (n.o.e.v.)
				printf "%s & " "$(fmt_sci "$noev_num" 7 1)"
				# 5) %12d (n.o.f.s.)
				printf "%s & " "$(fmt_sci "$nofs_num" 7 1)"
				# 6) %3d (n.o.c.s.)
				printf "%s & " "$(fmt_int "$nocs_num" 1)"
				# 7) %8.6f (maxMDE)
				printf "%s & " "$(fmt_sci "$mMDE_num" 7 1)"
				# 8) %8.6f (maxLDE)
				printf "%s & " "$(fmt_sci "$mLDE_num" 7 1)"
				# 9) %8.6f (minRMSD)
				printf "%s \\\\\\\\ \n" "$(fmt_float "$minR_num" 4 2)"
			} >> "$out"
		done

		# Close table
		printf "\\\\hline\n"        >> "$out"
		printf "\\\\end{tabular}\n" >> "$out"
		printf "\\\\end{table}\n\n" >> "$out"
	done
done
