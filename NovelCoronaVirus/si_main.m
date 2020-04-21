
clear;clc;
ts = 0 : 550;   % 时间

x0=[0.000001];   % 最初感染率，百万分之一

% lambda   日接触率
lambdas = [0.15, 0.07, 0.05, 0.025, 0.0125];   
infective_matrix = zeros(length(ts),length(lambdas));

for i = 1 : length(lambdas)
  lambda = lambdas(i);
  [t,x] = ode45(@(t,y) ill_si(t,y,lambda), ts, x0); 
  infective_matrix(:,i) = x(:,1);
end

plot(t, infective_matrix);
legend(num2str(lambdas(1)), num2str(lambdas(2)), num2str(lambdas(3)), num2str(lambdas(4)), num2str(lambdas(5)));
title('SI模型');
grid;