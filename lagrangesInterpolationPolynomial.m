% Alejandro Gleason A01703013
%
% This script implements the Lagrange's interpolation polynomial
% in order ti calculate an estimation ("y") given a new "x" value
%
% INPUT
% -- Data poinst as 2-column matrix
% -- Value where the estimation is needed
%
% OUTPUT
% --Estimation
% --Graph
%

close all
clear all
clc

%roots([.006335 -.086427 .41177 -.578512])
% Ask for data:
DATA=[-4 -1;-2 2;1 -1;3 4];
%DATA=input('Give me the 2-column matrix with the data points:');
[m,n]=size(DATA);
if n==2
    plot(DATA(:,1),DATA(:,2),'o');
    hold on;
    x=2;%=input('Give me the value where you need the estimation:');
    if (x>=min(DATA(:,1)) && x<=max(DATA(:,1)))
        L=ones(m,1);
        for i=1:m
            for j=1:m
                if i~=j
                    L(i)=L(i)*((x-DATA(j,1))/(DATA(i,1)-DATA(j,1)));
                end
            end
        end
        y=sum(L.*DATA(:,2))
        plot(x,y,'*r');
        hold on;
        
        x1=linspace(0,max(DATA(:,1)));
        y1=zeros(1,100);
        
        for k=1:100
            L=ones(m,1);
        for i=1:m
            for j=1:m
                if i~=j
                    L(i)=L(i)*((x1(k)-DATA(j,1))/(DATA(i,1)-DATA(j,1)));
                end
            end
        end
        y1(k)=sum(L.*DATA(:,2));
        end
        plot(x1,y1,'g');
        hold on;
        %plot(0,0,'o');
        %hold on;
        %plot(1,0.5,'o');
        %hold on;
    else
        disp('ERROR: Value out of range, we cannot make an extrapolation.');
        return;
    end
else
    disp('The matrix does not have 2 columns');
    return;
end