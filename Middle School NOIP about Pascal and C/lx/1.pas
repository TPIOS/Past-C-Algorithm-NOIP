Program qwe;
var n1,n2,n3,n4,n5,t1:integer;
function max(x1,x2:integer):integer;
begin
  if x1>x2 then max:=x1
  else max:=x2;
end;

Begin
  Write('qweqweqw');
  Readln(n1,n2,n3,n4,n5);
  t1:=n1;
  t1:=max(t1,n2);
  t1:=max(t1,n3);
  t1:=max(t1,n4);
  t1:=max(t1,n4);
  writeln('dasdas:',t1);
  readln;
End.
