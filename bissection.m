function [h,flag] = bissection(f,g,x,d,gradx,fx,c1,c2,itmax,epsi)

global nin;

beta = inf;
s = 1;
alpha = 0;
finie = false;
k=1;

while(~finie)
        nin = nin +1 ;
        gamma = c1*d'*gradx;
        sigma = c2*d'*gradx;
    
    if(feval(f,x+s*d)-fx > s*gamma)
        beta = s;
        s = 0.5*(alpha+beta);
    elseif(d'*feval(g,x+s*d) < sigma)
        if(beta==inf)
            alpha = s;
            s = 2*alpha;
        else
            s = 0.5*(alpha+beta);
        end;
    else
        res = s;
        finie = true;
    end;
    
    if(k>itmax)
        finie = true;
        flag = 5;
    end;
    
end;

h = res;