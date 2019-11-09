%function: calculates the minimum of the given function 0.5 - x*e^-x^2
%   within the interval [0, 2] using Newton's method and counts the number of
%   loop iterations required to do so
%inputs: tol, the desired tolerance level
%output: N, the number of loop iterations required

function N = Newtons_1D_Opt(tol)
    %initialize a guess for x_n
    x_n = 0.25;
    %initialize the iteration counter and error
    err = 1;
    N = 0;
    %while error is greater than the tolerance...
    while err > tol
        %calculate a better guess for x, x_n+1 based on the point slope
        %   equation and the line drawn through the x-axis
        x_n1 = x_n - fder1(x_n)/fder2(x_n);
        %recalculate the error for the new values of x_n and x_n+1
        err = abs(x_n1 - x_n);
        %set a new x_n to the better guess
        x_n = x_n1;
        N = N + 1;
    end
    %the minimum is then the best guess for x_n
    min = x_n;
    
function val = f(x)
    %calculate the value of the function at x
    val = 0.5 - x * exp(-x^2);
        
function val = fder1(x)
    %calculate the value of the first derivative of the function at x
    val = (2 * x^2 - 1) * exp(-x^2);
        
function val = fder2(x)
    %calculate the value of the second derivative of the function at x
    val = (2 * x^3 - 3 * x) * -2 * exp(-x^2);
    
%(a) With the initial guesses described as above, it takes 6 iterations to
%       achieve 1e-8 accuracy.
%(b) Changing the initial guess caused the number of iterations to increase to 736
%       iterations.