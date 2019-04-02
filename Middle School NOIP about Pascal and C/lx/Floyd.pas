Program tanxin1;
Const n=6;
Var
  d:array[1..n] of integer;
  flag:array[1..n] of boolean;
  t:array[1..n,1..n] of integer;
  i,m,k,j,x,y,mini,w,l:integer;
Begin
  fillchar(d,sizeof(d),127);
  fillchar(t,sizeof(t),127);
  fillchar(flag,sizeof(flag),false);
  assign(input,'t.in');
  reset(input);
  readln(m,l);
  for i:=1 to m do
  begin
    read(x,y);
    readln(t[x,y]);
    t[y,x]:=t[x,y];
  end;
  close(input);
  for i:=1 to n do t[i,i]:=0;
  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        if (t[i,k]+t[k,j]<t[i,j]) then t[i,j]:=t[k,j]+t[i,k];
  for i:=1 to n do    begin
    for j:=1 to n do
      write(t[i,j],' ');
    writeln;
    end;
  readln;
  readln;

End.
