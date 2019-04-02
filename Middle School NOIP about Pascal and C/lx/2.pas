Program exam59;

type ma=(a,b,c);
     wk=1..3;
Const x: array[ma,wk] of integer

        =((4,3,3),(2,4,3),(4,5,2));

      m: integer=0;
Var dd: array[wk] of wk;

    i,j,k: wk;

    s: integer;

begin

  for i:=1 to 3 do

    for j:=1 to 3 do

      if j< >i then

        begin

          k:=6-i-j;

          s:=x[a,i]+x[b,j]+x[c,k];

          if s>m then

            begin

              m:=s;

              dd[1]:=i;

              dd[2]:=j;

              dd[3]:=k

            end

        end;

    for i:=1 to 3 do

      writeln(chr(64+i):8, dd[ i ]:8);

    writeln('最大效益 :' :12, m:4);

readln

end.
