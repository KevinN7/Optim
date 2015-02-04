function s = approche(f,g,x,d,s1,c1,c2,smax,itmax)

s(1) = 0;
i = 2;
s(i) = s1;
finie = false;

while(~finie)
    gx = feval(g,x);
    if( (feval(f,x+s(i)*d) > feval(f,x) + c1*s(i)*d'*gx) ||( i>1 && feval(f,x+s(i)*d) >= feval(f,x+s(i-1)*d) ) )
        res = finition(f,g,x,d,c1,c2,s(i-1),s(i),itmax);
        finie = true;
    elseif(abs(d'*feval(g,x+s(i)*d))<=-c2*d'*gx)
        res = s(i);
        finie = true;
    elseif(d'*feval(f,x+s(i)*d)>=0)
        res = finition(f,g,x,d,c1,c2,s(i),s(i-1),itmax);
        finie = true;
    else
        s(i+1) = s(i)+(smax-s(i))*rand(1);
        i = i+1;
    end;
end;

s = res;