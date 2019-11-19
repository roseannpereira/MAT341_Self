%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: uses the gradient descent algorithm for varying step-sizes and
%           plots the number of iterations vs step-size it takes to reach
%           the minimum using that step-size
% inputs: none
% outputs: none
% prints: a graph of number of iterations vs step-size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_StepSize_Gamma_To_Optimize()
    %initialize a gamma vector to parse over
    gammaVec = [0.01:0.01:1.5];
    
    %create a vector of the number of iterations for different gamma values
    for i = 1:length(gammaVec)
        nVec(i) = Gradient_Descent_1(1e-10, gammaVec(i));
    end
    
    %plot the gamma (step-size) vs the number of iterations, N
    semilogx(gammaVec, nVec, 'b', 'LineWidth', 5);
    legend('Fixed Step');
    xlabel('Gamma (Step-Size)');
    ylabel('Number of Iterations, N');
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) The "best" step-size, gamma, seems to be 1 for this particular
% function.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%