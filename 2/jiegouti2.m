clear all;
s1=struct('type',{'big','little'},'color',{'red','blue'},'data',{[1 2 3;2 3 4],[1:4]});
s2=setfield(s1,{1,2},'type','middle')
s2(2)

