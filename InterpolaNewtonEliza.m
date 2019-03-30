%Polinomio de Interpolación de Newton
%Eliza Chavez
% 16/06/16


clear all
close all
clc

%Datos
%A = [1 4 6 5;0 1.386294 1.791759 1.609438]'
file=input(' Dame el nombre del archivo que contiene los datos: ')
A=load(file);

n=numel(A(:,1));
fprintf(' Ya que tenemos %d puntos, el polinomio de Interpolacion de Newton que pasa por todos los puntos es de grado %d \n',n,n-1)

%Formar la matriz de Diferencias Divididas Finitas
DDF = zeros(n,n);

%Primer columna --- Valores de las Yi's
DDF(:,1) = A(:,2);

%%Segunda Columna ---- Primeras diferencias Divididas Finitas.
%for i=1:n-1
%  DDF(i,2) = (DDF(i+1,1)-DDF(i,1))/(A(i+1,1)-A(i,1));
%end
%
%%Tercera Columna ---- Segundas diferencias Divididas Finitas.
%for i=1:n-2
%  DDF(i,3) = (DDF(i+1,2)-DDF(i,2))/(A(i+2,1)-A(i,1));
%end
%
%%Cuarta Columna ---- Terceras diferencias Divididas Finitas.
%for i=1:n-3
%  DDF(i,3) = (DDF(i+1,3)-DDF(i,3))/(A(i+3,1)-A(i,1));
%end


%Para la columna de la 2 a la ultima:
for j = 2:n
  for i = 1:n-(j-1)
    DDF(i,j) = (DDF(i+1,j-1)-DDF(i,j-1))/(A(i+j-1,1)-A(i,1));
  end
end

%disp('  La matriz de Diferencias Divididas Finitas es: ')
%DDF
disp('  Los coeficientes bi del polinomio de interpolacion de Newton son:')
bi = DDF(1,:)'

val=input(' Dame el valor de x para el que deseas la estimacion: ');
if (val>min(A(:,1)) && val<max(A(:,1)))
  %Se debe caclular el polinomio evaluado en el punto dado por el usuario.
  T=ones(n,n);
  T(1,:)= DDF(1,:);
  for j=2:n
      for i=2:n
        if j>=i
          T(i,j) = val - A(i-1,1);
        end
      end
  end 
  Yaprox = sum(prod(T))
end


%Graficamos los puntos
plot(A(:,1),A(:,2),'or')
hold on

%Graficamos la estimacion:
plot(val,Yaprox,'*k')
hold on

%Graficamos el polinomio:
x1=linspace(min(A(:,1)),max(A(:,1)));
y1=zeros(100,1);

for k=1:100
  T=ones(n,n);
  T(1,:)= DDF(1,:);
  for j=2:n
      for i=2:n
        if j>=i
          T(i,j) = x1(k) - A(i-1,1);
        end
      end
   end 
y1(k)=sum(prod(T(:,:)));
end
plot(x1,y1,'b')
title('Polinomio de Interpolacion de Newton')
hold on

y2 = sin(x1) + sqrt(x1.^3./(x1-1));
plot(x1,y2,'g')

legend('Datos originales','Estimacion','Polinomio','Real',"location",'northwest')
hold off


