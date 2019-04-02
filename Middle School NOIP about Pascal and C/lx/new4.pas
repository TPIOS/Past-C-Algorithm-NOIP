Program Exam66;

   Const  xx: array[1..4] of 1..2 =(1,2,2,1);

          yy: array[1..4] of -2..2=(2,1,-1,-2);

   Var p: integer;

      t, tt : array[0..10] of integer;

   procedure Prn(k: integer);

       Var i: integer;

       Begin

           inc(p);  write('< ', p: 2, ' > ', '  ':4, '0,0');

           for i:=1 to k do

               write('¡ª ( ', tt[ I ],',', t[ I ],  ')' );

           writeln

       End;

   Procedure Sub(k: integer);

       Var x1, y1, i: integer;

       Begin

           for I:=1 to 4 do

               Begin

                   x1:=tt[k-1]+xx[ i ];  y1:=t[k-1]+yy[ i ];

                   if not( (x1 > 8) or (y1 < 0) or (y1 > 4) ) then

                       Begin

                           tt[k]:=x1;  t[k]:=y1;

                           if (y1=4) and (x1=8) then prn(k);

                           sub(k+1);

                       end;

               end;

       end;

   Begin

       p:=0;  tt[0]:=0;  t[0]:=0;

       readln;
       sub(1);

       writeln('From 0,0 to 8,4  All of the ways are ', p);

       readln

   end.
