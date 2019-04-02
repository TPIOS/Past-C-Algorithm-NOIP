Program hotel;
Const
  infile='hotel.in';
  outfile='hotel.out';
Var
  n,k,p,sum:longint;
  a:array[1..200000,1..2] of longint;
  d:array[0..200001] of longint;
  i,j:longint;
Begin
  Assign(input,infile);
  Assign(output,outfile);
  reset(input);
  rewrite(output);
  readln(n,k,p);
  sum:=0;
  for i:=1 to n do readln(a[i,1],a[i,2]);
  d[0]:=0;
  for i:=1 to n do if a[i,2]<=p then d[i]:=d[i-1]+1 else d[i]:=d[i-1];
  d[n+1]:=d[n];
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i,1]=a[j,1] then if d[i-1]<d[j+1] then inc(sum);
  writeln(sum);
  close(input);
  close(output);
End.