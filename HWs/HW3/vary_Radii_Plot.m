%function: plots the estimated probabilities of tossing a coin of radius r
%   fully into a square for varying r values
%inputs: none
%outputs: none

%r = 0.15 gives an estimated probability of 0.5, r = 0.34 gives an estimated
%   probability of 0.1, and r = 0.45 gives an estimated probability of 0.01

function vary_Radii_Plot()
    %initialize the given vector of different possible radii values
    rVec = [0.01:0.005:0.10 0.1:0.01:0.5];
    %parse through the radii vector and calculate the probability for each
    %   radii value, inputing that value into a probability vector
    for i = 1:length(rVec)
        est_Prob(i) = estimate_Coin_In_Square_Probability(rVec(i), 1e5);
    end
    %plot the estimated probability vs radius graph
    plot(rVec, est_Prob, 'r*')
    xlabel('Radius, r');
    ylabel('Estimated Probabilities');
    set(gca, 'FontSize', 14);