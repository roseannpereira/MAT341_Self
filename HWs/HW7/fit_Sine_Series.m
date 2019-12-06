%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: finds the coefficients that minimize the l^2 norm of the 
%   residual for the given sine model function by performing a linear least
%   squares to find a best fit function through the data
% inputs: none
% outputs: none
% prints: 1) the l^2 norm of the residuals of the function
%         2) a plot of the data points and the model function through the
%         points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fit_Sine_Series()
    %generate the data points
    N = 500;
    xData = linspace(-pi, pi, N);
    yData = ((0.25*xData.^2).* cos(xData).^4.* sin(xData).^7)';
    
    %initialize the data matrix 
    data_M = zeros(N, 2);
    
    %put x-Data and y-Data into 1st and 2nd columns of the data matrix, 
    %   respectively
    data_M(:,1) = xData;
    data_M(:,2) = yData;
    
    %initialize M, the number of terms in the model function
    M = 5;
    
    %set the A matrix and the y vector
    for i = 1:length(data_M)
        for j = 1:M
            A(i,j) = sin(j * data_M(i, 1));
        end
        y(i,:) = data_M(i, 2);
    end
    
    %calculate beta using the matrix A and the y vector
    beta = inv(A.' * A) * A.' * y;
    
    %calculate the vector of y-values depending on number of terms to be
    %   summed
    for i = 1:length(data_M(:,1))
        sum = 0;
        for j = 1:M
            sum = beta(j) * sin(j * data_M(i, 1)) + sum;
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
    legend('Data','Best Sine Series Fit');
    xlabel('X');
    ylabel('Y');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) Using N = 500, increasing M, the number of terms in the since series,
% decreases the l^2 norm of the residual. The l^2 norm of the residual 
% when M = 5 is 0.0813. The l^2 norm of the residual when M = 10 is 0.0096.
% The l^2 norm of the residiual when M = 20 is 2.1412e-06. The l^2 norm of
% the residual when M = 40 is 3.9199e-09.
% (b) The representation of a function using only sine functions is named
% the Fourier Sine Series.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%