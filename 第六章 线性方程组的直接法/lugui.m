function [L,U,pv,qv] = lugui(A,pivotstrat)
%LUGUI Gaussian elimination demonstration.
%
%   LUGUI(A) shows the steps in LU decomposition by Gaussian elimination.
%   At each step of the elimination, the pivot that would be chosen by
%   MATLAB's partial pivoting algorithm is shown in magenta.  You can use
%   the mouse to pick any pivot.  The pivot is shown in red, the emerging
%   columns of L in green, and the emerging rows of U in blue.
%
%   LUGUI with no arguments uses a random integer test matrix.
%   Type 'help golub' for a description of the test matrices.
%
%   A popup menu allows the pivot strategy to be changed dynamically.
%   lugui(A,'pick'), choose pivots with the mouse.
%   lugui(A,'diagonal'), use diagonal elements as pivots.
%   lugui(A,'partial'), use the largest element in the current column.
%   lugui(A,'complete'), use the largest element in the unreduced matrix.
%
%   [L,U,p,q] = lugui(A,...) returns a lower triangular L, an upper
%   triangular U and permutation vectors p and q so that L*U = A(p,q).
%
%   See also PIVOTGOLF.

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

% Initialize

if nargin < 2
   pivotstrat = 'pick';
end
if nargin < 1
   n = 2 + ceil(6*rand);
   A = golub(n);
end
Asave = A;

[m,n] = size(A);
shg
clf
dx = 120;
dy = 30;
warns = warning('off','MATLAB:divideByZero');
set(gcf,'name','Lugui','menu','none','numbertitle','off', ...
   'windowbuttonupfcn','set(gcf,''tag'',''pivot'')')
w = (n+1)*dx;
h = (m+3)*dy;
pos = get(gcf,'pos');
if pos(3) < w+40
   pos = [pos(1)-(w+40-pos(3))/2 pos(2) w+40 pos(4)];
end
if pos(4) < h+80
   pos = [pos(1) pos(2)-(h+80-pos(4))/2 pos(3) h+80];
end
set(gcf,'pos',pos)
axes('units','pixels','pos',[(pos(3)-w)/2 (pos(4)-h)/2 w h], ...
   'xtick',[],'ytick',[])
box on
Lcolor = [0 .65 0];
Ucolor = [0  0 .90];
Acolor = [0 0 0];
PartialPivotColor = [1 0 1];
PivotColor = [1 0 0];
ElimColor = [1 1 0];
paws = 0.02;

% Each element has its own handle

for j = 1:n
   for i = 1:m
      t(i,j) = text('units','pixels','string',spf(A(i,j)), ...
         'fontname','courier','fontweight','bold','fontsize',14, ...
         'horiz','right','color',Acolor, ...
         'pos',[20+j*dx 20+(m+2-i)*dy],'userdata',[i j], ...
         'buttondownfcn','set(gcf,''userdata'',get(gco,''userdata''))');
   end
end

% Menus

switch lower(pivotstrat)
   case 'pick', val = 1;
   case 'diagonal', val = 2;
   case 'partial', val = 3;
   case 'complete', val = 4;
   otherwise, val = 1;
end
pos = get(gca,'pos');
pivotstrat = uicontrol('pos',[pos(1)+pos(3)/2-75 pos(2)-35 150 20], ...
   'style','pop','val',val,'fontsize',12,'back','white', ...
   'string',{'Pick a pivot','Diagonal pivoting', ...
   'Partial pivoting','Complete pivoting'});
quit = uicontrol('style','toggle','string','quit','fontsize',12, ...
   'back','w','pos',[pos(1)+pos(3)-60 pos(2)-40 60 25],'vis','off');

% Elimination

pv = 1:m;
qv = 1:n;
for k = 1:min(m,n)

%  If possible, quit early

   if all(all(A(k:m,k:n)==0)) | all(all(~isfinite(A(k:m,k:n))))
      for l = k:min(m,n)
         for i = l+1:m
            set(t(i,l),'string',spf(A(i,l)),'color',Lcolor)
            drawnow
         end
         for j = l:n
            set(t(l,j),'string',spf(A(l,j)),'color',Ucolor)
            drawnow
         end
      end
      break
   end

   if (m == n) & (k == n)
      p = n;
      q = n;
   else
      pp = min(find(abs(A(k:m,k)) == max(abs(A(k:m,k)))))+k-1;
      set(t(pp,k),'color',PartialPivotColor)
      p = 0;
      q = 0;
      while p < k | q < k | p > m | q > n
         switch get(pivotstrat,'val')
   
            case 1  % Pick a pivot with mouse
               pq = get(gcf,'userdata');
               if isequal(get(gcf,'tag'),'pivot') & ~isempty(pq)
                  p = pq(1);
                  q = pq(2);
                  set(gcf,'tag','','userdata',[])
               else
                  pause(paws)
               end
   
            case 2 % Diagonal pivoting
               p = k;
               q = k;
   
            case 3 % Partial pivoting
               p = pp;
               q = k;
   
            case 4 % Complete pivoting
               [p,q] = find(abs(A(k:m,k:n)) == max(max(abs(A(k:m,k:n)))));
               p = p(1)+k-1;
               q = q(1)+k-1;
         end
         if get(quit,'value') == 1, break, end
      end
      if get(quit,'value') == 1, break, end
      set(t(pp,k),'color',Acolor)
      set(t(p,q),'color',PivotColor)
   end
   if get(quit,'value') == 1, break, end
   pause(10*paws)

