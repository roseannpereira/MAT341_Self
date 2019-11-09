%function: finds the minimum of the given function 0.5 - xe^-x^2 using 
%   successive parabolic interpolation and calculates the number of loop 
%   iterations needed to find it
%input: tol, the error tolerance desired
%output: N, the number of iterations taken to find the minimum

function N = successive_Parabolic_Interpolation(tol)
    %choosing 3 x values in [0, 2]
    x1 = 0;
    x2 = 0.6;
    x3 = 0.9;
    %initialize error
    err = 1;
    %initialize a counter for the number of loop iterations
    countIt = 0;
    %while the error is greater than the tolerance
    while err > tol
        %creating a linear system to solve for the coefficients of the
        %   parabola going through all 3 points
        A = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1];
        coeffs = inv(A) * [f(x1); f(x2); f(x3)];
        %initialize the parabolic coefficients to a, b, and c
        a = coeffs(1);
        b = coeffs(2);
        c = coeffs(3);
        %find the vertex of the parabola, where there should be a minimum
        %   when it's concave up
        vertex = -b/(2 * a);
        %redefine the points to continually adjust the vertex of the found
        %   parabola to match the minimum of the function within the error
        %   tolerance
        x3 = x2;
        x2 = x1;
        x1 = vertex;
        %recalculate the current error with the new points
        err = abs(x3 - x1);
        %increase the counter for the number of loop iterations
        countIt = countIt + 1;
    end
    %set the minimum to the vertex of the parabola
    min = x1;
    %set N to be the number of times the loop ran
    N = countIt;
    
function val  = f(x)
    %calculate the function at a specific x value
    val = 0.5 - x * exp(-x^2);

%(a) It takes 32 iterations to achieve 1e-8 accuracy within the initial
%       guesses described above.
%(b) When the initial x3 value is changed to 2, the number of iterations
%       becomes increases. MATLAB issues a warning saying that the "matrix
%       is close to singular or badly scaled, so results may be
%       inaccurate." This intuitively means that the linear system for
%       finding the parabola coefficients is reaching almost parallel
%       equations, where the coefficients become very very close which 
%       affects the ability to accurately invert the matrix because it's so
%       close to being singular.