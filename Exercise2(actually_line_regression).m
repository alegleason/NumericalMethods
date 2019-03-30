% 
%
% This script implements a linear regression
% to fit a linear model to a set of points 
% 
% INPUT:
% --Data points
%
% OUTPUT:
% -- Linear Model (y = mx + b)
% -- Error Analysis
% -- Graph
% -- Error Analysis
%

clc
clear
%Ask for the data:
DATA = input(' Give the 2 columns matrix that contains the data points: ');
[p, q] = size(DATA);
if q == 2
    %Visaluization of data:
    plot(DATA(:,1),DATA(:,2),'o')
    hold on
    %System of normal equations
    A = [p sum(DATA(:,1));sum(DATA(:,1)) sum(DATA(:,1).^2)]%All of the rows, first column
    %Vector of constants:
    b = [sum(DATA(:,2));sum(DATA(:,1).*DATA(:,2))]
    %Solve the system:
    a = A\b%matlab's way to solve
    
    fprintf(' The linear model is: Y = %f X + %f', a(2), a(1))
    %Graph the model:
    x = linspace(min(DATA(:,1))-1,max(DATA(:,1)) + 1);
    y = a(2)*x + a(1);%In x we substitute all the values gotten on linspace
    plot(x,y,'r');
    hold on
    
    %Prediction:
    Q = input(' Do you need a prediction? (Y/N) ');
    if Q=='Y'
        xx = input(' Give me the value where you need the prediction ');
        yy = a(2)*xx + a(1); %y = mx + b
        fprintf(' The prediction for %f is %f \n', xx, yy)
        plot(xx, yy, '*k')%La predicción se grafica con un asterisco color negro
    else
        disp( 'Bye!')
    end
    
    %Error analysis:
    %Calculate the "y" given by the model at y = mx + b
    DATA(:,3) = a(2)*DATA(:,1) +  a(1)%Slope * xValues + intersection with y
    %Sum of the residuals:
    Sr = sum((DATA(:,2) - DATA(:,3)).^2) %diferencia entre algún punto y la línea
    %Estandard error of the estimate:
    Syx = sqrt(Sr/(p-2))
    
    St = sum((DATA(:,2)-mean(DATA(:,2))).^2) %diferencia entre algún punto y el promedio
    %Coefficient of determination:
    r2 = (St-Sr)/St
    %Coefficient of correlation:
    r = sqrt(r2)
    %Percentage of uncertanty explained by the model:
    PUEM = r2*100%'x'% seguro de que es una estimación correcta
else 
    disp (' ERROR: The matrix does not have 2 columns.')
    return
end 
