
% Jhensen Ray Agni
%%% Technical Plots practice %%%

%%% PLOT functions
%% Vibration plot %%

clf
sampleRate = 0.01;  % set the sample rate
t = 0:sampleRate:10;  % time increment
y1 = 10 * exp(-.5 * t).* sin(3 * t + 2);
y2 = 7*exp(-.4 *t).* cos(5 * t - 3);

figure(1);
plot(t,y1);
hold on;
plot(t,y2);

title('Machine Vibration');
xlabel('time [s]');
ylabel('Amplitude [mm]');
legend('System 1','System 2');
%%  Particle Motion Plot using fplot

%  sample rate not given but time span is
%  time span = 0 -> 7 [s]
tspan = [0 7];  % [s] time span 
x = @(t) .4*t.^3 - 2*t.^2 - 5*t + 13;  % [m] position
v = @(t) 1.2*t.^2 - 4*t - 5;  % [m/s] velocity
a = @(t) 2.4*t-4 ;  % [m/s^2] acceleration

%plot 
figure(2)
subplot(3,1,1)
fplot(x,tspan);
title('Position of a particle over time');
ylabel('meters [m]')
xlabel('time [s]')
subplot(3,1,2)
fplot(v,tspan);
title('Velocity of a particle over time');
ylabel('velocity [m/s]')
xlabel('time [s]')
subplot(3,1,3)
fplot(a,tspan)
title('acceleration of a particle over time');
ylabel('acceleration [m/s^{2}]');
xlabel('time [s]')

%% Yield stress vs Strain rate;
theoreticalStrainRate = [ .00001 .0001 .01 .1 10 100 1000 1000];
sigma_y = 320 * ((theoreticalStrainRate/200).^.2 +1); % [MPa] theoretial equation 
strainRate = [ .00005 .0003 .05 1.0 4.0 300 4000];  % [s^-1]
yieldStress = [ 340 365 420 460 480 625 890];  % [Mpa]

% plot yield stress vs strain rate 
figure(3)
semilogx(strainRate,yieldStress);
hold on
grid on
semilogx(theoreticalStrainRate,sigma_y);
hold off

%% Histogram random sample
Mean = 30;
std_deviation = 6;
dataSample = randn(1000,1).*std_deviation + Mean;  % Create random sample
figure(4)
hist(dataSample)

%% 3D line plots 

% single variable

% Set time span

t = 0:.1:100;  % [s] time

x = 3*cos(2*t) - 3*sin(2*t);
y = -6*sin(2*t) - 6*cos(2*t);
z = t.^3; 
figure(5)
plot3(x,y,z);
xlabel('X position [m]');
ylabel('Y position [m]');
zlabel('Z position [m]');
title('Particle Motion')

%% Surface Plots

x = 0 : 0.1 : 5;
y = 0 : 0.1 : 5;

% two varriables

[X,Y]=meshgrid(x,y);  % create vectors for the grid
z = X.^2*cos(3*X) + -Y.^2*sin(3*Y);
figure(6);
surf(X,Y,z)  % plot 

%% Contour Plots

% multivariable

x = -3 : 0.1 : 3;  % x-range
y = -3 : 0.1 : 3;  % y-range

[X,Y]= meshgrid(x,y);
z = (X+3).^2 + (Y+3).^2 + 1.5*X.^2 - X.^2 * Y;
figure(7);
surf(X,Y,z);

hold on
[c,h]=contour(X,Y,z);
clabel(c,h);
grid on;

