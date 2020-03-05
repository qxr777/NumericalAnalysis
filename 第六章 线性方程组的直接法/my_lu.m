%  LU 分解的紧凑方式
function [L,U,x] = my_lu(A,b)

[m,n]=size(A);
if (m~=n)
    fprintf('\n Error: A 不是方阵!\n'); return; 
end

L = eye(n); 
U = zeros(n);

for k = 1:n
    U(k,k) = A(k,k)-sum(L(k,1:k-1)'.*U(1:k-1,k));
    if (U(k,k) == 0)
        fprintf('\n Error: 第 %d 个主元＝0 !\n',k); return; 
    end
    for j = k+1:n
        U(k,j) = A(k,j) - sum(L(k,1:k-1)'.*U(1:k-1,j));
        L(j,k) = (A(j,k) - sum( L(j,1:k-1)'.*U(1:k-1,k) ))/U(k,k);
    end
end

% 求解Ly=b 和 Ux=y
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


% END
