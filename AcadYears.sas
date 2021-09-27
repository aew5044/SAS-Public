
Data Terms;
Array FA{41} $ FA2000-FA2040;
Array SP{41} $ SP2000-SP2040;
Array SU{41} $ SU2000-SU2040;

Array FAN{41} $ FAN2000-FAN2040;
Array SPN{41} $ SPN2000-SPN2040;
Array SUN{41} $ SUN2000-SUN2040;

Array FACE{41} $ FACE2000-FACE2040;
Array SPCE{41} $ SPCE2000-SPCE2040;
Array SUCE{41} $ SUCE2000-SUCE2040;

Do i = 1 to 41;
		FA{i} = CATS(PUT(1999 + i,$5.),"FA");
		SP{i} = CATS(PUT(1999 + i,$5.),"SP");
		SU{i} = CATS(PUT(1999 + i,$5.),"SU");
	End;

Do i = 1 to 41;
		FAN{i} = CATS(PUT(1999 + i,$5.),"03");
		SPN{i} = CATS(PUT(1999 + i,$5.),"01");
		SUN{i} = CATS(PUT(1999 + i,$5.),"02");
	End;

Do i = 1 to 41;
		FACE{i} = CATS(PUT(1999 + i,$5.),"CE3");
		SPCE{i} = CATS(PUT(1999 + i,$5.),"CE1");
		SUCE{i} = CATS(PUT(1999 + i,$5.),"CE2");
	End;

Run;

**************Make a long data set into a skinny data set*****************;

PROC TRANSPOSE Data=Terms Out=Terms_Transposed
Name=Term;
Var FA2000--SUCE2040;
Run;


Data Acad_years;
Set Terms_Transposed;

If _N_ <=123 Then Do;
If FIND(Term,'FA') >=1 THEN Acad_year = Cats(SUBSTR(Term,3,4),'-',((SubStr(Term,3,4))+1));
else If FIND(Term,'SP') >=1 THEN Acad_year = Cats((SUBSTR(Term,3,4)-1),'-',(SubStr(Term,3,4)));
else If FIND(Term,'SU') >=1 THEN Acad_year = Cats((SUBSTR(Term,3,4)-1),'-',(SubStr(Term,3,4)));
end;
If 123 < _N_ <= 246 Then Do;
If SUBSTR(COL1,5,2)='03' THEN Acad_year = Cats(SUBSTR(Term,4,4),'-',((SubStr(Term,4,4))+1));
else If SUBSTR(COL1,5,2)='01' THEN Acad_year = Cats((SUBSTR(Term,4,4)-1),'-',(SubStr(Term,4,4)));
else If SUBSTR(COL1,5,2)='02' THEN Acad_year = Cats((SUBSTR(Term,4,4)-1),'-',(SubStr(Term,4,4)));
End;

If _N_ > 246 Then Do;
If SUBSTR(COL1,5,3)='CE3' THEN Acad_year = Cats(SUBSTR(Term,5,4),'-',((SubStr(Term,5,4))+1));
else If SUBSTR(COL1,5,3)='CE1' THEN Acad_year = Cats((SUBSTR(Term,5,4)-1),'-',(SubStr(Term,5,4)));
else If SUBSTR(COL1,5,3)='CE2' THEN Acad_year = Cats((SUBSTR(Term,5,4)-1),'-',(SubStr(Term,5,4)));
End;

If _N_ <=123 Then Do;
If FIND(Term,'FA') >=1 THEN SO_Acad_year = Cats(SUBSTR(Term,3,4),'-',((SubStr(Term,3,4)))+1);
else If FIND(Term,'SP') >=1 THEN SO_Acad_year = Cats((SUBSTR(Term,3,4)-1),'-',(SubStr(Term,3,4)));
else If FIND(Term,'SU') >=1 THEN SO_Acad_year = Cats((SUBSTR(Term,3,4)),'-',(SubStr(Term,3,4))+1);
end;

If _N_ >123 Then Do;
If SUBSTR(COL1,5,2)='03' THEN SO_Acad_year = Cats(SUBSTR(Term,4,4),'-',((SubStr(Term,4,4))+1));
else If SUBSTR(COL1,5,2)='01' THEN SO_Acad_year = Cats((SUBSTR(Term,4,4)-1),'-',(SubStr(Term,4,4)));
else If SUBSTR(COL1,5,2)='02' THEN SO_Acad_year = Cats((SUBSTR(Term,4,4)),'-',(SubStr(Term,4,4))+1);
End;

If _N_ >123 Then Do;
If SUBSTR(COL1,5,3)='CE3' THEN SO_Acad_year = Cats(SUBSTR(Term,5,4),'-',((SubStr(Term,5,4))+1));
else If SUBSTR(COL1,5,3)='CE1' THEN SO_Acad_year = Cats((SUBSTR(Term,5,4)-1),'-',(SubStr(Term,5,4)));
else If SUBSTR(COL1,5,3)='CE2' THEN SO_Acad_year = Cats((SUBSTR(Term,5,4)),'-',(SubStr(Term,5,4))+1);
End;

Format Season $6.;
If SUBSTR(Term,1,2)= 'FA' THEN Season = 'Fall';
Else if SUBSTR(Term,1,2)= 'SP' THEN Season = 'Spring';
Else Season = 'Summer';
Drop Term;
Rename Col1 = Term;
Run;

Proc Datasets lib=work;
delete Terms_Transposed Terms;
Run;
