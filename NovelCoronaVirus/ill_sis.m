% 定义SIS模型微分方程
function [ y ] = ill_sis( t, x, lambda, miu)
%ILL_SIS Summary of this function goes here
%   输入参数 x 包含一个分量，为：Infective 的比例
% lambda   日接触率，即每个病人每天感染的人数
%  miu     日治愈率，即每天治愈病人数占病人总数的比例

y = [lambda * x(1) * (1 - x(1)) - miu * x(1)]';

end

