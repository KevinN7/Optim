function res = critere1(x,xprec,epsi)

abs(x-xprec)
if(abs(x-xprec)<=epsi)
    res = true;
else
    res = false;
end;