
fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')

if nc == 1 && na > 1
    time_arma_na = zeros(na,1);
    report_arma_na = zeros(na,4);
    fprintf('Proses ARMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah: ', na, nc)
    
    for i = 1:na
        fprintf('%02d%%', floor(i/na*100));
        tic;
        marma = armax(data,[i nc]);
        report_arma_na(i,1) = marma.Report.Fit.FitPercent;
        report_arma_na(i,2) = marma.Report.Fit.FPE;
        report_arma_na(i,3) = marma.Report.Fit.LossFcn;
        report_arma_na(i,4) = marma.Report.Fit.MSE;
        time_arma_na(i,1) = toc;
        fprintf('\b\b\b')
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arma_na.mat','report_arma_na','time_arma_na');
    
elseif na == 1 && nc > 1
    time_arma_nc = zeros(nc,1);
    report_arma_nc = zeros(nc,4);
    fprintf('Proses ARMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah: ', na, nc)
    
    for i = 1:nc
        fprintf('%02d%%', floor(i/nc*100));
        tic;
        marma = armax(data,[na i]);
        report_arma_nc(i,1) = marma.Report.Fit.FitPercent;
        report_arma_nc(i,2) = marma.Report.Fit.FPE;
        report_arma_nc(i,3) = marma.Report.Fit.LossFcn;
        report_arma_nc(i,4) = marma.Report.Fit.MSE;
        time_arma_nc(i,1) = toc;
        fprintf('\b\b\b')
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arma_nc.mat','report_arma_nc','time_arma_nc');
    
elseif na == nc
    n = na;
    time_arma_n = zeros(n,1);
    report_arma_n = zeros(n,4);
    fprintf('Proses ARMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah: ', na, nc)
    
    for i = 1:n
        fprintf('%02d%%', floor(i/nc*100));
        tic;
        marma = armax(data,[i i]);
        report_arma_n(i,1) = marma.Report.Fit.FitPercent;
        report_arma_n(i,2) = marma.Report.Fit.FPE;
        report_arma_n(i,3) = marma.Report.Fit.LossFcn;
        report_arma_n(i,4) = marma.Report.Fit.MSE;
        time_arma_n(i,1) = toc;
        fprintf('\b\b\b')
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arma_n.mat','report_arma_n','time_arma_n');
    
else
    all_par = na * nc;
    time_arma = zeros(all_par, 1);
    report_arma = zeros(all_par,4);
    
    fprintf('Proses ARMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah ', na, nc)
    
    cell = 0;
    for i = 1:na
        for j = 1:nc
            cell = cell + 1;
            fprintf('%02d%%', floor(cell/all_par*100));
            tic;
            marma = armax(data,[i j]);
            report_arma(cell,1) = marma.Report.Fit.FitPercent;
            report_arma(cell,2) = marma.Report.Fit.FPE;
            report_arma(cell,3) = marma.Report.Fit.LossFcn;
            report_arma(cell,4) = marma.Report.Fit.MSE;
            time_arma(cell,1) = toc;
            fprintf('\b\b\b')
        end
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arma.mat','report_arma','time_arma');
        
end