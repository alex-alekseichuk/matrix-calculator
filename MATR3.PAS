function kF6:boolean;
var g,p:Byte;K:longint;b,act:boolean;
Begin
act:=mw.activate;
k:=0;
for g:=1 to Matrixes[1].n do
  if SelectStr[g] then begin p:=g;k:=k+1 end;
if k<>1 then begin kf6:=false;
	   if act then deactivatewindow(mw);
		b:=message('Нужно пометить одну строку');
	   if act then activatewindow(mw);
	   exit end;
for g:=1 to matrixes[1].m do
  begin
	k:=matrixes[1].body[p,g];
	matrixes[1].body[p,g]:=matrixes[1].body[i,g];
	matrixes[1].body[i,g]:=k;
  end;
kf6:=true;
End;

function kSF6:boolean;
var g,p:Byte;K:LongInt;b,act:boolean;
Begin
act:=mw.activate;
k:=0;
for g:=1 to Matrixes[1].m do
  if SelectStb[g] then begin p:=g;k:=k+1 end;
if k<>1 then begin ksf6:=false;
			   if act then deactivatewindow(mw);
			   b:=message('Нужно пометить один столбец');
			   if act then activatewindow(mw);
			   exit end;
for g:=1 to matrixes[1].n do
  begin
	k:=matrixes[1].body[g,p];
	matrixes[1].body[g,p]:=matrixes[1].body[g,j];
	matrixes[1].body[g,j]:=k;
  end;
ksf6:=true;
End;


Function KF5:boolean;
Var k:Integer;S:String [2];er:Integer;w:TWindow;g,p:Byte;
	b,act:boolean;
Begin
act:=mw.activate;
k:=0;
if act then DeactivateWindow(mw);
For g:=1 to Matrixes[1].n do
   if SelectStr[g] then
	  begin p:=g;k:=k+1 end;
if K<>1 then Begin kF5:=False;
				b:=message('Нужно пометить одну строку');
				if act then activatewindow(mw);
			 exit end;
W.x1:=20;w.y1:=10;w.x2:=w.x1+34;w.y2:=w.y1+6;
W.title:='';W.border:=Border2;
W.colors[1]:=0;w.colors[2]:=7;

OpenWindow(w);
Gotoxy(w.x1+5,w.y1+2);textcolor(4);Textbackground(7);str(i,s);
Write('[',s,'строка]');textcolor(0);write(' + K*');str(p,s);
textcolor(4);write('[',s,'строка]');
Textcolor(0);gotoxy(w.x1+12,w.y1+4);Write('K = ');
textbackground(3);
ShowInput(sk,6);
k:=Input(sk,6,false);
closeWindow(w);
if act then activateWindow(mw);
if k=0 then begin kf5:=false;exit end;
Val(sk,k,er);
for g:=1 to Matrixes[1].m do
  matrixes[1].body[i,g]:=matrixes[1].body[i,g]+k*matrixes[1].body[p,g];
kf5:=true;
end;

Function KSF5:boolean;
Var k:Integer;S:String [2];er:Integer;w:TWindow;g,p:Byte;
	b,act:boolean;
Begin
act:=mw.activate;
k:=0;
if act then DeactivateWindow(mw);
For g:=1 to Matrixes[1].m do
   if SelectStb[g] then
	  begin p:=g;k:=k+1 end;
if K<>1 then Begin kSF5:=False;
					 b:=message('Нужно пометить один столбец');
					 if act then activatewindow(mw);
				 exit end;
W.x1:=20;w.y1:=10;w.x2:=w.x1+36;w.y2:=w.y1+6;
W.title:='';W.border:=Border2;
W.colors[1]:=0;w.colors[2]:=7;

