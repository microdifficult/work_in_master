A=rand(10,2);
x=A(:,1);
y=A(:,2);
if x>=0&y>=0;
    f=x+y;
elseif x>=0&y<=0;
    f=x+y.^2;
elseif x<0&y>=0;
    f=x.^2+y;
else x<0&y<0;
    f=x.^2+y.^2;

end
fprintf('f=%f\n',f)         %��Ϊ�и�ʽ�����������ȫ��1 0
figure;
plot3(x,y,f);
% x=input('x=');
% y=input('y=');
% if x>=0&y>=0;
%     f=x+y;
% elseif x>=0&y<=0;
%     f=x+y.^2;
% elseif x<0&y>=0;
%     f=x.^2+y;
% else x<0&y<0;
%     f=x.^2+y.^2;
% 
% end
% fprintf('f= %2.0f\n',f)