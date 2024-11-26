function fintplot1()
    margin = 1e-10;
    sizes = [2^9 2^10 2^11 2^12 2^13 2^14];
    lineWidth = 2;
    markerSize = 15;
    
    n_size = size(sizes, 2);
    
    %% test1
    fontSize = 16;
    load("temp1/rev2_prod2_err_back1.mat");
    load("temp1/rev2_prod2_err_back2.mat");
    load("temp1/rev2_prod2_ref_err_back.mat");
    load("temp1/rev2_prod2_bound.mat");
    
    %% plot 1
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(sizes, ref_err_back_list,'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_back_list1,'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_back_list2,'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_bound_list,':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    
    h = legend('fp64', ...
               'fp32', ...
               'bf16', ...
               'error bound', ...
         'NumColumns', 4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    
    legend boxoff
    rect = [0.5, 0.01, 0, 0.05];
    set(h, 'Position', rect);
    ylim([0-margin, max(err_bound_list)]+margin);
    set(gca,'xtick',sizes,'xticklabel',{'2^{9}', '2^{10}', '2^{11}', '2^{12}', '2^{13}', '2^{14}'}, 'fontsize',fontSize);
    grid on;
    % title('test 1')
    exportgraphics(gca, 'figures/fintplot1_1.pdf')
    hold off
    
    %% kernel matrix 3
    fontSize = 16;
    load("temp1/rev2_prod3_err_back1.mat");
    load("temp1/rev2_prod3_err_back2.mat");
    load("temp1/rev2_prod3_ref_err_back.mat");
    load("temp1/rev2_prod3_bound.mat");
    
    
    %% test2
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(sizes, ref_err_back_list,'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_back_list1,'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_back_list2,'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_bound_list,':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'bf16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0.01, 0, 0.05];
    set(h, 'Position', rect);
    ylim([0-margin, max(err_bound_list)]+margin);
    set(gca,'xtick',sizes,'xticklabel',{'2^{9}', '2^{10}', '2^{11}', '2^{12}', '2^{13}', '2^{14}'}, 'fontsize',fontSize);
    grid on;
    % title('test 2')
    exportgraphics(gca, 'figures/fintplot1_2.pdf')
    hold off
    
    %% test3
    fontSize = 16;
    load("temp1/rev2_prod4_err_back1.mat");
    load("temp1/rev2_prod4_err_back2.mat");
    load("temp1/rev2_prod4_ref_err_back.mat");
    load("temp1/rev2_prod4_bound.mat");
    
    %% plot 1
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(sizes, ref_err_back_list,'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_back_list1,'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_back_list2,'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(sizes, err_bound_list,':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'bf16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0.01, 0, 0.05];
    set(h, 'Position', rect);
    ylim([0-margin, max(err_bound_list)]+margin);
    set(gca,'xtick',sizes,'xticklabel',{'2^{9}', '2^{10}', '2^{11}', '2^{12}', '2^{13}', '2^{14}'}, 'fontsize',fontSize);
    grid on;
    % title('test 3')
    exportgraphics(gca, 'figures/fintplot1_3.pdf')
    hold off

end
