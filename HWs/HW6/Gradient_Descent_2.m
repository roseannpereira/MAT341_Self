%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: uses the gradient and a Borwein step-size to continually find
%           better guesses for the minima of -(sin(x(1)) + cos(x(2)))
%           within the given error tolerance
% inputs: tol, the desired error tolerance
% outputs: N, the number of loop iterations it takes to find the minima
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Gradient_Descent_2(tol)
    %initialize a guess for x_n
    x_n = [1.0; 1.5];
    %initialize the iteration counter, step-size, and error
    err = 1;
    gamma = 0.5;
    N = 0;
    %while error is greater than the tolerance...
    while err > tol
        %calculate a better guess for x, x_n+1 based on the gradient and
        %    step-size
        x_n1 = x_n - gamma * gradientf(x_n);
        %recalculate the error for the new values of x_n and x_n+1
        err = sqrt((x_n1 - x_n).' * (x_n1 - x_n));
        %calculate a new step-size using the barzlai-borwein step-size
        gamma = ((x_n1 - x_n).' * (gradientf(x_n1) - gradientf(x_n)))/((gradientf(x_n1) - gradientf(x_n)).' * (gradientf(x_n1) - gradientf(x_n)));
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
% (a) It takes 6 iterations to achieve 1e-6 accuracy using the
%       Barzilai-Borwein step-size.
% (b) It takes 7 iterations to achieve 1e-10 accuracy using the
%       Barzilai-Borwein step-size.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%