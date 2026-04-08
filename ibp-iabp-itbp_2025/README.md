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

| PDB id | N<sub>aa</sub> | \|V\| | \|E<sub>0</sub>\| | \|E<sub>I</sub>\| | \|E<sub>H</sub>\| 
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

The following table presents the consolidated benchmark results for **iBP**, **iABP**, and **iTBP**. It includes the last embedded vertex (**l.e.v.**), CPU time, and the counters $e_a$, $s_a$, and $c_a$, which denote the number of embedded vertices, the number of solutions found, and the number of considered solutions, respectively. The structural quality measures are reported as $\overline{\mathrm{MDE}}$, $\overline{\mathrm{LDE}}$, and $\underline{\mathrm{RMSD}}$.

## $\varepsilon_{\mathrm{short}} = 0.1 \ \mathrm{\AA}$, $\varepsilon_{\mathrm{long}} = 0.5 \ \mathrm{\AA}$

For this case, $|T_i^\pm| = 9$ was used for \textit{i}BP, whereas $|T_i^\pm| = 5$ was used for both \textit{i}ABP and \textit{i}TBP.

<table>
  <thead>
    <tr>
      <th rowspan="2">pdb_id</th>
      <th colspan="3">l.e.v.</th>
      <th colspan="3">CPU time</th>
      <th colspan="3">$e_a$</th>
      <th colspan="3">$s_a$</th>
      <th colspan="3">$c_a$</th>
      <th colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1KUW</td>
      <td>52</td>
      <td>52</td>
      <td>52</td>
      <td>563.73</td>
      <td>4,049.70</td>
      <td>0.06</td>
      <td>766,075,317</td>
      <td>571,495,331</td>
      <td>12,271</td>
      <td>32,145,764</td>
      <td>185,680,481</td>
      <td>1,807</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000019</td>
      <td>0.000048</td>
      <td>0.000008</td>
      <td>0.0072</td>
      <td>0.0482</td>
      <td>0.0076</td>
      <td>0.05</td>
      <td>0.04</td>
      <td>0.06</td>
    </tr>
    <tr>
      <td>1O53</td>
      <td>77</td>
      <td>77</td>
      <td>77</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>454.60</td>
      <td>16,688,035,199</td>
      <td>2,503,318,882</td>
      <td>39,686,734</td>
      <td>1,264,360,014</td>
      <td>887,619,974</td>
      <td>9,731,826</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000018</td>
      <td>0.000020</td>
      <td>0.000018</td>
      <td>0.0124</td>
      <td>0.0202</td>
      <td>0.0237</td>
      <td>0.09</td>
      <td>0.12</td>
      <td>0.06</td>
    </tr>
    <tr>
      <td>1HO7</td>
      <td>102</td>
      <td>102</td>
      <td>102</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>23,204.50</td>
      <td>4,565,797,167</td>
      <td>2,267,418,854</td>
      <td>1,484,314,405</td>
      <td>887,387,441</td>
      <td>768,433,497</td>
      <td>459,764,028</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000008</td>
      <td>0.000016</td>
      <td>0.000016</td>
      <td>0.0069</td>
      <td>0.0279</td>
      <td>0.0279</td>
      <td>0.12</td>
      <td>0.10</td>
      <td>0.08</td>
    </tr>
    <tr>
      <td>1A11</td>
      <td>127</td>
      <td>127</td>
      <td>127</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>3,420,781,632</td>
      <td>1,828,755,919</td>
      <td>2,246,870,049</td>
      <td>652,102,452</td>
      <td>512,170,012</td>
      <td>571,971,176</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000005</td>
      <td>0.000012</td>
      <td>0.000013</td>
      <td>0.0064</td>
      <td>0.0255</td>
      <td>0.0248</td>
      <td>0.24</td>
      <td>0.30</td>
      <td>0.11</td>
    </tr>
    <tr>
      <td>1D0R</td>
      <td>152</td>
      <td>152</td>
      <td>152</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>2,054,793,621</td>
      <td>1,216,615,135</td>
      <td>1,557,579,612</td>
      <td>418,463,717</td>
      <td>467,296,010</td>
      <td>380,209,748</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000006</td>
      <td>0.000005</td>
      <td>0.000006</td>
      <td>0.0093</td>
      <td>0.0181</td>
      <td>0.0153</td>
      <td>0.51</td>
      <td>0.50</td>
      <td>0.13</td>
    </tr>
    <tr>
      <td>1SPF</td>
      <td>177</td>
      <td>177</td>
      <td>177</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>37,043,520,478</td>
      <td>1,431,710,361</td>
      <td>2,347,689,855</td>
      <td>279,361,327</td>
      <td>224,502,601</td>
      <td>213,644,137</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000007</td>
      <td>0.000007</td>
      <td>0.000007</td>
      <td>0.0077</td>
      <td>0.0277</td>
      <td>0.0272</td>
      <td>0.68</td>
      <td>0.65</td>
      <td>0.35</td>
    </tr>
    <tr>
      <td>1AML</td>
      <td>202</td>
      <td>202</td>
      <td>202</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>1,703,347,662</td>
      <td>549,755,324</td>
      <td>1,121,490,980</td>
      <td>288,233,592</td>
      <td>209,158,000</td>
      <td>240,212,564</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000003</td>
      <td>0.000004</td>
      <td>0.000005</td>
      <td>0.0075</td>
      <td>0.0245</td>
      <td>0.0233</td>
      <td>2.67</td>
      <td>2.29</td>
      <td>1.18</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 0.5 \ \mathrm{\AA}$, $\varepsilon_{\mathrm{long}} = 1.0 \ \mathrm{\AA}$

