clear all;
s1=struct('type',{'big','little'},'color',{'red','blue'},'data',{[1 2 3;2 3 4],[1:4]});
s1(1)
s1(2)
s2=rmfield(s1,'type')
s3=rmfield(s1,{'color','data'})