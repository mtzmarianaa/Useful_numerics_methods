function [Z] = calorda(a,b,tmin,tmax,N,M)
% Método de diferencias hacia atrás pata la ecuación del calor
%    u_t = D* u_{xx}
%   u(a,tmin) = f(x)    x en [a, b]
%   u(a, t ) = l(t)     t en [tmin, tmax}
%   u(b,t) = r(t)       t en [tmin, tmax]
% con particiones igualmente espaciadas de:
%   [a, b] con N puntos
% [tmin, tmax] con M puntos
%---------------------------------------------------
% Cálculo Numérico
% ITAM
% 27 de noviembre de 2018
% Ana Muñiz Tellería CU: 164840
% Mariana Martínez Aguilar CU: 166297
%------------------------------------------------
close all
% condiciones de la frontera
f =@(x) sin(2*pi*x).^2;
l =@(x)  2*x;
r =@(x) cos(2*pi*x).^2;
D = 1;
%------------------------
x = linspace(a,b,N);            % puntos igualmente espaciados en el eje X
t = linspace(tmin, tmax, M);    % puntos igualmente espaciados en el eje T
h =(b-a)/(N-1) ;                % espacio en el eje X
hs =(tmax-tmin)/(M-1);          % espacio en el eje  T
n = N-2;                        % # de valores a determinar en el je X
Z = zeros(N,M);                 % Z(i,j) es le valor aproximado de u(i,j)
Z(:,1) = f(x);                  % valor de la frontera en el eje X en nivel 1
w1 = l(t );                     % valor de la frontera en puntos (1,j)
w2 = r(t);                      % valor de la frontera en puntos (n,j)

sigma =(D*hs)/(h*h)  ;          % valor de sigma
%------------------------------------------------------
% matriz del sistema tridiagonal/ se guardan la diagonal y las
% subdiagonales
a =(1+2*sigma)*ones(n,1);       % diagonal de la matriz
b =(-sigma)*ones(n-1, 1);       % supradiagonal de la matriz
c =(-sigma)*ones(n-1, 1);       % subdiagonal de la matriz
%----------------------

%Usamos dos auxiliares para calcular el lado derecho de la ecuación
aux1 = ones(N-2, 1);            %aux1 corresponde al vector û
aux2 = zeros(N-2, 1);           %aux2 corresponde al vector w (gorrito)

% Parte iterativa
for j = 2:M
    % se forma le lado derecho del sistema en vector columna, ld, con
    % dimensión N-2
    aux1 = Z(2:N-1, j-1);         %llenamos con los valores del piso anterior
    aux2(1) = sigma*w1(j);        %u(1) correspondiente al primer valor del vector
    aux2(N-2) = sigma*w2(j);      %u(N-2) correponde al úlimo valor del vector
    ld = aux1 + aux2;             %la suma genera el lado derecho
    w = tridiagonal(a,b,c,ld);    % solución del sistema tridiagonal
    Z(:,j) = [w1(j); w ; w2(j)];  % se añaden las condiciones en la frontera
end

% graficación
[X,T] = meshgrid(x,t);
surf(X,T,Z)
xlabel('Eje X', 'Fontsize',16)
ylabel('Eje T','Fontsize',16)
title('Ecuación del Calor con Diferencias Hacia Atrás','Fontsize',16)
end




