高精度系列(High Precision) by tenshi
HP1 高精度 1 : 加法
HP2 高精度 2 : 减法
HP3 高精度 3 : 乘法 1 : 高精度数 x 单精度数
HP4 高精度 4 : 乘法 2 : 高精度数 x 高精度数
HP5 高精度 5 : 除法 1 : 高精度数 / 单精度数
HP6 高精度 6 : 除法 2 : 高精度数 / 高精度数

HP1
{
  Author    : tenshi
  Date      : 2002-03-10
  Problem   : High Precision --- Plus
  Algorithm : simple
  Input     : two lines, each line a positive HighPrecision Number
  Output    : Sum of the two HighPrecision Numbers
}
program HighPrecision1_Plus;
const
  fn_inp='hp1.inp';
  fn_out='hp1.out';
  maxlen=100;  { max length of the number }
type
  hp=record
       len:integer; { length of the number }
       s:array[1..maxlen] of integer
       { s[1]   is the lowest  position
         s[len] is the highest position }
     end;
var
  x:array[1..2] of hp;
  y:hp; { x:input ; y:output }

  procedure PrintHP(const p:hp);
  var i:integer;
  begin
    for i:=p.len downto 1 do write(p.s[i]);
  end;

  procedure init;
  var
    st:string;
    j,i:integer;
  begin
    assign(input,fn_inp);
    reset(input);
    for j:=1 to 2 do
    begin
      readln(st);
      x[j].len:=length(st);
      for i:=1 to x[j].len do { change string to HP }
        x[j].s[i]:=ord(st[x[j].len+1-i])-ord('0');
    end;
    close(input);
  end;

  procedure Plus(a,b:hp;var c:hp); { c:=a+b }
  var i,len:integer;
  begin
    fillchar(c,sizeof(c),0);
    if a.len>b.len then len:=a.len  { get the bigger length of a,b }
                   else len:=b.len;
    for i:=1 to len do { plus from low to high }
    begin
      inc(c.s[i],a.s[i]+b.s[i]);
      if c.s[i]>=10 then
      begin
        dec(c.s[i],10);
        inc(c.s[i+1]); { add 1 to a higher position }
      end;
    end;
    if c.s[len+1]>0 then inc(len);
    c.len:=len;
  end;

  procedure main;
  begin
    Plus(x[1],x[2],y);
  end;

  procedure out;
  begin
    assign(output,fn_out);
    rewrite(output);
    PrintHP(y);
    writeln;
    close(output);
  end;

  begin
    init;
    main;
    out;
  end.

HP2
{
  Author    : tenshi
  Date      : 2002-03-10
  Problem   : High Precision --- Subtract
  Algorithm : simple
  Input     : two lines, each line a positive HighPrecision Number
  Output    : different of the two HighPrecision Numbers
}
program HighPrecision2_Subtract;
const
  fn_inp='hp2.inp';
  fn_out='hp2.out';
  maxlen=100;  { max length of the number }
type
  hp=record
       len:integer; { length of the number }
       s:array[1..maxlen] of integer
       { s[1]   is the lowest  position
         s[len] is the highest position }
     end;
var
  x:array[1..2] of hp;
  y:hp; { x:input ; y:output }
  positive:boolean;

  procedure PrintHP(const p:hp);
  var i:integer;
  begin
    for i:=p.len downto 1 do write(p.s[i]);
  end;

  procedure init;
  var
    st:string;
    j,i:integer;
  begin
    assign(input,fn_inp);
    reset(input);
    for j:=1 to 2 do
    begin
      readln(st);
      x[j].len:=length(st);
      for i:=1 to x[j].len do { change string to HP }
        x[j].s[i]:=ord(st[x[j].len+1-i])-ord('0');
    end;
    close(input);
  end;

  procedure Subtract(a,b:hp;var c:hp); { c:=a-b, suppose a>=b }
  var i,len:integer;
  begin
    fillchar(c,sizeof(c),0);
    if a.len>b.len then len:=a.len  { get the bigger length of a,b }
                   else len:=b.len;
    for i:=1 to len do { subtract from low to high }
    begin
      inc(c.s[i],a.s[i]-b.s[i]);
      if c.s[i]<0 then
      begin
        inc(c.s[i],10);
        dec(c.s[i+1]); { add 1 to a higher position }
      end;
    end;
    while(len>1) and (c.s[len]=0) do dec(len);
    c.len:=len;
  end;

  function Compare(const a,b:hp):integer;
  {
    1 if a>b
    0 if a=b
   -1 if a<b
  }
  var len:integer;
  begin
    if a.len>b.len then len:=a.len  { get the bigger length of a,b }
                   else len:=b.len;
    while(len>0) and (a.s[len]=b.s[len]) do dec(len);
    { find a position which have a different digit }
    if len=0 then compare:=0 { no difference }
             else compare:=a.s[len]-b.s[len];
  end;

  procedure main;
  begin
    if Compare(x[1],x[2])<0 then positive:=false
                            else positive:=true;
    if positive then Subtract(x[1],x[2],y)
                else Subtract(x[2],x[1],y);
  end;

  procedure out;
  begin
    assign(output,fn_out);
    rewrite(output);
    if not positive then write('-');
    PrintHP(y);
    writeln;
    close(output);
  end;

  begin
    init;
    main;
    out;
  end.

