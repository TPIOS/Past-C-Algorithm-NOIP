program liangshui;
const
  max=600000;
  ma=100;
  mb=16;
  mc=7;
  dest=2;
type
    tlist=record
     father:longint;
     a:integer;
     b:integer;
     c:integer;
    end;
var
  list:array[0..max] of tlist;
  head,foot,best,i:longint;
  answer,sum:longint;
  found:boolean;
procedure init;
  var
    i:byte;
  begin
    fillchar(list,sizeof(list),0);
    found:=false;
    head:=0;
    foot:=1;
    with list[1] do
      begin
        a:=ma;
        b:=0;
        c:=0;
        father:=0;
      end;
  end;
function notappear(newv:tlist):boolean;
  var
    i:longint;
  begin
    notappear:=false;
    for i:=1 to foot do
      if (newv.a=list[i].a) and (newv.b=list[i].b) and (newv.c=list[i].c)
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
procedure expand(index:longint;var oldv:tlist);
  var
    i,x:integer;
    newv:tlist;
  begin
    for i:=1 to 6 do
     begin
       case i of
         1:if (oldv.a<>0) and (oldv.b<>mb) then    {a>>>b}
             begin
               x:=mb-oldv.b;
               if oldv.a>=x then begin newv.a:=oldv.a-x;newv.b:=mb; newv.c:=oldv.c;end
               else begin newv.a:=0;newv.b:=oldv.b+oldv.a;newv.c:=oldv.c;end;
             end;
         2:if (oldv.a<>0) and (oldv.c<>mc) then       {a>>>c}
             begin
               x:=mc-oldv.c;
               if oldv.a>=x then begin newv.a:=oldv.a-x;newv.c:=mc; newv.b:=oldv.b;end
               else begin newv.a:=0;newv.c:=oldv.c+oldv.a;newv.b:=oldv.b;end;
             end;
         3:if oldv.b<>0 then    {b>>>a}
             begin
                newv.a:=oldv.a+oldv.b; newv.b:=0; newv.c:=oldv.c;
             end;
         4:if (oldv.b<>0) and (oldv.c<>mc) then       {b>>>c}
             begin
               x:=mc-oldv.c;
               if oldv.b>=x then begin newv.b:=oldv.b-x; newv.c:=mc; newv.a:=oldv.a;end
               else begin newv.b:=0;newv.c:=oldv.c+oldv.b;newv.a:=oldv.a;end;
             end;
         5:if oldv.c<>0 then    {c>>>a}
             begin
                newv.a:=oldv.a+oldv.c; newv.c:=0; newv.b:=oldv.b;
             end;
         6:if (oldv.c<>0) and (oldv.b<>mb) then       {c>>>b}
             begin
               x:=mb-oldv.b;
               if oldv.c>=x then begin newv.c:=oldv.c-x; newv.b:=mb; newv.a:=oldv.a;end
               else begin newv.c:=0;newv.b:=oldv.b+oldv.c;newv.a:=oldv.a;end;
             end;
       end;
       newv.father:=index;
       add(newv);
     end;
  end;
procedure print(index:longint);
  var
    i,j:byte;
  begin
    if index=0  then exit;
    inc(sum);
    print(list[index].father);
    writeln(list[index].a,' ',list[index].b,' ',list[index].c);
  end;
begin{main}
  init;
  sum:=-1;
  repeat
    inc(head);
    if (list[head].a=dest) or (list[head].b=dest) or (list[head].c=dest) then
      begin
        found:=true;
        answer:=head;
        break;
      end;
    expand(head,list[head]);
    {writeln(list[head].a,' ',list[head].b);}
  until (head>=foot) or (foot>max) or found;
   if found
     then begin
           print(answer);
           writeln('sum=',sum);
          end
     else writeln('No Answer');
   readln;
end.

