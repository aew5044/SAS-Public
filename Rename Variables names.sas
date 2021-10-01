Proc Contents Data=Math.sheet1 out=Mathsheet1(Keep=Name) noprint; Run;

Data CleanNames;
	set MathSheet1;
Format Comb $200. Name $32.;
Comb = CAT(LEFT(CATS("'",NAME,"'","n")), '=',COMPRESS(NAME,,'kn'));
Run;

Data _NULL_;
Set CleanNames end=EndOfFile;
Call SYMPUTX(CATS('Clean',_N_),Comb);
If EndOfFile Then call SYMPUTX('Numrowsa',_N_);
Run;

%PUT &Clean1;

%Macro Renamz;
Data Renamer;
	set math.sheet1;
%Do i=1 %to &Numrowsa;
	Rename &&Clean&i; %end;
Run;
%Mend Renamz;

%Renamz;
