clear all; close all; clc;

%% Least Squares Line
% 25 data titik
x = [1 2.1 3.9 4.3 5.5 7.33 8.34 10.1 11.2 11.56 12.3 13.55 14.32 15.31 16.1 17 18.91 18.99 20.5 20.6 20.9 21 22 23 25];
y = [4.2 4.5 4.8 5 5.4 6.11 7.23 8.99 9.2 11.1 12.1 13.57 14.88 15.2 16.13 19.33 20.3 21.11 24.2 25.1 25.2 27 29 31 38];

% plot
figure(1);
plot ( x, y, 'rs', 'LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize', 6);
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
title ('Plotting 25 Data Titik');
grid on;
hold on;

% membuat matriks A
A = [x',ones(25,1)];

b = y';
c1 = A\b;
r1 = norm(b-A*c1);

% plot garis least squares
figure(2)
plot ( x, y, 'rs', 'LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize', 6);
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
title ('Plotting 25 Data Titik & Least Squares Line');
hold on;
xplot1 = 1:24:25;
yplot1 = xplot1*c1(1)+c1(2);
plot(xplot1, yplot1, 'LineWidth', 2);
grid on;

%% Least Squares Quadratic
B = [x'.^2,x',ones(25,1)];
c2 = B\y';
r2 = norm(y' - B*c2);

figure(3)
xplot2=1:.1:25;
yplot2=(xplot2.^2)*c2(1)+xplot2*c2(2)+c2(3);
plot ( x, y, 'rs', 'LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize', 6);
hold on;
plot(xplot2, yplot2, 'LineWidth', 2);
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
title ('Plotting 25 Data Titik & Least Squares Quadratic');
grid on;

%% Least Squares Cubic
C = [x'.^3,x'.^2,x',ones(25,1)];
D = [x'.^10,x'.^9,x'.^8,x'.^7,x'.^6,x'.^5,x'.^4,x'.^3,x'.^2,x',ones(25,1)];
c3 = C\y';
c4 = D\y';
r3 = norm(y'-C*c3);
r4 = norm(y'-D*c4);

figure(4);
xplot3=1:.1:25;
yplot3=(xplot3.^3)*c3(1)+(xplot3.^2)*c3(2)+xplot3*c3(3)+c3(4);

xplot4=1:.1:25;
yplot4=(xplot4.^10)*c4(1)+(xplot4.^9)*c4(2)+(xplot4.^8)*c4(3)+(xplot4.^7)*c4(4)+(xplot4.^6)*c4(5)+(xplot4.^5)*c4(6)+(xplot4.^4)*c4(7)+(xplot4.^3)*c4(8)+(xplot4.^2)*c4(9)+xplot4*c4(10)+c4(11);

subplot(121);
plot ( x, y, 'rs', 'LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize', 6);
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
grid on;
hold on;
title ('Plotting 25 Data Titik & Least Squares Cubic');
plot(xplot3, yplot3,'LineWidth', 2);

subplot(122);
plot ( x, y, 'rs', 'LineWidth', 2, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize', 6);
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
title ('Plotting 25 Data Titik & Least Squares 10th Degree Polynomial');
hold on;
plot(xplot4, yplot4,'LineWidth', 2)
grid on;

%% 3D Least Squares Line

z = [4.2 4.5 5.8 5 6.4 6.81 7.23 7.99 8.2 10.1 11.1 12.57 13.88 14.2 14.73 18.33 19.3 20.5 23.1 24.1 25.2 26 28 30 32];

c5 = A\y';
c6 = A\z';
r5 = norm(y' - A*c5);
r6 = norm(z' - A*c6);

xplot5 = 1:24:25; 
yplot5 = xplot5*c5(1)+c5(2);
zplot5 = xplot5*c6(1)+c6(2);

figure(5);
plot3( x, y, z, 'rs', 'LineWidth', 1, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize', 6)
hold on;
plot3(xplot5, yplot5, zplot5, 'LineWidth', 2);
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
zlabel ('z','fontweight','bold','fontsize',14);
title ('Plotting 3D dari 25 Data Titik dan 3D Least Square Lines');
grid on;

%% 3D Least Squares Quadratic

c7 = B\y';
c8 = B\z';

r7 = norm(y' - B*c7);
r8 = norm(z' - B*c8);

xplot6=1:.1:25;
yplot6=(xplot6.^2)*c7(1)+xplot6*c7(2)+c7(3);
zplot6=(xplot6.^2)*c8(1)+xplot6*c8(2)+c8(3);

figure(6);
plot3( x, y, z, 'rs', 'LineWidth', 1, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g', 'MarkerSize', 6)
hold on;
plot3(xplot6,yplot6,zplot6, 'LineWidth', 2);
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
zlabel ('z','fontweight','bold','fontsize',14);
grid on;
title ('Plotting 3D dari 25 Data Titik dan 3D Least Square Quadratic');