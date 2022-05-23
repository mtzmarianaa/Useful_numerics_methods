clear;   close all;   clc;
addpath('lab1')

[f, Df, D2f] = fRosenb();

x0 = [2;3];
%x0 = [1; zeros(3,1)];
tol = 1e-5;

%[xk, iter] = desCoor( f, x0, tol, 10000 )
%[xk, iter] = desMax( f, x0, tol, 10000 )
[xk, iter] = desNewton( f, x0, tol, 10000 )

ga = apGrad(f,xk)
gea = apGrad(f,[1;1])
%ge = Df(xk)

%errabs = norm(ga-ge,'inf')
%errrel = norm((ga-ge)./ge,'inf')


rmpath('lab1')