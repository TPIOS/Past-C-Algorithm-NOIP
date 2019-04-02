program dijkstra_example;
const
  vmax=100;
var
  w:array[1..vmax,1..vmax] of integer;
  dist,prev,prn:array[1..vmax] of integer;
  f:array[1..vmax] of boolean;
  v,e,u,i,j,x,y,v0,head,foot:integer;
procedure init;
  begin
    fillchar(f,sizeof(f),false);
    assign(input,'dijkstra.in');
    reset(input);
    assign(output,'dijkstra.out');
    rewrite(output);
    readln(v);
    readln(e);
    for i:=1 to v do
      for j:=1 to v do
        if i<>j
          then w[i,j]:=maxint
          else w[i,j]:=0;
    for i:=1 to e do
      begin
        read(x,y);
        readln(w[x,y]);
        w[y,x]:=w[x,y];
      end;
  end;
procedure dijkstra(v0:integer);
  var
    min:integer;
  begin
    f[v0]:=true;
    for i:=1 to v do
     begin
       dist[i]:=w[v0,i];
       if dist[i]<>maxint
         then prev[i]:=v0
         else prev[i]:=0;
      end;
  for j:=1 to v do
  begin
    min:=maxint;
     for i:=1 to v do
      if (f[i]=false) and (dist[i]<min)
         then begin
               u:=i;
               min:=dist[i];
             end;
    if min<>maxint
      then begin
            f[u]:=true;
            for i:=1 to v do
              if (f[i]=false) and (dist[i]>dist[u]+w[u,i])
                then begin
                      dist[i]:=dist[u]+w[u,i];
                      prev[i]:=u;
                     end;
            end;
  end;
 end;
procedure print(i:integer);
  begin
    if i=v0 then write(v0) else
    if prev[i]=0 then write('No Solution!') else
    begin
      print(prev[i]);
      write('->',i);
    end;
  end;{print}
begin
  init;
  v0:=3;
  dijkstra(v0);
  for i:=1 to v do
    begin
      if dist[i]=maxint then writeln('No route!') else
      if (i<>v0) then
      begin
         write(v0,'-->',i:3,' : ',dist[i]:4,' : ');
         print(i);
         writeln;
         {write(v0,'-->',i:3,' : ',dist[i]:4,' : ',v0);
         foot:=0;
         u:=prev[i];
         while u<>v0 do
         begin
           inc(foot);
           prn[foot]:=u;
           u:=prev[u];
         end;
         for j:=foot downto 1 do write('-->',prn[j]);
         writeln('-->',i);}
      end;
    end;
  close(input);
  close(output);
end.
////////////////
program trade;
const maxn=30000;
type
   arr1=array[1..maxn] of boolean;
   arr2=array[1..maxn,1..maxn]of boolean;

var
   x,y,z,n,m,i,j:longint;
   maxmoney,minmoney:byte;
   a,b:array[1..maxn] of byte;
   dist1,dist2,f1,f2:arr1;
   w1,w2:arr2;

procedure dijkstra(v0:longint;var dist,f:arr1;var w:arr2);
var
  u,i:longint;
begin
  dist[v0]:=true;   {self can reach}
  repeat
    u:=0;
    for i:=1 to n do
      if dist[i] and (not f[i]) then begin u:=i; break; end;  {find not be expanded node}
    if u<>0  then
       begin
         f[u]:=true;
         for i:=1 to n do
           if (not dist[i]) and w[u,i] then dist[i]:=true;  {add new node}
       end;
  until u=0;
end;