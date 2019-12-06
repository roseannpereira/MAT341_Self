%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: finds the coefficients that minimize the l^2 norm of the 
%   residual for the given polynomial model function by performing a 
%   linear least squares to find a best fit function through the data
% inputs: none
% outputs: none
% prints: 1) the l^2 norm of the residuals of the function
%         2) a plot of the data points and the model function through the
%         points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fit_Polynomial_Series()
    N = 50;
    xData = linspace(-2*pi, 2*pi, N);
    yData = cos(xData)';
    
    %initialize the data matrix 
    data_M = zeros(N, 2);
    
    %put x-Data and y-Data into 1st and 2nd columns of the data matrix, 
    %   respectively
    data_M(:,1) = xData;
    data_M(:,2) = yData;
    
    %initialize n, the number of terms in the polynomial
    n = 12;
    
    %set the A matrix and the y vector
    for i = 1:length(data_M)
        for j = 0:(n-1)
            A(i,j+1) = data_M(i, 1)^j;
        end
        y(i,:) = data_M(i, 2);
    end
    
    %calculate beta using the matrix A and the y vector
    beta = inv(A.' * A) * A.' * y;
    
    %calculate the vector of y-values depending on the order of the
    %   polynomial 
    for i = 1:length(data_M(:,1))
        sum = 0;
        for j = 1:n
            sum = beta(j) * data_M(i, 1).^(j - 1) + sum;
        end
        yVals(i) = sum;
    end
        
    %calculate the l^2 norm of the residual and print it out
    l2norm = sqrt((data_M(:,2) - A*beta).' * (data_M(:,2) - A*beta))
    
    %plot the data points and the line of best fit for the data
    plot(data_M(:,1), data_M(:,2), 'b', 'LineWidth', 6);
    hold on 
    plot(data_M(:, 1), yVals, 'r', 'LineWidth', 4);
    hold off
    legend('Data','Best Poly Fit');
    xlabel('X');
    ylabel('Y');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) Increasing N, the number of data points, increases the l^2 norm of 
% the residuals when N <= 11 and when N > 12. When N = 10, the l^2 norm 
% of the residuals is 0.2343. When N = 50, the l^2 norm of the residuals is 0.0088. When 
% N = 250, the l^2 norm of the residuals is 0.0186.
% (b) I have seen cos(x) written as a polynomial before in it's taylor
% series polynomial, where the coefficients were (-1)^n/(2n)!
% (c) When N = 250, the vector of coefficients beta is as follows:
%  0.998592101817946
%  0.000000000008956
% -0.497178329103882
% -0.000000000004736
%  0.040752516210377
%  0.000000000000698
% -0.001279849085103
% -0.000000000000042
%  0.000018785542669
%  0.000000000000001
% -0.000000112341413
% -0.000000000000000
% (d) The coeffients we found appear to match the coefficients of the
% taylor series expansion of cosine with some minor variation due to
% innaccuracy in best fit and they alternate with approximately zero since
% the taylor series expansion never has an x^3, x^5, etc. term, but our
% polynomial model does.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%