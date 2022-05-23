clear;   close all;   clc;
 
% intial parameters
n = [2,8,32,128]; 
x0 = repmat([-1.2;1],n(1),1); %rep sequence
xE = ones(n(1),1);
f = @fRosenb;

%tolerance
% tol = 1e-5; se declaro dentro de los metodos
maxiter = 100;

% save values


%for i = 1:length(m)
    tic
    [x1, k1] = rcSR1( f, x0, maxiter);
    time1 = toc
    
    tic 
    [x2, k2] = lsBFGS( f, x0, maxiter);
    time2 = toc
    
    tic
    [x3, k3m] = lsBFGSLiMem (f, x0, maxiter,3);
    time3 = toc
    
    %ga = apGrad(f,xk);
    %errabs = norm(ga) % La norma por default es la 2
    %f(xk)

%end