% 预测世界石油产量
%% 历史数据
clear;clc;
x = (1994 : 2003)';    % 年份
year = 1990;
x = x - year;
y = [67.052, 68.008, 69.803, 72.024, 73.400, 72.063, 74.669, 74.487, 74.065, 76.777]';   % 百万桶每日
plot(x,y,'rp');
%% 直线拟合
C = [x.^0, x.^1];
A = C' * C;  % 法方程系数矩阵
b = C' * y;  % 法方程向量
p_1 = A \ b   % 一次多项式系数，升幂排列
RMSE_1 = sqrt(sum((y - C * p_1).^2)) / sqrt(length(C))
%% 抛物线拟合
C = [x.^0, x.^1, x.^2];
A = C' * C;  % 法方程系数矩阵
b = C' * y;  % 法方程向量
p_2 = A \ b   % 二次多项式系数，升幂排列
RMSE_2 = sqrt(sum((y - C * p_2).^2)) / sqrt(length(C))
%% 三次曲线拟合
C = [x.^0, x.^1, x.^2, x.^3];
A = C' * C;  % 法方程系数矩阵
b = C' * y;  % 法方程向量
p_3 = A \ b   % 三次多项式系数，升幂排列
RMSE_3 = sqrt(sum((y - C * p_3).^2)) / sqrt(length(C))
%% 开始预测
x1=x(end) + (1:5)';   % 待预测时间, 10年
xi=[x;x1];
p = p_3;   % 指定模型
plot(x + year,y,'*',xi + year,polyval(flip(p),xi),x1 + year,polyval(flip(p),x1),'rp');
% 结论：预测结果仅供参考