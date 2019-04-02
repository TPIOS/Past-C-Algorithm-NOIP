program floyd_example;
const
  maxn=10;
var
  n,s,t,i,j:integer;
  dist:array[1..maxn,1..maxn] of real;
  prev:array[1..maxn,1..maxn] of 0..maxn;
procedure init;
  var
    m,i,u,v:integer;
  begin
    assign(input,'floyd.in');
    reset(input);
    assign(output,'floyd.out');
    rewrite(output);
    readln(n,m);
    fillchar(prev,sizeof(prev),0);
    for u:=1 to n do
     for v:=1 to n do
       dist[u,v]:=1e10;
    for i:=1 to m do
      begin
        readln(u,v,dist[u,v]);
        dist[v,u]:=dist[u,v];
        prev[u,v]:=u;
        prev[v,u]:=v;
     end;
  end;{init}
procedure floyd;
  var
    i,j,k:integer;
  begin
    for k:=1 to n do
      for i:=1 to n do
         for j:=1 to n do
           if (dist[i,k]+dist[k,j]<dist[i,j])
              then  begin
                 dist[i,j]:=dist[i,k]+dist[k,j];
                 prev[i,j]:=prev[k,j];
                 //prev[i,j]:=k;
                end;
  end;{floyd}
procedure print(i,j:integer);
  begin
    if i=j then write(i) else
      //if prev[i,j]=0 then write('No Solution!') else
         begin
            print(i,prev[i,j]);
            write('->',j);
         end;
  end;{print}
begin
  init;
  floyd;
  //for i:=1 to n do begin  for j:=1 to n do write(prev[i,j]);writeln;end;
  for i:=1 to n do
    for j:=i to n do
      begin
        write(i,' ',j,' ');
        write(dist[i,j]:0:0,' ');
        print(i,j);
        //print(i,prev[i,i]);
        writeln;
      end;
  close(input);
  close(output);
end.
