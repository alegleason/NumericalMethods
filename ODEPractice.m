%
%
%  NAMES: Alejandro Gleason Mï¿½ndez A01703013
%         Ricardo Antonio Vï¿½zquez Rodrï¿½guez A01209245
%         HŽctor Calder—n Reyes - A01350637
%  GROUP #2
%  DATE: 13/11/2018 
%
% This script compares the Analytical solution to Euler and 
% some Runge-Kutta methods to find the numerical solution 
% of an Ordinary Differential Equation
%
% INPUT:
% -- ODE
% -- Interval
% -- Initial condition
%
% OUTPUT:
% -- Numerical solution to the ODE using different methods
% -- Graph
% -- Discussion about the topic
%
%

close all
clear all
clc

%Ask for the Ordinary diferential equation (ODE):
%'@(x,y) y*sin(x).^3'
%  Class example:   '@(x)-2*x.^3 + 12*x.^2 -20*x + 8.5'
%  name = input('  Give me the ordinary differential equation:  ');
der = str2func('@(x,y) y*sin(x).^3');

%Ask for the interval:     
%  Class example:   [0 4]
% inter = input('  Give me the interval:  ');
inter=[0,3];
a = inter(1);
b = inter(2);

%we can define the step size:
h = .5;

% "x" values:
x = a:h:b;
x = x';

%  ----------  ANALYTICAL  ----------  
% Exact Solution: 
% This one only works for the class example, 
% you must change it for your practice:
fun = @(x) exp((-cos(x)+(cos(x).^3)/3)+(2/3));
yReal = fun(x);
plot(x,yReal,'r')
hold on

%Ask for the initial condition:  
%  Class example:   [0 1]
% cond = input('  Give me the initial condition:  ');
cond = [0,1];
x0 = cond(1);
y0 = cond(2);

%  -----------  EULER  -----------  
yEuler = zeros(size(x));
yEuler(1) = y0;
for i = 1:length(x)-1
    slope = der(x(i), yEuler(i));
    yEuler(i+1) = yEuler(i) + slope*h; 
end
plot(x,yEuler,'b')
hold on

%  -----------   HEUN  -----------  
yHeun = zeros(size(x));
yHeun(1) = y0;
for i = 1:length(x)-1
    k1=der(x(i),yHeun(i));
    k2=der(x(i)+h,yHeun(i)+k1*h);
    slope = (k1/2)+(k2/2);
    yHeun(i+1) = yHeun(i) + slope*h; 
end
plot(x,yHeun,'g')
hold on

%  ---------- MID POINT ----------  

yMidpoint = zeros(size(x));
yMidpoint(1) = y0;
for i = 1:length(x)-1
    k1=der(x(i),yMidpoint(i));
    k2=der(x(i)+h/2,yMidpoint(i)+(k1*h)*1/2);
    yMidpoint(i+1)=yMidpoint(i)+k2*h;
end
plot(x,yMidpoint,'c')
hold on

%  ----------  RALSTON  ----------  

yRalston = zeros(size(x));
yRalston(1) = y0;
for i = 1:length(x)-1
    k1=der(x(i),yRalston(i));
    k2=der(x(i)+3*h/4,yRalston(i)+(3*k1*h)/4);
    slope=k1/3+(2*k2)/3;
    yRalston(i+1)=yRalston(i)+slope*h;
end
plot(x,yRalston,'k')
hold on

%  ----------  BUTCHER  ----------  
yButcher = zeros(size(x));
yButcher(1) = y0;
for i = 1:length(x)-1
    k1 = der(x(i),fun(x(i)));
    k2 = der(x(i)+h/4,yButcher(i)+(k1*h)/4);
    k3 = der(x(i)+h/4,yButcher(i)+(k1*h)/8+(k2*h)/8);
    k4 = der(x(i)+h/2,yButcher(i)-(k2*h)/2+k3*h);
    k5 = der(x(i)+3*h/4,yButcher(i)+3*(k1*h)/16+9*(k4*h)/16);
    k6 = der(x(i)+h,yButcher(i)-3*(k1*h)/7+2*(k2*h)/7+12*(k3*h)/7-12*(k4*h)/7+8*(k5*h)/7);
    %weighted average
    slope = (7*k1 + 32*k3 + 12*k4 + 32*k5 + 7*k6)/90;
    yButcher(i+1) = yButcher(i) + slope*h; 
end
plot(x,yButcher,'m')
hold on

%Table with solutions:
T = [x yReal yEuler yHeun yMidpoint yRalston yButcher];
disp(' ')
%Table's titles:
disp('      x       yReal     yEuler    yHeun    yMidpoint  yRalston  yButcher')
disp(T)
disp(' ')

%For the legend box in the graph:
legend('Analytical','Euler','Heun','Midpoint','Ralston','Butcher','Location','North')

%Write your conclussions:
fprintf(' ')
fprintf(' WRITE YOUR DISCUSSION ABOUT THE TOPIC HERE ')
fprintf(' As it can be seen on the graph all methods provide quite good approximation to the real solution')
fprintf(' except Eulers one, eventually if we decrease the step size (maybe to .1) curves will fit even better. ')
fprintf(' Of course Butchers method is the one that provides a better approximation to the real solution, because it is ')
fprintf(' a fifth order method - which takes into consideration more intervals for the slope (not like Eulers that only takes')
fprintf(' the beginning point, or others that also take the midpoint) -, so evidently we will get a better approximation.')
fprintf(' Remember that all Runge-Kutta methods consist on the same formula, but with a change on the slope calculation (and .')
fprintf(' it comes from an extrapolation). ')
fprintf('\n');
fprintf(' Eulers method is the less effective method, it only works correctly for polynomials of grade one, it is ')
fprintf(' a first order method, that is why it is not that useful. It uses the differential equation to estimate ')
fprintf(' the slope -which is taken at the beginning of the interval- with the first derivate. We take the slope at the')
fprintf(' beginning of the interval as an approximation of the average slope over all the interval, that can lead to some error. ')
fprintf('\n');

fprintf('Heuns method is a second order type because the second derivative of the polynomial is zero \n');
fprintf('It uses the determination of the derivative in two points of the interval and then they are averaged to obtain a better slope estimation');
fprintf('It is also a predictor-corrector because it uses the slope at the beginning of the interval is used to extrapolate linearly yi+1');
fprintf('\n');
fprintf('Midpoint method is more precise than Euler as it predicts a value of y in the midpoint of the interval.\n');
fprintf('This is due to the fact that the slope is calculated by the addtion 1/3 of k1 and 2/3 k2,  generating a minimun truncation error');
fprintf('\n');
fprintf('Ralstons method is the most accurate of the second order method');
fprintf('\n');
fprintf('Butchers™s method is a fifth-order method, and thats why it is commonly used in real life applications where polynomials are greater\n ');
fprintf('and where the solution is a polynomial with a grade higher than 2 (or the solution is not even a polynomial)\n ');
fprintf('\n');

fprintf(' Finally, it is quite important to know all the methods (and that there exist even more), because depending on each problem, one method may fit better than other one.');
fprintf(' As a complement for better results, it is good to know that for all of these methods, error can be reduced by decreasing the step size. Check in this case the improvement');
fprintf(' by changing the step size from .5 to .25, but it is computationally more expensive, so a balance need to be found.');
fprintf(' A method of n order will only give exact results if the solution of the ODE is a polynomial of n order, it is always important to take that consideration into account. ');
