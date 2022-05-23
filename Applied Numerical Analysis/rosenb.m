%Rosenbrock
function [y] = rosenb(x)
c = 100; 
y = 0;
for i = 1:length(x)/2
    y = y + c * (x(2 * i) - x(2 * i - 1) ^ 2) ^ 2 + (1 - x(2 * i - 1)) ^ 2; 
end