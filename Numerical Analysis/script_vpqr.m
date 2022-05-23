% script_vpqr.m
n=8; 
A = rand(n); 
% [Q,R] = Householder(A); 
% V= diag(1:n) ; 
% A = Q'*V*Q; 

[H] = vpqrversion2(A); 
H
