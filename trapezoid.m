function Integral = trapezoid(fun,a,b,n)
%
% This FUNCTION implements the trapezoidal rule to estimate
% a definite integral
%
% INPUT:
% -- Function
% -- Limits of integration
% -- Number of applications
%
% OUTPUT:
% -- Integral (area)
%
% EXAMPLE:
% 
% fun = @(x) sqrt(x.^3 + 1)
% a = -1;
% b = 2;
% n = 20;
% area = trapezoid(fun,a,b,n)
%
% area =
%
%    4.0656
%
%

base = (b-a)/n;

x = a:base:b;
y = fun(x);

I = zeros(n,1);
for k = 1:n
    AverageHeight = (y(k) + y(k+1))/2;
    I(k) = base * AverageHeight;   
end

Integral = sum(I);






