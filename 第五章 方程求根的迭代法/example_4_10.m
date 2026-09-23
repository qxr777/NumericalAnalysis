% 不动点迭代法
clear;
tol = 1e-7;
f = @(x) x.^5+10*x.^3+20.*x-4;
% g = @(x) ((4-20*x-x^5)/10)^(1/3);
% g = @(x) (4-20*x-10*x^3)^(1/5);
% 
% fprintf('迭代函数: g=%s\n',char(g));
% 
% N = 100; % 设置最大迭代步数
% x0 = 0.15; % 迭代初始值
% for k = 1 : N
%     x = g(x0);
%     fprintf('k=%2d,x=%.4e, f(x)=%.4e\n',k, x, f(x));
%     if(abs(x-x0) < tol) break; end;
%     x0 = x;
% end
% fprintf('迭代次数: %d\n', k);

x=(-10:0.01:10);
y=f(x);
