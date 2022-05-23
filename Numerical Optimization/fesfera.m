function [f] = fesfera(x) 
% Funcion de repulsion para (n/3) puntos en la esfera unitaria de dimension
% 3 con la norma 2. Ver el PDF del segundo proyecto.
%
% Optimizacion Numerica
% 20.oct.20 (clase)
% ITAM
% Dr. Zeferino Parada Garcia

n = length(x);
np = floor(n/3); % numero de puntos en la esfera, por si alguien se equivoco y n no es divisible entre 3
f = 0; % es acumulativa

for i = 1:np-1
    ui = x(3*(i-1)+1 : 3*i); % punto fijo, anclados al punto ui
    for j = i+1:np
        uj = x(3 * (j-1) + 1 : 3*j); % extraemos la coordenada
        f = f + 1/norm(ui - uj); % la funcion crece en sumandos
    end
    
end

end