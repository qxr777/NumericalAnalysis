% 线性插值和三次Hermite插值（单段）
clear; clc; close all;
f = @(x) 1./(1+x.^2); % 函数表达式
df = @(x) -(2*x)./(x.^2 + 1).^2; % 一阶导数, 用于Hermite插值
a = -1;  b = 2;  % 插值区间
n = 1;          % 区间等分数
h = (b-a)/n;
xi = a : h : b; % 插值节点
fi = f(xi);     % 插值节点上的函数值
dfi = df(xi);    % 一阶导数值

x = a : (b-a)/500 : b; % 需要插值的点

% 定义线性插值函数
L1 = @(x,x0,x1,y0,y1) y0*(x-x1)/(x0-x1) + y1*(x-x0)/(x1-x0);

% 定义两点三次Hermite插值函数
H3 = @(x,x0,x1,y0,y1,df0,df1) ...
   (y0*(1+2*(x-x0)/(x1-x0))+df0*(x-x0))*((x-x1)/(x0-x1))^2 + ...
   (y1*(1+2*(x-x1)/(x0-x1))+df1*(x-x1))*((x-x0)/(x1-x0))^2;

% 线性插值
N = length(x);
y1 = zeros(1,N);  % 线性插值
y2 = zeros(1,N);  % 三次Hermite插值
for j = 1 : N
   %    idx = find(xi>=x(j)); % 寻找 x(j) 所在的小区间 [x_k,x_{k+1}]
   %    k = idx(1)-1;
   %    if k==0
   %       k = k + 1;
   %    end
   for k=1:n+1  % 寻找 x(j) 所在的小区间 [x_k,x_{k+1}]
      if xi(k) >= x(j)
         break;  % 找到第一个不小于 x(j) 的插值节点
      end
   end
   if k>1
      k=k-1;
   end
%    fprintf('x(j)=%.2f, k=%d, 插值小区间: [%.2f,%.2f]\n', ...
%       x(j), k, xi(k),xi(k+1))
   y1(j) = L1(x(j),xi(k),xi(k+1),fi(k),fi(k+1));
   y2(j) = H3(x(j),xi(k),xi(k+1),fi(k),fi(k+1),dfi(k),dfi(k+1));
end

% 绘图
hold on;
plot(x,f(x),'r-', 'LineWidth',2);  % f(x) 图像
plot(x,y1,'b-', 'LineWidth',2,'markersize',5); % 分段线性插值图像
plot(x,y2,'k-', 'LineWidth',2,'markersize',10); % 分段三次Hermite插值图像
legend('f(x)','L1(x)','H3(x)');
titstr=['n=',int2str(n)]; title(titstr,'fontsize',14);
%axis([-5,5,-1,2]);

plot(xi,fi,'ok','markersize',10,'LineWidth',1.5); % 绘制插值节点
hold off
