var
  a:array[1..100] of integer;
  n,i:integer;
procedure sort(l,r:longint);
var i,j,mid,tem:longint;
begin
      i:=l;j:=r;mid:=a[(l+r)shr 1];
      repeat
             while a[i]<mid do inc(i);
             while a[j]>mid do dec(j);
             if i<=j then 
             begin
               tem:=a[i];a[i]:=a[j];a[j]:=tem;
               inc(i);dec(j);
             end;
       until i>j;
       if i<r then sort(i,r);
       if l<j then sort(l,j);
end;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  qsort(1,n);
  for i:=1 to n do write(a[i],' ');
end. 