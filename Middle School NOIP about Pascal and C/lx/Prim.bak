Program prim;
Const
    vmax=200
Var
  w:array[1..vmax,1..vmax]of integer;
  i,j,k,v,e:integer;
Procedure prim(v0:integer);
var
  flag:array[1..vmax] of boolean;
  min,prevk,nextk:integer;
begin
  fillchar(flag,sizeof(flag),false);
  flag[v0]:=true;
  for i:=1 to v-1 do
  begin
    min:=maxint;
    for k:=1 to v do
      if flag[k] then 
      for j:=1 to v do 
        if (not(flag[j])) and (w[k,j]<min) and (w[k,j]<>0) then 
        begin
          min:=w[k,j]; 
          nextk:=j;
          prevk:=k;
        end;
        if min<>maxint then
        begin
          flag[nextk]:=true; 
          writeln(prevk,' ',nextk,' ',min);
        end;
     end;{for}
 end;{prim}
 begin
   assign(input,'prim.in');
   reset(input);
   assign(output,'prim.out');
   rewrite(output);
   fillchar(w,sizeof(w),0);
   readln(v,e);
   for k:=1 to e do
     begin
       read(i,j);
       readln(w[i,j]);
       w[j,i]:=w[i,j];
     end;
   prim(1);
   close(input);
   close(output);
 end.