For this case, $|T_i^\pm| = 9$ was used for \textit{i}BP, whereas $|T_i^\pm| = 5$ was used for both \textit{i}ABP and \textit{i}TBP.

<table>
  <thead>
    <tr>
      <th rowspan="2">pdb_id</th>
      <th colspan="3">l.e.v.</th>
      <th colspan="3">CPU time</th>
      <th colspan="3">$e_a$</th>
      <th colspan="3">$s_a$</th>
      <th colspan="3">$c_a$</th>
      <th colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1KUW</td>
      <td>52</td>
      <td>52</td>
      <td>52</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>235.63</td>
      <td>11,287,701,365</td>
      <td>5,532,058,712</td>
      <td>36,531,595</td>
      <td>1,374,916,308</td>
      <td>2,081,724,821</td>
      <td>7,146,734</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000016</td>
      <td>0.000060</td>
      <td>0.000033</td>
      <td>0.0082</td>
      <td>0.0379</td>
      <td>0.0302</td>
      <td>0.19</td>
      <td>0.14</td>
      <td>0.14</td>
    </tr>
    <tr>
      <td>1O53</td>
      <td>77</td>
      <td>77</td>
      <td>77</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>4,558,589,488</td>
      <td>3,377,751,794</td>
      <td>2,673,632,804</td>
      <td>910,378,476</td>
      <td>1,470,253,974</td>
      <td>881,767,575</td>
      <td>2</td>
      <td>2</td>
      <td>1</td>
      <td>0.000017</td>
      <td>0.000025</td>
      <td>0.000024</td>
      <td>0.0086</td>
      <td>0.0150</td>
      <td>0.0170</td>
      <td>0.51</td>
      <td>0.54</td>
      <td>0.18</td>
    </tr>
    <tr>
      <td>1HO7</td>
      <td>102</td>
      <td>102</td>
      <td>102</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>3,354,308,363</td>
      <td>3,039,005,505</td>
      <td>3,670,135,213</td>
      <td>736,242,069</td>
      <td>1,020,268,181</td>
      <td>712,126,460</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000010</td>
      <td>0.000013</td>
      <td>0.000016</td>
      <td>0.0082</td>
      <td>0.0320</td>
      <td>0.0313</td>
      <td>0.32</td>
      <td>0.50</td>
      <td>0.59</td>
    </tr>
    <tr>
      <td>1A11</td>
      <td>127</td>
      <td>127</td>
      <td>127</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>3,193,318,271</td>
      <td>1,951,480,783</td>
      <td>2,197,629,608</td>
      <td>620,122,173</td>
      <td>618,397,403</td>
      <td>496,382,244</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000005</td>
      <td>0.000010</td>
      <td>0.000009</td>
      <td>0.0099</td>
      <td>0.0362</td>
      <td>0.0351</td>
      <td>0.81</td>
      <td>1.00</td>
      <td>0.39</td>
    </tr>
    <tr>
      <td>1D0R</td>
      <td>152</td>
      <td>152</td>
      <td>152</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>2,196,334,088</td>
      <td>1,352,780,710</td>
      <td>1,443,349,943</td>
      <td>406,121,146</td>
      <td>451,189,111</td>
      <td>335,359,084</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000003</td>
      <td>0.000012</td>
      <td>0.000008</td>
      <td>0.0093</td>
      <td>0.0415</td>
      <td>0.0358</td>
      <td>1.49</td>
      <td>1.59</td>
      <td>0.52</td>
    </tr>
    <tr>
      <td>1SPF</td>
      <td>177</td>
      <td>177</td>
      <td>177</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>33,476,254,047</td>
      <td>4,387,457,535</td>
      <td>18,748,339,985</td>
      <td>369,569,985</td>
      <td>400,834,864</td>
      <td>267,525,138</td>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>0.000004</td>
      <td>0.000006</td>
      <td>0.000004</td>
      <td>0.0085</td>
      <td>0.0279</td>
      <td>0.0148</td>
      <td>1.83</td>
      <td>2.54</td>
      <td>0.43</td>
    </tr>
    <tr>
      <td>1AML</td>
      <td>202</td>
      <td>202</td>
      <td>202</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>2,387,110,567</td>
      <td>671,736,004</td>
      <td>850,199,837</td>
      <td>340,825,814</td>
      <td>214,924,967</td>
      <td>194,872,383</td>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>0.000002</td>
      <td>0.000006</td>
      <td>0.000005</td>
      <td>0.0079</td>
      <td>0.0354</td>
      <td>0.0389</td>
      <td>5.51</td>
      <td>5.48</td>
      <td>3.39</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 1.0 \ \mathrm{\AA}$, $\varepsilon_{\mathrm{long}} = 2.0 \ \mathrm{\AA}$

