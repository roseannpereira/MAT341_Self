%Roseann Pereira
%Function: calculates the run time for a given nested for loop code
%Input: an integer N
%Returns: the run time of the nested for loops

function time = calculate_Nested_For_Loop_Time(N)
    tic
    k = 0;
    for i1 = 1:N
        for i2 = 1:N
            for i3 = 1:N
                for i4 = 1:N
                    k = k + 1;
                end
            end
        end
    end
    time = toc;