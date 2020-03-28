% Romberg算法求峡谷索桥长度
clear;
format long;
f = @(x) cosh(x/5); % 索桥的曲线函数是双曲余弦
a = 0; 
b = 3;
tol = 1e-6;

h = b - a;
T1 = (h / 2) * (1 + f(b));
k = 1;
T2 = 0;
fprintf('T%d= %f\n', 2^0, T1);
flag = true;
while (flag)
    S = 0;
    x = a + h / 2;
    while (x < b)
        S = S + f(x);
        x = x + h;
    end
    T2 = T1 / 2 + h * S / 2;   % 计算梯形序列下一个二分结果
    fprintf('T%d= %f\n', 2^k, T2);
    S2 = T2 + (T2 - T1) / 3;  % 线性组合外推至Simpson序列
    fprintf('S%d= %f\n', 2^(k-1), S2);
    if k == 1
        k = k + 1;
        h = h / 2;
        T1 = T2;
        S1 = S2;    
    else
        C2 = S2 + (S2 - S1) / 15;   % 线性组合外推至Cotes序列
        fprintf('C%d= %f\n', 2^(k-2), C2);
        if k == 2
            C1 = C2;
            k = k + 1;
            h = h / 2;
            T1 = T2;
            S1 = S2;    
        else
            R2 = C2 + (C2 - C1) / 63;  % 线性组合外推至Romberg序列
            fprintf('R%d= %f\n', 2^(k-3), R2);
            if k == 3
                R1 = R2;
                C1 = C2;
                k = k + 1;
                h = h / 2;
                T1 = T2;
                S1 = S2;                
            else if abs(R2 - R1) >= tol
                    R1 = R2;
                    C1 = C2;
                    k = k + 1;
                    h = h / 2;
                    T1 = T2;
                    S1 = S2;
                else
                    flag = false;
                    fprintf('Romberg算法求峡谷索桥长度 计算结果：%f米\n',R2 * 2);
                end
            end
        end
    end
end