For this case, $|T_i^\pm| = 13$ was used for \textit{i}BP, whereas $|T_i^\pm| = 5$ was used for both \textit{i}ABP and \textit{i}TBP.

<table>
  <thead>
    <tr>
      <th rowspan="2">pdb_id</th>
      <th colspan="3">l.e.v.</th>
      <th colspan="3">CPU time</th>
      <th colspan="3">$e_a$</th>
      <th colspan="3">$s_a$</th>
      <th colspan="3">$c_a$</th>
      <th colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1KUW</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
    </tr>
    <tr>
      <td>1O53</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
    </tr>
    <tr>
      <td>1HO7</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
    </tr>
    <tr>
      <td>1A11</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
    </tr>
    <tr>
      <td>1D0R</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
    </tr>
    <tr>
      <td>1SPF</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
    </tr>
    <tr>
      <td>1AML</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
      <td>---</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 1.0 \ \mathrm{\AA}$, $\varepsilon_{\mathrm{long}} = 3.0 \ \mathrm{\AA}$

For this case, $|T_i^\pm| = 11$ was used for \textit{i}BP, whereas $|T_i^\pm| = 5$ was used for both \textit{i}ABP and \textit{i}TBP.

<table>
  <thead>
    <tr>
      <th rowspan="2">pdb_id</th>
      <th colspan="3">l.e.v.</th>
      <th colspan="3">CPU time</th>
      <th colspan="3">$e_a$</th>
      <th colspan="3">$s_a$</th>
      <th colspan="3">$c_a$</th>
      <th colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1KUW</td>
      <td>52</td>
      <td>52</td>
      <td>52</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>484.96</td>
      <td>15,085,901,811</td>
      <td>3,341,754,860</td>
      <td>71,120,093</td>
      <td>1,108,023,599</td>
      <td>1,096,647,427</td>
      <td>14,520,145</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000018</td>
      <td>0.000053</td>
      <td>0.000037</td>
      <td>0.0078</td>
      <td>0.0427</td>
      <td>0.0264</td>
      <td>0.63</td>
      <td>0.28</td>
      <td>0.23</td>
    </tr>
    <tr>
      <td>1O53</td>
      <td>77</td>
      <td>77</td>
      <td>77</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>8,119,634,511</td>
      <td>2,532,741,862</td>
      <td>3,975,367,133</td>
      <td>814,659,314</td>
      <td>798,580,716</td>
      <td>839,172,820</td>
      <td>3</td>
      <td>2</td>
      <td>4</td>
      <td>0.000010</td>
      <td>0.000031</td>
      <td>0.000032</td>
      <td>0.0082</td>
      <td>0.0466</td>
      <td>0.0465</td>
      <td>1.34</td>
      <td>0.90</td>
      <td>0.34</td>
    </tr>
    <tr>
      <td>1HO7</td>
      <td>102</td>
      <td>102</td>
      <td>102</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>4,346,265,963</td>
      <td>2,129,612,830</td>
      <td>5,225,925,858</td>
      <td>602,189,140</td>
      <td>428,722,286</td>
      <td>526,109,862</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000009</td>
      <td>0.000017</td>
      <td>0.000014</td>
      <td>0.0098</td>
      <td>0.0301</td>
      <td>0.0305</td>
      <td>1.79</td>
      <td>1.59</td>
      <td>0.86</td>
    </tr>
    <tr>
      <td>1A11</td>
      <td>127</td>
      <td>127</td>
      <td>127</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>3,094,517,879</td>
      <td>1,360,697,844</td>
      <td>1,625,337,036</td>
      <td>327,408,483</td>
      <td>373,416,646</td>
      <td>298,449,639</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000004</td>
      <td>0.000010</td>
      <td>0.000010</td>
      <td>0.0094</td>
      <td>0.0417</td>
      <td>0.0419</td>
      <td>0.70</td>
      <td>1.22</td>
      <td>0.88</td>
    </tr>
    <tr>
      <td>1D0R</td>
      <td>152</td>
      <td>152</td>
      <td>152</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>2,022,356,818</td>
      <td>1,114,845,386</td>
      <td>1,374,670,093</td>
      <td>250,559,418</td>
      <td>274,460,477</td>
      <td>287,639,348</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000006</td>
      <td>0.000008</td>
      <td>0.000010</td>
      <td>0.0091</td>
      <td>0.0453</td>
      <td>0.0393</td>
      <td>2.10</td>
      <td>1.59</td>
      <td>1.31</td>
    </tr>
    <tr>
      <td>1SPF</td>
      <td>177</td>
      <td>177</td>
      <td>177</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>8,822,008,603</td>
      <td>1,196,023,261</td>
      <td>34,351,253,082</td>
      <td>209,459,297</td>
      <td>217,273,281</td>
      <td>73,737,580</td>
      <td>1</td>
      <td>1</td>
      <td>5</td>
      <td>0.000003</td>
      <td>0.000006</td>
      <td>0.000007</td>
      <td>0.0076</td>
      <td>0.0356</td>
      <td>0.0166</td>
      <td>2.11</td>
      <td>4.57</td>
      <td>0.83</td>
    </tr>
    <tr>
      <td>1AML</td>
      <td>202</td>
      <td>202</td>
      <td>202</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>2,321,290,868</td>
      <td>583,215,193</td>
      <td>1,127,006,040</td>
      <td>197,011,345</td>
      <td>158,191,927</td>
      <td>191,392,611</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000003</td>
      <td>0.000004</td>
      <td>0.000004</td>
      <td>0.0091</td>
      <td>0.0475</td>
      <td>0.0486</td>
      <td>6.95</td>
      <td>5.88</td>
      <td>6.42</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 2.0 \ \mathrm{\AA}$, $\varepsilon_{\mathrm{long}} = 3.0 \ \mathrm{\AA}$

