# Benchmarks: iBP, iABP, and iTBP (2025)

This folder contains the benchmark datasets and results associated with the article:

> **"An Angle-Based Algorithmic Framework for the Interval Discretizable Distance Geometry Problem"**  
> W. da Rocha, C. Lavor, L. Liberti, L. de Melo Costa, L. D. Secchin, T. E. Malliavin  
> [arXiv:2508.09143](https://arxiv.org/abs/2508.09143), 2025.

---

## 📂 Contents

- **Input files** used for the interval Branch-and-Prune (iBP), the interval Angular Branch-and-Prune (iABP), and interval Torsion-angle Branch-and-Prune (iTBP) experiments.  
- **Result files** including solution sets and metrics.  
- **Scripts** to validate benchmark runs.  

---

## ▶️ Usage

Run the benchmarks by executing the `main` binary over your input files.
The algorithms (iBP, iABP, iTBP) are implemented in
[BP_Algorithms_for_iDDGP](https://github.com/wdarocha/BP_Algorithms_for_iDDGP).

### Command

```bash
./build/bin/main <input_file> <output_folder>
```

**Arguments**

* `<input_file>`: path to a single formatted input file (see the main repo for the spec).
* `<output_folder>`: directory where results and logs will be written (created if missing).

### Single-file example

```bash
./build/bin/main dataset/1TOS_input_file.txt results/
```

### Batch over a folder (bash loop)

Process every `*_input_file.txt` in `dataset/`:

```bash
for f in dataset/*_input_file.txt; do
	./build/bin/main "$f" results/
done
```

### Build & input preparation

Compilation instructions and the exact input-file format are documented in the main repository:
[BP_Algorithms_for_iDDGP](https://github.com/wdarocha/BP_Algorithms_for_iDDGP)

---

## 📊 Results

The protein dataset used in these experiments is summarized in the following table. The PDB structures were selected according to the number of amino acid residues ($$N_{\text{aa}}$$) they contain. The set $$E_0$$ corresponds to edges associated with exact distance constraints, while $$E_I$$ corresponds to edges associated with interval distance constraints. The subset $$E_H \subset E_I \subset E$$ denotes the edges in $$G$$ whose weights correspond to interval distances between hydrogen atoms, with both bounds defined.  

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

The following tables present the benchmark results for **iBP**, **iABP**, and **iTBP** under different sampling sizes. They include key performance indicators such as the last embedded vertex (**l.e.v.**), CPU time, number of embedded vertices (**n.o.e.v.**), number of solutions found (**n.o.s.f.**), number of considered solutions (**n.o.c.s.**), and structural quality measures:

- **MDE (Mean Distance Error)** — average violation of distance bounds

- **LDE (Largest Distance Error)** — maximum violation of distance bounds

- **RMSD (Root-Mean-Square Deviation)** -- deviation of the computed embedding from reference structure
  
<!-- RESULTS START -->
## Sample Size = 5

### iabp

| PDB id | l.e.v. | CPU time (s) | n.o.e.v. | n.o.s.f. | n.o.c.s. | maxMDE | maxLDE | minRMSD |
|:-------|-------:|-------------:|---------:|---------:|---------:|-------:|-------:|--------:|
| 1TOS | 52 | 43200.0000 | 3250662483 | 605283935 | 4 | 0.000045900 | 0.044073 | 1.2615 |
| 1UAO | 52 | 43200.0000 | 6379548703 | 582638955 | 1 | 0.000056880 | 0.067364 | 0.3707 |
| 1KUW | 52 | 43200.0000 | 1706611412 | 641706880 | 1 | 0.000050910 | 0.032283 | 0.2149 |
| 1ID6 | 77 | 43200.0000 | 1743492955 | 406111441 | 1 | 0.000029140 | 0.036820 | 0.2052 |
| 1DNG | 77 | 43200.0000 | 1767425047 | 409940156 | 1 | 0.000022880 | 0.029233 | 0.5691 |
| 1O53 | 77 | 43200.0001 | 1145431215 | 411076978 | 3 | 0.000018040 | 0.013266 | 0.8547 |
| 1DU1 | 102 | 43200.0000 | 772212193 | 239545371 | 3 | 0.000011360 | 0.030564 | 2.4265 |
| 1DPK | 102 | 43200.0000 | 616932764 | 273054805 | 3 | 0.000013150 | 0.027460 | 1.3084 |
| 1HO7 | 102 | 43200.0001 | 985795382 | 282072392 | 1 | 0.000018540 | 0.039487 | 1.6759 |
| 1CKZ | 127 | 43200.0000 | 912647449 | 202861763 | 2 | 0.000003880 | 0.024463 | 5.1463 |
| 1LFC | 115 | 43200.0000 | 33851690349 | 0 | 0 | --- | --- | --- |
| 1A11 | 127 | 43200.0000 | 597638049 | 205329380 | 1 | 0.000011240 | 0.044683 | 0.6546 |
| 1HO0 | 152 | 43200.0003 | 445801766 | 131895845 | 4 | 0.000008890 | 0.041024 | 7.6810 |
| 1MMC | 96 | 43200.0000 | 26649961451 | 0 | 0 | --- | --- | --- |
| 1D0R | 152 | 43200.0002 | 934081692 | 151471849 | 1 | 0.000004720 | 0.021041 | 1.8979 |
| 1ZWD | 177 | 43200.0000 | 371193808 | 118981380 | 3 | 0.000006050 | 0.016300 | 4.5883 |
| 1D1H | 77 | 43200.0000 | 41142943323 | 0 | 0 | --- | --- | --- |
| 1SPF | 177 | 43200.0000 | 464879202 | 119284429 | 1 | 0.000005300 | 0.031412 | 3.6060 |
| 1AML | 202 | 43200.0004 | 353925733 | 95786205 | 1 | 0.000004590 | 0.032913 | 8.1134 |
| 1BA4 | 100 | 43200.0000 | 28097224135 | 0 | 0 | --- | --- | --- |
| 1C56 | 170 | 43200.0000 | 18448970776 | 0 | 0 | --- | --- | --- |

### itbp

| PDB id | l.e.v. | CPU time (s) | n.o.e.v. | n.o.s.f. | n.o.c.s. | maxMDE | maxLDE | minRMSD |
|:-------|-------:|-------------:|---------:|---------:|---------:|-------:|-------:|--------:|
| 1TOS | 52 | 9336.7889 | 729132463 | 134308160 | 4 | 0.000050650 | 0.042222 | 0.2385 |
| 1UAO | 52 | 5.6407 | 3084404 | 44768 | 1 | 0.000025690 | 0.025277 | 0.2780 |
| 1KUW | 52 | 898.7040 | 72213813 | 12988244 | 1 | 0.000038890 | 0.029854 | 0.1237 |
| 1ID6 | 77 | 10045.8951 | 1049792470 | 85038588 | 1 | 0.000026350 | 0.029185 | 0.2362 |
| 1DNG | 77 | 26872.7282 | 2300533136 | 205287857 | 1 | 0.000022250 | 0.030875 | 0.2157 |
| 1O53 | 77 | 43200.0001 | 2035873030 | 407199112 | 3 | 0.000020280 | 0.015122 | 0.5000 |
| 1DU1 | 102 | 43200.0000 | 1589995310 | 248421549 | 6 | 0.000010220 | 0.012106 | 1.4490 |
| 1DPK | 102 | 43200.0000 | 1060827068 | 259620387 | 2 | 0.000013310 | 0.017144 | 1.2810 |
| 1HO7 | 102 | 43200.0000 | 2018833858 | 276212022 | 1 | 0.000013870 | 0.030269 | 0.6964 |
| 1CKZ | 127 | 43200.0001 | 957195539 | 165515407 | 6 | 0.000003630 | 0.009445 | 4.8154 |
| 1LFC | 127 | 43200.0000 | 29042316138 | 13781906 | 2 | 0.000009140 | 0.032239 | 0.4743 |
| 1A11 | 127 | 43200.0002 | 836876834 | 206156445 | 1 | 0.000009910 | 0.042123 | 0.7507 |
| 1HO0 | 152 | 43200.0001 | 1111238596 | 127051709 | 6 | 0.000007740 | 0.041890 | 5.7087 |
| 1MMC | 100 | 43200.0000 | 32978716837 | 0 | 0 | --- | --- | --- |
| 1D0R | 152 | 43200.0002 | 1122951208 | 149105854 | 2 | 0.000005340 | 0.019220 | 1.2626 |
| 1ZWD | 169 | 43200.0000 | 20346753589 | 0 | 0 | --- | --- | --- |
| 1D1H | 177 | 43200.0000 | 14030604115 | 52292702 | 2 | 0.000003380 | 0.033836 | 0.4130 |
| 1SPF | 177 | 43200.0005 | 2073026535 | 96344818 | 4 | 0.000005630 | 0.016951 | 0.8844 |
| 1AML | 202 | 43200.0000 | 547022995 | 95600919 | 2 | 0.000005090 | 0.043341 | 4.3169 |
| 1BA4 | 202 | 43200.0001 | 526124947 | 96263272 | 1 | 0.000004760 | 0.023449 | 2.7100 |
| 1C56 | 177 | 43200.0000 | 17632019427 | 0 | 0 | --- | --- | --- |


## Sample Size = 13

### ibp

| PDB id | l.e.v. | CPU time (s) | n.o.e.v. | n.o.s.f. | n.o.c.s. | maxMDE | maxLDE | minRMSD |
|:-------|-------:|-------------:|---------:|---------:|---------:|-------:|-------:|--------:|
| 1TOS | 52 | 43200.0000 | 10702024605 | 613843230 | 3 | 0.000004150 | 0.002084 | 1.4043 |
| 1UAO | 52 | 43200.0000 | 36880683260 | 613267527 | 1 | 0.000004570 | 0.002791 | 0.3161 |
| 1KUW | 52 | 43200.0000 | 5372054215 | 658841233 | 1 | 0.000002630 | 0.001630 | 0.4205 |
| 1ID6 | 77 | 43200.0000 | 4469983781 | 415293778 | 1 | 0.000001830 | 0.003189 | 0.4332 |
| 1DNG | 77 | 43200.0000 | 4257027383 | 416031720 | 1 | 0.000001360 | 0.001714 | 0.5192 |
| 1O53 | 77 | 43200.0000 | 1940113420 | 423267599 | 2 | 0.000001590 | 0.001941 | 1.2092 |
| 1DU1 | 102 | 43200.0000 | 1632542089 | 259215157 | 2 | 0.000000490 | 0.002078 | 2.4128 |
| 1DPK | 102 | 43200.0001 | 1351093736 | 259967166 | 2 | 0.000000380 | 0.001829 | 1.5837 |
| 1HO7 | 102 | 43200.0001 | 1431309269 | 289870942 | 1 | 0.000001460 | 0.001721 | 0.9857 |
| 1CKZ | 127 | 43200.0001 | 2836386028 | 208389045 | 1 | 0.000000770 | 0.002084 | 10.2582 |
| 1LFC | 102 | 43200.0000 | 280419154120 | 0 | 0 | --- | --- | --- |
| 1A11 | 127 | 43200.0002 | 1139770399 | 211512018 | 1 | 0.000000550 | 0.001718 | 1.4309 |
| 1HO0 | 152 | 43200.0002 | 1131559513 | 152352973 | 2 | 0.000000610 | 0.001831 | 9.4642 |
| 1MMC | 95 | 43200.0000 | 332036048480 | 0 | 0 | --- | --- | --- |
| 1D0R | 152 | 43200.0001 | 2641017575 | 150460591 | 1 | 0.000000570 | 0.001668 | 2.2897 |
| 1ZWD | 177 | 43200.0003 | 972832409 | 120955820 | 1 | 0.000000360 | 0.002084 | 5.1629 |
| 1D1H | 72 | 43200.0000 | 451975612637 | 0 | 0 | --- | --- | --- |
| 1SPF | 177 | 43200.0002 | 4608646612 | 118527676 | 1 | 0.000000650 | 0.002076 | 3.8414 |
| 1AML | 202 | 43200.0003 | 2795076837 | 103393319 | 1 | 0.000000210 | 0.002083 | 8.8343 |
| 1BA4 | 100 | 43200.0000 | 429175568962 | 0 | 0 | --- | --- | --- |
| 1C56 | 155 | 43200.0000 | 388025235189 | 0 | 0 | --- | --- | --- |


<!-- RESULTS END -->

---

## 📖 Citation

If you use these benchmarks, please cite the article:

```
@article{daRocha2025BP,
	title={An Angle-Based Algorithmic Framework for the Interval Discretizable Distance Geometry Problem},
	author={da Rocha, Wagner and Lavor, Carlile and Liberti, Leo and de Melo Costa, Leticia and Secchin, Leonardo D. and Malliavin, Thérèse E.},
	journal={arXiv preprint arXiv:2508.09143},
	year={2025}
}
```

---

## 📜 License

These benchmarks are released under the same license as the repository (**MIT License**).  
Please acknowledge the authors and the corresponding article when using the data.
