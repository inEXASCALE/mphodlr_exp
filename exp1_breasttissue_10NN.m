%% global error

A = load('data/breasttissue_10NN.mat');
%LeGresley_2508.mat
%LeGresley_4908.mat
A =  A.Problem.A;
disp(size(A));
%% 'data/LeGresley_2508.mat'
%% mix precision
u1 = precision('d');
u2 = precision('s');
u3 = precision('h');
u4 = precision('b');
u5 = precision('q52');

u_chain = prec_chain(u1, u2, u3, u4, u5);

vareps = [10e-9, 10e-5, 10e-02]; % u2.u, u3.u
depths = [2, 3, 4, 5, 6, 7, 8];

n_d = size(depths, 2);
n_eps = size(vareps, 2);

err_list = zeros(n_d, n_eps);
err_list_amp = zeros(n_d, n_eps);
err_bound_list = zeros(n_d, n_eps);

for j = 1:n_d
    d = depths(j);

    for i = 1:n_eps
        eps = vareps(i);
    
        hA = hodlr(A, d, 2, 'svd', eps);
        rA = recover(hA);
        
        aphA = amphodlr(u_chain, A, d, 2, 'svd', eps); 
        aprA = recover(aphA);
    
        err_list(j, i) = norm(rA - A, 'fro') / norm(A, 'fro');
        err_list_amp(j, i) = norm(aprA - A, 'fro') / norm(A, 'fro');
        err_bound_list(j, i) = err_bound(aphA.bottom_level, eps);
    
        disp([err_list(j, i), err_list_amp(j, i), err_bound_list(j, i)]);
        disp(aphA.precIndex); 
        disp('--------------------------'); 
    end 
    disp('*******************************'); 
end

rect = [0.5, 0, 0, 0.05];
fontSize = 15;

semilogy(depths, err_list(:, 1), '-b', 'Marker', 'o', 'MarkerSize',8, 'Linewidth',2)
hold on 
semilogy(depths, err_list_amp(:, 1),'--r', 'Marker', '*', 'MarkerSize', 8, 'Linewidth',2)
hold on 
semilogy(depths, err_bound_list(:, 1),':k', 'Marker', 's',  'MarkerSize',8, 'Linewidth',2)

legend('fp64', ...
    'adptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize)
[l, s] = title('$\varepsilon$=10e-8');
set(l,'interpreter','latex');
l.FontSize = fontSize+7;
exportgraphics(gca, 'figures/breasttissue_10NN_eps=3.pdf')
hold off

semilogy(depths, err_list(:, 2), '-b', 'Marker', 'o', 'MarkerSize',8, 'Linewidth',2)
hold on 
semilogy(depths, err_list_amp(:, 2),'--r', 'Marker', '*', 'MarkerSize', 8, 'Linewidth',2)
hold on 
semilogy(depths, err_bound_list(:, 2),':k', 'Marker', 's',  'MarkerSize',8, 'Linewidth',2)

legend('fp64', ...
    'adptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize)
[l, s] = title('$\varepsilon$=10e-4');
set(l,'interpreter','latex');
l.FontSize = fontSize+7;
exportgraphics(gca, 'figures/breasttissue_10NN_eps=2.pdf');
hold off


semilogy(depths, err_list(:, 3), '-b', 'Marker', 'o', 'MarkerSize',8, 'Linewidth',2)
hold on 
semilogy(depths, err_list_amp(:, 3),'--r', 'Marker', '*', 'MarkerSize', 8, 'Linewidth',2)
hold on 
semilogy(depths, err_bound_list(:, 3),':k', 'Marker', 's',  'MarkerSize',8, 'Linewidth',2)

legend('fp64', ...
    'adptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize);
[l, s] = title('$\varepsilon$=10e-1');
set(l,'interpreter','latex');
l.FontSize = fontSize+7;
exportgraphics(gca, 'figures/breasttissue_10NN_eps=1.pdf');
hold off
