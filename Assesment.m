filename = getenv('CSV_FILE');
student_name = getenv('STUDENT_NAME');

if filename == ""
    error("CSV_FILE environment variable not set.");
end

performanceIndex = importfile1(filename, [2, Inf], student_name);
grade = assignGrade(performanceIndex);

fprintf('Student: %s\n', student_name);
fprintf('Performance Index: %.4f\n', performanceIndex);
fprintf('Grade: %.2f\n', grade);

fid = fopen('results.csv', 'a');
fprintf(fid, '%s,%.4f,%.2f\n', student_name, performanceIndex, grade);
fclose(fid);
