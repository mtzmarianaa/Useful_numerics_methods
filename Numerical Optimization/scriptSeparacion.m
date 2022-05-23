% Script datos de separacion con optimizacion cuadratica
% Ahora vamos a importar los archivos para implementar nuestro
% metodo

load('DATOS SEPARACIÓN')

%whos

plot(y(:,1), y(:,2), 'dr', z(:,1), z(:,2), 'sb', 'Linewidth', 3)

% Queremos escribir un hiperplano para separar a los puntos rojos de los
% azules, esto se llama separacion lineal
