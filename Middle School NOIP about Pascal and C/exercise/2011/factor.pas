Program factor;
Const
  infile='factor.in';
  outfile='factor.out';
Var
  a,b,k,n,m:longint;
  i:longint;
  c:array[1..1001,1..1001] of longint
Begin
  Assign(input,infile);
  Assign(output,outfile);
  reset(input);
  rewrite(output);
  readln(a,b,k,n,m);
  c[1,1]:=1;
  c[2,1]:=1;c[2,2]:=2;c[2,3]:=3;
  for i:=3 to k do
    for j:=3 to i do
      c[i,j]:=c[i-1,j-1]+c[i-1,j];
  c[k,k-n+1];

  close(input);
  close(output);
End.