For this case, $|T_i^\pm| = 13$ for \textit{i}BP, $|T_i^\pm| = 9$ for \textit{i}ABP, and $|T_i^\pm| = 7$ for \textit{i}TBP.

<table>
  <thead>
    <tr>
      <th rowspan="2">pdb_id</th>
      <th colspan="3">l.e.v.</th>
      <th colspan="3">CPU time</th>
      <th colspan="3">$e_a$</th>
      <th colspan="3">$s_a$</th>
      <th colspan="3">$c_a$</th>
      <th colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
      <th>ibp</th>
      <th>iabp</th>
      <th>itbp</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1KUW</td>
      <td>52</td>
      <td>52</td>
      <td>52</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>10,354.74</td>
      <td>21,976,804,498</td>
      <td>3,049,768,060</td>
      <td>932,601,795</td>
      <td>1,390,520,705</td>
      <td>1,218,603,305</td>
      <td>236,296,063</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000025</td>
      <td>0.000058</td>
      <td>0.000052</td>
      <td>0.0085</td>
      <td>0.0309</td>
      <td>0.0317</td>
      <td>0.53</td>
      <td>0.69</td>
      <td>0.15</td>
    </tr>
    <tr>
      <td>1O53</td>
      <td>77</td>
      <td>77</td>
      <td>77</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>3,266,310,182</td>
      <td>2,340,760,030</td>
      <td>3,477,336,773</td>
      <td>648,534,780</td>
      <td>979,208,683</td>
      <td>718,079,299</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>0.000008</td>
      <td>0.000028</td>
      <td>0.000017</td>
      <td>0.0078</td>
      <td>0.0267</td>
      <td>0.0233</td>
      <td>1.33</td>
      <td>1.46</td>
      <td>0.64</td>
    </tr>
    <tr>
      <td>1HO7</td>
      <td>102</td>
      <td>102</td>
      <td>102</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>4,786,507,757</td>
      <td>2,914,849,851</td>
      <td>6,600,498,794</td>
      <td>433,687,953</td>
      <td>541,785,666</td>
      <td>615,748,242</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000009</td>
      <td>0.000010</td>
      <td>0.000014</td>
      <td>0.0075</td>
      <td>0.0293</td>
      <td>0.0299</td>
      <td>1.59</td>
      <td>1.84</td>
      <td>1.09</td>
    </tr>
    <tr>
      <td>1A11</td>
      <td>127</td>
      <td>127</td>
      <td>127</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>7,609,960,158</td>
      <td>1,621,674,820</td>
      <td>1,815,959,499</td>
      <td>457,540,636</td>
      <td>402,317,568</td>
      <td>378,511,078</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000005</td>
      <td>0.000008</td>
      <td>0.000011</td>
      <td>0.0083</td>
      <td>0.0423</td>
      <td>0.0399</td>
      <td>0.99</td>
      <td>1.01</td>
      <td>1.46</td>
    </tr>
    <tr>
      <td>1D0R</td>
      <td>152</td>
      <td>152</td>
      <td>152</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>6,912,514,560</td>
      <td>9,548,302,561</td>
      <td>1,218,968,742</td>
      <td>307,951,609</td>
      <td>199,296,211</td>
      <td>285,041,117</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000002</td>
      <td>0.000010</td>
      <td>0.000009</td>
      <td>0.0075</td>
      <td>0.0443</td>
      <td>0.0316</td>
      <td>1.82</td>
      <td>3.03</td>
      <td>2.37</td>
    </tr>
    <tr>
      <td>1SPF</td>
      <td>177</td>
      <td>177</td>
      <td>177</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>22,393,410,654</td>
      <td>1,426,805,788</td>
      <td>5,991,394,909</td>
      <td>250,012,600</td>
      <td>240,388,469</td>
      <td>177,494,721</td>
      <td>1</td>
      <td>1</td>
      <td>2</td>
      <td>0.000004</td>
      <td>0.000006</td>
      <td>0.000007</td>
      <td>0.0076</td>
      <td>0.0315</td>
      <td>0.0258</td>
      <td>3.42</td>
      <td>2.09</td>
      <td>2.20</td>
    </tr>
    <tr>
      <td>1AML</td>
      <td>202</td>
      <td>202</td>
      <td>202</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>43,200.00</td>
      <td>3,378,241,992</td>
      <td>768,364,829</td>
      <td>994,693,633</td>
      <td>190,970,663</td>
      <td>191,352,677</td>
      <td>167,670,199</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0.000001</td>
      <td>0.000005</td>
      <td>0.000005</td>
      <td>0.0078</td>
      <td>0.0461</td>
      <td>0.0672</td>
      <td>6.76</td>
      <td>7.71</td>
      <td>7.07</td>
    </tr>
  </tbody>
</table>

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
