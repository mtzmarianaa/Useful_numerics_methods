% Script: potencia.m
% compración de los métodos:
%                      a) potencia
%                      b) potencia inversa
%                      c) potencia inversa y cociente de Raleigh

close all
u = [1:32]; v = [1:30,30 32];
A = diag(u);   B = diag(v);

[lambdavec1,lamba1,v1] = metodopotencia2(A);
[lambdavec2,lambda2,v2] = metodopotencia2(B);

% graficación

m1 = length(lambdavec1);
m2 = length(lambdavec2);

semilogy([1:m1], lambdavec1,'--sb',[1:m2],lambdavec2,'dr','Linewidth',3)
legend('Matriz A', 'Matriz B')
title('Método de la Potencia','Fontsize',16 )
xlabel('Iteraciones','Fontsize',16 )
ylabel('|| lambda_old - lambda_new ||','Fontsize',16)

pause
close all
alfa = 33;
[lambdavec3,lambda3,v3] = metodopotenciainv2(A,alfa);

alfa = 35;
[lambdavec4,v4] = metodopotenciainv2(A,alfa);
m3 = length(lambdavec3);
m4 = length(lambdavec4);
semilogy([1:m3],lambdavec3,'--sb', [1:m4], lambdavec4,'--dr' ,'Linewidth',3)
legend('alfa = 33', 'alfa = 35')
title(' Método de la Potencia inversa', 'Fontsize',16 )
xlabel('Iteraciones','Fontsize',16 )
ylabel('|| lambda_old - lambda_new ||','Fontsize',16)


pause 
close all
[lambdavec5,lambda5,v5] = cocienteraleigh(A);
m5 = length(lambdavec5);

semilogy([1:m5],lambdavec5,'--sb' ,'Linewidth',3)
title('Cociente de Raleigh', 'Fontsize',16 )
xlabel('Iteraciones','Fontsize',16 )
ylabel('|| lambda_old - lambda_new ||','Fontsize',16)





