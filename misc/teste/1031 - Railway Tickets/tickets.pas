{��⨬��쭮� �襭�� �����}
type
  AType = array[1..10000] of LongInt;

var 
  A: ^AType;  {�������ࠦ �� �⠭権}
  B: ^AType;  {��⨬���� "�㡫�" �� �⠭権}
  i1, i2, i3, 
  l1, l2, l3, {業��� ����}
  c1, c2, c3, {�⮨����� ����� � ������ 業���� ����}
  i, j, n,
  x1, x2: LongInt;
  inf, outf: Text;

BEGIN
  Assign(inf, 'input.txt');  Reset(inf);
  Assign(outf, 'output.txt');  Rewrite(outf);
  New(A);
  New(B);  FillChar(B^, SizeOf(AType), 0);
  Readln(inf, l1, l2, l3,  {業��� ����}
              c1, c2, c3);  {�⮨����� ����� � ������ 業���� ����}
  Readln(inf, n);  {���-�� �⠭権}
  Readln(inf, x1, x2);  {��砫쭠� � ����筠� �⠭樨}
  if (x1<x2) then
    begin  i:=x1; j:=x2;  end
  else
    begin  i:=x2; j:=x1;  end;
  x1 := i;
  x2 := j; 
  A^[1] := 0;
  for i:=2 to n do
    Readln(inf, A^[i]); {�������ࠦ �� �⠭権}
  i1 := x1;   i2 := x1;  i3 := x1; 
  for i:=x1+1 to x2 do
    begin
      while (A^[i]-A^[i1])>l1 do Inc(i1);
      while (A^[i]-A^[i2])>l2 do Inc(i2);
      while (A^[i]-A^[i3])>l3 do Inc(i3);
      B^[i] := B^[i3] + c3;
      if (i<>i2) then 
        if (B^[i2]+c2)<B^[i] then   B^[i] := B^[i2] + c2;
      if (i<>i1) then 
        if (B^[i1]+c1)<B^[i] then   B^[i] := B^[i1] + c1;
    end; 
  Writeln(outf, B^[x2]);
  flush(outf);
  close(outf);
END.
  