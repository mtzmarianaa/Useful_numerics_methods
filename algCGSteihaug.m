function [p] = algCGSteihaug(q, delta, tol, xk, J) 
% Algo 7.2 Nocedal
% f(x) = 0.5*norm( q(x) )^2
% delta = radio de confianza
% Ni la J ni la r son lineales


    Jk = J(xk);
    r = Jk'*q(xk);
    d = -r;
    z = zeros( size(xk) )
    
    if norm( r ) < tol
        p = z;
        return
    end
    n = length( xk );
    for j = 0:n
        Jd = Jk*d;
        normJd = norm(Jd)^2;
        if normJd <= 0
            %encontrar punto en la frontera
            return
        end
        
        sqnorm_r = dot(r, r);

        alpha = dot( r,r )/normJd;
        z = z + alpha*d;

        if norm( z ) > delta
            %Encontrar punto en la frontera
            return
        end
        
        r = r + alpha*Jk'Jd;
        
        if norm(r) < tol
            p = z;
            return
        end
        
        beta = dot(r,r)/sqnorm_r;
        d = -r + beta*d;

    end




end