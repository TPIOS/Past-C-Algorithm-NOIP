Program count;
Const
  infile='count.in';
  outfile='count.out';
  max=200000;
Var
  a,b:array[1..max] of longint;
  n,k,c:longint;
  i,j:longint;
Procedure quicksort(x,y:longint);
Var
  temp,l,r:longint;
Begin
  temp:=a[x];
  l:=x;r:=y;
  if x>y then exit;
  while l<>r do
  begin
    while (l<r) and (a[r]>=temp) do dec(r);
    a[l]:=a[r];
    while (l<r) and (a[l]<=temp) do inc(l);
    a[r]:=a[l];
  end;
  a[l]:=temp;
  quicksort(x,l-1);
  quicksort(l+1,y);
End;
Begin
  Assign(input,infile);
  Assign(output,outfile);
  Reset(input);
  Rewrite(output);
  readln(n);
  for i:=1 to n do begin readln(a[i]); end;
  //for i:=1 to n do begin writeln(a[i]); end;
  quicksort(1,n);
  k:=a[1];c:=1;
  for i:=1 to n do if a[i]=k then inc(b[c]) else begin writeln(k,' ',b[c]);k:=a[i];inc(c);inc(b[c]); end;
  writeln(k,' ',b[c]);
  Close(input);
  Close(output);
End.
