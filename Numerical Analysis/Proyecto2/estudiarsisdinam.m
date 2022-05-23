% script: estudiarsisdinam.m

close all

fname = 'ejeqdiferenciales';
a = 0; b = 20;
ya = [5 5]';
n = 1000; 

[t, y] = rungekutta(fname, a, b, ya, n);
xx1 = y(:, 1);
yy1 = y(:, 2);

figure(1)
plot (xx1, yy1, 'LineWdith', 2, 'b')