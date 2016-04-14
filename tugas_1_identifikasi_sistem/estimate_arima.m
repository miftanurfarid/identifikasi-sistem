fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')

if nc == 1 && na > 1
    time_arima_na = zeros(na,1);
    report_arima_na = zeros(na,4);
    fprintf('Proses ARIMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah: ', na, nc)
    
    for i = 1:na
        fprintf('%02d%%', floor(i/na*100));
        tic;
        marima = armax(data,[i nc], 'IntegrateNoise', true);
        report_arima_na(i,1) = marima.Report.Fit.FitPercent;
        report_arima_na(i,2) = marima.Report.Fit.FPE;
        report_arima_na(i,3) = marima.Report.Fit.LossFcn;
        report_arima_na(i,4) = marima.Report.Fit.MSE;
        time_arima_na(i,1) = toc;
        fprintf('\b\b\b')
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arima_na.mat','report_arima_na','time_arima_na');
    
elseif na == 1 && nc > 1
    time_arima_nc = zeros(nc,1);
    report_arima_nc = zeros(nc,4);
    fprintf('Proses ARIMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah: ', na, nc)
    
    for i = 1:nc
        fprintf('%02d%%', floor(i/nc*100));
        tic;
        marima = armax(data,[na i], 'IntegrateNoise', true);
        report_arima_nc(i,1) = marima.Report.Fit.FitPercent;
        report_arima_nc(i,2) = marima.Report.Fit.FPE;
        report_arima_nc(i,3) = marima.Report.Fit.LossFcn;
        report_arima_nc(i,4) = marima.Report.Fit.MSE;
        time_arima_nc(i,1) = toc;
        fprintf('\b\b\b')
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arima_nc.mat','report_arima_nc','time_arima_nc');

elseif na == nc
    n = na;
    time_arima_n = zeros(n,1);
    report_arima_n = zeros(n,4);
    fprintf('Proses ARIMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah: ', na, nc)
    
    for i = 1:n
        fprintf('%02d%%', floor(i/nc*100));
        tic;
        marima = armax(data,[i i], 'IntegrateNoise', true);
        report_arima_n(i,1) = marima.Report.Fit.FitPercent;
        report_arima_n(i,2) = marima.Report.Fit.FPE;
        report_arima_n(i,3) = marima.Report.Fit.LossFcn;
        report_arima_n(i,4) = marima.Report.Fit.MSE;
        time_arima_n(i,1) = toc;
        fprintf('\b\b\b')
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arima_n.mat','report_arima_n','time_arima_n');
    
else
    all_par = na * nc;
    time_arima = zeros(all_par, 1);
    report_arima = zeros(all_par,4);
    
    fprintf('Proses ARIMA dengan polinomial A(q) dan C(q) sebesar %d dan %d adalah ', na, nc)
    
    cell = 0;
    for i = 1:na
        for j = 1:nc
            cell = cell + 1;
            fprintf('%02d%%', floor(cell/all_par*100));
            tic;
            marima = armax(data,[i j], 'IntegrateNoise', true);
            report_arima(cell,1) = marima.Report.Fit.FitPercent;
            report_arima(cell,2) = marima.Report.Fit.FPE;
            report_arima(cell,3) = marima.Report.Fit.LossFcn;
            report_arima(cell,4) = marima.Report.Fit.MSE;
            time_arima(cell,1) = toc;
            fprintf('\b\b\b')
        end
    end
    fprintf('\b\n\nSelesai!\n')
    
    save('model_arima.mat','report_arima','time_arima');
        
end