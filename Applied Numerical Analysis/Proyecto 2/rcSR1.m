function [xk, iter] = rcSR1( f, x0, itmax)
% In : f ... (handle) function to be optimized
%       x0    ... (vector) initial point
%       itmax ... (natural number) upper bound for number of iterations
%
% Out:  x    ... (vector) last approximation of a stationary point
%       iter ... (natural number) number of iterations
%       XK ... (matrix) column of iteration, norm of gradient, f(xk)
%       and the abs error. 
% Algorith 6.2 (Nocedal) with modifications

% We define de given parameters of the project
    tol = 1e-5;
    eta = 0.01;
    delta = 1.25;
    r   = 1e-8; % r should be between 0 and 1, Nocedal recommends this value 
    xk = x0;
    iter = 0;
    g = apGrad( f, xk ); % we approximate the gradient
    Hk = speye( length(xk) );
    Bk = Hk;
    
% extras
    N = length(xk);
    xstar = ones(N,1); %analytic minimum
    fk(1) = f(xk); % f(xk)
    norm_g(1) = norm(g,2);
    abs_e(1) = norm(xstar - xk,2);
    
    
    while norm(g, 'inf') > tol
        
        %%%%%%%%%%%%
        % Compute sk by solving the subproblem
        % Note: H is not necessesarily is spd, we can't use dogleg
        % Using theorem 6.1 (Nocedal)
        sk = -Hk*g;
        
        % We need to make sure it stays inside the trust region
        
        if dot( sk, g ) < 0
            if norm( sk ) > delta
                sk = delta*sk/norm( sk );
            end
        else
            sk = pCauchy( Bk, g, delta );
        end
        
        %%%%%%%%%%%%
        
        % Compute:
        
        gnew = apGrad( f, xk + sk );
        yk = gnew - g;
        ared = f(xk) - f( xk + sk );
        pred = - ( dot( g, sk ) + 0.5*dot( sk, Bk*sk ) );
        ratio = ared/pred;
        
        %%%%%%%%%%%%
        
        if (ratio > eta)
            xk = xk + sk;
            g = gnew;
            iter = iter + 1;
            if iter == itmax
                break
         % else: there is no update and we do nothing (no update, no iter
         % +1)
            end
        end
        %%%%%%%%%%%%
        
        % Now we move on with the change in the trust region    
        if ratio > 0.75 
            
            if norm( sk ) > 0.8*delta
                 delta = 2*delta;
            % else norm(sk) >= 0.8*delta, then delta_k+1 = delta_k
            end
            
        % elseif 0.1 <= ratio <= 0.75, then delta_k+1 = delta_k
        
        elseif ratio < 0.1 
            delta = 0.5*delta;
        end
        %%%%%%%%%%%%
        
        % We now have the rank-1 update
        w = yk - Bk*sk; % Aux
        if abs( dot( w, sk ) ) >= r*norm( w )*norm( sk ) % 6.26 (Nocedal)
            Bk = Bk + w/dot(w, sk)*w';
            c = sk - Hk*yk;
            Hk = Hk + c/dot( c, yk )*c';
        % else, we dont update Bk
        end
        
        % extras
        fk(iter + 1) = f(xk); % f(xk)
        norm_g(iter + 1) = norm(g,2);
        abs_e(iter + 1) = norm(xstar - xk,2);
        
    end
    
%   extras
%   XK = [(1:iter)', norm_g', fk', abs_e'];
           

end