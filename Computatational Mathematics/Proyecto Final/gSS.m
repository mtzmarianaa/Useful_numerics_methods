function [ min ] = gSS( f,a,b)
%Golden Section Search
%   Function to find minimum values.
golRat = (sqrt(5) + 1) / 2;
tol=1e-10;
c = b - ((b - a) / golRat);
d = a + ((b - a) /golRat) ;


    while abs(c - d) > tol
        if f(c) < f(d)
            b = d;
        else
            a = c;
        end 
        c = b - ((b - a) /golRat);
        d = a + ((b - a) / golRat);
    end
    min =(b + a) / 2;
end