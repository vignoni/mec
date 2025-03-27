T = readtable("results.csv", "ReadVariableNames", false);
fid = fopen('README.md', 'r');
lines = textscan(fid, '%s', 'Delimiter', '\n');
fclose(fid);

start_marker = '<!-- RESULTS_TABLE_START -->';
end_marker = '<!-- RESULTS_TABLE_END -->';

start_idx = find(contains(lines{1}, start_marker));
end_idx = find(contains(lines{1}, end_marker));

table_lines = {};
for i = 1:height(T)
    table_lines{end+1} = sprintf('| %s | %.4f | %.2f |', T.Var1{i}, T.Var2(i), T.Var3(i));
end

new_lines = [...
    lines{1}(1:start_idx);
    table_lines';
    lines{1}(end_idx:end)];

fid = fopen('README.md', 'w');
fprintf(fid, '%s\n', new_lines{:});
fclose(fid);
