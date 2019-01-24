function [xmin,ymin]=optm8(int1,int2,fun)
clc
tol=input('K�rem adja meg a toleranci�t: ');
valasz=invalasz('Meg k�v�nja n�zni az adott f�ggv�ny 3d-s �br�j�t?');
if valasz=='i'
    disp('A f�ggv�ny �br�zol�sa [-500,500] intervallumon fog t�rt�nni. [Tov�bb : Enter]')
    pause
    x=linspace(-500,500,100);
    y=linspace(-500,500,100);
    [xx,yy]=meshgrid(x,y);
    z=34*xx.^4-22*xx.^3*yy+48*xx.^3+43*xx.^2*yy.^2+148*xx.^2*yy+40*xx.^2+72*xx.*yy.^3+68*xx*yy.^2-64*xx*yy+73*yy.^4+424*yy.^3+800*yy.^2+9;
    mesh(x,y,z)
end;
varakozz('Tov�bb : Enter');
clc
valasz=invalasz('Meg k�v�nja n�zni az adott f�ggv�ny 2d-s szintvonal�br�j�t?');
if valasz=='i'
    disp('A f�ggv�ny �br�zol�sa [-2,2] intervallumon fog t�rt�nni. [Tov�bb : Enter]')
    pause
    x=linspace(-2,2,100);
    y=linspace(-2,2,100);
    [xx,yy]=meshgrid(x,y);
    z=34*xx.^4-22*xx.^3*yy+48*xx.^3+43*xx.^2*yy.^2+148*xx.^2*yy+40*xx.^2+72*xx.*yy.^3+68*xx*yy.^2-64*xx*yy+73*yy.^4+424*yy.^3+800*yy.^2+9;
    meshc(x,y,z)
    contour(x,y,z,500)
end;
varakozz('Tov�bb : ENTER');
clc
disp(' A f�ggv�ny minimumhely�nek keres�se az fmins elj�r�s seg�ts�g�vel.')
   xmin=fmins(fun,[int1;int2]);
   clc
   ymin=fel(xmin);
    disp('A f�ggv�ny minimum �rt�ke az fmins elj�r�s seg�ts�g�vel:')
    disp('A minimumhely:')
xmin   
disp('A minimumhely f�ggv�ny�rt�ke:')
ymin
disp('A Hesse m�trix a megadott pontban:')
H=hesse(xmin(1),xmin(2))
varakozz('Tov�bb : Enter')
clc
[vekt,ertek]=eig(H);
disp('A Hesse m�trix saj�tvektorai:')
vekt
disp('A Hesse m�trix saj�t�rt�kei:')
ertek
pause
clc
disp('Davidon-Fletcher-Powell m�dszerrel sz�molt minimumhely');
disp('�s f�ggv�ny�rt�k: ');
varakozz('Tov�bb : ENTER')
[xmin,fmin,gfmin,itno]=dfp1([int1;int2],tol,fun);
disp('A gradiensvektor norm�ja:')
gfmin
disp('Az iter�ci�sz�m:')
itno
varakozz('Tov�bb: Enter')
clc
disp('A f�ggv�ny elso deriv�ltja x1 szerint:')
derx1=elsoderx1(xmin(1),xmin(2))
disp('A f�ggv�ny elso deriv�ltja x2 szerint a minimumhelyen:')
derx2=elsoderx2(xmin(1),xmin(2))
x0=[int1,int2];
disp('A kiindul� x0 pont koordin�t�i:')
x0
disp('A minimum helyen a Hesse m�trix:')
H=hesse(xmin(1),xmin(2))
disp('A minimumhelyen a Hesse m�trix saj�t �rt�ke �s vektora:')
[vekt ertek]=eig(H)
disp('DFP m�dszerrel sz�molt minimumhely �s f�ggv�ny�rt�k:')