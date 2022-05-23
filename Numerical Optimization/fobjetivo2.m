function [fx] = fobjetivo2(x)
%                FUNCION OBJETIVO 2
%
%   

n = length(x)/2;

X = [x(1:n);pi;x(n+1:2*n);0];
n = length(X)/2;

th = X(1:n);
r = X(n+1:2*n);

fx = 0;
for i = 1:n-1 %
    fx = fx + r(i+1)*r(i)*sin(th(i+1) - th(i));
end

fx = -0.5*fx;