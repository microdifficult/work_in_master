data=[1 2 3 4;5 6 7 8;9 10 11 12];
A=reshape(data,2,2,3)
ap1=permute(A,[1,2,3])
ap2=permute(A,[2,3,1])
ap3=permute(A,[3,2,1])
ap4=permute(A,[3,1,2])
ap5=permute(A,[1,3,2])