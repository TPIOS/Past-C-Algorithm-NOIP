Program first;
Const
  a:array[1..10] of integer=(12,23,9,89,7,10,67,23,58,50);
Var
  f:array[1..100] of integer;
  i,j,n,max:integer;
Begin
 // readln(n);
  n:=10;
  f[1]:=1;
  for i:=2 to n do
  begin
    max:=0;
    for j:=1 to i-1 do if(a[i]<a[j]) and (f[j]>max) then max:=f[j];
    f[i]:=max+1;
  end;
  max:=0;
  for i:=1 to n do
    if f[i]>max then max:=f[i];
  writeln(max);
  readln;
End.
