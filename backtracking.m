function [pas,flag] = backtracking(f,gradx,x,d,rho,c1,itmax,epsi)

global nin;

s = 1;
k = 1;

if(0<rho && rho<1)
    fx = feval(f,x);
    alpha = c1*d'*gradx;
    while( (feval(f,x+s*d) - fx >s*alpha) && (k<itmax))
        nin = nin +1 ;
        s = rho*s;
        k=k+1;
    end;
    res = s;
    
else
    %Parametre de contraction foireux
    res = -1;
end;

pas = res;