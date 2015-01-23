%Lagrangien

function [xmin,fmin,flag] = langrangien(f,c,tau,mu0,x0,lambda0,epsi0,itmax)

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
    x(:,k+1) = fminunc(L);
    [x,fval,flag,output,grad] = fminunc(L)
    
    if(norm(,2)) 
    end;
    %Tester la convergence
    %convergence = ;
    if(norm(h(x(:,k)),2))
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
    end;