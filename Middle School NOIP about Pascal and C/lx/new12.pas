Program another;
Var
  n,sum,i,k:integer;
  a,b:array[1..10] of integer;
Procedure prn();
Var
  i:integer;
Begin
  for i:=1 to n do write(a[i]);
  writeln;
  inc(sum);
End;
Procedure pailie(x:integer);
Var
  i:integer;
Begin
  for i:=1 to n do
  begin
    if b[i]=0 then
    begin
      a[x]:=i;b[i]:=1;
      if x<n then pailie(x+1) else prn();
      a[x]:=0;b[i]:=0;
    end;
  end;
End;
Begin
  readln(n);
  k:=0;
  for i:=1 to n do b[i]:=0;
  pailie(1);
  writeln('sum=',sum);
  readln;
End.
