program dp2;
const
  max=1000;
var
  s:array [1..max,1..max] of integer;
  f:array [1..max,1..max] of integer;
  i,j,n,m,x,y,w,rnum:integer;
  x1,x2,y1,y2:integer;
  fin:text;
begin{main}
  assign(fin,'dp2.in');
  reset(fin);
  readln(fin,m,n);

  for i:=1 to m*n do for j:=1 to m*n do s[i,j]:=maxint;
  for i:=1 to m*n do s[i,i] :=0;


  rnum:=2*m*n-m-n; //num of route
  for i:=1 to rnum do
  begin
    readln(fin,x1,y1,x2,y2,w);
    x:=(x1-1)*n+y1;
    y:=(x2-1)*n+y2;
    s[x,y]:=w;s[y,x]:=w;
  end;
  close(fin);
  //
  f[1,n]:=0 ;
  for i:=2 to m do f[i,n]:=f[i-1,n] + s[(i-1)*n,i*n] ;
  for j:=n-1 downto 1 do  f[1,j]:=f[1,j+1] + s[j+1,j] ;
  for i:=2 to m do  for j:=n-1 downto 1 do
    if (f[i-1,j]+s[(i-2)*n+j,(i-1)*n+j]) > (f[i,j+1]+s[(i-1)*n+j+1,(i-1)*n+j]) then f[i,j]:= f[i,j+1]+s[(i-1)*n+j+1,(i-1)*n+j] else f[i,j]:=(f[i-1,j]+s[(i-2)*n+j,(i-1)*n+j]);
  for i:=1 to m do
  begin
    for j:=1 to n do write(f[i,j]:3);
    writeln;
  end;
end.


