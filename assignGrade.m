function grade = assignGrade(performanceIndex)
    % Define the minimum and maximum performance index values
    minIndex = min(performanceIndex);
    maxIndex = max(performanceIndex);

    % Define the grading scale
    minGrade = 10;
    maxGrade = 8;

    % Compute the slope and intercept for linear interpolation
    slope = (maxGrade - minGrade) / (maxIndex - minIndex);
    intercept = minGrade - slope * minIndex;

    % Map performance index to grades
    grade = slope * performanceIndex + intercept;

    % Round grades to two decimal places
    grade = round(grade, 2);
end