%function: estimates the probability of tossing a coin of radius r fully
%   into a [0, 1] x [0, 1] square
%inputs: 1. r, the radius of the coin
%        2. N, the number of coin toss trials
%outputs: prob, the probability of tossing the coin fully into the square

%N = 1e5 does seem like a reasonable amount of trials because it's a large
%   enough number that the probability starts to close in around 0.64 when
%   testing so many times.
%This is more difficult than the case we did in class because the coin has
%   area rather than being a single point, so you have to account for the
%   location of the area taken up by the circle, not just the location of a
%   point

function prob = estimate_Coin_In_Square_Probability(r, N)
    %initialize a counter to count how many times the coin is inside
    countIn = 0;
    %throw the dart N times
    for i = 1:N
        %if the coin made it fully in the square, increase the counter
        if coin_Toss(r) == 1
            countIn = countIn + 1;
        end
    end
    prob = countIn/N;

function val = coin_Toss(r)
    %randomly generate the location of the center of the coin
    centerX = rand();
    centerY = rand();
    %initialize tester to see if the coin is fully contained
    contain_Full = 0;
    %note that the equation for a circle centered at (centerX, centerY) is
    %   (x - centerX)^2 + (y - centerY)^2 = r^2
    %hence, centerX + r < 1, centerX - r > 0, centerY + r < 1, and 
    %   centerY - r > 0 checks the 'farthest' points in any direction, aka
    %   the ones that could be closest to the square boundaries of x = 0, 1
    %   and y = 0, 1
    %if the coin is within these boundaries, say it is fully contained
    if centerX + r < 1 && centerX - r > 0 && centerY + r < 1 && centerY - r > 0
        contain_Full = 1;
    end
    val = contain_Full;
    