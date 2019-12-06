%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: calculates the reduced row echelon form of an NxN matrix and
% counts the number of operations needed to get it into this form
% input: N, the size of the matrix
% output: OpCount, the number of operations needed to row reduce
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function OpCount = go_Go_Gaussian_Elimination(N)
    %define an NxN matrix
    A = rand(N, N);
    OpCount = 0;
%%%%%row reduction to echelon form%%%%%
    %start a row counter at 2, choosing the rows you want to introduce
    %   zeros into
    rowCount = 2;
    %start a column counter at 1, where the appropriate amount of zeros
    %   will be introduced into each of these columns
    colCount = 1;
    %scale the first row so that the first entry in that row becomes one
    for r = 1:N
        A(1,r) = A(1,r)/A(1,1);
        %increase the operation counter by one each time an item in the row
        %   is scaled
        OpCount = OpCount + 1;
    end
    %picking the column k you want to put zeros in 
    for k = colCount:N-1
        %picking the row i you want to put zeros in for that column k
        for i = rowCount:N
            %save the value in the ith row and kth column to use as a
            %   scalar
            scaleA = A(i,k);
            %count through the columns again in the current row i
            for j = colCount:N
                %for each column j replace the value in row i with its
                %   current value minus the row above it scaled
                A(i,j) = A(i,j) - scaleA * A((rowCount - 1), j);
                %increase the operation counter by two each time an item in
                %   the row above is scaled and then that scaled value is
                %   subtracted from the current row 
                OpCount = OpCount + 2;
            end
        end
        %save the value in the next column over of the last row that was
        %   used as a scalar
        scaleB = A(rowCount, k + 1);
        %scale the most recently used row so that the pivot in that row
        %   becomes one
        for l = 1:N
            A(rowCount, l) = A(rowCount, l)/scaleB;
            %increase the operation counter by one each time an item in the
            %   row is scaled
            OpCount = OpCount + 1;
        end
        %increment the row and column counters
        rowCount = rowCount + 1;
        colCount = colCount + 1;
    end
%%%%%row reduction into reduced row echelon form%%%%%
    %go back to the second to last row in the matrix with the counter
    rowCount = rowCount - 2;
    %count back down the columns up until the second column
    for k = N:-1:2
        %count back down the rows
        for  i = rowCount:-1:1
            %save the value in the current row and column to be used as a
            %   scalar
            scaleC = A(i, k);
            %for each column k replace the value in row i with its
            %   current value minus the row below it scaled
            A(i, k) = A(i, k) - scaleC * A((rowCount + 1), k);
            %increase the operation counter by two each time an item in
            %   the row above is scaled and then that scaled value is
            %   subtracted from the current row 
            OpCount = OpCount + 2;
        end
        %decrease the row counter
        rowCount = rowCount - 1;
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) As the size of the matrix increases, the number of operations
% requires to compute its corresponding reduced row echelon form scales
% with N via a cubic relationship because the y values appear to be equal
% to the x values cubed, where for example when x = 5, y = 125. This is
% because as N increases, the number of operations needed generally
% increases nearly exponentially as each addition of a row and column
% creates 2N+1 more places in the matrix for multiple operations to
% potentially occur in.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%