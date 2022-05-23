% script_google.m 

% Ejemplo de rango de páginas de google 

% matriz estocástica
A = zeros(8); 
A(2:4,1) = (1/3)*[1;1;1];
A(4:5,2) = (1/2)*[1;1];
A(1,3) = 1/2; A(4,3) = 1/2;
A(2,4) = 1/2; A(7,4) = 1/2;
A(7,5) = 1;
A(5,6) = 1/2; A(8,6) = 1/2;
A(6,7) = 1;
A(6:7,8) = (1/2)*[1;1];

A;
%Matriz estocástica constante 
B= (1/8) * ones(8); 
%Probabilidad de surfear por la red (valor elegido por nosotros 0>=d<=1) 
d= .85; 

%Matriz estocástica de Google 
M = d*A + (1-d) * B; 

%Cálculo de valor propio dominante de M
[lambdavec,lambda, v] = cocienteraleigh(M);

%vector propio estocástico 
z = sum(abs(v)); 
disp('Vector estocástico')
disp(' ---------------------- ')
v = v/z
disp(' ---------------------- ')
w = sum(v) 









