clear all; close all; clc;

load data.txt;
iddata = iddata(data);

% na = polynomial A(q) ( autoregresive)
% nc = polynomial C(q) (movingaverage)

%% estimate model using AR

na = 64;
estimate_ar;
%% estimate model using MA

nc = 64;
estimate_ma;

%% estimate model using ARMA
na=1;
nc = 64;
estimate_arma;

na = 64;
nc = 1;
estimate_arma;

na = 20;
nc = 20;
estimate_arma;

%% estimate model using ARIMA

na=1;
nc = 64;
estimate_arima;

na = 64;
nc = 1;
estimate_arima;

na = 20;
nc = 20;
estimate_arima;