syms a b c d
for i=1:100
    syms (['a',num2str(i)]);
    syms (['b',num2str(i)]);
    syms (['c',num2str(i)]);
    syms (['d',num2str(i)]);
end
diag(a(1):a(100))