HP3
{
  Author    : tenshi
  Date      : 2002-03-10
  Problem   : High Precision --- Multiply
  Algorithm : simple
  Input     : two lines,
              1st line : a positive HighPrecision Number
              2nd line : a positive Low Precicion Number
  Output    : product of the two Numbers
}
program HighPrecision3_Multiply1;
const
  fn_inp='hp3.inp';
  fn_out='hp3.out';
  maxlen=100;  { max length of the number }
type
  hp=record
       len:integer; { length of the number }
       s:array[1..maxlen] of integer
       { s[1]   is the lowest  position
         s[len] is the highest position }
     end;
var
  x,y:hp;    { x:input hp ; y:output }
  z:integer; { z:input lp }

procedure PrintHP(const p:hp);
  var i:integer;
  begin
    for i:=p.len downto 1 do write(p.s[i]);
  end;

  procedure init;
  var
    st:string;
    i:integer;
  begin
    assign(input,fn_inp);
    reset(input);
    readln(st);
    x.len:=length(st);
    for i:=1 to x.len do { change string to HP }
      x.s[i]:=ord(st[x.len+1-i])-ord('0');
    readln(z);
    close(input);
  end;

  procedure Multiply(a:hp;b:integer;var c:hp); { c:=a*b }
  var i,len:integer;
  begin
    fillchar(c,sizeof(c),0);
    len:=a.len;
    for i:=1 to len do
    begin
      inc(c.s[i],a.s[i]*b);
      inc(c.s[i+1],c.s[i] div 10);
      c.s[i]:=c.s[i] mod 10;
    end;
    inc(len);
    while(c.s[len]>=10) do
    begin
      inc(c.s[len+1],c.s[len] div 10);
      c.s[len]:=c.s[len] mod 10;
      inc(len);
    end;
    while(len>1) and (c.s[len]=0) do dec(len);
    c.len:=len;
  end;

  procedure main;
  begin
    Multiply(x,z,y);
  end;

  procedure out;
  begin
    assign(output,fn_out);
    rewrite(output);
    PrintHP(y);
    writeln;
    close(output);
  end;

  begin
    init;
    main;
    out;
  end.

HP4
{
  Author    : tenshi
  Date      : 2002-03-10
  Problem   : High Precision --- Multiply
  Algorithm : simple
  Input     : two lines, each line a positive HighPrecision Number
  Output    : product of the two HighPrecision Numbers
}
program HighPrecision4_Multiply2;
const
  fn_inp='hp4.inp';
  fn_out='hp4.out';
  maxlen=100;  { max length of the number }
type
  hp=record
       len:integer; { length of the number }
       s:array[1..maxlen] of integer
       { s[1]   is the lowest  position
         s[len] is the highest position }
     end;
var
  x:array[1..2] of hp;
  y:hp; { x:input ; y:output }

  procedure PrintHP(const p:hp);
  var i:integer;
  begin
    for i:=p.len downto 1 do write(p.s[i]);
  end;

  procedure init;
  var
    st:string;
    j,i:integer;
  begin
    assign(input,fn_inp);
    reset(input);
    for j:=1 to 2 do
    begin
      readln(st);
      x[j].len:=length(st);
      for i:=1 to x[j].len do { change string to HP }
        x[j].s[i]:=ord(st[x[j].len+1-i])-ord('0');
    end;
    close(input);
  end;

  procedure Multiply(a,b:hp;var c:hp); { c:=a+b }
  var i,j,len:integer;
  begin
    fillchar(c,sizeof(c),0);
    for i:=1 to a.len do
      for j:=1 to b.len do
      begin
        inc(c.s[i+j-1],a.s[i]*b.s[j]);
        inc(c.s[i+j],c.s[i+j-1] div 10);
        c.s[i+j-1]:=c.s[i+j-1] mod 10;
      end;
    len:=a.len+b.len+1;
    {
      the product of a number with i digits and a number with j digits
      can only have at most i+j+1 digits
    }
    while(len>1)and(c.s[len]=0) do dec(len);
    c.len:=len;
  end;

  procedure main;
  begin
    Multiply(x[1],x[2],y);
  end;

  procedure out;
  begin
    assign(output,fn_out);
    rewrite(output);
    PrintHP(y);
    writeln;
    close(output);
  end;

  begin
    init;
    main;
    out;
  end.

HP5
{
  Author    : tenshi
  Date      : 2002-03-10
  Problem   : High Precision --- Divide
  Algorithm : simple
  Input     : two lines,
              1st line : a positive HighPrecision Number
              2nd line : a positive Low Precicion Number
  Output    : times & rest of the two Numbers
}
program HighPrecision3_Multiply1;
const
  fn_inp='hp5.inp';
  fn_out='hp5.out';
  maxlen=100;  { max length of the number }
type
  hp=record
       len:integer; { length of the number }
       s:array[1..maxlen] of integer
       { s[1]   is the lowest  position
         s[len] is the highest position }
     end;
