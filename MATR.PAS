
Function MayBe:boolean;
var i:byte;n,m:boolean;
begin
m:=false;n:=false;
for i:=1 to matrixes[1].n do if selectstr[i] then n:=true;
for i:=1 to matrixes[1].m do if selectstb[i] then m:=true;
if n and m then MayBe:=true else Maybe:=false;
end;

procedure kf7;
label l1;
var w:twindow;er:integer;u,h,cn,cm:byte;
begin	 if not MayBe then exit;
				  w.x1:=20;w.y1:=10;w.x2:=w.x1+25;w.y2:=w.y1+4;
				  w.title:=' Новая матрица ';w.border:=border2;
				  w.colors[1]:=0;w.colors[2]:=7;
				  w.colors[3]:=15;w.colors[4]:=4;
				  deactivatewindow(mw);
				  OpenWindow(w);
				  textcolor(0);textbackground(7);
				  gotoxy(w.x1+5,w.y1+2);write('Имя матрицы  ');
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
						 matrixes[curnummatrix].n:=1;
						 for u:=1 to matrixes[1].n do
							 if selectstr[u] then inc(matrixes[curnummatrix].n);
						 matrixes[curnummatrix].m:=1;
						 for u:=1 to matrixes[1].m do
							 if selectstb[u] then inc(matrixes[curnummatrix].m);
					   dec(matrixes[curnummatrix].n);
					   dec(matrixes[curnummatrix].m);
					   cn:=0;
					   for u:=1 to matrixes[1].n do
						 if selectstr[u] then
						   begin
							 cn:=cn+1;cm:=0;
							 for h:=1 to matrixes[1].m do
							   if selectstb[h] then
								 begin
								   cm:=cm+1;
								   matrixes[curnummatrix].body[cn,cm]:=matrixes[1].body[u,h];
								 end
						   end
					 end;
l1:
				  Activatewindow(mw);
				end;





procedure KF9;
var cn,cm,u,h:byte;bool:boolean;mat:tmatrix;s:string;lo:longint;
	 ws:TWindow;
			 begin
				 cn:=0;cm:=0;
				 For u:=1 to matrixes[1].n do if selectstr[u] then cn:=cn+1;
				 For u:=1 to matrixes[1].m do if selectstb[u] then cm:=cm+1;
				 if ((cn>0) and (cn=cm))  then
				   begin
					   mat.n:=cn;mat.m:=cm;
					   cn:=0;
					   for u:=1 to matrixes[1].n do
						 if selectstr[u] then
						   begin
							 cn:=cn+1;cm:=0;
							 for h:=1 to matrixes[1].m do
							   if selectstb[h] then
								 begin
								   cm:=cm+1;
								   mat.body[cn,cm]:=matrixes[1].body[u,h];
								 end
						   end;

						Deactivatewindow(mw);
						Say(ws,'Вычисляется определитель');
						lo:=Det(mat.body,mat.n);
						closewindow(ws);
						if gd then begin
						  str(lo,s);
						  Bool:=Message('Минор = '+S);
						end;
						Activatewindow(mw);
				   end
end;


procedure ShowMatrix(M:TMatrix);
Var i,j:Byte;
Begin
  for i:=1 to M.m do
	 begin
		gotoxy((field+1)*(i-1)+4+field-2,1);
		if selectstb[i] then begin textcolor(0);textbackground(7) end
						else begin textcolor(14);textbackground(9) end;
		write(i:2);
	 end;
	for j:=1 to M.n do
	  begin
	  if selectstr[j] then begin textcolor(0);textbackground(7) end
					  else begin textcolor(14);textbackground(9) end;
	  gotoxy(1,j+1);write(j:2);

	  for i:=1 to M.m do
		begin
		 if selectstr[j] and selectstb[i]
			   then textcolor(4) else textcolor(15);
		 textbackground(9);
		 gotoxy((field+1)*(i-1)+4,j+1);write(m.body[j,i]:field)
		end;
	end
end;



procedure  EditMatrix{(Var M:TMatrix)};
{Label l1;}
Var u,h,cn,cm:Byte;s:string;k:Char;er:integer;
	W:Twindow;mat:Tmatrix;li:Longint;bool:Boolean;




procedure ShowCol(x:Byte);
begin gotoxy((Field+1)*(x-1)+4+field-2,1);write(x:2)end;

procedure ShowRow(y:Byte);
begin gotoxy(1,y+1);write(y:2)end;



procedure ShowElement(y,x:Byte);
begin
if selectstr[y] and selectstb[x] then textcolor(4) else textcolor(0);
textbackground(3);
gotoxy((field+1)*(x-1)+4,y+1);write(matrixes[1].body[y,x]:field) end;



procedure HideElement(y,x:Byte);
begin
if selectstr[y] and selectstb[x] then textcolor(4) else textcolor(15);
textbackground(9);
gotoxy((field+1)*(x-1)+4,y+1);write(matrixes[1].body[y,x]:field) end;



