clc
clear 

x = -5:.1:5;
y = -5:0.1:5;

[X,Y] = meshgrid(x,y);

z = (X+3).^2 + (Y+3).^2 + 1.5*X.^2 - X.^2 * Y;

surf(X,Y,z)
hold on
[c,h]= contour(X,Y,z);
clabel(c,h)
grid on
