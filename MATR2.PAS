



procedure FirstRecord(n:Byte);
var m:TMatrix;s:string [3];i:byte;
begin if n=1 then exit;
m:=matrixes[n];s:=MNames[n];
for i:=n-1 downto 1 do
	  begin matrixes[i+1]:=matrixes[i];MNames[i+1]:=MNames[i] end;
matrixes[1]:=m;MNames[1]:=s
end;





Function SelectMatrix:Boolean;
Var w:TWindow;i,x:Byte;k:Char;bool:boolean;

Procedure On;
begin
textcolor(0);textbackground(3);
gotoxy((x-1)*5+w.x1+5,w.y1+2);
write(' ',MNames[x],' ');
end;

Procedure Off;
begin
textcolor(0);textbackground(7);
gotoxy((x-1)*5+w.x1+5,w.y1+2);
write(' ',MNames[x],' ');
end;



Begin
If CurNumMatrix=0 then
  begin
   bool:=Message(' Не определено ни одной матрицы ');
   SelectMatrix:=False;exit
 end;
x:=1;
w.x1:=5;
w.y1:=5;
w.y2:=w.y1+4;
w.x2:=w.x1+11+3*CurNumMatrix+2*(CurNumMatrix-1);
W.colors[1]:=0;w.colors[2]:=7;
W.colors[3]:=15;w.colors[4]:=4;
w.border:=border2;
w.title:=' Матрицы ';
OpenWindow(w);
TextColor(0);TextBackground(7);
For i:=1 to CurNumMatrix do
	 begin gotoxy((i-1)*5+w.x1+6,w.y1+2);Write(MNames[i]) end;
on;



while true do begin
  k:=readkey;
  case ord(k) of
	27:begin CloseWindow(w);SelectMatrix:=false;exit end;
	13:begin CloseWindow(w);firstrecord(x);
			  if x=1 then SelectMatrix:=false else SelectMatrix:=True;
			  exit end;

	 0:begin k:=readkey;
		 case ord(k) of
		  { 65:NewMatrix;
		   66:DeleteMatrix;}
		   75:begin off;x:=x-1;if x=0 then x:=curnumMatrix;on end;
		   77:begin off;x:=x+1;if x>curnummatrix then x:=1;on end
		 end
	   end
  end
end
end;




Function NewMatrix:boolean;
Var B:Boolean;w:TWindow;i,j:integer;
Begin
gotoxy(20,10);
if CurNumMatrix=10 then
  if Question('Список матриц полон. Удалить Матрицу '+MNames[10])
	then CurnumMatrix:=Curnummatrix-1
	else
	  begin
		newMatrix:=false;
		exit
	  end;


w.x1:=25;w.y1:=10;
w.x2:=w.x1+29;w.y2:=w.y1+8;
W.colors[1]:=0;w.colors[2]:=7;
w.colors[3]:=15;w.colors[4]:=4;
w.border:=border2;
w.title:=' Новая матрица ';
OpenWindow(w);
Textcolor(0);
Textbackground(7);Gotoxy(w.x1+9,w.y1+2);Write('Имя матрицы  ');
TextBackground(3);ShowInput(sn1,3);
Textbackground(7);Gotoxy(w.x1+8,w.y1+4);Write('Кол-во строк  ');
TextBackground(3);ShowInput(sn2,2);
Textbackground(7);Gotoxy(w.x1+5,w.y1+6);Write('Кол-во столбцов  ');
TextBackground(3);ShowInput(sn3,2);

Gotoxy(w.x1+22,w.y1+2);
i:=Input(sn1,3,true);
if i=0 then begin newmatrix:=false;CloseWindow(w);exit end;

Gotoxy(w.x1+22,w.y1+4);
i:=Input(sn2,2,false);
if i=0 then begin newmatrix:=false;CloseWindow(w);exit end;

Gotoxy(w.x1+22,w.y1+6);
i:=Input(sn3,2,false);
if i=0 then begin newmatrix:=false;CloseWindow(w);exit end;

curnummatrix:=CurNumMatrix+1;
FirstRecord(CurnumMatrix);
MNames[1]:=Sn1;
Val(Sn2,Matrixes[1].n,i);
Val(Sn3,Matrixes[1].m,i);
if matrixes[1].n>10 then Matrixes[1].n:=10;
if matrixes[1].m>10 then Matrixes[1].m:=10;
if matrixes[1].n<1 then Matrixes[1].n:=1;
if matrixes[1].m<1 then Matrixes[1].m:=1;
For i:=1 to Matrixes[1].n do
  for j:=1 to Matrixes[1].m  do
		 Matrixes[1].body[i,j]:=0;



CloseWindow(w);
end;


Function DeleteMatrix:Boolean;
Var i:Byte;
Begin
DeleteMatrix:=False;
if curnummatrix=0 then exit;
gotoxy(20,10);
if Question('Удалить матрицу  '+MNames[1])
	  then
		Begin
		   mwb:=false;
		   closeWindow(mw);
		   if curnummatrix<2 then begin curnummatrix:=0;exit end;
		   for i:=2 to curnummatrix do
			 begin
			   MNames[i-1]:=MNames[i];
			   Matrixes[i-1]:=Matrixes[i];
			 end;
		   curnummatrix:=curnummatrix-1;
		   deletematrix:=true;
		end

end;