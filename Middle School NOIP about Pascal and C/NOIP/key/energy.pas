program energy;
const
  maxn=100;
var
 n:integer;
 a:array[1..maxn] of longint;
 s:array[1..maxn,1..maxn] of longint;
 i,j,k,temp,max,min,t1,t2:longint;
begin
  assign(input,'energy.in');
  reset(input);
  assign(output,'energy.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  close(input);
  fillchar(s,sizeof(s),0);
  for j:=2 to n do
    for i:=1 to n do
      for k:=1 to j-1 do
        begin
          if i+k>n then t1:=i+k-n else t1:=i+k;
          if i+j>n then t2:=i+j-n else t2:=i+j;
          max:=s[i,k]+s[t1,j-k]+a[i]*a[t1]*a[t2];
          if s[i,j]<max then s[i,j]:=max;
        end;
  max:=0;
  for i:=1 to n do
    if max<s[i,j] then max:=s[i,j];
  write(max);
  close(output);
end.
