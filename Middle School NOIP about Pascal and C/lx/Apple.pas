Program fond;
const n=7;
Type hsy=record
       id:string;
       date:integer;
End;
Var
  a:array[1..n] of hsy;
  i:integer;
Begin
  for i:=1 to n do
  begin
    a[i].id:=chr(i);
    a[i].date:=i;
  end;
  for i:=1 to n do
    with a[i] do
      begin
        write(date,' ');
        writeln(id);
      end;
  readln;
End.