function [N,C] = unitcircles(n,s)
%UNITCIRCLES generates n unit circles in 3D space with normal vectors
%uniformly distrbuted on the unit sphere and recorded in N. The function
%also returns the discrete 3D polygons with s sides for the unit circles,
%which are recorded in C.

%generate normal vectors
u = -1+2*rand(n,1); %length of z-axis projections
theta = 2*pi*rand(n,1); %angle between xy-projections and x-axis
N = [sqrt(1-u.^2).*cos(theta),sqrt(1-u.^2).*sin(theta),u]; %normal vectors

%generate the unit circle in the xy-plane
if nargin == 1
    phi = linspace(0,2*pi)'; %subdivide angles to 100 intervals (default)
else
    phi = linspace(0,2*pi,s)'; %subdivide angles to s intervals
end
x = cos(phi); %x-coordinates
y = sin(phi); %y-coordinates
t = length(phi);
z = zeros(t,1); %z-coordinates
c = [x,y,z]; %coordinates for the unit circle

C = repmat(c,1,1,n); %preallocate the coordinates for n circles

%rotate the unit circle to match the normal vectors
U = repmat([0,0,1],1,1,n); %set the normal vectors for initial unit circles
N3 = reshape(N',1,3,n);

Coss = dot(N3,U,2); %cosine of rotate angles
OMC = 1 - Coss; % one minus cosines
Sins = sqrt(1-Coss.^2); %sine of rotate angles
Axes = cross(N3,U,2); %rotate axes
Axes = Axes./vecnorm(Axes,2,2);

%set rotate matrices
R = [Axes(1,1,:).^2.*OMC+Coss, Axes(1,1,:).*Axes(1,2,:).*OMC-Axes(1,3,:).*Sins, Axes(1,1,:).*Axes(1,3,:).*OMC+Axes(1,2,:).*Sins;
     Axes(1,2,:).*Axes(1,1,:).*OMC+Axes(1,3,:).*Sins, Axes(1,2,:).^2.*OMC+Coss, Axes(1,2,:).*Axes(1,3,:).*OMC-Axes(1,1,:).*Sins;
     Axes(1,3,:).*Axes(1,1,:).*OMC-Axes(1,2,:).*Sins, Axes(1,3,:).*Axes(1,2,:).*OMC+Axes(1,1,:).*Sins, Axes(1,3,:).^2.*OMC+Coss];

C = pagemtimes(C,R); %rotate

end