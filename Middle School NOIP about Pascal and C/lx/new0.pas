Program new;
Var
  n1,n2,n3,n4,n5,t,max:integer;
  flag:boolean;
  hsy:string;
Function bijiao(x1,x2:integer):boolean;
begin
  if x1>x2 then
    bijiao:=true
  else
    bijiao:=false;
end;
Begin
  readln(n1,n2,n3,n4,n5);
  max:=n1;
  readln(hsy);
  if bijiao(max,n2)=false then max:=n2;
  if bijiao(max,n3)=false then max:=n3;
  if bijiao(max,n4)=false then max:=n4;
  if bijiao(max,n5)=false then max:=n5;
  Writeln(max);
  writeln('hello!',hsy);
  readln;
End.