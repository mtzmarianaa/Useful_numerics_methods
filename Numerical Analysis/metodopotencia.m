function [lambda,v] = metodopotencia(A)
%Metodo de la potencia para aprximar el valor propio dominante de la
%   matriz A de orden nxn. 
% In 
% A. matriz de orden nxn no singular 
% Out 
% lambda. número real con la aproximación al valor propio dominante en
%   valor absoluto. 
% v. vector propio asociado a lambda. 
%------------------------------------
% Cálculo Numérico 
% ITAM 
% 14 de agosto de 2018. 
[n,m] = size (A); 
v= zeros (n,1); v(1)= 1.0; %vector columna con n renglones. 

for k=0:10
    v = A*v; 
    v = v/ norm(v); %saca la norma euclideana. 
    lambda = v'*A*v; 
end

