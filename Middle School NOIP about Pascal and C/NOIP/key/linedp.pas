program linedp;
const
  maxn=300000;
var
  a,f:array[1..maxn] of longint;
  i,j,n,max:longint;
begin
  readln(n);
  for i:=1 to n do read(a[i]) ;
  f[1]:=1;
  for i:=2 to n do
  begin
    f[i]:=1;
    for j:=1to i-1 do
      if (a[i]>a[j]) and (f[j]>f[i]) then f[i]:=f[j]+1;
  end;
  max:=0;
  for i:=1 to n do
    if f[i]>max then max:=f[i];
  writeln(max);
end.
