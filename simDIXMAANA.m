clear;   close all;   clc;

n = [240,960];
m = [1,3,5,17,29];

x0 = 2*ones(n(1),1);
%x0 = 2*ones(100,1);
f = @DIXMAANA;


% tol = 1e-5; se declaro dentro de los metodos
maxiter = 100;


%for i = 1:length(m)
    tic;
    %[xk, k] = lsBFGS( f, x0, maxiter);
    [xk, k] = lsBFGSLiMem( f, x0, maxiter,m(3))
    ga = apGrad(f,xk);
    errabs = norm(ga) % La norma por default es la 2
    f(xk)
    toc
    %tiempo = toc-tic

%end



