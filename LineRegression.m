% Alejandro Gleason Méndez - A01703013
% Arturo Cruz Cardona - A01701804
% Ricardo Antonio Vázquez - A01209245
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
DATA = [0.75 0.8; 2 1.3;2.5 1.2;4 1.6;6 1.7;8 1.8;8.5 1.7];
[p, q] = size(DATA);
if q == 2
    %Visaluization of data:
    figure(1)
    plot(DATA(:,1),DATA(:,2),'o')
    hold on
    %System of normal equations
    A = [p sum(DATA(:,1));sum(DATA(:,1)) sum(DATA(:,1).^2)]%All of the rows, first column
    %Vector of constants:
    b = [sum(DATA(:,2));sum(DATA(:,1).*DATA(:,2))]
    %Solve the system:
    a = A\b%matlab's way to solve
    
    fprintf('The linear model is: Y = %f X + %f', a(2), a(1))
    xlabel('x')
    ylabel('y')
    title('Original data')
 
    %Graph the model:
    x = linspace(min(DATA(:,1))-1,max(DATA(:,1)) + 1);
    y = a(2)*x + a(1);%In x we substitute all the values gotten on linspace
    plot(x,y,'r');
    hold on
    
    %Error analysis:
    %Calculate the "y" given by the model at y = mx + b
    fprintf('\n \nThe error analisys of the Original Model is: ')
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
    
    %Transforming the model
    T = DATA;
    %Transform the 'x' values (x -> 1/x)
    T(:,1) = 1./(DATA(:,1));
    %Transform the 'y' values (y -> 1/y)
    T(:,2) = 1./(DATA(:,2));
    T
    
    %Graph of the transformed data:
    figure(2)
    plot(DATA(:,1),DATA(:,2),'o')
    hold on  
    [n, s] = size(T);
    
    %System of NORMAL EQUATIONS:
    %Define the matrix of coefficients:
    A = [n sum(T(:,1));sum(T(:,1)) sum(T(:,1).^2)];
    %Define the vector of constants
    b = [sum(T(:,2));sum(T(:,1).*T(:,2))];
    %Solve the system:
    a = A\b
   
    %Graph: 
    figure(2)
    x = linspace(0,9);
    aux = a(2)./a(1);
    y = (1./(a(1))).*(x./(aux+x));
    %y = (1./a(1)).*(x./(aux+x));%a(2) = m, a(1) = b
    plot(x,y,'r')
    hold on
    xlabel('1/X')
    ylabel('1/Y')
    title('Linealization: Populaiton Growth Model')
    axis([0 9 0 2]);
    
    fprintf(' The linear model is: Y = %f (x/(%f + x))', 1./a(1), a(2)./a(1))
   
    
    %Error analysis:
    %Calculate the "y" given by the model at y = mx + b
    disp('The error analisys of the Transformed Model is: ');
    T(:,3) = a(2)*T(:,1) +  a(1)%Slope * xValues + intersection with y
    %Sum of the residuals:
    Sr = sum((T(:,2) - T(:,3)).^2) %diferencia entre algún punto y la línea
    %Estandard error of the estimate:
    Syx = sqrt(Sr/(p-2))
    
    St = sum((T(:,2)-mean(T(:,2))).^2) %diferencia entre algún punto y el promedio
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
