% Alejandro Gleason Méndez A01703013
%
% This script implements the Bisection method to find the 
% root of a nonlinear equation.
%
% INPUT:
% -- function (continous)
% -- interval [a, b] (function must have opposite signs on the extremes)
% -- tolerance (optional)
%
% OUTPUT:
% -- Approximation to the root
% -- Number of steps
% -- ARPE
%
clc
clear all

% Tolerance:
tol = 0.005;
old = 0;
APRE = 100;

% Ask for the function
name =  input ('Give me the function: '); % equivalent to the scanf
fun = inline(name); % parsing the function from string to a function

% Ask fo the interval
a = input('Give me the lower limit: ');
b = input('Give me the upper limit: ');

% Evaluate
u = fun(a);
v = fun(b);

% Check if the limits are ok
if u*v < 0
    n = 0; % number of steps
    while APRE >= tol
    n = n+1
    x = (a+b)/2
    w = fun(x);
    APRE = abs((x-old)/x)*100
    old = x;
    if w == 0 % if the function evaluated is 0, we have found the root
        disp('   Congrats! You have foun the root')
        disp(x)
        return
    else 
        if u*w < 0
            b = x;
            v = w;
        else
            a = x;
            u = w;
        end 
    end 
    end 
else 
    disp('  ERROR: The function does not have opposite signs on the extremes :(')
    return % ends the program
    end 