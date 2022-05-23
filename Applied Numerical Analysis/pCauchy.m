function [pC] = pCauchy(B, g, delta)
% In : B ... (symmetric matrix) approximates the hessian of f in xk
%       g     ... (vector) gradient of  f  in  xk
%       delta ... trust region radius
%
% Out:  pC    ... The  Cauchy  point

% %Primero calculamos p: 
% p = - (delta/norm(g)) * g;
% 
% %Luego, calculamos p^T Bk p: 
% gnorm = g/norm(g); 
% denominadoraux = dot(gnorm, (B*gnorm));
% 
% %Calculamos alfap para cada caso: 
% if denominadoraux > 0
%     aux = norm(g)^3/(delta * dot(p, (B*p)));
%     alfap = min(0.99*aux, 1);
% else
%     alfap = 1;
% end
% 
% %Calculamos pC
% pC = alfap * p; 

%Versión 2: 

%Calculamos norma de g y normalizamos g: 
gNorm = norm(g); 
g = g/gNorm; 

%Calculamos pk
p = - delta * g;

denominadorAux = dot(g, (B*g));

if denominadorAux > 0
    aux = gNorm/(delta * denominadorAux);
    alfap = min(0.99*aux, 1);
else
    alfap = 1;
end

pC = alfap * p; 

end
    
    
