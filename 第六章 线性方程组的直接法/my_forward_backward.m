%  追赶法 分解的紧凑方式
function [x] = my_forward_backward(A,f)

[m,n]=size(A);
if (m~=n)
    fprintf('\n Error: A 不是方阵!\n'); return; 
end

a = diag(A, -1); 
a(2:n) = a;
a(1) = 0;
b = diag(A);
c = diag(A, 1);

% 判断是否三对角矩阵
if sum(any(tril(A, -2))) > 0 | sum(any(triu(A, 2))) > 0 
    fprintf('\n Error: A 不是三对角矩阵!\n'); x = [];  return; 
end  

% 判断是否对角占优
if (abs(b(1)) <= abs(c(1)) | abs(c(1)) == 0 | find(abs(b(2:n-1)) < abs(a(2:n-1)) + abs(c(2:n-1))) > 0 | abs(b(n)) <= abs(a(n))) | abs(a(n)) == 0
  fprintf('\n Error: A 不是对角占优矩阵!\n'); x = [];  return; 
end  

alpha = zeros(n, 1);
beda = zeros(n-1, 1);
gamma = a;   % gamma直接等于a，无需计算

alpha(1) = b(1);
for i = 1 : n - 1
    beda(i) = c(i) / alpha(i);
    alpha(i + 1) = b(i + 1) - a(i + 1) * beda(i);
end

% 求解Ly=b 和 Ux=y
y(1) = f(1) / b(1);
for i=2:n
    y(i)=(f(i) - a(i)*y(i-1)) / alpha(i);
end
x(n) = y(n);
for i = n-1 : -1 : 1
    x(i)=y(i) - beda(i) * x(i+1);
end


% END
