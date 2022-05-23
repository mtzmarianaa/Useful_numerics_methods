%Test Simplex Dual 
%Vamos a insertar un problema de clase para probar 
A = [-1 -2 -1 1 0; -2 1 -3 0 1];
b = [-3 -4]'; 
c = [2 3 4 0 0]'; 
[xo, zo, ban, iter] = mSimplexDual(A,b,c)
