%Roseann Pereira
%Function: computes the partial sums from each of the sequences that
%          converge to pi based on the allowed error margin
%Prints: 1. each partial sum
%        2. the indexes (nA and nB) on the last partial sum when they
%           are the smallest integers such that the approximation is
%           within the error margin 
%           note: the indexes on the sums start at zero, so the number
%           of terms/sums is nA + 1 and nB + 1
%Inputs: none
%Returns: none
    
function calculate_Pi_Sums()
    %initialize the sums of each sequence to zero
    a = 0;
    b = 0;
    %initialize the indexes of each sequence to negative one, so when
    %   the while loops start, the indexes equal zero
    k = -1;
    i = -1;
    %set the error tolerance to the given value
    tol = 10^-6;
    %initialize the error values to one
    errA = 1;
    errB = 1;
    
    %execute the loop while the error value for sequence a is not within 
    %   the tolerance level
    while (errA > tol)
        %increase the index value k by one each time the loop runs
        k = k + 1;
        %add the next term to the kth partial sum, printing the new sum
        a = a + (6/sqrt(3))*((-1)^k/(3^k * (2 * k + 1)))
        %calculate the error value for sequence a with the new partial sum
        errA = abs(a - pi);
    end
    %print the index nA of the last partial sum as the smallest possible
    %   integer to get the approximation within the error margin
    nA = k
    
    %execute the loop while the error value for sequence b is not within 
    %   the tolerance level
    while (errB > tol)
        %increase the index value i  one each time the loop runs
        i = i + 1;
        %add the next term to the ith partial sum, printing the new sum
        b = b + (16 * ((-1)^i/(5^(2 * i + 1) * (2 * i + 1)))) - (4 * ((-1)^i/(239^(2 * i + 1) * (2 * i + 1))))
        %calculate the error value for sequence b with the new partial sum
        errB = abs(b - pi);
    end
    %print the index nB of the last partial sum as the smallest possible
    %   integer to get the approximation within the error margin
    nB = i
    
    %nA = 10 and nB = 3
    