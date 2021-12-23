function tab = nma_simplex(A,b,c,debug)
%function [A,b,c]=nma_simplex(A,b,c)
%This function implments the simplex matrix algorithm.
%It accepts A_eq and b_eq and c as defined in standard
%documentation and generates all the simplex tableaus, and
%returns the final tableau which the user can read from it the
%minimum value of the objective function and the optimal x vector
%directly.
                                                                                              
                                                                                              
%
%It runs both phase one and phase two automatically.
%
%The input is
%
%A: This is the Ax=b matrix. This is for simplex standard
%   form only. The caller must convert all inequalites to
%   equalities first by using slack and surplus variables.
%   This function does not support Ax<b form. A has to be in
%   standard form
%
%b: Vector. This is the right hand side of Ax=b.
%
%c: Vector. This is from minimize  J(x) = c'x.
%
%debug: flag. Set to true to see lots of internal steps.
%
%Returns:
%
%This function returns the final tableau. It has the form
%
%  [ A | b  ]
%  [ c | J  ]

% % We must check first if the information provided is logical (and is in
% % the standard form)
validate_input(A,b,c);

% % Both phases implement the "simplex" function, the difference is their
% % input
[A,b] = make_phase_one(A,b,debug);
tab   = simplex(A,b,c,debug,'phase two');
end