OpenWindow(w);
Gotoxy(w.x1+5,w.y1+2);textcolor(4);Textbackground(7);str(j,s);
Write('[',s,'столбец]');textcolor(0);write(' + K*');str(p,s);
textcolor(4);write('[',s,'столбец]');
Textcolor(0);gotoxy(w.x1+12,w.y1+4);Write('K = ');
textbackground(3);
ShowInput(sk,6);
k:=Input(sk,6,false);
closeWindow(w);
if act then activateWindow(mw);
if k=0 then begin kSf5:=false;exit end;
Val(sk,k,er);
for g:=1 to Matrixes[1].n do
  matrixes[1].body[g,j]:=matrixes[1].body[g,j]+k*matrixes[1].body[g,p];
kSf5:=true;
end;




Function KF3:boolean;
Var k:Integer;S:String [2];er:Integer;w:TWindow;g:Byte;
	act:boolean;
Begin
act:=mw.activate;
W.x1:=20;w.y1:=10;w.x2:=w.x1+23;w.y2:=w.y1+6;
W.title:='';W.border:=Border2;
W.colors[1]:=0;w.colors[2]:=7;
if act then DeactivateWindow(mw);
OpenWindow(w);
Gotoxy(w.x1+5,w.y1+2);Textbackground(7);
textcolor(0);write('K * ');str(i,s);
textcolor(4);write('[',s,'строка]');
Textcolor(0);gotoxy(w.x1+6,w.y1+4);Write('K = ');
textbackground(3);
ShowInput(sk,6);
k:=Input(sk,6,false);
closeWindow(w);
if act then activateWindow(mw);
if k=0 then begin kf3:=false;exit end;
Val(sk,k,er);
for g:=1 to Matrixes[1].m do
  matrixes[1].body[i,g]:=k*matrixes[1].body[i,g];
kf3:=true;
end;

Function KSF3:boolean;
Var k:Integer;S:String [2];er:Integer;w:TWindow;g:Byte;
	act:boolean;
Begin
act:=mw.activate;
W.x1:=20;w.y1:=10;w.x2:=w.x1+24;w.y2:=w.y1+6;
W.title:='';W.border:=Border2;
W.colors[1]:=0;w.colors[2]:=7;
if act then DeactivateWindow(mw);
OpenWindow(w);
Gotoxy(w.x1+5,w.y1+2);Textbackground(7);
textcolor(0);write('K * ');str(j,s);
textcolor(4);write('[',s,'столбец]');
Textcolor(0);gotoxy(w.x1+6,w.y1+4);Write('K = ');
textbackground(3);
ShowInput(sk,6);
k:=Input(sk,6,false);
closeWindow(w);
if act then activateWindow(mw);
if k=0 then begin ksf3:=false;exit end;
Val(sk,k,er);
for g:=1 to Matrixes[1].n do
  matrixes[1].body[g,j]:=k*matrixes[1].body[g,j];
ksf3:=true;
end;

Function KF4:boolean;
Var k:Integer;S:String [2];er:Integer;w:TWindow;g:Byte;
	act,net:boolean;
Begin
act:=mw.activate;
W.x1:=20;w.y1:=10;w.x2:=w.x1+23;w.y2:=w.y1+6;
W.title:='';W.border:=Border2;
W.colors[1]:=0;w.colors[2]:=7;
if act then DeactivateWindow(mw);
OpenWindow(w);
Gotoxy(w.x1+5,w.y1+2);Textbackground(7);
str(i,s);
textcolor(4);write('[',s,'строка]');
textcolor(0);write(' \ K');
gotoxy(w.x1+6,w.y1+4);Write('K = ');
textbackground(3);
ShowInput(sk,6);
k:=Input(sk,6,false);
closeWindow(w);

if k=0 then begin kf4:=false;exit end;
Val(sk,k,er);
if k=0 then begin net:=message('На ноль делить нельзя');
			if act then activatewindow(mw);kf4:=false;exit end;
net:=false;
for g:=1 to matrixes[1].m do
  if (matrixes[1].body[i,g] mod k)<>0 then net:=true;
if net then begin net:=message('Нацело не делится');
			if act then activatewindow(mw);kf4:=false;exit end;
