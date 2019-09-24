syms x a b c
y=[1 1 1 1;
    x a b c;
    x^2 a^2 b^2 c^2;
    x^3 a^3 b^3 c^3]
b2=solve(det(y),'c')

    