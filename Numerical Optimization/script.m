%%%%%% Laboratorio 1 
%%%%%% Optimizacion
%%%%%% 25.ago.20


load afiro

whos


% Afiro es un problema de la vida real, usualmente las 
% matrices de este tipo no son densas

Q = diag([1:51]);
tic
[x,y] = pc(Q, A, c, b)
toc

norm(A*x-b)




% Chido que funcione, ahora nos vamos a una dimension
% mucho mas grande a ver si truena woo. Estilo tomografias

n = 5000;
m = 1500;
Q = eye(n);
A = rand(m,n); % rand genera matrices de rango completo 
b = 100*randn(m,1);
c = 520*eye(n,1);
tic; [x,y] = pc(Q,A,c,b); toc


% Quiero trabar mi compu al parecer


n = 10000;
m = 3000;
Q = eye(n);
A = rand(m,n); 
b = 100*randn(m,1);
c = 520*eye(n,1);
tic; [x,y] = pc(Q,A,c,b); toc


% Not quite there

n = 30000;
m = 9000;
Q = eye(n);
A = rand(m,n); 
b = 100*randn(m,1);
c = 520*eye(n,1);
tic; [x,y] = pc(Q,A,c,b); toc



% Metodo del rango


n = 10000;
m = 7500;
Q = eye(n);
A = rand(m,n); 
b = 100*randn(m,1);
c = 520*eye(n,1);
tic; [x,y] = pcmera(Q,A,c,b); toc
norm(A*x-b)


% No converge, es demasiado grande y gradiente conjugado no puede
% Lo intentamos con otro tamano y cambiamos pcmera para que no 
% use gradiente conjugado


n = 1000;
m = 250;
Q = eye(n);
A = rand(m,n); 
b = 100*randn(m,1);
c = 520*eye(n,1);
tic; [x,y] = pcmera(Q,A,c,b); toc
norm(A*x-b)
