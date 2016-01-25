function [u v]=Fcn_detm_PM(V_T,r,E,n)
%decision to keep search for new matchings or return
%deficient set.
%input: tree vertices V_T sorted row vector
%r = root of tree
%E=edge matrix of graph G
%output: [u v] node with uv an edge of G, u in B_T and v not in V_T
v_til=0;u_til=0;i=1;
disp('another iteration')
B_T=give_BT(V_T,r,n);

%search every node u_til in B_T for a point u in B_T but v \notin V_T such that
%[u v ] is an edge in orginal graph G (ie matrix E)
for i=1:size(B_T,2)
    u_til=B_T(i);
    Node_set=Find_edgeNode(u_til,E,n);
    Node_not_VT=setdiff(Node_set,V_T);
    if (size(Node_not_VT,2)>=1)  %if exist node set not in V_T then take that to be v
        v_til=Node_not_VT(1);
        v=v_til;
        break
    end
end

%if none return 0
if v_til==0;
    u=0;
    v=0;
else
    u=u_til;
    
end
    