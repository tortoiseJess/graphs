function P=PathFinder(r,l,M,A_T)
%input: r=root of tree T
%l=any node in tree
% M = current matching
%A_T= adjacency matrix of current tree T without self incidence part
A=A_T;
n=size(A,1);
%row=A(l,:)

if r==l
    P=[];
else
    [I Rtemp]=find(A(l,:)) %Rtemp finds the connecting node up back to root
    % if l and r in the same U or W set then connecting node is match, else it's
    % a nonmatch
    if size(Rtemp,2)>1 % if l degree 2
        if ((r<=n/2)&(l<=n/2))||((r>=n/2+1)&(l>=n/2+1))
            Rtemp=Fcn_find_matchNode(l,M)
        else
            Rtemp=setdiff(Rtemp,Fcn_find_matchNode(l,M))
        end
    end
    
        EP=[l,Rtemp]  %Rtemp will be new starting point it is placed second column
        P=EP 
        while (EP~=r) %while end node of path not root yet, keep searching
            EP=FindNext(EP(2),EP,A_T, M) %fcn to decide which node to pick next
            P=[P; EP]
        end
 
    
    
end