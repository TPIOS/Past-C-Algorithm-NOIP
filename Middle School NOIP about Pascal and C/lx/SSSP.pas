Program tanxin1;
Const n=6;
Var
  d:array[1..n] of byte;
  flag:array[1..n] of boolean;
  t:array[1..n,1..n] of byte;
  i,m,k,j,x,y,mini,w:byte;
Begin
  fillchar(d,sizeof(d),127);
  fillchar(t,sizeof(t),127);
  fillchar(flag,sizeof(flag),false);
  assign(input,'t.in');
  reset(input);
  readln(m,k);
  for i:=1 to m do
  begin
    read(x,y);
    readln(t[x,y]);
    t[y,x]:=t[x,y];
  end;
  close(input);
 { for i:=1 to n do                 begin
    for j:=1 to n do write(t[i,j],' ');
    writeln;
    end;
  for i:=1 to n do write(d[i],' ');
  writeln;              }
  for i:=1 to n do d[i]:=t[k,i];
  d[k]:=0;
  flag[k]:=true;
  for i:=2 to n do
  begin
    mini:=maxint;
    for j:=1 to n do
      if (not flag[j]) and (d[j]<mini) then begin mini:=d[j]; w:=j;end;
   flag[w]:=true;
   for j:=1 to n do
     if (not flag[j]) and (d[w]+t[w,j]<d[j]) then d[j]:=d[w]+t[w,j];
  end;
  for i:=1 to n do write(d[i],' ');
  writeln;
End.
