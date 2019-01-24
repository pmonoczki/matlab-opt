function [xmin,fmin,gfmin,itno]=dfp1(x0,tol,fun)
%
% DFP eljárás az y=f(x) függvény feltétel nélküli minimumának megkeresésére, ahol f:R^n-->R
%
%   input paraméterek:
%
%     x0    - a minimumhely kezdeti közelítése
%     tol   - kilépési pontosság, az eljárás befejezõdik, ha
%                  ||grad f(xmin)||<=tol vagy
%                  itno=itmax
%     fun   - felhasználó által megadott y=f(x) függvény neve aposztrófok között
%
%   output paraméterek:
%
%     xmin   - minimumhely becslése (xmin=(a+b)/2 kilépéskor)
%     fmin   - f(xmin), a becsült minimumhelyen a függvényérték
%     gfmin - a gradiens normája a becsült minimumhelyen
%     itno    - iterációszám
%
%   hívott rutinok
%
%     goldsec1
%     numgrad 
% ------------------
%
%   paraméterek beállítása
%
%   tolerancia az aranymetszéshez (tolgold)
tolgold=0.01*tol;
%   maximális megengedett iterációszám (itmax)
itmax=300;
%   intervallum jobb vége az iránymenti keresésnél (alfamax)
alfamax=10;
%
%   initializálás
%
x1=x0;
g=numgrad(x1,fun);
gnorm=norm(g);
itno=0;
n=length(x1);
H=eye(n);
%
%   a DFP iterációs ciklusa
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
%   output értékek
% 
xmin=x1;
fmin=f2;
gfmin=gnorm;
%
% ---------- a DFP eljárás vége --------
