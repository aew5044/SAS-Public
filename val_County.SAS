
Data County;
Infile Datalines Delimiter='09'x DSD MISSOVER;
Input County_NM :$50. County_Char :$3. County_Num :8.;
Datalines;
Out of State	000	0
Alamance	001	1
Alexander	002	2
Alleghany	003	3
Anson	004	4
Ashe	005	5
Avery	006	6
Beaufort	007	7
Bertie	008	8
Bladen	009	9
Brunswick	010	10
Buncombe	011	11
Burke	012	12
Cabarrus	013	13
Caldwell	014	14
Camden	015	15
Carteret	016	16
Caswell	017	17
Catawba	018	18
Chatham	019	19
Cherokee	020	20
Chowan	021	21
Clay	022	22
Cleveland	023	23
Columbus	024	24
Craven	025	25
Cumberland	026	26
Currituck	027	27
Dare	028	28
Davidson	029	29
Davie	030	30
Duplin	031	31
Durham	032	32
Edgecombe	033	33
Forsyth	034	34
Franklin	035	35
Gaston	036	36
Gates	037	37
Graham	038	38
Granville	039	39
Greene	040	40
Guilford	041	41
Halifax	042	42
Harnett	043	43
Haywood	044	44
Henderson	045	45
Hertford	046	46
Hoke	047	47
Hyde	048	48
Iredell	049	49
Jackson	050	50
Johnston	051	51
Jones	052	52
Lee	053	53
Lenoir	054	54
Lincoln	055	55
Macon	056	56
Madison	057	57
Martin	058	58
McDowell	059	59
Mecklenburg	060	60
Mitchell	061	61
Montgomery	062	62
Moore	063	63
Nash	064	64
New Hanover	065	65
Northhampton	066	66
Onslow	067	67
Orange	068	68
Pamlico	069	69
Pasquotank	070	70
Pender	071	71
Perquimans	072	72
Person	073	73
Pitt	074	74
Polk	075	75
Randolph	076	76
Richmond	077	77
Robeson	078	78
Rockingham	079	79
Rowan	080	80
Rutherford	081	81
Sampson	082	82
Scotland	083	83
Stanly	084	84
Stokes	085	85
Surry	086	86
Swain	087	87
Transylvania	088	88
Tyrrell	089	89
Union	090	90
Vance	091	91
Wake	092	92
Warren	093	93
Washington	094	94
Watauga	095	95
Wayne	096	96
Wilkes	097	97
Wilson	098	98
Yadkin	099	99
Yancey	100	100
Unknown	999	999
;
