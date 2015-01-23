%flag : 0 Converge
%flag : 1 nombre Max Iteration

function [x,fx,flag] = newtonLocaleBissection(f,g,h,x0,epsi,itmax,c1,c2)

global nout;

k=1;
x(:,k) = x0;
gradx = feval(g,x(:,k));
d(:,k) = mldivide(feval(h,x(:,k)),-feval(g,x(:,k)));
s(k) = bissection(f,g,x(:,k),d(:,k),feval(g,x(:,k)),feval(f,x(:,k)),c1,c2,itmax,epsi);
x(:,k + 1) = x(:,k) + s(k)*d(:,k);
k = k + 1;


while( k<=itmax && norm(x(:,k)-x(:,k-1))>epsi && norm(gradx)>epsi)
    gradx = feval(g,x(:,k));
    d(:,k) = -feval(h,x(:,k))\gradx;
    s(k) = bissection(f,g,x(:,k),d(:,k),feval(g,x(:,k)),feval(f,x(:,k)),c1,c2,itmax,epsi);
    x(:,k + 1) = x(:,k) + s(k)*d(:,k);
    k = k + 1;
    nout = nout + 1;
end;



if(k>itmax)
    %Limite iteration atteinte
    flag=0;
elseif( norm(gradx)<=epsi )
    %Amplitude gradient trop petite
    flag=1;
elseif( norm(x(:,k)-x(:,k-1))<=epsi )
    %Stagnatiojn de x
    %Variation de x trop petite
    flag=2;
else
end;

x = x(:,k);
fx = feval(f,x);