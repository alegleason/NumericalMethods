function [Romberg,Error] = romberg(fun,a,b,n)
%
% This FUNCTION implements the Romberg rule to estimate
% a definite integral
%
% INPUT:
% -- Function
% -- Limits of integration
% -- Number of iterations
%
% OUTPUT:
% -- Integral (Area, using Romberg's integration.)
% -- Error (comparing Romberg with Global Adaptative Quadrature)
%
%  EXAMPLE:
%
%   [Area,APRE] = romberg(@(x).2 + 25*x -200*x.^2 + 675*x.^3 -900*x.^4 +400*x.^5,0,.8,3)
% 
%   Calculating the Integral using Romberg integration:
%   For 3 iterations of the method, up to 4 trapezoids are being used.
%  
%  
% Area =
% 
%     1.6405
% 
% 
% APRE =
% 
%    3.7898e-13
%


%Estimation of the integral using Global Adaptative Quadrature:
GlobalAdaptativeQuadrature = integral(fun,a,b);

%------------- ROMBERG----------------
disp('  Calculating the Integral using Romberg integration:')
%n = input('  Number of iterations:  ');
fprintf('  For %d iterations of the method, up to %d trapezoids are being used.\n \n ',n,2^(n-1))

M = zeros(n,n);

%First column:
for i = 1:n
    M(i,1) = trapezoid(fun,a,b,2^(i-1));
end

%Columns 2 to last:
for j = 2:n
    for i = 1:n-(j-1)
        M(i,j) = (4^(j-1)*M(i+1,j-1) - M(i,j-1)) / (4^(j-1) - 1);
    end
end

%Integral (area) estimated with Romberg method:
Romberg = M(1,n);

%Error comparing Adaptative quadrature and Romberg:
Error = abs((GlobalAdaptativeQuadrature - Romberg)/GlobalAdaptativeQuadrature)*100;


