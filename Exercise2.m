%   Exercise 3
% Alejandro Gleason Méndez - A01703013
% Arturo Cruz Cardona - A01701804
% Ricardo Antonio Vázquez - A01209245
%
%   This script implements a linear regression
%   to fit a linear model to a set of points in 
%   the plane (2D).
%
%   INPUT:
%   --Data points: [420, 1000000; 550, 100000; 625, 10000; 800, 1000; 925, 100; 1000, 10; 1100, 1]
%
%   OUTPUT:
%   --Linear Model (y=mx+b)
%   --Graph
%   -- Error Analysis
%
clc
clear
close all
%Ask for the data

DATA = [420, 1000000; 550, 100000; 625, 10000; 800, 1000; 925, 100; 1000, 10; 1100, 1]
    
    %Visualization of the data:
    figure(1)
    plot(DATA(:,1),DATA(:,2),'o')
    hold on
    
    T=DATA;
    %Transform
    T=log10(DATA)
    figure (2)
    %plot (T(:,1),T(:,2),'o')
    %hold on
    [p,q] = size(DATA);
    
    %System of normaal equations:
    %Matrix of coefficients:
    A = [p sum(T(:,1)); sum(T(:,1)) sum(T(:,1).^2)]
    %Vector of constants
    b = [sum(T(:,2)); sum(T(:,1).*T(:,2))]
    %Solve the system:
    sol = A\b
    
    %System of normaal equations:
    %Matrix of coefficients:
    A = [p sum(DATA(:,1)); sum(DATA(:,1)) sum(DATA(:,1).^2)]
    %Vector of constants
    b = [sum(DATA(:,2)); sum(DATA(:,1).*DATA(:,2))]
    %Solve the system:
    a = A\b
    
    
    alpha= 10.^sol(1)
    beta= sol(2)
    
    %y=alpha x^betha
    figure(2)
    x= linspace (min(T(:,1))-1,max(T(:,1))+1);
    y=a(2)*x+a(1);
    %plot(T(:,1),T(:,2),'O')
    plot(x,y,'r')
    hold on
    xlabel('log(x)')
    ylabel('log(y)')
    title('Linearization')
    fprintf('The linear model is: logy=%f logX+%f \n', a(2),a(1))
    %Graph of the model
    figure(1)
    
    xx= linspace (min(DATA(:,1))-1,max(DATA(:,1))+1);
    yy=alpha*xx.^beta;
    plot(xx,yy,'r')
    hold on
    xlabel('x')
    ylabel('y')
    title('Graph of the power model')
    fprintf('The power model is: y=%f X^%f \n', alpha,beta)
    %Prediction:
    %Q=input(' Do you need a prediction (Y/N)');
    %if Q=='Y'
    %    xx=input('Gime the value where you need the prediction:  ')
    %    yy=a(2)*xx+a(1);
    %    fprintf('The prediction for %f is %f \n',xx,yy)
    %    plot(xx,yy,'*k')
        
    %else
    %   disp('Bye')
    %end
    
    %Error analysis:
    %Calculate the "y" given by the model
    T(:,3)=sol(2)*T(:,1) + sol(1)
    %Sum of the residuals
    Sr=sum((T(:,2)-T(:,3)).^2)
    %standard error of the estimate
    Syx=sqrt(Sr/(p-2))
    
    St = sum((T(:,2)-mean(T(:,2))).^2)
    %COEFFICIENT OF DETERMINATION:
    r2=(St-Sr)/St
    %Coefficient of corelation
    r=sqrt(r2)
    %Percentage of uncertainty explained by the model
    PUEM= r2*100
    




