Program gaojingdu;
Type
Var
  la,lb,lc,t,p,i:longint;
  a,b,c,s:string;
Procedure plus();
Var
  i,j,k:longint;
  x:longint;
Begin
  i:=la;j:=lb;k:=lc;
  while j<>1 do
  begin
    c[k]:=c[k]+(a[i]+b[j]) mod 10;
    c[k-1]:=(a[i]+b[j]) div 10;
    dec(i);
    dec(j);
    dec(k);
  end;
  dec(k);
  if i<>1 then for x:=i downto 1 do begin c[k]:=a[x];dec(k);end;
  p:=k;
End;
Begin
  readln(a);
  readln(b);
  la:=length(a);
  lb:=length(b);
  lc:=la+lb;
  if lb>la then begin s:=a;a:=b;b:=s; end;
  t:=la;la:=lb;lb:=t;
  plus();
  minus();
  time();
  for i:=p to lc do write(c[i]);
  readln;
End.