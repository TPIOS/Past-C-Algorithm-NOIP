Program expand;
Const
  infile='expand.in';
  outfile='expand.out';
Var
  p1,p2,p3:integer;
  x,y:string;
  n,k:longint;
  i,j,o:integer;
Begin
  Assign(input,infile);
  Assign(output,outfile);
  reset(input);
  rewrite(output);
  readln(p1,p2,p3);
  read(x);
  n:=length(x);
  k:=1;
  for i:=1 to n do
  begin
    if x[i]<>'-' then
      begin y[k]:=x[i];inc(k); end
    else
    begin
      if (ord(x[i-1])>=97) and (ord(x[i+1])>=97) and (ord(x[i-1])<ord(x[i+1]))then
      begin
        if p3=1 then
          for j:=ord(x[i-1])+1 to ord(x[i+1])-1 do
          begin
            if p1=1 then for o:=1 to p2 do begin y[k]:=chr(j);inc(k);end;
            if p1=2 then for o:=1 to p2 do begin y[k]:=chr(j-32);inc(k);end;
            if p1=3 then for o:=1 to p2 do begin y[k]:='*';inc(k);end;
          end;
        if p3=2 then
          for j:=ord(x[i+1])-1 downto ord(x[i-1])+1 do
          begin
            if p1=1 then for o:=1 to p2 do begin y[k]:=chr(j);inc(k);end;
            if p1=2 then for o:=1 to p2 do begin y[k]:=chr(j-32);inc(k);end;
            if p1=3 then for o:=1 to p2 do begin y[k]:='*';inc(k);end;
          end;
        continue;
      end;
      if (ord(x[i-1])<=57) and (ord(x[i+1])<=57) and (ord(x[i-1])<ord(x[i+1])) then
      begin
        if p3=1 then
          for j:=ord(x[i-1])+1 to ord(x[i+1])-1 do
          begin
            if (p1=1) or (p1=2) then for o:=1 to p2 do begin y[k]:=chr(j);inc(k);end;
            if p1=3 then for o:=1 to p2 do begin y[k]:='*';inc(k);end;
          end;
        if p3=2 then
          for j:=ord(x[i+1])-1 downto ord(x[i-1])+1 do
          begin
            if (p1=1) or (p1=2) then for o:=1 to p2 do begin y[k]:=chr(j);inc(k);end;
            if p1=3 then for o:=1 to p2 do begin y[k]:='*';inc(k);end;
          end;
        continue;
      end;
      y[k]:='-';inc(k);
    end;
  end;
  //writeln(k);
  for i:=1 to k do write(y[i]);
  close(input);
  close(output);
End.