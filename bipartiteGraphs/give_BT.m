function B_T=give_BT(V_T,r,n)
%input: r= root of tree T 
%V_T = row vector of nodes in tree T
%n =no. of nodes in orginal graph G
%output: B_T row vector, sorted

if r<=n/2
    B_T=setdiff(V_T,[n/2+1:1:n]);
else
    B_T=setdiff(V_T,[1:1:n/2]);
end