% script: prueba_pcspowell

fx = 'fun1';
hx = 'funh1';

x0 = [ -1.71 1.59 1.82 -0.763 -0.73]';

[x, lambda, kiter] = pcspowell(fx, hx, x0)

% Casi no nos movemos (?) ver apuntes del 8.oct.20