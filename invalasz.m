function valasz=invalasz(x)
% INVALASZ i vagy n v�laszt v�r a feltett k�rd�sre
%
 valasz=' ';
 while ~((valasz=='i') | (valasz=='n')),
   valasz=input([x ' (i/n) '] ,'s');
 end;
%
%=========================================
%||     invalasz elj�r�s v�ge           ||
%=========================================
