figure(1);

plot(time_ar);

hold on;
plt_ma = plot(time_ma);
set(plt_ma, 'color', 'red');

hold on;
plt_arma_na = plot(time_arma_na);
set(plt_arma_na, 'color', 'black');

hold on;
plt_arima_na = plot(time_arima_na);
set(plt_arima_na, 'color', 'green');

xlabel('orde polinomial');
ylabel('waktu (detik)');
title('kecepatan estimasi model');
axis tight;

hleg1 = legend('AR', 'MA', 'ARMA (nc = 1)', 'ARIMA (nc = 1)');
set(hleg1, 'location', 'northwest');

%%
figure(2);

plot(time_ar);

hold on;
plt_ma = plot(time_ma);
set(plt_ma, 'color', 'red');

hold on;
plt_arma_nc = plot(time_arma_nc);
set(plt_arma_nc, 'color', 'black');

hold on;
plt_arima_nc = plot(time_arima_nc);
set(plt_arima_nc, 'color', 'green');

xlabel('orde polinomial');
ylabel('waktu (detik)');
title('kecepatan estimasi model');
axis tight;

hleg2 = legend('AR', 'MA', 'ARMA (na = 1)', 'ARIMA (na = 1)');
set(hleg2, 'location', 'northwest');

%%
figure(3);

plot(time_ar);

hold on;
plt_ma = plot(time_ma);
set(plt_ma, 'color', 'red');

hold on;
plt_arma_nc = plot(time_arma_nc);
set(plt_arma_nc, 'color', 'black');

hold on;
plt_arima_nc = plot(time_arima_nc);
set(plt_arima_nc, 'color', 'green');

xlabel('orde polinomial');
ylabel('waktu (detik)');
title('kecepatan estimasi model');
axis tight;

hleg2 = legend('AR', 'MA', 'ARMA (na = 1)', 'ARIMA (na = 1)');
set(hleg2, 'location', 'northwest');