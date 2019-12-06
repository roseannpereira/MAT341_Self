%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: finds the coefficients that minimize the l^2 norm of the 
%   residual for the given exponential model function by performing a 
%   nonlinear least squares to find a best fit function through the data
% inputs: none
% outputs: none
% prints: 1) the l^2 norm of the residuals of the function
%         2) a plot of the data points and the model function through the
%         points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function perform_NonLinear_Least_Squares()
    %initialize N, the number of data points
    N = 2500;
    %put the data in a matrix
    data_M = give_NonLinear_Least_Squares_Data(N);
    
    %calculating the beta vector for the given data using the nonlinear
    %   least squares method
    beta = NonLinear_Least_Squares(data_M, N);
    
    %calculate the y-values of the model function using the found beta
    for i = 1:length(data_M(:,1))
        y(i,1) = beta(1) * exp((-(data_M(i, 1) - beta(2))^2)/(2*beta(3)^2));
    end
    
    %calculate the l^2 norm of the residuals
    l2norm = sqrt(transpose(data_M(:, 2) - y) * (data_M(:, 2) - y))
    
    %plot the data points (as done in the given code for receiving data
    %   and the line of best fit for the data
    plot(data_M(:,1), data_M(:,2), 'b.', 'MarkerSize', 20);
    hold on;
    plot(data_M(:, 1), y, 'r', 'LineWidth', 6);
    hold off;
    legend('Data', 'Model Fit');
    xlabel('X');
    ylabel('Y');

function beta = NonLinear_Least_Squares(data_M, N)
    %initialize a beta, an error tolerance, and an error value
    beta = [1 0.5 0.3]';
    tol = 1e-5;
    err = 1;
    
    %while the error is greater than the error tolerance...
    while err > tol
        %count by the number of x data points
        for j = 1:N
            %input each x data point into the value x
            x = data_M(j, 1);
            %calculate a constant value used in the partial derivatives for this
            %   specific x value
            Expy = exp((-(x - beta(2))^2)/(2*beta(3)^2));
            %manually calculate the partial derivatives for this specific x
            %   value and enter them into the jacobian
            J(j, 1) = Expy;
            J(j, 2) = beta(1) * ((x - beta(2))/beta(3)^2) * Expy;
            J(j, 3) = beta(1) * ((-(x - beta(2))^2)/2) * (-2/beta(3)^3) * Expy;
        end
        
        %calculate the residuals for every y value and input them into a
        %   matrix
        for i = 1:N
            y(i, 1) = data_M(i, 2) - f(data_M(i, 1), beta);
        end
        %use the vector of residuals and the jacobian to find a psuedo
        %   inverse to calculate the change in beta
        delta_betak = inv(J.' * J) * J.' * y; 
        %set a new beta to be the old beta plus the change in the beta
        beta_k1 = beta + delta_betak;
        %calculate the l^2 norm of the difference between the old beta and
        %   the new beta as the error
        err = sqrt((beta_k1 - beta).' * (beta_k1 - beta));
        %reset the beta to the newest value
        beta = beta_k1;
    end
    
%calculate the values of the model function at x-values    
function val = f(x, beta)
    val = beta(1) * exp((-(x - beta(2))^2)/(2*beta(3)^2));