function [r1_1, r1_2, r2_1, r2_2, coef1, coef2] = my_trigfit(num_func, num_modes)

%       This is a matlab program to illustrate how to
%       solve linear least squares problems and fit data
%       with trigonometric sum.

% clear;
s = 1;

%       First we generate the data to be fit.
%       Number of data points being generated.
Ndata = 41;
rng(s)
%      Generate the data points
xx = 10*sort( rand( 1, Ndata ) );


%      Depending on the data and the functions you use to fit
%      the data, the fit may or may not be to your liking.
%      Some of the functions below give data sets which trig sums
%      fit reasonably well, others can not be fit well by the trig
%      sums we are using.

%      Ask the user to choose one of these functions to generate
%      the data.
% disp('Choose one of the following functions to use:');
% disp('  1.  cos( 1.05 * xx + 0.3 )');
% disp('  2.  sin( 1.2  * xx + 0.3 )');
% disp('  3.  cos( 1.2  * xx + 0.3 )');
% disp('  4.  sin( sin(xx) + 0.2 )');
% disp('  5.  sin( 2.*sin(xx) + 0.2 )');
% disp('  6.  sin( 1.2*cos(xx) + 0.2 )');
% disp('  7.  sin( 4.*xx + 0.3 )');
% disp('  8.  sin( 3.*sin(xx) - 0.4 )');

% reply = input('Which? ');

reply = num_func;

if (reply == 1)
   yy = cos( 1.05* xx + 0.3 ) ;
elseif (reply == 2)
   yy = sin( 1.2* xx + 0.3 ) ;
elseif (reply == 3)
   yy = cos( 1.2* xx + 0.3 ) ;
elseif (reply == 4)
   yy = sin( sin( xx) + 0.2 ) ;
elseif (reply == 5)
   yy = sin( 2.*sin( xx) + 0.2 ) ;
elseif (reply == 6)
   yy = sin( 1.2*cos( xx) + 0.2 ) ;
elseif (reply == 7)
   yy = sin( 4*xx + 0.3 ) ;
elseif (reply == 8)
   yy = sin( 3.*sin( xx) - 0.4 ) ;
else
   error('Invalid Choice.');
end


%      Plot the data.
axisdef = [ 0 10 -1.5 1.5 ] ;
plot ( xx, yy , 'o' )
axis( axisdef ) 
hold on

%       Now, fit this data with a trigonometric sum.

%       Number of trig modes, i.e., up to cos( modes *x)
% modes = input('How many modes do you want to use? ');

modes = num_modes-1:num_modes;

%       Number of coefficients for which to solve.
Ncoefs1 = 2*modes(1) + 1;
Ncoefs2 = 2*modes(2) + 1;

%      Set up the linear system to be solved by least squares.
A1 = zeros( Ndata, Ncoefs1);
A2 = zeros( Ndata, Ncoefs2);

%      First column is all 1's.
A1(:,1) = ones( Ndata , 1 );
A2(:,1) = ones( Ndata , 1 );

for k = 2:2: Ncoefs1
%      Subsequent columns are in pairs of sin and cos.
  mode = floor( k/2 ) ;
  A1(:,k  ) = sin(mode *xx)';
  A1(:,k+1) = cos(mode *xx)';
end

for k = 2:2: Ncoefs2
%      Subsequent columns are in pairs of sin and cos.
  mode = floor( k/2 ) ;
  A2(:,k  ) = sin(mode *xx)';
  A2(:,k+1) = cos(mode *xx)';
end

%      Print the matrix, if ; is removed.
% A;

%      Get QR decomposition.
[Q1, R1] = qr(A1);
[Q2, R2] = qr(A2);

%      Modify the data, notice the transpose of yy and Q.
b1 = Q1'*yy';
b2 = Q2'*yy';

%      Compute the coefficients using the top coefs row of R and b.
coef1 = R1(1:Ncoefs1,:)\b1(1:Ncoefs1);
coef2 = R2(1:Ncoefs2,:)\b2(1:Ncoefs2);

%      Compute the residual by two different methods.  r1 must equal r2.
r1_1 = norm( yy' - A1*coef1 );
r1_2 = norm( b1( Ncoefs1 +1 : Ndata ) );

r2_1 = norm( yy' - A2*coef2 );
r2_2 = norm( b2( Ncoefs2 +1 : Ndata ) );

%      Plot the approximating curve.
tt = 0: .01 : 10;

yt1 = coef1(1);
yt2 = coef2(1);

for k = 2:2:Ncoefs1

   % The function "floor" rounds down to an integer value
   mode = floor(k/2);
   yt1 = yt1 + coef1(k)*sin(mode*tt) + coef1(k+1)*cos(mode*tt);

end

for k = 2:2:Ncoefs2

   % The function "floor" rounds down to an integer value
   mode = floor(k/2);
   yt2 = yt2 + coef2(k)*sin(mode*tt) + coef2(k+1)*cos(mode*tt);

end

plot_fit = plot(tt, yt1, 'k', tt, yt2, 'r' );
title (sprintf('Function %d, Modes y1 = %d and Modes y2 = %d', reply, modes(1), modes(2)));
xlabel ('x','fontweight','bold','fontsize',14);
ylabel ('y','fontweight','bold','fontsize',14);
name_fig = sprintf('percobaan_2_function_%d_-_modes_%d_vs_modes_%d', reply, modes(1), modes(2));
hleg1 = legend('data', 'y1', 'y2');
set (hleg1, 'location', 'northeast');
set (plot_fit,'linewidth',2);
axis tight;
save (name_fig);
saveas (gcf,name_fig,'eps2c');

hold off

%      That's all!
