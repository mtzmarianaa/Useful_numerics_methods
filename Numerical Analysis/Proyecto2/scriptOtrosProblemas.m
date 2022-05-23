%script otrosproblemas.m


%Problema 1
%y'' = 16 y
%y(0)=1
%y(1)=0
%Resolver con diferencias finitas
[t, y] = diferenciasfinitas('nada', 'constante16', 'nada', 0, 1, 1, 0, 5)


%Problema 2
%Mismo problema con valores en la frontera, resuelto con Galerkin