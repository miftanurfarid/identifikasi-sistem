time_ma = zeros(nc,1);
report_ma = zeros(nc,4);

fprintf('Proses MA dengan polinomial C(q) sebesar %d adalah: ', nc)

for i = 1:nc
    fprintf('%02d%%',floor(i/nc*100));
    tic;
    mma = armax(data,[0 i]);
    report_ma(i,1) = mma.Report.Fit.FitPercent;
    report_ma(i,2) = mma.Report.Fit.FPE;
    report_ma(i,3) = mma.Report.Fit.LossFcn;
    report_ma(i,4) = mma.Report.Fit.MSE;
    time_ma(i,1) = toc;
    fprintf('\b\b\b')
end
fprintf('\b\n\nSelesai!\n')
save('model_ma.mat','report_ma','time_ma');