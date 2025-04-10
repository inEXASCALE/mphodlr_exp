function rev_exp_mvprod2(sfolder, varargin)
    mkdir(sfolder);
    disp('test 1')
    if nargin == 1
        min_block_size = 2^6;
        DIM = 3;
        eps = 1e-06;
        n_sample = 1;
    elseif nargin == 2
        min_block_size = varargin{1};
        DIM = 3;
        eps = 1e-06;
        n_sample = 1;
    elseif nargin == 3
        min_block_size = varargin{1};
        DIM = varargin{2};
        eps = 1e-06;
        n_sample = 1;
    elseif nargin == 4
        min_block_size = varargin{1};
        DIM = varargin{2};
        eps = varargin{3};
        n_sample = 1;
    else
        min_block_size = varargin{1};
        DIM = varargin{2};
        eps = varargin{3};
        n_sample = varargin{4};
    end
    
    %% kernel matrix 2
    rng(0)
    
    u1 = precision('d').builtin();
    u2 = precision('s').builtin();
    u3 = precision('h').builtin();
    u4 = precision('b');
    u5 = precision('q52');
    
    u_chain = prec_chain(u1, u2, u3, u4, u5);
    
    depth = 999;
    sizes = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14];
    
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
        
        aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', eps); 

        for k=1:n_sample
            x = unifrnd(-1, 1, 1, i_size)';
            
            hb1 = mhdot(aphA, x, u2, 'dense');
            hb2 = mhdot(aphA, x, u4, 'dense');
            rhb = hdot(aphA, x, 'dense');
            
            b = kernel_mat * x;
            
            err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_bound = 2*(sqrt(2)+1)*sqrt(2^(aphA.bottom_level + 1)+2^(aphA.bottom_level-1))*eps;

            err_back_list1(i) = err_back_list1(i) + err_back1;
            err_back_list2(i) = err_back_list2(i) + err_back2;
            ref_err_back_list(i) = ref_err_back_list(i) + ref_err_back;
            err_bound_list(i) = err_bound_list(i) + err_bound;
        end

    end
    
    save(strcat(sfolder, "/rev2_prod2_err_back1.mat"), 'err_back_list1');
    save(strcat(sfolder, "/rev2_prod2_err_back2.mat"), 'err_back_list2');
    save(strcat(sfolder, "/rev2_prod2_ref_err_back.mat"), 'ref_err_back_list');
    save(strcat(sfolder, "/rev2_prod2_bound.mat"), 'err_bound_list');
    
    
    %% kernel matrix 3
    disp('test 2');
    rng(0)
    
    u1 = precision('d').builtin();
    u2 = precision('s').builtin();
    u3 = precision('h').builtin();
    u4 = precision('b');
    u5 = precision('q52');
    
    u_chain = prec_chain(u1, u2, u3, u4, u5);
    
    depth = 999;
    sizes = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14];
    
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
        kernel_mat = kernel3(x, y);

        aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', eps); 

        for k=1:n_sample
            x = unifrnd(-1, 1, 1, i_size)';
            
            hb1 = mhdot(aphA, x, u2, 'dense');
            hb2 = mhdot(aphA, x, u4, 'dense');
            rhb = hdot(aphA, x, 'dense');
            
            b = kernel_mat * x;
            
            err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_bound = 2*(sqrt(2)+1)*sqrt(2^(aphA.bottom_level + 1)+2^(aphA.bottom_level-1))*eps;

            err_back_list1(i) = err_back_list1(i) + err_back1;
            err_back_list2(i) = err_back_list2(i) + err_back2;
            ref_err_back_list(i) = ref_err_back_list(i) + ref_err_back;
            err_bound_list(i) = err_bound_list(i) + err_bound;
        end

    end
    
    save(strcat(sfolder, "/rev2_prod3_err_back1.mat"), 'err_back_list1');
    save(strcat(sfolder, "/rev2_prod3_err_back2.mat"), 'err_back_list2');
    save(strcat(sfolder, "/rev2_prod3_ref_err_back.mat"), 'ref_err_back_list');
    save(strcat(sfolder, "/rev2_prod3_bound.mat"), 'err_bound_list');
    
    
    %% kernel matrix 4
    disp("test 3")
    
    rng(0)
    
    u1 = precision('d').builtin();
    u2 = precision('s').builtin();
    u3 = precision('h').builtin();
    u4 = precision('b');
    u5 = precision('q52');
    
    u_chain = prec_chain(u1, u2, u3, u4, u5);
    
    depth = 999;
    sizes = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14];
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
        kernel_mat = kernel4(x, y);
        
        aphA = amphodlr(u_chain, kernel_mat, depth, min_block_size, 'svd', eps); 

        for k=1:n_sample
            x = unifrnd(-1, 1, 1, i_size)';
            
            hb1 = mhdot(aphA, x, u2, 'dense');
            hb2 = mhdot(aphA, x, u4, 'dense');
            rhb = hdot(aphA, x, 'dense');
            
            b = kernel_mat * x;
            
            err_back1 = norm(b - hb1, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_back2 = norm(b - hb2, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            ref_err_back = norm(b - rhb, 'fro') / (norm(b, 'fro') * norm(kernel_mat, 'fro'));
            err_bound = 2*(sqrt(2)+1)*sqrt(2^(aphA.bottom_level + 1)+2^(aphA.bottom_level-1))*eps;

            err_back_list1(i) = err_back_list1(i) + err_back1;
            err_back_list2(i) = err_back_list2(i) + err_back2;
            ref_err_back_list(i) = ref_err_back_list(i) + ref_err_back;
            err_bound_list(i) = err_bound_list(i) + err_bound;
        end
    
    end
    
    save(strcat(sfolder, "/rev2_prod4_err_back1.mat"), 'err_back_list1');
    save(strcat(sfolder, "/rev2_prod4_err_back2.mat"), 'err_back_list2');
    save(strcat(sfolder, "/rev2_prod4_ref_err_back.mat"), 'ref_err_back_list');
    save(strcat(sfolder, "/rev2_prod4_bound.mat"), 'err_bound_list');
end
