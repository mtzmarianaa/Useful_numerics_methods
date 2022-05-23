function [lambdavec,lambda, v] = cocienteraleigh(A)
% M�todo de la potencia inversa con cociente de Raleigh para aproximar el 
% valor propio dominante de la matriz A de orden nxn
% In
% A.- matriz de orden nxn no singular.
% mu .- escalar que representa el recorrimiento para la matriz.
% Out
% lambdavec. vector con la aproximaci�n en cada iteraci�n al valor propio 
%           dominante en valor absoluto .
% lambda. n�mero real con la aproximaci�n al valor propio dominante en
%         valor absoluto.
% v.- vector propio asociado a lambda.
%-----------------------------------------------------
%  C�lculo Num�rico
% ITAM
% 14 de agosto de 2018.
%-------------------------------------------------
tol = 1.e-08;  % tolerancia a la aproximaci�n al valor propio y la norma
tolvar = 1.0;
tolvec = 1.0;
[n,m] = size(A);
 v = ones(n,1);
 lambda = v'*A*v;  % cociente de Raleigh y primer escalar de recorrimiento
 maxk = n*n;
 k = 0;
 lambdavec = [];
 
 while( tolvar > tol  && tolvec > tol && k < maxk)
     v1 = (A-lambda*eye(n))\v;           % multiplicaci�n matriz vector
     v1 = v1/norm(v1);                   % normalizaci�n
     lambda1 = v1'*A*v1;                 % cociente de Raleigh para A
     tolvar = abs(lambda - lambda1);     % tolerancia
     tolvec = norm(v1 - v);              % tolerancia entre vectores
     lambda = lambda1;                   % actualizamos lambda
     lambdavec = [lambdavec ; tolvar];   % vector  de tolerancias
     v = v1;                              % se actualiza el vector
     k = k +1;                            % conteo de iteraciones  
 end

end

