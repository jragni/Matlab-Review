% Agni, Jhensen Ray
% 03/30/2020
% Develop a well-documented MATLAB program that uses the bisection root
% finding method to calculate the deflection x when the user inputs a value
% for the weight W and an initial bracket estimate (xl and xu). The system 
% parameters (a, b, and k) should be assigned to variables so that they may
% be easily changed in future applications.
clc 
clear all
% W = 2*k/L * (L-L_0)(b+x)
% L = sqrt(a^2 + (b+x)^2)
% L_0 = sqrt(a^2 + b^2)

%% Instantiate variables
a = 8;  % [in]
b = 6;  % [in]
k = 16;  % [lb/in]
error = 1;  % initial error 
err_max = 0.005;
n = 0;  % iteration counter for loop
nmax = 100;  % maximum iteration to prevent infinite looping
%% Get user inputs
W = input('Please input the Weight of the mass: ');  % [lbs] Weight 
xl = input('Please input lower deflection guess: ');  % [in] lower bracket
xu = input('Please input upper deflection guess: ');  % [in] upper bracket

%%
while (n < nmax) || (abs(error)<err_max)
    % 1. Get midpoint
    x_mid =( xu + xl )/2; 

    % 2. get W = f(xu)
    W_upper = WeightFunc(xu,a,b,k)

    % 3. get W = f(xl)
    W_lower = WeightFunc(xl,a,b,k)

    % 4. get W = f(x_mid)
    W_mid = WeightFunc(x_mid,a,b,k)

    if W_mid > W
        xu = x_mid;
       
    elseif W_mid < W
        xl = x_mid;
    end
    error = (W - W_mid)/W
    n = n + 1 
    if abs(error)<= err_max || n >= nmax
        break;
    end
end
fprintf('Solution is %.3f inches, solved in %.f iterations, with %.2f error',x_mid,n,error);