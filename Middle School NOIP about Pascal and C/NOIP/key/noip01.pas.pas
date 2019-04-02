program noip01;
var
  n,m,k,t,s,tmp:int64;
  a:array[0..100] of integer;
  b:array[1..6] of int64;
procedure Divide(var d:int64);
var i,len:integer;
begin
  len:=a[0];
  d:=1;
  for i:=len-1 downto 1 do { from high to low }
  begin
      d:=d*10;
      d:=d mod tmp;
  end;
end;
begin
  readln(n,m,k,s);
  fillchar(a,sizeof(a),0);
  a[k+1]:=1;
  a[0]:=k+1;
  tmp:=m*n;
  divide(t);
  for i:=1 to t s:=(s+m) mod n;
  writeln(s);
end.
