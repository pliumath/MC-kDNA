function [L,C] = minicirclenetwork(s,a)
%MINICIRCLENETWORK generates a network of minicircles on a lattice of size 
%s and lattice constant a. The network is recorded in L as normal vectors 
%and center coordinates, and in C as discrete 3D polygons.

C = zeros(s,s,3); %preallocate coordinates for centers
[C(:,:,1),C(:,:,2),C(:,:,3)] = meshgrid(1:s,1:s,0); %generate coordinates
C = reshape(C,s^2,3);

C = C.*a; %scale by multiplying the lattice ocnstant

[N,P] = unitcircles(s^2); %generate circles

L = [C,N]; %record data

C = P + repmat(reshape(C',1,3,s^2),size(P,1),1); %shift to new centers

end