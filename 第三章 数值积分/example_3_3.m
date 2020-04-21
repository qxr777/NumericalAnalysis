% 变步长方法求数值积分
clear;
format long;
f = @(x) sin(x)./x; % 采用数组运算，使得函数可以作用在向量或矩阵上
a = 0; 
b = 1;
tol = 1e-7;
i = 0;

h = b - a;
T1 = (h / 2) * (1 + f(b));
T2 = 0;
flag = true;
while (flag)
    fprintf('T%d= %.10f\n', 2^i, T1);
    S = 0;
    x = a + h / 2;
    while (x < b)
        S = S + f(x);
        x = x + h;
    end
    T2 = T1 / 2 + h * S / 2;
    h = h / 2;
    flag = abs(T2 - T1) >= tol;
    T1 = T2;
    i = i +1;
end
fprintf('变步长方法计算结果 T= %.8f\n',T2);
