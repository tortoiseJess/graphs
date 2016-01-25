%test set from hungarian alg
% E=[1 4; 1 5; 2 4; 2 5; 2 6; 3 5; 3 6]
% V_T=[3 6 8 9 5 2 4];

%test from co ugrad course p.158
% E=[1 7; 1 9; 1 10; 2 7; 2 8; 3 7; 3 8; 3 9; 4 9;4 10; 5 7];
% n=10;
% V_T=[1 7 9 10 5 3 4 8 2];
% r=3;
% Fcn_detm_PM(V_T,r,E,n)  % output [u=4 v=10]

%my example 8 nodes
% E=[1 5; 1 6; 1 7; 2 7; 2 8; 3 5; 3 7; 3 8; 4 5; 4 6; 4 7];
% V_T=[3 5 7 8 1 2 ];
% n=8;
% r=3;
% M=[1 5; 2 8];
% v=5
% if (v~=M)
%     disp('hi')
% else
%      disp('bye')
% end

% 
% i=[1 1 3 4 4 4 5 5 6 6 7 8]; j=[5 6 5 6 7 8 1 3 1 4 4 4 ];
% s=size(j,2);
% A_T=sparse(i,j,ones(1,s),8,8);
% M=[3 5;4 6];
% r=1; l=7;
% 
% P=PathFinder(r,l,M,A_T)

%cubical graph
%E=[1 5; 1 6; 1 7; 2 5; 2 8; 2 6; 3 5; 3 8; 3 7; 4 8; 4 7; 4 6];
%E=[1 4; 1 5; 2 4; 2 6; 3 5; 3 6];
%crown graph
%E=[1 5; 1 7; 1 8; 2 6; 2 5; 2 8; 3 6; 3 7; 3 5; 4 6; 4 7; 4 8];
E=[1 6; 1 10; 1 8; 1 7; 2 6; 2 7; 2 8; 2 9; 3 6; 3 8; 3 9; 3 10; 4 7; 4 8; 4 9; 4 10; 5 7; 5 6; 5 9; 5 10  ]

n=10;
[M,B]=Perfect_Deficient(n,E)
