Function Det(Var Matrix:TMatrixBody;n:Byte):longInt;
Var j,i,k:Byte;M:TMatrixBody;
	d:LongInt;Z:Integer;
begin
if n=1 then begin Det:=Matrix[1,1];exit;end;
d:=0;z:=1;
for  i:=1 to n  do
   begin
   if i>1 then
	  for j:=1 to i-1 do
		 for k:=2 to n do
			m[k-1,j]:=Matrix[k,j];
   if i<n then
	  for j:=i+1 to n do
		 for k:=2 to n do
			m[k-1,j-1]:=Matrix[k,j];
   d:=d+z*Matrix[1,i]*Det(m,n-1);z:=-z;
   end;
det:=d;
end;