if act then activateWindow(mw);
for g:=1 to Matrixes[1].m do
  matrixes[1].body[i,g]:=matrixes[1].body[i,g] div k;
kf4:=true;
end;



Function KSF4:boolean;
Var k:Integer;S:String [2];er:Integer;w:TWindow;g:Byte;
	act,net:boolean;
Begin
act:=mw.activate;
W.x1:=20;w.y1:=10;w.x2:=w.x1+24;w.y2:=w.y1+6;
W.title:='';W.border:=Border2;
W.colors[1]:=0;w.colors[2]:=7;
if act then DeactivateWindow(mw);
OpenWindow(w);
Gotoxy(w.x1+5,w.y1+2);Textbackground(7);
str(j,s);
textcolor(4);write('[',s,'столбец]');
textcolor(0);write(' \ K');
gotoxy(w.x1+6,w.y1+4);Write('K = ');
textbackground(3);
ShowInput(sk,6);
k:=Input(sk,6,false);
closeWindow(w);

if k=0 then begin ksf4:=false;exit end;
Val(sk,k,er);
if k=0 then begin net:=message('На ноль делить нельзя');
			if act then activatewindow(mw);ksf4:=false;exit end;
net:=false;
for g:=1 to matrixes[1].n do
  if (matrixes[1].body[g,j] mod k)<>0 then net:=true;
if net then begin net:=message('Нацело не делится');
			if act then activatewindow(mw);ksf4:=false;exit end;
if act then activateWindow(mw);
for g:=1 to Matrixes[1].n do
  matrixes[1].body[g,j]:=matrixes[1].body[g,j] div k;
ksf4:=true;
end;


Procedure Spur;
Var k:LongInt;g:Byte;s:string;
	act,b:boolean;
Begin
act:=mw.activate;
if act then deactivatewindow(mw);
if matrixes[1].n<>matrixes[1].m then
   begin
	  b:=message('Матрица не квадратная');
	  if act then activatewindow(mw);
	  exit
   end;


k:=0;
for g:=1 to matrixes[1].n do k:=k+matrixes[1].body[g,g];
str(k,s);

b:=Message('След Матрицы = '+S);
if act then activateWindow(mw);
end;




procedure TransPon;
label l1;
var w:twindow;er:integer;u,h,cn,cm:byte;act:boolean;
begin
		act:=mw.activate;
				  w.x1:=20;w.y1:=10;w.x2:=w.x1+45;w.y2:=w.y1+4;
				  w.title:=' Транспонированная матрица ';w.border:=border2;
				  w.colors[1]:=0;w.colors[2]:=7;
				  w.colors[3]:=15;w.colors[4]:=4;
				  if act then deactivatewindow(mw);
				  OpenWindow(w);
				  textcolor(0);textbackground(7);
				  gotoxy(w.x1+10,w.y1+2);write('Имя матрицы  ');
				  Textbackground(3);
				  ShowInput(sn1,3);
				  er:=input(sn1,3,true);
				  closeWindow(w);
				  if er=1 then
					 begin
					   Gotoxy(20,10);
					   if curnummatrix=10 then
						  if not Question('Список матриц полон. Удалить Матрицу '+MNames[10])
							   then goto l1
							   else CurnumMatrix:=Curnummatrix-1;
					   inc(curnummatrix);
					   MNames[curnummatrix]:=sn1;

					   Matrixes[curnummatrix].n:=Matrixes[1].m;
					   Matrixes[curnummatrix].m:=Matrixes[1].n;
					   For u:=1 to matrixes[1].n do
						 for h:=1 to matrixes[1].m do
						   matrixes[curnummatrix].body[h,u]:=matrixes[1].body[u,h];

					 end;
l1:
			 if act then Activatewindow(mw);
				end;

