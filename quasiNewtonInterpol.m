%x0 vecteur colonne

function [xmin,fx,flag] = quasiNewtonInterpol(f,g,h,x0,H0,epsi,itmax,c1,s0)

global nout;

[i,~] = size(x0);
Id = eye(i);

k=1;
x(:,k) = x0(:);
H(:,:,k) = H0;
d(:,k) = -H(:,:,k)*feval(g,x(:,k));
s(k) = interpol(f,g,x(:,k),d(:,k),s0,c1,itmax,epsi);
x(:,k + 1) = x(:,k) + s(k)*d(:,k);
y(:,k) =  feval(g,x(:,k+1)) - feval(g,x(:,k));
H(:,:,k+1) = (Id - (d(:,k)*y(:,k)')/(d(:,k)'*y(:,k))) * H(:,:,k) * (Id - (y(:,k)*d(:,k)'/(d(:,k)'*y(:,k))) )+s(k)*(d(:,k)*d(:,k)'/(d(:,k)'*y(:,k)));

k = k + 1;
while( k<=itmax && norm(x(:,k)-x(:,k-1))>epsi )
    d(:,k) = -H(:,:,k)* feval(g,x(:,k));
    s(k) = interpol(f,g,x(:,k),d(:,k),s0,c1,itmax,epsi);
    x(:,k + 1) = x(:,k) + s(k)*d(:,k);
    y(:,k) = feval(g,x(:,k+1)) - feval(g,x(:,k));
    H(:,:,k+1) = (Id - (d(:,k)*y(:,k)')/(d(:,k)'*y(:,k)))*H(:,:,k)*(Id - (y(:,k)*d(:,k)'/(d(:,k)'*y(:,k))) )+s(k)*(d(:,k)*d(:,k)'/(d(:,k)'*y(:,k)));
    k = k + 1;
    nout = nout + 1;
end;


if(k>itmax)
    %Limite iteration atteinte
    flag=1;
else
    %Critere atteint
    flag=0;
end;

xmin = x(:,k);
fx = feval(f,x(:,k));