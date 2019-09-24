A=[1:10]
B=[1:2.5:10]
C=A>5
isnumeric(A)
isreal(B)
isfloat(B)
islogical(C)
ischar(B)
whos
find(A>5)   %返回值为真值的下标%
A(A>=6)=5
A(find(A>=6))=5
sort(A,'ascend')
sort(A,'descend')
