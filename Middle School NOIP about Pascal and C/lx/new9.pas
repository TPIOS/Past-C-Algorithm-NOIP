Program pp;
Const n=5;
type
  pt=^hsy;
  hsy=record
      dt:integer;
      nt:pt;
end;
Var
  i,x:integer;
  p,q1,q2,head:pt;
Begin
  new(head);
  head^.nt:=nil;
  for i:=1 to n do
  begin
    new(p);
    read(p^.dt);
    p^.nt:=nil;
    if head^.nt=nil then head^.nt:=p else
    begin
      q1:=head;q2:=q1^.nt;
      while q2^.dt<p^.dt  do
      begin
        q1:=q2;q2:=q2^.nt;
        if q2=nil then break;
      end;
      q1^.nt:=p;
      p^.nt:=q2;
    end;
  end;
  p:=head^.nt;
  while p<>nil do
  begin
    write(p^.dt,' ');
    q1:=p;
    p:=p^.nt;
    dispose(q1);
  end;
  readln;
  readln;
End.