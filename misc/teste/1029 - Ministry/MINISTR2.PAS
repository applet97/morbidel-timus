{---
asd
B
---}
{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
type
  TBestPath = array [1..25000] of Word;

var
  i, j, n, m, x: LongInt;
  BestDirection: array [1..100, 1..500] of ShortInt;
    {  ���ࠢ����� ����� ��⥩ � ������ �������:
     = 0 - �᫨ ��襢�� �਩� �� ������� ᭨��;
     = -1 - �᫨ ��襢�� �਩� �� ������� ᫥��;
     = 1 - �᫨ ��襢�� �਩� �� ������� �ࠢ�.
       �᫨ �⮨����� ��� �� ������ ������� � ����� ���� ���ࠢ�����
     ���������, � ��� �� ����� ��㤠 ���� � ������ �������,
     � ���祭�� BestDirection[i,j] ������ �� ���浪� ��ᬮ�७�� ������⮢.}
  BestFloor:  array [1..500] of LongInt;
    {  ����� �⮨����� ��� �� ������ �������,
     � ��⮬ ��諨�� �����祭��� � ������ ������.}
  CurrentFloor: array [1..500] of LongInt;
    {  ������ ��諨��, ��묠���� � ������ ������.}
  PBestPath: ^TBestPath;
    {  ���ᨢ ��� ॠ����樨 �⥪� � ���஬ �㤥�
     ����⠭���������� ��⨬���� ������� ��室� ������⮢.}
  inf, outf: Text;

BEGIN
  FillChar(BestDirection, SizeOf(BestDirection), 0);
  FillChar(BestFloor, SizeOf(BestFloor), 0);
  Assign(inf, 'input.txt');
  Reset(inf);
  Readln(inf, m, n);

  {�������᪨ ������塞 ���ᨢ ��⨬����� ��⥩ �� ������ �������}
  for i:=1 to m do{��� ������� �⠦� �믮��塞...}
    begin
      for j:=1 to n do
        begin
          Read(inf, CurrentFloor[j]);{��⠥� ����稭� ��諨� �� ⥪�饬 �⠦�}
          Inc(BestFloor[j], CurrentFloor[j]);{"�����������" � �।���. �⠦�}
          if (BestFloor[j]>1000000000) then
            BestFloor[j] := 1000000001; {�᫨ १���� �������� �� �����,
                                         � �������� ��९�������}
        end;
      Readln(inf);

      {�饬 ������� � ����� ��� ��襢�� �਩� ᫥�� 祬 ᭨��.}
      for j:=2 to n do
        if (BestFloor[j-1]+CurrentFloor[j] < BestFloor[j]) then
          begin {�᫨ ��� ��襢�� ���� ᫥��...}
            BestFloor[j] := BestFloor[j-1] + CurrentFloor[j];{������ �㬬�}
            BestDirection[i,j] := -1;{�⬥⪠ �������}
          end;

      {�饬 ������� � ����� ��� ��襢�� �਩� �ࠢ� 祬 ᭨�� � ᫥��.}
      for j:=n-1 downto 1 do
        if (BestFloor[j+1]+CurrentFloor[j] < BestFloor[j]) then
          begin {�᫨ ��� ��襢�� ���� �ࠢ�...}
            BestFloor[j] := BestFloor[j+1] + CurrentFloor[j];{������ �㬬�}
            BestDirection[i,j] := 1;{�⬥⪠ �������}
          end;
    end;
  Close(inf);

  {��室�� ᠬ� ��襢� ����(�� �� ���) �ਢ��訩 ��� �� ��᫥���� �⠦}
  {��室�� ������� � ���஬ ����稫�� ᠬ� ��襢� �������}
  j := 1;{�������}
  for i:=2 to n do
    if (BestFloor[i] < BestFloor[j]) then  j := i;
  {����⠭�������� ������� ᢥ���-���� � ������� BestDirection}
  i := m;{�⠦}
  x := 0;{���-�� ������⮢ � �⥪�}
  New(PBestPath);{�࣠���㥬 �⥪}
  while (i>=1) do {���� "�� ��諨 �� ������"}
    begin
      Inc(x);
      PBestPath^[x] := j;{����� ⥪�饣� ������� � �⥪}
      if (BestDirection[i, j] = 0) then
        Dec(i) {��᪠���� �� �⠦}
      else
        if (BestDirection[i, j] = -1) then
          Dec(j) {���� �����}
        else
          Inc(j); {���� ��ࠢ�}
    end;

  {�뢮��� ����� ������ �� �⥪�}
  Assign(outf, 'output.txt');
  Rewrite(outf);
  for i:=x downto 1 do
    Writeln(outf, PBestPath^[i]);
  Flush(outf);
  Close(outf);
  Dispose(PBestPath);
END.
