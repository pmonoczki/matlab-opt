function [xmin,fmin,gfmin,itno]=dfp1(x0,tol,fun)
%
% DFP elj�r�s az y=f(x) f�ggv�ny felt�tel n�lk�li minimum�nak megkeres�s�re, ahol f:R^n-->R
%
%   input param�terek:
%
%     x0    - a minimumhely kezdeti k�zel�t�se
%     tol   - kil�p�si pontoss�g, az elj�r�s befejez�dik, ha
%                  ||grad f(xmin)||<=tol vagy
%                  itno=itmax
%     fun   - felhaszn�l� �ltal megadott y=f(x) f�ggv�ny neve aposztr�fok k�z�tt
%
%   output param�terek:
%
%     xmin   - minimumhely becsl�se (xmin=(a+b)/2 kil�p�skor)
%     fmin   - f(xmin), a becs�lt minimumhelyen a f�ggv�ny�rt�k
%     gfmin - a gradiens norm�ja a becs�lt minimumhelyen
%     itno    - iter�ci�sz�m
%
%   h�vott rutinok
%
%     goldsec1
%     numgrad 
% ------------------
%
%   param�terek be�ll�t�sa
%
%   tolerancia az aranymetsz�shez (tolgold)
tolgold=0.01*tol;
%   maxim�lis megengedett iter�ci�sz�m (itmax)
itmax=300;
%   intervallum jobb v�ge az ir�nymenti keres�sn�l (alfamax)
alfamax=10;
%
%   initializ�l�s
%
x1=x0;
g=numgrad(x1,fun);
gnorm=norm(g);
itno=0;
n=length(x1);
H=eye(n);
%
%   a DFP iter�ci�s ciklusa
%
while gnorm>=tol & itno<itmax
   s=-H*g;
   [x2,f2]=goldsec1(0,alfamax,tolgold,fun,x1,s);
   g2=numgrad(x2,fun);
   y=g2-g;
   v=H*y;
   H=H+(x2-x1)*s'/(s'*y)-v*v'/(y'*v);
   x1=x2;
   g=g2;
   gnorm=norm(g);
   itno=itno+1;
end
%
%   output �rt�kek
% 
xmin=x1;
fmin=f2;
gfmin=gnorm;
%
% ---------- a DFP elj�r�s v�ge --------
