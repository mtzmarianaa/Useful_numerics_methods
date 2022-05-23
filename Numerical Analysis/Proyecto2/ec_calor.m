% script: ec_calor

a = 0;
b = 2;
tmin = 0;
tmax = 1;
h = 0.1;
hs = 0.004;
n = 20;

nx = 50;
nt = 50;

x = linspace (a, b, nx)';
t = linspace(tmin, tmax, nt)';

sigma = hs/(h^2);

dimn = nx-2; %porque ya conocemos los extremos de la malla
dimt = nt;

A = eye(dimn) - 2*sigma*eye(dimn);

for k = 1:dimn-1
    A(k+1, k) = sigma;
    A (k, k+1) = sigma;
end

% matriz del calor
Z = zeros(dimt, dimn);

Z(1,:) = (sin((2*pi*x(2:dimn+1))).^2)';

for j = 2:dimt
    Z(j,:) = A*(Z(j-1,:))';
end

[T, X] = meshgrid(t, x);

surf(Z)
