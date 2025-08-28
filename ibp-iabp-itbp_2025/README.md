# Benchmarks: iBP, iABP, and iTBP (2025)

This folder contains the benchmark datasets and results associated with the article:

> **"A Novel Branch-and-Prune Algorithmic Framework for the 3D Interval Discretizable Distance Geometry Problem: An Approach Based on Torsion Angles of Molecular Structures"**  
> W. A. A. da Rocha, C. Lavor, L. Liberti, L. de Melo Costa, L. D. Secchin, T. E. Malliavin  
> [arXiv:2508.09143](https://arxiv.org/abs/2508.09143), 2025.

---

## 📂 Contents

- **Input files** used for the iBP, iABP, and iTBP experiments.  
- **Result files** including solution sets and metrics.  
- **Scripts** to validate benchmark runs.  

---

## ▶️ Usage

To run the benchmarks, execute the program with:

```bash
./build/bin/main <input_file> <output_folder>
```

Example:

```bash
./build/bin/main dataset/1TOS_input_file.txt results/
```
Additional details on compilation and input file preparation are documented in the main repository:   
[BP_Algorithms_for_iDDGP](https://github.com/wdarocha/BP_Algorithms_for_iDDGP)

---

## 📊 Results

The following tables present the benchmark results for **iBP**, **iABP**, and **iTBP** under different sampling sizes. They include key performance indicators such as the last embedded vertex (**l.e.v.**), CPU time, number of embedded vertices (**n.o.e.v.**), number of solutions found (**n.o.s.f.**), number of considered solutions (**n.o.c.s.**), and structural quality measures:

- **MDE (Mean Distance Error)**: average violation of distance bounds
  \[\text{MDE}(G,X) = \frac{1}{|E|} \sum_{\{v_i,v_j\} \in E} \max\{0,\ \underline{d}_{i,j} - \|x_i-x_j\|,\ \|x_i-x_j\| - \overline{d}_{i,j}\}\]
- **LDE (Largest Distance Error)**: maximum violation of distance bounds
  \[\text{LDE}(G,X) = \max_{\{v_i,v_j\} \in E} \max\{0,\ \underline{d}_{i,j} - \|x_i-x_j\|,\ \|x_i-x_j\| - \overline{d}_{i,j}\}\]
- **RMSD (Root-Mean-Square Deviation)**: structural deviation of an embedding \(X\) from a reference structure \(X^*\)
  \[\text{RMSD}(X,X^*) = \frac{1}{\sqrt{n}} \min_{Q \in O(3)} \|X^* - XQ\|_F, \|\cdot\|_F \text{ is the Frobenius norm, } O(3) \text{ the orthogonal group}\]

The protein dataset used in these experiments is summarized in the following table. The PDB structures were selected according to the number of amino acid residues (\(N_{\text{aa}}\)) they contain. The set \(E_0\) corresponds to edges associated with exact distance constraints, while \(E_I\) corresponds to edges associated with interval distance constraints. The subset \(E_H \subset E_I \subset E\) denotes the edges in \(G\) whose weights correspond to interval distances between hydrogen atoms, with both bounds defined, in contrast to van der Waals distances, which only admit a lower bound.  

| PDB id | N<sub>aa</sub> | \|V\| | \|E₀\| | \|Eᵢ\| | \|E<sub>H</sub>\| 
|--------|---------|------|-------|--------|-----------|
| 1tos | 10 | 52 | 141 | 1,185 | 56 |
| 1uao | 10 | 52 | 141 | 1,185 | 70 |
| 1kuw | 10 | 52 | 141 | 1,185 | 76 |
| 1id6 | 15 | 77 | 211 | 2,715 | 106 |
| 1dng | 15 | 77 | 211 | 2,715 | 114 |
| 1o53 | 15 | 77 | 211 | 2,715 | 116 | 
| 1du1 | 20 | 102 | 281 | 4,870 | 128 | 
| 1dpk | 20 | 102 | 281 | 4,870 | 138 | 
| 1ho7 | 20 | 102 | 281 | 4,870 | 166 | 
| 1ckz | 25 | 127 | 351 | 7,650 | 148 |
| 1lfc | 25 | 127 | 351 | 7,650 | 163 |
| 1a11 | 25 | 127 | 351 | 7,650 | 207 |
| 1ho0 | 30 | 152 | 421 | 11,055 | 167 |
| 1mmc | 30 | 152 | 421 | 11,055 | 223 |
| 1d0r | 30 | 152 | 421 | 11,055 | 229 |
| 1zwd | 35 | 177 | 491 | 15,085 | 240 |
| 1d1h | 35 | 177 | 491 | 15,085 | 245 |
| 1spf | 35 | 177 | 491 | 15,085 | 277 |
| 1aml | 40 | 202 | 561 | 19,740 | 267 |
| 1ba4 | 40 | 202 | 561 | 19,740 | 301 |
| 1c56 | 40 | 202 | 561 | 19,740 | 303 |
  
All algorithms were implemented in C and compiled with **GCC 13.3.0** using the `-O3` optimization flag. The experiments were carried out on a system equipped with an **Intel Xeon Silver 4114 CPU** (10 cores, 20 threads, max frequency 3.0 GHz) and **156 GB of RAM**, running **Ubuntu 24.04.3 LTS**.  

Each instance was executed in **single-thread mode**, with up to seven instances running in parallel. The **CPU time limit** for each run was set to **12 hours**.  
  
<!-- RESULTS START -->
## Sample Size = 5

### iabp

| PDB id | l.e.v. | CPU time (s) | n.o.e.v. | n.o.f.s. | n.o.c.s. | maxMDE | maxLDE | minRMSD |
|:-------|-------:|-------------:|---------:|---------:|---------:|-------:|-------:|--------:|
| 1TOS | 52 | 10.0000 | 1390438 | 251674 | 1 | 0.000013 | 0.006050 | 2.577 |
| 1UAO | 52 | 10.0000 | 5820103 | 18076 | 1 | 0.000010 | 0.005200 | 2.393 |
| 1KUW | 52 | 10.0000 | 470908 | 173293 | 1 | 0.000009 | 0.004949 | 1.468 |
| 1ID6 | 77 | 10.0000 | 1702034 | 143761 | 1 | 0.000005 | 0.005315 | 1.891 |
| 1DNG | 77 | 10.0000 | 504714 | 107224 | 1 | 0.000004 | 0.005913 | 0.683 |
| 1O53 | 77 | 10.0000 | 673815 | 238694 | 1 | 0.000002 | 0.003062 | 1.567 |
| 1DU1 | 102 | 10.0000 | 247122 | 78141 | 1 | 0.000003 | 0.005018 | 2.465 |
| 1DPK | 102 | 10.0000 | 142167 | 56770 | 2 | 0.000003 | 0.006305 | 2.448 |
| 1HO7 | 102 | 10.0001 | 315531 | 88380 | 1 | 0.000003 | 0.005164 | 1.844 |
| 1CKZ | 127 | 10.0002 | 191719 | 42789 | 1 | 0.000001 | 0.004991 | 5.502 |
| 1LFC | 117 | 10.0000 | 3508986 | 0 | 0 | --- | --- | --- |
| 1A11 | 127 | 10.0001 | 182418 | 59312 | 1 | 0.000002 | 0.008574 | 0.770 |
| 1HO0 | 152 | 10.0000 | 171118 | 48130 | 1 | 0.000002 | 0.004913 | 7.713 |
| 1MMC | 95 | 10.0000 | 3655062 | 0 | 0 | --- | --- | --- |
| 1D0R | 152 | 10.0001 | 267958 | 42649 | 1 | 0.000001 | 0.004746 | 2.360 |
| 1ZWD | 177 | 10.0002 | 147694 | 23690 | 1 | 0.000002 | 0.007115 | 5.177 |
| 1D1H | 70 | 10.0000 | 3917558 | 0 | 0 | --- | --- | --- |
| 1SPF | 177 | 10.0001 | 126544 | 24298 | 1 | 0.000001 | 0.007359 | 2.092 |
| 1AML | 183 | 10.0000 | 4709558 | 0 | 0 | --- | --- | --- |
| 1BA4 | 100 | 10.0000 | 3113725 | 0 | 0 | --- | --- | --- |
| 1C56 | 155 | 10.0000 | 3894424 | 0 | 0 | --- | --- | --- |

### itbp

| PDB id | l.e.v. | CPU time (s) | n.o.e.v. | n.o.f.s. | n.o.c.s. | maxMDE | maxLDE | minRMSD |
|:-------|-------:|-------------:|---------:|---------:|---------:|-------:|-------:|--------:|
| 1TOS | 52 | 10.0001 | 1263072 | 180182 | 2 | 0.000033 | 0.035418 | 0.935 |
| 1UAO | 52 | 9.5506 | 2951152 | 38952 | 1 | 0.000011 | 0.009771 | 0.278 |
| 1KUW | 52 | 10.0000 | 903899 | 178894 | 1 | 0.000010 | 0.008203 | 0.151 |
| 1ID6 | 77 | 10.0000 | 1002795 | 71968 | 1 | 0.000008 | 0.010323 | 0.353 |
| 1DNG | 77 | 10.0001 | 800982 | 68406 | 1 | 0.000003 | 0.005976 | 0.275 |
| 1O53 | 77 | 10.0000 | 419222 | 81802 | 1 | 0.000005 | 0.006564 | 0.921 |
| 1DU1 | 102 | 10.0001 | 456827 | 69950 | 2 | 0.000001 | 0.002992 | 1.778 |
| 1DPK | 102 | 10.0000 | 374291 | 87809 | 2 | 0.000003 | 0.004607 | 2.037 |
| 1HO7 | 102 | 10.0002 | 391669 | 52934 | 1 | 0.000004 | 0.015958 | 1.077 |
| 1CKZ | 127 | 10.0000 | 232393 | 40245 | 1 | 0.000001 | 0.004738 | 5.601 |
| 1LFC | 117 | 10.0000 | 4133791 | 0 | 0 | --- | --- | --- |
| 1A11 | 127 | 10.0000 | 298516 | 63617 | 1 | 0.000002 | 0.005890 | 0.812 |
| 1HO0 | 152 | 10.0001 | 304641 | 33790 | 2 | 0.000001 | 0.005157 | 6.524 |
| 1MMC | 98 | 10.0000 | 3309601 | 0 | 0 | --- | --- | --- |
| 1D0R | 152 | 10.0001 | 237982 | 30772 | 1 | 0.000001 | 0.004278 | 1.741 |
| 1ZWD | 169 | 10.0000 | 2510979 | 0 | 0 | --- | --- | --- |
| 1D1H | 130 | 10.0000 | 4559497 | 0 | 0 | --- | --- | --- |
| 1SPF | 177 | 10.0003 | 1411349 | 13987 | 1 | 0.000002 | 0.007958 | 2.330 |
| 1AML | 202 | 10.0001 | 192669 | 32426 | 1 | 0.000001 | 0.006424 | 4.927 |
| 1BA4 | 202 | 10.0001 | 1344972 | 23332 | 1 | 0.000001 | 0.005658 | 3.049 |
| 1C56 | 41 | 10.0000 | 4766467 | 0 | 0 | --- | --- | --- |


## Sample Size = 13

### ibp

| PDB id | l.e.v. | CPU time (s) | n.o.e.v. | n.o.f.s. | n.o.c.s. | maxMDE | maxLDE | minRMSD |
|:-------|-------:|-------------:|---------:|---------:|---------:|-------:|-------:|--------:|
| 1TOS | 52 | 10.0000 | 3329617 | 99772 | 1 | 0.000003 | 0.002000 | 2.937 |
| 1UAO | 45 | 10.0000 | 15409294 | 0 | 0 | --- | --- | --- |
| 1KUW | 52 | 10.0001 | 1315535 | 145812 | 1 | 0.000001 | 0.001072 | 1.344 |
| 1ID6 | 70 | 10.0000 | 12268026 | 0 | 0 | --- | --- | --- |
| 1DNG | 77 | 10.0000 | 1479722 | 144833 | 1 | 0.000001 | 0.000798 | 0.793 |
| 1O53 | 77 | 10.0001 | 617488 | 118137 | 1 | 0.000001 | 0.001941 | 2.121 |
| 1DU1 | 102 | 10.0002 | 394909 | 58744 | 1 | 0.000000 | 0.000689 | 2.771 |
| 1DPK | 102 | 10.0001 | 365817 | 57982 | 1 | 0.000000 | 0.000067 | 3.484 |
| 1HO7 | 102 | 10.0000 | 429220 | 83118 | 1 | 0.000001 | 0.001523 | 1.071 |
| 1CKZ | 127 | 10.0001 | 1433947 | 45672 | 1 | 0.000000 | 0.001764 | 10.830 |
| 1LFC | 83 | 10.0000 | 19904569 | 0 | 0 | --- | --- | --- |
| 1A11 | 127 | 10.0002 | 403100 | 41892 | 1 | 0.000000 | 0.001660 | 1.531 |
| 1HO0 | 152 | 10.0001 | 267196 | 33793 | 1 | 0.000001 | 0.001297 | 10.034 |
| 1MMC | 95 | 10.0000 | 15406291 | 0 | 0 | --- | --- | --- |
| 1D0R | 152 | 10.0000 | 1255356 | 29568 | 1 | 0.000000 | 0.001593 | 2.535 |
| 1ZWD | 177 | 10.0003 | 556062 | 27760 | 1 | 0.000000 | 0.000760 | 5.679 |
| 1D1H | 70 | 10.0000 | 22834342 | 0 | 0 | --- | --- | --- |
| 1SPF | 177 | 10.0002 | 1045639 | 23940 | 1 | 0.000000 | 0.002040 | 4.017 |
| 1AML | 183 | 10.0000 | 17308908 | 0 | 0 | --- | --- | --- |
| 1BA4 | 100 | 10.0000 | 13519395 | 0 | 0 | --- | --- | --- |
| 1C56 | 155 | 10.0000 | 24875286 | 0 | 0 | --- | --- | --- |


<!-- RESULTS END -->

---

## 📖 Citation

If you use these benchmarks, please cite the article:

```
@article{daRocha2025BP,
	title={A Novel Branch-and-Prune Algorithmic Framework for the 3D Interval Discretizable Distance Geometry Problem: An Approach Based on Torsion Angles of Molecular Structures},
	author={da Rocha, Wagner A. A. and Lavor, Carlile and Liberti, Leo and de Melo Costa, Leticia and Secchin, Leonardo D. and Malliavin, Thérèse E.},
	journal={arXiv preprint arXiv:2508.09143},
	year={2025}
}
```

---

## 📜 License

These benchmarks are released under the same license as the repository (**MIT License**).  
Please acknowledge the authors and the corresponding article when using the data.
