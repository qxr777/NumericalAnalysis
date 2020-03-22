% 样条插值举例
clear; clc

X = [27.7, 28, 29, 30];
Y = [4.1, 4.3, 4.1, 3.0];
df0 = 3.0; dfn = -4.0;  % 第一类边界条件

n = length(X) - 1;
H = diff(X); % 每个插值小区间的长度
mu = H(1:n-1) ./ (H(1:n-1) + H(2:n));
lambda = 1 - mu;
% 计算二阶差商
Y1 = diff(Y) ./ diff(X);  % 一阶差商
Y2 = diff(Y1) ./ ( X(3:end) - X(1:end-2) );  % 二阶差商
% 计算右端项
d = 6*Y2;
d0 = 6/H(1) * (Y1(1) - df0);
dn = 6/H(end) * (dfn - Y1(end));
% 给出系数矩阵
A = 2*eye(n+1) + diag([mu(:);1],-1) +diag([1;lambda(:)],1);
b = [d0; d(:); dn];
M = A\b;

% 计算 s_k(x) 的系数, 两种形式
p = zeros(n,4); p0 = zeros(n,4); 
for k = 1 : n
    p(k,1) = (M(k+1) - M(k))/(6*H(k));
    p(k,2) = M(k)/2;
    p(k,3) = (Y(k+1) - Y(k))/ H(k) - H(k)/6 * (2*M(k) + M(k+1));
    p(k,4) = Y(k);
    p0(k,1) = M(k)/(6*H(k));
    p0(k,2) = M(k+1)/(6*H(k));
    p0(k,3) = (Y(k) - M(k)*H(k)*H(k)/6) / H(k);
    p0(k,4) = (Y(k+1) - M(k+1)*H(k)*H(k)/6) / H(k);
end

% 调用 Matlab 的三次样条插值函数
pp = spline(X, [df0;Y(:);dfn]);

%输出结果
fprintf('按形式一输出: \n'); disp(p0);
fprintf('按形式二输出: \n'); disp(p);
fprintf('spline的结果(形式二): \n'); disp(pp.coefs);
