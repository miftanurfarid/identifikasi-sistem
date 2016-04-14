time_ar = zeros(na,1);
report_ar = zeros(na,4);

fprintf('Proses AR dengan polinomial A(q) sebesar %d adalah: ', na)

for i = 1:na
    fprintf('%02d%%',floor(i/na*100));
    tic;
    mar = ar(data,i);
    report_ar(i,1) = mar.Report.Fit.FitPercent;
    report_ar(i,2) = mar.Report.Fit.FPE;
    report_ar(i,3) = mar.Report.Fit.LossFcn;
    report_ar(i,4) = mar.Report.Fit.MSE;
    time_ar(i,1) = toc;
    fprintf('\b\b\b')
end
fprintf('\b\n\nSelesai!\n')
save('model_ar.mat','report_ar','time_ar');