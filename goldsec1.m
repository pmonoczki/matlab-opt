function [xmin, fmin]=goldsec1(a,b,tol,fun,x0,s)
%
% t�bbv�ltoz�s f�ggv�ny ir�nymenti minimaliz�l�sa
% az aranymetsz�s m�dszer�nek alkalmaz�s�val
% meghat�rozand�  min f(x0+t*s) t szerint, ahol a<=t<=b.
%
%   input param�terek:
%
%     [a,b] - keres�si intervallum (a<b)
%     tol   - kil�p�si tolerancia �rt�k, az elj�r�s v�get �r, ha b-a<=tol
%     fun   - felhaszn�l� �ltal megadott f�ggv�ny (y=f(x)) neve aposztr�fok k�z�tt
%     x0    - kiindul� pont koordin�t�i (vektor)
%     s      - keres�si ir�nyvektor
%
%   output param�terek:
%
%     xmin  - a becs�lt minimumhely (xmin=(a+b)/2)
%     fmin  - f(xmin), a f�ggv�ny�rt�k a becs�lt minimumhelyen
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
% ========== goldsec1 elj�r�s v�ge ==========
