% Alejandro Gleason Méndez - A01703013
% Ulises Almaguer Guzmán - A01209070
% Ricardo Antonio Vázquez Rodríguez - A01209245

%
% This scrpt implements the Gauss-Seidel method to solve a system of linear
% equations
%
% INPUT:
% --Matrix of coeficients
%   -- For question 5b:
%           [4 3 2;1 3 1;2 1 3]
%   -- For question 5c:
%           [15 -3 -1;-3 18 -6;-4 -1 12]
% --Vector of constants
%   -- For question 5b:
%           [960;510;610]
%   -- For question 5c:
%           [3800;1200;2350]
% --Tolerance (optional)
%
% OUTPUT:
%--Solution(vector of unknowns)
%--APRE
%--Number os steps (iterations)
% -- Error message (when applies)
clc

%Ask for the matrix:
A=input(' Give me the matrix of coefficients: ')
[m,n]=size(A);
if m==n
d =det(A);
if d~=0
%Continue
b=input(' Give me the vector of constants: ')
[p,q]=size(b);
if (p==m && q==1)
%Initialize
x=zeros(n,1);
APRE=100*ones(n,1);
tol= 0.005;
old=x;
while sum(APRE >=tol)>0
for(i=1:n)
s=0;
for j =1:n
if i~=j
s=s+A(i,j)*x(j);
end
end
x(i)=(b(i)-s)./A(i,i);
APRE(i)=abs((x(i)-old(i))/x(i))*100;
old(i)=x(i);
end
end
disp([x APRE])
else
disp('ERROR: The matrix and vector dimensions do not agree')
return
end
else
dis(' ERROR: The matrix is singular.')
return
end
else
disp('ERROR: The matrix is not square.')
return
end
