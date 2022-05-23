clear; close all; clc

n = 100;
e = ones(n, 1);
A = spdiags([e, 2*e, e], -1:1, n, n);
b = ones(n, 1);

tol = 1e-14;
x0 = zeros(n, 1);
[x1] = mCG(A, b, x0, tol);
[x2] = mDesCic(A, b, x0, tol);
xML = A\b;
norm(x1-xML, 'inf')
norm(x2-xML, 'inf')
norm(A*x1 - b, 'inf')