{
asd
E
}
Program Divide_Sum;
{�ணࠬ�� ��室�� ���������⢮ �ᥫ � ������ n-������⭮� ������⢥,
�㬬� ������⮢ � ���஬ ������� �� n}
Const
   nmax = 10000;
Type
   list = array[1..nmax] of integer;
Var
   a : list; {ᯨ᮪ �ᥫ � ��室��� ������⢥}
   r : list; {����� �ᥫ � ����� ���⪮�}
   n : integer;
   fin : text;
   i : integer; {����� �᫠ � ��室��� ������⢥}
   sum : longint;
   rs : integer;

Procedure outres(b : integer; e : integer);
{�뢮� १���� (��ன ��室)}
Var
   i : integer;
   fout : text;
Begin
   Assign(fout,'output.txt');
   Rewrite(fout);
   Writeln(fout,e-b+1);
   for i := b to e do
      Writeln(fout,a[i]);
   Close(fout);
   Halt(0)
End; {outres}

Begin
   Assign(fin,'input.txt');
   Reset(fin);
   Readln(fin,n);
   sum := 0;
   for i := 1 to n do
      r[i] := -1;
   for i := 1 to n do
      Begin
         readln(fin,a[i]);
         sum := sum + a[i];
         rs := sum mod n;
         if rs = 0 then
            Outres(1,i)
         else
            If r[rs] <> -1 then
               Outres(r[rs]+1,i)
            Else
               r[rs] := i
      End
End.