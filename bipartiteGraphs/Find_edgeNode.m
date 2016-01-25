function Node_set= Find_edgeNode(v,E,n)
[I J]=find(v==E)
%if v<=n/2 then v \in U, v will be in column 1 of E
%else v\in W, v will be in column 2 of E
%output: row vector

if v<=n/2
    Node_set=E(I,2);
else
    Node_set=E(I,1);
end
Node_set=Node_set';