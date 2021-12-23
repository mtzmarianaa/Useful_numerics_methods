clear;   close all;   clc; format long;


%% Tarea 2.1. Dibujar en 3D
% De aqui sacamos la figura 1
figure()
Graphs

%De aqui sacamos la figura 2 y apuntamos al punto (3.1, 3.1, -0.9948)
figure()
Graphs2

%De aqui sacamos la figura 3 (trust region con gradiente y Hessiana exactos)

figure()
plot3D

%De aqui sacamos la figura 4 (trust region con gradiente y Hessiana
%aproximados)

figure()
plot3D2

%% Tarea 2.2. Dibujar direcciones en 2D
% De aqui sacamos la figura 5
figure()
plot2D

% De aqui sacamos la figura 6
figure()
plot2D2


%% Tarea 2.3. Iteraciones y error
% Definimos el punto inicial, la funcion de Easom y el punto optimo el cual
% sacamos analiticamente (para probar cuanto es el error).
x0 = [1;1]; %punto inicial
[f,~,~] = fEasom();
x_star = [pi;pi];

%tarea 2.3.1 MRC1

[x1,msg1, XK1, EXTRAS1] = mRC1(f,x0,100,x_star);

%Creamos una tabla mostrando los resultados pedidos
Iter1 = [3:1:10]';
fxk1 = EXTRAS1(3:10, 1);
normH1 = EXTRAS1(3:10, 2);
distOp1 = EXTRAS1(3:10, 3);

T1 = table(Iter1, fxk1, normH1, distOp1)

%tarea 2.3.2 MRC2
[x2,msg2, XK2, EXTRAS2] = mRC2(f,x0,100,x_star);

%Creamos una tabla mostrando los resultados pedidos
Iter2 = [1:1:6]';
fxk2 = EXTRAS2(:, 1);
normH2 = EXTRAS2(:, 2);
distOp2 = EXTRAS2(:, 3);

T2 = table(Iter2, fxk2, normH2, distOp2)


%% Tarea 2.4 Visualizacion
% 2.3.1
%Cauchy
% level sets
[f, Df, D2f] = fEasom;
F = @(x,y) -cos(x).*cos(y).*exp(-(x-pi).^2. - (y-pi).^2.);

%Punto inicial, delta, g y B;
x0    = [pi;pi];
f0 = f(x0);
g = Df(x0);
B = D2f(x0);

figure()
stepsize =  0.1;  % mas chico hace los conjuntos de nivel mas detallados
[X,Y] = meshgrid(-2:stepsize:1.5); % Region de confianza de la direcciones para el modelo cuadratico
% Modelo cuadratico
m  = @(p1,p2)   f0 + g(1).*p1 + g(2).*p2 + 1/2.*p1.*(B(1,1).*p1 + B(1,2).*p2) + 1/2.*p2.*(B(2,1).*p1 + B(2,2).*p2);
z = m(X,Y);
% Conjuntos de nivel
contour(X+x0(1),Y+x0(2),z)
axis equal


hold on
x11 = XK1(1,:);
x22 = XK1(2,:);
plot(x11,x22,'r--*')
hold off



%% 2.3.2
% level sets
%Newton
[f, Df, D2f] = fEasom;
F = @(x,y) -cos(x).*cos(y).*exp(-(x-pi).^2. - (y-pi).^2.);

%Punto inicial, delta, g y B;
x0    = [pi;pi];
f0 = f(x0);
g = Df(x0);
B = D2f(x0);

figure()
stepsize =  0.1;  % mas chico hace los conjuntos de nivel mas detallados
[X,Y] = meshgrid(-2:stepsize:1.5); % Region de confianza de la direcciones para el modelo cuadratico
% Modelo cuadratico
m  = @(p1,p2)   f0 + g(1).*p1 + g(2).*p2 + 1/2.*p1.*(B(1,1).*p1 + B(1,2).*p2) + 1/2.*p2.*(B(2,1).*p1 + B(2,2).*p2);
z = m(X,Y);
% Conjuntos de nivel
contour(X+x0(1),Y+x0(2),z)
axis equal


hold on
x11 = XK2(1,:);
x22 = XK2(2,:);
plot(x11,x22,'g--d')
hold off

