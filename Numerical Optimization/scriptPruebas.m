% pruebas
%

clear all
close all
clc

warning('off','all');

options = optimset('Display','off',...
    'Algorithm','interior-point');

n = input('Da el numero de vertices:\n _');
%x0 = puntoInicial(n);
x0 = [linspace(0,pi,n-1)'; ones(n-1,1).*0.2];

fobjj = 'fobjetivo';
fineqq = 'restricciones';
fineqq2 = 'restricciones2';
fineqq3 = 'restricciones3';

lbound = zeros(2*n-2,1);
ubound = [pi.*ones(n-1,1);ones(n-1,1)];

[xstar, fx, output] = puntosInteriores(fobjj, fineqq, x0);

[xmat, fmat, ~, outmat] = fmincon(fobjj,...
    x0, [],[],...
    [],[],[],[],fineqq2,options);

disp(output);

% --- aqui se completan los vectores
X0 = [x0(1:n-1);pi;x0(n:2*(n-1));0];
Xstar = [xstar(1:n-1);pi;xstar(n:2*n-2);0];
xmat = [xmat(1:n-1);pi;xmat(n:2*n-2);0];
% ---

%% graficacion
t = (0:0.01:1)*2*pi;
xx = 0.5.*(cos(t));
yy = 0.5.*(sin(t) + 1);

[x, y] = pol2cart(X0(1:n),X0(n+1:2*n));
[xs, ys] = pol2cart(Xstar(1:n),Xstar(n+1:2*n));
[matX, matY] = pol2cart(xmat(1:n), xmat(n+1:2*n));

figure(1)
plot(xx,yy,'b',x,y,'-+r',...
    xs, ys, '-co', ...
    matX,matY,'--m',...
    'LineWidth',1.001);
axis square
str = strcat('Poligono de: ',num2str(n),' puntos.');
title(str, 'fontsize',15);
legend('Circulo Unitario', 'punto inicial',...
    'Solucion nuestra', 'optimo matlab');

% A continuacion, grafico los valores de la funcion objetivo
% como cambia con la trayectoria que va tomando el algoritmo
%
FX = zeros(output.iteracionesTotales,1);

for i=1:length(output.trayectoria(1,:))
    FX(i) = -fobjetivo(output.trayectoria(:,i));
end

figure(2)
stem(1:length(FX),FX,'b');
legend('funcion objetivo');
title('Evolucion de la funcion objetivo.', 'fontsize',15);

figure(3)
patch(xs,ys,'g');
hold on 
patch(matX,matY,'b');
hold off
alpha(0.4);
legend('Solucion nuestra', 'Solucion de Matlab');
axis square;
str = strcat('Poligono de: ',num2str(n),' puntos.');
title(str, 'fontsize',15);

