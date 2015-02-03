function s = finition(f,g,x,d,c1,c2,smin,smax,itmax)

finie = false;
cmpt=1;
while(~finie)
    sj = smin + (smax-smin)*rand(1,1);
    if(feval(f,x+sj*d)>feval(f,x)+c1*sj*d'*feval(g,x) || feval(f,x+sj*d)>=feval(f,x+smin*d))
        smax = sj;
    else
        if(abs(d'*feval(f,x+sj*d)<=-c2*d'*feval(g,x)))
            res = sj;
            finie = true;
        elseif(d'*feval(f,x+sj*d)*(smax-smin)>=0)
            smax = smin;
            smin = sj;
        else
            smin = sj;
        end;
    end;
    if(cmpt>itmax)
        finie=true;
        res=0;
    end;
    cmpt = cmpt+1;
    
end;



s = res;