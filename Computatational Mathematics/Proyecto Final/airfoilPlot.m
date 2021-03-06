function [force] = airfoilPlot(v_inf,theta, s_x, s_y, r, force)
v = v_inf/v_inf;
theta = theta*pi/180;
s = s_x + 1i*s_y;

% TRANSFORMATION PARAMETER
lambda = r-s;
% CIRCULATION
beta = (theta);
k = 2*r*v*sin(beta);

%COMPLEX ASYMPTOTIC SPEED 
w = v * exp(1i*theta);

%TOLLERANCE
toll = +5e-2;

% GENERATING MESH
x = meshgrid(-5:.1:5);
y = x';

% COMPLEX PLANE
z = x + 1i*y;

% Inside-circle points are Excluded!
for a = 1:length(x)
    for b = 1:length(y)
        if abs(z(a,b)-s) <=  r - toll
            z(a,b) = NaN;
        end
    end
end

% AERODYNAMIC POTENTIAL
f = w*(z) + (v*exp(-1i*theta)*r^2)./(z-s) + 1i*k*log(z-s);

% JOUKOWSKI TRANSFORMATION, 
J = z+lambda^2./z;

%GRAPHIC - Circle and Joukowski Airfoil
angle = 0:.1:2*pi;
z_circle = r*(cos(angle)+1i*sin(angle)) + s;
z_airfoil = z_circle+lambda^2./z_circle;

L_str = num2str(force);

%PLOTTING SOLUTION
figure(3)
hold on
contour(real(z),imag(z),imag(f),50)
fill(real(z_circle),imag(z_circle),[0.6350, 0.0780, 0.1840]	)
axis equal
axis([-5 5 -5 5])
title(strcat('Flow Around a Circle.   Lift:  ',L_str,'  [N/m]'));


figure(4)
hold on
contour(real(J),imag(J),imag(f),-5:.1:5)
fill(real(z_airfoil),imag(z_airfoil),[0.6350, 0.0780, 0.1840])
axis equal
axis([-5 5 -5 5])
title(strcat('Flow Around the Corresponding Airfoil.   Lift:  ',L_str,'  [N/m]'));
end