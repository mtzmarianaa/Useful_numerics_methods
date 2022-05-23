%  
%

close all
clear all
load PRESENTACION
clc

ZZ = output.trayectoria;

M = length(ZZ(1,:));
N = length(ZZ(:,1))/2;

disp([M N]);

INDX = [1:9 15:18 50 90:100];

for i=1:length(INDX)
    punto = ZZ(:,INDX(i));
    [x,y] = pol2cart([punto(1:N);pi],[punto(N+1:2*N);0]);
    
    figure(i);
    patch(x,y,'b');
    alpha(1-0.95^i);
    axis([-0.6 0.6 -0.02 1.02]);
    str = strcat('iteracion: ', num2str(INDX(i)));
    title(str, 'fontsize',15);
end