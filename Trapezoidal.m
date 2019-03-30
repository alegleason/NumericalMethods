%
%
% This script estimates the area under the curve (Integral)
% using the trapezoidal rule.
%
% INPUT:
% -- Function
% -- Limits of integration
%
% OUTPUT: 
% -- Integral (area)
% -- Graph
%
%
% SCRPIT 2
%fun = @(x)0.2+25*x-200*x.*x+675*x.*x.*x-900*x.*x.*x.*x+400*x.*x.*x.*x.*x

%Ask for the function:
%name = input(' Give me the function: ');
%fun = inline(name);
%fun = @(x)0.2+25*x-200*x.*x+675*x.*x.*x-900*x.*x.*x.*x+400*x.*x.*x.*x.*x
%Ask for the limits:
a = 0;%input(' Lower limit: ');
b = 20;%input(' Upper limit: ');
n = 10;%input(' Number of applications: ');'
n2 = 5;

base = (b-a)/n;%base es h

x = a:base:b;%empiezo en a, avanzo de base en base hasta llegar a b
y = [0 1.8 2 4 4 6 4 3.6 3.4 2.8 0]%fun(x);%funcion evaluada en las x ya generadas

base2 = (b-a)/n2;%base2 es para intervalos de 4

x2 = a:base2:b;%empiezo en a, avanzo de base en base hasta llegar a b
y2 = [0 2 4 4 3.4 0]%fun(x);%funcion evaluada en las x ya generadas

%Integral = ((b-a) .* ((fun(a) + fun(b))./2)) %Final function, for just one application

%Graph of the function:
%x1 = linspace(a,b);
%y1 = fun(x1);
%plot(x1,y1)
%hold on

%TRAMPA!!!
%Real = integral(fun,a,b)

I = zeros(n,1);%Vertical vector
I2 = zeros(n2,1);%Vertical vector

figure(1)
set(gcf, 'name', 'Intervals sizes 2')
%Graph of the first left wall
plot([a a],[0 y(1)], 'g');
hold on

%Graph for intervals 2 by 2
for i=1:n
    aveHeight = (y(i) + y(i+1))/2;
    I(i) = base * aveHeight;%base es la misma para todos

    %Graph of each right wall
    plot([x(i+1) x(i+1)],[0 y(i+1)], 'g')
    hold on
    %Grah of each celing
    plot([x(i) x(i+1)],[y(i) y(i+1)], 'g')
    hold on
end

Integral = sum(I)


%Graph for intervals 2 by 2
for i=1:n2
    figure(2)
    set(gcf, 'name', 'Intervals sizes 4')
    aveHeight = (y2(i) + y2(i+1))/2;
    I2(i) = base2 * aveHeight;%base es la misma para todos
    
    %Graph of each right wall
    plot([x2(i+1) x2(i+1)],[0 y2(i+1)], 'b')
    hold on
    %Grah of each celing
    plot([x2(i) x2(i+1)],[y2(i) y2(i+1)], 'b')
    hold on
end

Integral2 = sum(I2)

figure(3)
set(gcf, 'name', 'Simpsons all interval')
a = 0;%input(' Lower limit: ');
b = 20;%input(' Upper limit: ');
n = 10;%input(' Number of applications: ');
base = (b-a)/n;%base es h
x = a:base:b;%empiezo en a, avanzo de base en base hasta llegar a b
y = [0 1.8 2 4 4 6 4 3.6 3.4 2.8 0]%fun(x);%funcion evaluada en las x ya generadas
%Estimation of the integral using one application of Simpson 1/3 rule
IntegralSimpson = ((b-a)*(y(1)+4*y(6)/2)+y(11))/6
plot([a b-a b],[y(1) y(6) y(11)], 'r')

%Error = abs((Real-Integral)/Real)*100