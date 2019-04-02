Program new;
Const maxn=10;
Var
  n,q:integer;
  a:array[1..maxn] of integer;
  sum:integer;
Function pan(z,f:integer):boolean;
Var
  j:integer;
begin
  pan:=true;
  for j:=1 to f-1 do
  if (a[j]=z) then
    begin pan:=false; break; end
  else
    pan:=true;
end;
Procedure prn(o:integer);
Var
  p:integer;
begin
  for p:=1 to o do write(a[p]);
  sum:=sum+1;
end;
Procedure pailie(k:integer);
Var
  i:integer;
Begin
  for i:=1 to n do
  begin
    a[k]:=i;
    if ((k<=n) and (pan(a[k],k))) then
      begin
        if k=n then begin prn(k); writeln; end;
        k:=k+1;
        pailie(k);
        k:=k-1;
      end;
  end;
End;
Begin
  readln(n);
  sum:=0;
  q:=1;
  pailie(q);
  writeln('sum=',sum);
  readln;
End.