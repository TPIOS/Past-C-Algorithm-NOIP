  Program Exam65;

    Var x,y,z :  char;

       N, k : integer;

    Procedure  sub(n: integer; a, c , b: char);

      begin

        if n=0 then exit;

        sub(n-1, a,b,c);

        inc(k);

        writeln(k,':from:',a,'-->', c);

        sub(n-1,b,c,a);

    end;

  begin

    write('n='); readln(n);

    k:=0;

    x:='A'; y:='B'; Z:='C';

    sub(n,x,z,y);

    readln

  end.
