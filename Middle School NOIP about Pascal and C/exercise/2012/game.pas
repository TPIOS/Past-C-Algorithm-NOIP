Program game;
var
  i,j,k,m,n,x,y,len:longint;
  s,sa,sb:ansistring;
  a,ans,c:array[1..10000]of longint;
  b:array[1..1010,1..3]of longint;

procedure qs(head,tail:longint);
var t,mid,i,j:longint;
begin
   i:=head;j:=tail;mid:=b[(head+tail)>>1,3];
   repeat
     while b[i,3] do
     while b[j,3]>mid do dec(j);
     if i<=j then
        begin
           t:=b[i,3];
           b[i,3]:=b[j,3];
           b[j,3]:=t;
           t:=b[i,1];
           b[i,1]:=b[j,1];
           b[j,1]:=t;
           t:=b[i,2];
           b[i,2]:=b[j,2];
           b[j,2]:=t;
           inc(i);dec(j);
        end;
    until i>j;
   if head
   if i
end;

procedure cheng(x:longint);
var i,j,k:longint;
begin
  for i:=1 to 10000 do
      a[i]:=a[i]*x;
  for i:=1 to 9999 do
      begin
         a[i+1]:=a[i+1]+a[i] div 10;
         a[i]:=a[i] mod 10;
      end;
end;

function bijiao:boolean;
var i,j:longint;
begin
  for i:=10000 downto 1 do
     begin
       if ans[i]>c[i] then exit(false);
       if c[i]>ans[i] then exit(true);
     end;
  exit(false);
end;
procedure dv(x:longint);
var i,d:longint;
begin
   d:=0;
   for i:=10000 downto 1 do
     begin
       d:=d*10+a[i];
       c[i]:=d div x;
       d:=d mod x;
     end;

end;

begin

   readln(n);
   readln(x,y);a[1]:=x;
   for i:=1 to n do
      begin
         readln(b[i,1],b[i,2]);
         b[i,3]:=b[i,1]*b[i,2];
      end;
   qs(1,n);
   len:=10000;
   for i:=1 to n do
      begin
         dv(b[i,2]);
       if bijiao then
          for j:=len downto 1 do ans[j]:=c[j];

             cheng(b[i,1]);
      end;
   len:=10000;
   while (ans[len]=0)and(len<>1) do dec(len);
   for i:=len downto 1 do write(ans[i]);

end.
