function [L] = totalPerpendicularForce(v_inf,theta, r)
%Return the total force per unit of distance in the perimeter of a circle of radius r; 

v = v_inf/v_inf;
theta = theta*pi/180;
 
% FLUID PARAMETER
rho = 1.225;

% CIRCULATION
beta = (theta);
k = 2*r*v*sin(beta);
Gamma = k/(2*pi); %CIRCULATION
 
% KUTTA JOUKOWSKI THEOREM
L = v_inf*rho*Gamma;

end