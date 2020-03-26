% Author: Jhensen Ray Agni
% Email: jagni001@ucr.edu
% Github: https://jragni.github.io

%%%%% Quarter Car Suspension Model %%%

%%

% Initialize constants
Ks = 20000;  % [N/m]  spring constant of suspension
c = 1000;  % [N*s/m] coefficient of friction for dashpot
Kw = 200000;  % [N/m] spring constant for the wheel
M = 300;   % [kg] mass of quarter car
m = 40;    % [kg] mass of wheel
Zr = randi(10)*.005; % [m] bumpiness of the road

% State Matrix derived from force balance
A = [ 0 1 0 0; -(Ks/M) -(c/M) (Ks/M) (c/M);0 0 0 1; (Ks/m) (c/m) -((Kw+Ks)/m) -(c/m)]; 
% COntrolling 
B = [0 ;1000/M;0;1000/m];
C = [1 0 0 0]; % Observability 
D = 0;
sys = ss(A,B,C,D); % create a state-space object
openLoopEigenvalues = eig(A) %open loop eigen values, stable
figure(1)
subplot(2,1,1)
step(sys)
subplot(2,1,2)
impulse(sys)
%Solve for closed loop eigenvalues (A-BK)

%Use Linear Quadratic Regulator to optimize SS
 Q = [ 100 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];  %weight of the 
R = .9
K = lqr(A,B,Q,R);

% 
 A_closed = A - B*K; % closed loop state matrix
% 
eig(A_closed);
% closed loop control object 
closed_sys = ss(A_closed,B,C,D);

K_r = 1/dcgain(closed_sys);  % scaling input
%% 
closed_sys = ss(A_closed,B*K_r,C,D);
figure(2)
subplot(2,1,1)
step(closed_sys)
subplot(2,1,2)
impulse(closed_sys)

