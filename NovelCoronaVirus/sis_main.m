% SIS模型演示程序
clear;clc;
ts = 0 : 150;

x0=[0.2];   % 最初感染率，百万分之一

% lambda   日接触率
%  miu     日治愈率，即每天治愈病人数占病人总数的比例
lambda_miu = [0.27, 0.1;...
              0.25, 0.1;...
              0.20, 0.1;...
              0.15, 0.1;...
              0.08, 0.1];   
infective_matrix = zeros(length(ts),length(lambda_miu));

for i = 1 : length(lambda_miu)
  lambda = lambda_miu(i,1);
  miu = lambda_miu(i,2);
  [t,x] = ode45(@(t,y) ill_sis(t,y,lambda,miu), ts, x0); 
  infective_matrix(:,i) = x(:,1);
end

plot(t, infective_matrix);
legend(num2str(lambda_miu(1,:)), num2str(lambda_miu(2,:)), num2str(lambda_miu(3,:)), num2str(lambda_miu(4,:)), num2str(lambda_miu(5,:)));
grid;