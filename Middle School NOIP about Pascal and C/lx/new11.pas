Program Joseph;
Type
  pt=^hsy;
  hsy=record
    data:integer;
    next:pt;
end;
Var
  p,w:pt;
  m,n:integer;
Procedure crea;
var
  s:pt;
  i:integer;
begin
  new(s);
  p:=s;
  s^.data:=1;
  w:=s;
  for i:=2 to n do
    begin
      new(s);
      s^.data:=i;
      w^.next:=s;
      w:=s;
    end;
    w^.next:=p;
end;
Procedure main;
Var
  a,q:pt;
  i,t,o,k,z:integer;
begin
  t:=0; q:=w;
  o:=n;
  repeat
    a:=q^.next;
    inc(t);
    if t=m then
    begin
      writeln(a^.data);
      m:=a^.data;
      q^.next:=a^.next;
      if a<>a^.next then dispose(a);
      t:=0;
      dec(o);
    end
    else q:=a;
    if o=1 then break;
  until a=a^.next;
  p:=a;
end;
Begin
  write('n,m=');
  readln(n,m);
  crea;
  main;
  dispose(p);
  readln;
End.