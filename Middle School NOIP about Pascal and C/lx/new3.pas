Program new;
Var
  a,x:longint;
procedure suan(n:integer);
Begin
  if n=1 then a:=1
  else
    begin
      suan(n-1);
      a:=a*n;
    end
End;
Begin
  readln(x);
  suan(x);
  writeln(a);
  readln;
End.
