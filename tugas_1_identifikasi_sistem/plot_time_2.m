figure(1);

plot(time_arma_n);

hold on;
plt_arma = plot(time_arma_n);
set(plt_arma, 'color', 'red');

hold on;
plt_arima = plot(time_arma_n);
set(plt_arma_na, 'color', 'black');

xlabel('orde polinomial');
ylabel('waktu (detik)');
title('kecepatan estimasi model');
axis tight;

hleg1 = legend('AR', 'MA', 'ARMA (nc = 1)', 'ARIMA (nc = 1)');
set(hleg1, 'location', 'northwest');/home/farid/Documents/kuliah/instrumentasi-lanjut/Tugas 2015 S2/compare_result.m
/home/farid/Documents/kuliah/instrumentasi-lanjut/Tugas 2015 S2/ident sist mimo.m
/home/farid/Documents/kuliah/instrumentasi-lanjut/Tugas 2015 S2/tugas_softsensor.m