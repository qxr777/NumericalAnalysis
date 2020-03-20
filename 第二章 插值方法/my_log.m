function [ y ] = my_log( xl )
%MY_LOG 以插值方法实现自然对数函数
%   Detailed explanation goes here
b = 1 : 4;
yb = log(b);
[m, c] = d_d(b, yb);
y = nest(c, xl, b);
end

