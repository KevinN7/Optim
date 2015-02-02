%flag : 0 Converge
%flag : 1 nombre Max Iteration

function [xmin,fx,flag] = newtonLocaleInterpol(f,g,h,x0,epsi,itmax,c1,s0)

global nout;

k=1;
x(:,k) = x0;
gradx = feval(g,x(:,k));
d(:,k) = mldivide(feval(h,x(:,k)),-feval(g,x(:,k)));
s(k) = interpol(f,g,x(:,k),d(:,k),s0,c1,itmax,epsi);
x(:,k + 1) = x(:,k) + s(k)*d(:,k);
k = k + 1;

while( k<=itmax && (norm(x(:,k)-x(:,k-1))/norm(x(:,k)))>epsi && norm(gradx)>epsi)
    gradx = feval(g,x(:,k));
   d(:,k) = -feval(h,x(:,k))\gradx;
    s(k) = interpol(f,g,x(:,k),d(:,k),s0,c1,itmax,epsi);
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

xmin = x(:,k);
fx = feval(f,xmin);