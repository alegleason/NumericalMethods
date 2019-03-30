%
%
% This program implements the Newton-Raphson's Method
% to find the root of a nonlinear equation.
%
% INPUT:
% -- Function (derivable)
% -- Derivable of the function
% -- First approximation
%
% OUTPUT:
% -- Approximation to the root
% -- APRE
% -- Number of steps 
%

clc
clear all

%Ask for the function
name = input(' Give me the (derivable) function: ');
fun = inline(name);
%Ask for the derivative
name2 = input(' Give me the derivative: ');
der = inline(name2);
%Ask for the first approximation
x0 = input(' Give me the first approximation to the root: ');

% Tolerance:
tol = 0.00001;
APRE = 100;
n = 0;

while APRE >=tol
    %Evaluate:
    fx = fun(x0);
    dx = der(x0);
    if dx == 0
     disp(' ERROR: A flat point has been reached. '); %Because the derivative is the function
     return
    else
     n = n + 1
     Xnew = x0 - fx/dx
     APRE = abs((Xnew - x0)/Xnew)*100
     x0 = Xnew;
    end
end
