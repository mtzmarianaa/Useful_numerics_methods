% graficaesfera.m
% 20.oct.20
% vamos a graficar una esfera
close all
clc
clear all

[x y z] = sphere(50);
h = surfl(x, y, z); 
set(h, 'FaceAlpha', 0.4)
set(h, 'FaceColor', [47/255 47/255 127/255])
axis equal
hold on

np = 30;

P = randn(3, np);

% estos puntos se grafican en dimension 3, ponemos sus coordenadas
x = zeros(3*np, 1);

for j = 1:np
    % ahora los vamos a normalizar (escalar)
    v = P( : , j ); % extraemos cada punto
    nv = norm( v );
    P( : , j ) = v/nv;
    x( 3 * ( j - 1 ) + 1 : 3 * j) = P( : , j ); % lo ponemos en forma matricial
    plot3( P( 1 , j ) , P( 2 , j ) , P( 3 , j ), 'rd', 'Linewidth', 3)
    hold on
end

% Resolvemos por Matlab
[x, fval, exitflag, output] = fmincon('fesfera', x, [],[],[],[],[],[], 'hesfera2');

