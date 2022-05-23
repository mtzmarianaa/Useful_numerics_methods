function [W] = valoressingulares(A)
%Calculamos los valores singulares de la matriz A
%por medio de la ra'iz cuadrada de los valores propios de:
% 1) A'*A
% 2) A*A'
% por medio del metodo QR
%-------------------------------------------------
%
[m, n] = size (A);

if (n <= m)
    B = A'*A; %matriz de tamaño nxn
else
    B = A*A'; %matriz de tamaño mxm
end

[H,QS] = vpqrversion3(B);
W = sqrt(abs(diag(H)));
end

