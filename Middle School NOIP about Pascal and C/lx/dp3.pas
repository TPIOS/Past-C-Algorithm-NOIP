program dp3;
const
  max=1000;
  scode:array[1..20] of char=('f','k','p','s','u','c','g','l','q','t','a','d','h','m','r','o','b','e','j','n');

var
  s:array [1..max,1..max] of integer;
  f:array [1..max,1..max] of integer;
  i,j,n,m,x,y,w,rnum:integer;
  fin:text;
begin{main}
  assign(fin,'dp3.in');
  reset(fin);
  readln(fin,m,n);

  for i:=1 to m*n do for j:=1 to m*n do s[i,j]:=maxint;
  //for i:=1 to m*n do s[i,i] :=0;


  rnum:=2*m*n-m-n; //num of route
  for i:=1 to rnum do
  begin
    readln(fin,x,y,w);
    s[x,y]:=w; s[y,x]:=w;
  end;
  close(fin);
  //
  f[1,n]:=0 ;
  for i:=2 to m do f[i,n]:=f[i-1,n] + s[(i-1)*n,i*n] ;
  for j:=n-1 downto 1 do  f[1,j]:=f[1,j+1] + s[j+1,j] ;
  for i:=2 to m do  for j:=n-1 downto 1 do
    if (f[i-1,j]+s[(i-2)*n+j,(i-1)*n+j]) > (f[i,j+1]+s[(i-1)*n+j+1,(i-1)*n+j]) then f[i,j]:= f[i,j+1]+s[(i-1)*n+j+1,(i-1)*n+j] else f[i,j]:=(f[i-1,j]+s[(i-2)*n+j,(i-1)*n+j]);
  //
  for i:=1 to m do
  begin
    for j:=1 to n do write(f[i,j]:3);
    writeln;
  end;
  //
  writeln('min distance is:',f[m,1]);
  x:=m;y:=1;
  while not((x=1) and (y=n)) do
  begin
    write(scode[(x-1)*n+y],'-->');
    if x=1 then y:=y+1 else if y=n then x:=x-1 else
    if f[x,y+1] < f[x-1,y]  then y:=y+1 else if f[x,y+1]>f[x-1,y] then x:=x-1 else
    if f[x,y]-f[x,y+1]=s[(x-1)*n+y,(x-1)*n+y+1] then y:=y+1 else x:=x-1;
  end;
  writeln(scode[n]);
  readln;

end.


