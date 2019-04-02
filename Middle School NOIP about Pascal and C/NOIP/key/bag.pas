program bag;
const
  maxn=100;
  maxc=1000;
var
  c,n:longint;
  w,v:array[1..maxn] of longint;
  f:array[0..maxn,0..maxc] of longint;
  i,j:longint;
begin
  assign(input,'bag.in');
  reset(input);
  readln(c);
  readln(n);
  for i:=1 to n do read(w[i]); readln;
  for i:=1 to n do read(v[i]);
  for i:=0 to c do f[0,i]:=0;
  //
   for i:=1 to n do
    for j:=c downto 0 do
        begin
          f[i,j]:=f[i-1,j];
          if (j>=w[i]) and (f[i-1,j-w[i]]+v[i] > f[i,j]) then f[i,j]:=f[i-1,j-w[i]]+v[i];
        end;
  //
  writeln(f[n,c]);
end.
