%  列主元 Doolittle 分解的紧凑方式
function [L, U, x] = my_lu_with_column_pivoting(A, b)

[m,n]=size(A);
if (m~=n)
    fprintf('\n Error: A 不是方阵!\n'); return; 
end

L = eye(n); 
U = zeros(n);

Ip=1:n;  %它的第k个元素M(k)记录第k个主元素所在的行号

for k = 1:n
    % 做分解PA=LU，P是排列矩阵，即实现选主元素，并进行行交换
    [v, h] = max(abs(A(k:n,k)));
    h = k + h -1;
    Ip(k) = h ;
    temp = A(k,:);
    A(k,:) = A(h,:);
    A(h,:) = temp;
    
    A(k,k) = A(k,k)-sum(A(k,1:k-1)'.*A(1:k-1,k));
    if (A(k,k) == 0)
        fprintf('\n Error: 第 %d 个主元＝0 !\n',k); return; 
    end
    for j = k+1:n
        % L和U矩阵直接存储在A矩阵中，可以节省存储空间
        A(k,j) = A(k,j) - sum(A(k,1:k-1)'.*A(1:k-1,j));
        A(j,k) = (A(j,k) - sum( A(j,1:k-1)'.*A(1:k-1,k) ))/A(k,k);            
    end

end
L = tril(A,-1) + eye(n);
U = triu(A);

for i = 1:n
    t = Ip(i);
    if t ~= i
        temp = b(i);
        b(i) = b(t);
        b(t) = temp;
    end
end

y = 1:n;
y(1) = b(1);
for i=2:n
    summary = 0;
    for t=1:i-1
        summary = summary + L(i,t) * y(t);
    end
    y(i)=b(i) - summary;
    % 紧凑方式
%     t = (1 : i-1)';
%     y(i) = b(i) - sum(L(i,t) .* y(t));
end
x(n) = y(n)/U(n,n);
for i = n-1 : -1 : 1
    summary = 0;
    for t=i+1:n
        summary = summary + U(i,t) * x(t);
    end
    x(i)=(y(i) - summary)/U(i,i);
end

%END