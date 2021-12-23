eps = 1e-7;
sigma = 10;
m = 2; n = 4;

%Solves the LP given by
%
% min c'x
% subject to:
% Ax = b
% x >= 0

%M: Es una nacada describir así matrices y vectores
A = [3 5;4 1];
b = [78;36];
c = [5;4];
c = c';

%The optimal solution can be read at the last tableau (in the columns of
%the submatrix of A that make up the identity matrix, all the other
%variables, since it is a BFS are set to 0)


   A = -A;    % to reflect subtraction from right-hand side
   AA = A;
   bb = b;
   cc = c;
   n0 = sum(cc>0);

   nonbasics = 1:n;
   basics = (n+1:n+m)';
   
   iter = 0;
   opt = 1;
   while max(c) > eps
      [cj, col] = max(c);

      Acol = A(:,col);
      if sum(Acol<-eps) == 0
	    opt = -1;  % unbounded
	    'unbounded'
	    break;
      end
%      [t, row0] = max(-Acol./b);
      nums = b.*(Acol<-eps);
      dens = -Acol.*(Acol<-eps);
      [t, row] = min(nums./dens);
%      if row0 ~= row,
%          row0
%	  row
%      end

      j = nonbasics(col);
      i = basics(row);

      Arow = A(row,:);
      a = A(row,col);
      A = A - Acol*Arow/a;
      A(row,:) = -Arow/a;
      A(:,col) = Acol/a;
      A(row,col) = 1/a;

      brow = b(row);
      b = b - brow*Acol/a;
      b(row) = -brow/a;

      ccol = c(col);
      c = c - ccol*Arow/a;
      c(col) = ccol/a;

      basics(row) = j;
      nonbasics(col) = i;
      iter = iter+1;
      if iter > 100*(m+n)
      	  opt = 0;  % iter limit
          break;
      end
   end
%    if iter>0 && opt ~=0
%       k = k+1
%       ms(k) = m;
%       ns(k) = n;
%       n0s(k) = n0;
%       iters(k) = iter;
%       opts(k) = opt;
%    elseif iter == 0   % too easy
%       AA
%       bb
%       cc
%    else 	% cycling
%       m, n, iter, opt
%       % Save degenerate part for checking later
%       A0 = AA(b==0,:);
%       b0 = b(b==0);
%       [m0, n] = size(A0);
% %      [x,fval,exitflag] = linprog(cc,[-AA ; -eye(n)], [bb ; zeros(n,1)] );
% %      break;