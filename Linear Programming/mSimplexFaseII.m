function [x0, z0, ban, iter] = mSimplexFaseII(A, b, c)
% Implementa la Fase II revisada para un problema del tipo min c⊤x
% sujeto a Ax ≤ b b, x ≥ 0 .
% Recordar: MATLAB usa vectores renglón.
%
% IN:  A     matriz de mxn con entradas en los reales
%      b     vector columna con la misma cantidad de filas como A (m)
%      c     vector columna con n entradas
%
% OUT: x0    SBF óptima del problema
%      z0    valor óptimo del problema (c⊤x0)
%      ban   indica:
%              -1 si el conjunto básico factible es un conjunto vacío
%               0 si ya se encontró la solución óptima
%               1 si el problema es no acotado
%      iter  número de iteraciones (tableau's) usados (cambios de
%      variables)
%      imp   variable booleana que indica si se quiere o no imprimir cada
%      tableau computado en el proceso

% Primero incluimos las variables de holgura, debemos de incluir m
% variables de holgura pues es la cantidad de desigualdades que tenemos.
%
%
%
% POR FAVOR LEER LOS COMENTARIOS
%
%
[m, n] = size(A);
a = length(b);
ctam = length(c);


% Verificamos que el usuario no haya metido vectores o matrices con
% dimensiones que no tengan sentido.
if a ~= m
    mensaje = 'Verificar las dimensiones del vector b y la matriz A, no coinciden'
    x0 = 0;
    z0 = 0'
    ban = -1;
    iter = 0;
end

if ctam ~= n
    mensaje = 'Verificar las dimensiones del vector c y la matriz A, no coinciden'
    x0 = 0;
    z0 = 0'
    ban = -1;
    iter = 0;
end




%Nombramos las variables que usaremos, N es el vector de índices de las
%variables no básicas, B es el vector de índices de las variables básicas,
%rn son los coeficientes de costos de las variables no básicas (pues
%recordemos que los coeficientes de costos de las variables básicas son
%cero.

N = 1:n;

%cholg es la funcion objetivo con coeficientes cero en las variables de
%holgura.

B = n+1:n+m;

cholg = c;

cholg = [c; zeros(m, 1)];

%Podria ser que tenemos un conjunto factible vacío, es decir que b<0, por
%ende nos tenemos que salir de este método ya (por eso el return)


for i = 1:m
   if b(i)<0
       ban = -1;
       iter = 0;
       x0 = [];
       z0 = [];
       return
   end
end


%Como ya agregamos las variables de holgura, tenemos la primera SBF:

xb = b;  %dimensión mx1
xn = zeros(n, 1);  %dimensión nx1


%iniciamos con la primera solución básica factible, la cual está dada como
%0 = x para las variables originales mientras las variables de holgura son
%iguales a b.
x0 = [xn', xb']';


%El primer valor de la SBF es cero, es el producto punto entre nuestra
%primera solucion básica factible y el vector de costos

z0 = dot(x0, cholg);


%ban es una bandera que indica cuándo parar
ban = 0;
iter = 0;

%Para el primer paso An es A pues las variables originales no están en la
%base mientras Ab es la identidad de tamaño m pues las que están en la base
%son las de holgura.
An = A;
Ab = eye(m);

%La matriz que va dentro del tableau, matriz de tamaño mx(m+n)
matriz = [An Ab];



%El vector h está dado por h = Ab^(−1)*b, en el primer paso h = b;


cb = cholg(B);
cn = cholg(N);

%El primer rn es -c, no hemos hecho ninguna iteración (yet)

rn = -c;

while(ban == 0)
    cb = cholg(B);
    cn = cholg(N); 
    Ab = matriz(:, B);
    An = matriz(:, N);
    h = Ab\b; 
    lambda = Ab'\cb;
    rn = lambda'*An - cn';
    
    %Buscamos la variable de entrada con mayor decenso
    
    [valorMax, indiceEnN] = max(rn);
    
    %Si el "indice de entrada" es menor a cero entonces no hay rn(i) > 0
    %entonces paramos
    if (valorMax <= 0)
        x0 = Ab\b;
        z0 = dot(x0, cb);
        iter = iter;
        return
    end
    
    %De lo contrario ya encontramos nuestro indice de entrada (ojo el
    %indice de entrada es
    
    
    
    indEntrada = N(indiceEnN);
    
    Hse = matriz(:, B)\matriz(:, indEntrada);
    
    %Ahora buscamos la variable de salida
    
    compara = zeros(m, 1);
    for i = 1:m
        if (Hse(i) > 0)
            compara(i) = Hse(i);
        end
    end
    
 
    
    div = inf;
    
    for i = 1:m
        if ((compara(i) > 0) && (div > h(i)/compara(i)))
            div = h(i)/compara(i);
            saleEnB = i;
        end
    end
    
    
    %Si no hay indice de salida entonces el problema es no acotado
    
    if (div == inf)
        x0 = [];
        z0 = -inf;
        ban = 1;
        inter = iter;
        return
    end
    
    %Si sí hay un indice que cumple con h(i)/compara(i) claramente lo
    %queremos encontrar
    
    
    % De lo contrario hacemos el cambio de variable de salida y de entrada
    
    indSalida = B(saleEnB);
    B(saleEnB) = N(indiceEnN);
    N(indiceEnN) = indSalida;
    
    iter = iter + 1;
    
    
end



end

    


