function [x, lambda, k] = pcsglobal(fx, hx, x0)
% Método de programación Cuadrática sucesiva con búsqueda en línea usando
% la función de mérito L-1 y actualización de la hessiana con la fórmula
% BFGS para el problema:
%    Min fx
%    Sujeto a hx = 0
% 
% In:
%   - fx:  cadena de caracteres con la función objetivo en Matlab
%   - hx:  cadena de caracteres con la restricción en Matlab
%   - x0:  valor inicial
% Out:
%   - x:      aproximación al mínimo local
%   - lambda:  multiplicador de Lagrande asociado a x
%   - k:       número de iteraciones realizadas
%
% Se deben de usar las funciones: gradiente.m  jacobiana.m  pcmera.m
% El plan de trabajo se puede encontrar en Plan.jpg
%
% ITAM
% Optimización numérica
% Otoño 2020
% Equipo: Santiago Muriel
%         Mariana G Martinez
%         Roman Velez
%

% Obtenemos las dimensiones de nuestro problema:
n = length(x0); % dimension de la variable x
hk = feval(hx, x0); 
m = length(hk); % numero de restricciones

% Definimos los parámetros iniciales
tol = 1e-05;
maxk = 100;
cMax = 1e+05;
maxIter = 10; % máximo 
c1 = 1e-02;
ck = 1; % Parámetro inicial para la función de mérito

Bk = eye(n);
lambda = zeros(m,1); % lambda inicial

gf = gradiente(fx, x0); % calcula el gradiente de fx en x0
jh = jacobiana(hx, x0); % calcula la jacobiana de hx en x0
vk = [gf + jh'*lambda; hk]; % condiciones necesarias de primer orden
xk = x0;
Ak = jacobiana(hx, xk); % calcula la jacobiana inicial de hx en xk

% Empezamos con la parte iterativa
k = 1;

while(norm(vk)>= tol && k <= maxk)
    
    
    % Paso 1, resolvemos el problema cuadrático para pk y lambda con
    % pcmera,m
    [pk, lambda] = pcmera(Bk, Ak, gf ,-hk);
    
    % Paso 2 elegimos una ck
    if ( gf'*pk-ck* norm(hk, 1)< 0 )
        ck = ck;
    else
        ck = min( cMax, ( abs(gf'*pk)/norm(hk, 1) ) + 1 );
    end
    
    % Paso 3, hacemos una búsqueda en línea para encontrar el valor de
    % alpha
    alpha = 5;
    Dpk = gf'*pk - ck*norm(hk, 1);
    iter = 0;
    while ( fMerito(fx, hx, xk + alpha*pk, ck) > fMerito(fx, hx, xk, ck) + alpha*c1*Dpk  && iter <= maxIter)
        alpha = alpha/2;
        iter = iter + 1;
    end
    
    % Paso 4: calculamos y actualizamos
    
    xk = xk + alpha*pk;
    sk = alpha*pk;
    yk = gf + Ak'*lambda;
    
    gf = gradiente(fx, xk); % calcula el gradiente actualizado
    Ak = jacobiana(hx, xk); % calcula la jacobiana actualizada
    
    yk = -yk + (gf + Ak'*lambda);
    hk = feval(hx, xk);
    jh = jacobiana(hx, xk);
    
    % Paso 5: actualización de Bk con la fórmula de BFGS - Powell
    
    if (sk'*yk <= (0.2)*(sk'*Bk*sk) )
        theta = ( 0.8*sk'*Bk*sk )/( sk'*Bk*sk - sk'*yk );
        rk = theta*yk + (1-theta)*Bk*sk;
    else
        rk = yk;
    end
    % Actualizamos Bk y Hk, su inversa
    Bk = Bk - (Bk*(sk*sk')*Bk)/(sk'*Bk*sk) + (rk'*rk)/(sk'*rk);
    
    if( cond(Bk)>1e+04 )
        Bk = eye(n);
    end
    
    
    % Paso 6: Resolvemos el problema de mínimos cuadrados si es necesario
    
    if ( norm(gf + Ak'*lambda) >= 1e-3 )
        lambda = lsqr(-Ak', gf);
    end
    
    % Paso 7: Actualizamos
    k = k+1;
    
    % Paso 8: Calculamos el vector con las CNPO
    
    vk = [gf + jh'*lambda; hk];
    
    
end

x = xk;

end



