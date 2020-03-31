function Weight_Estimate = WeightFunc(x_def,a,b,k)
    %WEIGHTFUNC Outputs weight given the x deflection input
    % Detailed explanation goes here
    L_0 = sqrt(a^2 + b^2);
    L = sqrt(a^2 + (b+x_def)^2);
    Weight_Estimate = 2*k/L *(L-L_0)*(b+x_def);

end

