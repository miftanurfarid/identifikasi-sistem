function [r1, r2, coef] = trigfit(num_func, modes)

%       This is a matlab program to illustrate how to
%       solve linear least squares problems and fit data
%       with trigonometric sum.

% clear;
s=1;

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

%       Number of coefficients for which to solve.
Ncoefs = 2*modes + 1;

%      Set up the linear system to be solved by least squares.
A= zeros( Ndata, Ncoefs);

%      First column is all 1's.
A(:,1) = ones( Ndata , 1 );
for k = 2:2: Ncoefs
%      Subsequent columns are in pairs of sin and cos.
  mode = floor( k/2 ) ;
  A(:,k  ) = sin(mode *xx)';
  A(:,k+1) = cos(mode *xx)';
end

%      Print the matrix, if ; is removed.
A;

%      Get QR decomposition.
[Q,R] = qr(A);

%      Modify the data, notice the transpose of yy and Q.
b = Q'*yy';

%      Compute the coefficients using the top coefs row of R and b.
coef = R(1:Ncoefs,:)\b(1:Ncoefs);

%      Compute the residual by two different methods.  r1 must equal r2.
r1 = norm( yy' - A*coef );
r2 = norm( b( Ncoefs +1 : Ndata ) );

%      Plot the approximating curve.
tt = 0: .01 : 10;

yt = coef(1);
for k = 2:2:Ncoefs

   % The function "floor" rounds down to an integer value
   mode = floor(k/2);
   yt = yt + coef(k)*sin(mode*tt) + coef(k+1)*cos(mode*tt);

end

plot( tt, yt )
title(sprintf('Function %d, Modes = %d', reply, modes));
name_fig = sprintf('percobaan_2_function_%d_-_modes_%d', reply, modes);
save (name_fig);
saveas(gcf,name_fig,'eps2c');
hold off

%      That's all!
