%x0 vecteur colonne

function [xmin,fx,flag] = quasiNewtonBacktrack(f,g,h,x0,H0,epsi,itmax,c1,rho)

global nout;

k=1;
x(:,k) = x0(:);
H(:,:,k) = H0;
d(:,k) = -H(:,:,k)*feval(g,x(:,k));
s(k) = backtracking(f,feval(g,x(:,k)),x(:,k),d(:,k),rho,c1,itmax,epsi);
x(:,k + 1) = x(:,k) + s(k)*d(:,k);
y(:,k) =  feval(g,x(:,k+1)) - feval(g,x(:,k));
H(:,:,k+1) = (eye(2) - (d(:,k)*y(:,k)')/(d(:,k)'*y(:,k))) * H(:,:,k) * (eye(2) - (y(:,k)*d(:,k)'/(d(:,k)'*y(:,k))) )+s(k)*(d(:,k)*d(:,k)'/(d(:,k)'*y(:,k)));

k = k + 1;
while( k<=itmax && (norm(x(:,k)-x(:,k-1))/norm(x(:,k)))>epsi )
    d(:,k) = -H(:,:,k)* feval(g,x(:,k));
    s(k) = backtracking(f,feval(g,x(:,k)),x(:,k),d(:,k),rho,c1,itmax,epsi);
    x(:,k + 1) = x(:,k) + s(k)*d(:,k);
    y(:,k) = feval(g,x(:,k+1)) - feval(g,x(:,k));
    H(:,:,k+1) = (eye(2) - (d(:,k)*y(:,k)')/(d(:,k)'*y(:,k)))*H(:,:,k)*(eye(2) - (y(:,k)*d(:,k)'/(d(:,k)'*y(:,k))) )+s(k)*(d(:,k)*d(:,k)'/(d(:,k)'*y(:,k)));
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