Begin
	Showelement(i,j);
	while True do begin
	k:=ReadKey;
	Case Ord(k) of
	 27:begin
		  textcolor(13);textbackground(9);
		  gotoxy((field+1)*(j-1)+4,i+1);
		  write(matrixes[1].body[i,j]:field);
		  exit
		end;
	 13:begin textcolor(0);textbackground(7);gotoxy((field+1)*(j-1)+4,i+1);
		for u:=1 to field do write(' ');gotoxy((field+1)*(j-1)+4,i+1);
		str(matrixes[1].body[i,j],s);
		showinput(s,field);
		u:=input(s,field,false);
		val(s,matrixes[1].body[i,j],er);
		showelement(i,j) end;
{ + }43:
		  begin
			textcolor(0);textbackground(7);
			for u:=1 to matrixes[1].n do begin ShowROw(u);SelectStr[U]:=true END;
			for u:=1 to Matrixes[1].m do begin ShowCol(u);sELECTstb[u]:=true end;
			for u:=1 to matrixes[1].n do
			  for h:=1 to Matrixes[1].m do Hideelement(u,h);
			ShowElement(i,j);
		  end;
{ - }45:begin textcolor(14);textbackground(9);
		  for u:=1 to matrixes[1].n do begin ShowROw(u);SelectStr[U]:=false END;
		  for u:=1 to Matrixes[1].m do begin ShowCol(u);sELECTstb[u]:=false end;
		  for u:=1 to matrixes[1].n do
			 for h:=1 to Matrixes[1].m do Hideelement(u,h);
		  ShowElement(i,j);
		end;
{ * }42:Begin
		  for u:=1 to matrixes[1].n do if SelectStr[u]
							  then begin Textcolor(14);textbackground(9);
								   ShowRow(u);SelectStr[u]:=false end
							  else begin Textcolor(0);textbackground(7);
								   ShowRow(u);SelectStr[u]:=True end;

		  for u:=1 to matrixes[1].m do if SelectStb[u]
							  then begin Textcolor(14);textbackground(9);
								   Showcol(u);SelectStb[u]:=false end
							  else begin Textcolor(0);textbackground(7);
								   Showcol(u);SelectStb[u]:=True end;
          for u:=1 to matrixes[1].n do
			 for h:=1 to Matrixes[1].m do Hideelement(u,h);
		  ShowElement(i,j);
		end;
{ Shift ins  }
	 48: begin
				if SelectStb[j]
				  then begin selectstb[j]:=false;
					   textcolor(14);textbackground(9) end
				  else begin Selectstb[j]:=True ;
					   Textcolor(0);textbackground(7) end;
				ShowCol(j);
				for u:=1 to matrixes[1].n do hideelement(u,j);
				showElement(i,j);
			   end;
	  0:begin
		k:=ReadKey;
		Case Ord(k) of
{left  }   75: begin hideelement(i,j);if j>1 then j:=j-1;showelement(i,j) end;
{right }   77: begin hideelement(i,j);if j<matrixes[1].m then j:=j+1;showelement(i,j) end;
{up    }   72: begin hideelement(i,j);if i>1 then i:=i-1;showelement(i,j) end;
{Down  }   80: begin hideelement(i,j);if i<matrixes[1].n then i:=i+1;showelement(i,j) end;
{ f10 }
	 68:begin
		  textcolor(13);textbackground(9);
		  gotoxy((field+1)*(j-1)+4,i+1);
		  write(matrixes[1].body[i,j]:field);
		  exit
		end;
{ F9 - Determinant/Minor}
		   67:kf9;
{ F6 - Move Str}
		   64:if kf6 then
				begin
				 Showmatrix(matrixes[1]);
				 showelement(i,j);
				end;
{ Shift F6 - Move Stb}
		   89:if ksf6 then
				begin
				 Showmatrix(matrixes[1]);
				 showelement(i,j);
				end;

{ F5 - lin combin Str }
		   63:if kf5 then
			  begin
				ShowMatrix(matrixes[1]);
				Showelement(i,j);
			  end;
{ F3 - k * Str }
		   61:if kf3 then
			  begin
				ShowMatrix(matrixes[1]);
				Showelement(i,j);
			  end;
{ Alt F3 - Spur }
		   106:Spur;
{ Alt F5 - TransPon }
		   108:TransPon;
{ F4 -  Str  \  k }
		   62:if kf4 then
			  begin
				ShowMatrix(matrixes[1]);
				Showelement(i,j);
			  end;
{ Shift F4 -  Stb  \  k }
		   87:if ksf4 then
			  begin
				ShowMatrix(matrixes[1]);
				Showelement(i,j);
			  end;
{ Shift F3 - k * Stb}
		   86:if ksf3 then
			  begin
				ShowMatrix(matrixes[1]);
				Showelement(i,j);
			  end;
{ Shift F5 - lin combin Stb }
		   88:if kSf5 then
			  begin
				ShowMatrix(matrixes[1]);
				Showelement(i,j);
			  end;
{ F7 - New Select Matrix}
		   65:kf7;

{ ins  }   82: begin
				if SelectStr[i]
				   then begin selectstr[i]:=false;
						textcolor(14);textbackground(9) end
				   else begin Selectstr[i]:=True ;
						Textcolor(0);textbackground(7) end;
				showrow(i);
				for u:=1 to matrixes[1].m do hideelement(i,u);
				showElement(i,j);
			   end;
		end end
	 end    {of main case}
	end {of while}
End;



