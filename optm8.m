function [xmin,ymin]=optm8(int1,int2,fun)
clc
tol=input('Kérem adja meg a toleranciát: ');
valasz=invalasz('Meg kívánja nézni az adott függvény 3d-s ábráját?');
if valasz=='i'
    disp('A függvény ábrázolása [-500,500] intervallumon fog történni. [Tovább : Enter]')
    pause
    x=linspace(-500,500,100);
    y=linspace(-500,500,100);
    [xx,yy]=meshgrid(x,y);
    z=34*xx.^4-22*xx.^3*yy+48*xx.^3+43*xx.^2*yy.^2+148*xx.^2*yy+40*xx.^2+72*xx.*yy.^3+68*xx*yy.^2-64*xx*yy+73*yy.^4+424*yy.^3+800*yy.^2+9;
    mesh(x,y,z)
end;
varakozz('Tovább : Enter');
clc
valasz=invalasz('Meg kívánja nézni az adott függvény 2d-s szintvonalábráját?');
if valasz=='i'
    disp('A függvény ábrázolása [-2,2] intervallumon fog történni. [Tovább : Enter]')
    pause
    x=linspace(-2,2,100);
    y=linspace(-2,2,100);
    [xx,yy]=meshgrid(x,y);
    z=34*xx.^4-22*xx.^3*yy+48*xx.^3+43*xx.^2*yy.^2+148*xx.^2*yy+40*xx.^2+72*xx.*yy.^3+68*xx*yy.^2-64*xx*yy+73*yy.^4+424*yy.^3+800*yy.^2+9;
    meshc(x,y,z)
    contour(x,y,z,500)
end;
varakozz('Tovább : ENTER');
clc
disp(' A függvény minimumhelyének keresése az fmins eljárás segítségével.')
   xmin=fmins(fun,[int1;int2]);
   clc
   ymin=fel(xmin);
    disp('A függvény minimum értéke az fmins eljárás segítségével:')
    disp('A minimumhely:')
xmin   
disp('A minimumhely függvényértéke:')
ymin
disp('A Hesse mátrix a megadott pontban:')
H=hesse(xmin(1),xmin(2))
varakozz('Tovább : Enter')
clc
[vekt,ertek]=eig(H);
disp('A Hesse mátrix sajátvektorai:')
vekt
disp('A Hesse mátrix sajátértékei:')
ertek
pause
clc
disp('Davidon-Fletcher-Powell módszerrel számolt minimumhely');
disp('és függvényérték: ');
varakozz('Tovább : ENTER')
[xmin,fmin,gfmin,itno]=dfp1([int1;int2],tol,fun);
disp('A gradiensvektor normája:')
gfmin
disp('Az iterációszám:')
itno
varakozz('Tovább: Enter')
clc
disp('A függvény elso deriváltja x1 szerint:')
derx1=elsoderx1(xmin(1),xmin(2))
disp('A függvény elso deriváltja x2 szerint a minimumhelyen:')
derx2=elsoderx2(xmin(1),xmin(2))
x0=[int1,int2];
disp('A kiinduló x0 pont koordinátái:')
x0
disp('A minimum helyen a Hesse mátrix:')
H=hesse(xmin(1),xmin(2))
disp('A minimumhelyen a Hesse mátrix saját értéke és vektora:')
[vekt ertek]=eig(H)
disp('DFP módszerrel számolt minimumhely és függvényérték:')