% Newton 前插公式
clear;
h = 0.1;
X = 0.0 : h : 0.5;
% Y = [1.00000,0.99500,0.98007,0.95534,0.92106,0.87758];
Y = cos(X);

% 计算各阶差分
n = length(X) - 1;
p = zeros(n+1,n+1);
p(:,1) = Y(:);
for k = 1 : n
    p(1:n-k+1,k+1) = diff(p(1:n-k+2,k));
end

% 计算 4 次 Newton 前插公式
q = p(1,:);
x = 0.048; t = (x-X(1))/h;
y = q(1); z = 1;
for k = 1 : 4 % 这里是 4，不是 n(=5)
    z = z*(t-k+1)/k;
    y = y + z*q(k+1);
end
fprintf('四次Newton前插公式的计算结果为: cos(%.3f)=%.5f\n',x,y);
