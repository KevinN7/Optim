%flag : 0 Converge
%flag : 1 nombre Max Iteration

function [xres,fx,flag] = newtonLocaleApprocheFinition(f,g,h,x0,epsi,itmax,c1,c2)

global nout;

s1=0.1;
smax=10;

k=1;
x(:,k) = x0;
gradx = feval(g,x(:,k));
d(:,k) = mldivide(feval(h,x(:,k)),-feval(g,x(:,k)));
s(k) = approche(f,g,x(:,k),d(:,k),s1,c1,c2,smax,itmax);
x(:,k + 1) = x(:,k) + s(k)*d(:,k);
k = k + 1;


while( k<=itmax && (norm(x(:,k)-x(:,k-1))/norm(x(:,k)))>epsi && norm(gradx)>epsi)
    gradx = feval(g,x(:,k));
    d(:,k) = -feval(h,x(:,k))\gradx;
    s(k) = approche(f,g,x(:,k),d(:,k),s1,c1,c2,smax,itmax);
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
elseif( (norm(x(:,k)-x(:,k-1))/norm(x(:,k)))<=epsi )
    %Stagnatiojn de x
    %Variation de x trop petite
    flag=2;
else
    flag=42;
end;

xres = x(:,k);
fx = feval(f,xres);