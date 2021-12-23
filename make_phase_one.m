function [A,b] = make_phase_one(A,b,debug)
% % This function finds a BFS to start off the simplex algorithm

[m,n]              = size(A);
tab                = zeros(m+1,n+m+1); % % (m+1)x(n + m + 1) zero matrix
tab(1:m,1:n)       = A; % % the zero matrix above with A as a submatrix
tab(end,n+1:end-1) = 1;
tab(1:m,end)       = b(:); % % The last column contains the b vector (constraints)
tab(1:m,n+1:n+m)   = eye(m); % % Adds the submatrix of the slack variables

% % The last row is the row for the costs
% % Initially, only the slack variables have a one in the last row,
% % everything else in this row is zero 

if debug
    fprintf('>>>>Current tableau [phase one]\n');
    disp(tab);
end
                                                                                              
                                                                                              
% % We substract each row to the last one (in order to make the NB have a 
% % zero on this last row)
for i = 1:m %now make all entries in bottom row zero (of the NB)
    tab(end,:) = tab(end,:)-tab(i,:);
end

% % ... means that the code continues on the next line
% % Up to this point:
% %   A = tab(1:m,1:n+m)
% %   b = tab(1:m,end)
% %   c = tab(end,1:n+m)
% % Now we run the function "simplex" to find a BFS to start 
tab = simplex(tab(1:m,1:n+m),tab(1:m,end),tab(end,1:n+m),...
                                                 debug,'phase one');
                                             
% % (Down) This would mean that 0 is not in the feasible set                                              
%if tab(end,end) ~=0
%   error('artificial J(x) is not zero at end of phase one.');
%end
 
A = tab(1:m,1:n);
b = tab(1:m,end);
 
end