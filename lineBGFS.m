function [xk, iter] = lineBGFS( f, x0, tol, maxiter )
% Purpose: approximate a local min of f using the linesearch algorithm
% and the (iBGFS) update formula (to avoid the solution of linear systems).
% Here the method is implemented with changes in the step size (alpha)
% using line search with Wolfe conditions. 
%
% In : f ... function to minimize
% x0 ... initial point
% tol ... tolarance
% maxiter ... upper bound for iterations
%
% Out: xf ... final approximation of x*
% iter ... number of iterations used
%
% Initial values: H = I
% Stop when: || gk || <= tol or ||s|| <= 1e-7
%

    n = length(x0);
    iter = maxiter;
    xk = x0;
    g = apGrad(f, xk);
    H = speye(n);

   for k = 1:maxiter
       if norm(g, 'inf') <= tol % We've reach the goal
           iter = k-1;
           break
       end
       dk = -H*g;  % P1, direction
       assert(dot(dk, g) < 0)
       [alpha, gnew] = findAlpha(f, xk, dk, g); %P2 alpha and gradient of f in xk + alpha*dk
       
       s  = alpha*dk;
       xk = xk + s;
       
       % Now these are the "ingredients" to form the BFGS update
       gamma = gnew - g; 
       irho = dot(gamma, s);
       assert(irho > 0)
       Hgam = H*gamma/irho;
       H = H -(s*Hgam' + Hgam*s') + ((dot(gamma, Hgam)+1)/irho*s)*s';
       g = gnew;
   end
end





