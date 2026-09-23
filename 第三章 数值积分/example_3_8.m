%  演示 高斯求积公式 与 Newton-Cotes公式 的差别 p23 例10
clear;
f = @(x) x.^2 .* cos(x);
g = @(t) pi^2 * (t+1).^2 .* cos(pi * (t+1) / 4) / 16;
a = 0;
b = pi/2;

%  高斯-勒让德求积公式
x1 = 0.3399810;   %Gauss点
x2 = 0.8611363;   %Gauss点
A1 = 0.6521452;   %Gauss系数
A2 = 0.3478548;   %Gauss系数
I_gl = (pi/4) * (A2 * g(-x2) + A1 * g(-x1) + A1 * g(x1) + A2 * g(x2));
fprintf('4点高斯-勒让德求积结果 = %.8f\n', I_gl);

%  Newton-Cotes求积公式
X = a : (b-a)/3 : b;
Y = f(X);
A = [1/8, 3/8, 3/8, 1/8];  % n=3时Newton-Cotes系数
I_nc = (b - a) * sum(A .* Y);
fprintf('4点Newton-Cotes求积结果 = %.8f\n', I_nc);

% 精确值
I = integral(f, a, b);
fprintf('Matlab函数求积结果 = %.8f\n', I);

