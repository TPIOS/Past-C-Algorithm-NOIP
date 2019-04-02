Program Qiugen;
uses crt;
Var
  a,b,c,d:real;
  x1,x2:real;
  m,n:real;
  t,k:real;
  y,s,q:integer;
  v:integer;
Begin
  s:=1;
  While s<>0 do
  Begin
    clrscr;
    WriteLn('Here is the introduction of this application!');
    WriteLn('If you want to skip this, press 1.If you want to look the introductions,press 2.');
    Read(y);
    if y=2 then
      begin
       WriteLn('First you will be asked to input four numbers.');
       WriteLn('These 4 numbers will make a function like ax^2+bx+c=d.');
       WriteLn('Your first number is a,and then b,c,d.');
       WriteLn('The computer will first tell you if there is any answers to the function.');
       WriteLn('Then you can follow the introduction to do anything (only this application supports) you want to do!');
       WriteLn('Now we begin!!');
       WriteLn('Input 4 numbers.');
       Read(a,b,c,d);
       k:=c-d;
       t:=b*b-4*a*k;
       if t>=0 then
         Begin
           WriteLn('This function has got answer.');
           WriteLn('Do you want to see the answer? If yes,then press 1;else press 2.');
           Read(v);
           if v=1 then
             Begin
               x1:=(-b-sqrt(t))/(2*a);
               x2:=(-b+sqrt(t))/(2*a);
               WriteLn(x1,x2);
               WriteLn('$_$');
               WriteLn('Do you want to know x1+x2 & x1*x2 ? If yes press 1;else press 2.');
               Read(q);
               if q=1 then
                 begin
                   m:=x1+x2;
                   n:=x1*x2;
                   WriteLn('The first number is x1+x2, the second is x1*x2 !!');
                   WriteLn(m,n);
                 end
               else
                 WriteLn('Thanks.^_^');
             End
           else
             Writeln('That is OK.-_-!');
         End
       else
         WriteLn('This function has no answers!');
       ReadLn;
       WriteLn('Do you want to do it again ? If you want press 1,else press 0.');
       Read(s);
     end
   else
      begin
        WriteLn('Input 4 numbers.');
        Read(a,b,c,d);
        k:=c-d;
        t:=b*b-4*a*k;
        if t>=0 then
          Begin
            WriteLn('This function has got answer.');
            WriteLn('Do you want to see the answer? If yes,then press 1;else press 2.');
            Read(v);
            if v=1 then
              Begin
                x1:=(-b-sqrt(t))/(2*a);
                x2:=(-b+sqrt(t))/(2*a);
                WriteLn(x1,x2);
                WriteLn('$_$');
              End
               Else
              Writeln('That is OK.-_-!');
          End
        else
          WriteLn('This function has no answers!');
      ReadLn;
      WriteLn('Do you want to do it again ? If you want press 1,else press 0.');
      Read(s);
    End;
  End;
  WriteLn('Thanks for using!!');
  ReadLn;
End.

