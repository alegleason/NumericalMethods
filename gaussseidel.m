% This script finds the soultion of matrixes using the 
% Gauss Seidel method
% INPUT:
% -- Matrix of coeficients
% -- Vector of constants
% -- Tolerance (optional)
%
% OUTPUT:
% -- Solution (vector of unknowns)
% -- APRE
% -- Number of steps (iterations)
% -- Error message (when applies)

%Ask for the matrix
A = input(' Give me the matrix of coefficients: ')
[m, n] = size(A);
if m == n
    d = det(A);
    if d == 0
        disp(' ERROR: Matrix is singular. ')%It does not has a unique solution
        return
    else 
        b = input(' Give me the vector of constants: ')
        [p, q] = size(b);
        if (p==m && q==1)
            %Initializing the values:
            x = zeros(n,1); %x is the vector that contains the solution
            APRE = 100*ones(n,1);
            tol = 0.005;
            old = x; %copy of x matriz (only zeros)
            while sum(APRE >= tol) > 0
            for i = 1:n%1:n es 1 hasta n
                s = 0;
                for j = 1:n
                    if i~=j
                        s = s+A(i,j)*x(j);
                    end
                end  
                x(i) = (b(i)-s)./A(i,i);%s es de suma
                APRE(i) = abs((x(i)-old(i))/x(i))*100;
                old(i) = x(i);%actualizar los valores de old
            end
            disp([x APRE])
            end 
        else
            disp(' ERROR: Matrix and vector dimensions do not agree ')%error hace lo mismo que disp, pero sale en rojo
            return
        end
    end 
else
    disp(' ERROR: Matrix is not squared' )
    return
end