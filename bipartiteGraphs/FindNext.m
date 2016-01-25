function EP_new=FindNext(l,EP_old,A_T,M)
%input EP_old of the child edge
%input: adjacency matrix of M alternating tree T
%input: matching M
%input: l= end point to find edge in path P
%output: the next path with new root being its parent in the M alternating tree
%EP_new is always 1-by-2 row vector
A=A_T;
l
rtemp=l
[I1,J1]=find(A(rtemp,:)) % J1 gives incidence nodes of rtemp in tree T

j2=Fcn_find_matchNode(rtemp,M)
setdiff(sort(EP_old),M,'rows')
if (setdiff(sort(EP_old),M,'rows')) %if EP_old was not a matching, find the new edge that's matching
    EP_new=[rtemp j2]               %j2 is singleton
else
    EP_new=[rtemp,setdiff(J1,j2)]   %J1\j2 is singleton
    
end
