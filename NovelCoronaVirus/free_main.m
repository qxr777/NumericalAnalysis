% 自由增长模型演示程序

ts = 0 : 30;   % 时间天数
lambda = 0.3;  % 每个病人每天感染人数
x0 = 1;   % 初始病人数
infective = x0 * exp(lambda * ts);   % 病人数指数增长
plot(ts, infective);
grid;