function [x, msg, Xk, EXTRAS] = mRC1( f, x0, itmax, x_optima )
% Trust region method using the Cauchy point and de exact Hessian.
%
% In : f ... (handle) function to be optimized
% x0 ... (vector) initial point
% itmax ... (natural number) upper bound for number of iterations
% x_optima ... (vector) optimal point (if known)
%
% Out: x ... (vector) last approximation of a stationary point
% msg ... (string) message that says whether (or not) a minimum was found
% extras ... (matrix) matrix with the following cols:
% 1. f(xk), 2. norm(Bk,2), 3. norm(x0-x_optima)
% Xk ... (matrix) points iterations xk

    eta = 0.1;
    deltaMax = 3.1*1.5; %parte de la tarea 2.3
    delta = deltaMax; 
    x = x0;
    tol = 10^-5;
    k = 0;
    gk = apGrad(f, x);
    
    %extras
    i = 1;
    Xk = []; % xk
    Xk = [Xk x]; 
    fkk(i) = f(x); %fk
    [~,~,Bk] = fEasom();
    normBk(i) = norm(Bk(x),2); %||Bk||_{2}
    err(i) = norm(x - x_optima,2);  %||x-x_*||_{2}
    
    while (k < itmax) && (norm(gk,Inf) > tol) 
        gk = apGrad(f, x);
        [~,~,Bk] = fEasom();
        Bk = Bk(x);
        
        dk = pCauchy(Bk,gk,delta);
        
        %Vemos si esta bien el radio de la region de confianza o tenemos
        %que cambiarlo
        coc = -(f(x)-f(x+ dk))/ (dot(gk,dk) + 0.5*dot(dk,Bk*dk));
        
        if coc < 0.25
            delta = 0.25*delta;
        else
            if coc > 0.75 && (delta - norm(dk)) <= eps
                delta = min(2*delta, deltaMax);     
            end      
        end     
        if (coc > eta)
            x = x + dk;
        end
         
        k = k + 1;
        
        %extras
        i = i + 1;
        Xk = [Xk x]; 
        fkk(i) = f(x); %fk
        normBk(i) = norm(Bk,2); %||Bk||
        err(i) = norm(x - x_optima,2); 
    end
    
    [~,p] = chol(Bk);
    if p == 0
        msg = '-';
    
    else
        msg = 'The method did not converge';
    end
    
    %extras
    EXTRAS = [fkk' normBk' err'];
    
    
end