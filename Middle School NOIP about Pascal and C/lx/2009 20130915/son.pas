Program son;
Var
  a0,a1,b0,b1,c:longint;
  n,x,sumx:longint;
  k,t,i:longint;
  r1,r2:longint;
  flag:integer;
Function zhanzhuan(a,b:longint):longint;
Begin
  if a mod b=0 then exit(b) else exit(zhanzhuan(b,a mod b));
End;
Begin
  assign(input,'son.in');
  assign(output,'son.out');
  reset(input);
  rewrite(output);
  readln(n);
  for k:=1 to n do
  begin
    readln(a0,a1,b0,b1);
    sumx:=0;
    r1:=a1;r2:=b1 div b0;
    if r1>r2 then t:=r1 else t:=r2;
    for i:=t to b1 do
    begin
      x:=i;
      flag:=1;
      if x>a0 then c:=zhanzhuan(x,a0) else c:=zhanzhuan(a0,x);
      if c<>a1 then flag:=0;
      if flag=1 then if x>b0 then c:=zhanzhuan(x,b0) else c:=zhanzhuan(b0,x);
      if b1*c<>x*b0 then flag:=0;
      if flag=1 then begin inc(sumx);end;
    end;
    writeln(sumx);
  end;
  close(input);
  close(output);
End.
