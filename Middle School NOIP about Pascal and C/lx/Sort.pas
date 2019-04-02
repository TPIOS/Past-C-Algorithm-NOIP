Program sortcmp;
Const n=8;
Var
  a:array[1..n] of integer;
  b:array[1..n] of string;
  i:integer;
Procedure basic();
Var
  i,j,t:integer;
  s:string;
Begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if (a[i]>a[j]) then
      begin
        t:=a[i];a[i]:=a[j];a[j]:=t;
        s:=b[i];b[i]:=b[j];b[j]:=s;
      end;
End;
Procedure select();
Var
  i,j,t:integer;
  s:string;
  k:integer;
Begin
  for i:=1 to n-1 do
  begin
    k:=i;
    for j:=i+1 to n do if (a[k]>a[j]) then k:=j;
    if k<>i then
    begin
      t:=a[i];a[i]:=a[k];a[k]:=t;
      s:=b[i];b[i]:=b[k];b[k]:=s;
    end;
  end;
End;
Procedure bubble();
Var
  i,j,t:integer;
  s:string;
  k:integer;
Begin
  for i:=1 to n-1 do
  Begin
    k:=0;
    for j:=1 to n-i+1 do
      if (a[j-1]>a[j]) then
      begin
        k:=1;
        t:=a[j-1];a[j-1]:=a[j];a[j]:=t;
        s:=b[j-1];b[j-1]:=b[j];b[j]:=s;
      end;
    if k=0 then break;
  End;
End;
Procedure quicksort(l,r:integer);
Var
  temp:integer;
  s:string;
  x,y:integer;
Begin
  if l>=r then exit;
  x:=l;y:=r;
  temp:=a[l];
  s:=b[l];
  while (l<r) do
  begin
    while (l<r) and (a[r]>=temp) do dec(r);
    a[l]:=a[r];b[l]:=b[r];
    while (l<r) and (a[l]<=temp) do inc(l);
    a[r]:=a[l];b[r]:=b[l];
  end;
  a[l]:=temp;b[l]:=s;
  quicksort(x,l-1);
  quicksort(l+1,y);
End;
Procedure heapbuild(m,h:integer);
Var
  j:integer;
  temp:integer;
  s:string;
Begin
  temp:=a[h];s:=b[h];j:=2*h;
  while j<=m do
  begin
    if (j<m) and (a[j]<a[j+1]) then inc(j);
    if temp<a[j] then
    begin
      a[h]:=a[j];b[h]:=b[j];
      h:=j;
      j:=2*j;
    end else
    break;
  end;
  a[h]:=temp;b[h]:=s;
End;
Procedure heap();
Var
  i,t:integer;
  s:string;
Begin
  for i:=n div 2 downto 1 do heapbuild(n,i);
  for i:=n downto 2 do
  begin
    t:=a[1];a[1]:=a[i];a[i]:=t;
    s:=b[1];b[1]:=b[i];b[i]:=s;
    heapbuild(i-1,1);
  end;
End;
Begin
  a[1]:=49;a[2]:=38;a[3]:=65;a[4]:=97;a[5]:=76;a[6]:=13;a[7]:=27;a[8]:=49;
  b[1]:='a1';b[2]:='b2';b[3]:='c3';b[4]:='d4';b[5]:='e5';b[6]:='f6';b[7]:='g7';b[8]:='h8';
  //basic();
  //select();
  //bubble();
  quicksort(1,n);
  //heap();
  for i:=1 to n do writeln(b[i]:4,a[i]:4);
  readln;
End.