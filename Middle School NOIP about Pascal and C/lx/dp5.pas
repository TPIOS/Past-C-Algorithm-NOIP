program dp5;
const
  max=1000;
  scode:array[1..20] of char=('f','k','p','s','u','c','g','l','q','t','a','d','h','m','r','o','b','e','j','n');
var
  s:array [1..max,1..max] of integer;
  f,r,q:array [1..max] of integer;
  i,j,n,k,x,y,w,rnum,qnum:integer;
  source,dest,head,foot,oldfoot,min:integer;
  fin:text;

begin{main}

  fillword(f,sizeof(f),maxint);
  //fillchar(r,sizeof(r) div 2,0);

  assign(fin,'dp4.in');
  reset(fin);
  readln(fin,n,rnum);

  for i:=1 to n do for j:=1 to n do s[i,j]:=maxint;
  for i:=1 to n do s[i,i] :=maxint;

  for i:=1 to rnum do
  begin
    readln(fin,x,y,w);
    s[x,y]:=w;
    //s[y,x]:=w;   //must have direct
  end;
  readln(fin,source,dest);
  close(fin);
  //
  f[dest]:=0 ;
  head:=1;
  foot:=1;
  r[head]:=dest;
  while head<=foot do
  begin
    oldfoot:= foot;
    for i:=1 to n do
    begin
      min:=maxint;
      for j:=head to oldfoot do if  (s[i,r[j]]<maxint) then if (f[r[j]]+s[i,r[j]]<min) then min:=f[r[j]]+s[i,r[j]];
      if min<maxint then begin f[i]:= min; inc(foot); r[foot]:=i; end;
    end;
    head:=oldfoot+1;
  end;
  writeln('min distance is:',f[source]);
  qnum:=source;
  while qnum<>dest do
  begin
    write(scode[qnum],'-->');
    for j:=1 to n do if f[qnum]-f[j]=s[qnum,j] then break;
    qnum:=j;
  end;
  writeln(scode[dest]);
  readln;
end.


