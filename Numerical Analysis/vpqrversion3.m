function [H,QS] = vpqrversion3(A)
%M�todo QR para aproximar los valores propios de la matriz A de nxn. 

%En la version tres utilizamos la factorizacion QR de Householder que
%programamos. 
%Out 
% H.- matriz nxn donde una de las siguientes condiciones se cumple. 
%       a) H es triangular superior con los valores propios de A en la
%       diagonal de H. 
%       b) H es triangular superior de Hessenberg. 
%       c) H es diagonal con los valores propios de A en la diagonal. 
%----------------------------------------------------------------------
% C�lculo Num�rico 
% ITAM
% 4 de septiembre de 2018. 
%----------------------------------------------------------------------
%  
H = hess(A);       % copia de la matriz H 
tol = 1.e-8;       %criterio de paro en la norma de las matrices 
parar= 1.0;         % escalar de paro 
[n,n]= size(H);     % dimensi�n de la matriz 
maxiter= n^3;       % n�mero m�ximo de iteraciones 
k=0;               % contador de iteraciones 
QS= eye(n); 
while (parar> tol && k< maxiter) 
    [Q,R] = qr(H); 
    HNEW= R*Q;
    QS= QS*Q; 
    parar= norm(diag(H-HNEW)); 
    k = k+1; 
    H= HNEW; 
end 
k

end

