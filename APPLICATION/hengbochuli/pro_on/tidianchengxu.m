clear a b c;
a=vsn;
b=yy2;
c=b./a;
c(find(vscn./vsn>1.05))=nan;
c(find(vscn./vsn<0.95))=nan;
b=a.*c;