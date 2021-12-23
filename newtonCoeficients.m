function [ c ] = newtonCoeficients( x,c,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for j = 2:n
    for i=n:-1:j
        c(i)=(c(i)-c(i-1))/(x(i)-x(i+1-j));
    end
end

end
