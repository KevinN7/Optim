function [pas,flag] = interpol(f,g,x,d,s0,c1,itmax,epsi)

global nin;

phi_0 = feval(f,x);
phi_s0 = feval(f,x+s0*d);
phid_s0 = feval(g,x)'*d;

if(phi_s0 <= phi_0 + phid_s0*c1*s0)
    pas = s0;
    return;
end;
    
%Interpolation quadratqiue
s1 = -(phi_0*s0^2)/(2*phi_s0 - phi_0 - s0*phid_s0);
    
if( feval(f,x+s1*d) <= phi_0 + c1*s1*phid_s0 )
      pas = s1;
      return;
end;

%Interpolation cubique
critere = true;
k=1;
while(critere)
    nin = nin+1;
    coeff = (1/(s0^2*s1^2*(s1-s0)))*[s0^2 -s1^2 ; -s0^3 s1^3]*[feval(f,x+s1*d) - phi_0 - phid_s0*s1 ; phi_s0 - phi_0 - phid_s0*s0];
    a = coeff(1);b = coeff(2);
    
    alpha = (-b + sqrt(b^2 -3*a*phid_s0) )/(3*a);
    beta = (-b - sqrt(b^2 -3*a*phid_s0) )/(3*a);
    
    testalpha = alpha>=0 && alpha<=1;
    testbeta = beta>=0 & beta<=1;
    
    merde = false;
    if(testalpha && testbeta)
      phialpha = feval(f,x+alpha*d); 
      phibeta = feval(f,x+beta*d);
      s2 = min(phialpha,phibeta);
    elseif(testalpha)
      s2 = alpha;
    elseif(testbeta)
      s2 = beta;
    else
      merde = true;
      s2 = -1;
    end;

    if(feval(f,x + s2*d) <= phi_0 + c1*s2*phid_s0 && ~merde)
         pas = s2;
         return;
    else
        if(abs(s1-s2)<=epsi)
            pas = 0;
            critere = false;
            flag = 5;
        end;
         s0 = s1;
         s1 = s2;
    end;
    
    k=k+1;
    if(k>=itmax)
        critere = false;
        pas = 0;
        flag = 5;
    end;
    
    
end;