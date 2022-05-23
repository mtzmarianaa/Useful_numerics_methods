function [H] = Hessiana(fname,a, indx)
%             HESSIANA
% Aproxima la matriz hessiana de
%          fname:R^n --> R
% en el punto a en R^n
%
% usage: [H] = Hessiana(fname,a)
%      donde:
%              H := Matriz hessiana de fname
%          fname := Nombre de la funcion (string)
%              a := punto en que se evalua a fname
%
%               

if nargin <= 2
    % la funcion es de R^n->R
    n = length(a);
    H = zeros(n);
    fa = feval(fname,a);
    h = 1.e-05;

    for k = 1:n
         z1 = a;
        z1(k) = z1(k) + h;%
        f1 = feval(fname,z1);
        for j = k:n
            z2 = a;  z2(j) = z2(j) + h;
            z3 = z1; z3(j) = z3(j) + h;
            f2 = feval(fname,z2);
            f3 = feval(fname,z3);
         H(k,j) = (fa + f3 -f1 -f2)/(h^2);
         if(k~=j)
             H(j,k) = H(k,j);
         end
        end
    end
else 
    % la funcion es de R^n->R^m
    n = length(a);
    H = zeros(n);
    fa = feval(fname,a,indx);
    h = 1.e-05;

    for k = 1:n
         z1 = a;
        z1(k) = z1(k) + h;
        f1 = feval(fname,z1, indx);
        for j = k:n
            z2 = a;  z2(j) = z2(j) + h;
            z3 = z1; z3(j) = z3(j) + h;
            f2 = feval(fname,z2, indx);
            f3 = feval(fname,z3, indx);
         H(k,j) = (fa + f3 -f1 -f2)/(h^2);
         if(k~=j)
             H(j,k) = H(k,j);
         end
        end
    end
end