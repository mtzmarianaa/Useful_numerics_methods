% script: notengoidea.m

close all

fname = 'trivial';
a = 0.1;
b = 1;
ya = 0;
n = 10;
[t, y] = puntomedio(fname, a, b, ya, n);
xx1 = y1(:, 1);
yy1 = y1(:, 2);

figure(1)
plot (xx1, yy1, 'LineWdith', 2, 'b')