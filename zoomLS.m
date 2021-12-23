function [alphaStar] = zoomLS(alphaLo, alphaHi, f, xk, dk, gk)

c1 = 1e-4;
c2 = 0.99;

fxk = f(xk); 
phiPrimeZero = dot(gk,dk);
phiAlphaLo = f(xk + alphaLo * dk); 

while 0 < 1
    alpha = (alphaHi + alphaLo)/2;
    phiAlpha = f(xk + alpha * dk);
    if phiAlpha > fxk + c1 * alpha * phiPrimeZero | phiAlpha >= phiAlphaLo
        alphaHi = alpha; 
    else
        phiPrimeAlpha = dot(apGrad(f,xk + alpha * dk), dk);
        if abs(phiPrimeAlpha) <= -1 * c2 * phiPrimeZero
            alphaStar = alpha; 
            break;
        end
        if phiPrimeAlpha * (alphaHi - alphaLo) >= 0
            alphaHi = alphaLo; 
        end
        alphaLo = alpha;
        phiAlphaLo = f(xk + alphaLo * dk);
    end
end
    
