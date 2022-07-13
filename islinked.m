function result = islinked(X,Y)
%ISLINKED determines if two circles represented by center coordiantes and
%normal vectors X and Y are linked or not.

A = [X(4:6);Y(4:6);Y(1:2)-X(1:2),0];
b = [X(1)*X(4)+X(2)*X(5);Y(1)*Y(4)+Y(2)*Y(5);(Y(1)^2-X(1)^2)/2+(Y(2)^2-X(2)^2)/2];
p = A\b;
norm([X(1:2),0]-p');

if 1 > norm([X(1:2),0]-p')
    result = true;
else
    result = false;
end

end