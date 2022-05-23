% script: shooting1.m

fname = 'funbvp1';
a = 0; b = 1;
ya = 0; yb = (1/3)*exp(1);
n = 1000;
sa = 1; sa2 = -1;

%Método numérico (lo elegimos conforme al resultado de v y v2
[t, z] = rungekutta (fname, a, b, [sa ya]', n);
[t, z2] = rungekutta(fname, a, b, [sa2 ya]', n);
 
v = z(n, 2) -yb
v2 = z2(n, 2) -yb

%Biseccion en este caso hay cambio de signo, usamos este metodo

alfa = -1; beta = 1;
falfa = v2; fbeta = v;
tol = 1.e-08; maxiter = 50; iter = 0;
while (abs(beta-alfa)> tol && iter < maxiter && falfa*fbeta < 0)
    c = (alfa + beta)/2;
    [t, zz] = rungekutta(fname, a, b, [c ya]', n);
    fc = zz (n, 2) - yb;
    if (falfa*fc < 0)
        beta = c;
        fbeta = fc;
    else
        alfa = c;
        falfa = fc;
    end
    iter = iter + 1;
end

if (fc == 0)
    raiz = c;
else
    raiz = (alfa+beta)/2;
    [t, zz] = rungekutta(fname, a, b, [raiz ya]', n);
end
raiz

%Graficamos
yy= zz(:, 2);
plot (t, yy, 'b', a, ya, 'dr', b, yb, 'dr', 'Linewidth', 3)
title ('Solución del método del disparo (Bisección)')


