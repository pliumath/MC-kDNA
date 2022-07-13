%% Example_1
%This example generates and visualize a minicircle network.

clear,clc

s = 10; %lattice size
d = 0.59; %lattice density
a = sqrt(1/d); %lattice constant

[L,C] = minicirclenetwork(s,a); %generate minicircles
[A,B] = linkingstate(L,true); %check linking state

perc = ispercolated(A); %check if the network is percolated
visualizenetwork(L,C,B) %visualize