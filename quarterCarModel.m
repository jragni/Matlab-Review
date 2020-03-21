% Author: Jhensen Ray Agni
% Email: jagni001@ucr.edu
% Github: https://jragni.github.io

%%%%% Quarter Car Suspension Model %%%

% Initialize constants
Ks = 2000;  % [N/m]  spring constant of suspension
C = 100;  % [N*s/m] coefficient of friction for dashpot
Kw = 200000;  % [N/m] spring constant for the wheel
M = 300;   % [kg] mass of quarter car
m = 40;    % [kg] mass of wheel

% State Matrix derived from force balance
A = [ 0 1 0 0;
    -Ks/M -C/M Ks/M C/M;
    0 0 0 1;
    Ks/m C/m -(Kw+Ks)/m -C/m]; 
% COntrolling 
B = [ 0;1/M; 0;0];

C = [1 1 0 0]; % Measuring position
D = 0;
sys = ss(A,B,C,D);

step(sys)

