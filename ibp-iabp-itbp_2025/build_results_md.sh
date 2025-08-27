#!/usr/bin/env bash
# build_results_md.sh
# Generate GitHub-friendly Markdown tables from per-PDB results.txt files.
# It scans a results directory tree and emits results.md with sections per
# sample size and method.

set -Eeuo pipefail
export LC_ALL=C

# =========================
# Configuration
# =========================
# Root directory where per-experiment outputs live
dir='results'

# Sample sizes and methods to iterate over
sampleSize=('5' '13')
methods=('ibp' 'iabp' 'itbp')

# File containing the list of PDB IDs (one per line)
pdb_list_file='pdb_ids.txt'

# Output Markdown file (consumed by README.md, if desired)
out_md='results.md'
: > "$out_md"	# truncate output file

# =========================
# Safe formatting helpers
# =========================
# If the input is numeric, format it; otherwise return the original
fmtf() { # float
	local v="${1:-}"; local fmt="${2:-%.6f}"
	[[ $v =~ ^-?[0-9]+([.][0-9]+)?$ ]] && printf "$fmt" "$v" || printf "%s" "$v"
}
fmtd() { # int
	local v="${1:-}"; local fmt="${2:-%d}"
	[[ $v =~ ^-?[0-9]+$ ]] && printf "$fmt" "$v" || printf "%s" "$v"
}

# =========================
# Markdown table printers
# =========================
print_table_header() {
	# Note: use right alignment for numeric columns
	cat <<'EOF'
| PDB id | l.e.v. | CPU time (s) | n.o.e.v. | n.o.f.s. | n.o.c.s. | maxMDE | maxLDE | minRMSD |
|:-------|-------:|-------------:|---------:|---------:|---------:|-------:|-------:|--------:|
EOF
}

print_row() {
	# Args: pdb lev cpu noev nofs nocs maxMDE maxLDE minRMSD
	printf '| %s | %s | %s | %s | %s | %s | %s | %s | %s |\n' "$@"
}

# =========================
# Inputs
# =========================
if [[ ! -f "$pdb_list_file" ]]; then
	echo "[ERROR] '${pdb_list_file}' not found. Provide a list of PDB IDs (one per line)." >&2
	exit 1
fi
mapfile -t pdbIDs < "$pdb_list_file"

# =========================
# Main loop
# =========================
for ss in "${sampleSize[@]}"; do
	{
		echo "## Sample Size = ${ss}"
		echo
	} >> "$out_md"

	for meth in "${methods[@]}"; do
		# Valid combinations: (ibp,13) OR (ss=5 and meth in {iabp,itbp})
		if [[ ( "$meth" == "ibp" && "$ss" == "13" ) || ( "$ss" == "5" && ( "$meth" == "iabp" || "$meth" == "itbp" ) ) ]]; then
			{
				echo "### ${meth}"
				echo
				print_table_header
			} >> "$out_md"

			for pdb in "${pdbIDs[@]}"; do
				dirname="$dir/sample_size=${ss}/${meth}/${pdb}"
				fname="$dirname/results.txt"

				# Defaults (placeholders for missing values)
				cpu='---'; lev='---'; noev='---'; nofs='---'; nocs='---'
				maxMDE='---'; maxLDE='---'; minRMSD='---'

				if [[ -f "$fname" ]]; then
					# Single awk pass to extract metrics
					# Expected patterns inside each results.txt:
					#	 CPU time = <float>
					#	 Last embedded vertex = X/Y
					#	 Number of embedded vertices = <int>
					#	 Number of solutions found = <int>
					#	 Number of considered solutions = <int>
					#	 maximum MDE = <float>
					#	 maximum LDE = <float>
					#	 minimum RMSD = <float>
					read -r cpu lev noev nofs nocs maxMDE maxLDE minRMSD < <(
						awk -F' *= *' '
							/CPU time/				{ cpu=$2 }
							/Last embedded vertex/			{ split($2,a,"/"); lev=a[1] }
							/Number of embedded vertices/		{ noev=$2 }
							/Number of solutions found/		{ nofs=$2 }
							/Number of considered solutions/	{ nocs=$2 }
							/maximum MDE/				{ maxMDE=$2 }
							/maximum LDE/				{ maxLDE=$2 }
							/minimum RMSD/				{ minRMSD=$2 }
							END {
								printf "%s %s %s %s %s %s %s %s\n", cpu, lev, noev, nofs, nocs, maxMDE, maxLDE, minRMSD
							}
						' "$fname"
					)

					# Normalize empties to placeholders
					cpu=${cpu:---}; lev=${lev:---}; noev=${noev:---}; nofs=${nofs:---}; nocs=${nocs:---}
					maxMDE=${maxMDE:---}; maxLDE=${maxLDE:---}; minRMSD=${minRMSD:---}
				fi

				# Format fields for Markdown (no fixed width; pure values)
				pdb_p="$pdb"
				lev_p="$(fmtd "$lev" "%d")"
				cpu_p="$(fmtf "$cpu" "%.4f")"
				noev_p="$(fmtd "$noev" "%d")"
				nofs_p="$(fmtd "$nofs" "%d")"
				nocs_p="$(fmtd "$nocs" "%d")"
				maxMDE_p="$(fmtf "$maxMDE" "%.6f")"
				maxLDE_p="$(fmtf "$maxLDE" "%.6f")"
				minRMSD_p="$(fmtf "$minRMSD" "%.3f")"

				print_row "$pdb_p" "$lev_p" "$cpu_p" "$noev_p" "$nofs_p" "$nocs_p" "$maxMDE_p" "$maxLDE_p" "$minRMSD_p" >> "$out_md"
			done

			echo >> "$out_md"
		fi
	done

	echo >> "$out_md"
