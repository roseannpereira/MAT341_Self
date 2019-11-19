%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: uses the gradient descent algorithm for a fixed step-size and 
%           and the Barzilai-Borwein step-size for varying error tolerances
%           and plots the number of iterations vs error tolerance it takes 
%           to reach the minimum for that tolerance level for each
%           algorithm
% inputs: none
% outputs: none
% prints: two graphs of number of iterations vs error tolerance for each
%         algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_Compare()
    %initialize the vector of different error tolerances
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];
    
    %create a vector of the number of iterations for different error
    %   tolerances for each algorithm
    for i = 1:length(errTolVec)
        nVecFixed(i) = Gradient_Descent_1(errTolVec(i), 1);
        nVecBB(i) = Gradient_Descent_2(errTolVec(i));
    end
    
    %plot the number of iterations vs error tolerances for semilogx
    figure(1)
    semilogx(errTolVec, nVecFixed, 'b', 'LineWidth', 5);
    hold on
    semilogx(errTolVec, nVecBB, 'r', 'LineWidth', 5);
    hold off
    xlabel('Error Tolerance, tol');
    ylabel('Number of Iterations, N');
    legend('Fixed Step', 'Barzilai-Borwein');
    
    %plot the number of iterations vs error tolerances for loglog
    figure(2)
    loglog(errTolVec, nVecFixed, 'b', 'LineWidth', 5);
    hold on
    loglog(errTolVec, nVecBB, 'r', 'LineWidth', 5);
    hold off
    xlabel('Error Tolerance, tol');
    ylabel('Number of Iterations, N');
    legend('Fixed Step', 'Barzilai-Borwein');
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) The fixed step-size algorithm appears to converge faster to the
%       minimum.
% (b) If you change the fixed step-size to gamma = 0.5 the Barzilai_Borwein
%       algorithm converges quicker to the minimum.
% (c) The advantage of using the Barzilai-Borwein step-size is that it
%       consistently converges quickly for any function because it changes
%       with every iteration and does not depend on the function being
%       optimized.
% (d) If I were to modify the code to minimize a different function, I
%       would choose the Barzilai-Borwein step-size method because it
%       doesn't depend on the function being optimized, I wouldn't need to
%       find which step-size is best for the specific function.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%