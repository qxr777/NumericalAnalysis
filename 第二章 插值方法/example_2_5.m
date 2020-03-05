% p23 例5 埃特金逐步插值
clear;
format long;
x = 0.3 :0.1 : 0.7;
y = [0.29850, 0.39646, 0.49311, 0.58813, 0.68122];
xx = 0.462; % 插值点
fij(:,1) = y;
for i = 1 : 3
    for j = i+1 : 5
       fij(j,i+1) = fij(i,i)*(xx-x(j))/(x(i)-x(j)) + fij(j,i)*(xx-x(i))/(x(j)-x(i))  % 显示中间结果，体现迭代
    end
end
fij