% 近似计算 算法稳定性的演示
clear;

% 解法一   n从小到大
S0 = 0.182;
S(1) = 1 - 5*S0;
for n = 2 : 8
    S(n) = 1/n - 5*S(n-1);
    S(n) = vpa(S(n),3);
end
disp('解法一：')
disp(S)

% 解法二   n从大到小
S(8) = 0.0204;
for n = 8: -1 : 2
    S(n-1) = 1/(5*n) - S(n)/5;
    S(n-1) = vpa(S(n-1),3);
end
disp('解法二：')
disp(S)

% 精确值
syms x
for n = 1 : 5 % 8
    St(n) = int(x^n/(x+5),0,1);
    St(n) = vpa(St(n),3);
end
disp('精确值：')
disp(S)