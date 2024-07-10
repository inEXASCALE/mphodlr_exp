vareps = [1e-1, 1e-5, 1e-9];

A = load('data/1138_bus.mat');
A =  A.Problem.A;

u1 = precision('d');
u2 = precision('s');
u3 = precision('h');
u4 = precision('b');
u5 = precision('q52');

u_chain = prec_chain(u1, u2, u3, u4, u5);
depths = [5, 10];

m = size(depths, 2);
n = size(vareps, 2);
storage_eff = zeros(m, n);
storage_eff_ap = zeros(m, n);

for i=1:m
    for j=1:n
        d = depths(i);
        eps = vareps(i);
        hA = hodlr(A, d, 2, 'svd', eps);
        rA = recover(hA);
        
        aphA = amphodlr(u_chain, A, d, 2, 'svd', eps);
        aprA = recover(aphA);
        
        [n1, n2] = size(A);
        storage_eff(i, j) = hstorage(hA) / (n1*n2*64);
        storage_eff_ap(i, j) = hstorage(aphA) / (n1*n2*64);
    end
end
