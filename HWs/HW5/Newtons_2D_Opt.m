%function: calculates the minimum of the given function -(sin(x) + cos(y))
%   using two-dimensional Newton's method and counts the numbebr of loop
%   iterations required to do so
%input: tol, the desired tolerance level
%output: N, the number of loop iterations required

function N = Newtons_2D_Opt(tol)
    %initialize a guess for x_n
    x_n = [-4.5; 4.5];
    %initialize the iteration counter and error
    err = 1;
    N = 0;
    %while error is greater than the tolerance...
    while err > tol
        %calculate a better guess for x, x_n+1 based on the gradient and
        %   inverse of the hessian matrix of f(x)
        x_n1 = x_n - inv(hessianf(x_n)) * gradientf(x_n);
        %recalculate the error for the new values of x_n and x_n+1
        err = sqrt((x_n1 - x_n).' * (x_n1 - x_n));
        %set a new x_n to the better guess and increase the counter
        x_n = x_n1;
        N = N + 1;
    end
    %the minimum is then the best guess for x_n
    min = x_n

function val = f(x)
    %calculate the value of the function at x
    val = -(sin(x(1)) + cos(x(2)));
    
function val = gradientf(x)
    %calculate the value of the gradient of the function at x
    val = [-cos(x(1)); sin(x(2))];

function val = hessianf(x)
    %calculate the value of the hessian matrix of the function at x
    val = [sin(x(1)) 0; 0 cos(x(2))];
    
%(a) With the initial guess above and an error tolerance of 1e-8, it takes
%       5 iterations to find a minima. It finds the minima at (-3*pi/2, 0).
%(b) When the initial guess is changed, it finds the same minima at
%       (-3*pi/2, 0) in 4 iterations.