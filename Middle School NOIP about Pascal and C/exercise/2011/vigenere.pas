Program Vigenere;
Const
  infile='vigenere.in';
  outfile='vigenere.out';
Var
  a,b,c:string;
  la,lb,lc,k,w:longint;
  flag:boolean;
  i:longint;
Begin
  Assign(input,infile);
  Assign(output,outfile);
  reset(input);
  rewrite(output);
  // [(ord('$')-64+ord('$')-64-1) mod 26 + 65 - 1];
  // ord('$') + 1 - 65 (+ 26) + 1 - ord('$')+64+64;
  readln(a); la:=length(a);
  readln(b); lb:=length(b);
  a:=upcase(a); k:=1; w:=0;
  for i:=1 to lb do
  begin
    flag:=true;
    //first,judge b[i] de fanwei (65 or 97);
    if b[i]>='a' then flag:=false;
    b[i]:=upcase(b[i]);
    //translate;
    //'Z' de judgement;because (mod 26)<>26,consider about 'Z';
    if b[i]='Z' then begin c:=c+chr(ord(b[i])+1-ord(a[k])+64); inc(w); if (not flag) then c[w]:=lowercase(c[w]); inc(k); if k>la then k:=1;continue;end;
    c:=c+chr(ord(b[i])+1-65+1-ord(a[k])+64+64);
    inc(w);
    //the situation which need to add 26;
    if c[w]<'A' then c[w]:=chr(ord(b[i])+1-65+1+26-ord(a[k])+64+64);
    if (not flag) then c[w]:=lowercase(c[w]);
    inc(k);
    if k>la then k:=1;
  end;
  writeln(c);
  close(input);
  close(output);
End.