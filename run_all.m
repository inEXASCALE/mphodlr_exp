function run_all()
    f = waitbar(0, 'Running the first experiment');
    exp_rcerr();
    
    waitbar(0.2, 'Running the second experiment');
    exp_mvprod();
    
    waitbar(0.4, 'Running the third experiment');
    exp_lu();
    
    waitbar(0.6, 'Running the fourth experiment');
    exp_storage();
    
    waitbar(0.8,'Gnerating the plots');
    plot_saylr3(); plot_LeGresley();

    plot_exp_rcerr(); 
    
    plot_exp_mvprod(); 
    
    plot_exp_lu();

    plot_exp_storage();

    waitbar(1, f, 'Finish');
    close(f);
end