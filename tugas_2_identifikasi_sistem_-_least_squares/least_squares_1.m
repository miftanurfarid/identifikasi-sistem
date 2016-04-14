% DOING LEAST SQUARES IN MATLAB

clear all; close all; clc;

% Diketahui 8 data points
% (0,6), (1,4), (2,3), (3,5), (4,3), (5,4), (6,-1), (7,2)

x = 0:7;    % memasukkan nilai x dari 8 data points
y = [6 4 3 5 3 4 -1 2]; % memasukkan nilai y dari 8 data points

% Data tersebut di atas akan dilakukan fitting terhadap fungsi
% y = c1 + c2*sin(x) + c3*cos(x)

A1 = [ones(8,1), sin(x'), cos(x')];
A2 = [ones(8,1), sin(x'), cos(x'), sin(2*x'), cos(2*x')];
b = y';

% A*c = b dimana c adalah c1, c2, dan c3
% Untuk mendapatkan nilai c, pertama dicari dekomposisi-QR dengan
% menggunakan fungsi qr di Matlab. Kemudian akan diperoleh Q*R*c = b 
% Q adalah matriks ortogonal dan R adalah matriks segitiga atas (upper
% triangular)


[Q1, R1] = qr(A1);
[Q2, R2] = qr(A2);
b1 = Q1'*b;
b2 = Q2'*b;

% Fungsi diatas mengubah persamaan sebelumnya menjadi:
% Q*R*c = b --> R*c = Q'*b

% Menghilangkan solusi pada 5 baris terbawah, karena tidak memenuhi
% persamaan

[row1, col1] = size(R1);   % mencari baris terakhir dari R1 yang memimiliki
for i1 = 1:row1           % nilai nol
    temp_R1 = R1(i1,col1);
    if temp_R1 == 0
        break;
    end
end

[row2, col2] = size(R2);   % mencari baris terakhir dari R yang memimiliki
for i2 = 1:row2           % nilai nol
    temp_R2 = R2(i2,col2);
    if temp_R2 == 0
        break;
    end
end

R1_1 = R1(1:(i1 - 1),:);
b1_1 = b1(1:(i1 - 1));
coef1 = R1_1\b1_1;  % vektor coef berisi nilai koefisien c1, c2 dan c3

R2_1 = R2(1:(i2 - 1),:);
b2_1 = b2(1:(i2 - 1));     % vektor coef berisi nilai koefisien c1, c2, c3, c4
coef2 = R2_1\b2_1;  % dan c5
 

% selanjutnya plot data bersama dengan solusi estimasinya

xx = 0:.1:7;
yy1 = coef1(1) + coef1(2)*sin(xx) + coef1(3)*cos(xx);
yy2 = coef2(1) + coef2(2)*sin(xx) + coef2(3)*cos(xx) ...
    + coef2(4)*sin(2*xx) + coef2(5)*cos(2*xx);

plot_fit = plot(x, y, 'o', xx, yy1, 'k', xx, yy2, 'r' );
xlabel('x','fontweight','bold','fontsize',14);
ylabel('y','fontweight','bold','fontsize',14);
title('Perbandingan Fit y1 dan y2', 'fontweight','bold','fontsize',14');
axis tight;
hleg1 = legend('Data (x, y)', 'Fit y1 = c1 + c2.sin(x) + c3.cos(x)', ...
    'Fit y2 = c1 + c2.sin(x) + c3.cos(x) + c4.sin(2x) + c3.cos(2x)');
set(hleg1, 'location', 'northeast');
set(plot_fit,'linewidth',2);


% untuk mengukur seberapa baik fungsi fit data, kita dapat menghitung akar
% kuadrat dari

r1_1 = norm(y' - A1*coef1)
r1_2 = norm(b1(i1:length(b1)))

r2_1 = norm(y' - A2*coef2)
r2_2 = norm(b2(i2:length(b1)))