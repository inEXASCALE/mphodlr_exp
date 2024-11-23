function plot_rev_exp_mvprod2()
    margin = 1;
    sizes = [2^9 2^10 2^11 2^12 2^13 2^14];
    lineWidth = 2;
    markerSize = 15;
    
    n_size = size(sizes, 2);
    
    %% kernel matrix 2
    fontSize = 19;
    load("results/rev_prod2_err_back1.mat");
    load("results/rev_prod2_err_back2.mat");
    load("results/rev_prod2_ref_err_back.mat");
    load("results/rev_prod2_bound.mat");
    
    %% plot 1
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list,'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1,'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2,'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list,':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns', 4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    
    legend boxoff
    rect = [0.5, 0.05, 0, 0.05];
    set(h, 'Position', rect);
    
    ylim([0-margin, max(err_bound_list)]);
    
    set(gca,'XTick',sizes, ...
        'XTickLabel', {'2^{9}', '2^{10}', '2^{11}', '2^{12}', '2^{13}', '2^{14}'}, ...
        'fontsize',fontSize, 'XTick', sizes) % ,'FontWeight','bold'
    title('test 1')
    exportgraphics(gca, 'figures/rev2_matvecprod_kernel2_d2.pdf')
    hold off
    
    
    
    
    
    
    %% kernel matrix 3
    fontSize = 19;
    load("results/rev_prod3_err_back1.mat");
    load("results/rev_prod3_err_back2.mat");
    load("results/rev_prod3_ref_err_back.mat");
    load("results/rev_prod3_bound.mat");
    
    
    %% plot 1
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list,'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1,'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2,'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list,':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0.05, 0, 0.05];
    set(h, 'Position', rect);
    
    xticklabels(split(num2str(sizes,'%.e ')));
    ylim([0-margin, max(err_bound_list)]);
    
    set(gca,'XTick',sizes, 'XTickLabel',{'2^{9}', '2^{10}', '2^{11}', '2^{12}', '2^{13}', '2^{14}'},'fontsize',fontSize, 'XTick', sizes) % ,'FontWeight','bold'
    grid on;
    title('test 2')
    exportgraphics(gca, 'figures/rev2_matvecprod_kernel3_d2.pdf')
    hold off
    
    %% kernel matrix 4
    fontSize = 19;
    load("results/rev_prod4_err_back1.mat");
    load("results/rev_prod4_err_back2.mat");
    load("results/rev_prod4_ref_err_back.mat");
    load("results/rev_prod4_bound.mat");
    
    %% plot 1
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list,'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1,'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2,'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list,':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0.05, 0, 0.05];
    set(h, 'Position', rect);
    
    ylim([0-margin, max(err_bound_list)]);
    
    set(gca,'XTick',sizes, 'XTickLabel',{'2^{9}', '2^{10}', '2^{11}', '2^{12}', '2^{13}', '2^{14}'},'fontsize',fontSize, 'XTick', sizes) % ,'FontWeight','bold'
    grid on;
    title('test 3')
    exportgraphics(gca, 'figures/rev2_matvecprod_kernel4_d2.pdf')
    hold off

end
