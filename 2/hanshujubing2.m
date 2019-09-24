clear all;
f1=@char
s1=func2str(f1)
f2=str2func(s1)
functions(f1)
isa(f1,'function_handle')
isequal(f1,f2)