procedure Mult;
label l1;
var w:twindow;er:integer;g,u,h:byte;b,act:boolean;
begin
		act:=mw.activate;
		if act then deactivatewindow(mw);
		say(w,'Укажите второй сомножитель в произведении матриц');
		b:=SelectMatrix;
		closewindow(w);
		if not b then
		begin if act then activatewindow(mw);exit end;
		if matrixes[1].n<>matrixes[2].m then begin
		  b:=message('Ошибка : Нельзя умножить матрицу '+MNAmes[2]+' на матрицу '+MNames[1]);
          if act then activatewindow(mw);exit end;
				  w.x1:=20;w.y1:=10;w.x2:=w.x1+24;w.y2:=w.y1+4;
				  w.title:=' Произведение матриц ';w.border:=border2;
				  w.colors[1]:=0;w.colors[2]:=7;
				  w.colors[3]:=15;w.colors[4]:=4;

				  OpenWindow(w);
				  textcolor(4);textbackground(7);
				  gotoxy(w.x1+5,w.y1+2);write(MNames[1]);
				  textcolor(0);write(' * ');
				  textcolor(4);write(MNames[2]);
				  textcolor(0);write(' = ');
				  Textbackground(3);
				  ShowInput(sn1,3);
				  er:=input(sn1,3,true);
				  closeWindow(w);
				  if er=1 then
					 begin
					   Gotoxy(20,10);
					   if curnummatrix=10 then
						  if not Question('Список матриц полон. Удалить Матрицу '+MNames[10])
							   then goto l1
							   else CurnumMatrix:=Curnummatrix-1;
					   inc(curnummatrix);
					   MNames[curnummatrix]:=sn1;

					   Matrixes[curnummatrix].n:=Matrixes[2].n;
					   Matrixes[curnummatrix].m:=Matrixes[1].m;
					   For u:=1 to matrixes[2].n do
						 for h:=1 to matrixes[1].m do
						   begin
							matrixes[curnummatrix].body[u,h]:=0;
							for g:=1 to matrixes[1].n do
							 matrixes[curnummatrix].body[u,h]:=
							   matrixes[curnummatrix].body[u,h]+
								 matrixes[1].body[g,h]*matrixes[2].body[u,g]
						   end;
					 end;
l1:
			 if act then Activatewindow(mw);
				end;







Function AddMatrix:Boolean;
Var k:Integer;S:String [2];er:Integer;w:TWindow;u,h:Byte;
	act,net:boolean;
Begin
act:=mw.activate;
if act then DeactivateWindow(mw);
say(w,'Укажите второе слагаемое');
net:=SelectMatrix;
CloseWindow(w);
if not net then Begin if act then ActivateWindow(mw);AddMatrix:=false;exit end;
if (Matrixes[1].n<>Matrixes[2].n) or (Matrixes[1].m<>Matrixes[2].m) then
		  begin
			net:=message('Ошибка : Нельзя сложить матрицы '+MNAmes[2]+' и '+MNames[1]);
			AddMatrix:=false;
            FirstRecord(2);
			if act then activatewindow(mw);exit
		  end;


W.x1:=20;w.y1:=10;w.x2:=w.x1+26;w.y2:=w.y1+6;
W.title:='';W.border:=Border2;
W.colors[1]:=0;w.colors[2]:=7;

OpenWindow(w);
Gotoxy(w.x1+5,w.y1+2);Textbackground(7);
textcolor(4);write(MNames[2]);
textcolor(0);write(' = ');
textcolor(4);write(MNames[2]);
textcolor(0);write(' + k*');
textcolor(4);write(MNames[1]);
gotoxy(w.x1+9,w.y1+4);
textcolor(0);write('K = ');
textbackground(3);
ShowInput(sk,6);
k:=Input(sk,6,false);
closeWindow(w);
AddMatrix:=false;
if k=1 then
  begin
	Val(sk,k,er);
	for u:=1 to Matrixes[1].n do
	  for h:=1 to Matrixes[1].m do
		Matrixes[2].body[u,h]:=Matrixes[2].body[u,h]+k*Matrixes[1].body[u,h];
	AddMatrix:=True;
  end;
FirstRecord(2);
end;
