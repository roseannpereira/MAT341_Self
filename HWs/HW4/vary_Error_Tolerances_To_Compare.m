%function: calculates the minimum of the given function 0.5 - xe^-x^2 for
%   a given vector of varying tolerance values using both the golden search
%   algorithm and the successive parabolic interpolation algorithms, then
%   compares the number of iterations required for each method for these
%   tolerance values using two different graphs
%input: none
%output: none
%prints: 1) loglog of N vs tol
%        2) semilogx plot of N vs tol

function vary_Error_Tolerances_To_Compare()
    %initialize the given vector of error tolerances
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
    %create vectors of the number of iterations from each method for each
    %   error tolerance value
    for i = 1:1:12
        goldenIt(i) = golden_Search(errTolVec(i));
        parabolicIt(i) = successive_Parabolic_Interpolation(errTolVec(i));
    end
    
    %plot data for both algorithms on a semilogx graph with axis labels and a legend
    figure(1)
    semilogx(errTolVec, goldenIt, 'b', 'LineWidth', 5)
    hold on
    semilogx(errTolVec, parabolicIt, 'r', 'LineWidth', 5)
    hold off
    xlabel('Specific Error Tolerances, tol')
    ylabel('Number of Iterations, N')
    legend('Golden Search', 'Successive Parabolic Interpolation')
    
    %plot data for both algorithms on a semilogx graph with axis labels and a legend
    figure(2)
    loglog(errTolVec, goldenIt, 'b', 'LineWidth', 5)
    hold on
    loglog(errTolVec, parabolicIt, 'r', 'LineWidth', 5)
    hold off
    xlabel('Specific Error Tolerances, tol')
    ylabel('Number of Iterations, N')
    legend('Golden Search', 'Successive Parabolic Interpolation')
    
    %(a) For less accurate tolerances, the successive parabolic interpolation 
    %       algorithm appears to converge faster to the minimum.
    %(b) When you increase the accuracy threshold, the number of iterations
    %       increases for both algorithms. The successive parabolic 
    %       interpolation algorithm does not always converge quicker. I 
    %       think that the successive parabolic interpolation algorithm changes
    %       its convergence speed because as the tolerance levels decrease,
    %       the ability to accurately invert the matrix decreases as the
    %       coefficients become more and more close to one another between
    %       the equations of the linear system. This is an issue that the
    %       golden search algorithm doesn't have, so it is consistent in
    %       it's speed in finding the minimum.