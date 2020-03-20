% 牛顿插值多项式求值
% 输入参数 c 是牛顿插值多项式的系数，也就是差商表的对角线
% 输入参数 x 待插值的自变量取值的向量
% 输入参数 xlist 已知的插值节点
% 输出参数 y 插值结果向量
function y = nest(c, x, xlist)
n = length(c);
result = 0;
item = 1;
for k = 1 : n  
    result = result + c(k) * item;
    item = item .* (x - xlist(k));   % 向量的点乘
end
y = result;