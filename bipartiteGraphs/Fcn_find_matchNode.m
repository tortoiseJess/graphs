function w=Fcn_find_matchNode(v,M)
[i j]=find(v==M);
if j==1;
    w=M(i,2);
elseif j==2;
    w=M(i,1);
else
    disp('error, no match')
    return  %terminate program
end
    