%
% REGRESSION -- POWER MODEL
%
%
close all
clear all
clc

%Original data:
ORI = [1 2 3 4 5;0.5 1.7 3.4 5.7 8.4]'
figure(1)%Window to graph
plot(ORI(:,1),ORI(:,2),'o')
axis('equal')
hold on

DATA = ORI;
%Transform the 'x' values (x -> logx)
DATA(:,1) = log10(ORI(:,1));
%Transform the 'y' values (y -> logy)
DATA(:,2) = log10(ORI(:,2));
DATA

%Graph of the transformed data:
figure(2)
plot(DATA(:,1),DATA(:,2),'o')
hold on

[n,q] = size(DATA)

%System of NORMAL EQUATIONS:
%Define the matrix of coefficients:
A = [n sum(DATA(:,1));sum(DATA(:,1)) sum(DATA(:,1).^2)];
%Define the vector of constants
b = [sum(DATA(:,2));sum(DATA(:,1).*DATA(:,2))];

%Solve the system:
a = A\b;

fprintf(' The linear regression model for your transformed data is: ')

%Graph the line: 
figure(2)
x1 = linspace(0,1);
y1 = a(1) + a(2)*x1;
plot(x1,y1,'r')
hold on
xlabel('log(x)')
ylabel('log(y)')
title('Linealization')

%falta lo de r, r2, PUEM

%Graph the power model:
figure(1)
x2 = linspace(0,6);
y2 = 10^a(1)*x2.^a(2);%10^b*x2^b(2);
plot(x2, y2, 'r')
hold on
xlabel('x')
ylabel('y')
title('Original data an power model')

%Coefficient of determination
St = sum((DATA(:,2)-mean(DATA(:,2))).^2);
r2 = (St - Sr)/St

%Coefficient of correlation:
r = sqrt(r2)

%Percentage of uncertainty explained by the model:
PUEM = r2*100