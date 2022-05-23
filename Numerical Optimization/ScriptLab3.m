% % Script lab 3
% [Q,A,F,c,b,d] = Generapc1(750, 350, 600, 0.85);
% figure(1)
% spy(Q)
% % Q es casi diagonal, al final se vuelve densa
% % Pero Q es spd
% figure(2)
% spy(A)
% % Ahora vamos a hacer el algoritmo de puntos interiores
% figure(3)
% [x,lambda,mu,z] = qpintpoint(Q,A,F,c,b,d)
% % La grafica que nos sale es lo de la tabla de valores
% % pero de forma grafica
% 
% load afiro
% n = length(c);
% Q = eye(n);
% % x(x)>= 0, para todo k = 1, ..., n
% F = eye(n);
% d = zeros(n,1);
% % Volvemos a correr el codigo
% figure(4)
% [x,lambda,mu,z] = qpintpoint(Q,A,F,c,b,d)
% % Este metodo es muy bueno, resuelve cosas rapidas
% 
% 
% load grow7
% n = length(c); 
% Q = eye(n);
% F = eye(n);
% d = zeros(n,1);
% figure(5)
% tic
% [x,lambda,mu,z] = qpintpoint(Q,A,F,c,b,d)
% toc


% Este metodo es eficiente y rapido siempre y cuando Q sea
% bien condicionada, Q spd, los renglones de A linelamente independientes
% y suficientemente distintos





% Vamos a usar la imagen del payaso clasica de MatLab

load clown
figure(6)
image(X)
colormap('gray')
figure(7)
surf(X) %la imagen del payaso son valores entre 0 y 1