done

# Replace the block between markers in README.md with the content of results.md.
# This script is GitHub-friendly and does not rely on non-portable sed features.

set -Eeuo pipefail
export LC_ALL=C

# -------------------------
# Configuration
# -------------------------
RESULTS_MD="${1:-results.md}"	# optional first arg; defaults to results.md
README_MD="${2:-README.md}"	# optional second arg; defaults to README.md

START_MARK="<!-- RESULTS START -->"
END_MARK="<!-- RESULTS END -->"

# -------------------------
# Sanity checks
# -------------------------
if [[ ! -f "$RESULTS_MD" ]]; then
	echo "[ERROR] '$RESULTS_MD' not found. Run your builder to generate it." >&2
	exit 1
fi

if [[ ! -f "$README_MD" ]]; then
	echo "[ERROR] '$README_MD' not found in the current directory." >&2
	exit 1
fi

if ! grep -qF "$START_MARK" "$README_MD"; then
	cat >&2 <<EOF
[ERROR] Start marker not found in '$README_MD'.
Add this line where the results should be injected:

$START_MARK
EOF
	exit 1
fi

if ! grep -qF "$END_MARK" "$README_MD"; then
	cat >&2 <<EOF
[ERROR] End marker not found in '$README_MD'.
Add this line after the injection region:

$END_MARK
EOF
	exit 1
fi

# Ensure the start appears before the end (basic sanity)
START_LINE=$(grep -nF "$START_MARK" "$README_MD" | head -n1 | cut -d: -f1)
END_LINE=$(grep -nF "$END_MARK" "$README_MD" | head -n1 | cut -d: -f1)
if (( END_LINE <= START_LINE )); then
	echo "[ERROR] '$END_MARK' appears before '$START_MARK' in '$README_MD'." >&2
	exit 1
fi

# -------------------------
# Do the replacement
# -------------------------
TMP_FILE="$(mktemp)"

# AWK strategy:
# - print lines until START_MARK
# - when START_MARK is found, print it, then the contents of RESULTS_MD
# - skip all lines until END_MARK and print END_MARK
# - continue printing the rest of the file
awk -v start="$START_MARK" -v end="$END_MARK" -v inject="$RESULTS_MD" '
	BEGIN { in_block = 0 }
	$0 ~ start && in_block == 0 {
		print $0
		# inject file contents right after START_MARK
		command = "cat " inject
		system(command)
		in_block = 1
		next
	}
	$0 ~ end && in_block == 1 {
		print $0
		in_block = 0
		next
	}
	in_block == 0 { print $0 }
' "$README_MD" > "$TMP_FILE"

# Atomically move the new file over the old README
mv "$TMP_FILE" "$README_MD"

