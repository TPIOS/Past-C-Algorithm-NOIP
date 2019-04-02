Function zhanzhuan(a,b:longint):longint;
Begin
  if a mod b=0 then exit(b) else exit(zhanzhuan(b,a mod b));
End;
