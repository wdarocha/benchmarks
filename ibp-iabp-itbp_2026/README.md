# Benchmarks: *i*BP, *i*ABP, and *i*TBP (2026)

This folder contains the benchmark datasets and results associated with the article:

> **"An Angle-Based Algorithmic Framework for the Interval Discretizable Distance Geometry Problem"**  
> W. da Rocha, C. Lavor, L. Liberti, L. de Melo Costa, L. D. Secchin, T. E. Malliavin  
> [arXiv:2508.09143](https://arxiv.org/abs/2508.09143), 2025.

---

## 📂 Contents

- **Input files** used for the interval Branch-and-Prune (*i*BP), the interval Angular Branch-and-Prune (*i*ABP), and interval Torsion-angle Branch-and-Prune (*i*TBP) experiments.  
- **Result files** including solution sets and metrics.  
- **Scripts** to validate benchmark runs.  

---

## ▶️ Usage

Run the benchmarks by executing the `main` binary over the prepared input files in `input/`.
The algorithms (iBP, iABP, iTBP) are implemented in
[BP_Algorithms_for_iDDGP](https://github.com/wdarocha/BP_Algorithms_for_iDDGP).

### Command

```bash
./build/bin/main <input_file> <output_folder>
```

**Arguments**

- `<input_file>`: path to one prepared solver input file in `input/`.
- `<output_folder>`: root directory where the solver will write the generated results.

### Repository layout

- `dataset/<interval>/<PDB>/`: raw instance data, including `I_*.dat`, `T_*.dat`, and `X_*.dat`.
- `input/sample_size=<k>/<method>/<PDB>/*_inputfile.txt`: solver-ready input files.
- `results/sample_size=<k>/<method>/<interval>/<PDB>/`: generated outputs, typically containing `<PDB>.pdb`, `out.txt`, and `results.txt`.

### Single-file example

```bash
./build/bin/main input/sample_size=5/iabp/1KUW/1KUW_A_1020_inputfile.txt results/
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

Compilation instructions and the exact input-file format are documented in the main repository:
[BP_Algorithms_for_iDDGP](https://github.com/wdarocha/BP_Algorithms_for_iDDGP)

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

For this case, $|T_i^\pm| = 9$ was used for *i*BP, whereas $|T_i^\pm| = 5$ was used for both *i*ABP and *i*TBP.

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
      <td align="right">563.73</td>
      <td align="right">4,049.70</td>
      <td align="right">0.06</td>
      <td align="right">766,075,317</td>
      <td align="right">571,495,331</td>
      <td align="right">12,271</td>
      <td align="right">32,145,764</td>
      <td align="right">185,680,481</td>
      <td align="right">1,807</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000019</td>
      <td align="right">0.000048</td>
      <td align="right">0.000008</td>
      <td align="right">0.0072</td>
      <td align="right">0.0482</td>
      <td align="right">0.0076</td>
      <td align="right">0.05</td>
      <td align="right">0.04</td>
      <td align="right">0.06</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">454.60</td>
      <td align="right">16,688,035,199</td>
      <td align="right">2,503,318,882</td>
      <td align="right">39,686,734</td>
      <td align="right">1,264,360,014</td>
      <td align="right">887,619,974</td>
      <td align="right">9,731,826</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000018</td>
      <td align="right">0.000020</td>
      <td align="right">0.000018</td>
      <td align="right">0.0124</td>
      <td align="right">0.0202</td>
      <td align="right">0.0237</td>
      <td align="right">0.09</td>
      <td align="right">0.12</td>
      <td align="right">0.06</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">23,204.50</td>
      <td align="right">4,565,797,167</td>
      <td align="right">2,267,418,854</td>
      <td align="right">1,484,314,405</td>
      <td align="right">887,387,441</td>
      <td align="right">768,433,497</td>
      <td align="right">459,764,028</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000008</td>
      <td align="right">0.000016</td>
      <td align="right">0.000016</td>
      <td align="right">0.0069</td>
      <td align="right">0.0279</td>
      <td align="right">0.0279</td>
      <td align="right">0.12</td>
      <td align="right">0.10</td>
      <td align="right">0.08</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,420,781,632</td>
      <td align="right">1,828,755,919</td>
      <td align="right">2,246,870,049</td>
      <td align="right">652,102,452</td>
      <td align="right">512,170,012</td>
      <td align="right">571,971,176</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000005</td>
      <td align="right">0.000012</td>
      <td align="right">0.000013</td>
      <td align="right">0.0064</td>
      <td align="right">0.0255</td>
      <td align="right">0.0248</td>
      <td align="right">0.24</td>
      <td align="right">0.30</td>
      <td align="right">0.11</td>
    </tr>
    <tr>
      <td align="center">1D0R</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">2,054,793,621</td>
      <td align="right">1,216,615,135</td>
      <td align="right">1,557,579,612</td>
      <td align="right">418,463,717</td>
      <td align="right">467,296,010</td>
      <td align="right">380,209,748</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000006</td>
      <td align="right">0.000005</td>
      <td align="right">0.000006</td>
      <td align="right">0.0093</td>
      <td align="right">0.0181</td>
      <td align="right">0.0153</td>
      <td align="right">0.51</td>
      <td align="right">0.50</td>
      <td align="right">0.13</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">37,043,520,478</td>
      <td align="right">1,431,710,361</td>
      <td align="right">2,347,689,855</td>
      <td align="right">279,361,327</td>
      <td align="right">224,502,601</td>
      <td align="right">213,644,137</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000007</td>
      <td align="right">0.000007</td>
      <td align="right">0.000007</td>
      <td align="right">0.0077</td>
      <td align="right">0.0277</td>
      <td align="right">0.0272</td>
      <td align="right">0.68</td>
      <td align="right">0.65</td>
      <td align="right">0.35</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,703,347,662</td>
      <td align="right">549,755,324</td>
      <td align="right">1,121,490,980</td>
      <td align="right">288,233,592</td>
      <td align="right">209,158,000</td>
      <td align="right">240,212,564</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000003</td>
      <td align="right">0.000004</td>
      <td align="right">0.000005</td>
      <td align="right">0.0075</td>
      <td align="right">0.0245</td>
      <td align="right">0.0233</td>
      <td align="right">2.67</td>
      <td align="right">2.29</td>
      <td align="right">1.18</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 0.5 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 1.0 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 9$ was used for *i*BP, whereas $|T_i^\pm| = 5$ was used for both *i*ABP and *i*TBP.

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
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">235.63</td>
      <td align="right">11,287,701,365</td>
      <td align="right">5,532,058,712</td>
      <td align="right">36,531,595</td>
      <td align="right">1,374,916,308</td>
      <td align="right">2,081,724,821</td>
      <td align="right">7,146,734</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000016</td>
      <td align="right">0.000060</td>
      <td align="right">0.000033</td>
      <td align="right">0.0082</td>
      <td align="right">0.0379</td>
      <td align="right">0.0302</td>
      <td align="right">0.19</td>
      <td align="right">0.14</td>
      <td align="right">0.14</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">4,558,589,488</td>
      <td align="right">3,377,751,794</td>
      <td align="right">2,673,632,804</td>
      <td align="right">910,378,476</td>
      <td align="right">1,470,253,974</td>
      <td align="right">881,767,575</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">0.000017</td>
      <td align="right">0.000025</td>
      <td align="right">0.000024</td>
      <td align="right">0.0086</td>
      <td align="right">0.0150</td>
      <td align="right">0.0170</td>
      <td align="right">0.51</td>
      <td align="right">0.54</td>
      <td align="right">0.18</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,354,308,363</td>
      <td align="right">3,039,005,505</td>
      <td align="right">3,670,135,213</td>
      <td align="right">736,242,069</td>
      <td align="right">1,020,268,181</td>
      <td align="right">712,126,460</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000010</td>
      <td align="right">0.000013</td>
      <td align="right">0.000016</td>
      <td align="right">0.0082</td>
      <td align="right">0.0320</td>
      <td align="right">0.0313</td>
      <td align="right">0.32</td>
      <td align="right">0.50</td>
      <td align="right">0.59</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,193,318,271</td>
      <td align="right">1,951,480,783</td>
      <td align="right">2,197,629,608</td>
      <td align="right">620,122,173</td>
      <td align="right">618,397,403</td>
      <td align="right">496,382,244</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000005</td>
      <td align="right">0.000010</td>
      <td align="right">0.000009</td>
      <td align="right">0.0099</td>
      <td align="right">0.0362</td>
      <td align="right">0.0351</td>
      <td align="right">0.81</td>
      <td align="right">1.00</td>
      <td align="right">0.39</td>
    </tr>
    <tr>
      <td align="center">1D0R</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">2,196,334,088</td>
      <td align="right">1,352,780,710</td>
      <td align="right">1,443,349,943</td>
      <td align="right">406,121,146</td>
      <td align="right">451,189,111</td>
      <td align="right">335,359,084</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000003</td>
      <td align="right">0.000012</td>
      <td align="right">0.000008</td>
      <td align="right">0.0093</td>
      <td align="right">0.0415</td>
      <td align="right">0.0358</td>
      <td align="right">1.49</td>
      <td align="right">1.59</td>
      <td align="right">0.52</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">33,476,254,047</td>
      <td align="right">4,387,457,535</td>
      <td align="right">18,748,339,985</td>
      <td align="right">369,569,985</td>
      <td align="right">400,834,864</td>
      <td align="right">267,525,138</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.000004</td>
      <td align="right">0.000006</td>
      <td align="right">0.000004</td>
      <td align="right">0.0085</td>
      <td align="right">0.0279</td>
      <td align="right">0.0148</td>
      <td align="right">1.83</td>
      <td align="right">2.54</td>
      <td align="right">0.43</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">2,387,110,567</td>
      <td align="right">671,736,004</td>
      <td align="right">850,199,837</td>
      <td align="right">340,825,814</td>
      <td align="right">214,924,967</td>
      <td align="right">194,872,383</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.000002</td>
      <td align="right">0.000006</td>
      <td align="right">0.000005</td>
      <td align="right">0.0079</td>
      <td align="right">0.0354</td>
      <td align="right">0.0389</td>
      <td align="right">5.51</td>
      <td align="right">5.48</td>
      <td align="right">3.39</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 1.0 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 2.0 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 13$ was used for *i*BP, whereas $|T_i^\pm| = 5$ was used for both *i*ABP and *i*TBP.

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
      <td align="center">1TOS</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">7,450,921,612</td>
      <td align="right">2,558,460,994</td>
      <td align="right">3,408,644,997</td>
      <td align="right">594,292,708</td>
      <td align="right">573,821,503</td>
      <td align="right">585,513,012</td>
      <td align="right">3</td>
      <td align="right">5</td>
      <td align="right">3</td>
      <td align="right">0.000025</td>
      <td align="right">0.000054</td>
      <td align="right">0.000061</td>
      <td align="right">0.0078</td>
      <td align="right">0.0328</td>
      <td align="right">0.0411</td>
      <td align="right">1.31</td>
      <td align="right">1.24</td>
      <td align="right">0.18</td>
    </tr>
    <tr>
      <td align="center">1UAO</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">114.47</td>
      <td align="right">17,508,149,779</td>
      <td align="right">2,681,367,178</td>
      <td align="right">20,923,556</td>
      <td align="right">635,189,944</td>
      <td align="right">625,241,100</td>
      <td align="right">1,429,820</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000032</td>
      <td align="right">0.000060</td>
      <td align="right">0.000049</td>
      <td align="right">0.0125</td>
      <td align="right">0.0463</td>
      <td align="right">0.0284</td>
      <td align="right">0.46</td>
      <td align="right">0.30</td>
      <td align="right">0.24</td>
    </tr>
    <tr>
      <td align="center">1KUW</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">52</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,794.01</td>
      <td align="right">7,844,481,367</td>
      <td align="right">1,600,341,636</td>
      <td align="right">110,525,800</td>
      <td align="right">641,565,019</td>
      <td align="right">635,689,260</td>
      <td align="right">25,255,766</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000019</td>
      <td align="right">0.000046</td>
      <td align="right">0.000046</td>
      <td align="right">0.0078</td>
      <td align="right">0.0350</td>
      <td align="right">0.0315</td>
      <td align="right">0.46</td>
      <td align="right">0.49</td>
      <td align="right">0.18</td>
    </tr>
    <tr>
      <td align="center">1ID6</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,473,227,467</td>
      <td align="right">1,427,190,748</td>
      <td align="right">1,874,125,016</td>
      <td align="right">405,833,277</td>
      <td align="right">406,781,137</td>
      <td align="right">389,740,860</td>
      <td align="right">2</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000026</td>
      <td align="right">0.000025</td>
      <td align="right">0.000026</td>
      <td align="right">0.0110</td>
      <td align="right">0.0386</td>
      <td align="right">0.0402</td>
      <td align="right">0.70</td>
      <td align="right">0.51</td>
      <td align="right">0.28</td>
    </tr>
    <tr>
      <td align="center">1DNG</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,599,865,390</td>
      <td align="right">1,511,333,187</td>
      <td align="right">2,578,407,703</td>
      <td align="right">406,696,452</td>
      <td align="right">405,440,290</td>
      <td align="right">377,010,934</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000015</td>
      <td align="right">0.000027</td>
      <td align="right">0.000023</td>
      <td align="right">0.0077</td>
      <td align="right">0.0296</td>
      <td align="right">0.0302</td>
      <td align="right">0.84</td>
      <td align="right">0.73</td>
      <td align="right">0.21</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,587,960,232</td>
      <td align="right">1,107,528,132</td>
      <td align="right">1,800,390,724</td>
      <td align="right">412,613,442</td>
      <td align="right">408,735,648</td>
      <td align="right">392,526,888</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">2</td>
      <td align="right">0.000010</td>
      <td align="right">0.000017</td>
      <td align="right">0.000023</td>
      <td align="right">0.0099</td>
      <td align="right">0.0102</td>
      <td align="right">0.0211</td>
      <td align="right">0.95</td>
      <td align="right">0.89</td>
      <td align="right">0.44</td>
    </tr>
    <tr>
      <td align="center">1DU1</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,257,790,514</td>
      <td align="right">1,060,362,648</td>
      <td align="right">2,019,475,063</td>
      <td align="right">202,058,902</td>
      <td align="right">250,487,617</td>
      <td align="right">225,223,502</td>
      <td align="right">3</td>
      <td align="right">4</td>
      <td align="right">6</td>
      <td align="right">0.000009</td>
      <td align="right">0.000014</td>
      <td align="right">0.000015</td>
      <td align="right">0.0082</td>
      <td align="right">0.0293</td>
      <td align="right">0.0326</td>
      <td align="right">4.13</td>
      <td align="right">2.54</td>
      <td align="right">1.53</td>
    </tr>
    <tr>
      <td align="center">1DPK</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,601,131,365</td>
      <td align="right">677,659,205</td>
      <td align="right">1,177,552,585</td>
      <td align="right">272,434,486</td>
      <td align="right">264,801,886</td>
      <td align="right">271,937,917</td>
      <td align="right">3</td>
      <td align="right">4</td>
      <td align="right">3</td>
      <td align="right">0.000012</td>
      <td align="right">0.000015</td>
      <td align="right">0.000012</td>
      <td align="right">0.0084</td>
      <td align="right">0.0314</td>
      <td align="right">0.0342</td>
      <td align="right">1.96</td>
      <td align="right">1.14</td>
      <td align="right">0.98</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,244,995,823</td>
      <td align="right">951,973,672</td>
      <td align="right">1,914,725,324</td>
      <td align="right">284,372,358</td>
      <td align="right">276,568,017</td>
      <td align="right">265,315,143</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000009</td>
      <td align="right">0.000016</td>
      <td align="right">0.000011</td>
      <td align="right">0.0086</td>
      <td align="right">0.0329</td>
      <td align="right">0.0313</td>
      <td align="right">1.37</td>
      <td align="right">1.68</td>
      <td align="right">0.78</td>
    </tr>
    <tr>
      <td align="center">1CKZ</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,287,202,443</td>
      <td align="right">979,088,276</td>
      <td align="right">1,367,336,864</td>
      <td align="right">204,991,083</td>
      <td align="right">201,555,737</td>
      <td align="right">195,028,421</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">3</td>
      <td align="right">0.000005</td>
      <td align="right">0.000010</td>
      <td align="right">0.000007</td>
      <td align="right">0.0081</td>
      <td align="right">0.0157</td>
      <td align="right">0.0149</td>
      <td align="right">7.92</td>
      <td align="right">5.83</td>
      <td align="right">3.42</td>
    </tr>
    <tr>
      <td align="center">1LFC</td>
      <td align="right">103</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">320,960,806,752</td>
      <td align="right">34,002,313,275</td>
      <td align="right">21,199,975,683</td>
      <td align="right">0</td>
      <td align="right">16</td>
      <td align="right">35,115,022</td>
      <td align="right">0</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">---</td>
      <td align="right">0.000007</td>
      <td align="right">0.000009</td>
      <td align="right">---</td>
      <td align="right">0.0159</td>
      <td align="right">0.0249</td>
      <td align="right">---</td>
      <td align="right">3.36</td>
      <td align="right">0.82</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,370,188,202</td>
      <td align="right">731,790,271</td>
      <td align="right">1,101,976,292</td>
      <td align="right">207,537,022</td>
      <td align="right">200,785,598</td>
      <td align="right">199,536,361</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000005</td>
      <td align="right">0.000011</td>
      <td align="right">0.000011</td>
      <td align="right">0.0086</td>
      <td align="right">0.0330</td>
      <td align="right">0.0371</td>
      <td align="right">1.54</td>
      <td align="right">1.21</td>
      <td align="right">0.81</td>
    </tr>
    <tr>
      <td align="center">1HO0</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">1,257,836,986</td>
      <td align="right">477,613,810</td>
      <td align="right">1,437,863,507</td>
      <td align="right">165,762,250</td>
      <td align="right">147,029,070</td>
      <td align="right">139,115,028</td>
      <td align="right">2</td>
      <td align="right">4</td>
      <td align="right">4</td>
      <td align="right">0.000004</td>
      <td align="right">0.000007</td>
      <td align="right">0.000008</td>
      <td align="right">0.0078</td>
      <td align="right">0.0292</td>
      <td align="right">0.0523</td>
      <td align="right">8.68</td>
      <td align="right">7.31</td>
      <td align="right">5.44</td>
    </tr>
    <tr>
      <td align="center">1MMC</td>
      <td align="right">95</td>
      <td align="right">97</td>
      <td align="right">97</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">385,792,113,312</td>
      <td align="right">28,243,865,993</td>
      <td align="right">36,398,676,579</td>
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
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">2,216,492,740</td>
      <td align="right">533,418,857</td>
      <td align="right">715,780,421</td>
      <td align="right">148,437,615</td>
      <td align="right">147,343,409</td>
      <td align="right">147,334,111</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000003</td>
      <td align="right">0.000008</td>
      <td align="right">0.000008</td>
      <td align="right">0.0098</td>
      <td align="right">0.0380</td>
      <td align="right">0.0362</td>
      <td align="right">2.21</td>
      <td align="right">1.35</td>
      <td align="right">0.72</td>
    </tr>
    <tr>
      <td align="center">1ZWD</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">951,782,231</td>
      <td align="right">365,435,889</td>
      <td align="right">646,612,578</td>
      <td align="right">118,433,552</td>
      <td align="right">113,200,735</td>
      <td align="right">113,370,595</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">3</td>
      <td align="right">0.000003</td>
      <td align="right">0.000004</td>
      <td align="right">0.000004</td>
      <td align="right">0.0078</td>
      <td align="right">0.0172</td>
      <td align="right">0.0227</td>
      <td align="right">5.49</td>
      <td align="right">5.47</td>
      <td align="right">2.95</td>
    </tr>
    <tr>
      <td align="center">1D1H</td>
      <td align="right">70</td>
      <td align="right">70</td>
      <td align="right">177</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">433,661,571,587</td>
      <td align="right">39,761,307,444</td>
      <td align="right">1,276,783,990</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">112,882,600</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">2</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.000003</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.0124</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.46</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">4,702,748,492</td>
      <td align="right">747,520,500</td>
      <td align="right">4,071,584,111</td>
      <td align="right">117,575,564</td>
      <td align="right">107,980,730</td>
      <td align="right">93,990,718</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.000005</td>
      <td align="right">0.000005</td>
      <td align="right">0.000006</td>
      <td align="right">0.0078</td>
      <td align="right">0.0312</td>
      <td align="right">0.0174</td>
      <td align="right">4.32</td>
      <td align="right">3.36</td>
      <td align="right">0.97</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">614,961,691</td>
      <td align="right">337,098,972</td>
      <td align="right">523,265,953</td>
      <td align="right">97,746,186</td>
      <td align="right">94,667,459</td>
      <td align="right">95,104,496</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.000003</td>
      <td align="right">0.000004</td>
      <td align="right">0.000004</td>
      <td align="right">0.0095</td>
      <td align="right">0.0291</td>
      <td align="right">0.0282</td>
      <td align="right">9.33</td>
      <td align="right">7.27</td>
      <td align="right">4.32</td>
    </tr>
    <tr>
      <td align="center">1BA4</td>
      <td align="right">100</td>
      <td align="right">100</td>
      <td align="right">202</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">432,126,906,497</td>
      <td align="right">26,072,523,150</td>
      <td align="right">447,085,332</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">96,369,735</td>
      <td align="right">0</td>
      <td align="right">0</td>
      <td align="right">2</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.000003</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">0.0342</td>
      <td align="right">---</td>
      <td align="right">---</td>
      <td align="right">1.14</td>
    </tr>
    <tr>
      <td align="center">1C56</td>
      <td align="right">175</td>
      <td align="right">177</td>
      <td align="right">178</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">289,557,642,742</td>
      <td align="right">19,914,769,446</td>
      <td align="right">18,127,818,674</td>
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
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">484.96</td>
      <td align="right">15,085,901,811</td>
      <td align="right">3,341,754,860</td>
      <td align="right">71,120,093</td>
      <td align="right">1,108,023,599</td>
      <td align="right">1,096,647,427</td>
      <td align="right">14,520,145</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000018</td>
      <td align="right">0.000053</td>
      <td align="right">0.000037</td>
      <td align="right">0.0078</td>
      <td align="right">0.0427</td>
      <td align="right">0.0264</td>
      <td align="right">0.63</td>
      <td align="right">0.28</td>
      <td align="right">0.23</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">8,119,634,511</td>
      <td align="right">2,532,741,862</td>
      <td align="right">3,975,367,133</td>
      <td align="right">814,659,314</td>
      <td align="right">798,580,716</td>
      <td align="right">839,172,820</td>
      <td align="right">3</td>
      <td align="right">2</td>
      <td align="right">4</td>
      <td align="right">0.000010</td>
      <td align="right">0.000031</td>
      <td align="right">0.000032</td>
      <td align="right">0.0082</td>
      <td align="right">0.0466</td>
      <td align="right">0.0465</td>
      <td align="right">1.34</td>
      <td align="right">0.90</td>
      <td align="right">0.34</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">4,346,265,963</td>
      <td align="right">2,129,612,830</td>
      <td align="right">5,225,925,858</td>
      <td align="right">602,189,140</td>
      <td align="right">428,722,286</td>
      <td align="right">526,109,862</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000009</td>
      <td align="right">0.000017</td>
      <td align="right">0.000014</td>
      <td align="right">0.0098</td>
      <td align="right">0.0301</td>
      <td align="right">0.0305</td>
      <td align="right">1.79</td>
      <td align="right">1.59</td>
      <td align="right">0.86</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,094,517,879</td>
      <td align="right">1,360,697,844</td>
      <td align="right">1,625,337,036</td>
      <td align="right">327,408,483</td>
      <td align="right">373,416,646</td>
      <td align="right">298,449,639</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000004</td>
      <td align="right">0.000010</td>
      <td align="right">0.000010</td>
      <td align="right">0.0094</td>
      <td align="right">0.0417</td>
      <td align="right">0.0419</td>
      <td align="right">0.70</td>
      <td align="right">1.22</td>
      <td align="right">0.88</td>
    </tr>
    <tr>
      <td align="center">1D0R</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">2,022,356,818</td>
      <td align="right">1,114,845,386</td>
      <td align="right">1,374,670,093</td>
      <td align="right">250,559,418</td>
      <td align="right">274,460,477</td>
      <td align="right">287,639,348</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000006</td>
      <td align="right">0.000008</td>
      <td align="right">0.000010</td>
      <td align="right">0.0091</td>
      <td align="right">0.0453</td>
      <td align="right">0.0393</td>
      <td align="right">2.10</td>
      <td align="right">1.59</td>
      <td align="right">1.31</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">8,822,008,603</td>
      <td align="right">1,196,023,261</td>
      <td align="right">34,351,253,082</td>
      <td align="right">209,459,297</td>
      <td align="right">217,273,281</td>
      <td align="right">73,737,580</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">5</td>
      <td align="right">0.000003</td>
      <td align="right">0.000006</td>
      <td align="right">0.000007</td>
      <td align="right">0.0076</td>
      <td align="right">0.0356</td>
      <td align="right">0.0166</td>
      <td align="right">2.11</td>
      <td align="right">4.57</td>
      <td align="right">0.83</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">2,321,290,868</td>
      <td align="right">583,215,193</td>
      <td align="right">1,127,006,040</td>
      <td align="right">197,011,345</td>
      <td align="right">158,191,927</td>
      <td align="right">191,392,611</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000003</td>
      <td align="right">0.000004</td>
      <td align="right">0.000004</td>
      <td align="right">0.0091</td>
      <td align="right">0.0475</td>
      <td align="right">0.0486</td>
      <td align="right">6.95</td>
      <td align="right">5.88</td>
      <td align="right">6.42</td>
    </tr>
  </tbody>
</table>

## $\varepsilon_{\mathrm{short}} = 2.0 \ \mathrm{Angstroms}$, $\varepsilon_{\mathrm{long}} = 3.0 \ \mathrm{Angstroms}$

For this case, $|T_i^\pm| = 13$ for *i*BP, $|T_i^\pm| = 9$ for *i*ABP, and $|T_i^\pm| = 7$ for *i*TBP.

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
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">10,354.74</td>
      <td align="right">21,976,804,498</td>
      <td align="right">3,049,768,060</td>
      <td align="right">932,601,795</td>
      <td align="right">1,390,520,705</td>
      <td align="right">1,218,603,305</td>
      <td align="right">236,296,063</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000025</td>
      <td align="right">0.000058</td>
      <td align="right">0.000052</td>
      <td align="right">0.0085</td>
      <td align="right">0.0309</td>
      <td align="right">0.0317</td>
      <td align="right">0.53</td>
      <td align="right">0.69</td>
      <td align="right">0.15</td>
    </tr>
    <tr>
      <td align="center">1O53</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">77</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,266,310,182</td>
      <td align="right">2,340,760,030</td>
      <td align="right">3,477,336,773</td>
      <td align="right">648,534,780</td>
      <td align="right">979,208,683</td>
      <td align="right">718,079,299</td>
      <td align="right">2</td>
      <td align="right">3</td>
      <td align="right">4</td>
      <td align="right">0.000008</td>
      <td align="right">0.000028</td>
      <td align="right">0.000017</td>
      <td align="right">0.0078</td>
      <td align="right">0.0267</td>
      <td align="right">0.0233</td>
      <td align="right">1.33</td>
      <td align="right">1.46</td>
      <td align="right">0.64</td>
    </tr>
    <tr>
      <td align="center">1HO7</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">102</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">4,786,507,757</td>
      <td align="right">2,914,849,851</td>
      <td align="right">6,600,498,794</td>
      <td align="right">433,687,953</td>
      <td align="right">541,785,666</td>
      <td align="right">615,748,242</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000009</td>
      <td align="right">0.000010</td>
      <td align="right">0.000014</td>
      <td align="right">0.0075</td>
      <td align="right">0.0293</td>
      <td align="right">0.0299</td>
      <td align="right">1.59</td>
      <td align="right">1.84</td>
      <td align="right">1.09</td>
    </tr>
    <tr>
      <td align="center">1A11</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">127</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">7,609,960,158</td>
      <td align="right">1,621,674,820</td>
      <td align="right">1,815,959,499</td>
      <td align="right">457,540,636</td>
      <td align="right">402,317,568</td>
      <td align="right">378,511,078</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000005</td>
      <td align="right">0.000008</td>
      <td align="right">0.000011</td>
      <td align="right">0.0083</td>
      <td align="right">0.0423</td>
      <td align="right">0.0399</td>
      <td align="right">0.99</td>
      <td align="right">1.01</td>
      <td align="right">1.46</td>
    </tr>
    <tr>
      <td align="center">1D0R</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">152</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">6,912,514,560</td>
      <td align="right">9,548,302,561</td>
      <td align="right">1,218,968,742</td>
      <td align="right">307,951,609</td>
      <td align="right">199,296,211</td>
      <td align="right">285,041,117</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000002</td>
      <td align="right">0.000010</td>
      <td align="right">0.000009</td>
      <td align="right">0.0075</td>
      <td align="right">0.0443</td>
      <td align="right">0.0316</td>
      <td align="right">1.82</td>
      <td align="right">3.03</td>
      <td align="right">2.37</td>
    </tr>
    <tr>
      <td align="center">1SPF</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">177</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">22,393,410,654</td>
      <td align="right">1,426,805,788</td>
      <td align="right">5,991,394,909</td>
      <td align="right">250,012,600</td>
      <td align="right">240,388,469</td>
      <td align="right">177,494,721</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">2</td>
      <td align="right">0.000004</td>
      <td align="right">0.000006</td>
      <td align="right">0.000007</td>
      <td align="right">0.0076</td>
      <td align="right">0.0315</td>
      <td align="right">0.0258</td>
      <td align="right">3.42</td>
      <td align="right">2.09</td>
      <td align="right">2.20</td>
    </tr>
    <tr>
      <td align="center">1AML</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">202</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">43,200.00</td>
      <td align="right">3,378,241,992</td>
      <td align="right">768,364,829</td>
      <td align="right">994,693,633</td>
      <td align="right">190,970,663</td>
      <td align="right">191,352,677</td>
      <td align="right">167,670,199</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">1</td>
      <td align="right">0.000001</td>
      <td align="right">0.000005</td>
      <td align="right">0.000005</td>
      <td align="right">0.0078</td>
      <td align="right">0.0461</td>
      <td align="right">0.0672</td>
      <td align="right">6.76</td>
      <td align="right">7.71</td>
      <td align="right">7.07</td>
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
