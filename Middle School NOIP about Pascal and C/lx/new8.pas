Program new5;
Const n=5;
type
  point=^hg;
  hg=record
       data:integer;
       next:point;
     end;
Var
  i,x:integer;
  p,q1,q2,head:point;

Begin
  new(head);
  head^.next:=nil;
  for i:=1 to n do
  begin
    read(x);
    new(p);
    p^.data:=x;
    p^.next:=nil;
    if head^.next = nil then head^.next:= p else
    begin
      q1:=head;q2:=head^.next;
      while (q2^.data < p^.data) and (q2<>nil) do
      begin
        q1:=q2;q2:=q2^.next;
      end;
      q1^.next:=p;
      p^.next:=q2;
    end;
  end;
  p:=head^.next;
  q1:=p;
  while p<>nil do
  begin
    p:=p^.next;
    write(p^.data);
    dispose(q1);
    q1:=p;
  end;
  readln;
  readln;

End.
