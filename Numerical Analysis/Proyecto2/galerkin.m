% script: galerkin.m
% Resolver por medio de Galerkin
% y'' = 4*y
% y(0) = 1
% y(1) = 3

n = 10; % la partición tiene 11 puntos (n+1)
np = n +1;
h = 1/n;

% diagonal de la matriz
alfa = ((8/3)*h) + (2/h);
beta = ((2/3)*h) - (1/h);

a = alfa*ones(np, 1); %diagonal
b = beta*ones(np-1, 1); %supradiagonal
c = beta*ones(np-1, 1); %subdiagonal, es una matriz tridiagonal simétrica

%lado derecho del sistema

d = zeros(np, 1);
d(1) = -beta;
d(np) = -3*beta;

[cx] = tridiagonal(a, b, c, d);
cx


%Graficacion con los B-Splines
t = linspace(0, 1, np)';

%subintervalo [t_0, t_1]
st = linspace (t(1), t(2), 5)';
u1 = cx(1)*((t(2)-st)/h);
u2 = cx(2) * ((st - t(1))/h);
u = u1 + u2;

plot (st, u, 'dr', st, u, '-b', 'Linewidth', 3)
hold on

for i = 2:n-1
    st = linspace (t(i), t(i+1), 5)';
    u1 = cx(i)*((t(i+1) - st) /h);
    u2 = cx(i+1)*((st - t(i))/h);
    u = u1 + u2;
    plot (st, u, 'dr', st, u, '-b', 'Linewidth', 3)
    hold on
end