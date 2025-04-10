function plot_exp_rcerr()
    clear all 
    vareps = [1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1]; % u2.u, u3.u
    depths = [2,  5,  8];
    
    n_d = size(depths, 2);
    n_eps = size(vareps, 2);
    
    %% P64
    load("results/rcerr_err_list1.mat");
    load("results/rcerr_err_list_amp1.mat");
    load("results/rcerr_err_bound_list1.mat");
    
    rect = [0.5, 0, 0, 0.05];
    fontSize = 18;
    lineWidth = 2;
    markerSize = 15;
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 1), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 1),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 1),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    [l, s] = title('$\ell$=2');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/P64_depth1.pdf')
    hold off
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 2), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 2),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 2),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    [l, s] = title('$\ell$=5');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/P64_depth2.pdf')
    hold off
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 3), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 3),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 3),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    [l, s] = title('$\ell$=8');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/P64_depth3.pdf')
    hold off
    % delete(gcf)
    % delete(gca)
    
    % ex37
    load("results/rcerr_err_list2.mat");
    load("results/rcerr_err_list_amp2.mat");
    load("results/rcerr_err_bound_list2.mat");
    
    
    rect = [0.5, 0, 0, 0.05];
    fontSize = 18;
    lineWidth = 2;
    markerSize = 15;
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 1), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 1),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 1),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    [l, s] = title('$\ell$=2');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/ex37_depth1.pdf')
    hold off
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 2), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 2),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 2),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    [l, s] = title('$\ell$=5');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/ex37_depth2.pdf')
    hold off
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 3), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 3),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 3),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    [l, s] = title('$\ell$=8');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/ex37_depth3.pdf')
    hold off
    % delete(gcf)
    % delete(gca)
    
    % saylr3
    load("results/rcerr_err_list3.mat");
    load("results/rcerr_err_list_amp3.mat");
    load("results/rcerr_err_bound_list3.mat");
    
    rect = [0.5, 0, 0, 0.05];
    fontSize = 18;
    lineWidth = 2;
    markerSize = 15;
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 1), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 1),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 1),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    [l, s] = title('$\ell$=2');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/saylr3_depth1.pdf')
    hold off
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 2), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 2),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 2),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    [l, s] = title('$\ell$=5');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/saylr3_depth2.pdf')
    hold off
    
    figure()
    set(gcf, 'Position',  [10 10 800 600])
    semilogy(1:n_eps, err_list(:, 3), '-b', 'Marker', 'o', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_list_amp(:, 3),'--r', 'Marker', '*', 'MarkerSize',markerSize, 'Linewidth',lineWidth)
    hold on 
    semilogy(1:n_eps, err_bound_list(:, 3),':k', 'Marker', '.',  'MarkerSize',markerSize, 'Linewidth',lineWidth)
    
    legend('fp64', ...
        'adaptive precision', ...
        'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    
    legend boxoff
    [l, s] = title('$\ell$=8');
    set(l,'interpreter','latex');
    set(gca,'XTick',1:n_eps, 'XTickLabel', split(num2str(vareps,'%.e ')), 'fontsize',fontSize) % ,'FontWeight','bold'
    
    l.FontSize = fontSize+12;
    ylim([0, max(err_bound_list,[],"all")+10]);
    yticks([1e-11, 1e-8, 1e-5, 1e-2, 1e+1]);

    legend('fp64', ...
    'adaptive precision', ...
    'error bound', 'Position', rect, 'NumColumns',3, 'FontSize', fontSize+5)
    legend boxoff
    
    grid on;
    exportgraphics(gca, 'figures/saylr3_depth3.pdf')
    hold off

end
