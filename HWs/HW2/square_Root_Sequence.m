%Roseann Pereira
%Function: computes the Nth term of the sequence to determine the limit of
%   tN as N goes to infinity
%Inputs: 1. m, the value to test in the sequence
%        2. n, the index on the value of the sequence, the nth term
%Returns: the value of the sequence, which is the limit of tN as n goes to
%   infinity

function val = square_Root_Sequence(m, n)
    %calculate t1 in the square root sequence
    tN = sqrt(m);
    %calculate the sequence for tN, starting at n-1 since t1 was calculated
    %   already
    for i = (n-1):-1:1
        %if the index of the sequence is even, switch the sign
        if (mod(i, 2) ~= 0)
            tN = tN * -1;
        end
        %add the additional square root to this sequence term
        tN = sqrt(m + tN);
    end
    val = tN;
    
%the limit for m = 13 appears to be 3
%the limit for m = 31 appears to be 5
%the limit for m = 43 appears to be 6