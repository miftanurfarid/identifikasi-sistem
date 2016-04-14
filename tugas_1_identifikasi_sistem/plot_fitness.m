figure(1)
plt_ar = plot(report_ar(1:20,1));
set(plt_ar, 'color', 'blue', 'linewidth',2);

hold on;
plt_ma = plot(report_ma(1:20,1));
set(plt_ma, 'color', 'red', 'linewidth',2);

hold on;
plt_arma_n = plot(report_arma_n(1:20,1));
set(plt_arma_n, 'color', 'black', 'linewidth',2);

hold on;
plt_arima_n = plot(report_arima_n(1:20,1));
set(plt_arima_n, 'color', 'green', 'linewidth',2);

xlabel('orde polinomial');
ylabel('fitness (%)');
title('persen fitness estimasi model');
axis tight;
grid on;

hleg1 = legend('AR', 'MA', 'ARMA', 'ARIMA');
set(hleg1, 'location', 'southeast');