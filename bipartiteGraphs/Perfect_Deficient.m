function [M,B]=Perfect_Deficient(n,E)
% input (n,E) where n is a positive even integer
% describing the number of nodes in the undirected bipartite
% graph G(ybar), E is a |E|-by-2 matrix describing the edges {i,j} in the
% graph (nodes 1,2,. . . , n/2 are in U and the remaining nodes are in W).
%  either finds a perfect matching M in G(ybar) or finds a deficient set B which
% is a subset of U. When either one returns a 0 value, means it's empty
% set.
% whenever an edge is given, it's always U on the first column and W on
% the 2nd column

%initialize
M=0; %edge set consisting of matches
r=1;  %roots of tree T
V_T=[1]; %vertices of tree T
A_T=spalloc(n,n,n^2/4); %adjacency matrix of the M-alternating tree in each iteration
B_T=[1]; % even nodes of tree T
j=1;

while (j<=n^2)
    [u,v]=Fcn_detm_PM(V_T,r,E,n); % fcn to determine of there is edge  uv with u in B_T (even nodes of tree T) and v not in V_T(vertices of tree T)
    if v>0  %such uv exists
        if (v~=M) %if v is M exposed M grows
            P=[PathFinder(r,u,M,A_T);[u v]]
            %update new M with increased size
            if M==0
                M=P
            else
                M=[setdiff(M,sort(P,2),'rows'); setdiff(sort(P,2),M,'rows')] %M_new generated, size M_new = size M_old +1 
            end
            if size(M,1)==n/2   
                B=0;
                break
            end
            %if M not a perfect match yields a new trial using a new root r given
            %the M_new
            root_choice=setdiff([1:1:n/2],M)
            r=root_choice(1) %pick new root for M_new-alternating tree 
            V_T=[r]
            B_T=V_T
            A_T=spalloc(n,n,n^2/4);
        else % if v is M covered, T grows
            w=Fcn_find_matchNode(v,M);
            %update tree T
            V_T=unique([V_T,v,w]) ;
            A_T(u,v)=1; A_T(v,u)=1; A_T(v,w)=1; A_T(w,v)=1;
            B_T=give_BT(V_T,r,n); %function to find the even nodes of alternating tree T
        end
            
    else
        B=give_BT(V_T,r,n)  %return deficient set
        M=0;
        break
    end
    j=j+1;
end

