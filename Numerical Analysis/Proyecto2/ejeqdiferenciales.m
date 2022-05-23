function [vp] = ejeqdiferenciales(t,vy)
% Ecuaciones diferenciales con terminos cruzados (para plotear)
%Para el tercer parcial de sistemas dinámicos I
% Out

vp = zeros(2,1);

vp(1) = 0.2*vy(1) - (vy(1)*vy(2))/200;
vp(2) = 20*vy(2)*(1-vy(2)/20) + 25*vy(1)*vy(2);


end
