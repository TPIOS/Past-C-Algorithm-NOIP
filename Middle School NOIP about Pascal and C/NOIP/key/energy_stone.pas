program stone;
const
  maxn=100;
var
 n:integer;
 a:array[1..maxn] of longint;
 s:array[1..maxn,1..maxn] of longint;
 t:array[1..maxn,0..maxn] of longint;
 i,j,k,temp,max,min:longint;
begin
  assign(input,'stone.in');
  reset(input);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  //
  fillchar(t,sizeof(t),0);
  for i:=1 to n do
    for j:=1 to n do
        begin
          if (i+j-1) >n then temp:=(i+j-1) mod n else temp:=i+j-1;
          t[i,j]:=t[i,j-1]+a[temp];
        end;
  //
  fillchar(s,sizeof(s),0);
  for j:=2 to n do
    for i:=1 to n do
      begin
        max:=0;
        for k:=1 to j-1 do
          begin
            if i+k>n then temp:=(i+k) mod n else temp:=i+k;
            s[i,j]:=s[i,k]+s[temp,j-k]+t[i,j];
            if s[i,j]>max then max:=s[i,j];
          end;
        s[i,j]:=max;
      end;

  max:=0;
  for i:=1 to n do
    if max<s[i,n] then max:=s[i,n];

  //
  fillchar(s,sizeof(s),0);
  for j:=2 to n do
    for i:=1 to n do
      begin
        min:=maxlongint;
        for k:=1 to j-1 do
          begin
            if i+k>n then temp:=(i+k) mod n else temp:=i+k;
            s[i,j]:=s[i,k]+s[temp,j-k]+t[i,j];
            if s[i,j]<min then min:=s[i,j];
          end;
        s[i,j]:=min;
      end;

  min:=maxlongint;
  for i:=1 to n do
    if min>s[i,n] then min:=s[i,n];
  //
  writeln(max);
  writeln(min);
end.
