% esfera.m 
% 26.oct.20
% Script donde se resuelve el problema:
% min fesfera(x)
%   s.a. hesfera(x) = 0
% Organización de este script:
%   Primero obtenemos puntos iniciales y los graficamos en la esfera
%   unitaria en R^3
%   Luego resolvemos el problema de optimización anterior con nuestro
%   método, pcsglobal (para ver qué funciones necesita ver dicha función) y
%   también graficamos los puntos óptimos.
%   Al final resolvemos el problema anterior con la función de Matlab
%   fmincon y graficamos los puntos óptimos
%   Al obtener la diferencia en norma de los valores f(x*) de nuestro
%   método con el de Matlab vemos que estos diferen en órden de 1e-06.
%
% Optimización Numérica
% ITAM Otoño 2020
% Equipo: Santiago Muriel
%         Mariana G Martinez
%         Roman Velez


% Primero vamos a graficar los puntos iniciales sobre la esfera unitaria
close all
clear all

figure(1)

[a b c] = sphere(40);
w = surfl(a, b, c); 
set(w, 'FaceAlpha', 0.6)
set(w, 'FaceColor', [2/255 21/255 93/255])
axis equal
hold on

np = 21;

P = randn(3,np); %  P(:,j) es un vector en R^3
x0 = zeros(3*np,1);
for j = 1:np
    v = P(:,j); 
    nv = norm(v);
    P(:,j) = v/nv;
    x(3*(j-1)+1:3*j) = P(:,j);
    scatter3(P(1,j), P(2,j), P(3,j), 50, 'MarkerEdgeColor', [0 39/255, 1] ,'MarkerFaceColor',[162/255 1 0])
    hold on
end
title('Inicio con x0, puntos random')

x0 = P(:);

% optimizacion con nuestro método y graficación con los puntos obtenidos
% aquí
fx = 'fesfera';
hx = 'hesfera';
[x, lambda, k] = pcsglobal(fx, hx, x0);

figure(2)

[a b c] = sphere(40);
w = surfl(a, b, c); 
set(w, 'FaceAlpha', 0.6)
set(w, 'FaceColor', [26/255 63/255 169/255])
axis equal
hold on
P = zeros(3, np);
for j = 1:np
    P(:, j) = x(3*(j-1)+1:3*j);
    scatter3(P(1,j), P(2,j), P(3,j), 50, 'MarkerEdgeColor', [0 39/255, 1] ,'MarkerFaceColor',[162/255 1 0])
    hold on
end
title('Optimizacion con nuestra función')

% optimización con MATLAB y graficación con los puntos obtenidos aquí
options.MaxFunctionEvaluations= 1e+06;
options = optimset('Algorithm','sqp', 'Display','iter');
[xf,fx, exitflag, output] = fmincon('fesfera',x,[],[],[],[],[],[],'hesferaM', options);

figure(3)

[a b c] = sphere(40);
w = surfl(a, b, c); 
set(w, 'FaceAlpha', 0.6)
set(w, 'FaceColor', [0 0 190/255])
axis equal
hold on
P = zeros(3, np);
for j = 1:np
    P(:, j) = xf(3*(j-1)+1:3*j);
    scatter3(P(1,j), P(2,j), P(3,j), 50, 'MarkerEdgeColor', [0 39/255, 1] ,'MarkerFaceColor',[162/255 1 0])
    hold on
end
title('Optimizacion con funciones de Matlab')



% Vemos que nuestro método obtiene un valor muy cercano de f comparado con
% lo que se obtiene en Matlab, nos gusta :)
norm(fx-fesfera(x))

 
 


