#!/bin/bash

dirname='dataset'
pdbIDs=($(cat pdb_ids.txt))
chain='A'
orders=('ddgpHCorder9')
methods=('ibp' 'iabp' 'itbp')

timeD='0'
timeH='12'
timeM='00'
timeS='00'
distanceResolution='0.01'
angularResolution='5.00'
numberOfSolutions='25'
sampleSize=('5' '13')
differenceThreshold='3.0'
mkdir -p "input"

for ((k = 0; k < ${#sampleSize[@]}; k++)); do

	folder0="input/sample_size=${sampleSize[k]}"
	mkdir -p $folder0
	for ((i = 0; i < ${#pdbIDs[@]}; i++)); do
		pdbID=${pdbIDs[i]}
		for ((l = 0; l < ${#orders[@]}; l++)); do
			instanceFilePath="$dirname/$pdbID/I_${pdbID}_model1_chain${chain}_${orders[l]}.dat"
			cliquesFilePath="$dirname/$pdbID/T_${pdbID}_model1_chain${chain}_${orders[l]}.dat"
			initialStructureFilePath="$dirname/$pdbID/X_${pdbID}_model1_chain${chain}_${orders[l]}.dat"
			for ((j = 0; j < ${#methods[@]}; j++)); do
				method=${methods[j]}

				if { [[ "$method" == "ibp" && "${sampleSize[k]}" == "13" ]] || [[ "${sampleSize[k]}" == "5" && ( "$method" == "iabp" || "$method" == "itbp" ) ]]; }; then
					mkdir -p "$folder0/$method"
					mkdir -p "$folder0/$method/$pdbID"
					fileIJK="$folder0/$method/$pdbID/${pdbID}_${chain}_${orders[l]}_inputfile.txt"

					echo "structure id: $pdbID" > $fileIJK
					echo "structure chain: $chain" >> $fileIJK
					echo "method: $method" >> $fileIJK
					echo "distance constraints file: $instanceFilePath" >> $fileIJK
					echo "cliques and given torsion angles file: $cliquesFilePath" >> $fileIJK
					echo "reference structure xyz file: $initialStructureFilePath" >> $fileIJK
					echo "time limit (days-hours:minutes:seconds): $timeD-$timeH:$timeM:$timeS" >> $fileIJK
					echo "largest admissible distance deviation (in Ångströms): $distanceResolution" >> $fileIJK
					echo "angular resolution (in degrees): $angularResolution" >> $fileIJK
					echo "number of solutions (set to 0 for all solutions): $numberOfSolutions" >> $fileIJK
					echo "sample size: ${sampleSize[k]}" >> $fileIJK
					echo "RMSD threshold to consider solutions different (in Ångströms): $differenceThreshold" >> $fileIJK
				fi
			done
		done
	done
done
