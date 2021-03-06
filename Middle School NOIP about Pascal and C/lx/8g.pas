program eightno_bfs;
const
  dir:array[1..4,1..2] of -1..1=((1,0),(-1,0),(0,1),(0,-1));
  max=200000;
type
  t8no=array[1..3,1..3] of 0..8;
  tlist=record
     father:longint;
     dep:byte;
     x0,y0:byte;
     state:t8no;
  end;
var
  source,target:t8no;                 
  list:array[0..max] of tlist;        
  head,foot,best,i:longint;
  answer:longint;
  found:boolean;
procedure init;                     
  var
    x,y:byte;
  begin
    assign(input,'8no.in');
    reset(input);
    assign(output,'8no.out');
    rewrite(output);
    fillchar(list,sizeof(list),0);
      for x:=1 to 3 do              
      begin
       for y:=1 to 3 do
          read(source[x,y]);
        readln;
      end;
    readln;
    for x:=1 to 3 do                 
      begin
       for y:=1 to 3 do
          read(target[x,y]);
       readln;
      end;
    found:=false;
    head:=0;                         
    foot:=1;
    with list[1] do                  
      begin
        state:=source;
        dep:=0;
        father:=0;
        for x:=1 to 3 do
          for y:=1 to 3 do
            if state[x,y]=0
               then begin
                      x0:=x;
                      y0:=y;
                    end;
      end;
   end;
procedure writea(a:t8no);      
  var i,j:integer;
  begin
    for i:=1 to 3 do
      begin
       for j:=1 to 3 do
         write(a[i,j],' ');
       writeln;
      end;
    writeln;
  end;
function same(a,b:t8no):boolean;  
  var
    i,j:byte;
  begin
    same:=false;
    for i:=1 to 3 do
      for j:= 1 to 3 do
        if a[i,j]<>b[i,j]
          then exit;
    same:=true;
  end;
function notappear(newv:tlist):boolean; 
  var
    i:longint;
  begin
    notappear:=false;
    for i:=1 to foot do
      if same(newv.state,list[i].state)
        then exit;
    notappear:=true;
  end;
procedure add(newv:tlist);     
  begin
    if notappear(newv)
      then begin
            inc(foot);
            list[foot]:=newv;
           end;
   end;
procedure expand(index:longint;var n:tlist); 
  var
    i,x,y:integer;
    newv:tlist;
  begin
    for i:=1 to 4 do
     begin
       x:=n.x0+dir[i,1];              
       y:=n.y0+dir[i,2];
       if (x>0) and (x<4) and (y>0) and (y<4)   
       then begin
             newv.state:=n.state;
             newv.state[x,y]:=0;
             newv.state[n.x0,n.y0]:=n.state[x,y];
             newv.x0:=x;
             newv.y0:=y;
             newv.father:=index;
             newv.dep:=n.dep+1;
             add(newv);
            end;
     end;
  end;
procedure print(index:longint);   
  var
    i,j:byte;
  begin
    if index=0  then exit;
    print(list[index].father);
    writea(list[index].state);
  end;
begin{main}
  init;
  repeat
    inc(head);
    if same(list[head].state,target)   
      then begin
             found:=true;
             best:=list[head].dep;
             answer:=head;
             break;
            end;
      if list[foot].dep>15            
         then begin
                writeln('OverTime!');
                break;
              end;
    expand(head,list[head]);
  until (head>=foot) or (foot>max) or found;
 { writeln(head,' ',foot);
     for i:=1 to foot do
      writea(list[i].state);  }
  if found
     then begin
           writeln(best);
           print(answer);
          end
     else writeln('No Answer');
  close(input);
  close(output);
end.


