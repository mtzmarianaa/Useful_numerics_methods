clear; close all; clc;

[f, Df, D2f] = fpascal();

x0 = 20000*ones(4, 1);
Ha = apHess(f, x0) %gradiente aproximado
He = D2f(x0)  %gradiente exacto

errabs = norm(Ha-He, 'inf') %aproximamos la norma infinita, el error
errel = norm((Ha-He)./He, 'inf')
