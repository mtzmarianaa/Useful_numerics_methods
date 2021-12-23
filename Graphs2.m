[x,y] = meshgrid(1.1:.1:4.8);

z = -cos(x).*cos(y).*exp(-(x-pi).^2. - (y-pi).^2.);

surf(x,y,z)
colorbar
%title("Funci�n de Easom")
zlabel("f(x,y)")
xlabel("x")
ylabel("y")
