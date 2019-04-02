Program new;
Const
  n=10;
Var
  a:array[1..n] of integer;
  i,j:integer;
Procedure swap(var x1,x2:integer);
Var t:integer;
begin
  t:=x1;x1:=x2;x2:=t;
end;
Begin
  assign(input,'new.in');
  reset(input);
  assign(output,'new.out');
  rewrite(output);
  for i:=1 to n do read(a[i]);
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i]>a[j] then swap(a[i],a[j]);
  for i:=1 to n-1 do write(a[i],' ');
  write(a[n]);
  close(input);
  close(output);
End.