%  高斯消去法 Gaussian_Elimination
function [x] = my_ge(A, b)

[m,n]=size(A);
if (m~=n)
    fprintf('\n Error: A 不是方阵!\n'); return; 
end

m = zeros(n);
%消元过程
for k = 1:n-1
  for i = k+1:n
    m(i,k) = A(i,k)/A(k,k);
    A(i,:) = A(i,:) - m(i,k) * A(k,:);
    b(i) = b(i) - m(i,k) * b(k);
  end
end
%回代过程
x(n) = b(n)/A(n,n);
for k = n-1 : -1 : 1
    summary = 0;
    for j = k+1 : n
        summary = summary + A(k,j) * x(j);
    end
    x(k) = (b(k) - summary) / A(k,k);
end
        