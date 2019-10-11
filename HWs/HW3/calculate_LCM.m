%function: calculates the least common multiple of two inputed integers
%inputs: 1. x, an integer
%        2. y, an integer
%output: lcm_val, the least common multiple of x and y

function lcm_val = calculate_LCM(x, y)
    %check to ensure both inputs are integers
    if (mod(x, 1) == 0) && (mod(y, 1) == 0)
        %initialize the multiples's of both x and y
        mult_x = x;
        mult_y = y;
        %initialize a counter for what x and y multiples you are on,
        %   starting at 2 because the current multiple is times 1 and it will
        %   increment after calculating the next multiple in the if-else
        %   statement
        count_x_mult = 2;
        count_y_mult = 2;
        %check that the lcm's are not equal
        while mult_x ~= mult_y
            %if the x multiple is greater than the y multiple, since they
            %   are not equal, calculate the next y multiple, increment the
            %   counter, and check again
            if mult_x > mult_y
                mult_y = y * count_y_mult;
                count_y_mult = count_y_mult + 1;
            else
            %otherwise, the x multiple is less than the y multiple, so
            %   since they are not equal, calculate the next x multiple,
            %   increment the counter, and check again
                mult_x = x * count_x_mult;
                count_x_mult = count_x_mult + 1;
            end
        end
        %when the multiples are equal, it is the LCM of x and y, so set
        %   that value to be output
        lcm_val = mult_x;
    end