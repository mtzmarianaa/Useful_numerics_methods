% scriptvpqr.m
% Calcula los valores propios de una matriz
% superior de Hessenberg.
n = 10;
A = rand(n);
[Q, R] = qr(A); % haremos nuestra factorizaci´on QR
V = diag(1 : n);
A = Q'* V *  Q; % valores propios de A son 1, 2, . . . , 10
H = hess(A);
for k = 1 : 100
[Q, R] = qr(H);
H = R *  Q;
end