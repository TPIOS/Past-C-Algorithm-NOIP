Program new;
Var
  a:integer;
Procedure suan(x:integer);
Var
  i,n:integer;
Begin
  if x=5 then a:=10;
  else
    begin
     suan(x+1);
     a:=a+2;
    end
End;
Begin
  suan(1);
  writeln(a);
  readln;
End.