
%MACRO Rtable(Path= /*Point to the full file path, including the name.xlsx*/);
libname Library XLSX "&Path";

Proc SQL noprint;
	Create Table Sheets	As
	Select *
	From Dictionary.Tables
	Where Libname = 'LIBRARY' and 
	nvar >0;
Quit;

Data _NULL_;
Set Sheets end=EndOfFile;
Call SYMPUTX(CATS('Table',_N_),Memname);
If EndOfFile Then call SYMPUTX('NumrowsaT',_N_);
Run;

%DO a=1 %to &NumrowsaT;

Proc Contents Data=Library.&&Table&a. out=Out&a(Keep=Name) noprint; Run;

Data CleanNames;
	set Out&a;
Format Comb $200. Name $32.;
Comb = CAT(LEFT(CATS("'",NAME,"'","n")), '=',COMPRESS(NAME,,'kn'));
Run;

Data _NULL_;
Set CleanNames end=EndOfFile;
Call SYMPUTX(CATS('Clean',_N_),Comb);
If EndOfFile Then call SYMPUTX('Numrowsa',_N_);
Run;

Data Renamer&a;
	set Library.&&Table&a;
%Do i=1 %to &Numrowsa;
	Rename &&Clean&i; %end;
Run;

%End;

Proc Datasets Lib=Work noprint;
delete Sheets out: cleannames;
Run;

%Mend Rtable;
