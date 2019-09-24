clear all;
r1=input('do you like apple? Y/N:','s');
while isempty(r1)
    r1=input('do you like apple? Y/N:','s');
end
disp(r1);
disp('input matrix,for example:eye(5)');
r2=input('','s');
f=eval(r2)