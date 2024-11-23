function plot_rev_exp_mvprod2()

    sizes = [2^9, 2^10, 2^11, 2^12, 2^13, 2^14];
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
    
    semilogy(1:n_size, ref_err_back_list(:, 1),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 1),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 1),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 1),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=2');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel2_d2.pdf')
    hold off
    
    %% plot 2
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list(:, 2),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 2),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 2),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 2),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=5');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel2_d5.pdf')
    hold off
    
    %% plot 3
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list(:, 3),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 3),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 3),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 3),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=8');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel2_d8.pdf')
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
    
    semilogy(1:n_size, ref_err_back_list(:, 1),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 1),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 1),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 1),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=2');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel3_d2.pdf')
    hold off
    
    %% plot 2
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list(:, 2),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 2),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 2),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 2),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=5');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel3_d5.pdf')
    hold off
    
    %% plot 3
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list(:, 3),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 3),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 3),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 3),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=8');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel3_d8.pdf')
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
    
    semilogy(1:n_size, ref_err_back_list(:, 1),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 1),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 1),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 1),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=2');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel4_d2.pdf')
    hold off
    
    %% plot 2
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list(:, 2),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 2),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 2),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 2),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=5');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel4_d5.pdf')
    hold off
    
    %% plot 3
    figure()
    set(gcf, 'Position',  [10 10 800 650])
    
    semilogy(1:n_size, ref_err_back_list(:, 3),'-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list1(:, 3),'-.r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_back_list2(:, 3),'--g', 'Marker', 's', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_size, err_bound_list(:, 3),':k', 'Marker', '.', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    
    h = legend('fp64', ...
               'fp32', ...
               'f16', ...
               'error bound', ...
         'NumColumns',4, 'Location', 'Best', 'FontSize', fontSize, BackgroundAlpha=.3);
    legend boxoff
    rect = [0.5, 0, 0, 0.05];
    set(h, 'Position', rect);
    
    %[l, s] = title('$\ell$=8');
    xticklabels(split(num2str(sizes,'%.e ')));
    %ylim([1e-18, 1e-0+0.5]);
    %yticks([1e-18, 1e-12, 1e-6, 1e-0]);
    
    %lx = xlabel('$\sizesilon$');
    %set(lx,'interpreter','latex');
    %lx.FontSize = fontSize;
    
    a = get(gca,'XTickLabel');  
    set(gca,'XTickLabel',a,'fontsize',fontSize) % ,'FontWeight','bold'
    % set(l,'interpreter','latex');
    % l.FontSize = fontSize+12;
    grid on;
    exportgraphics(gca, 'figures/rev_matvecprod_kernel4_d8.pdf')
    hold off

end
