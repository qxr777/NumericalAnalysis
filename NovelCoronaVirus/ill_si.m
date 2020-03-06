function [ y ] = ill_si( t, x, lambda)
%ILL_SIR Summary of this function goes here
%   输入参数 x 包含一个分量，为：Infective 的比例
% lambda   日接触率

y = [lambda * x(1) * (1 - x(1))]';

end

