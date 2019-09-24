clear all;
a=[1:10;
   2:11;
   3:12;
   4:13]
f1=a(2,3)
f2=a(3)
f3=a(2:4,:)
f4=a(:,3:7)
f5=a(2:4,3:7)
f6=a(3:end,:)
ind1=sub2ind(size(a),3,4)
a(ind1)
b=ind2sub(size(a),15)
a(b)


