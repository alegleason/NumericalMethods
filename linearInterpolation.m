%
%
% This scripts imlements a linear interpolation
% in order to calculate an esimate on a new input.
%
% INPUT:
% -- Data points (2-column matrix)
% -- New input
%
% OUTPUT:
% -- Estimation
% -- Graphs
%

clear 
close all 
clc

%ask for the data:
DATA = input(' Give me the data points as a 2-column matrix: ');
[m,n] = size(DATA);
if n==2
    %sorting rows
    DATA = sortrows(DATA);
    %Graph of the points:
    plot(DATA(:,1),DATA(:,2),'o')
    hold on
    %Graph of the interpolation
    plot(DATA(:,1),DATA(:,2))
    hold on
    
    %We only need 2 points for extrapolation
    x = input(' Where do you need the estimation? ');
    if(x > max(DATA(:,1))|| x < min(DATA(:,1)))
        disp(' ERROR: Sorry, we can not make an extrapolation. ')
        return
    else
        pos = sum(x > DATA(:,1));
        x0 = DATA(pos,1);
        y0 = DATA(pos,2);
        x1 = DATA(pos+1,1);
        y1 = DATA(pos+1,2);
        %estimate formula
        y = y0 + (y1 - y0)/(x1 - x0)*(x - x0)
        plot(x,y,'*r');
    end
    
        
    
else
    disp(' ERROR: The matrix does not have 2 columns.')
    return
end 