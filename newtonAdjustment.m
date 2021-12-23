function [ n ] = newtonAdjustment( x,c,points)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

c=newtonCoeficients(x,c,points);


n = @(t) c(1);

for i=1:points-1
    nT=@(t) c(i+1);
    for j=1:i
        nT=@(t) nT(t)*(t-x(j));
    end
    n=@(t) n(t)+nT(t);
end

end