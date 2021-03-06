{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
{#######################################################
(A)0 - Ok!
(P)1 - �� ᮧ��� output.txt
(P)2 - �������� ����� ��ப� � output.txt
(P)3 - �������� ����騥 �㫨 � output.txt
(P)4 - �������� ����஢� ᨬ���� � output.txt
(W)5 - ���������騩 ����� ������� � output.txt
(W)6 - ���室 �� � �ᥤ��� �������
(W)7 - �����稫� �� �� m-�� �⠦�
(W)8 - ����⨬���� १����
#######################################################}
var
  i, j, n, m, x, y: LongInt;
  err: Integer;
  st: String;
  BestFloor:  array [1..500] of LongInt;
    {  ����� �⮨����� ��� �� ������ �������,
     � ��⮬ ��諨�� �����祭��� � ������ ������.}
  CurrentFloor: array [1..500] of LongInt;
    {  ������ ��諨��, ��묠���� � ������ ������.}
  tstf,       {����㥬� �� �ࠢ��쭮��� 䠩�-�⢥�}
  inf,        {�室��� 䠩� ���}
  resf: Text; {䠩�-���᭥��� � १���⠬� �஢�ન}
  BestSum: LongInt;   {�������� ����筠� �㬬�}
  CurrentSum: LongInt;{�㬬� ���������� � ������� 䠩��-�襭��}

BEGIN
  FillChar(BestFloor, SizeOf(BestFloor), 0);
  Assign(inf, 'input.txt');
  Assign(resf, 'result.txt');
  {$I-}
  Append(resf);  Close(resf);
  {$I+}
  if (IOResult <> 0) then
    Rewrite(resf)
  else
    Append(resf);
  Assign(tstf, 'output.txt');
  {$I-}
  Reset(tstf);  Close(tstf);
  {$I+}
  if (IOResult <> 0) then
    begin  {�� ᮧ��� output.txt}
      Writeln(resf, '(P)Error 1 - �� ᮧ��� output.txt');
      Writeln('(P)Error 1 - �� ᮧ��� output.txt');
      Flush(resf);  Close(resf);
      Halt(1);
    end;
  Reset(inf);
  Readln(inf, m, n);

  i := 0;   y := 0;
  Reset(tstf);
  while NOT EOF(tstf) do
    begin
      readln(tstf, st);
      if (length(st)=0) then
        begin  {�������� ����� ��ப� � output.txt}
          Writeln(resf, '(P)Error 2 - �������� ����� ��ப� � output.txt');
          Writeln('(P)Error 2 - �������� ����� ��ப� � output.txt');
          Flush(resf);  Close(resf);  Close(tstf);  Close(inf);
          Halt(2);
        end;
      if (st[1]='0') then
        begin  {�������� ����騥 �㫨 � output.txt}
          Writeln(resf, '(P)Error 3 - �������� ����騥 �㫨 � output.txt');
          Writeln('(P)Error 3 - �������� ����騥 �㫨 � output.txt');
          Flush(resf);  Close(resf);  Close(tstf);  Close(inf);
          Halt(3);
        end;
      for j:=1 to length(st) do
        if NOT(st[j] in ['0'..'9']) then
          begin  {�������� ����஢� ᨬ���� � output.txt}
            Writeln(resf, '(P)Error 4 - �������� ����஢� ᨬ���� � output.txt');
            Writeln('(P)Error 4 - �������� ����஢� ᨬ���� � output.txt');
            Flush(resf);  Close(resf);  Close(tstf);  Close(inf);
            Halt(4);
          end;
      if (length(st)>3) then
        begin  {���������騩 ����� ������� � output.txt}
          Writeln(resf, '(W)Error 5 - ���������騩 ����� ������� � output.txt');
          Writeln('(W)Error 5 - ���������騩 ����� ������� � output.txt');
          Flush(resf);  Close(resf);  Close(tstf);  Close(inf);
          Halt(5);
        end;
      val(st, x, err);
      if (x<1)OR(x>n) then
        begin  {���������騩 ����� ������� � output.txt}
          Writeln(resf, '(W)Error 5 - ���������騩 ����� ������� � output.txt');
          Writeln('(W)Error 5 - ���������騩 ����� ������� � output.txt');
          Flush(resf);  Close(resf);  Close(tstf);  Close(inf);
          Halt(5);
        end;
      if (ABS(y-x)>1)AND(y<>0) then
        begin  {���室 �� � �ᥤ��� �������}
          Writeln(resf, '(W)Error 6 - ���室 �� � �ᥤ��� �������');
          Writeln('(W)Error 6 - ���室 �� � �ᥤ��� �������');
          Flush(resf);  Close(resf);  Close(tstf);  Close(inf);
          Halt(6);
        end;
      if (x=y)OR(y=0) then Inc(i);
      y := x;
    end;
  if (i<>m) then
    begin  {�����稫� �� �� m-�� �⠦�}
      Writeln(resf, '(W)Error 7 - �����稫� �� �� m-�� �⠦�');
      Writeln('(W)Error 7 - �����稫� �� �� m-�� �⠦�');
      Flush(resf);  Close(resf);  Close(tstf);  Close(inf);
      Halt(7);
    end;
  {�������᪨ ������塞 ���ᨢ ��⨬����� ��⥩ �� ������ �������}
  {�஢��塞 ������� �� output.txt �� ᮮ⢥��⢨� �ࠢ���� ��室� ������}
  CurrentSum := 0; {�㬬� �� �室� � ������}
  Reset(tstf);
  Readln(tstf, x);
  y := 0;
  for i:=1 to m do{��� ������� �⠦� �믮��塞...}
    begin
      for j:=1 to n do
        begin
          Read(inf, CurrentFloor[j]);{��⠥� ����稭� ��諨� �� ⥪�饬 �⠦�}
          Inc(BestFloor[j], CurrentFloor[j]);{"�����������" � �।���. �⠦�}
        end;
      Readln(inf);

      {�饬 ������� � ����� ��� ��襢�� �਩� ᫥�� 祬 ᭨��.}
      for j:=2 to n do
        if (BestFloor[j-1]+CurrentFloor[j] < BestFloor[j]) then
          {�᫨ ��� ��襢�� ���� ᫥��...}
          BestFloor[j] := BestFloor[j-1] + CurrentFloor[j];{������ �㬬�}

      {�饬 ������� � ����� ��� ��襢�� �਩� �ࠢ� 祬 ᭨�� � ᫥��.}
      for j:=n-1 downto 1 do
        if (BestFloor[j+1]+CurrentFloor[j] < BestFloor[j]) then
          {�᫨ ��� ��襢�� ���� �ࠢ�...}
          BestFloor[j] := BestFloor[j+1] + CurrentFloor[j];{������ �㬬�}

      {�㬬��㥬 �ன����� �������}
      Inc(CurrentSum, CurrentFloor[x]);
      while NOT EOF(tstf) do
        begin
          y := x;
          Readln(tstf, x);
          if (x=y) then
            break
          else
            Inc(CurrentSum, CurrentFloor[x]);
        end;
    end;
  Close(inf);

  {��室�� �⮨����� ᠬ��� ��襢��� ��� �ਢ��襣� ��� �� ��᫥���� �⠦}
  BestSum := BestFloor[1];
  for i:=2 to n do
    if (BestFloor[i] < BestSum) then   BestSum := BestFloor[i];
  {�஢��塞 ��⨬��쭮��� ����筮� �㬬� ��諨�}
  if (BestSum<CurrentSum) then
    begin  {����⨬���� १����}
      Writeln(resf, '(W)Error 8 - ����⨬���� १���� ', CurrentSum,
                                 ' ����� ',BestSum);
      Writeln('(W)Error 8 - ����⨬���� १���� ', CurrentSum,
                                 ' ����� ',BestSum);
      Flush(resf);  Close(resf);  Close(tstf);
      Halt(8);
    end;
  Writeln(resf, '(A)0 - Ok!');
  Writeln('(A)0 - Ok!');
  Close(tstf);
  Flush(resf);
  Close(resf);
END.