function y=f2fen(f,a,b,h)

% x=a;
% while x<=b-h/2
% if f(x)*f(x+h)<=0
%     continue;
% else
%     x=x+h;
% end
% end
%     





while abs(b-a)>1e-6
c=(a+b)/2;
if abs(f(c))<1e-6
    break;
else if f(a)*f(c)<0           %此处体现只能求单调的解
        b=c;
    else
        a=c;
    end

end

end

y=c;