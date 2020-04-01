function Weight_Estimate = WeightFunc(x_def,a,b,k)
    %WEIGHTFUNC Outputs weight given the user input x,a,b,k deflection input 
    % given a spring mass system in which there are two springs suspending
    % a mass, the user will input the deflection(x_def) the horizonal
    % distance of the spring (a) and the vertical distance(b) and the
    % output will be the estimate of the weight. 
    L_0 = sqrt(a^2 + b^2);
    L = sqrt(a^2 + (b+x_def)^2);
    Weight_Estimate = 2*k/L *(L-L_0)*(b+x_def);

end

