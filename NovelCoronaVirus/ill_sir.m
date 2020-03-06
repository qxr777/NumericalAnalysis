% SIR模型微分方程
function [ y ] = ill_sir( t, x )
%ILL_SIR Summary of this function goes here
%   输入参数 x 包含两个分量，依次为：Suspectable，Infective 的比例

lambda = 0.2586;  % 日接触率
miu = 0.0821;  % 日治愈率，即每天治愈病人数占病人总数的比例

y=[lambda * x(1) * x(2) - miu * x(1), -lambda * x(1) * x(2)]';

end

