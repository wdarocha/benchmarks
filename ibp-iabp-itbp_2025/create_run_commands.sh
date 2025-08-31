#!/bin/bash

pdbIDs=($(cat pdb_ids.txt))
chain='A'
orders=('ddgpHCorder9')
methods=('ibp' 'iabp' 'itbp')
sampleSize=('5' '13')

mainPath='/home/wdarocha/BP_Algorithms_for_iDDGP/build/bin'
mkdir -p "results"

> command.txt

for ((k = 0; k < ${#sampleSize[@]}; k++)); do
	
	inputFolder="input/sample_size=${sampleSize[k]}"
	outputFolder0="results/sample_size=${sampleSize[k]}"
	
	mkdir -p "$outputFolder0"
	
	for ((j = 0; j < ${#methods[@]}; j++)); do
		method=${methods[j]}
		
		if { [[ "$method" == "ibp" && "${sampleSize[k]}" == "13" ]] || \
		     [[ "${sampleSize[k]}" == "5" && ( "$method" == "iabp" || "$method" == "itbp" ) ]]; }; then

			mkdir -p "$outputFolder0/$method"
			for ((i = 0; i < ${#pdbIDs[@]}; i++)); do
				pdbID=${pdbIDs[i]}
				
				mkdir -p "$outputFolder0/$method/$pdbID"
				for ((l = 0; l < ${#orders[@]}; l++)); do
					outputFolder="$outputFolder0/$method/$pdbID/${orders[l]}"
					mkdir -p $outputFolder

					inputFile="$inputFolder/$method/$pdbID/${pdbID}_${chain}_${orders[l]}_inputfile.txt"
					
					echo "${mainPath}/./main ${inputFile} ${outputFolder} > ${outputFolder}/out.txt" >> command.txt
				done
			done
		fi
	done
done
