function [ y ] = my_sin( x )
%MY_SIN 以插值方法实现正弦函数
%   Detailed explanation goes here
b = pi * (0 : 1 : 3) / 6;
yb = sin(b);
[m, c] = d_d(b, yb);
s = 1;
xl = mod(x, 2 * pi);
if xl > pi
    xl = 2 * pi - xl;
    s = -1;
end
if xl > pi / 2
    xl = pi -xl;
end
y = s * nest(c, xl, b);
end

