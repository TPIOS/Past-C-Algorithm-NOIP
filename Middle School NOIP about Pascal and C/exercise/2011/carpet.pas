Program carpet;
Const
  infile='carpet.in';
  outfile='carpet.out';
Var
  n:longint;
  i:longint;
  a:array[1..10000,1..4] of longint;
  s1,s2,t:longint;
  k1,k2,k3,k4:longint;
Begin
  Assign(input,infile);
  Assign(output,outfile);
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do readln(a[i,1],a[i,2],a[i,3],a[i,4]);
  readln(s1,s2);
  t:=1;
  for i:=n downto 1 do
  begin
    k1:=a[i,1];k2:=a[i,2];k3:=a[i,1]+a[i,3];k4:=a[i,2]+a[i,4];
    if (k1<=s1) and (s1<=k3) and (k2<=s2) and (s2<=k4) then begin writeln(i);t:=0;break;end;
  end;
  if t=1 then writeln('-1');
  close(input);
  close(output);
End.