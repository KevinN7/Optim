[x,fval,exitflag,output] = fminunc('f1',[3;5])
%[x,fval,exitflag,output] = fminunc(f1,[3;5])
[x,fval,exitflag,output] = fminunc(@f1,[3;5])

% 
% output
% Structure containing information about the optimization. The fields of the structure are
% iterations	
% Number of iterations taken
% funcCount	
% Number of function evaluations
% firstorderopt	
% Measure of first-order optimality
% algorithm	
% Optimization algorithm used
% cgiterations	
% Total number of PCG iterations ('trust-region' algorithm only)
% stepsize	
% Final displacement in x ('quasi-newton' algorithm only)
% message	
% Exit message