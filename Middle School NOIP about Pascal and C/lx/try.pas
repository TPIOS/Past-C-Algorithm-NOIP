Program Trial;
Var
  a:array[1..100] of byte;
  b:array[1..100] of integer;
  c:array[1..100] of longint;
  i:integer;
Begin
  fillbyte(a,sizeof(a),255);
  fillword(b,sizeof(b) div 2,maxint);
  filldword(c,sizeof(c) div 4,maxlongint);
  writeln(a[1],' ',b[1],' ',c[1]);
  readln;
End.