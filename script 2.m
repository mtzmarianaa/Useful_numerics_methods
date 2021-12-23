clear; close all; clc;

[f, Df, D2f] = fpascal();

%x0 = 4*ones(4, 1);
x0 = [1; zeros(3,1)];
ga = apGrad(f, x0) %gradiente aproximado
ge = Df(x0)  %gradiente exacto

errans = norm(ga - ge, 'inf') %aproximamos la norma infinita, el error
errel = norm((ga-ge)./ge, 'inf')