%  Swap columns

   A(:,[q,k]) = A(:,[k,q]);
   qv([q,k]) = qv([k,q]);
   for s = .05:.05:1
      for i = 1:m
         set(t(i,k),'pos',[20+(k+s*(q-k))*dx 20+(m+2-i)*dy])
         set(t(i,q),'pos',[20+(q+s*(k-q))*dx 20+(m+2-i)*dy])
      end
      drawnow
   end
   t(:,[q,k]) = t(:,[k,q]);
   for i = 1:m
      set(t(i,k),'string',spf(A(i,k)),'userdata',[i k])
      set(t(i,q),'string',spf(A(i,q)),'userdata',[i q])
   end
   pause(10*paws)

%  Swap rows

   A([p,k],:) = A([k,p],:);
   pv([p,k]) = pv([k,p]);
   for s = .05:.05:1
      for j = 1:n
         set(t(k,j),'pos',[20+j*dx 20+(m+2-(k+s*(p-k)))*dy])
         set(t(p,j),'pos',[20+j*dx 20+(m+2-(p+s*(k-p)))*dy])
      end
      drawnow
   end
   t([p,k],:) = t([k,p],:);
   pause(10*paws)

   for j = k:n
      set(t(k,j),'string',spf(A(k,j)),'userdata',[k j])
      set(t(p,j),'string',spf(A(p,j)),'userdata',[p j])
   end
   pause(10*paws)

%  Skip step if column is all zero

   if all(A(k:m,k) == 0)
      for i = k+1:m
         set(t(i,k),'string',spf(A(i,k)),'color',Lcolor)
         drawnow
      end
      for j = k:n
         set(t(k,j),'string',spf(A(k,j)),'color',Ucolor)
         drawnow
      end
   else

%     Compute multipliers in L

      for i = k+1:m
         A(i,k) = A(i,k)/A(k,k);
         set(t(i,k),'string',spf(A(i,k)),'color',Lcolor)
         pause(paws)
      end

%     Elimination    

      for j = k+1:n
         for i = k+1:m
            set(t(i,j),'color',ElimColor)
            pause(paws)
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
            pause(paws)
            set(t(i,j),'string',spf(A(i,j)),'color',Acolor)
         end
      end

      for j = k:n
         set(t(k,j),'string',spf(A(k,j)),'color',Ucolor)
         drawnow
      end
      pause(paws)
   end
   if k < min(m,n), pause(10*paws), end
end

% Seperate L and U into two matrices

delete(pivotstrat)

for s = .1:.1:1.5
   for j = 1:n
      for i = 1:m
         if i <= j
            set(t(i,j),'pos',[20+(j+.10*s)*dx 20+(m+2-i)*dy])
         else
            set(t(i,j),'pos',[20+(j-.10*s)*dx 20+(m+2-s-i)*dy])
         end
      end
   end
   drawnow
end

% Insert ones on diagonal of L
 
r = min(m,n);
for j = 1:r
   text('units','pixels','string',spf(1.0), ...
      'fontname','courier','fontweight','bold','fontsize',14, ...
      'horiz','right','color',Lcolor, ...
      'pos',[20+(j-0.15)*dx 20+(m+.5-j)*dy]);
end
drawnow
warning(warns)

if nargout > 0
   L = tril(A(:,1:r),-1) + eye(m,r);
   U = triu(A(1:r,:));
else
   set(gcf,'userdata',Asave)
   set(quit,'value',0,'string','close','fontsize',12,'callback','close(gcf)')
   uicontrol('pos',[pos(1)+pos(3)/2-30 pos(2)-40 80 25],'string','repeat', ...
      'back','w','fontsize',12,'callback','lugui(get(gcf,''userdata''))','vis','off')
end

%------------------------------------------------------------

function s = spf(aij)
% Subfunction to format text strings
if aij == 0
   f = '%10.0f';
elseif (abs(aij) < 1.e-4) | (abs(aij) >= 1.e4) 
   f = '%10.1e';
else
   f = '%10.4f';
end
s = sprintf(f,aij);
