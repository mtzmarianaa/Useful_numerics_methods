function [Q,R] = Householder(A)
%Se calcula la factorización QR de la matriz A por medio de reflexiones 
% de Householder. 
% In 
% A.- matriz mxn tal que m >= n y las n columnas de A son linealmente
%   independientes. 
% Out 
% Q.- matriz ortogonal de orden mxm. 
% R.- matriz triangular superior de orden mxn. 
% Se tiene que : A= Q*R
%------------------------------------------------------------------------
% Cálculo Numérico 
% ITAM 
% 28 de agosto de 2018. 
%------------------------------------------------------------------------
%
[m,n] = size(A); 
R = A; 
Q = eye(m); 

for j = 1:n
    a = R(j:m, j); %Columna de A 
    e1= zeros(m-j+1,1); e1(1)= 1.0; %El vector canónico
    u= a + sign(a(1))* norm(a)*e1; 
    u= u/norm(u); 
    Qj= eye(m-j+1) - 2*(u*u');  %Reflexión de Householder 
    Qj= [eye(j-1) zeros(j-1, m-j+1); zeros(m-j+1,j-1) Qj]; 
    %Entradas de la Matriz por bloques. 
    R= Qj*R; 
    Q= Qj*Q; 
end
Q= Q'; 

