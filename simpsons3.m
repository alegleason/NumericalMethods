% This script implements simpsons 3/8 rule
% to estimate a numerical integral
%
% INPUT
% -- Function
% -- Limits of integration
%
%

close all 
clear all
clc

name=input ('Give me the funtion: ');
fun=str2func(name);

a=input('Give the lower limit: ');
b=input('Give the upper limit: ');

AQ=integral(fun,a,b) %cuadratura aptativa
x1=linspace(a,b)
y1=fun(x1)
plot(x1,y1)
hold on

h=(b-a)/3;
Integral= (b-a)*(fun(a)+3*fun(a+h)+3*fun(b-h)+fun(b))/8

%left wall
plot ([a a],[0 fun(a)],'g')
hold on

%central wall
plot ([a+h a+h],[0 fun(a+h)],'y--')
hold on
plot ([b-h b-h],[0 fun(b-h)],'y--')
hold on

%right wall
plot ([b b],[0 fun(b)],'g')
hold on

%Roof
DATA=[a fun(a); a+h fun(a+h); b-h fun(b-h);b fun(b)];
x2=linspace(min(DATA(:,1)),max(DATA(:,1)));
y2=zeros(1,100);
for k=1:100
    L = ones(4,1);
    for i=1:4
        for j=1:4
        	if i~=j
            	L(i)=L(i)*((x1(k)-DATA(j,1))/(DATA(i,1)-DATA(j,1)));
            end
        end
    end
    y2(k)= sum(L.*DATA(:,2));
 end
    plot (x2,y2,'m')
    hold on

Error=abs((AQ-Integral)/AQ)*100