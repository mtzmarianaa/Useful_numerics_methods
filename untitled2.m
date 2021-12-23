clear; close all; clc;

[f, Df, D2f] = fpascal();


x0 = 4*ones(4, 1);
tol = 1e-5;
maxiter = 100

%[xk, iter] = desCoor( f, x0, tol, maxiter )
%[xk, iter] = desMax( f, x0, tol, 10000 )
%[xk, iter] = desNewton( f, x0, tol, 10000 )
%[xk, iter] = desMaxQuad( f, x0, tol, 10000 )
[xk, iter] = desMaxIP( f, x0, tol, 10 )

ga = apGrad(f, xk);
ge = Df(xk);

%errabs = norm(ga - ge, 'inf') %aproximamos la norma infinita, el error
%errrel = norm((ga-ge)./ge,'inf')