%Roseann Pereira
%Function: tests the run time of calculate_Nested_For_Loop_Time with a
%   variety of N values and plots the data
%Prints: a graph of Times vs N values
%Inputs: none
%Returns: none

function plot_Nested_Times()
    %initialize the given N vector of N values
    N = [1:1:10 20:10:100 125 150 175 200 225 250];
    
    %calculate and save the time it takes to run for the different N values
    %   into the vector T
    for i = 1:length(N)
        T(i) = calculate_Nested_For_Loop_Time(i);
    end
    
    %plot the data of times vs N values with labels
    loglog(N, T,'m', 'LineWidth', 5)
    xlabel('N')
    ylabel('Times')
    