# Benchmarks: *i*BP, *i*ABP, and *i*TBP (2026)

This folder contains the benchmark datasets and results associated with the article:

> **"An Angle-Based Algorithmic Framework for the Interval Discretizable Distance Geometry Problem"**  
> W. da Rocha, C. Lavor, L. Liberti, L. de Melo Costa, L. D. Secchin, T. E. Malliavin  
> [arXiv:2508.09143](https://arxiv.org/abs/2508.09143), 2025.

Initial public release: **ibp-iabp-itbp_2026**.

---

## 📂 Contents

- **Input files** used for the interval Branch-and-Prune (*i*BP), the interval Angular Branch-and-Prune (*i*ABP), and interval Torsion-angle Branch-and-Prune (*i*TBP) experiments.  
- **Result files** including solution sets and metrics.  
- **Scripts** to validate benchmark runs.  

---

## ▶️ Usage

Run the benchmarks by executing the `main` binary over the prepared input files in `input/`.
The algorithms (iBP, iABP, iTBP) are implemented in
[bpbm-3d-iddgp](https://github.com/wdarocha/bpbm-3d-iddgp).

### Command

```bash
./build/bin/main <input_file> <output_folder>
```

**Arguments**

- `<input_file>`: path to one prepared solver input file in `input/`.
- `<output_folder>`: root directory where the solver will write the generated results.

### Repository layout

- `dataset/<interval>/<PDB>/`: raw instance data, including `I_*.dat`, `T_*.dat`, and `X_*.dat`.
- `input/sample_size=<k>/<method>/<interval>/<PDB>/*_inputfile.txt`: solver-ready input files.
- `results/sample_size=<k>/<method>/<interval>/<PDB>/`: generated outputs, typically containing `<PDB>.pdb`, `out.txt`, and `results.txt`.

### Single-file example

```bash
./build/bin/main input/sample_size=5/iabp/1020/1KUW/1KUW_A_1020_inputfile.txt results/
```

### Batch execution

Process every prepared input file in `input/`:

```bash
find input -name '*_inputfile.txt' | sort | while read -r f; do
	./build/bin/main "$f" results/
done
```

Run only one configuration, for example `sample_size=5` with `iabp`:

```bash
find input/sample_size=5/iabp -name '*_inputfile.txt' | sort | while read -r f; do
	./build/bin/main "$f" results/
done
```

### Build & input preparation

Compilation instructions and the exact input-file format are documented in the main code repository:
[bpbm-3d-iddgp](https://github.com/wdarocha/bpbm-3d-iddgp). For a fixed citable version, use release [v1.0.0](https://github.com/wdarocha/bpbm-3d-iddgp/releases/tag/v1.0.0).

---

## 📊 Results

The protein dataset used in these experiments is summarized in the following table. The PDB structures were selected according to the number of amino acid residues ($$N_{\text{aa}}$$) they contain. The set $$E_0$$ corresponds to edges associated with exact distance constraints, while $$E_I$$ corresponds to edges associated with interval distance constraints. The subset $$E_H \subset E_I \subset E$$ denotes the edges in $$G$$ whose weights correspond to interval distances between hydrogen atoms, with both bounds defined.  

<table>
  <thead>
    <tr>
      <th align="center">PDB id</th>
      <th align="center">$N_{\mathrm{aa}}$</th>
      <th align="center">$|V|$</th>
      <th align="center">$|E_0|$</th>
      <th align="center">$|E_I|$</th>
      <th align="center">$|E_H|$</th>
    </tr>
  </thead>
  <tbody>
    <tr><td align="center">1TOS</td><td align="right">10</td><td align="right">52</td><td align="right">141</td><td align="right">1,185</td><td align="right">56</td></tr>
    <tr><td align="center">1UAO</td><td align="right">10</td><td align="right">52</td><td align="right">141</td><td align="right">1,185</td><td align="right">70</td></tr>
    <tr><td align="center">1KUW</td><td align="right">10</td><td align="right">52</td><td align="right">141</td><td align="right">1,185</td><td align="right">76</td></tr>
    <tr><td align="center">1ID6</td><td align="right">15</td><td align="right">77</td><td align="right">211</td><td align="right">2,715</td><td align="right">106</td></tr>
    <tr><td align="center">1DNG</td><td align="right">15</td><td align="right">77</td><td align="right">211</td><td align="right">2,715</td><td align="right">114</td></tr>
    <tr><td align="center">1O53</td><td align="right">15</td><td align="right">77</td><td align="right">211</td><td align="right">2,715</td><td align="right">116</td></tr>
    <tr><td align="center">1DU1</td><td align="right">20</td><td align="right">102</td><td align="right">281</td><td align="right">4,870</td><td align="right">128</td></tr>
    <tr><td align="center">1DPK</td><td align="right">20</td><td align="right">102</td><td align="right">281</td><td align="right">4,870</td><td align="right">138</td></tr>
    <tr><td align="center">1HO7</td><td align="right">20</td><td align="right">102</td><td align="right">281</td><td align="right">4,870</td><td align="right">166</td></tr>
    <tr><td align="center">1CKZ</td><td align="right">25</td><td align="right">127</td><td align="right">351</td><td align="right">7,650</td><td align="right">148</td></tr>
    <tr><td align="center">1LFC</td><td align="right">25</td><td align="right">127</td><td align="right">351</td><td align="right">7,650</td><td align="right">163</td></tr>
    <tr><td align="center">1A11</td><td align="right">25</td><td align="right">127</td><td align="right">351</td><td align="right">7,650</td><td align="right">207</td></tr>
    <tr><td align="center">1HO0</td><td align="right">30</td><td align="right">152</td><td align="right">421</td><td align="right">11,055</td><td align="right">167</td></tr>
    <tr><td align="center">1MMC</td><td align="right">30</td><td align="right">152</td><td align="right">421</td><td align="right">11,055</td><td align="right">223</td></tr>
    <tr><td align="center">1D0R</td><td align="right">30</td><td align="right">152</td><td align="right">421</td><td align="right">11,055</td><td align="right">229</td></tr>
    <tr><td align="center">1ZWD</td><td align="right">35</td><td align="right">177</td><td align="right">491</td><td align="right">15,085</td><td align="right">240</td></tr>
    <tr><td align="center">1D1H</td><td align="right">35</td><td align="right">177</td><td align="right">491</td><td align="right">15,085</td><td align="right">245</td></tr>
    <tr><td align="center">1SPF</td><td align="right">35</td><td align="right">177</td><td align="right">491</td><td align="right">15,085</td><td align="right">277</td></tr>
    <tr><td align="center">1AML</td><td align="right">40</td><td align="right">202</td><td align="right">561</td><td align="right">19,740</td><td align="right">267</td></tr>
    <tr><td align="center">1BA4</td><td align="right">40</td><td align="right">202</td><td align="right">561</td><td align="right">19,740</td><td align="right">301</td></tr>
    <tr><td align="center">1C56</td><td align="right">40</td><td align="right">202</td><td align="right">561</td><td align="right">19,740</td><td align="right">303</td></tr>
  </tbody>
</table>
  
All algorithms were implemented in C and compiled with **GCC 13.3.0** using the `-O3` optimization flag. The experiments were carried out on a system equipped with an **Intel Xeon Silver 4114 CPU** (10 cores, 20 threads, max frequency 3.0 GHz) and **156 GB of RAM**, running **Ubuntu 24.04.3 LTS**.  

Each instance was executed in **single-thread mode**, with up to seven instances running in parallel. The **CPU time limit** for each run was set to **12 hours**.  

These computational results refer to interval distance constraints with different widths, defined only for hydrogen atom pairs. Each interval is modeled as 

$$
\mathcal{D}_{i,j} =
\left[
\max\left(d_{i,j}^* - \frac{\varepsilon_{i,j}}{2},\ \mathrm{vdwr\_hh}\right),
\
\min\left(d_{i,j}^* + \frac{\varepsilon_{i,j}}{2},\ d_{\mathrm{max}}\right)
\right]
$$

centered around the reference distance and clipped by a van der Waals lower bound and by the NMR cutoff of $5 \ \mathrm{Angstroms}$. We distinguish **short-range intervals**, controlled by $\varepsilon_{\mathrm{short}}$, for atom pairs in the same or adjacent residues, and **long-range intervals**, controlled by $\varepsilon_{\mathrm{long}}$, for all other pairs. This separation reflects the fact that local contacts are typically described with smaller uncertainty, while nonlocal contacts require wider intervals.

The five interval settings reported below are **$(0.1, 0.5)$**, **$(0.5, 1.0)$**, **$(1.0, 2.0)$**, **$(1.0, 3.0)$**, and **$(2.0, 3.0)$** in angstroms for $(\varepsilon_{\mathrm{short}}, \varepsilon_{\mathrm{long}})$.

The following tables present the consolidated benchmark results for **iBP**, **iABP**, and **iTBP**. They include the last embedded vertex (**l.e.v.**), CPU time, and the counters $e_a$, $s_a$, and $c_a$, which denote the number of embedded vertices, the number of solutions found, and the number of considered solutions, respectively.

The benchmark tables report the Mean Distance Error (MDE), the Largest Distance Error (LDE), and the Root Mean Square Deviation (RMSD), defined as follows:

$$
\Delta_{v_i,v_j}(G,X) = \max\big(0,\ \underline{d}_{i,j} - \lVert x_i-x_j \rVert,\ \lVert x_i-x_j \rVert - \overline{d}_{i,j}\big),
$$
$$
\mathrm{MDE}(G,X) = \dfrac{1}{|E|} \sum_{(v_i,v_j) \in E} \Delta_{v_i,v_j}(G,X),
$$
$$
\mathrm{LDE}(G,X) = \max_{(v_i,v_j) \in E} \Big(\Delta_{v_i,v_j}(G,X)\Big),
$$
$$
\mathrm{RMSD}(X,X^*) = \frac{1}{\sqrt{|V|}} \min_{Q \in O(3)} \lVert X^\ast - XQ \rVert_F,
$$

here, $\lVert \cdot \rVert_F$ denotes the Frobenius norm and $O(3)$ is the group of $3 \times 3$ orthogonal matrices. The MDE and LDE metrics evaluate how well the solution satisfies the input instance constraints. On the other hand, RMSD measures the structural similarity between the computed conformation and the reference structure $X^*$.

To assess structural diversity and geometric accuracy, we compute the number of considered solutions $c_a$, defined as the number of realizations whose pairwise RMSD (between solutions) is at least $3 \ \mathrm{Angstroms}$. We also report the maximum MDE ($\overline{\mathrm{MDE}}$), maximum LDE ($\overline{\mathrm{LDE}}$), and the minimum RMSD ($\underline{\mathrm{RMSD}}$) with respect to the reference structure from the original PDB file used to generate the instance, computed over all feasible solutions produced by algorithm $a$.

## $\varepsilon_{\mathrm{short}} = 0.1 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 0.5 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 5$ was used for *i*BP, *i*ABP, and *i*TBP.

<table>
  <thead>
    <tr>
      <th align="center" rowspan="2">PDB id</th>
      <th align="center" colspan="3">l.e.v.</th>
      <th align="center" colspan="3">CPU time</th>
      <th align="center" colspan="3">$e_a$</th>
      <th align="center" colspan="3">$s_a$</th>
      <th align="center" colspan="3">$c_a$</th>
      <th align="center" colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th align="center" colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th align="center" colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1KUW</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">1,147.30</td>
      <td align="right">3,004.09</td>
      <td align="right">0.08</td>
      <td align="right">683,673,363</td>
      <td align="right">270,822,283</td>
      <td align="right">11,603</td>
      <td align="right">34,673,364</td>
      <td align="right">84,233,749</td>
      <td align="right">1,692</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00010748</td>
      <td align="right">0.00002658</td>
      <td align="right">0.00000531</td>
      <td align="right">0.0190</td>
      <td align="right">0.0163</td>
      <td align="right">0.0070</td>
      <td align="right">0.0670</td>
      <td align="right">0.0484</td>
      <td align="right">0.0598</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.29</td>
      <td align="right">43,200.02</td>
      <td align="right">522.65</td>
      <td align="right">12,812,311,306</td>
      <td align="right">1,954,478,068</td>
      <td align="right">32,219,885</td>
      <td align="right">742,627,792</td>
      <td align="right">699,413,284</td>
      <td align="right">7,861,914</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00003873</td>
      <td align="right">0.00000692</td>
      <td align="right">0.00001023</td>
      <td align="right">0.0188</td>
      <td align="right">0.0164</td>
      <td align="right">0.0164</td>
      <td align="right">0.2226</td>
      <td align="right">0.1487</td>
      <td align="right">0.0626</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.12</td>
      <td align="right">43,200.85</td>
      <td align="right">33,081.25</td>
      <td align="right">2,357,936,205</td>
      <td align="right">1,337,750,387</td>
      <td align="right">1,096,843,981</td>
      <td align="right">481,913,243</td>
      <td align="right">447,928,320</td>
      <td align="right">339,141,636</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00004979</td>
      <td align="right">0.00001013</td>
      <td align="right">0.00000763</td>
      <td align="right">0.0190</td>
      <td align="right">0.0169</td>
      <td align="right">0.0166</td>
      <td align="right">3.0500</td>
      <td align="right">3.0377</td>
      <td align="right">0.0798</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.28</td>
      <td align="right">43,200.06</td>
      <td align="right">43,200.31</td>
      <td align="right">1,088,827,399</td>
      <td align="right">653,754,833</td>
      <td align="right">1,218,309,407</td>
      <td align="right">329,748,171</td>
      <td align="right">321,158,339</td>
      <td align="right">302,510,017</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00003422</td>
      <td align="right">0.00000545</td>
      <td align="right">0.00000480</td>
      <td align="right">0.0189</td>
      <td align="right">0.0170</td>
      <td align="right">0.0170</td>
      <td align="right">2.8338</td>
      <td align="right">2.8452</td>
      <td align="right">0.1076</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.91</td>
      <td align="right">43,201.05</td>
      <td align="right">43,200.63</td>
      <td align="right">1,876,086,878</td>
      <td align="right">843,983,260</td>
      <td align="right">1,030,543,141</td>
      <td align="right">236,792,622</td>
      <td align="right">225,550,127</td>
      <td align="right">218,274,262</td>
      <td align="right">3</td>
      <td align="right">2</td>
      <td align="right">3</td>
      <td align="right">0.00002306</td>
      <td align="right">0.00000317</td>
      <td align="right">0.00000224</td>
      <td align="right">0.0190</td>
      <td align="right">0.0179</td>
      <td align="right">0.0096</td>
      <td align="right">7.1112</td>
      <td align="right">4.8985</td>
      <td align="right">2.7372</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.75</td>
      <td align="right">43,200.85</td>
      <td align="right">43,200.46</td>
      <td align="right">7,723,181,135</td>
      <td align="right">1,538,281,197</td>
      <td align="right">1,953,976,984</td>
      <td align="right">170,928,547</td>
      <td align="right">143,258,341</td>
      <td align="right">131,174,056</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00002534</td>
      <td align="right">0.00000420</td>
      <td align="right">0.00000217</td>
      <td align="right">0.0190</td>
      <td align="right">0.0162</td>
      <td align="right">0.0132</td>
      <td align="right">2.4954</td>
      <td align="right">3.8914</td>
      <td align="right">0.1604</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,201.16</td>
      <td align="right">43,200.40</td>
      <td align="right">43,200.58</td>
      <td align="right">445,558,785</td>
      <td align="right">277,095,978</td>
      <td align="right">622,418,523</td>
      <td align="right">140,999,360</td>
      <td align="right">138,286,394</td>
      <td align="right">130,819,959</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001009</td>
      <td align="right">0.00000210</td>
      <td align="right">0.00000228</td>
      <td align="right">0.0190</td>
      <td align="right">0.0171</td>
      <td align="right">0.0168</td>
      <td align="right">6.5406</td>
      <td align="right">2.0819</td>
      <td align="right">1.1790</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 0.5 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 1.0 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 7$ was used for *i*BP, whereas $|T_i^\pm| = 5$ was used for both *i*ABP and *i*TBP.

<table>
  <thead>
    <tr>
      <th align="center" rowspan="2">PDB id</th>
      <th align="center" colspan="3">l.e.v.</th>
      <th align="center" colspan="3">CPU time</th>
      <th align="center" colspan="3">$e_a$</th>
      <th align="center" colspan="3">$s_a$</th>
      <th align="center" colspan="3">$c_a$</th>
      <th align="center" colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th align="center" colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th align="center" colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1KUW</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.87</td>
      <td align="right">43,200.96</td>
      <td align="right">251.91</td>
      <td align="right">14,419,991,850</td>
      <td align="right">3,426,740,824</td>
      <td align="right">34,067,949</td>
      <td align="right">1,356,152,666</td>
      <td align="right">1,238,653,508</td>
      <td align="right">6,607,200</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00008307</td>
      <td align="right">0.00002755</td>
      <td align="right">0.00001907</td>
      <td align="right">0.0190</td>
      <td align="right">0.0156</td>
      <td align="right">0.0138</td>
      <td align="right">0.1282</td>
      <td align="right">2.3229</td>
      <td align="right">0.1388</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.69</td>
      <td align="right">43,200.24</td>
      <td align="right">43,200.91</td>
      <td align="right">3,367,923,672</td>
      <td align="right">1,610,681,922</td>
      <td align="right">2,306,828,621</td>
      <td align="right">763,738,765</td>
      <td align="right">733,883,378</td>
      <td align="right">705,054,689</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00003229</td>
      <td align="right">0.00000553</td>
      <td align="right">0.00000990</td>
      <td align="right">0.0189</td>
      <td align="right">0.0075</td>
      <td align="right">0.0170</td>
      <td align="right">0.2553</td>
      <td align="right">0.5020</td>
      <td align="right">0.1771</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.71</td>
      <td align="right">43,200.54</td>
      <td align="right">43,200.60</td>
      <td align="right">2,460,127,297</td>
      <td align="right">1,454,373,458</td>
      <td align="right">2,850,099,772</td>
      <td align="right">483,166,554</td>
      <td align="right">458,733,445</td>
      <td align="right">432,340,922</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00004084</td>
      <td align="right">0.00000692</td>
      <td align="right">0.00000668</td>
      <td align="right">0.0189</td>
      <td align="right">0.0166</td>
      <td align="right">0.0170</td>
      <td align="right">3.0140</td>
      <td align="right">3.0751</td>
      <td align="right">0.5872</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.41</td>
      <td align="right">43,200.67</td>
      <td align="right">43,200.18</td>
      <td align="right">1,402,646,570</td>
      <td align="right">782,211,785</td>
      <td align="right">1,349,029,864</td>
      <td align="right">331,151,775</td>
      <td align="right">315,552,880</td>
      <td align="right">305,463,933</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001399</td>
      <td align="right">0.00000344</td>
      <td align="right">0.00000415</td>
      <td align="right">0.0190</td>
      <td align="right">0.0159</td>
      <td align="right">0.0164</td>
      <td align="right">0.7030</td>
      <td align="right">1.0037</td>
      <td align="right">0.3934</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.64</td>
      <td align="right">43,200.53</td>
      <td align="right">43,200.67</td>
      <td align="right">2,149,634,150</td>
      <td align="right">746,921,905</td>
      <td align="right">1,606,607,688</td>
      <td align="right">235,703,485</td>
      <td align="right">228,345,872</td>
      <td align="right">216,952,653</td>
      <td align="right">3</td>
      <td align="right">2</td>
      <td align="right">6</td>
      <td align="right">0.00001741</td>
      <td align="right">0.00000201</td>
      <td align="right">0.00000250</td>
      <td align="right">0.0190</td>
      <td align="right">0.0155</td>
      <td align="right">0.0218</td>
      <td align="right">5.7869</td>
      <td align="right">9.6508</td>
      <td align="right">4.3840</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.67</td>
      <td align="right">43,200.96</td>
      <td align="right">43,200.89</td>
      <td align="right">9,920,259,895</td>
      <td align="right">2,458,504,447</td>
      <td align="right">12,239,280,907</td>
      <td align="right">170,033,606</td>
      <td align="right">139,025,191</td>
      <td align="right">51,037,701</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.00001651</td>
      <td align="right">0.00000276</td>
      <td align="right">0.00000149</td>
      <td align="right">0.0189</td>
      <td align="right">0.0162</td>
      <td align="right">0.0121</td>
      <td align="right">2.7358</td>
      <td align="right">2.4580</td>
      <td align="right">0.4655</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.03</td>
      <td align="right">43,200.54</td>
      <td align="right">43,200.22</td>
      <td align="right">771,411,968</td>
      <td align="right">321,077,397</td>
      <td align="right">584,750,949</td>
      <td align="right">141,233,251</td>
      <td align="right">137,997,810</td>
      <td align="right">133,946,870</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.00001140</td>
      <td align="right">0.00000140</td>
      <td align="right">0.00000247</td>
      <td align="right">0.0190</td>
      <td align="right">0.0159</td>
      <td align="right">0.0151</td>
      <td align="right">4.2151</td>
      <td align="right">5.8445</td>
      <td align="right">2.9771</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 1.0 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 2.0 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 11$ was used for *i*BP, whereas $|T_i^\pm| = 5$ was used for both *i*ABP and *i*TBP.

<table>
  <thead>
    <tr>
      <th align="center" rowspan="2">PDB id</th>
      <th align="center" colspan="3">l.e.v.</th>
      <th align="center" colspan="3">CPU time</th>
      <th align="center" colspan="3">$e_a$</th>
      <th align="center" colspan="3">$s_a$</th>
      <th align="center" colspan="3">$c_a$</th>
      <th align="center" colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th align="center" colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th align="center" colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1KUW</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.06</td>
      <td align="right">43,200.82</td>
      <td align="right">871.43</td>
      <td align="right">12,100,938,265</td>
      <td align="right">2,961,258,248</td>
      <td align="right">103,520,028</td>
      <td align="right">1,350,768,804</td>
      <td align="right">1,260,946,032</td>
      <td align="right">22,583,611</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00010283</td>
      <td align="right">0.00002707</td>
      <td align="right">0.00002127</td>
      <td align="right">0.0190</td>
      <td align="right">0.0172</td>
      <td align="right">0.0172</td>
      <td align="right">1.6881</td>
      <td align="right">1.7102</td>
      <td align="right">0.1769</td>
    </tr>
    <tr>
      <td align="center">1TOS</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.82</td>
      <td align="right">43,200.16</td>
      <td align="right">37,875.19</td>
      <td align="right">24,012,065,242</td>
      <td align="right">4,763,817,501</td>
      <td align="right">5,538,023,399</td>
      <td align="right">1,298,280,202</td>
      <td align="right">1,085,896,765</td>
      <td align="right">934,993,257</td>
      <td align="right">3</td>
      <td align="right">5</td>
      <td align="right">2</td>
      <td align="right">0.00013412</td>
      <td align="right">0.00002707</td>
      <td align="right">0.00002653</td>
      <td align="right">0.0190</td>
      <td align="right">0.0181</td>
      <td align="right">0.0181</td>
      <td align="right">2.7181</td>
      <td align="right">2.3263</td>
      <td align="right">0.1797</td>
    </tr>
    <tr>
      <td align="center">1UAO</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.64</td>
      <td align="right">43,200.38</td>
      <td align="right">55.58</td>
      <td align="right">15,188,143,662</td>
      <td align="right">4,149,521,311</td>
      <td align="right">17,137,198</td>
      <td align="right">1,357,954,794</td>
      <td align="right">1,244,489,437</td>
      <td align="right">1,065,712</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00010485</td>
      <td align="right">0.00003056</td>
      <td align="right">0.00002015</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0173</td>
      <td align="right">0.4377</td>
      <td align="right">0.3012</td>
      <td align="right">0.2393</td>
    </tr>
    <tr>
      <td align="center">1ID6</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.30</td>
      <td align="right">43,200.87</td>
      <td align="right">43,200.64</td>
      <td align="right">4,258,676,666</td>
      <td align="right">1,795,607,764</td>
      <td align="right">3,258,577,008</td>
      <td align="right">701,709,433</td>
      <td align="right">740,275,261</td>
      <td align="right">678,673,525</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00007718</td>
      <td align="right">0.00001217</td>
      <td align="right">0.00001375</td>
      <td align="right">0.0190</td>
      <td align="right">0.0169</td>
      <td align="right">0.0175</td>
      <td align="right">3.8805</td>
      <td align="right">3.8391</td>
      <td align="right">0.2642</td>
    </tr>
    <tr>
      <td align="center">1DNG</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.29</td>
      <td align="right">43,200.05</td>
      <td align="right">5,271.53</td>
      <td align="right">8,436,196,673</td>
      <td align="right">2,287,710,956</td>
      <td align="right">538,688,225</td>
      <td align="right">759,115,959</td>
      <td align="right">706,758,802</td>
      <td align="right">77,982,172</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00005498</td>
      <td align="right">0.00001391</td>
      <td align="right">0.00000816</td>
      <td align="right">0.0189</td>
      <td align="right">0.0170</td>
      <td align="right">0.0131</td>
      <td align="right">1.0114</td>
      <td align="right">0.6727</td>
      <td align="right">0.2531</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.88</td>
      <td align="right">43,200.17</td>
      <td align="right">43,200.91</td>
      <td align="right">3,405,217,748</td>
      <td align="right">1,924,086,082</td>
      <td align="right">3,208,427,921</td>
      <td align="right">761,791,939</td>
      <td align="right">709,840,115</td>
      <td align="right">699,454,848</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00004165</td>
      <td align="right">0.00000868</td>
      <td align="right">0.00000713</td>
      <td align="right">0.0190</td>
      <td align="right">0.0108</td>
      <td align="right">0.0103</td>
      <td align="right">0.7174</td>
      <td align="right">0.8664</td>
      <td align="right">0.2638</td>
    </tr>
    <tr>
      <td align="center">1DU1</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.07</td>
      <td align="right">43,200.45</td>
      <td align="right">43,200.97</td>
      <td align="right">2,903,953,422</td>
      <td align="right">1,845,454,853</td>
      <td align="right">3,551,413,407</td>
      <td align="right">468,603,725</td>
      <td align="right">437,582,505</td>
      <td align="right">396,163,954</td>
      <td align="right">3</td>
      <td align="right">3</td>
      <td align="right">7</td>
      <td align="right">0.00002568</td>
      <td align="right">0.00000529</td>
      <td align="right">0.00000578</td>
      <td align="right">0.0190</td>
      <td align="right">0.0177</td>
      <td align="right">0.0176</td>
      <td align="right">2.6630</td>
      <td align="right">2.5155</td>
      <td align="right">1.5494</td>
    </tr>
    <tr>
      <td align="center">1DPK</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.08</td>
      <td align="right">43,200.79</td>
      <td align="right">43,200.91</td>
      <td align="right">2,069,553,263</td>
      <td align="right">1,072,379,093</td>
      <td align="right">1,919,133,790</td>
      <td align="right">485,591,260</td>
      <td align="right">458,395,300</td>
      <td align="right">443,243,952</td>
      <td align="right">2</td>
      <td align="right">5</td>
      <td align="right">2</td>
      <td align="right">0.00002626</td>
      <td align="right">0.00000556</td>
      <td align="right">0.00000701</td>
      <td align="right">0.0190</td>
      <td align="right">0.0177</td>
      <td align="right">0.0150</td>
      <td align="right">3.1755</td>
      <td align="right">3.5158</td>
      <td align="right">0.9887</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.16</td>
      <td align="right">43,200.59</td>
      <td align="right">43,200.33</td>
      <td align="right">2,266,095,704</td>
      <td align="right">1,583,772,951</td>
      <td align="right">3,040,917,845</td>
      <td align="right">485,454,649</td>
      <td align="right">453,335,019</td>
      <td align="right">421,750,983</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00003726</td>
      <td align="right">0.00000500</td>
      <td align="right">0.00000453</td>
      <td align="right">0.0190</td>
      <td align="right">0.0134</td>
      <td align="right">0.0160</td>
      <td align="right">1.8516</td>
      <td align="right">1.5535</td>
      <td align="right">0.7781</td>
    </tr>
    <tr>
      <td align="center">1CKZ</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.08</td>
      <td align="right">43,200.60</td>
      <td align="right">43,200.95</td>
      <td align="right">1,283,809,308</td>
      <td align="right">994,375,338</td>
      <td align="right">2,111,314,597</td>
      <td align="right">332,866,943</td>
      <td align="right">316,891,480</td>
      <td align="right">298,882,583</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">4</td>
      <td align="right">0.00001602</td>
      <td align="right">0.00000424</td>
      <td align="right">0.00000427</td>
      <td align="right">0.0190</td>
      <td align="right">0.0175</td>
      <td align="right">0.0134</td>
      <td align="right">5.9980</td>
      <td align="right">9.6580</td>
      <td align="right">3.3819</td>
    </tr>
    <tr>
      <td align="center">1LFC</td>
      <td align="right">104</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.64</td>
      <td align="right">43,200.78</td>
      <td align="right">43,200.26</td>
      <td align="right">378,499,280,952</td>
      <td align="right">19,177,664,603</td>
      <td align="right">13,428,217,037</td>
      <td align="right">0</td>
      <td align="right">842,840</td>
      <td align="right">91,852,836</td>
      <td align="right">0</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">---</td>
      <td align="right">0.00000311</td>
      <td align="right">0.00000592</td>
      <td align="right">---</td>
      <td align="right">0.0157</td>
      <td align="right">0.0172</td>
      <td align="right">---</td>
      <td align="right">2.8686</td>
      <td align="right">0.4984</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.96</td>
      <td align="right">43,200.13</td>
      <td align="right">43,200.88</td>
      <td align="right">1,988,071,531</td>
      <td align="right">767,991,366</td>
      <td align="right">1,364,749,794</td>
      <td align="right">328,171,549</td>
      <td align="right">322,117,372</td>
      <td align="right">304,391,741</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00002444</td>
      <td align="right">0.00000415</td>
      <td align="right">0.00000394</td>
      <td align="right">0.0190</td>
      <td align="right">0.0157</td>
      <td align="right">0.0157</td>
      <td align="right">1.4143</td>
      <td align="right">1.3319</td>
      <td align="right">0.5961</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.99</td>
      <td align="right">43,200.85</td>
      <td align="right">43,200.05</td>
      <td align="right">2,021,986,414</td>
      <td align="right">731,044,898</td>
      <td align="right">2,191,432,075</td>
      <td align="right">235,703,427</td>
      <td align="right">220,399,189</td>
      <td align="right">199,918,311</td>
      <td align="right">2</td>
      <td align="right">4</td>
      <td align="right">10</td>
      <td align="right">0.00002132</td>
      <td align="right">0.00000235</td>
      <td align="right">0.00000262</td>
      <td align="right">0.0190</td>
      <td align="right">0.0177</td>
      <td align="right">0.0186</td>
      <td align="right">8.7341</td>
      <td align="right">7.1477</td>
      <td align="right">3.4902</td>
    </tr>
    <tr>
      <td align="center">1MMC</td>
      <td align="right">97</td>
      <td align="right">95</td>
      <td align="right">97</td>
      <td align="right">43,200.69</td>
      <td align="right">43,200.04</td>
      <td align="right">43,200.52</td>
      <td align="right">398,974,013,752</td>
      <td align="right">19,446,664,024</td>
      <td align="right">23,353,339,949</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
    </tr>
    <tr>
      <td align="center">1D0R</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.87</td>
      <td align="right">43,200.35</td>
      <td align="right">43,200.38</td>
      <td align="right">1,846,382,683</td>
      <td align="right">612,093,205</td>
      <td align="right">1,116,092,458</td>
      <td align="right">238,845,061</td>
      <td align="right">232,679,914</td>
      <td align="right">225,333,932</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001760</td>
      <td align="right">0.00000508</td>
      <td align="right">0.00000378</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0176</td>
      <td align="right">2.0156</td>
      <td align="right">1.3733</td>
      <td align="right">1.0553</td>
    </tr>
    <tr>
      <td align="center">1ZWD</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.24</td>
      <td align="right">43,200.11</td>
      <td align="right">43,200.66</td>
      <td align="right">810,536,960</td>
      <td align="right">447,072,506</td>
      <td align="right">1,005,461,563</td>
      <td align="right">180,533,225</td>
      <td align="right">176,857,157</td>
      <td align="right">169,272,134</td>
      <td align="right">1</td>
      <td align="right">3</td>
      <td align="right">3</td>
      <td align="right">0.00001157</td>
      <td align="right">0.00000143</td>
      <td align="right">0.00000179</td>
      <td align="right">0.0190</td>
      <td align="right">0.0148</td>
      <td align="right">0.0150</td>
      <td align="right">4.7886</td>
      <td align="right">6.1327</td>
      <td align="right">3.0214</td>
    </tr>
    <tr>
      <td align="center">1D1H</td>
      <td align="right">70</td>
      <td align="right">72</td>
      <td align="right">177</td>
      <td align="right">43,200.13</td>
      <td align="right">43,200.34</td>
      <td align="right">43,200.48</td>
      <td align="right">492,331,256,326</td>
      <td align="right">27,724,891,012</td>
      <td align="right">1,681,152,255</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">160,901,972</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">2</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.00000150</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.0113</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.4023</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.67</td>
      <td align="right">43,200.06</td>
      <td align="right">43,200.35</td>
      <td align="right">7,528,309,773</td>
      <td align="right">1,120,227,006</td>
      <td align="right">10,731,035,361</td>
      <td align="right">173,109,852</td>
      <td align="right">161,717,037</td>
      <td align="right">60,187,136</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">4</td>
      <td align="right">0.00001684</td>
      <td align="right">0.00000295</td>
      <td align="right">0.00000310</td>
      <td align="right">0.0190</td>
      <td align="right">0.0165</td>
      <td align="right">0.0165</td>
      <td align="right">4.5397</td>
      <td align="right">3.2039</td>
      <td align="right">0.5005</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.29</td>
      <td align="right">43,200.49</td>
      <td align="right">43,200.27</td>
      <td align="right">756,076,544</td>
      <td align="right">408,693,053</td>
      <td align="right">716,948,536</td>
      <td align="right">141,316,891</td>
      <td align="right">135,661,471</td>
      <td align="right">133,171,818</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.00000716</td>
      <td align="right">0.00000171</td>
      <td align="right">0.00000167</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0167</td>
      <td align="right">7.3275</td>
      <td align="right">7.3141</td>
      <td align="right">4.2472</td>
    </tr>
    <tr>
      <td align="center">1BA4</td>
      <td align="right">100</td>
      <td align="right">100</td>
      <td align="right">202</td>
      <td align="right">43,200.65</td>
      <td align="right">43,200.40</td>
      <td align="right">43,200.75</td>
      <td align="right">429,923,670,472</td>
      <td align="right">17,758,510,506</td>
      <td align="right">698,968,618</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">134,657,478</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">2</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.00000148</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.0146</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">1.2459</td>
    </tr>
    <tr>
      <td align="center">1C56</td>
      <td align="right">177</td>
      <td align="right">155</td>
      <td align="right">180</td>
      <td align="right">43,200.07</td>
      <td align="right">43,200.37</td>
      <td align="right">43,200.50</td>
      <td align="right">301,163,271,154</td>
      <td align="right">15,906,078,286</td>
      <td align="right">11,067,488,112</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">---</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 1.0 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 3.0 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 11$ was used for *i*BP, whereas $|T_i^\pm| = 5$ was used for both *i*ABP and *i*TBP.

<table>
  <thead>
    <tr>
      <th align="center" rowspan="2">PDB id</th>
      <th align="center" colspan="3">l.e.v.</th>
      <th align="center" colspan="3">CPU time</th>
      <th align="center" colspan="3">$e_a$</th>
      <th align="center" colspan="3">$s_a$</th>
      <th align="center" colspan="3">$c_a$</th>
      <th align="center" colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th align="center" colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th align="center" colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1KUW</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.16</td>
      <td align="right">43,200.80</td>
      <td align="right">423.23</td>
      <td align="right">12,848,167,702</td>
      <td align="right">3,783,969,668</td>
      <td align="right">54,541,028</td>
      <td align="right">1,344,044,224</td>
      <td align="right">1,199,795,601</td>
      <td align="right">11,126,881</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00012146</td>
      <td align="right">0.00002696</td>
      <td align="right">0.00001397</td>
      <td align="right">0.0190</td>
      <td align="right">0.0174</td>
      <td align="right">0.0149</td>
      <td align="right">0.3405</td>
      <td align="right">0.2959</td>
      <td align="right">0.2718</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.16</td>
      <td align="right">43,200.46</td>
      <td align="right">43,200.21</td>
      <td align="right">5,487,964,507</td>
      <td align="right">2,229,279,640</td>
      <td align="right">3,318,056,791</td>
      <td align="right">757,907,416</td>
      <td align="right">695,319,622</td>
      <td align="right">692,156,353</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">4</td>
      <td align="right">0.00004434</td>
      <td align="right">0.00001310</td>
      <td align="right">0.00001569</td>
      <td align="right">0.0190</td>
      <td align="right">0.0176</td>
      <td align="right">0.0176</td>
      <td align="right">1.5453</td>
      <td align="right">1.0677</td>
      <td align="right">0.3405</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.16</td>
      <td align="right">43,200.20</td>
      <td align="right">43,200.24</td>
      <td align="right">3,347,582,938</td>
      <td align="right">2,154,004,154</td>
      <td align="right">4,109,309,031</td>
      <td align="right">482,628,265</td>
      <td align="right">433,748,575</td>
      <td align="right">414,422,298</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00003359</td>
      <td align="right">0.00000504</td>
      <td align="right">0.00000739</td>
      <td align="right">0.0190</td>
      <td align="right">0.0130</td>
      <td align="right">0.0140</td>
      <td align="right">1.9539</td>
      <td align="right">1.5794</td>
      <td align="right">0.8667</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.07</td>
      <td align="right">43,200.22</td>
      <td align="right">43,200.48</td>
      <td align="right">1,493,286,964</td>
      <td align="right">854,872,089</td>
      <td align="right">1,649,703,616</td>
      <td align="right">330,584,584</td>
      <td align="right">320,916,776</td>
      <td align="right">302,658,406</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001250</td>
      <td align="right">0.00000478</td>
      <td align="right">0.00000430</td>
      <td align="right">0.0190</td>
      <td align="right">0.0157</td>
      <td align="right">0.0165</td>
      <td align="right">2.8002</td>
      <td align="right">1.1766</td>
      <td align="right">0.8498</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.36</td>
      <td align="right">43,200.40</td>
      <td align="right">43,200.13</td>
      <td align="right">2,625,335,342</td>
      <td align="right">1,053,201,107</td>
      <td align="right">1,570,071,388</td>
      <td align="right">233,189,513</td>
      <td align="right">219,393,435</td>
      <td align="right">215,035,499</td>
      <td align="right">2</td>
      <td align="right">5</td>
      <td align="right">8</td>
      <td align="right">0.00001940</td>
      <td align="right">0.00000377</td>
      <td align="right">0.00000242</td>
      <td align="right">0.0190</td>
      <td align="right">0.0177</td>
      <td align="right">0.0156</td>
      <td align="right">5.9797</td>
      <td align="right">3.9397</td>
      <td align="right">9.5384</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.77</td>
      <td align="right">43,200.50</td>
      <td align="right">43,200.83</td>
      <td align="right">10,229,462,944</td>
      <td align="right">1,386,023,743</td>
      <td align="right">16,325,006,907</td>
      <td align="right">168,502,291</td>
      <td align="right">155,007,008</td>
      <td align="right">1,157,022</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">3</td>
      <td align="right">0.00001518</td>
      <td align="right">0.00000366</td>
      <td align="right">0.00000276</td>
      <td align="right">0.0190</td>
      <td align="right">0.0169</td>
      <td align="right">0.0137</td>
      <td align="right">5.1125</td>
      <td align="right">3.3259</td>
      <td align="right">0.8624</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.15</td>
      <td align="right">43,200.40</td>
      <td align="right">43,200.48</td>
      <td align="right">966,975,488</td>
      <td align="right">444,034,985</td>
      <td align="right">786,806,922</td>
      <td align="right">140,368,378</td>
      <td align="right">136,211,681</td>
      <td align="right">131,739,348</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001006</td>
      <td align="right">0.00000248</td>
      <td align="right">0.00000251</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0172</td>
      <td align="right">7.7052</td>
      <td align="right">8.0816</td>
      <td align="right">6.6736</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 2.0 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 3.0 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 11$ was used for *i*BP, whereas $|T_i^\pm| = 7$ was used for both *i*ABP and *i*TBP.

<table>
  <thead>
    <tr>
      <th align="center" rowspan="2">PDB id</th>
      <th align="center" colspan="3">l.e.v.</th>
      <th align="center" colspan="3">CPU time</th>
      <th align="center" colspan="3">$e_a$</th>
      <th align="center" colspan="3">$s_a$</th>
      <th align="center" colspan="3">$c_a$</th>
      <th align="center" colspan="3">$\overline{\mathrm{MDE}}$</th>
      <th align="center" colspan="3">$\overline{\mathrm{LDE}}$</th>
      <th align="center" colspan="3">$\underline{\mathrm{RMSD}}$</th>
    </tr>
    <tr>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
      <th align="center"><i>i</i>BP</th>
      <th align="center"><i>i</i>ABP</th>
      <th align="center"><i>i</i>TBP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1KUW</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.65</td>
      <td align="right">43,200.77</td>
      <td align="right">6,416.57</td>
      <td align="right">25,391,246,253</td>
      <td align="right">3,301,086,284</td>
      <td align="right">698,956,205</td>
      <td align="right">1,308,882,351</td>
      <td align="right">1,262,301,416</td>
      <td align="right">176,634,385</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00009046</td>
      <td align="right">0.00003076</td>
      <td align="right">0.00002450</td>
      <td align="right">0.0190</td>
      <td align="right">0.0176</td>
      <td align="right">0.0172</td>
      <td align="right">0.6973</td>
      <td align="right">1.7775</td>
      <td align="right">0.1452</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.85</td>
      <td align="right">43,200.20</td>
      <td align="right">43,200.80</td>
      <td align="right">3,229,876,200</td>
      <td align="right">2,065,525,342</td>
      <td align="right">3,644,435,549</td>
      <td align="right">762,022,013</td>
      <td align="right">730,127,419</td>
      <td align="right">742,391,303</td>
      <td align="right">3</td>
      <td align="right">2</td>
      <td align="right">4</td>
      <td align="right">0.00003050</td>
      <td align="right">0.00000716</td>
      <td align="right">0.00001497</td>
      <td align="right">0.0190</td>
      <td align="right">0.0174</td>
      <td align="right">0.0176</td>
      <td align="right">1.3236</td>
      <td align="right">1.3159</td>
      <td align="right">0.6398</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.62</td>
      <td align="right">43,200.31</td>
      <td align="right">43,200.27</td>
      <td align="right">4,704,600,145</td>
      <td align="right">3,047,238,249</td>
      <td align="right">4,700,907,229</td>
      <td align="right">477,269,636</td>
      <td align="right">444,355,447</td>
      <td align="right">438,647,516</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00002570</td>
      <td align="right">0.00000652</td>
      <td align="right">0.00000607</td>
      <td align="right">0.0190</td>
      <td align="right">0.0123</td>
      <td align="right">0.0143</td>
      <td align="right">2.0225</td>
      <td align="right">1.7138</td>
      <td align="right">1.0832</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.89</td>
      <td align="right">43,200.91</td>
      <td align="right">43,200.17</td>
      <td align="right">1,962,618,984</td>
      <td align="right">910,793,594</td>
      <td align="right">1,512,073,832</td>
      <td align="right">329,671,627</td>
      <td align="right">323,207,036</td>
      <td align="right">308,304,088</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001056</td>
      <td align="right">0.00000402</td>
      <td align="right">0.00000517</td>
      <td align="right">0.0190</td>
      <td align="right">0.0153</td>
      <td align="right">0.0163</td>
      <td align="right">2.8960</td>
      <td align="right">2.0460</td>
      <td align="right">1.4562</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.88</td>
      <td align="right">43,200.16</td>
      <td align="right">43,200.56</td>
      <td align="right">2,555,863,094</td>
      <td align="right">723,158,831</td>
      <td align="right">1,473,982,429</td>
      <td align="right">234,473,609</td>
      <td align="right">228,847,314</td>
      <td align="right">225,941,017</td>
      <td align="right">2</td>
      <td align="right">3</td>
      <td align="right">6</td>
      <td align="right">0.00001781</td>
      <td align="right">0.00000356</td>
      <td align="right">0.00000360</td>
      <td align="right">0.0190</td>
      <td align="right">0.0181</td>
      <td align="right">0.0177</td>
      <td align="right">8.2719</td>
      <td align="right">5.1819</td>
      <td align="right">8.3031</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.56</td>
      <td align="right">43,200.98</td>
      <td align="right">43,200.17</td>
      <td align="right">12,483,324,571</td>
      <td align="right">1,543,827,052</td>
      <td align="right">4,956,549,915</td>
      <td align="right">169,263,461</td>
      <td align="right">151,890,734</td>
      <td align="right">99,547,406</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001781</td>
      <td align="right">0.00000321</td>
      <td align="right">0.00000295</td>
      <td align="right">0.0190</td>
      <td align="right">0.0168</td>
      <td align="right">0.0154</td>
      <td align="right">3.3908</td>
      <td align="right">3.9691</td>
      <td align="right">1.9302</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.20</td>
      <td align="right">43,200.65</td>
      <td align="right">43,200.23</td>
      <td align="right">2,205,798,495</td>
      <td align="right">636,733,089</td>
      <td align="right">820,159,539</td>
      <td align="right">139,995,424</td>
      <td align="right">136,620,404</td>
      <td align="right">133,533,612</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00000843</td>
      <td align="right">0.00000187</td>
      <td align="right">0.00000227</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0143</td>
      <td align="right">8.0434</td>
      <td align="right">8.3726</td>
      <td align="right">7.8887</td>
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
