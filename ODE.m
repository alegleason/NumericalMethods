%
%
%  NAMES: Alejandro Gleason Méndez A01703013
%         Ricardo Antonio Vázquez Rodríguez A01209245
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
fun = @(x) exp(-cos(x)+(cos(x).^3)/3);
yReal = fun(x);
plot(x,yReal,'r')
hold on

%Ask for the initial condition:  
%  Class example:   [0 1]
% cond = input('  Give me the initial condition:  ');
cond = [0,1];
x0 = cond(1);
y0 = fun(cond(1));

%  -----------  EULER  -----------  
yEuler=zeros(size(x));
yEuler(1)=y0;
for i=1:length(x)-1
    slope=der(x(i),fun(x(i)));
    yEuler(i+1)=yEuler(i)+slope*h;
end

plot(x,yEuler,'b');
hold on;

%  -----------   HEUN  -----------  

yHeun=zeros(size(x));
yHeun(1)=y0;
for i=1:length(x)-1
    k1=der(x(i),fun(x(i)));
    k2=der(x(i)+h,fun(x(i))+k1*h);
    slope=k1/2+k2/2;
    yHeun(i+1)=yHeun(i)+slope*h;
end

plot(x,yHeun,'g');
hold on;

%  ---------- MID POINT ----------  

yMidpoint=zeros(size(x));
yMidpoint(1)=y0;
for i=1:length(x)-1
    k1=der(x(i),fun(x(i)));
    k2=der(x(i)+h/2,fun(x(i))+(k1*h)/2);
    yMidpoint(i+1)=yMidpoint(i)+k2*h;
end

plot(x,yMidpoint,'c');
hold on;

%  ----------  RALSTON  ----------  

yRalston=zeros(size(x));
yRalston(1)=y0;
for i=1:length(x)-1
    k1=der(x(i),fun(x(i)));
    k2=der(x(i)+3*h/4,fun(x(i))+(3*k1*h)/4);
    slope=k1/3+(2*k2)/3;
    yRalston(i+1)=yRalston(i)+slope*h;
end

plot(x,yRalston,'k');
hold on;

%  ----------  BUTCHER  ----------  

yButcher = zeros(size(x));
yButcher(1) = y0;
for i = 1:length(x)-1
    k1 = der(x(i),fun(x(i)));
    k2 = der(x(i)+h/4,fun(x(i))+(k1*h)/4);
    k3 = der(x(i)+h/4,fun(x(i))+(k1*h)/8+(k2*h)/8);
    k4 = der(x(i)+h/2,fun(x(i))-(k2*h)/2+k3*h);
    k5 = der(x(i)+3*h/4,fun(x(i))+3*(k1*h)/16+9*(k4*h)/16);
    k6 = der(x(i)+h,fun(x(i))-3*(k1*h)/7+2*(k2*h)/7+12*(k3*h)/7-12*(k4*h)/7+8*(k5*h)/7);
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
disp('       x       yReal    yEuler   yHeun   yMidpoint   yRalston  yButcher')
disp(T)
disp(' ')

%For the legend box in the graph:
legend('Analytical','Euler','Heun','Midpoint','Ralston','Butcher','Location','North')

%Write your conclussions:
disp(' ')
disp(' WRITE YOUR DISCUSSION ABOUT THE TOPIC HERE ')
disp(' As it can be seen on the graph all methods provide quite good approximation to the real solution')
disp(' except Eulers one, eventually if we decrease the step size (maybe to .1) curves will fit even better. ')
disp(' Of course Butchers method is the one that provides a better approximation to the real solution, because it is ')
disp(' a fifth order method - which takes into consideration more intervals for the slope (not like Eulers that only takes')
disp(' the beginning point, or others that also take the midpoint) -, so evidently we will get a better approximation.')
disp(' Remember that all Runge-Kutta methods consist on the same formula, but with a change on the slope calculation (and .')
disp(' it comes from an extrapolation). ')

disp(' Eulers method is the less effective method, it only works correctly for polynomials of grade one, it is ')
disp(' a first order method, that is why it is not that useful. It uses the differential equation to estimate ')
disp(' the slope -which is taken at the beginning of the interval- with the first derivate. We take the slope at the')
disp(' beginning of the interval as an approximation of the average slope over all the interval, that can lead to some error. ')

% SIGUELE AKI
disp('Regarding the Heun?s method, in order to be more accurate, it uses the determination of the derivative in two points of the'); 
disp('interval and then they are averaged to obtain a better slope estimation over the entire interval. It is important to point out');
disp('that this method is a predictor-corrector method because the slope at the beginning of the Interval is used to extrapolate linearly');
disp('yi+1. This method is a second order method since the second derivative of the ODE is zero, while the true solution is a quadratic ');
disp('polynomial.');

disp('Regarding the Midpoint method, reduces the error by predicting a value of y in the midpoint of the interval; this predicted value is');
disp('used to calculate the slope in the midpoint, which is supposed to represent a valid approximation of the average slope over the entire');
disp('interval.');

disp('Regarding the Ralston?s method, is based in the fact that a minimum truncation error is obtained for the second-order when the slope is');
disp('weighted at the beginning an at ¾ of the interval. This method is the most accurate of all of the second order methods.');

disp('Finally, regarding the Butcher?s method is a fifth order method, therefore, it is really use in real world application due to the fact that');
disp('it provides better approximations than the second- order methods for cases where the solution is a polynomial with a grade higher than 2.');
disp('Nevertheless the biggest downside of this method is the fact that it requires the computation of more variables, and therefore it is computationally');
disp('more expensive.');

disp()
disp('In conclusion, it is important to notice that for all of these methods, the error can be reduced  by decreasing the step size. A method of n order will');
disp('give exact results if the solution of the ODE is a polynomial of n order.');