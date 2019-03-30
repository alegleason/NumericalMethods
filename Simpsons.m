%
% Ulises Almaguer Guzmán A01209070
%
% This script implements the Simposons 1/3 rule
% to estimate the area under the curve
%
% INPUT
% -- Funtion
% -- Limits of integration
%
% OUTPUT
% -- Integral (area)
% -- Graph
% -- Error (compared to Adaptative Quadrature)
%

clc;
clear all;

% Ask for the funtion
 %name=input ('Give me the funtion: ');
 %fun=str2func(name);
fun=@(x)  ((x.^3)+1).^0.5;


% Ask for the limits
a=input('Give the lower limit: ');
b=input('Give the upper limit: ');

% Ask for the number of trapezoids
n=input('Give the number of applications: ');


h=(b-a)/(2*n);
base=2*h;


x=a:h:b;
y=fun(x);
I=zeros(n,1);

% Graph of the function
x1=linspace(a,b);
y1=fun(x1);
plot(x1,y1);
hold on;

% Graph of the first left wall
plot([a a],[0, y(1)],'r');
hold on;

% Using multiple applications
for k=1:n
   
    aveHeight=(y(2*k-1)+4*y(2*k)+y(2*k+1))/6;
    I(k)=base*aveHeight;
    
    
    % Graph Central Wall
    plot([x(2*k) x(2*k)],[0, y(2*k)],'y--');
    hold on;
    
    % Graph Right Wall
    plot([x(2*k+1) x(2*k+1)],[0, y(2*k+1)],'r');
    hold on;
    
    %Roof
    DATA=[x(2*k-1) y(2*k-1);x(2*k) y(2*k);x(2*k+1) y(2*k+1)];
    x2 = linspace(DATA(1,1),DATA(3,1));
        y2 = zeros(1,100); % 1,100 porque tiene que tener el mismo tam que linspace que es un vector con 1 fila y 100 columnas
        for p = 1:100
            L = ones(3,1);
        
            for i=1:3 %for from 1 to m
                for j=1:3 %for from 1 to j
                    if i~=j %solo que la i sea diferente de j
                        L(i) = L(i)*((x2(p)-DATA(j,1))/(DATA(i,1)-DATA(j,1))); % j es el valor del indice j de las x e i el de las xi
                   
                    end
                end
            end
        % Calculate Li
        y2(p) = sum(L.*DATA(:,2));
        end
        plot(x2,y2,'m');
        hold on;
end

Real = integral(fun,a,b)
Integral=sum(I)
Error = abs(((Real-Integral)/Real)*100)