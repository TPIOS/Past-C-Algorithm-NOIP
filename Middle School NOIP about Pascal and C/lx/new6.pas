Program new;
Const maxn=10;
Var
  n,i:integer;
  a,b:array[1..maxn] of integer;
  sum:integer;
Procedure prn();
Var
  i:integer;
begin
  for i:=1 to n  do write(a[i]);
  writeln;
  sum:=sum+1;
end;
Procedure pailie(k:integer);
Var
  i:integer;
Begin
  for i:=1 to n do
  if b[i]=0 then
  begin
    a[k]:=i; b[i]:=1;
    if k<n then pailie(k+1) else  prn();
    b[i]:=0;
  end;
End;
Begin
  readln(n);
  sum:=0;
  for i:=1 to n do b[i]:=0;
  pailie(1);
  writeln('sum=',sum);
  readln;
End.