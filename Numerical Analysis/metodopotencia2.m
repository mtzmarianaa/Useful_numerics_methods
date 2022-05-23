function [lambdavec, lambda, v] = metodopotencia2(A)
% Método de la potencia para aproximar el valor propio dominante de la
% matriz A de orden nxn.
% In
% A.- matriz de orden nxn no singular
% Out
% lambdavec. vector con la aproximación en cada iteración al valor propio 
%           dominante en valor absoluto .
% lambda.- aproximacion al valor propio dominante.
% v.- vector propio asociado a lambda.
%---------------------------------------------------
%  Cálculo Numérico
% ITAM
% 14 de agosto de 2018.
%-------------------------------------------------
tol = 1.e-08;  % tolerancia a la aproximación al valor propio y la norma
tolvar = 1.0;
tolvec = 1.0;
[n,m] = size(A);
 v = ones(n,1); ;
 lambda = v'*A*v;
 maxk = n*n;
 k = 0;
 lambdavec = [];
 while( tolvar > tol  && tolvec > tol && k < maxk)
     v1 = A*v;                         % multiplicación matriz vector
     v1 = v1/norm(v1);                 % normalización
     lambda1 = v1'*A*v1;               %  cociente de Raleigh
     tolvar = abs(lambda - lambda1);   % tolerancia a las aproximaciones.
     tolvec = norm(v1 - v);            % tolerancia a los vectores
     lambda = lambda1;                 %  actualizamos el cociente de Raleig
     lambdavec = [lambdavec ; tolvar]; % se guarda el vector de tolerancias
     v = v1;                           % se actualiza el vector
     k = k +1;                         % conteo de las iteraciones 
 end

end

