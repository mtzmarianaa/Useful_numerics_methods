function [A] = Jacobiana(fname,x)
% Aproximaci?n a la matriz jacobiana de la funci?n
% fname: R^n ---> R^m

%In
% fname: cadena de caracteres con el nombre de la funci?n.
% x.- vector columna de orden n.
%Out
% A.- matriz mxn tal que (A)_(i,j) aproxima a ( d h_i (x))/ d x_j)
%
%

hx = feval(fname,x);     
n = length(x);          % dimensi?n de la variable primal
m = length(hx);         % # de restricciones.
A = zeros(m,n);         % espacio para la matriz jacobiana
h = 1.e-06;             % tama?o de paso para aproximar la derivada.

for j = 1:n
    xt = x;
    xt(j) = xt(j) + h;
    A(:,j) = (feval(fname,xt) - hx)/h;   % columna j-esima de la matriz jacobiana
end
    
% Programado por:
%
%           Jose Alonso Solis 
%           Roberto Ivan Lopez Lopez
%           Ernesto Jesus Ulloa Perez
%           Adolfo Martinez Gonzalez
