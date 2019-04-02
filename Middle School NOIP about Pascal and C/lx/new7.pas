Program new;
Var
  a:array[1..8,1..8] of integer;
  b:array[1..8,1..8] of integer;
  i0,j0,sum:integer;
Procedure fu(x,y:integer);
Var
  i4,j4:integer;
Begin
  for i4:=1 to 8 do inc(b[i4,y]);
  for j4:=1 to 8 do inc(b[x,j4]);
  for i4:=1 to 8 do
    for j4:=1 to 8 do
      if (i4+j4=x+y) or (i4-j4=x-y) then inc(b[i4,j4]);
End;
Procedure fuqing(x,y:integer);
Var
  i4,j4:integer;
Begin
  for i4:=1 to 8 do dec(b[i4,y]);
  for j4:=1 to 8 do dec(b[x,j4]);
  for i4:=1 to 8 do
    for j4:=1 to 8 do
      if (i4+j4=x+y) or (i4-j4=x-y) then dec(b[i4,j4]);
End;
Procedure qing(q1,q2,z1,z2:integer);
Var
  i1,j1:integer;
Begin
  for i1:=q1 to z1 do
    for j1:=q2 to z2 do
        a[i1,j1]:=0;
End;
Function pan(m,n:integer):boolean;
Var
  i2,j2:integer;
Begin
  pan:=true;
  if b[m,n]>0 then pan:=false;
End;
Procedure prn();
Var
  i3,j3:integer;
Begin
  for i3:=1 to 8 do
  begin
   for j3:=1 to 8 do
     if a[i3,j3]=1 then write('0':2) else write('*':2);
  Writeln;
  end;
  readln;
  sum:=sum+1;
End;
Procedure huanghou(jx:integer);
Var ix:integer;
Begin
  for ix:=1 to 8 do
  if pan(ix,jx) then
  begin
    a[ix,jx]:=1;
    fu(ix,jx);
    if jx=8 then prn() else huanghou(jx+1);
    a[ix,jx]:=0;
    fuqing(ix,jx);
  end;
End;
Begin
  qing(1,1,8,8);
  for i0:=1 to 8 do
    for j0:=1 to 8 do
      b[i0,j0]:=0;
  huanghou(1);
  writeln('sum=',sum);
  readln;
End.
