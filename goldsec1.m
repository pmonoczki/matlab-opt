function [xmin, fmin]=goldsec1(a,b,tol,fun,x0,s)
%
% többváltozós függvény iránymenti minimalizálása
% az aranymetszés módszerének alkalmazásával
% meghatározandó  min f(x0+t*s) t szerint, ahol a<=t<=b.
%
%   input paraméterek:
%
%     [a,b] - keresési intervallum (a<b)
%     tol   - kilépési tolerancia érték, az eljárás véget ér, ha b-a<=tol
%     fun   - felhasználó által megadott függvény (y=f(x)) neve aposztrófok között
%     x0    - kiinduló pont koordinátái (vektor)
%     s      - keresési irányvektor
%
%   output paraméterek:
%
%     xmin  - a becsült minimumhely (xmin=(a+b)/2)
%     fmin  - f(xmin), a függvényérték a becsült minimumhelyen
%
% ---------------------
%
t=(sqrt(5)-1)/2;
h=b-a;
c=a+(1-t)*h;
d=b-(1-t)*h;
fc=feval(fun,x0+c*s);
fd=feval(fun,x0+d*s);
while h>tol
   h=t*h;
   if fc<fd
      b=d;
      d=c;
      fd=fc;
      c=a+(1-t)*h;
      fc=feval(fun,x0+c*s);
   else
      a=c;
      c=d;
      fc=fd;
      d=b-(1-t)*h;
      fd=feval(fun,x0+d*s);
   end
 end
xmin=x0+(a+b)*s/2;
fmin=feval(fun,xmin);
%
% ========== goldsec1 eljárás vége ==========
