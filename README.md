# mphodlr


Instruction
------------


Experimental code for “Mixed precision HODLR matrices” [1]

* The scripts ``plot_saylr3.m`` and ``plot_LeGresley.m`` are used to generate FIG. 4.1.

* The scripts ``exp_rcerr.m`` and ``plot_exp_rcerr.m`` are used to generate results for FIG. 5.1 (run in order).

* The scripts ``exp_mvprod.m`` and ``plot_exp_mvprod.m`` are used to generate results for FIG. 5.2 (run in order).

* The scripts ``exp_lu.m`` and ``plot_exp_lu.m`` are used to generate results for FIG. 5.3 (run in order).

* The script ``exp_storage.m`` and ``plot_exp_storage.m`` are used to generate results for FIG. 5.4 (run in order).


The results and figures are separately stored in ``results`` and ``figures``, respectively. 

All data are from [Amestoy et al.](https://gitlab.com/mgerest/mixedblr) [2] and SuiteSparse collection [4], and the low-precision arithmetic is simulated by chop [3]. 

References
------------


[1] C. Erin, X. Chen and X. Liu, Mixed precision HODLR matrices, arXiv:2407.21637, (2024).

[2] P. Amestoy, O. Boiteau, A. Buttari, M. Gerest, F. J´ez´equel, J.-Y. L’Excellent, and
T. Mary, Mixed precision low-rank approximations and their application to block lowrank
LU factorization, IMA J. Numer. Anal., 43 (2022), pp. 2198–2227, https://doi.org/10.1093/imanum/drac037.

[3] N. J. Higham and S. Pranesh, Simulating low precision floating-point arithmetic, SIAM J. Sci. Comput., 41 (2019), pp. C585–C602, https://doi.org/10.1137/19M1251308.

[4] T. A. Davis and Y. Hu, The University of Florida Sparse Matrix Collection, ACM Trans. Math. Software, 38 (2011), https://doi.org/10.1145/2049662.2049663.
