function [xk, iter] = mRCSR1( f, x0, tol, maxIter, radioMax)

% Purpose: % Purpose: descends in largest descend direction.
% In : f ... function to minimize
%      x0 ... initial point
%      tol ... tolarance
%      maxiter ... upper bound for iterations
%      radioMax ... upper bound for trust region radius.
%
% Out: xf ... final approximation of x*
%      iter ... number of iterations used

    eta = 0.01;
    r   = 1e-6;
    
    radio = radioMax;
    xk    = x0;
    iter  = 0;
    g = apGrad( f, xk );
    H = speye( length(xk) );
    B = H;
    
    while norm(g, 'inf') > tol
        % P1
        s = -H*g;
        if dot(s, g) < 0
            if norm(s) > radio
                s = radio*s/norm(s);
            end
        else
            s = pCauchy( B, g, radio);
        end
        
        % P2
        coc = -(f(xk)-f(xk+s))/(dot(g, s)+0.5*dot(s, B*s));
        gnew = apGrad( f, xk + s );
        gamma = gnew - g;
        
        % P3
        if (coc > eta)
            xk = xk + s;
            g = gnew;
            iter = iter +1;
            if iter == maxIter
                break
            end
        end
        
        if coc > 0.75   % P4
            if norm(s) > 0.8*radio
                 radio = min(2*radio,  radioMax);
            end
        elseif coc < 0.1 % P5
            radio = 0.5*radio;
        end
        
        % P6
        v = gamma-B*s;
        if abs(dot(v, s)) >= r*norm(v)*norm(s)
            B = B + v/dot(v, s)*v';
            u = s-H*gamma;
            H = H + u/dot(u, gamma)*u';
        end
    end
end





