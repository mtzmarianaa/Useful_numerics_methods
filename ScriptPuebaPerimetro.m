% Script para probar la funcion perímetro
% 19.nov.20

% Primero con un trianguilillo
w = [sqrt(2); sqrt(2); pi/4; 3*pi/4];

[per] = perimetro(w)


% Ahora con lo que sí queremos calcular

[th1, r1] = cart2pol(2,1);
[th2, r2] = cart2pol(2,3);
[th3, r3] = cart2pol(0,6);
[th4, r4] = cart2pol(-2,3);
[th5, r5] = cart2pol(-2,1);

th = [th1;th2;th3;th4;th5];
r = [r1;r2;r3;r4;r5];

w = [r;th];

[per] = perimetro(w)

figure(1)
polarplot([0;th;0],[0;r;0], '-o')



figure(1)
polarplot([0;x0(1:3);0],[0;x0(4:6);0], '-o')

figure(2)
polarplot([x0(1:3)],[x0(4:6)], '-o')

