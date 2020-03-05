% Newton 迭代法的初值选择
clear; clc
f = @(x) x.^3 - x -1;

%x0 = 1.5; % 初值接近根  f(x0)*f(x)的二阶导数 > 0 , 凹&初值正数 or 凸&初值为负数
%x0 = 0.5; % 初值远离根

x=linspace(-2,2,300);
y=f(x);
plot(x,y);
ha=gca;
set(ha,'ygrid','on')

