% Script: comparacionqp.m
% Comparacion entre quadprog.m y qpintpoint.m
% Generar problemas aleatorios de dimension mayor
% resolvemos con cada codigo/ calidad de la solucion / cputime
%
% Optimizacion Numerica
% ITAM
% 24.sep.20
%
% Q nxn spd
% A mxn y rango(A) = m
% F pxn
% c en R^n, b en R^m, d en R^p.
% dimensiones n, m, p
%---------------------------------------
tau = 0.75; % Para ver que tan hueca es, si tau es cercano a cero es mas
% hueca, si es cercana a uno es mas rellena
bag1 = [];
bag2 = [];
for n = 20:30:1000
    m = floor(n/2); %Las dimensiones que necesitamos
    p = floor(n/3);
    [Q,A,F,c,b,d] = Generapc1(n,m,p,tau); 
    t = cputime;
    [x,y,mu,z] = qpintpoint(Q,A,F,c,b,d);
    s = cputime;
    bag1 = [bag1; s-t];
    % Ahora lo resolvemos con quadprog, herramienta de Matlab
    t = cputime;
    [x,fx, exitflag, output] = quadprog(Q, c, -F, -d, A, b);
    s = cputime;
    bag2 = [bag2; s-t];
end

% Vamos a graficar

w = [20:30:1000]';
plot(w, bag1, 'dr', w, bag1, 'b', w, bag2, 'sg', w, bag2, 'm', 'Linewidth', 3)
title('cputime en QP/quadprog vs puntos interiores', 'Fontsize', 16)
xlabel('Dimension en n', 'Fontsize', 16)
ylabel('CPUTIME', 'Fontsize', 16)


% quadprog es para optimizacion cuadratica, es analogo a linprog
% pero para cosas cuadraticas
% quadprog es un codigo ya compilado, ya no compila a diferencia
% de nuestro codigo y tiene varias maneras de resolver esto, de manera
% eficiente, analiza la matriz, ve las caracteristicas y basandose en 
% todo esto decide que metodo usar, si le ponemos output nos dice como 
% resolvio nuestro problema (<3)




