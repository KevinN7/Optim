%Lagrangien

function [xmin,fmin,flag] = langrangien(f,c,tau,mu0,x0,lambda0,epsi0,itmax)
    
    %Parametre recherche min sans contrainte
    c1 = 0.7;
    itmax = 200;
    epsi =0.1;
    
    etha0chap = 0.1258925;   
    alpha = 0.1;
    beta = 0.9;
    
    k = 1;
    lambda(:,k) =  lambda0;
    x(:,k) = x0;
    epsi(k) = epsi0;
    k = k+1;
    
    convergence = false;
    
    while(~convergence)
        L = @(u) f(u) + lambda(:,k)'*c(u) + mu(k)*(norm(c(u),2)^2)/2;
    
    %[x(:,k+1),fx,flag]= newtonLocaleBacktravk(L,g,h,x0,epsi,itmax,rho,c1);
    %[x,fval,flag,output,grad] = fminunc(L)
        options = optimoptions('fminunc','MaxIter',itmax,'TolFun',epsi,'TolX',epsi);
        [x,fval,exitflag,output,grad,hessian] = fminunc(L,x0,options);
    
        if(norm(grad,2)<=epsi(k))
            break;
        end;
        
    %Tester la convergence
    %convergence = ;
    
        %if(norm(h(x(:,k)),2))
        if(norm(hessian,2)<=etha(k)) 
            lambda(:,k+1) = lambda(:,k) + mu(k) * h(x(k));
            mu(k+1) = mu(k);
            epsi(k+1) = epsi(k) / mu(k);
            etha(k+1) = etha(k) / mu(k)^beta;
        else
            lambda(:,k+1) = lambda(:,k);
            mu(k+1) = tau*mu(k);
            epsi(k+1) = epsi(0) / mu(k+1);
            etha(k+1) = etha0chap / mu(k+1)^alpha;
        end;
        k=k+1;
    end;