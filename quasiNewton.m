%x0 vecteur colonne

function [x,fx,flag] = quasiNewton(f,g,h,x0,epsi,itmax)

global nout;

k=1;
x(:,k) = x0(:);
H(:,:,k) = H0;
d(:,k) = -H(:,:,k)*feval(g,x(:,k));
s(k) = 1;
x(:,k + 1) = x(:,k) + s(k)*d(:,k);
y(:,k) =  feval(g,x(:,k+1)) - feval(g,x(:,k));
H(:,:,k+1) = (eye(2) - (d(:,k)*y(:,k)')/(d(:,k)'*y(:,k))) * H(:,:,k) * (eye(2) - (y(:,k)*d(:,k)'/(d(:,k)'*y(:,k))) )+s(k)*(d(:,k)*d(:,k)'/(d(:,k)'*y(:,k)));

k = k + 1;
while( k<=itmax && abs(x(:,k)-x(:,k-1))>epsi )
    d(:,k) = -H(:,:,k)* feval(g,x(:,k));
    s(k)=1;
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

x = x(:,k);
fx = feval(f,x(:,k));