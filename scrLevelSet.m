clear;   close all;   clc;

% level sets
f = @(x,y) 2*x.^2 + 5*y.^2;
stepsize =  0.01;  % mas chico hace los conjuntos de nivel mas detallados
[X,Y] = meshgrid(-2:stepsize:2);
z = f(X,Y);
niveles = [0.1, 1:5];
contour(X,Y,z, niveles)

axis equal


% example iteration history
hold on
x = [2:-0.2:0];
y = x/2;
plot(x,y,'--d')
hold off
