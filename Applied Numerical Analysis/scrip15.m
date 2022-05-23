clear;   close all;   clc;

[f, Df, D2f] = fpascal();

%x0 = 4*ones(4,1);
x0 = [1; zeros(3,1)];
ga = apGrad(f,x0)
ge = Df(x0)

errabs = norm(ga-ge,'inf')
errrel = norm((ga-ge)./ge,'inf')
