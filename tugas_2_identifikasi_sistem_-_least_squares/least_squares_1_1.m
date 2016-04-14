% DOING LEAST SQUARES IN MATLAB

clear all; close all; clc;

% Diketahui 8 data points
% (0,6), (1,4), (2,3), (3,5), (4,3), (5,4), (6,-1), (7,2)

x = 0:7;    % memasukkan nilai x dari 8 data points
y = [6 4 3 5 3 4 -1 2]; % memasukkan nilai y dari 8 data points

% Data tersebut di atas akan dilakukan fitting terhadap fungsi
% y = c1 + c2*sin(x) + c3*cos(x)

A = [ones(8,1), sin(x'), cos(x'), sin(2*x'), cos(2*x')];
b = y';

% A*c = b dimana c adalah c1, c2, dan c3
% Untuk mendapatkan nilai c, pertama dicari dekomposisi-QR dengan
% menggunakan fungsi qr di Matlab. Kemudian akan diperoleh Q*R*c = b 
% Q adalah matriks ortogonal dan R adalah matriks segitiga atas (upper
% triangular)


[Q, R] = qr(A);
b = Q'*b;

% Fungsi diatas mengubah persamaan sebelumnya menjadi:
% Q*R*c = b --> R*c = Q'*b

% Menghilangkan solusi pada 5 baris terbawah, karena tidak memenuhi
% persamaan

[row, col] = size(R);   % mencari baris terakhir dari R yang memimiliki
for i = 1:row           % nilai nol
    temp_R = R(i,col);
    if temp_R == 0
        break;
    end
end

R1 = R(1:i-1,:);
b1 = b(1:i-1);
coef = R1\b1;

% vektor coef berisi nilai koefisien c1, c2 dan c3

% selanjutnya plot data bersama dengan solusi estimasinya

xx = 0:.1:7;
yy = coef(1) + coef(2)*sin(xx) + coef(3)*cos(xx) + coef(4)*sin(2*xx) ...
    + coef(5)*cos(2*xx);
plot(x, y, 'o', xx, yy);

% untuk mengukur seberapa baik fungsi fit data, kita dapat menghitung akar
% kuadrat dari

r1 = norm(y' - A*coef);
r2 = norm(b(4:8));