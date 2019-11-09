%function: calculates the minimum of the given function 0.5 - xe^-x^2 for
%   a given vector of varying tolerance values using the golden search
%   algorithm, the successive parabolic interpolation algorithm, and 
%   Newton's Method, then compares the number of iterations required for 
%   each method for these tolerance values using two different graphs
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
        newtonsIt(i) = Newtons_1D_Opt(errTolVec(i));
    end
    
    %plot data for both algorithms on a semilogx graph with axis labels and a legend
    figure(1)
    semilogx(errTolVec, goldenIt, 'b', 'LineWidth', 5)
    hold on
    semilogx(errTolVec, parabolicIt, 'r', 'LineWidth', 5)
    hold on
    semilogx(errTolVec, newtonsIt, 'k', 'LineWidth', 5)
    hold off
    xlabel('Specific Error Tolerances, tol')
    ylabel('Number of Iterations, N')
    legend('Golden Search', 'Successive Parabolic Interpolation', 'Newton Method')
    
    %plot data for both algorithms on a semilogx graph with axis labels and a legend
    figure(2)
    loglog(errTolVec, goldenIt, 'b', 'LineWidth', 5)
    hold on
    loglog(errTolVec, parabolicIt, 'r', 'LineWidth', 5)
    hold on
    loglog(errTolVec, newtonsIt, 'k', 'LineWidth', 5)
    hold off
    xlabel('Specific Error Tolerances, tol')
    ylabel('Number of Iterations, N')
    legend('Golden Search', 'Successive Parabolic Interpolation', 'Newton Method')
    
%(a) The Newton's Method algorithm appears to converge faster to the
%       minimum for less accurate tolerances, overall.
%(b) When the accuracy threshold increases, the Newton's method algorithm 
%       does always converge quicker.
%(c) The convergence rates for these algorithms can be changed based on
%       their initial guesses for the minima points, where for instance
%       changing the initial x guess for the Newton's Method algorithm from
%       0.25 to 1.5 change the number of iterations from 6 to 736 at 1e-8
%       accuracy, or where changing the x3 guess for the successive
%       parabolic interpolation algorithm increases the number of
%       iterations.