function valasz=invalasz(x)
% INVALASZ i vagy n választ vár a feltett kérdésre
%
 valasz=' ';
 while ~((valasz=='i') | (valasz=='n')),
   valasz=input([x ' (i/n) '] ,'s');
 end;
%
%=========================================
%||     invalasz eljárás vége           ||
%=========================================
