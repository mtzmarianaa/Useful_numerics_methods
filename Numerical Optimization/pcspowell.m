function [x, lambda, kiter] = pcspowell(fx, hx, x0)
% Metodo de programacion cuadratica sucesiva con la actualizacion
% de Powell para el siguiente problema:
%
%    Min fx
%    s.a. hx = 0
%
% Donde fx:R^n -> R^n, hx: R^n -> R^m, ambas dos veces
% continuamente diferenciables
% In
% fx.- cadena de caracteres con la funcion objetivo en Matlab
% hx .- cadena de caracteres con la funcion de restricciones
% x0 .- vector inicial de dimension n
% Out
% x .- aproximacion al minimo local
% lambda .- multiplicador de Lagrange de igualdad
% kiter .- numero de iteraciones que realiza el metodo
% -------------------------------------------------------------------------
% Funciones que se necesitan:
%    gradiente.m .- calcula el gradiente de fx en un punto en R^n
%    jacobiana.m .- calcula la matriz jacobiana de hx en cualquier punto
%                     en R^n, matriz jacobiana es mxn, m el numero de
%                     restricciones
% -------------------------------------------------------------------------
% Actualizacion de Powell para la matriz hessiana del Lagrangiano
%
% Optimizacion numerica
% ITAM
% Clase 6.oct.20
% -------------------------------------------------------------------------

tol = 1e-05; % tolerancia para las CNPO
maxiter = 100; % maximo de iteraciones permitidas
kiter = 0; % contador

n = length(x0); % dimension de la variable x
h = feval(hx, x0); 
m = length(h); % numero de restricciones

lambda = zeros(m,1); % lambda inicial, lambda = cero es minimizar la f solita
B = eye(n); % inicio para el update de Powell, para no calcular segundas derivadas
% Necesitamos calcular las CNPO
gf = gradiente(fx, x0); % calcula el gradiente de fx en x0
jh = jacobiana(hx, x0); % calcula la jacobiana de hx en x0
vcnpo = [gf + jh'*lambda; h]; % condiciones necesarias de primer orden
% Empieza la parte iterativa
x = x0;

while(norm(vcnpo) > tol && kiter < maxiter)
    % Vamos a resolver el subproblema cuadratico de igualdad
    K = [B jh' ; jh zeros(m)]; % matriz del problema cuadratico
    ld = -[gf; h]; 
    d = K\ld;
    px = d(1:n);
    % Actualizamos con Powell
    xn = x+px; % Punto nuevo
    lambda = d(n+1:n+m); % Nuevo multiplicador de Lagrange
    
    % calcular la nueva matriz B
    s = xn - x;
    gfn = gradiente(fx,xn);
    jhn = jacobiana(hx, xn);
    % Calculamos dos lagrangianos
    lag1 = gf + jh'*lambda; % con los antiguos
    lag2 = gfn + jhn'*lambda; % con los nuevos
    y = lag2 - lag1;
    
    aux = s'*B*s;
    
    % Vamos a tratar de calcular s'*B*s > 0 
    
    if (s'*y > (0.2)*aux )
        r = y;
    else
        theta = ( 0.2*aux - s'*y )/( aux - s'*y ); 
        r = theta*B*s + ( 1 - theta )*y; %actualizar el vector r
    end
    
    B = B - ( (B*s*s'*B)/aux ) + ( r*r' )/( s'*r );
    % Nos va a decir que esto esto es casi singular lo vamos a "reparar"
    % Condicional: reciproco de la distancia al conjunto de matrices
    % singulares
    
    if (rcond(B) < 1e-04)
        B = eye(n);
    end
    
    
    % Condiciones necesarias de primer order del nuevo punto
    x = xn;
    gf = gradiente(fx, x);
    jh = jacobiana(hx, x);
    vcnpo = [gf + jh'*lambda; h];
    kiter = kiter + 1;
    
    disp('------')
   disp(sprintf('%.0f %2.8f', kiter, norm(vcnpo)));
    
end




end