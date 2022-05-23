% script file: Proyecto final _ Optimizacion Numerica
% Problema: Poligono chico de area maxima.
%

clear all
close all
clc

warning('off','all');
options = optimset('Display','off',...
    'Algorithm','interior-point');

n = 4:13;
fobjj = 'fobjetivo';
fobjj2 = 'fobjetivo2';
fineqq = 'restricciones';
fineqq2 = 'restricciones2';

N = length(n);

Fx = zeros(N,1);
Fmat = Fx;
tiemponos = Fx;
tiempomat = Fx;

t = (0:0.01:1)*2*pi;
xx = 0.5.*(cos(t));
yy = 0.5.*(sin(t) + 1);

CNPO = zeros(N,1);
sigmas = [0.285 0.281 0.275 0.281 0.262 0.291 0.295 0.291...
    0.269 0.252];

for k = 1:N
    % punto inicial
    x0 = [linspace(0,pi,n(k)-1)';ones(n(k)-1,1).*0.2];
    
    tiemponos(k) = cputime;
    [xstar, fx, output] = puntosInteriores(fobjj, fineqq, x0,...
        sigmas(k));
    tiemponos(k) = cputime - tiemponos(k);
    
    tiempomat(k) = cputime;
    [xmat, fmat, ~, outmat] = fmincon(fobjj2, ...
        x0,[],[],...
        [],[],[],[],fineqq2,options);
    tiempomat(k) = cputime - tiempomat(k);
    
    Fx(k) = fx;
    Fmat(k) = fmat;
    
    % --- aqui se completan los vectores
    X0 = [x0(1:n(k)-1);pi;x0(n(k):2*(n(k)-1));0];
    Xstar = [xstar(1:n(k)-1);pi;xstar(n(k):2*n(k)-2);0];
    xmat = [xmat(1:n(k)-1);pi;xmat(n(k):2*n(k)-2);0];
    % ---
    
    % graficacion
    [x, y] = pol2cart(X0(1:n(k)),X0(n(k)+1:2*n(k)));
    [xs, ys] = pol2cart(Xstar(1:n(k)),Xstar(n(k)+1:2*n(k)));
    [matX, matY] = pol2cart(xmat(1:n(k)), xmat(n(k)+1:2*n(k)));
    
    CNPO(k) = output.CNPO;
    
    if k<=6
        
        h1 = figure(1);
        subplot(2,3,k);
        plot(x,y,'-+r',...
            xs, ys, '-co', ...
            matX,matY,'--m',xx,yy,'b',...
            'LineWidth',1.001);
        axis square
        str = strcat('Poligono de: ',num2str(n(k)),' puntos.');
        title(str, 'fontsize',15);
        legend('x0','x*', 'matlab');
        
    else
        h4 = figure(4);
        subplot(2,2,k-6);
        plot(x,y,'-+r',...
            xs, ys, '-co', ...
            matX,matY,'--m',xx,yy,'b',...
            'LineWidth',1.001);
        axis square
        str = strcat('Poligono de: ',num2str(n(k)),' puntos.');
        title(str, 'fontsize',15);
        legend('x0','x*', 'matlab');
    end
    
        h2 = figure(2);
        FX = zeros(output.iteracionesTotales,1);
    
        for i=1:length(output.trayectoria(1,:))
            FX(i) = -fobjetivo(output.trayectoria(:,i));
        end
    
        subplot(5,2,k)
        plot(1:length(FX),FX,'-.b');
        hold on
        plot([0 75],[pi/4 pi/4], '-r');
        hold off
        %legend('funcion objetivo');
        str = strcat('Evolucion de f(x).',...
            'n = ', num2str(n(k)));
        title(str, 'fontsize',15);
    
    if k<=6
        h3 = figure(3);
        subplot(2,3,k);
        patch(matX,matY,'b');
        hold on
        patch(xs,ys,'g');
        hold off
        alpha(0.4);
        %legend('Matlab', 'Nuestra');
        axis square;
        str = strcat('Poligono de: ',num2str(n(k)),' puntos.');
        title(str, 'fontsize',15);
    else
        h5 = figure(5);
        subplot(2,2,k-6);
        patch(matX,matY,'b');
        hold on
        patch(xs,ys,'g');
        hold off
        alpha(0.4);
        %legend('Matlab', 'Nuestra');
        axis square;
        str = strcat('Poligono de: ',num2str(n(k)),' puntos.');
        title(str, 'fontsize',15);
    end
    
end

h6 = figure(6);
stem(n,CNPO, 'Linewidth',1.001);
title('CNPO para los distintos problemas', 'fontsize', 15);
axis([3.8 13.2 0 0.71])
grid

h7 = figure(7);
plot(n,-Fx,'-bo',...
    n,-Fmat,'-.r',...
    'LineWidth', 1.001);
title('Comparacion de f(x)', 'fontsize',15);
legend('Nuestra', 'Matlab', 'Location','SouthEast');
grid

h8 = figure(8);
plot(n,tiemponos,'-bo',...
    n,tiempomat,'-.r',...
    'LineWidth', 1.001);
title('Tiempo de solucion', 'fontsize',15);
legend('Nuestra', 'Matlab', 'Location','SouthEast');
grid