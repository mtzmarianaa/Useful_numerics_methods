clear;   close all;   clc;

[f, Df, D2f] = fpascal();

x0 = 20000*ones(4,1);
%x0 = [1; zeros(3,1)];
Ha = apHess(f,x0)
He = D2f(x0)

errabs = norm(Ha-He,'inf')
errrel = norm((Ha-He)./He,'inf')
