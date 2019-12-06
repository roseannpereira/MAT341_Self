%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: runs the go_Go_Gaussian_Elimination script for a variety of N
%   values and makes two different graphs of operation counts vs size of
%   the matrix
% inputs: none
% outputs: none
% prints: 1) graph of the logarithmic function of Operation Count vs Size
%         of Matrix
%         2) graph of the non-logarithmic function of Operation count vs 
%         Size of Matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Gaussian_Elimination_Scaling()
    %initialize the given vector of a variety of N values
    NVec = 2:1:100;
    %determine the number of operations needed to get to reduced-row
    %   echelon form of the matrix for each N value
    for i = 1:length(NVec)
        OpVec(i) = go_Go_Gaussian_Elimination(NVec(i));
    end
    
    %plot the logarithmic function of Operation Count vs Size of Matrix
    figure(1)
    loglog(NVec, OpVec, 'b', 'LineWidth', 5);
    xlabel('Size of the Matrix, N');
    ylabel('Operation Count');
    
    %plot the non-logarithmic function of Operation Count vs Size of Matrix
    figure(2)
    plot(NVec, OpVec, 'b', 'LineWidth', 5);
    xlabel('Size of the Matrix, N');
    ylabel('Operation Count');