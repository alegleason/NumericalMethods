%
%
% This program implements the Secant's Method
% to find the root of a nonlinear equation.
%
% INPUT:
% -- Function 
% -- First approximation
% -- Second approximation
%
% OUTPUT:
% -- Approximation to the root
% -- APRE
% -- Number of steps 
%
%

clc
clear all

%Ask for the function
name = input(' Give me the function: ');
fun = inline(name);
%Ask for the first approximation
x0 = input(' Give me the first approximation to the root: ');
x1 = input(' Give me the second approximation to the root: ');

% Tolerance:
tol = 14.98;
APRE = 100;
n = 0;

while APRE >=tol
    %Evaluate:
    fx = fun(x0);
    f2x = fun(x1);
    if fx == 0 || f2x == 0
     disp(' Contratulations! A root has been found. '); %Because the derivative is the function
     return
    else
     n = n + 1
     Xnew = x1 - ((f2x*(x0-x1))/(fx-f2x))
     APRE = abs((Xnew - x1)/Xnew)*100
     x0 = x1;
     x1 = Xnew;
    end
end
