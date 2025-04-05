# mphodlr_exp

This repository contains the fully reproducible experimental code for the paper “Mixed precision HODLR matrices” [1]. 


Download
------------
``mphodlr_exp`` contains large files storage. To download the full repository, please ensure ``git lfs`` is properly set up (see [here](https://git-lfs.com/) for details) and use the following commands:

```
GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/inEXASCALE/mphodlr_exp.git
cd mphodlr_exp
git lfs pull
```

Full repository containning all code and data can also be obtained in [here](https://zenodo.org/records/13335429). 



Requirements
------------

Due to large files storage, the software `@precision`, `@hodlr`, and `@ampholdr`, which can be downloaded from [https://github.com/chenxinye/mhodlr](https://github.com/chenxinye/mhodlr).
MATLAB 2024a or newer (with Statistics and Machine Learning Toolbox) is required. The experimental code was simulated in terms of the version [Commit 706333a](https://github.com/chenxinye/mhodlr/tree/706333a14876153f59ba1b3287ce60689ac7427c). 



Instruction
------------

Detailed guidance is referred to [index](https://raw.githubusercontent.com/inEXASCALE/mphodlr_exp/main/SMindex.html):

* The scripts ``plot_saylr3.m`` and ``plot_LeGresley.m`` are used to generate [Fig. 4.1, 1].

* The scripts ``exp_rcerr.m`` and ``plot_exp_rcerr.m`` are used to generate the results for [Fig. 5.1, 1] (run in order).

* The scripts ``exp_mvprod.m`` and ``plot_exp_mvprod.m`` are used to generate the results for [Fig. 5.2, 1] (run in order).

* The scripts ``exp_lu.m`` and ``plot_exp_lu.m`` are used to generate the results for [Fig. 5.3, 1] (run in order).

* The scripts ``exp_storage.m`` and ``plot_exp_storage.m`` are used to generate the results for [Fig. 5.4, 1] (run in order).


_All test matrices stored in the folder ``data`` are from [Amestoy et al.](https://gitlab.com/mgerest/mixedblr) [2] and SuiteSparse collection [4]. The low precision arithmetics are simulated by chop [3]._
One can perform all experiments at one go by running the command ``run_all``.
The generated results and figures are separately stored in ``results`` and ``figures``, respectively. 



References
------------


[1] C. Erin, X. Chen and X. Liu, Mixed precision HODLR matrices, arXiv:2407.21637, (2024), https://doi.org/10.48550/arXiv.2407.21637.

[2] P. Amestoy, O. Boiteau, A. Buttari, M. Gerest, F. J´ez´equel, J.-Y. L’Excellent, and
T. Mary, Mixed precision low-rank approximations and their application to block lowrank
LU factorization, IMA J. Numer. Anal., 43 (2022), pp. 2198–2227, https://doi.org/10.1093/imanum/drac037.

[3] N. J. Higham and S. Pranesh, Simulating low precision floating-point arithmetic, SIAM J. Sci. Comput., 41 (2019), pp. C585–C602, https://doi.org/10.1137/19M1251308.

[4] T. A. Davis and Y. Hu, The University of Florida Sparse Matrix Collection, ACM Trans. Math. Software, 38 (2011), https://doi.org/10.1145/2049662.2049663.
