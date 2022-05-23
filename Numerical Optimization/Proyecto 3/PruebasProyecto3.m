%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pruebas para el proyecto 3
% Optimización Numérica
% Otoño 2020
%
% Equipo: Santiago Muriel
%         Mariana G Martinez
%         Roman Velez
%         Luis Guillermo Pizaña


clc
close all



for n = 3:2:9
    x0 = [ones(n-1,1).*0.2; linspace(0,pi,n-1)'];

    th = x0( n:(2*(n-1)) );
    r = x0( 1:(n-1) );
    
    
    %%% Graficamos la figura inicial
    %figure(fig)
    %polarplot([0;th;0],[0;r;0], '-o')


    %fig = fig+1;
    
    fobjj = 'perimetro';
    fineqq = 'restricciones';

    [xstar, ~, output] = puntosInteriores(fobjj, fineqq, x0);

    thstar = xstar(n:(2*(n-1)));
    rstar = xstar(1:(n-1));

    %%% Graficamos la figura optima
    figure('Name',strcat("Problema con ",num2str(n), " vertices"),'NumberTitle','off', 'Color', 'white');
    subplot(1,2,1);
    polarplot([0;thstar;0],[0;rstar;0], '-o', 'Color', [0, 1, 202/255])
    set(gca,'color',[53/255 53/255 53/255])
    title("Puntos interiores")
    
    % Con Matlab
    [xf,~] = fmincon('perimetro',x0,[],[],[],[],[],[],'restriccionesMatlab');
    thMatlab = xf(n:(2*(n-1)));
    rMatlab = xf(1:(n-1));

    %%% Graficamos la figura optima
    subplot(1,2,2);
    polarplot([0;thMatlab;0],[0;rMatlab;0], '-o', 'Color', [157/255, 1, 0])
    set(gca,'color',[53/255 53/255 53/255])
    title("Matlab")
    
    
end
