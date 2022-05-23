function [  Ax ] = dibujamatriz( A)
% dibuja la acción de la matriz 2x2 A sobre ña bola unitaria de norma
% euclideana.
%  
[U,S,V]= svd(A);  % Descomposición en valores singulares de A

close all
theta = linspace(0,2*pi)';
x = cos(theta);
y = sin(theta);
Ax = zeros(2,100);
for j = 1:100
    v =[x(j);y(j)];
    Ax(:,j) = A*v;         %Accipon de A sobre la bola unitaria
end

%ejes coordenados ortogonales de A*x
vec = diag(S);
t = linspace(0,1,50)';
u1 = zeros(2,50);  v1 = zeros(2,50);
u2 = zeros(2,50);  v2 = zeros(2,50);
w1 = vec(1)*U(:,1); z1 = V(:,1);
w2 = vec(2)* U(:,2);        z2 = V(:,2);
    for i = 1:50
     u1(:,i) = t(i)*w1; 
     u2(:,i) = t(i)*w2;
     v1(:,i) = t(i)*z1;
     v2(:,i) = t(i)*z2;
    end




% Graficación de la bola unitaria y la elipse
subplot(2,1,1)
plot(x,y,'b',0,0,'xk', v1(1,:),v1(2,:),'r', v2(1,:), v2(2,:),'r','Linewidth',3)
title(' Bola unitaria en dos dimensiones', 'Fontsize', 16)
axis equal

subplot(2,1,2)
plot(Ax(1,:), Ax(2,:),'b',0,0,'xk',u1(1,:),u1(2,:),'g', u2(1,:),u2(2,:),'g','Linewidth',3)
title('Elipse definida por A*x ','Fontsize',16)
axis equal


end


