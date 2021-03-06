Program trade;
Const maxn=1000;
Type
    arr1=array[1..maxn] of boolean;
    arr2=array[1..maxn,1..maxn] of boolean;
Var
  n,m:longint;
  i,x,y,z:longint;
  money:array[1..maxn] of integer;
  d1,dn:arr1;
  w1,wn:arr2;
  maxm,minm:longint;
Procedure dij(v0:longint;var d:arr1;var w:arr2);
Var
  i:longint;
  flag:array[1..maxn] of boolean;
Begin
  fillchar(flag,sizeof(flag),false);
  d[v0]:=true;
  repeat
    x:=0;
    for i:=1 to n do if (not flag[i]) and d[i] then begin x:=i;break; end;
    if x>0 then
    begin
      flag[x]:=true;
      for i:=1 to n do if w[x,i] then d[i]:=true;
    end;
  until x=0;
End;
Begin
  assign(input,'trade.in');
  assign(output,'trade.out');
  reset(input);
  rewrite(output);
  fillchar(w1,sizeof(w1),false);
  fillchar(wn,sizeof(wn),false);
  fillchar(d1,sizeof(d1),false);
  fillchar(dn,sizeof(dn),false);
  readln(n,m);
  for i:=1 to n do read(money[i]);
  for i:=1 to m do
  begin
    readln(x,y,z);
    w1[x,y]:=true;
    wn[y,x]:=true;
    if z=2 then begin w1[y,x]:=true;wn[x,y]:=true; end;
  end;
  dij(1,d1,w1);
  dij(n,dn,wn);
  maxm:=0;minm:=maxint;
  for i:=1 to n do
  if d1[i] and dn[i] then
  begin
    if money[i]<minm then minm:=money[i];
    if money[i]>maxm then maxm:=money[i];
  end;
  if (maxm=0) and (minm=maxint) then minm:=maxm;
  writeln(maxm-minm);
  close(input);
  close(output);
End.
