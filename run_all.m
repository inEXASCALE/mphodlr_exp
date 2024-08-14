function run_all()
    f = waitbar(0, 'Running the experiment, please wait...');
    
    waitbar(.16, f, 'Plotting the norm distributions.');
    plot_saylr3(); 
    plot_LeGresley();

    waitbar(.33, f, 'Testing the reconstruction error.');
    exp_rcerr();
    plot_exp_rcerr();

    waitbar(.50, f,'Testing the matrix--vector product.');
    exp_mvprod();
    plot_exp_mvprod(); 

    waitbar(.66, f, 'Testing the LU decomposition.');
    exp_lu();
    plot_exp_lu();

    waitbar(.83, f, 'Testing the storage savings.');
    exp_storage();
    plot_exp_storage();

    waitbar(1, f, 'Finished, results stored in <results> and <figures>.');
end