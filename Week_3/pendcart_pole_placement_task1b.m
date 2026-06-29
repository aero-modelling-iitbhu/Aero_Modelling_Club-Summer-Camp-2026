clear all, close all, clc

m = 1;
M = 5;
L = 2;
g = -10;
d = 1;
A = [];    %fill in A from the linearization.
B = [];    %fill in B from the linearization.
eigs=[];   %fill in the eigen values you wish for your system to have.
K=[];      %use the place function to obtain a gain K for the chosen eigs.
y_f= [];   %this goes into u=-K*(y-y_f)
tspan = 0:.001:10;
y0 = [-3; 0; pi+0.2; 0];  %the initial state
[t,y] = ode45(@(t,y)pendcart(y,m,M,L,g,d,-K*(y-y_f)),tspan,y0);

for k=1:100:length(t)
    drawpend(y(k,:),m,M,L);
end
