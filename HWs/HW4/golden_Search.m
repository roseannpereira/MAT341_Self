%function: calculates the minimum of the function f(x) = 0.5 - xe^x^2 
%   using the golden search algorithm and counts the number of loop 
%   iterations to needed to find the minimum
%input: tol, the error tolerance desired for the minimum
%output: N, the number of loop iterations to find the minimum

function N = golden_Search(tol)
    %initialize the interval [0, 2] that the minimum will be searched for
    %   within
    a = 0;
    b = 2;
    %initialize the given golden ratio search step
    t = (sqrt(5) - 1)/2;
    %calculate two evenly spaced x values within [a, b] using the search step
    x1 = a + (1 - t)*(b - a);
    x2 = a + t*(b - a);
    %calculate the function values of these x values
    f1 = f(x1);
    f2 = f(x2);
    %initialize a counter for the number of loop iterations
    countIt = 0;
    %if the error is greater than the tolerance...
    while (b - a) > tol
        %if the function value of x1 is greater than that of x2 when x1 <
        %   x2, then the minimum can not be between a and x1, so set x1 as
        %   the new left interval bound
        if f1 > f2
            a = x1;
        %if this is not the case, then the function value of x2 will be
        %   greater than that of x1 when x1 < x2, so the minimum cannot be
        %   between x2 and b, so set x2 as the new right interval bound
        else
            b = x2;
        end
        %calculate the next x values within the new interval [a, b]
        x1 = a + (1 - t)*(b - a);
        x2 = a + t*(b - a);
        %calculate the function values of the next x values
        f1 = f(x1);
        f2 = f(x2);
        %increase the loop iteration counter
        countIt = countIt + 1;
    end
    %set the minimum of the function to be at the midway point of a and b
    min = (b - a)/2;
    %set N to be the number of times the loop ran
    N = countIt;
    
%evaluate the function f(x) for a specific x value
function val = f(x)
    val = 0.5 - x * exp(-x^2);
    
%(a) It takes 40 iterations to achieve 1e-8 accuracy