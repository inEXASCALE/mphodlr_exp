function rev_exp_mvprod2(varargin)
    
    clear all
    disp('test 1')
    
    if nargin == 0
        n_size = 2^14;
        min_block_size = 2^6;
        DIM = 3;
        n_sample = 1;
    elseif nargin == 1
        n_size = varargin{1};
        min_block_size = 2^6;
        DIM = 3;
        n_sample = 1;
    elseif nargin == 2
        n_size = varargin{1};
        min_block_size = varargin{2};
        DIM = 3;
        n_sample = 1;
    elseif nargin == 3
        n_size = varargin{1};
        min_block_size = varargin{2};
        DIM = varargin{3};
        n_sample = 1;
    else
        n_size = varargin{1};
        min_block_size = varargin{2};
        DIM = varargin{3};
        n_sample = varargin{4};
    end
    
    %% kernel matrix 2
    rng(0)
    
    u1 = precision('d').builtin();
    u2 = precision('s').builtin();
    u3 = precision('h').builtin();
    
    u_chain = prec_chain(u1, u2, u3);
    
    depth = 999;
    sizes = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14, 2^15, 2^16];
    
    n_size = size(sizes, 2);
    
    err_back_list1  = zeros(n_size, 1);
    err_back_list2  = zeros(n_size, 1);
    ref_err_back_list  = zeros(n_size, 1);
    err_bound_list = zeros(n_size, 1);
    
    
    for i=1:n_size
        i_size = sizes(i);
        disp(i_size)
        x = unifrnd(-1, 1, i_size, DIM);
        y = unifrnd(-1, 1, i_size, DIM);
        kernel_mat = kernel2(x, y);
        
        aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', 1e-06); 

        for k=1:n_sample
            x = unifrnd(-1, 1, 1, i_size)';
            
            hb1 = mhdot(aphA, x, u2, 'dense');
            hb2 = mhdot(aphA, x, u3, 'dense');
            rhb = hdot(aphA, x, 'dense');
            
            b = kernel_mat * x;
            
            err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_bound = 2*(sqrt(2)+1)*sqrt(2^(depth + 1)+2^(depth-1))*i_size;

            err_back_list1(i) = err_back_list1(i) + err_back1;
            err_back_list2(i) = err_back_list2(i) + err_back2;
            ref_err_back_list(i) = ref_err_back_list(i) + ref_err_back;
            err_bound_list(i) = err_bound_list(i) + err_bound;
        end

    end
    
    save("results/rev_prod2_err_back1.mat", 'err_back_list1');
    save("results/rev_prod2_err_back2.mat", 'err_back_list2');
    save("results/rev_prod2_ref_err_back.mat", 'ref_err_back_list');
    save("results/rev_prod2_bound.mat", 'err_bound_list');
    
    
    %% kernel matrix 3
    disp('test 2');
    rng(0)
    
    u1 = precision('d').builtin();
    u2 = precision('s').builtin();
    u3 = precision('h').builtin();
    
    u_chain = prec_chain(u1, u2, u3);
    
    depth = 999;
    sizes = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14, 2^15, 2^16];
    
    n_size = size(sizes, 2);
    
    err_back_list1  = zeros(n_size, 1);
    err_back_list2  = zeros(n_size, 1);
    ref_err_back_list  = zeros(n_size, 1);
    err_bound_list = zeros(n_size, 1);
    
    for i=1:n_size
        i_size = sizes(i);
        disp(i_size)
        x = unifrnd(-1, 1, i_size, DIM);
        y = unifrnd(-1, 1, i_size, DIM);
        kernel_mat = kernel2(x, y);

        aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', 1e-06); 

        for k=1:n_sample
            x = unifrnd(-1, 1, 1, i_size)';
            
            hb1 = mhdot(aphA, x, u2, 'dense');
            hb2 = mhdot(aphA, x, u3, 'dense');
            rhb = hdot(aphA, x, 'dense');
            
            b = kernel_mat * x;
            
            err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_bound = 2*(sqrt(2)+1)*sqrt(2^(depth + 1)+2^(depth-1))*i_size;

            err_back_list1(i) = err_back_list1(i) + err_back1;
            err_back_list2(i) = err_back_list2(i) + err_back2;
            ref_err_back_list(i) = ref_err_back_list(i) + ref_err_back;
            err_bound_list(i) = err_bound_list(i) + err_bound;
        end

    end
    
    save("results/rev_prod3_err_back1.mat", 'err_back_list1');
    save("results/rev_prod3_err_back2.mat", 'err_back_list2');
    save("results/rev_prod3_ref_err_back.mat", 'ref_err_back_list');
    save("results/rev_prod3_bound.mat", 'err_bound_list');
    
    
    %% kernel matrix 4
    disp("test 3")
    
    rng(0)
    
    u1 = precision('d').builtin();
    u2 = precision('s').builtin();
    u3 = precision('h').builtin();
    
    u_chain = prec_chain(u1, u2, u3);
    
    depth = 999;
    sizes = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14, 2^15, 2^16];
    n_size = size(sizes, 2);
    
    err_back_list1  = zeros(n_size, 1);
    err_back_list2  = zeros(n_size, 1);
    ref_err_back_list  = zeros(n_size, 1);
    err_bound_list = zeros(n_size, 1);
    
    for i=1:n_size
        i_size = sizes(i);
        disp(i_size)
        x = unifrnd(-1, 1, i_size, DIM);
        y = unifrnd(-1, 1, i_size, DIM);
        kernel_mat = kernel2(x, y);
        
        aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', 1e-06); 

        for k=1:n_sample
            x = unifrnd(-1, 1, 1, i_size)';
            
            hb1 = mhdot(aphA, x, u2, 'dense');
            hb2 = mhdot(aphA, x, u3, 'dense');
            rhb = hdot(aphA, x, 'dense');
            
            b = kernel_mat * x;
            
            err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_bound = 2*(sqrt(2)+1)*sqrt(2^(depth + 1)+2^(depth-1))*i_size;

            err_back_list1(i) = err_back_list1(i) + err_back1;
            err_back_list2(i) = err_back_list2(i) + err_back2;
            ref_err_back_list(i) = ref_err_back_list(i) + ref_err_back;
            err_bound_list(i) = err_bound_list(i) + err_bound;
        end
    
    end
    
    save("results/rev_prod4_err_back1.mat", 'err_back_list1');
    save("results/rev_prod4_err_back2.mat", 'err_back_list2');
    save("results/rev_prod4_ref_err_back.mat", 'ref_err_back_list');
    save("results/rev_prod4_bound.mat", 'err_bound_list');
end
