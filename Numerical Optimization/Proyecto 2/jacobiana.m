function [jh] = jacobiana(hx, x0)
% Calcula la matriz jacobiana de hx

% EL GRADIENTE Y LA JACOBIANA SE TIENEN QUE APROXIMAR DE LA MISMA FORMA
% Equipo: Santiago Muriel
%         Mariana G Martinez
%         Roman Velez

n = length(x0);
h = feval(hx, x0);
m = length(h);

jh = zeros(m,n);
ep = 1e-05;

for j = 1:n
    y = x0;
    y(j) = y(j) + ep;
    hy = feval(hx, y);
    jh(:,j) = (hy - h)/ep; 
end

end