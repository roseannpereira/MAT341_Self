%function: when a circle of radius of 2 is centered at the origin and three
%   points are randomly chosen along the circle, this estimates the
%   probability that the triangle created by these points contains the center
%   of the circle (0, 0)
%input: N, the number of trials
%outputs: prob, the probability that the triangle created by the points contains
%   the center of the circle

function prob = estimate_Triangle_Center_Circle_Probability(N)
    %initialize a counter for the number of times the center of the circle
    %   is within the triangle
    countIncluded = 0;
    %draw a triangle N times
    for i = 1:N
        %if the center is included in the triangle, increase the counter
        if pick_Triangle() == 1
            countIncluded = countIncluded + 1;
        end
    end
    %calculate the probability of the number of times the center is
    %   included in the triangle for N trials
    prob = countIncluded/N;

function val = pick_Triangle()
    %randomly choose the 3 different angles for polar coordinates
    angleO1 = (2 * pi) * rand();
    angleO2 = (2 * pi) * rand();
    angleO3 = (2 * pi) * rand();
    %initialize tester to see if the center of the circle is within the
    %   triangle
    centIncluded = 0;
    %if angleO1 is not the smallest angle and if angleO3 is not the largest
    %   angle, continually swap the angles to reorder them as necessary
    while (angleO1 > angleO2) || (angleO3 < angleO2)
        %swap angleO1 and angleO2 so angleO1 is the smallest
        if angleO1 > angleO2
            tempAngle1 = angleO1;
            angleO1 = angleO2;
            angleO2 = tempAngle1;
        end
        %swap angleO2 and angleO3 so angleO3 is the largest
        if angleO3 < angleO2
            tempAngle2 = angleO2;
            angleO2 = angleO3;
            angleO3 = tempAngle2;
        end
    end
    %check to see that from whatever the smallest angle is that the region 
    %   from that point to (pi + that point) contains exactly one of the 
    %   other two points, hence the center is included
    if (angleO2 <= angleO1 + pi) && (angleO3 >= angleO1 + pi)
        centIncluded = 1;
    end
    
    val = centIncluded;