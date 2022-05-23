function [f] = fx1(x)

f = sum(x.*x) + x(1)*(x(2) + x(3)) + x(2)*x(3);

end