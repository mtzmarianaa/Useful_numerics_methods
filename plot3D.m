

%% Define f with two arguments  and  so that
% it can be evaluated for matrices of values X, Y
[f, Df, D2f] = fEasom;
F = @(x,y) -cos(x).*cos(y).*exp(-(x-pi).^2. - (y-pi).^2.);

%% define point and trust region radius
x0    = [3;3];
delta = 0.5;
f0 = f(x0);
g = Df(x0);
%g = apGrad(f,x0);
B = D2f(x0);
%B = apHess(f,x0);

%% plot f in cartesian coordinates arround x0
showPlot = true;
if showPlot
	Delta = 1.1*delta;
	uniGrid = linspace(x0(1)-Delta, x0(1)+Delta, 32);
	[X,Y]   = meshgrid(uniGrid, uniGrid);
	Z  = F(X,Y);
	s2 = surf(X,Y,Z);
end


%% plot quadratic model in trust region with polar coordinates arround x0
hold on
% polar coordinates arround x0
[T,R] = meshgrid(linspace(0,2*pi,64),linspace(0,delta,16));
X     = R.*cos(T) ;
Y     = R.*sin(T) ;
% el modelo cuadratico
m  = @(p1,p2)   f0 + g(1).*p1 + g(2).*p2 + 1/2.*p1.*(B(1,1).*p1 + B(1,2).*p2) + 1/2.*p2.*(B(2,1).*p1 + B(2,2).*p2);
% evaluation and plot
Z  = m(X,Y);
s1 = mesh(X+x0(1),Y+x0(2),Z);
colorbar
zlabel('z')
view(130, 12)
%hold off
