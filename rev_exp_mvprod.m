function rev_exp_mvprod()
    
    clear all
    disp('test 1')
    min_block_size = 2^6;
    n_size = 2^10;

    %% kernel matrix 2
    rng(0)
    DIM = 3;

    n_sample = 1;
    x = unifrnd(-1, 1, n_size, DIM);
    y = unifrnd(-1, 1, n_size, DIM);
    kernel_mat = kernel2(x, y);
    
    rng(42);
    
    u1 = precision('d');
    u2 = precision('s');
    u3 = precision('h');
    u4 = precision('b');
    u5 = precision('q52');
    
    u_chain = prec_chain(u1, u2, u3, u4, u5);
    
    depths = [2, 5, 8];
    vareps = [1e-14, 1e-12, 1e-10, 1e-08, 1e-06, 1e-04, 1e-02];
    
    n_d = size(depths, 2);
    n_eps = size(vareps, 2);
    
    err_back_list1  = zeros(n_eps, n_d);
    err_back_list2  = zeros(n_eps, n_d);
    ref_err_back_list  = zeros(n_eps, n_d);
    err_bound_list = zeros(n_eps, n_d);
    
    
    for i=1:n_eps
        for j=1:n_d
            eps = vareps(i);
            depth = depths(j);
            
            aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', eps); 
    
            for k=1:n_sample
                x = unifrnd(-1, 1, 1, n_size)';;
                
                hb1 = mhdot(aphA, x, u2, 'dense');
                hb2 = mhdot(aphA, x, u4, 'dense');
                rhb = hdot(aphA, x, 'dense');
                
                b = kernel_mat * x;
                
                err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                err_bound = 2*(sqrt(2)+1)*sqrt(2^(depth + 1)+2^(depth-1))*eps;
    
                err_back_list1(i, j) = err_back_list1(i, j) + err_back1;
                err_back_list2(i, j) = err_back_list2(i, j) + err_back2;
                ref_err_back_list(i, j) = ref_err_back_list(i, j) + ref_err_back;
                err_bound_list(i, j) = err_bound_list(i, j) + err_bound;
            end
        end
    end
    
    save("results/rev_prod2_err_back1.mat", 'err_back_list1');
    save("results/rev_prod2_err_back2.mat", 'err_back_list2');
    save("results/rev_prod2_ref_err_back.mat", 'ref_err_back_list');
    save("results/rev_prod2_bound.mat", 'err_bound_list');
    
    
    %% kernel matrix 3
    clear all
    disp('test 2');
    min_block_size = 2^6;
    n_size = 2^10;
    
    DIM = 3;
    rng(0)
    
    n_sample = 1
    x = unifrnd(-1, 1, n_size, DIM);
    y = unifrnd(-1, 1, n_size, DIM);
    kernel_mat = kernel3(x, y);
    
    rng(42);
    
    u1 = precision('d');
    u2 = precision('s');
    u3 = precision('h');
    u4 = precision('b');
    u5 = precision('q52');
    
    u_chain = prec_chain(u1, u2, u3, u4, u5);
    
    depths = [2, 5, 8];
    vareps = [1e-14, 1e-12, 1e-10, 1e-08, 1e-06, 1e-04, 1e-02];
    
    n_d = size(depths, 2);
    n_eps = size(vareps, 2);
    
    err_back_list1  = zeros(n_eps, n_d);
    err_back_list2  = zeros(n_eps, n_d);
    ref_err_back_list  = zeros(n_eps, n_d);
    err_bound_list = zeros(n_eps, n_d);
    
    for i=1:n_eps
        for j=1:n_d
            eps = vareps(i);
            depth = depths(j);
            
            aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', eps); 
    
            for k=1:n_sample
                x = unifrnd(-1, 1, 1, n_size)';
                
                hb1 = mhdot(aphA, x, u2, 'dense');
                hb2 = mhdot(aphA, x, u4, 'dense');
                rhb = hdot(aphA, x, 'dense');
                
                b = kernel_mat * x;
                
                err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                err_bound = 2*(sqrt(2)+1)*sqrt(2^(depth + 1)+2^(depth-1))*eps;
    
                err_back_list1(i, j) = err_back_list1(i, j) + err_back1;
                err_back_list2(i, j) = err_back_list2(i, j) + err_back2;
                ref_err_back_list(i, j) = ref_err_back_list(i, j) + ref_err_back;
                err_bound_list(i, j) = err_bound_list(i, j) + err_bound;
            end
        end
    end
    
    save("results/rev_prod3_err_back1.mat", 'err_back_list1');
    save("results/rev_prod3_err_back2.mat", 'err_back_list2');
    save("results/rev_prod3_ref_err_back.mat", 'ref_err_back_list');
    save("results/rev_prod3_bound.mat", 'err_bound_list');
    
    
    %% kernel matrix 4
    clear all
    disp("test 3")
    min_block_size = 2^6;
    n_size = 2^10;
    
    rng(0)
    DIM = 3;
    n_sample = 1
    x = unifrnd(-1, 1, n_size, DIM);
    y = unifrnd(-1, 1, n_size, DIM);
    kernel_mat = kernel4(x, y);
    
    rng(42);
    
    u1 = precision('d');
    u2 = precision('s');
    u3 = precision('h');
    u4 = precision('b');
    u5 = precision('q52');
    
    u_chain = prec_chain(u1, u2, u3, u4, u5);
    
    depths = [2, 5, 8];
    vareps = [1e-14, 1e-12, 1e-10, 1e-08, 1e-06, 1e-04, 1e-02];
    
    n_d = size(depths, 2);
    n_eps = size(vareps, 2);
    
    err_back_list1  = zeros(n_eps, n_d);
    err_back_list2  = zeros(n_eps, n_d);
    ref_err_back_list  = zeros(n_eps, n_d);
    err_bound_list = zeros(n_eps, n_d);
    
    for i=1:n_eps
        for j=1:n_d
            eps = vareps(i);
            depth = depths(j);
            
            aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', eps); 
    
            for k=1:n_sample
                x = unifrnd(-1, 1, 1, n_size)';
                
                hb1 = mhdot(aphA, x, u2, 'dense');
                hb2 = mhdot(aphA, x, u4, 'dense');
                rhb = hdot(aphA, x, 'dense');
                
                b = kernel_mat * x;
                
                err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
                err_bound = 2*(sqrt(2)+1)*sqrt(2^(depth + 1)+2^(depth-1))*eps;
    
                err_back_list1(i, j) = err_back_list1(i, j) + err_back1;
                err_back_list2(i, j) = err_back_list2(i, j) + err_back2;
                ref_err_back_list(i, j) = ref_err_back_list(i, j) + ref_err_back;
                err_bound_list(i, j) = err_bound_list(i, j) + err_bound;
            end
        end
    end
    
    save("results/rev_prod4_err_back1.mat", 'err_back_list1');
    save("results/rev_prod4_err_back2.mat", 'err_back_list2');
    save("results/rev_prod4_ref_err_back.mat", 'ref_err_back_list');
    save("results/rev_prod4_bound.mat", 'err_bound_list');
end
