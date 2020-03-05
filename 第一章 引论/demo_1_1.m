% 秦九韶算法 求多项式的值
clear;
a = [1 2 -12 -1 7];   % 多项式系数，高阶系数在前
x = 3;
n = length(a);

v = a(1);
for k = 1 : n - 1
    v = x * v + a(k + 1);
end
fprintf('多项式求值 计算结果：%f\n',v);
