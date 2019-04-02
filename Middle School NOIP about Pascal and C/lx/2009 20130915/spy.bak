Program spy;
Var
  xu,yuan,jiami:array[1..100] of char;
  pan,duiying1,duiying2:array[1..26] of char;
  i,j:integer;
  m,o,k,k1,k2:integer;
Begin
  assign(input,'spy.in');
  assign(output,'spy.out');
  reset(input);
  rewrite(output);
  readln(jiami);
  readln(yuan);
  readln(xu);
  m:=length(jiami);
  o:=length(xu);
  fillchar(pan,sizeof(pan),'0');
  fillchar(duiying1,sizeof(duiying1),'0');
  fillchar(duiying2,sizeof(duiying2),'0');
  for i:=1 to m do
  begin
    k:=ord(jiami[i])-65+1;
    if pan[k]='0' then
    begin
      duiying2[k]:=yuan[i];
      pan[k]:='1';
    end
    else if duiying2[k]<>yuan[i] then begin writeln(i,' ',k,' ','1Failed'); close(input);close(output);halt; end;
  end;
  for i:=1 to m do duiying1[ord(yuan[i])-65+1]:='1';
  for i:=1 to 26 do if duiying1[i]='0' then begin writeln('2Failed');close(input);close(output);halt;end;
  for i:=1 to o do
  begin
    k:=ord(xu[i])-65+1;
    write(duiying2[k]);
  end;
  close(input);
  close(output);
End.
