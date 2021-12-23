function [y] = DIXMAANA(x)
%DIXMAANA function as stated in p. 155

% Set of parameters F 



alp = 1; 
beta = 0.0625;  
gamma = 0.0625; 
deltita = 0.0625; 
k1 = 1;
k2 = 0;
k3 = 0;
k4 = 1;
n = length(x);
m = floor(n/3);

uno = 0;
dos = 0;
tres = 0;
cuatro = 0;

for i = 1:n
    
    
    uno = uno + alp*x( i )^(2)*( i/n )^(k1);
    
end  



for i = 1:n-1
    
    dos = dos + beta*x( i )^2 *( x( i+1 ) + x( i+1 )^2 )^2 *( i/n )^k2;

end

for i = i:2*m
    
    tres = tres + gamma*x( i )^2* x( i+m )^4 *( i/n )^k3;
    
end

for i = i:m
    
    cuatro = cuatro * deltita*x( i )*x( i+2*m )*( i/n )^k4;
    
end

y = 1 + uno + dos + tres + cuatro;



end