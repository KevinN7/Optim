function s = finition(i,x,d,smin,smax)

finie = false;

while(~finie)
    sj = smin + (smax-smin)*rand(1,1);
    if(f(i,x+sj*d)>f(i,x)+c1*sj*d'*f(i,x) || f(i,x+sj*d)>=f(i,x+smin*d))
        smax = sj;
    else
        if(abs(d'*f(i,x+sj*d)<=-c2*d'*f(i,x)))
            res = sj;
            finie = true;
        elseif(d'*f(i,x+sj*d)*(smax-smin)>=0)
            smax = smin;
            smin = sj;
        else
            smin = sj;
        end;
    end;
    
end;



s = res;