Program kilo;
Var
  a:integer;
  i,j,n:integer;
Begin
  a:=0;
  for i:=1 to 100 do inc(a);
  Writeln('afor=',a);
  while a>50 do inc(a,-1);
  Writeln('awhile=',a);
  repeat
    inc(a,-1);
  until a<=10;
  Writeln('arepeat=',a);
  Readln;
End.