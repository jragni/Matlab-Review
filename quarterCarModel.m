% Author: Jhensen Ray Agni
% Email: jagni001@ucr.edu
% Github: https://jragni.github.io

%%%%% Quarter Car Suspension Model %%%

%%

% Initialize constants
Ks = 20000;  % [N/m]  spring constant of suspension
C = 1000;  % [N*s/m] coefficient of friction for dashpot
Kw = 200000;  % [N/m] spring constant for the wheel
M = 300;   % [kg] mass of quarter car
m = 40;    % [kg] mass of wheel
Zr = randi(10)*.005; % [m] bumpiness of the road

% State Matrix derived from force balance
A = [ 0 1 0 0;
    -Ks/M -C/M Ks/M C/M;
    0 0 0 1;
    Ks/m C/m -(Kw+Ks)/m -C/m]; 
% COntrolling 
B = [0 ;1000/M;0;0];
C = [1 0 0 0]; % Measuring position with observability 
D = 0;
sys = ss(A,B,C,D); % create a state-space object
openLoopEigenvalues = eig(A) %open loop eigen values, stable

step(sys)
%Solve for closed loop eigenvalues (A-BK)

% move Poles to -10
 P = [-10.7774+72.6021i -10.7774-72.6021i -5.3892+7.7077i -5.3892-7.7077i]; %  Place poles here for closed-loop control
% 
K = place(A,B,P);
% 
 A_closed = A - B*K; % closed loop state matrix
% 
eig(A_closed);
% closed loop control object 
closed_sys = ss(A_closed,B,C,D);

K_r = 1/dcgain(closed_sys);  % scaling input
%% 
closed_sys = ss(A_closed,B*K_r,C,D);
step(closed_sys)
impulse(closed_sys)

