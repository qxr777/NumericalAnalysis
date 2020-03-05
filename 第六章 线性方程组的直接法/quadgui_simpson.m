function [Qout,fcount] = quadgui_simpson(F,a,b,tol)

shg
clf reset
set(gcf,'menubar','none','numbertitle','off','name','Quad gui')

% Default tolerance
if nargin < 4 | isempty(tol)
   tol = 1.e-4;
end

% Default function and interval.
if nargin < 3
   F = @humps;
   a = 0;
   b = 1;
end

Sn_1 = (b - a)*(F(a) + 4*F((b+a)/2) + F(b)) / 6;
for n = 2:8
    h = (b - a) / 2^n;
    X = a : h : b;
    Y = F(X);
    Sn = Y(1) + Y(2^n+1) + 4*sum(Y(2:2:2^n)) + 2*sum(Y(3:2:2^n - 1));
    Sn = Sn*h/3;
    
    set(gcf,'userdata',0)
    hold on
    plot(X,Y,'.','markersize',16);  
    set(gca,'xtick',sort(X),'xticklabel',[]);
    title(num2str(length(X)))
    pause(2.5)
    hold off
    
    if abs(Sn - Sn_1) < tol
        fcount = 2^n + 1;
        break
    end
    Sn_1 = Sn;
end
Qout = Sn + (Sn - Sn_1)/15;
% Finish
title(sprintf('Q = %8.4f, fcount = %4.0f',Qout,fcount))






