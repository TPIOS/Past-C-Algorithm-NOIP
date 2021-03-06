Program trade;
Const maxn=100000;
Type
    ha=^haha;
    haha=record
      data:longint;
      next:ha;
    end;
    arr1=array[1..maxn] of boolean;
    arr2=array[1..maxn] of ha;
Var
  n,m:longint;
  i,x,y,z:longint;
  money:array[1..maxn] of integer;
  d1,dn:arr1;
  w1n1,wn1n,w1n,wn1:arr2;
  maxm,minm:longint;
Procedure ins(var w:arr2;x,y:longint);
Var
  p:ha;
Begin
  new(p);
  p^.data:=y;
  p^.next:=w[x];w[x]:=p;
End;
Procedure dij(v0:longint;var d:arr1;var w:arr2);
Var
  i,k:longint;
  p:ha;
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
      p:=w[x];
      while p<>nil do
      begin
        if (not d[p^.data]) then d[p^.data]:=true;
        p:=p^.next;
      end;
    end;
  until x=0;
End;
Begin
  assign(input,'trade.in');
  assign(output,'trade.out');
  reset(input);
  rewrite(output);
  fillchar(d1,sizeof(d1),false);
  fillchar(dn,sizeof(dn),false);
  readln(n,m);
  for i:=1 to n do begin read(money[i]);w1n1[i]:=nil;wn1n[i]:=nil;w1n[i]:=nil;wn1[i]:=nil; end;
  for i:=1 to m do
  begin
    readln(x,y,z);
    ins(w1n,x,y);
    ins(wn1,y,x);
    if z=2 then begin ins(w1n,y,x);ins(wn1,x,y); end;
  end;
  dij(1,d1,w1n);
  dij(n,dn,wn1);
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
