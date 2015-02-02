function s = approche(i,x,d,s1,c1,c2,smax)

finie = false;
i = 1;

while(~finie)
    if( (f(i,x+s(i)*d) > f(i,x) + c1*s(i)*d'*gradient(i,x)) ||( i>1 && f(i,x+s(i)*d) >= f(i,x+s(i-1)*d) ) )
        res = finition();
        finie = true;
    elseif(abs(d'*gradient(i,x+s(i)*d))<=-c2*d'*gradient(i,x))
        res = s(i);
        finie = true;
    elseif(d'*f(i,x+s(i)*d)>=0)
        res = finition();
        finie = true;
    else
        %choix si
        i = i+1;
    end;
end;

s = res;

