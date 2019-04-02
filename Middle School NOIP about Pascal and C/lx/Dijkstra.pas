program dijkstra_example;
 const
   vmax=100;
 type
   path=record                  
         length:integer;
         pre:0..vmax;
        end;
 var
   w:array[1..vmax,1..vmax] of integer;
   dist:array[1..vmax] of path;
   v,e,u,i,j,x,y:integer;
 procedure init;
   begin
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
     w[v0,v0]:=1;                
     for i:=1 to v do
      begin
        dist[i].length:=w[v0,i];   
        if dist[i].length<>maxint
          then dist[i].pre:=v0     
          else dist[i].pre:=0;
       end;
   repeat
     min:=maxint;
     u:=0;
     for i:=1 to v do             
       if (w[i,i]=0) and (dist[i].length<min)
          then begin
                u:=i;
                min:=dist[i].length;
              end;
     if u<>0
       then begin
             w[u,u]:=1;
             for i:=1 to v do         
               if (w[i,i]=0) and (dist[i].length>dist[u].length+w[u,i])
                 then begin
                       dist[i].length:=dist[u].length+w[u,i];
                       dist[i].pre:=u;
                      end;
             end;
   until u=0;
  end;
 begin
   init;
   v0:=1;
   dijkstra(v0);
   for i:=1 to v do
     begin
       if (i<>v0) and (dist[i].length<>maxint)
          then write(dist[i].pre,' ',i);
     end;
   close(input);
   close(output);
 end.