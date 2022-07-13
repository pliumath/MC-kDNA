function [A,B] = linkingstate(L,recordangle)
%LINKINGSTATE returns the linking state of a minicircle network represented
%by center coordinates and normal vectors L and returns the state as a
%matrix A.


if nargin > 1 && recordangle == true

    n = size(L,1); %number of minicircles

    A = zeros(n,n); %preallocate adjacency matrix
    B = zeros(n,n);

    parfor i = 1:(n-1)

        tempA = zeros(n,1); %preallocate data
        tempB = zeros(n,1); %preallocate data
        tL = L;

        for j = (i+1):n

            tempA(j) = islinked(tL(i,:),tL(j,:)); %check linking state

            if tempA(j)

                u = tL(i,4:6); %get normal vectors
                v = tL(j,4:6);

                ang = atan2(norm(cross(u,v)), dot(u,v)); %get angle between circles

                if ang > pi/2

                    ang = pi-ang;

                end

                tempB(j) = ang;

            end

        end

        A(:,i) = tempA;
        B(:,i) = tempB;

    end

    A = A + A';
    B = B + B';

else

    n = size(L,1); %number of minicircles

    A = zeros(n,n); %preallocate adjacency matrix

    parfor i = 1:(n-1)

        tempA = zeros(n,1); %preallocate data
        tL = L;

        for j = (i+1):n

            tempA(j) = islinked(tL(i,:),tL(j,:)); %check linking state

        end

        A(:,i) = tempA;

    end

    A = A + A';

end

end