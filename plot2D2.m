% Aqui graficamos los conjuntos de nivel de la funcion y la direccion de
% Newton
% level sets
[f, Df, D2f] = fEasom;
F = @(x,y) -cos(x).*cos(y).*exp(-(x-pi).^2. - (y-pi).^2.);

%Punto inicial, delta, g y B;
x0    = [3;3];
delta = 0.5;
f0 = f(x0);
g = apGrad(f,x0);
B = apHess(f,x0);

%Punto de Newton
pN = -linsolve(B,g);

stepsize =  0.1;  % mas chico hace los conjuntos de nivel mas detallados
[X,Y] = meshgrid(-.5:stepsize:.5); % Region de confianza de la direcciones para el modelo cuadratico
% Modelo cuadratico
m  = @(p1,p2)   f0 + g(1).*p1 + g(2).*p2 + 1/2.*p1.*(B(1,1).*p1 + B(1,2).*p2) + 1/2.*p2.*(B(2,1).*p1 + B(2,2).*p2);
z = m(X,Y);
% Conjuntos de nivel
contour(X+x0(1),Y+x0(2),z)
axis equal
hold on
% Direccion de Newton
quiver( x0(1), x0(2), pN(1), pN(2),'blue', 'LineWidth',2)