var
  x,y:hp;
  z,w:integer;

  procedure PrintHP(const p:hp);
  var i:integer;
  begin
    for i:=p.len downto 1 do write(p.s[i]);
  end;

  procedure init;
  var
    st:string;
    i:integer;
  begin
    assign(input,fn_inp);
    reset(input);
    readln(st);
    x.len:=length(st);
    for i:=1 to x.len do { change string to HP }
      x.s[i]:=ord(st[x.len+1-i])-ord('0');
    readln(z);
    close(input);
  end;

  procedure Divide(a:hp;b:integer;var c:hp;var d:integer);
  { c:=a div b ; d:=a mod b }
  var i,len:integer;
  begin
    fillchar(c,sizeof(c),0);
    len:=a.len;
    d:=0;
    for i:=len downto 1 do { from high to low }
    begin
      d:=d*10+a.s[i];
      c.s[i]:=d div b;
      d:=d mod b;
    end;
    while(len>1) and (c.s[len]=0) do dec(len);
    c.len:=len;
  end;

  procedure main;
  begin
    Divide(x,z,y,w);
  end;

  procedure out;
  begin
    assign(output,fn_out);
    rewrite(output);
    PrintHP(y);
    writeln;
    writeln(w);
    close(output);
  end;

  begin
    init;
    main;
    out;
  end.

HP6
{
  Author    : tenshi
  Date      : 2002-03-10
  Problem   : High Precision --- Divide
  Algorithm : simple
  Input     : two lines, each line a positive HighPrecision Number
  Output    : quotient & modulus of the two HighPrecision Numbers
}
program HighPrecision4_Multiply2;
const
  fn_inp='hp6.inp';
  fn_out='hp6.out';
  maxlen=100;  { max length of the number }
type
  hp=record
       len:integer; { length of the number }
       s:array[1..maxlen] of integer
       { s[1]   is the lowest  position
         s[len] is the highest position }
     end;
var
  x:array[1..2] of hp;
  y,w:hp; { x:input ; y:output }

  procedure PrintHP(const p:hp);
  var i:integer;
  begin
    for i:=p.len downto 1 do write(p.s[i]);
  end;

  procedure init;
  var
    st:string;
    j,i:integer;
  begin
    assign(input,fn_inp);
    reset(input);
    for j:=1 to 2 do
    begin
      readln(st);
      x[j].len:=length(st);
      for i:=1 to x[j].len do { change string to HP }
        x[j].s[i]:=ord(st[x[j].len+1-i])-ord('0');
    end;
    close(input);
  end;

  procedure Subtract(a,b:hp;var c:hp); { c:=a-b, suppose a>=b }
  var i,len:integer;
  begin
    fillchar(c,sizeof(c),0);
    if a.len>b.len then len:=a.len  { get the bigger length of a,b }
                   else len:=b.len;
    for i:=1 to len do { subtract from low to high }
    begin
      inc(c.s[i],a.s[i]-b.s[i]);
      if c.s[i]<0 then
      begin
        inc(c.s[i],10);
        dec(c.s[i+1]); { add 1 to a higher position }
      end;
    end;
    while(len>1) and (c.s[len]=0) do dec(len);
    c.len:=len;
  end;

  function Compare(const a,b:hp):integer;
  {
    1 if a>b
    0 if a=b
   -1 if a<b
  }
  var len:integer;
  begin
    if a.len>b.len then len:=a.len  { get the bigger length of a,b }
                   else len:=b.len;
    while(len>0) and (a.s[len]=b.s[len]) do dec(len);
    { find a position which have a different digit }
    if len=0 then compare:=0 { no difference }
             else compare:=a.s[len]-b.s[len];
  end;

procedure Multiply10(var a:hp); { a:=a*10 }
  var i:Integer;
  begin
    for i:=a.len downto 1 do
      a.s[i+1]:=a.s[i];
    a.s[1]:=0;
    inc(a.len);
    while(a.len>1) and (a.s[a.len]=0) do dec(a.len);
  end;

  procedure Divide(a,b:hp;var c,d:hp); { c:=a div b ; d:=a mod b }
  var i,j,len:integer;
  begin
    fillchar(c,sizeof(c),0);
    len:=a.len;
    fillchar(d,sizeof(d),0);
    d.len:=1;
    for i:=len downto 1 do
    begin
      Multiply10(d);
      d.s[1]:=a.s[i]; { d:=d*10+a.s[i] }
      { c.s[i]:=d div b ; d:=d mod b; }
      { while(d>=b) do begin d:=d-b;inc(c.s[i]) end }
      while(compare(d,b)>=0) do
      begin
        Subtract(d,b,d);
        inc(c.s[i]);
      end;
    end;
    while(len>1)and(c.s[len]=0) do dec(len);
    c.len:=len;
  end;

  procedure main;
  begin
    Divide(x[1],x[2],y,w);
  end;

  procedure out;
  begin
    assign(output,fn_out);
    rewrite(output);
    PrintHP(y);
    writeln;
    PrintHP(w);
    writeln;
    close(output);
    end;

  begin
    init;
    main;
    out;
  end.