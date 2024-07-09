%% global error

A = load('data/LeGresley_2508.mat');
%LeGresley_2508.mat
%LeGresley_4908.mat
A =  A.Problem.A;
%% 'data/LeGresley_2508.mat'
%% mix precision
u1 = precision('d');
u2 = precision('s');
u3 = precision('h');
u4 = precision('b');
u5 = precision('q52');

u_chain = prec_chain(u1, u2, u3, u4, u5);

vareps = [u2.u, u3.u, u4.u, u5.u, 100*u5.u]

depth = 5;
err_list = [];
err_bound_list = [];
for i = 1:size(vareps, 2)
    
    eps = vareps(i);
    aphA = amphodlr(u_chain, A, 5, 20, 'svd', eps); 
    aprA = recover(aphA);
    err_list(i) = norm(aprA - A, 'fro') / norm(A, 'fro');
    err_bound_list(i) = err_bound(aphA.bottom_level, eps);
    disp([err_list(i), err_bound_list(i)]);
    disp(aphA.precIndex)
    disp('--------------------------')
end 
