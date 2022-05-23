function [alphaStar, gnew] = lineSearch(f, xk, dk, gk)
 
alphaMax = 1000; 
alphaLag = 0; 
alpha = 1;
c1 = 1e-4;
c2 = 0.99;

fxk = f(xk); 
phiPrimeZero = dot(gk,dk);
phiAlphaLag = f(xk); 

while(0<1)
    phiAlpha = f(xk + alpha * dk);
    
    if phiAlpha > fxk + c1 * alpha * phiPrimeZero |  phiAlpha >= phiAlphaLag
        alphaStar = zoomLS(alphaLag, alpha, f, xk, dk, gk);
        break; 
    end
    
    phiPrimeAlpha = dot(apGrad(f, xk + alpha * dk), dk); 
    
    if abs(phiPrimeAlpha) <= -1 * c2 * phiPrimeZero
        alphaStar = alpha; 
        break; 
    end
    
    if phiPrimeAlpha >= 0
        alphaStar = zoomLS(alphaLag, alpha, f, xk, dk, gk);
        break;
    end
    
    alphaLag = alpha; 
    alpha = min(alpha * 2, alphaMax - 0.0001);
    phiAlphaLag = phiAlpha; 
end
    gnew = apGrad(f, xk + alphaStar*dk);
    
end