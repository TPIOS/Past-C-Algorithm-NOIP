program eightqueen;
const max=8;
var i,j:integer;
a:array[1..max] of 0..max;   //queen
b:array[2..2*max] of boolean; // '/'
c:array[-(max-1)..max-1] of boolean;//' \'
col:array[1..max] of boolean; //col
total:integer;

procedure output;
var i,j:integer;
begin
  write('No.':4,'[',total+1:2,']');
  for i:=1 to max do write(a[i]:3);write(' ');
  if (total+1) mod 2 =0 then writeln;
  inc(total);

  {writeln('No.':4,'[',total+1:2,']');
  for j:=1 to 8 do
  begin
    for i:=1 to a[j]-1 do write('.':2);
    write('O':2);
    for i:=a[j]+1 to max do write('.':2);
    writeln;
  end;
  inc(total);
  readln;}
end;

function ok(row,i:integer):boolean; //(row,i)?
begin
  ok:=false;
  if ( b[row+i]=true) and ( c[row-i]=true) and (col[i]=true) then ok:=true
end;

procedure try(row:integer);
var
  i,j:integer;
begin
  for i:=1 to max do
    if ok(row,i) then
    begin
      a[row]:=i;
      b[row+i]:=false;
      c[row-i]:=false;
      col[i]:=false;
      if row=max then output else try(row+1);
      a[row]:=0;
      b[row+i]:=true;
      c[row-i]:=true;
      col[i]:=true;
    end;
end;

begin
  for i:=1 to max do begin a[i]:=0;col[i]:=true;end;
  for i:=2 to 2*max do b[i]:=true;
  for i:=-(max-1) to max-1 do c[i]:=true;
  total:=0;
  try(1);
  writeln('total:',total);
  readln;
end.
