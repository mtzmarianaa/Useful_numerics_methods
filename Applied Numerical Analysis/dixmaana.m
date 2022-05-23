function [y] = dixmaana(x)

n = length(x); 
m = floor(n/3);
m2 = 2 * m; 

%Nuestra función es la función DIXMAANA J, por lo que los parámetros son
%los siguientes: 

alpha = 1; 
beta = 0.0625;
gamma = 0.0625; 
delta = 0.0625; 
k1 = 2; 
k2 = 0;
k3 = 0; 
k4 = 2; 

%Construimos la función con base en sumas auxiliares para cada uno de los
%sumandos de la función: 

sumAux1 = 0; 
for i = 1:n
    sumAux1 = sumAux1 + alpha * x(i)^2 * (i/n)^k1; 
end

sumAux2 = 0; 
for i = 1:n-1
    sumAux2 = sumAux2 + beta * x(i)^2 * (x(i + 1) + x(i + 1)^2)^2 * (i/n)^k2; 
end

sumAux3 = 0; 
for i = 1:m2
    sumAux3 = sumAux3 + gamma * x(i)^2 * x(i + m)^4 * (i/n)^k3; 
end

sumAux4 = 0; 
for i = 1:m
    sumAux4 = sumAux4 * delta * x(i) * x(i + m2) * (i/n)^k4; 
end

y = 1 + sumAux1 + sumAux2 + sumAux3 + sumAux4; 

% Se define la funcion con un ciclo for y varios ifs anidados

% % % A continuacion se definenn los parametros para la funcion DIXMAANA I
% % alpha = 1;
% % beta = 0;
% % gamma = 0.125;
% % delta = 0.125;
% % k1 = 2;
% % k2 = 0;
% % k3 = 0;
% % k4 = 2;
% % 
% % % Se parte la funcion en sus 4 sumas y se inicializa cada una
% % y1 = 0;
% % y2 = 0;
% % y3 = 0;
% % y4 = 0;
% % 
% % for i = 1:n
% %     y1 = y1 + alpha*(x(i)^2)*(i/n)^k1;
% %     if i <= n-1
% %         y2 = y2 + beta*(x(i)^2)*((x(i+1) + x(i+1)^2)^2)*(i/n)^k2;
% %     end
% %     if i <= 2*m
% %         y3 = y3 + gamma*(x(i)^2)*(x(i+m)^4)*(i/n)^k3;
% %     end
% %     if i <= m
% %         y4 = y4 + delta*x(i)*x(i+2*m)*(i/n)^k4;
% %     end     
% % end
% % 
% % y = 1 + y1 + y2 + y3 +y4;
% % 
% % end

%Se define la funcion en su forma vectorizada
% y = 1 + dot(x'.*((1:n)/n),x'.*((1:n)/n)) + ...
%     (0.125)*sum( (x(1:2*m).^2).*(x(1+m:3*m).^4) ) + ...
%     (0.125)*sum( (x(1:m).*x(1+2*m:3*m))'.*(((1:m)/n).^2) );
