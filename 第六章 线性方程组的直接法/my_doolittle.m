%  列主元 Doolittle 分解的紧凑方式
function [L, U, x] = my_doolittle(A, b)

[m,n]=size(A);
if (m~=n)
    fprintf('\n Error: A 不是方阵!\n'); return; 
end

L = eye(n); 
U = zeros(n);

A_ = A;

Ip=1:n;%它的第k个元素M(k)记录第k个主元素所在的行号

for k = 1:n
    % 第一步 做分解PA=LU，P是置换矩阵，即实现选主元素
    [v, h] = max(abs(A_(k:n,k)));
    h = k + h -1;
    Ip(k) = h ;
    temp = A_(k,:);
    A_(k,:) = A_(h,:);
    A_(h,:) = temp;
    
    A_(k,k) = A_(k,k)-sum(A_(k,1:k-1)'.*A_(1:k-1,k));
    if (A_(k,k) == 0)
        fprintf('\n Error: 第 %d 个主元＝0 !\n',k); return; 
    end
    for j = k+1:n
        A_(k,j) = A_(k,j) - sum(A_(k,1:k-1)'.*A_(1:k-1,j));
        A_(j,k) = (A_(j,k) - sum( A_(j,1:k-1)'.*A_(1:k-1,k) ))/A_(k,k);    
        
    end

end
L = tril(A_,-1) + eye(n);
U = triu(A_);

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