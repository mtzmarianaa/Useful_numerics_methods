function [alpha, gnew] = lineSearch( f, xk, dk, gk )
% In : f ... objectve function (handle)
%       xk ... current point
%       dk ... chosen direction of descent
%       gf ... gradient of f in xk
%
% Out:  alpha ... a parameter satisfying (W1) and (W2)
%       gnew  ... gradient of f in  xk+alpha*dk
%
% Idea: flow diagrams (clase6_copias.pdf)

% Define interval for alpha
alphaMax = 10; 
alphaBefore = 0; 

% Initial parameters (given)
alpha = 1;
c1 = 1e-4;
c2 = 0.99;
fk = f( xk );
phiPrZero = dot( gk,dk );
%phiAlphaBefore = f( xk + alpha*dk );
phiAlphaBefore = phiA( alpha );

while true
    
    %Evaluate
    phiAlpha = phiA(alpha);
    
    if phiAlpha > fk + c1*alpha*phiPrZero || phiAlpha >= phiAlphaBefore
        alpha = zoom( alphaBefore, alpha );
        break;
    end
    
    phiPr = dot( apGrad(f, xk + alpha*dk) , dk );
    
    if norm(phiPr) <= -c2*phiPrZero
        break;
    end
    
    if phiPr >= 0
        alpha = zoom( alpha, alphaBefore );
        break;
    end
    
    alphaBefore = alpha; 
    alpha = min( 2*alpha, alphaMax - 0.0001 );
    phiAlphaBefore = phiAlpha; 
    
    
end

gnew = apGrad( f, xk + alpha*dk );



    function [phi] = phiA( alpha )

        phi = f( xk + alpha*dk );

    end



    function [alpha] = zoom(alphaLo, alphaHi)

    phiAlphaLo = f(xk + alphaLo * dk);

    while true

        alphaj = (alphaHi + alphaLo)/2;
        phiAlphaj = phiA(alphaj);

        if phiAlphaj > fk + c1 * alphaj * phiPrZero || phiAlphaj >= phiAlphaLo
            alphaHi = alphaj;

        else

            phiPrAlphaj = dot(apGrad(f,xk + alphaj * dk), dk);

            if abs( phiPrAlphaj ) <= -1 * c2 * phiPrZero
                alpha = alphaj;
                break;
            end

            if phiPrAlphaj * (alphaHi - alphaLo) >= 0
                alphaHi = alphaLo;
            end

            alphaLo = alphaj;
            phiAlphaLo = f(xk + alphaLo * dk);

        end

    end
    
    end
end