% script file: Proyecto final _ Optimizacion Numerica
% Problema: Poligono chico de area maxima.
%

clear all
close all
clc

warning('off','all');

n = 4:13;
sigmas = [0.25 0.252 0.255 0.257 0.262:0.001:0.272 ...
    0.274:0.001:0.278 0.281 0.282 0.285 0.287:0.001:0.293...
    0.295 0.296 0.298 0.299 0.3];

fobjj = 'fobjetivo';
fineqq = 'restricciones';

N = length(n);
S = length(sigmas);

CNPO = zeros(N,S);
meanCNPO = zeros(S,1);

for s = 1:S;
    fprintf('\nSIGMA = %1.5f\n',sigmas(s));
    for k = 1:N
    % punto inicial
       
    x0 = [linspace(0,pi,n(k)-1)';ones(n(k)-1,1).*0.2];
    
    [~, ~, output] = puntosInteriores(fobjj, fineqq, ...
        x0,sigmas(s));
    
    CNPO(k,s) = output.CNPO;
    output = [];
    end
end

[~, INDX] = min(CNPO,[],2);

SIGMAS = zeros(10,1);

for i=1:10
    SIGMAS(i) = sigmas(INDX(i));
end
    
%[SIGMA, Sindx] = min(meanCNPO);