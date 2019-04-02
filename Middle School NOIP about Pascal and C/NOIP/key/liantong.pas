program liantong_example;
const
  maxv=20;
var
  link,longlink:array[1..maxv,1..maxv] of boolean;
  f:array[1..maxv] of boolean;
  w:array[1..maxv] of integer;
  v,e,k,i,j,s,best,besti,max,maxk:integer;
procedure init;
  begin
   assign(input,'liantong.in');
   reset(input);
   assign(output,'liantong.out');
   rewrite(output);
   fillchar(longlink,sizeof(longlink),0);
   fillchar(link,sizeof(link),0);
   readln(v);
   for i:=1 to v do
     readln(w[i]);
   readln(e);
   for k:=1 to e do
     begin
       readln(i,j);
       link[i,j]:=true;
       link[j,i]:=true;
     end;
  end;{init}
procedure bibao;
  begin
    longlink:=link;
    for k:=1 to v do
      for i:=1 to v do
       for j:=1 to v do
        longlink[i,j]:=longlink[i,j] or (longlink[i,k] and longlink[k,j]);
  end;{bibao}
procedure dfs(i:integer);
  begin
    write(i,'->');
    f[i]:=true;
    for j:=1 to v do
      if (not f[j]) and longlink[i,j]
         then dfs(j);
  end;{dfs}
begin{main}
  init;
  bibao;
  for i:=1 to v do
    begin
      k:=0;s:=0;
      for j:=1 to v do
        if longlink[i,j]
          then begin
                 k:=k+1;
                 s:=s+w[j];
               end;
        if k>best
            then begin
                   best:=k;
                   besti:=i;
                 end;
        if s>max
            then begin
                   max:=s;
                   maxk:=i;
                 end;
        if k=v then break;
      end;
   fillchar(f,sizeof(f),false);
   //dfs(besti);
   write(besti);
   for i:=1 to v do if longlink[besti,i] and (i<>besti) then write('-->',i);
   writeln;
   fillchar(f,sizeof(f),false);
   //dfs(maxk);
   write(maxk);
   for i:=1 to v do if longlink[maxk,i] and (i<>maxk) then write('-->',i);
  close(input);
  close(output);
end.
