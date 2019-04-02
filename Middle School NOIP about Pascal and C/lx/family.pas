Program fabmily;
Const max=2000;
Var
  n,a,b,c,d,m,q,i,j:longint;
  s:array[1..max] of integer;
Begin
  assign(input,'fam.in');
  reset(input);
  readln(n,m);
  for i:=1 to n do s[i]:=i;
  for i:=1 to m do
  begin
    readln(a,b);
    c:=s[a];d:=s[b];
    //for j:=1 to n do if (s[j]=d) or (s[j]=b) then s[j]:=s[c];
    for j:=1 to n do if (s[j]=d) then s[j]:=c;
    //if i= 10 then begin writeln('a:',a,' b:',b); for j:=1 to n do writeln(j:4,s[j]:4); end;
   end;
  readln(q);
  for i:=1 to q do
  begin
    readln(a,b);
    if (s[a]=s[b]) then writeln('Yes') else writeln('No');
  end;
  close(input);
  readln;
End.