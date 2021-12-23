% Script: SimplexKleeMinty
% A continuación lo probaremos para m = 3,4,5,6,7,8,9,10
% Esta es la prueba para el Simplex revisado
%
% Se usan las siguientes funciones (favor de ponerlas en la misma carpeta,
% mismo espacio de trabajo):
% generalKleeMinty.m
% mSimplexFaseII.m
%
% También se grafica el numero de iteraciones que son necesarias para poder
% resolver el ejemplo de "generalKleeMinty" dependiendo del numero m que se
% le ponga.
% Adicionalmente para cada iteración se calcula el tiempo en el cual la
% máquina resuelve cada generalKleeMinty. Recordemos que este tiempo varia
% mucho dependiendo de la maquina que se use (modelo, cantidad de ventanas
% abiertas, etc.). Pero lo usamos para probar que cada vez que aumentamos m
% el tiempo que se tarda en resolverlo tambien aumenta (y podriamos decir
% que bastante).
% Creamos una tabla correspondiente a toda esta información para que el
% usuario la pueda simplemente leer (y no tener que leer todo esto)

ValoresOptimos = zeros(7, 1);
tiempo = zeros(7, 1);

iter = zeros(7, 1);

for m = 3:10
    tic
    [A,b,c] = generaKleeMinty(m);  
    [x0, ValoresOptimos(m-2), ban, iter(m-2)] = mSimplexFaseII(A,b,c); 
    tiempo(m-2) = toc;
end 


mvec = 3:10;

T = table(mvec', ValoresOptimos, iter, tiempo);
T.Properties.VariableNames = {'m','ValoresOptimos','Iteraciones', 'Tiempo'};
T


figure(1)
plot(mvec, iter, 'b--o')
title('El número de iteraciones crece conforme m crece')
xlabel('m')
ylabel('Número de iteraciones')


figure(2)
plot(mvec, tiempo, 'b--o')
title('El tiempo tiende a ser mayor con el aumento de m')
xlabel('m')
ylabel('Tiempo en resolver el problema')






