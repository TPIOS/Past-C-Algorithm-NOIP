program sequence;
const
  maxn=100001;
type
  pon=^rec;
  rec=record
    pa,pb,num:longint;
    next:pon;
    end;
var
 n,i,k:longint;
 a,b,s:array[1..maxn] of longint;
 head,p,q,pre:pon;
begin
  assign(input,'e:/fpc/lx/sequence.in');
  reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  readln;
  for i:=1 to n do read(b[i]);
  //
  close(input);
  //
  new(p);
  head:=p;
  for i:=1 to n do
  begin
    new(q);
    q^.pa:=i;q^.pb:=1;q^.num:=a[i]+b[1];q^.next:=nil;
    p^.next:=q;
    p:=q;
  end;
   //
  k:=0;
  while k<n do
  begin
    p:=head^.next;
    inc(k);
    s[k]:=p^.num;
    //
    new(q);
    q^.pa:=p^.pa;q^.pb:=p^.pb+1;q^.num:=a[q^.pa]+b[q^.pb];q^.next:=nil;
    //
    p:=p^.next;
    head^.next:=p;
    pre:=head;
    while (p<>nil) and (q^.num>p^.num) do begin pre:=p;p:=p^.next; end;
    q^.next:=p;pre^.next:=q;
  end;
  for i:=1 to n do write(s[i],' ');
  writeln;
end.
