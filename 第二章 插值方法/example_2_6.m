% Runge现象 插值误差演示
clear; clc;
f = @(x) (1./(1+x.^2));
% f = @(x) (4 * x.^6 + 3 * x); % n=6时两条曲线重合
a = -5; b = 5;
xi = -5: 0.01 :5;  % 画图节点
yt = f(xi);  % 函数值

for n = 2  : 10
    % n = 5;
    X = [ a : (b-a)/n : b ]; % 插值节点
    Y = f(X);
    
    yi = zeros(1,length(xi));
    for i = 1 : length(xi)
        for k = 0 : n
	       xtmp1 = xi(i)-X([1:k,k+2:end]);   % Lagrange基函数的分子
	       xtmp2 = X(k+1)-X([1:k,k+2:end]);  % Lagrange基函数的分母
           yi(i) = yi(i) + Y(k+1)*prod(xtmp1./xtmp2);
        end
    end
    
    plot(xi,yt,'r-', xi,yi,'b-','LineWidth',2);
    hold on;
    plot(X,Y,'bo','LineWidth',2,'markersize',12);
    hold off;
    %axis([-5,5,-1,2]);
    tit = ['n=',int2str(n)];
    title(tit,'FontSize',20); legend('f(x)','L_n(x)')
    pause
end