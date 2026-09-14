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

The reported benchmark runs used **bpbm-3d-iddgp version 1.0.0**, released on **2026-08-28**.

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
      <td align="right">424.58</td>
      <td align="right">1,146.50</td>
      <td align="right">0.04</td>
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
      <td align="right">0.00000532</td>
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
      <td align="right">43,200.80</td>
      <td align="right">151.73</td>
      <td align="right">24,819,206,891</td>
      <td align="right">3,735,477,553</td>
      <td align="right">32,219,780</td>
      <td align="right">1,438,572,012</td>
      <td align="right">1,336,747,741</td>
      <td align="right">7,861,887</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00003946</td>
      <td align="right">0.00000707</td>
      <td align="right">0.00001023</td>
      <td align="right">0.0188</td>
      <td align="right">0.0164</td>
      <td align="right">0.0164</td>
      <td align="right">0.2134</td>
      <td align="right">0.1478</td>
      <td align="right">0.0626</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.47</td>
      <td align="right">43,200.41</td>
      <td align="right">10,176.86</td>
      <td align="right">5,708,505,509</td>
      <td align="right">1,775,888,312</td>
      <td align="right">1,097,224,696</td>
      <td align="right">1,166,697,484</td>
      <td align="right">594,630,960</td>
      <td align="right">339,259,380</td>
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
      <td align="right">43,200.72</td>
      <td align="right">43,200.38</td>
      <td align="right">43,200.23</td>
      <td align="right">2,589,339,698</td>
      <td align="right">1,317,533,590</td>
      <td align="right">2,244,543,751</td>
      <td align="right">784,085,799</td>
      <td align="right">647,112,451</td>
      <td align="right">557,326,525</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00003422</td>
      <td align="right">0.00000551</td>
      <td align="right">0.00000480</td>
      <td align="right">0.0189</td>
      <td align="right">0.0170</td>
      <td align="right">0.0170</td>
      <td align="right">2.8338</td>
      <td align="right">2.8444</td>
      <td align="right">0.0953</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.61</td>
      <td align="right">43,200.83</td>
      <td align="right">43,200.25</td>
      <td align="right">4,278,104,001</td>
      <td align="right">1,308,089,895</td>
      <td align="right">2,321,187,455</td>
      <td align="right">539,318,452</td>
      <td align="right">347,805,751</td>
      <td align="right">491,629,420</td>
      <td align="right">3</td>
      <td align="right">2</td>
      <td align="right">3</td>
      <td align="right">0.00002371</td>
      <td align="right">0.00000317</td>
      <td align="right">0.00000278</td>
      <td align="right">0.0190</td>
      <td align="right">0.0181</td>
      <td align="right">0.0118</td>
      <td align="right">7.1112</td>
      <td align="right">4.8985</td>
      <td align="right">2.7177</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.84</td>
      <td align="right">43,200.80</td>
      <td align="right">43,200.78</td>
      <td align="right">17,639,522,668</td>
      <td align="right">2,652,681,165</td>
      <td align="right">3,034,401,932</td>
      <td align="right">390,395,967</td>
      <td align="right">247,036,482</td>
      <td align="right">203,705,600</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.00002537</td>
      <td align="right">0.00000422</td>
      <td align="right">0.00000217</td>
      <td align="right">0.0190</td>
      <td align="right">0.0162</td>
      <td align="right">0.0132</td>
      <td align="right">2.4784</td>
      <td align="right">3.8855</td>
      <td align="right">0.1144</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.10</td>
      <td align="right">43,200.03</td>
      <td align="right">43,200.43</td>
      <td align="right">653,553,664</td>
      <td align="right">564,372,737</td>
      <td align="right">935,018,324</td>
      <td align="right">206,820,840</td>
      <td align="right">281,665,445</td>
      <td align="right">196,519,423</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001009</td>
      <td align="right">0.00000210</td>
      <td align="right">0.00000229</td>
      <td align="right">0.0190</td>
      <td align="right">0.0171</td>
      <td align="right">0.0168</td>
      <td align="right">6.5406</td>
      <td align="right">2.0819</td>
      <td align="right">1.1791</td>
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
      <td align="right">43,200.41</td>
      <td align="right">43,200.39</td>
      <td align="right">138.62</td>
      <td align="right">34,270,541,674</td>
      <td align="right">6,639,644,596</td>
      <td align="right">34,067,627</td>
      <td align="right">3,251,105,406</td>
      <td align="right">2,415,022,121</td>
      <td align="right">6,607,078</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00008307</td>
      <td align="right">0.00002755</td>
      <td align="right">0.00001907</td>
      <td align="right">0.0190</td>
      <td align="right">0.0167</td>
      <td align="right">0.0138</td>
      <td align="right">0.1125</td>
      <td align="right">0.1235</td>
      <td align="right">0.1388</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.76</td>
      <td align="right">43,200.20</td>
      <td align="right">43,200.00</td>
      <td align="right">5,684,015,517</td>
      <td align="right">2,267,292,603</td>
      <td align="right">4,908,240,747</td>
      <td align="right">1,288,947,805</td>
      <td align="right">1,033,063,679</td>
      <td align="right">1,500,144,212</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00003229</td>
      <td align="right">0.00000553</td>
      <td align="right">0.00001083</td>
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
      <td align="right">43,200.25</td>
      <td align="right">43,200.86</td>
      <td align="right">43,200.72</td>
      <td align="right">5,942,198,772</td>
      <td align="right">3,168,528,650</td>
      <td align="right">6,307,021,993</td>
      <td align="right">1,166,998,528</td>
      <td align="right">999,429,665</td>
      <td align="right">956,733,930</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00004106</td>
      <td align="right">0.00000713</td>
      <td align="right">0.00000668</td>
      <td align="right">0.0189</td>
      <td align="right">0.0166</td>
      <td align="right">0.0170</td>
      <td align="right">3.0140</td>
      <td align="right">3.0427</td>
      <td align="right">0.5872</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.86</td>
      <td align="right">43,200.42</td>
      <td align="right">43,200.72</td>
      <td align="right">3,023,069,184</td>
      <td align="right">1,730,821,130</td>
      <td align="right">2,971,417,747</td>
      <td align="right">713,745,536</td>
      <td align="right">698,224,433</td>
      <td align="right">672,825,099</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001492</td>
      <td align="right">0.00000344</td>
      <td align="right">0.00000442</td>
      <td align="right">0.0190</td>
      <td align="right">0.0163</td>
      <td align="right">0.0164</td>
      <td align="right">0.7005</td>
      <td align="right">1.0037</td>
      <td align="right">0.3934</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.28</td>
      <td align="right">43,200.28</td>
      <td align="right">43,200.97</td>
      <td align="right">5,005,463,735</td>
      <td align="right">1,672,680,126</td>
      <td align="right">3,368,750,063</td>
      <td align="right">543,513,687</td>
      <td align="right">511,244,401</td>
      <td align="right">458,061,939</td>
      <td align="right">3</td>
      <td align="right">2</td>
      <td align="right">6</td>
      <td align="right">0.00001741</td>
      <td align="right">0.00000201</td>
      <td align="right">0.00000250</td>
      <td align="right">0.0190</td>
      <td align="right">0.0164</td>
      <td align="right">0.0217</td>
      <td align="right">5.7463</td>
      <td align="right">9.6401</td>
      <td align="right">4.3751</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.20</td>
      <td align="right">43,200.31</td>
      <td align="right">43,200.27</td>
      <td align="right">23,661,050,211</td>
      <td align="right">3,856,933,337</td>
      <td align="right">14,783,789,564</td>
      <td align="right">407,715,913</td>
      <td align="right">218,106,495</td>
      <td align="right">61,663,736</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.00001664</td>
      <td align="right">0.00000276</td>
      <td align="right">0.00000149</td>
      <td align="right">0.0189</td>
      <td align="right">0.0162</td>
      <td align="right">0.0121</td>
      <td align="right">2.6993</td>
      <td align="right">2.4185</td>
      <td align="right">0.4436</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.20</td>
      <td align="right">43,200.24</td>
      <td align="right">43,200.66</td>
      <td align="right">1,279,692,828</td>
      <td align="right">451,511,901</td>
      <td align="right">1,046,159,326</td>
      <td align="right">249,691,035</td>
      <td align="right">195,498,095</td>
      <td align="right">239,667,292</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.00001140</td>
      <td align="right">0.00000140</td>
      <td align="right">0.00000247</td>
      <td align="right">0.0190</td>
      <td align="right">0.0169</td>
      <td align="right">0.0151</td>
      <td align="right">4.2151</td>
      <td align="right">5.8330</td>
      <td align="right">2.9179</td>
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
      <td align="right">43,200.80</td>
      <td align="right">43,200.92</td>
      <td align="right">482.14</td>
      <td align="right">19,476,083,674</td>
      <td align="right">5,455,139,627</td>
      <td align="right">103,519,920</td>
      <td align="right">2,182,679,759</td>
      <td align="right">2,322,556,183</td>
      <td align="right">22,583,575</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00011049</td>
      <td align="right">0.00002808</td>
      <td align="right">0.00002127</td>
      <td align="right">0.0190</td>
      <td align="right">0.0172</td>
      <td align="right">0.0172</td>
      <td align="right">1.6881</td>
      <td align="right">1.6613</td>
      <td align="right">0.1769</td>
    </tr>
    <tr>
      <td align="center">1TOS</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.29</td>
      <td align="right">43,200.46</td>
      <td align="right">12,036.75</td>
      <td align="right">54,470,656,545</td>
      <td align="right">5,614,530,975</td>
      <td align="right">5,538,024,042</td>
      <td align="right">2,944,221,824</td>
      <td align="right">1,283,008,307</td>
      <td align="right">934,993,381</td>
      <td align="right">4</td>
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
      <td align="right">43,200.79</td>
      <td align="right">43,200.30</td>
      <td align="right">34.75</td>
      <td align="right">25,584,413,678</td>
      <td align="right">8,782,433,020</td>
      <td align="right">17,138,812</td>
      <td align="right">2,069,612,359</td>
      <td align="right">2,710,696,219</td>
      <td align="right">1,066,050</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00010485</td>
      <td align="right">0.00003056</td>
      <td align="right">0.00002015</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0173</td>
      <td align="right">0.4377</td>
      <td align="right">0.2806</td>
      <td align="right">0.2393</td>
    </tr>
    <tr>
      <td align="center">1ID6</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.10</td>
      <td align="right">43,200.10</td>
      <td align="right">43,200.01</td>
      <td align="right">5,315,330,336</td>
      <td align="right">3,759,783,942</td>
      <td align="right">5,949,348,512</td>
      <td align="right">927,145,671</td>
      <td align="right">1,550,739,893</td>
      <td align="right">1,250,214,201</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00007718</td>
      <td align="right">0.00001255</td>
      <td align="right">0.00001385</td>
      <td align="right">0.0190</td>
      <td align="right">0.0169</td>
      <td align="right">0.0175</td>
      <td align="right">3.8654</td>
      <td align="right">3.8391</td>
      <td align="right">0.2343</td>
    </tr>
    <tr>
      <td align="center">1DNG</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.49</td>
      <td align="right">43,200.61</td>
      <td align="right">2,287.96</td>
      <td align="right">14,983,298,537</td>
      <td align="right">5,102,880,034</td>
      <td align="right">538,699,995</td>
      <td align="right">1,327,483,870</td>
      <td align="right">1,576,497,602</td>
      <td align="right">77,983,760</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00005501</td>
      <td align="right">0.00001649</td>
      <td align="right">0.00000816</td>
      <td align="right">0.0189</td>
      <td align="right">0.0170</td>
      <td align="right">0.0131</td>
      <td align="right">0.9944</td>
      <td align="right">0.6727</td>
      <td align="right">0.2531</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.58</td>
      <td align="right">43,200.03</td>
      <td align="right">43,200.08</td>
      <td align="right">5,715,648,936</td>
      <td align="right">3,962,789,631</td>
      <td align="right">4,711,936,731</td>
      <td align="right">1,278,683,454</td>
      <td align="right">1,461,964,718</td>
      <td align="right">1,027,227,960</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00004165</td>
      <td align="right">0.00000868</td>
      <td align="right">0.00000715</td>
      <td align="right">0.0190</td>
      <td align="right">0.0109</td>
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
      <td align="right">43,200.74</td>
      <td align="right">43,200.18</td>
      <td align="right">43,200.87</td>
      <td align="right">5,882,991,072</td>
      <td align="right">3,119,683,179</td>
      <td align="right">7,184,961,269</td>
      <td align="right">948,502,059</td>
      <td align="right">740,778,380</td>
      <td align="right">801,521,560</td>
      <td align="right">3</td>
      <td align="right">3</td>
      <td align="right">8</td>
      <td align="right">0.00002568</td>
      <td align="right">0.00000529</td>
      <td align="right">0.00000583</td>
      <td align="right">0.0190</td>
      <td align="right">0.0177</td>
      <td align="right">0.0176</td>
      <td align="right">2.6597</td>
      <td align="right">2.5155</td>
      <td align="right">1.5468</td>
    </tr>
    <tr>
      <td align="center">1DPK</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.79</td>
      <td align="right">43,200.32</td>
      <td align="right">43,200.22</td>
      <td align="right">3,968,642,962</td>
      <td align="right">1,862,341,219</td>
      <td align="right">3,948,659,692</td>
      <td align="right">931,157,384</td>
      <td align="right">796,169,463</td>
      <td align="right">911,969,272</td>
      <td align="right">2</td>
      <td align="right">5</td>
      <td align="right">3</td>
      <td align="right">0.00002626</td>
      <td align="right">0.00000708</td>
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
      <td align="right">43,200.20</td>
      <td align="right">43,200.41</td>
      <td align="right">43,200.22</td>
      <td align="right">4,668,416,069</td>
      <td align="right">3,140,245,424</td>
      <td align="right">5,977,972,426</td>
      <td align="right">1,000,042,007</td>
      <td align="right">898,853,718</td>
      <td align="right">829,062,240</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00004106</td>
      <td align="right">0.00000502</td>
      <td align="right">0.00000532</td>
      <td align="right">0.0190</td>
      <td align="right">0.0134</td>
      <td align="right">0.0160</td>
      <td align="right">1.8476</td>
      <td align="right">1.5535</td>
      <td align="right">0.7781</td>
    </tr>
    <tr>
      <td align="center">1CKZ</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,201.00</td>
      <td align="right">43,200.95</td>
      <td align="right">43,200.83</td>
      <td align="right">2,476,646,464</td>
      <td align="right">1,894,165,882</td>
      <td align="right">4,734,596,256</td>
      <td align="right">642,035,690</td>
      <td align="right">603,927,828</td>
      <td align="right">669,916,052</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">5</td>
      <td align="right">0.00001602</td>
      <td align="right">0.00000424</td>
      <td align="right">0.00000490</td>
      <td align="right">0.0190</td>
      <td align="right">0.0175</td>
      <td align="right">0.0162</td>
      <td align="right">5.9972</td>
      <td align="right">9.6559</td>
      <td align="right">3.3819</td>
    </tr>
    <tr>
      <td align="center">1LFC</td>
      <td align="right">104</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.27</td>
      <td align="right">43,200.58</td>
      <td align="right">43,200.72</td>
      <td align="right">691,178,820,742</td>
      <td align="right">23,953,802,576</td>
      <td align="right">22,850,689,248</td>
      <td align="right">0</td>
      <td align="right">846,776</td>
      <td align="right">100,493,747</td>
      <td align="right">0</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">---</td>
      <td align="right">0.00000311</td>
      <td align="right">0.00000591</td>
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
      <td align="right">43,200.15</td>
      <td align="right">43,200.32</td>
      <td align="right">43,200.79</td>
      <td align="right">3,496,968,137</td>
      <td align="right">1,644,647,113</td>
      <td align="right">1,961,077,760</td>
      <td align="right">575,733,362</td>
      <td align="right">690,032,801</td>
      <td align="right">437,526,643</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00002459</td>
      <td align="right">0.00000415</td>
      <td align="right">0.00000394</td>
      <td align="right">0.0190</td>
      <td align="right">0.0157</td>
      <td align="right">0.0157</td>
      <td align="right">1.4137</td>
      <td align="right">1.3319</td>
      <td align="right">0.5955</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.32</td>
      <td align="right">43,200.01</td>
      <td align="right">43,200.45</td>
      <td align="right">3,865,104,286</td>
      <td align="right">1,502,820,253</td>
      <td align="right">4,575,028,305</td>
      <td align="right">450,126,626</td>
      <td align="right">453,191,633</td>
      <td align="right">419,631,287</td>
      <td align="right">2</td>
      <td align="right">4</td>
      <td align="right">11</td>
      <td align="right">0.00002239</td>
      <td align="right">0.00000235</td>
      <td align="right">0.00000357</td>
      <td align="right">0.0190</td>
      <td align="right">0.0177</td>
      <td align="right">0.0223</td>
      <td align="right">8.6824</td>
      <td align="right">7.1445</td>
      <td align="right">2.8412</td>
    </tr>
    <tr>
      <td align="center">1MMC</td>
      <td align="right">97</td>
      <td align="right">97</td>
      <td align="right">97</td>
      <td align="right">43,200.01</td>
      <td align="right">43,200.21</td>
      <td align="right">43,200.26</td>
      <td align="right">630,034,627,036</td>
      <td align="right">25,218,536,297</td>
      <td align="right">32,952,718,976</td>
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
      <td align="right">43,200.04</td>
      <td align="right">43,200.18</td>
      <td align="right">43,200.50</td>
      <td align="right">2,986,065,924</td>
      <td align="right">1,197,512,917</td>
      <td align="right">1,984,141,077</td>
      <td align="right">463,738,837</td>
      <td align="right">455,257,950</td>
      <td align="right">400,591,415</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001837</td>
      <td align="right">0.00000536</td>
      <td align="right">0.00000378</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0177</td>
      <td align="right">2.0130</td>
      <td align="right">1.3733</td>
      <td align="right">1.0478</td>
    </tr>
    <tr>
      <td align="center">1ZWD</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.35</td>
      <td align="right">43,200.95</td>
      <td align="right">43,200.99</td>
      <td align="right">1,745,813,584</td>
      <td align="right">821,436,675</td>
      <td align="right">1,650,462,116</td>
      <td align="right">388,946,887</td>
      <td align="right">324,772,104</td>
      <td align="right">277,835,488</td>
      <td align="right">1</td>
      <td align="right">3</td>
      <td align="right">3</td>
      <td align="right">0.00001229</td>
      <td align="right">0.00000150</td>
      <td align="right">0.00000179</td>
      <td align="right">0.0190</td>
      <td align="right">0.0156</td>
      <td align="right">0.0150</td>
      <td align="right">4.7010</td>
      <td align="right">6.0835</td>
      <td align="right">2.9764</td>
    </tr>
    <tr>
      <td align="center">1D1H</td>
      <td align="right">70</td>
      <td align="right">72</td>
      <td align="right">177</td>
      <td align="right">43,200.44</td>
      <td align="right">43,200.02</td>
      <td align="right">43,200.82</td>
      <td align="right">963,822,522,882</td>
      <td align="right">22,664,180,617</td>
      <td align="right">2,328,017,384</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">230,506,186</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">2</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.00000156</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.0112</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.4062</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.40</td>
      <td align="right">43,200.68</td>
      <td align="right">43,200.15</td>
      <td align="right">12,645,501,650</td>
      <td align="right">1,945,006,154</td>
      <td align="right">13,704,740,972</td>
      <td align="right">291,617,247</td>
      <td align="right">280,808,066</td>
      <td align="right">76,876,181</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">4</td>
      <td align="right">0.00001684</td>
      <td align="right">0.00000295</td>
      <td align="right">0.00000310</td>
      <td align="right">0.0190</td>
      <td align="right">0.0165</td>
      <td align="right">0.0165</td>
      <td align="right">4.4369</td>
      <td align="right">3.1991</td>
      <td align="right">0.5005</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.07</td>
      <td align="right">43,200.31</td>
      <td align="right">43,200.90</td>
      <td align="right">1,640,489,028</td>
      <td align="right">893,339,286</td>
      <td align="right">1,115,533,815</td>
      <td align="right">307,914,701</td>
      <td align="right">305,950,409</td>
      <td align="right">207,335,207</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.00000716</td>
      <td align="right">0.00000171</td>
      <td align="right">0.00000187</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0167</td>
      <td align="right">7.3275</td>
      <td align="right">7.2919</td>
      <td align="right">4.2472</td>
    </tr>
    <tr>
      <td align="center">1BA4</td>
      <td align="right">100</td>
      <td align="right">100</td>
      <td align="right">202</td>
      <td align="right">43,200.32</td>
      <td align="right">43,200.64</td>
      <td align="right">43,200.22</td>
      <td align="right">925,777,704,552</td>
      <td align="right">25,072,571,962</td>
      <td align="right">924,192,151</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">178,098,908</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">2</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.00000149</td>
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
      <td align="right">43,200.32</td>
      <td align="right">43,200.57</td>
      <td align="right">43,200.22</td>
      <td align="right">596,149,221,881</td>
      <td align="right">17,228,233,641</td>
      <td align="right">13,725,565,366</td>
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
      <td align="right">43,200.99</td>
      <td align="right">43,200.35</td>
      <td align="right">128.90</td>
      <td align="right">21,713,630,928</td>
      <td align="right">6,930,093,633</td>
      <td align="right">54,542,813</td>
      <td align="right">2,265,384,673</td>
      <td align="right">2,199,369,058</td>
      <td align="right">11,127,418</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.00012981</td>
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
      <td align="right">43,200.85</td>
      <td align="right">43,200.92</td>
      <td align="right">43,200.84</td>
      <td align="right">12,638,477,007</td>
      <td align="right">3,784,288,509</td>
      <td align="right">6,719,780,620</td>
      <td align="right">1,745,085,746</td>
      <td align="right">1,180,305,299</td>
      <td align="right">1,401,767,706</td>
      <td align="right">3</td>
      <td align="right">2</td>
      <td align="right">4</td>
      <td align="right">0.00004435</td>
      <td align="right">0.00001310</td>
      <td align="right">0.00001578</td>
      <td align="right">0.0190</td>
      <td align="right">0.0176</td>
      <td align="right">0.0176</td>
      <td align="right">1.5453</td>
      <td align="right">1.0207</td>
      <td align="right">0.2694</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.34</td>
      <td align="right">43,200.89</td>
      <td align="right">43,200.75</td>
      <td align="right">6,085,878,309</td>
      <td align="right">5,012,501,530</td>
      <td align="right">5,192,730,537</td>
      <td align="right">877,412,625</td>
      <td align="right">1,009,318,160</td>
      <td align="right">523,683,952</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00003517</td>
      <td align="right">0.00000504</td>
      <td align="right">0.00000739</td>
      <td align="right">0.0190</td>
      <td align="right">0.0146</td>
      <td align="right">0.0140</td>
      <td align="right">1.9499</td>
      <td align="right">1.5678</td>
      <td align="right">0.8579</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.95</td>
      <td align="right">43,200.64</td>
      <td align="right">43,200.58</td>
      <td align="right">3,152,994,289</td>
      <td align="right">1,562,509,828</td>
      <td align="right">3,032,289,312</td>
      <td align="right">698,044,697</td>
      <td align="right">583,912,461</td>
      <td align="right">555,806,157</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001250</td>
      <td align="right">0.00000515</td>
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
      <td align="right">43,200.66</td>
      <td align="right">43,200.26</td>
      <td align="right">43,200.49</td>
      <td align="right">6,099,411,498</td>
      <td align="right">1,688,380,957</td>
      <td align="right">3,013,477,973</td>
      <td align="right">541,755,073</td>
      <td align="right">352,295,412</td>
      <td align="right">414,606,282</td>
      <td align="right">2</td>
      <td align="right">5</td>
      <td align="right">10</td>
      <td align="right">0.00001940</td>
      <td align="right">0.00000377</td>
      <td align="right">0.00000283</td>
      <td align="right">0.0190</td>
      <td align="right">0.0177</td>
      <td align="right">0.0156</td>
      <td align="right">5.9783</td>
      <td align="right">3.9397</td>
      <td align="right">9.5384</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.55</td>
      <td align="right">43,200.30</td>
      <td align="right">43,200.70</td>
      <td align="right">20,065,862,818</td>
      <td align="right">2,132,779,423</td>
      <td align="right">18,553,479,659</td>
      <td align="right">338,304,178</td>
      <td align="right">237,735,338</td>
      <td align="right">1,317,232</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">3</td>
      <td align="right">0.00001518</td>
      <td align="right">0.00000366</td>
      <td align="right">0.00000292</td>
      <td align="right">0.0190</td>
      <td align="right">0.0169</td>
      <td align="right">0.0137</td>
      <td align="right">5.0774</td>
      <td align="right">3.3183</td>
      <td align="right">0.8624</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.74</td>
      <td align="right">43,200.22</td>
      <td align="right">43,200.54</td>
      <td align="right">1,996,976,236</td>
      <td align="right">942,071,703</td>
      <td align="right">1,507,425,488</td>
      <td align="right">290,840,532</td>
      <td align="right">287,244,092</td>
      <td align="right">252,215,041</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001006</td>
      <td align="right">0.00000256</td>
      <td align="right">0.00000251</td>
      <td align="right">0.0190</td>
      <td align="right">0.0178</td>
      <td align="right">0.0173</td>
      <td align="right">7.7052</td>
      <td align="right">8.0807</td>
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
      <td align="right">43,200.16</td>
      <td align="right">43,200.55</td>
      <td align="right">3,436.40</td>
      <td align="right">46,335,907,679</td>
      <td align="right">6,171,125,353</td>
      <td align="right">698,956,883</td>
      <td align="right">2,385,120,454</td>
      <td align="right">2,358,355,115</td>
      <td align="right">176,634,502</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00009181</td>
      <td align="right">0.00003076</td>
      <td align="right">0.00002471</td>
      <td align="right">0.0190</td>
      <td align="right">0.0176</td>
      <td align="right">0.0172</td>
      <td align="right">0.6946</td>
      <td align="right">1.7775</td>
      <td align="right">0.1452</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.48</td>
      <td align="right">43,200.36</td>
      <td align="right">43,200.68</td>
      <td align="right">6,034,522,644</td>
      <td align="right">3,992,687,681</td>
      <td align="right">7,485,347,584</td>
      <td align="right">1,423,724,172</td>
      <td align="right">1,411,463,845</td>
      <td align="right">1,524,786,732</td>
      <td align="right">3</td>
      <td align="right">3</td>
      <td align="right">4</td>
      <td align="right">0.00003050</td>
      <td align="right">0.00000725</td>
      <td align="right">0.00001537</td>
      <td align="right">0.0190</td>
      <td align="right">0.0174</td>
      <td align="right">0.0176</td>
      <td align="right">1.3235</td>
      <td align="right">1.3159</td>
      <td align="right">0.6251</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.54</td>
      <td align="right">43,200.67</td>
      <td align="right">43,200.42</td>
      <td align="right">11,444,132,155</td>
      <td align="right">6,566,226,552</td>
      <td align="right">10,233,065,668</td>
      <td align="right">1,161,001,398</td>
      <td align="right">957,501,356</td>
      <td align="right">954,937,687</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00002659</td>
      <td align="right">0.00000783</td>
      <td align="right">0.00000651</td>
      <td align="right">0.0190</td>
      <td align="right">0.0149</td>
      <td align="right">0.0143</td>
      <td align="right">1.8896</td>
      <td align="right">1.7015</td>
      <td align="right">1.0604</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.57</td>
      <td align="right">43,200.34</td>
      <td align="right">43,200.98</td>
      <td align="right">4,116,201,354</td>
      <td align="right">1,406,703,227</td>
      <td align="right">3,454,199,288</td>
      <td align="right">693,835,503</td>
      <td align="right">498,547,856</td>
      <td align="right">704,296,808</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001056</td>
      <td align="right">0.00000445</td>
      <td align="right">0.00000517</td>
      <td align="right">0.0190</td>
      <td align="right">0.0153</td>
      <td align="right">0.0164</td>
      <td align="right">2.8960</td>
      <td align="right">2.0449</td>
      <td align="right">1.4090</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.86</td>
      <td align="right">43,200.92</td>
      <td align="right">43,200.68</td>
      <td align="right">5,923,848,686</td>
      <td align="right">1,488,424,862</td>
      <td align="right">2,645,874,586</td>
      <td align="right">543,054,332</td>
      <td align="right">469,552,763</td>
      <td align="right">405,497,150</td>
      <td align="right">2</td>
      <td align="right">3</td>
      <td align="right">6</td>
      <td align="right">0.00001781</td>
      <td align="right">0.00000362</td>
      <td align="right">0.00000360</td>
      <td align="right">0.0190</td>
      <td align="right">0.0182</td>
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
      <td align="right">43,200.32</td>
      <td align="right">43,200.24</td>
      <td align="right">43,200.04</td>
      <td align="right">24,576,391,833</td>
      <td align="right">2,682,429,070</td>
      <td align="right">8,803,590,923</td>
      <td align="right">333,044,608</td>
      <td align="right">268,382,465</td>
      <td align="right">176,814,129</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00001781</td>
      <td align="right">0.00000339</td>
      <td align="right">0.00000296</td>
      <td align="right">0.0190</td>
      <td align="right">0.0168</td>
      <td align="right">0.0157</td>
      <td align="right">3.3872</td>
      <td align="right">3.9691</td>
      <td align="right">1.8840</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.24</td>
      <td align="right">43,200.85</td>
      <td align="right">43,200.68</td>
      <td align="right">3,823,857,571</td>
      <td align="right">1,293,207,286</td>
      <td align="right">1,897,509,851</td>
      <td align="right">265,446,811</td>
      <td align="right">278,752,195</td>
      <td align="right">306,075,274</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.00000941</td>
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
