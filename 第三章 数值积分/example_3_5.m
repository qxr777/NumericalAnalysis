% 梯形公式的加速--外推技巧
clear; clc; 
f = @(x) sqrt(x.^3);
a = 0; 
b = 1;
tol = 1e-7;
maxit = 100; % 最大迭代步数

T(1,1) = (b-a)/2 * (f(a) + f(b));  
fprintf(' T(1,1)=%.8f \n',T(1,1));
k = 1;  err = 1.0;
for k = 1 : maxit
    h = (b-a)/(2^(k-1));
    T(k+1,1) = T(k,1)/2 + (h/2) * sum(f(a+0.5*h+[0:2^(k-1)-1]*h));
    fprintf(' T(%d,1)=%.8f ',k+1,T(k+1,1));
    for j = 1 : k
        T(k+1,j+1) = (4^j * T(k+1,j) - T(k,j) )/(4^j-1);
        fprintf(' T(%d,%d)=%.8f ',k+1,j+1,T(k+1,j+1));
        err = abs(T(k+1,j+1)-T(k+1,j));
        if (err<tol), break, end % check convergence
    end
    fprintf('\n')
    if (err<tol), break, end % check convergence
end



