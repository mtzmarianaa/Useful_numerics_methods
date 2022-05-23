function [vp] = lorenzeq(t,vy)
% Ecuaciones diferenciales de Lorenz
% Out

vp = zeros(3,1);
sigma = 10;
rho = 28 ;
beta = 8/3;
vp(1) = sigma*(vy(2) - vy(1));
vp(2) = vy(1)*(rho - vy(3)) - vy(2);
vp(3) = vy(1)*vy(2) - beta*(vy(3));

end

