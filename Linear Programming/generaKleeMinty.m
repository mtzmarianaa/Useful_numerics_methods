function [A, b, c] = generaKleeMinty(m)
%Este es el c�digo correspondiente a a KleeMinty 
%Todos los coeficientes de x son -1 
c = zeros(m,1);
A = zeros(m,m);
b = zeros(1,m); 
b (1,1) = 1;  
for i = 1:m
    c(i,1) = -1; 
end 

for i = 2:m 
    for j = 1:i-1 
        A(i,j) = 2; 
        A(i,j+1)=1; 
    end 
end

A(1,1) = 1;

for i = 2:m
    b(1,i)= 2^i - 1;  
end 

b = transpose(b); 
end

