function [g, hx] = restriccionesMatlab(w)
% Restricciones de desigualdad para el problema geométrico
% IN
%   w: vector de 2(n-1) con coordenadas polares de vértices del polígono
% OUT
%   g: vector de n(n-1)/2 con las restricciones
% Optimización numérica 2020
% 24.nov.20

[dimension2, ~] = size(w);
n = floor( dimension2/2 ) + 1;

gx = [];
gth1 = [];
gth2 = [];
gth3 = [];
gth4 = [];
gth5 = [];

gx = w(1:(n-1)).*w(1:(n-1)) - 0.3;
gx = [gx; 1 - w(1:(n-1)).*w(1:(n-1)) ];



for k = 1:( n - 1 )
    rk = w( k );  % el vector esta dividido, las primeras son los modulos
    thetak = w( (n-1)+k ); % los segundos son los angulos
    
    if (k ~= (n-1))
        for i = (k+1):(n-1)
            ri = w( i );
            thetai = w( (n-1) + i );
            aux = rk * rk + ri * ri - 2 * rk * ri * cos( thetak - thetai );
            gx = [gx; 1-aux];
            gx = [gx; aux - 0.3]; % que nunca un punto se junte con el otro
        end
        gth1 = [gth1; w( n + k ) - thetak];
    end
    
  
    gth2 = [gth2; thetak];
    gth3 = [gth3; pi - thetak];
    gth4 = [gth4; rk];
    gth5 = [gth5; 1 - rk];
    
end


g = -[ gx ; gth1 ; gth2 ; gth3 ; gth4 ; gth5 ];
hx = [];

end