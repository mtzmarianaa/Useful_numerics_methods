function [nvac, basis, bfs] = phaseOne(A, b, c)
% MAZIMISE c^T x
% subject to Ax = b, x >= 0, b >=0
%
% Input:
% A mxn matrix with m <= n and rank of A is m
% b column vector with m rows
% c column vector with n rows
%
% Output:
% nvac = 0 if the feasible set is empty
% nvac = 1 if the feasible set is non-empty
% basis = a vector of size m of indices of column vectors for a feasible basis for
% the problem if the feasible set is non-empty
% bfs = a vector of size n of the basic feasible solution corresponding to this ba-
% sis (if the feasible set is non-empty)

[m,n]              = size(A);
tab                = zeros(m+1,n+m+1); % % (m+1)x(n + m + 1) zero matrix
tab(1:m,1:n)       = A; % % the zero matrix above with A as a submatrix
tab(end,n+1:end-1) = 1; %% row of costs
tab(1:m,end)       = b(:); % % The last column contains the b vector (constraints)
tab(1:m,n+1:n+m)   = eye(m); % % Adds the submatrix of the slack variables

% % The last row is the row for the costs
% % Initially, only the slack variables have a one in the last row,
% % everything else in this row is zero 


for i = 1:m %now make all entries in bottom row zero (of the NB)
    tab(end,:) = tab(end,:)-tab(i,:);
end



%Now we check if the feasible set is empty or no  
if tab(end,end) ~=0
    nvac = 0;
    error('Feasible set empty')
else
    nvac = 1;
    
end




end