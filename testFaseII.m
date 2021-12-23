% Script: testFaseII
% Se prueban los resultados para varios problemas de programacion lineal
% con la Fase II del metodo simplex. Estos problemas se encuentran en la
% tarea 4 hecha para el segundo parcial (en dicha tarea tambien se
% encuentran los resultados).
%
% Recordemos que MatLab toma a los vectores como vectores renglón, por eso
% los tenemos que transponer antes de llamar a la funcion.
%
%
% Se usan las siguientes funciones (favor de ponerlas en la misma carpeta,
% mismo espacio de trabajo):
% mSimplexFaseII.m


%Primera prueba
% Deberiamos obtener z0 = -39, x0= 3,6,2 
%   iter = 3 
disp('Primer ejemplo')
A = [1 0 1 0 0; 0 1 0 1 0; -1 1 0 0 1]; 
b = [3 6 5]'; 
c = [-3 -5 0 0 0]';
[xo, zo, ban, iter] = mSimplexFaseII(A,b,c);
disp('La solucion básica óptima está dada por:')
xo
disp('El valor optimo es:')
zo
disp('Ban = ')
ban
disp('Cantidad de iteraciones')
iter



% Segunda prueba
% Deberíamos de tener z0 = -17, x0 = (x1, x3) = (2, 1)
disp('Segundo ejemplo')
A2 = [2 1 1 3; 1 3 1 2];
b2 = [5 3]';
c2 = [-6 -8 -5 -9]';
[x02, z02, ban2, iter2] = mSimplexFaseII(A2,b2,c2);
disp('La solucion básica óptima está dada por:')
x02
disp('El valor optimo es:')
z02
disp('Ban = ')
ban2
disp('Cantidad de iteraciones')
iter2
