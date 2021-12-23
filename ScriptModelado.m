%Objective: We finding the force per unit of distance (N/m) of the perimeter of the wing.

%Number of points to adjust
points = 60;

%Inicial variables
fullForce = 1:points;
yForce = 1:points;

%Degrees to consider
x = linspace(0, 180, points);

%Speed of the wind(m/s)
wSp=55;

%Center of the circle
xC=0.5;
yC=0.5;

%Radius of the circle
radius =2;

%Obtatinig values for the downforce in specific points
for i=1:points
    rad=x(i)*pi/180;
    fullForce(i) = totalPerpendicularForce(wSp, x(i), radius);
    yForce(i) = cos(rad)*fullForce(i);
end

%Interpoling a Newton Adjustemt bases on the yForce vector
n = newtonAdjustment(x, yForce, points);

%Evaluating points in the resluting Newton funtion
y = linspace(1,179,1000);
nEval = 1:1000;
for h=1:1000
    nEval(h)=n(y(h));
end

% %Graphing FullForce vector
figure(1)
plot(x, fullForce);
grid on
grid minor

% %Comparing yVector vs Newton function
figure(2)
plot(x,yForce,'*',y,nEval);
grid on
grid minor

%Finding the real maximum point of the Newton function.
%Therefore finding the maximum force per unit(N/m)
auxN=@(t)-n(t);
maxP=gSS(auxN,5,100)
maxF=n(maxP)

%Showing the wing
airfoilPlot(wSp,maxP, xC, yC, radius, maxF)