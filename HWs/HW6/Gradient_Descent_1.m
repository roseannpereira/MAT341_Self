%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: uses the gradient and a fixed step-size to continually find
%           better guesses for the minima of -(sin(x(1)) + cos(x(2)))
%           within the given error tolerance
% inputs: tol, the desired error tolerance
%         gamma, the fixed step-size to use
% outputs: N, the number of loop iterations it takes to find the minima
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Gradient_Descent_1(tol, gamma)
    %initialize a guess for x_n
    x_n = [1.0; 1.5];
    %initialize the iteration counter and error
    err = 1;
    N = 0;
    %while error is greater than the tolerance...
    while err > tol
        %calculate a better guess for x, x_n+1 based on the gradient and
        %    step-size
        x_n1 = x_n - gamma * gradientf(x_n);
        %recalculate the error for the new values of x_n and x_n+1
        err = sqrt((x_n1 - x_n).' * (x_n1 - x_n));
        %set a new x_n to the better guess and increase the counter
        x_n = x_n1;
        N = N + 1;
    end
    %the minimum is then the best guess for x_n
    min = x_n;
    
function val = f(x)
    %calculate the value of the function at x
    val = -(sin(x(1)) + cos(x(2)));
    
function val = gradientf(x)
    %calculate the value of the gradient of the function at x
    val = [-cos(x(1)); sin(x(2))];
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) It takes 35 iterations to achieve 1e-10 accuracy using gamma = 0.5.
% (b) It takes 12 iterations to achieve 1e-10 accuracy using gamma = 0.9.
% (c) It takes 34 iterations to achieve 1e-10 accuracy using gamma = 1.5.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%