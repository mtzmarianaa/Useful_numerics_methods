% script payaso2.m 
load clown.mat 
colormap('gray') ; 
figure(1) 
image(X);

%X= U*S*V' 
[U,S,V]= svd(X); 
k=75;
XX= U(:,1:k) *S(1:k,1:k)* V(:, 1:k)'; 
colormap('gray') ; 
figure(2)
image(XX);  
