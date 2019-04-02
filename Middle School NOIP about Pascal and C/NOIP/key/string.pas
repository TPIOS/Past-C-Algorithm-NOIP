program ll;
var
  s:string;
  s1,s2:string;
  c:char;
  i:integer;
begin
  s1:='abb';
  s2:='aac';
  if s1>s2 then writeln('s1>s2') else writeln('s1<=s2');
  s:='asdfg';
  c:=s[1];
  writeln(c) ;
  c:=s[5];
  writeln(c) ;
  readln;
end.

 