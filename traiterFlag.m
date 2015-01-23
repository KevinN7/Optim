function res = traiterFlag(flag)

if(flag==0)
    fprintf('nbr iteration max atteint\n\¬');
elseif(flag==1)
    fprintf('amplitude gradient trop petite\n\n');
elseif(flag==2)
    fprintf('variation de xmin trop faible\n\n');
elseif(flag==3)
    fprintf('\n');
else
    fprintf('\n');
end;