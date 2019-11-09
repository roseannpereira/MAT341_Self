%function: calculates the minimum of the given function -(sin(x) + cos(y))
%   using the Nelder-Mead algorithm and counts the number of loop
%   iterations required to find it
%input: tol, the desired tolerance level
%output: N, the number of loop iterations required

function N = Nelder_Mead(tol)
    %setting three points as vectors and calculating their value in the
    %   functions
    xvec(1,:) = [0.35 2.8];
    fvec(1) = f(xvec(1,:));
    xvec(2,:) = [-0.25 0.3];
    fvec(2) = f(xvec(2,:));
    xvec(3,:) = [1.5 0.5];
    fvec(3) = f(xvec(3,:));
    %initializing the error
    err = 1;
    %initialize the iteration counter
    N = 0;
    while err > tol
        %sorting the function values so that f(x1) <= f(x2) <= f(x3)
        [f_Sorted, indsvec] = sort(fvec);
        %reordering the x vector so that they are in order of their
        %   function values and which is the best point
        xvec_Save = xvec;
        xvec(1,:) = xvec_Save(indsvec(1),:);
        xvec(2,:) = xvec_Save(indsvec(2),:);
        xvec(3,:) = xvec_Save(indsvec(3),:);
        %calculating the midpoint vector between x1 and x2
        xM = (1/2) * (xvec(1,:) + xvec(2,:));
        %calculating the reach vector from x3 to the midpoint
        xR = 2 * xM - xvec(3,:);
        %check if xR is a better point and if so, reset x3 to xR
        if f(xR) < f(xvec(3,:))
            xvec(3,:) = xR;
        %if xR is not a better point, check if the center of the triangle
        %   is a better point than x3 and if so reset x3 to the xC
        elseif f(xR) >= f(xvec(3,:))
            xC = (1/2) * (xM + xvec(3,:));
            if f(xC) < f(xvec(3,:))
                xvec(3,:) = xC;
            %if none of these points are better then shrink the triangle in
            %   the direction of x1, the best point
            else
                xvec(2,:) = (1/2) * (xvec(1,:) + xvec(2,:));
                xvec(3,:) = (1/2) * (xvec(1,:) + xvec(3,:));
            end
        end
        %recalculate the function values using the new vector points
        for i = 1:1:3
            fvec(i) = f(xvec(i,:));
        end
        %recalculate the error in the minimum and increase the loop
        %   iteration counter
        err = abs(fvec(1) - fvec(3));
        N = N + 1;
    end
    %print the minimum value of the function
    min = xvec(1,:)

    %calculate the function value at a certain point
    function val = f(x)
        val = -(sin(x(1)) + cos(x(2)));
        
%(a) Using the initial points above its takes 29 iterations to achieve 1e-8
%       accuracy.
%(b) For the initial points above, it appears to converge to (pi/2, 0). The
%       point (x, y) where the minima is located where sin(x) = 1 and
%       cos(y) = 1. It does look like 1e-8 accuracy because 1.5715 is about
%       pi/2 and 0.0008 is about 0.
%(c) When the second initial point is changed, it takes 58 iterations to
%       achieve 1e-8 accuracy, which locates the minima at (pi/2, 0).
%       Even though this change puts this point closer to the local minimia
%       found in part a, I think this takes more iterations compared to part a
%       because the best guesses x1 and x2 (after reordering) are so much closer
%       together than before, so when choosing the better point for x3,
%       there is probably a lot of flip-flopping in terms of which point is
%       the best point since they all end up so close together and close to
%       the minima, so this would take more iterations.
%(d) Changing the second and third initial points finds the minima at
%       (-3*pi/2, 0).