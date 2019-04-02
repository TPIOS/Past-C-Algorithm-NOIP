Program trial;
Type
  s=record
    a1:integer;
    a2:string;
  end;
Var
  s1,s2:s;
Begin
  s1.a1:=1;
  s1.a2:='s1';
  s2.a1:=2;
  s2.a2:='s2';
  s2:=s1;
  writeln(s2.a1,' ',s2.a2);
  readln;
End.
