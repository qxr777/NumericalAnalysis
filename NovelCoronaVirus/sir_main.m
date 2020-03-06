% SIR模型演示程序
clear;clc;
ts = 0 : 150;  % 时间

x0=[0.02,0.98];

[t,x]=ode45('ill_sir',ts,x0); %[t,x]

plot(t, x(:, 1),t, x(:, 2), t, (1 - x(:,1) - x(:, 2)));
legend('Infective', 'Suspectable', 'Removed');
grid;