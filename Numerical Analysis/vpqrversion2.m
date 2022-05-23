function [H] = vpqrversion2(A)
%Método QR para aproximar los valores propios de la matriz A de nxn. 

%En la version dos utilizamos la factorizacion QR de Householder que
%programamos. 
%Out 
% H.- matriz nxn donde una de las siguientes condiciones se cumple. 
%       a) H es triangular superior con los valores propios de A en la
%       diagonal de H. 
%       b) H es triangular superior de Hessenberg. 
%       c) H es diagonal con los valores propios de A en la diagonal. 
%----------------------------------------------------------------------
% Cálculo Numérico 
% ITAM
% 28 de agosto de 2018. 
%----------------------------------------------------------------------
%  
H = A;      % copia de la matriz H 

for k= 1: 500
    [Q,R] = Householder(A); 
    H= R*Q; 
end 


end
