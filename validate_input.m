function validate_input(A,b,c)
% % Validates that the input is in the correct form before trying to run
% % any other algorithms.

% % A must be a matrix in order for this algorith to work
if ~ismatrix(A)
    error('A must be matrix');
end
 
% % b must be a vector. If there is only one constraint, the user must set
% % them as a 1x1 Matrix and a 1x1 vector
if ~isvector(b)
    error('b must be vector');
end


if ~isvector(c)
    error('c must be vector');
end
 
                                                                                              
% % In class we had the assumption that the A has full rank, this is what
% % this condition checks

[m,n]=size(A);
if rank(A) <m
    error('Rank A must be equal to number of rows in A');
end

% % Each constraint must provide some information
if length(b) ~= m
    error('b must have same size as number of rows of A');
end

% % Each variable (basic) must have something to do with the objective
% % function
if length(c) ~= n
    error('c must have same size as number of columns of A');
end
end