Uses
	   Crt,Dos,Alex;
Const
	   MaxMatrixSize=10;
	   MaxMatrix=10;
	   Field=6;
Type
	   TMatrixBody=array[1..MaxMatrixSize,1..MaxMatrixSize] of Integer;
       TMatrix=record
		  Body:TMatrixBody;
		  n,m:1..MaxMatrixSize;     { size of matrix }
	   end;

Var
	Matrixes   :    array [1..MaxMatrix] of TMatrix;
	MNames     :    array [1..MaxMatrix] of String [3];
	SelectStr  :    array [1..MaxMatrixSize] of boolean;
	SelectStb  :    array [1..MaxMatrixSize] of boolean;


	n:1..MaxMatrixSize;
	u:byte;   sd:string;
	o:boolean;
	gd:boolean;  {good det}

Const    CurNumMatrix:Byte=0;

		 mwb   :boolean=false;
		 Change:boolean=true;
		 mw:TWindow=(x1:1;y1:2;x2:30;y2:10;
				  title:' Это Матрица ';
				  Colors:(4,9,15,4,0,0);border:Border2);

		 sn1:String ='   ';
		 sn2:String ='  ';
		 sn3:String ='  ';
		 Sk :String ='      ';
		 i:byte=1;j:byte=1;


{$I c:\tp\Matrix\det3.pas}
{$i c:\tp\Matrix\matr2.pas}
{$i c:\tp\matrix\matr3.pas}
{$I c:\tp\matrix\matr.pas}
{$I c:\tp\Matrix\menu.inc}

BEGIN
initmenu;
desktop({font8x8+}co80,'░');
showmainmenu;
textcolor(4);textbackground(7);
gotoxy(2,25);
{Write('F1');textcolor(0);write('-Помощь  ');}
textcolor(4);write('Ins');
textcolor(0);write('-Пометить строку  ');
textcolor(4);write('Shift-Ins');
textcolor(0);write('-Пометить столбец  ');
textcolor(4);write('F10');
textcolor(0);write('-Меню');


while true do begin
   o:=domenu;
	Change:=false;
   if o then
	  begin
		case curopc of
		  5:begin textcolor(7);textbackground(0);clrscr;setnormalcursor;exit end;
		  1:case menus[curopc].cur of
			2:Change:=selectmatrix;
			1:Change:=NewMatrix;
			3:Change:=DeleteMatrix;
			end;
		  2:if mwb then
			case menus[curopc].cur of
			1:Change:=kf6;
			2:Change:=kf5;
			3:Change:=kf3;
			4:Change:=kf4;
			end;
		  3:if mwb then
			case menus[curopc].cur of
			1:Change:=ksf6;
			2:Change:=ksf5;
			3:Change:=ksf3;
			4:Change:=ksf4;
			end;
		  4:if mwb then
			case menus[curopc].cur of
			1:kf9;
			2:Mult;
			3:Change:=AddMatrix;
			4:kf7;
			5:TransPon;
			6:Spur;
			end;

		end;
	  end;


if Change then
  begin
	if mwb then CloseWindow(mw);
	mw.x1:=1; mw.y1:=2; mw.y2:=mw.y1+1+3+matrixes[1].n;
	mw.x2:=mw.x1+3+5+(field+1)*matrixes[1].m;
	mw.title:=' '+MNames[1]+' ';
	mw.colors[3]:=15;mw.colors[4]:=4;mw.colors[1]:=14;mw.colors[2]:=9;
	mw.border:=border2;
	for u:=1 to matrixes[1].n do selectstr[u]:=false;
	for u:=1 to matrixes[1].m do selectstb[u]:=false;
	i:=1;j:=1;
	openwindow(mw);
	mwb:=true;
  end;
IF  mwb then
  begin
	Activatewindow(mw);
	if Change then Showmatrix(matrixes[1]);
	EditMatrix{(Matrixes[1])};
	Deactivatewindow(mw);
  end;

end;



END.


