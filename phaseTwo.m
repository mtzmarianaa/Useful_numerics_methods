## Author: Santiago Muriel

# Function description:
% maximise c^T x 
% subject to Ax = b, x >= 0, b >=0 % 
% Input: 
% A mxn matrix with m <= n and rank of A is m 
% b column vector with m rows 
% c column vector with n rows 
% sbasis a vector of size m of indices of column vectors for a feasible basis for this problem from which to start the simplex method 
% sbfs a vector of size n which is the basic feasible solution corresponding to this basis % 
% Output:
% bound = 0 if the problem is unbounded (there is no optimal solution) 
% bound = 1 if the problem is bounded (there is an optimal solution) 
% obasis = a vector of size m of indices of column vectors which gives an optimal feasible basis for the problem if the problem is bounded 
% obfs = a vector of size n which is the optimal basic feasible solution corresponding to this optimal basis if the problem is bounded 
% oval = the objective value of this optimal basic feasible solution (if the problem is bounded)

function[bound, obasis, obfs, oval] = phaseTwo(A, b, c, sbasis, sbfs)

#function tab = simplex(A,b,c,debug,phase_name)
% % phase_name is just used for the headings of each "current tableau" if
% % we decide to print each of them out

% % TEAM: Lo que hace es (como está minimizando) obtiene la variable no
% básica tal que su costo sea el menor (negativo, hace Danzig), por ende si
% lo que queremos es maximizar tenemos que cambiar make_phase_one (la
% manera que metemos la información) y tenemos que hacer que meta la
% variable no básica a la base tal que su costo sea el mayor (positivo)

% % We form our simplex tableau (the cost function is at the last row, the
% % constraint vector is the last column of tab)
[m,n]        = size(A);
tab          = zeros(m+1,n+1);
tab(1:m,1:n) = A;
tab(m+1,1:n) = c(:);
tab(1:m,end) = b(:);

% % keep_running is a flag that tells us if we have found the optimal
% % solution or now
keep_running = true;
while keep_running
    % % If we decide to print all the tableaux out
    if debug
         fprintf('***********************\n');
         fprintf('Current tableau [%s] \n',phase_name);
         disp(tab);
    end
    
    % % Danzig rule
    % % If there is no non basic variable with positive coef, then we cannot
    % % increase more our objective function, we have reached the optimum
    if any(tab(end,1:n)>0)%check if there is positive cost coeff. 
         % % ~ finds the column
         [~,J] = max(tab(end,1:n)); %yes, find the grater
         % now check if corresponding column is unbounded
         if all(tab(1:m,J)<=0)
           bound = 0
           error('problem unbounded. All entries <= 0 in column %d',J);
         %do row operations to make all entries in the column 0
         %except pivot
         else
             bound = 1
             pivot_row = 0;
             min_found = inf;
             for i = 1:m
                  if tab(i,J)>0
                      tmp = tab(i,end)/tab(i,J);
                      if tmp < min_found
                          min_found = tmp;
                          pivot_row = i;
                      end
                                                                                              
                                                                                              
                  end
             end
             if debug
                  fprintf('pivot row is %d\n',pivot_row);
             end
             %normalize
             tab(pivot_row,:) = tab(pivot_row,:)/tab(pivot_row,J);
             %now make all entries in J column zero.
             for i=1:m+1
                  if i ~= pivot_row
                      tab(i,:)=tab(i,:)-sign(tab(i,J))*...
                                    abs(tab(i,J))*tab(pivot_row,:);
                  end
             end
         end
         if debug  %print current basic feasible solution
             fprintf('current basic feasible solution is\n');
             [obasis,obfs] = get_current_x()
         end
    else
         keep_running=false;
         [obasis,obfs] = get_current_x()
         [mc,nc] = size(c);
         if mc == 1
            oval = c*obfs
         else
            oval = transpose(c)*obfs
         end
    end
end
 
    %internal function, finds current basis vector
    function [ind,current_x] = get_current_x()
         current_x = zeros(n,1);
         ind = zeros(m,1);
         i = 1
         for j=1:n
             if length(find(tab(:,j)==0))==m
                  idx= tab(:,j)==1;
                  ind(i) = j;
                  current_x(j)=tab(idx,end);
                  i++
             end
         end
    end

endfunction
