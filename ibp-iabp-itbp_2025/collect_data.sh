#!/bin/bash

dir='results'
sampleSize=('5' '13')
methods=('ibp' 'iabp' 'itbp')
pdbIDs=($(cat pdb_ids.txt))

for ((i = 0; i < ${#sampleSize[@]}; i++)); do
	printf "\\\\section{Sample Size = %s}\n\n" ${sampleSize[i]}
	for ((j = 0; j < ${#methods[@]}; j++)); do
		printf "\\\\subsection{%s}\n\n" ${methods[j]}
		printf "\\\\begin{table}[H] \n"
		printf "\\\\centering \n"
		printf "\\\\begin{tabular}{|c|c|r|r|c|c|r|r|r|} \n"
		printf "\\\\hline \n"
		printf "PDB id & l.e.v. & CPU time & n.o.e.v. & n.o.f.s. & n.o.c.s. & maxMDE & maxLDE & minRMSD \\\\\\\\ \n"
		
		for ((k = 0; k < ${#pdbIDs[@]}; k++)); do
			dirname="$dir/sample_size=${sampleSize[i]}/${methods[j]}/${pdbIDs[k]}"
			fname="$dirname/results.txt"
			
			cpu=
			lev=
			noev=
			nofs=
			nocs=
			maxMDE=
			maxLDE=
			minRMSD=
			if [ -e "$fname" ]; then
				cpu=$(awk -F' *= *' '/CPU time/ {print $2}' "$fname")
				lev=$(awk -F' *= *' '/Last embedded vertex/ {split($2, a, "/"); print a[1]}' "$fname")             
				noev=$(awk -F' *= *' '/Number of embedded vertices/ {print $2}' "$fname")
				nofs=$(awk -F' *= *' '/Number of solutions found/ {print $2}' "$fname")
				nocs=$(awk -F' *= *' '/Number of considered solutions/ {print $2}' "$fname")
				maxMDE=$(awk -F' *= *' '/maximum MDE/ {print $2}' "$fname")
				maxLDE=$(awk -F' *= *' '/maximum LDE/ {print $2}' "$fname")
				minRMSD=$(awk -F' *= *' '/minimum RMSD/ {print $2}' "$fname")
			fi
			
			printf "\\\\hline \n"
			printf "%s & %-10s & %-10s & %-10s & %-10s & %-10s & %-10s & %-10s & %-10s \\\\\\\\ \n" "${pdbIDs[k]}" "$lev" "$cpu" "$noev" "$nofs" "$nocs" "$maxMDE" "$maxLDE" "$minRMSD"
		done
		
		printf "\\\\hline \n"
		printf "\\\\end{tabular} \n"
		printf "\\\\end{table} \n\n"
	done
done > results.txt
