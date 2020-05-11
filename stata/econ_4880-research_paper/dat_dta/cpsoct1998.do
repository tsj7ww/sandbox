clear

cd "/Users/trev/Desktop/ECON 488/cps"      
local dat_name "/Users/trev/Desktop/ECON 488/cps/oct98pub.dat"

cd "/Users/trev/Desktop/ECON 488/dta"
local dta_name "./cpsoct98.dta"

cd "/Users/trev/Desktop/ECON 488/dct"
local dct_name "./cpsoct98.dct"

quietly infile using "`dct_name'", using("`dat_name'") clear


//////////////////////////////////////////////////////////////////////////////////////////


note: by Jean Roth, jroth@nber.org Tue Oct 13 17:03:30 EDT 2009
note hryear4: U ALL HHLDs IN SAMPLE
note hurespli: U ALL HHLDs IN SAMPLE
note hehousut: U HRINTSTA = 1 OR HUTYPB = 1-3
note hetelhhd: U ALL HHLDs IN SAMPLE
note hetelavl: U HRINTSTA = 1
note hephoneo: U HETELHHD = 2
note hufaminc: U HETELHHD = 1 OR 
note hrintsta: U HRINTSTA = 1
note hrnumhou: U ALL HHLDs IN SAMPLE
note hrhtype: U ALL HHLDs IN SAMPLE
note hrmis: U ALL HHLDs IN SAMPLE
note huinttyp: U ALL HHLDs IN SAMPLE
note hrsample: U ALL HHLDs IN SAMPLE
note hrsersuf: U ALL HHLDs IN SAMPLE
note huhhnum: U ALL HHLDs IN SAMPLE
note gestcen: U ALL HHLD's IN SAMPLE
note gestfips: U ALL HHLD's IN SAMPLE
note gecmsa: U ALL HHLD's IN SAMPLE
note gemsa: U ALL HHLD's IN SAMPLE
note geco: U ALL HHLD's IN SAMPLE
note gemsast: U ALL HHLD's IN SAMPLE
note gemetsta: U ALL HHLD's IN SAMPLE
note geindvcc: U ALL HHLD's IN SAMPLE
note gemsasz: U ALL HHLD's IN SAMPLE
note gecmsasz: U ALL HHLD's IN SAMPLE
note hulensec: U ALL HHLD's IN SAMPLE
note proldrrp: U ALL HHLD's IN SAMPLE
note pupelig: U PRPERTYP = 1, 2, OR 3
note peparent: U PRPERTYP = 1, 2, OR 3
note peage: U EVERY PERSON
note ptage: U PRPERTYP = 1, 2, 0R 3
note pespouse: U PEAGE >= 15
note pesex: U PEMARITL = 1
note puafever: U PRPERTYP = 1, 2, 0R 3
note peafnow: U PRPERTYP = 2
note peeduca: U PRPERTYP = 2 0R 3
note perace: U PRPERTYP = 2 0R 3
note prorigin: U PRPERTYP = 1, 2, 0R 3
note puchinhh: U PRPERTYP = 1, 2, 0R 3
note prfamrel: U PRPERTYP = 1, 2, 0R 3
note prfamtyp: U PRPERTYP = 1, 2, 0R 3
note prhspnon: U PRPERTYP = 1, 2, 0R 3
note prmarsta: U PRPERTYP = 1, 2, 0R 3
note prpertyp: U PRPERTYP = 2 0R 3
note penatvty: U ALL HOUSEHOLD MEMBERS
note pemntvty: U PRPERTYP = 1, 2, 0R 3
note pefntvty: U PRPERTYP = 1, 2, 0R 3
note prcitshp: U PRPERTYP = 1, 2, 0R 3
note prcitflg: U PRPERTYP = 1, 2, 0R 3
note prinusyr: U PRPERTYP = 1, 2, 0R 3
note puslfprx: U PRCITSHP = 2, 3, 4, 
note puwk: U PRPERTYP = 2
note pudis1: U PEMLR = 5 
note peabspdo: U PEMLR = 2
note pemjot: U PEABSRSN = 4-12, 14
note pemjnum: U PEMLR = 1, 2
note pehrusl1: U PEMJOT = 1
note pehrusl2: U PEMJOT = 1 OR 2 
note pehrftpt: U PEMJOT = 1 
note pehruslt: U PEHRUSL1 = -4 OR
note pehrwant: U PEMLR = 1 OR 2
note pehrrsn1: U PEMLR = 1 AND 
note pehrrsn2: U PEHRWANT = 1 
note pehrrsn3: U PEHRWANT = 2 
note puhroff1: U PEHRACTT = 1-34 
note pehract2: U PEMLR = 1
note pehractt: U PEMLR = 1 AND PEMJOT = 1
note pehravl: U PEMLR = 1
note pulbhsec: U PEHRACTT = 1-34 
note pulayavr: U PEMLR = 3
note pelaydur: U PELAYAVL= 1, 2
note pelayfto: U PELAYLK = 1, 2
note pulayck1: U PELAYDUR = 0-120
note pulkm2: U PEMLR = 4
note pelkll2o: U PELKAVL = 1-2
note pelklwo: U PELKLL1O = 1 OR 3
note pelkdur: U PELKLL1O = 1 - 4
note pelkfto: U PELKLWO = 1 - 3
note pedwwnto: U PELKDUR = 0-120
note pedwrsn: U PUDWCK1 = 3, 4, -1
note pedwlko: U PUDWCK4 = 4, -1
note pedwwk: U (PUDWCK4 = 1-3) 
note pedw4wk: U PEDWLKO = 1
note pedwlkwk: U PEDWWK = 1
note pedwavl: U PEDW4WK = 2
note pedwavr: U (PEDWWK = 2) 
note pudwck1: U PEDWAVL = 2
note pejhwant: U PEJHWKO = 1
note pujhck1: U (PEJHWKO = 2) 
note prcivlf: U PEMLR = 2
note prdisc: U PEMLR = 1-7
note premphrs: U PRJOBSEA = 1-4
note prempnot: U PEMLR = 1-7
note prexplf: U PEMLR = 1-7
note prftlf: U PEMLR = 1-4 AND
note prhrusl: U PEMLR = 1-4
note prjobsea: U PEMLR = 1-2
note prpthrs: U PRWNTJOB = 1
note prptrea: U PEMLR = 1 AND
note prunedur: U PEMLR = 1 
note prusftpt: U PEMLR = 3-4
note pruntype: U PEMLR = 1-2
note prwksch: U PEMLR = 3-4
note prwkstat: U PEMLR = 1 - 7
note prwntjob: U PEMLR = 1-7
note pujhck3: U PEMLR = 5-7
note puio1mfg: U (PEMLR = 1-3) OR 
note peio1ocd: U (PEMLR = 1-3)
note peio2cow: U (PEMLR = 1-3)
note puio2mfg: U PEMJOT = 1 AND 
note peio2ocd: U PEMJOT = 1 
note puiock1: U PEMJOT = 1 
note prana: U PEMLR = 1-3,
note prcow1: U PRIOELG = 1
note prcow2: U PRIOELG = 1
note prcowpg: U PRIOELG = 1 
note prdtcow1: U PEIO1COW = 1 - 5
note prdtcow2: U PRIOELG = 1
note prdtind1: U PRIOELG = 1 AND 
note prdtind2: U PRIOELG = 1
note prdtocc1: U PRIOELG = 1 AND 
note prdtocc2: U PRIOELG = 1
note premp: U PRIOELG = 1 AND 
note prmjind1: U PEMLR = 1 OR 2
note prmjind2: U PRDTIND1 = 1-51
note prmjocc1: U PRDTIND2 = 1-51
note prmjocc2: U PRDTOCC1 = 1-46
note prmjocgr: U PRDTOCC2 = 1-46
note prnagpws: U PRMJOCC = 1-13
note prnagws: U PRCOW1 = 1 AND 
note prsjmj: U PEMLR = 1-4
note prerelg: U PEMLR = 1 OR 2
note peernuot: U PEMLR = 1-2 
note peernper: U PRERELG = 1
note peernrt: U PRERELG = 1
note peernhry: U PEERNPER = 2-7
note puernh1c: U PRERELG = 1
note peernh1o: U PEERNRT = 1
note prernhly: U PEERNPER = 1
note pthr: U PEERNPER = 1 
note ptwk: U PRERELG = 1
note puern2: U PEERNUOT = 1 
note peernlab: U PEERNPER = 6
note peerncov: U (PEIO1COW = 1-5
note penlfjh: U (PEIO1COW = 1-5
note penlfret: U HRMIS = 4 OR 8 
note penlfact: U PEAGE = 50+ AND
note punlfck1: U (PEAGE = 14-49) 
note peschft: U PRPERTYP = 2 
note peschlvl: U PESCHLVL = 1, 2
note prnlfsch: U PESCHENR = 1
note pwfmwgt: U PENLFACT = -1 
note pwlgwgt: U PRPERTYP = 1-3
note pworwgt: U PRPERTYP = 2
note pwsswgt: U PRPERTYP = 2
note pwvetwgt: U PRPERTYP = 1-3
note prwernal: U PRPERTYP = 2
note prhernal: U PRERELG = 1
note hxtenure: U PRERNHRY = 1
note pegrprof: U PEEDUCA =40-42
note pegr6cor: U PEEDUCA = 43
note pems123: U PEGRPROF = 1
note pxdipged: U PEEDUCA = 44
note pesschol: U PRPERTYP = 2 AND


//////////////////////////////////////////////////////////////////////////////////////////


#delimit ;

;
label values hufinal  hufinal;
label define hufinal 
	0           "New Interview - Not Contacted"           
	1           "Fully Complete CATI Interview"           
	2           "Partially Completed CATI Interview"      
	5           "Labor Force Complete, Supplement"        
	24          "HH Occupied Entirely By Armed Forces"    
	112         "Partial Interview With Callback"         
	200         "New Interview - Contacted"               
	201         "CAPI Complete"                           
	202         "Callback Needed"                         
	203         "Sufficient Partial - Precloseout"        
	204         "Sufficient Partial - At Closeout"        
	205         "Labor Force Complete, - Suppl."          
	210         "CAPI Complete Reinterview"               
	216         "No One Home"                             
	217         "Temporarily Absent"                      
	218         "Refused"                                 
	219         "Other Occupied - Specify"                
	224         "Armed Forces Occupied Or Under Age 14"   
	225         "Temp. Occupied W/persons With URE"       
	226         "Vacant Regular"                          
	227         "Vacant - Storage Of Hhld Furniture"      
	228         "Unfit, To Be Demolished"                 
	229         "Under Construction, Not Ready"           
	230         "Converted To Temp Business Or Storage"   
	231         "Unoccupied Tent Or Trailer Site"         
	232         "Permit Granted - Construction Not"       
	233         "Other - Specify"                         
	240         "Demolished"                              
	241         "House Or Trailer Moved"                  
	242         "Outside Segment"                         
	243         "Converted To Perm. Business Or Storage"  
	244         "Merged"                                  
	245         "Condemned"                               
	246         "Built After April 1, 1980"               
	247         "Unused Serial No./Listing Sheet Line"    
	248         "Other - Specify"                         
;
label values huspnish huspnish;
label define huspnish
	1           "Spanish Only Language Spoken"            
;
label values hetenure hetenure;
label define hetenure
	1           "Owned Or Being Bought By A HH Member"    
	2           "Rented For Cash"                         
	3           "Occupied Without Payment Of Cash Rent"   
;
label values hehousut hehousut;
label define hehousut
	0           "Other Unit"                              
	1           "House, Apartment, Flat"                  
	2           "HU In Nontransient Hotel, Motel, Etc."   
	3           "HU Permanent In Transient Hotel, Motel"  
	4           "HU In Rooming House"                     
	5           "Mobile Home Or Trailer W/no Perm."       
	6           "Mobile Home Or Trailer W/1 Or More"      
	7           "HU Not Specified Above"                  
	8           "Quarters Not HU In Rooming Or Brding"    
	9           "Unit Not Perm. In Transient Hotl, Motl"  
	10          "Unoccupied Tent Site Or Trlr Site"       
	11          "Student Quarters In College Dorm"        
	12          "Other Unit Not Specified Above"          
;
label values hetelhhd hetelhhd;
label define hetelhhd
	1           "Yes"                                     
	2           "No"                                      
;
label values hetelavl hetelavl;
label define hetelavl
	1           "Yes"                                     
	2           "No"                                      
;
label values hephoneo hephoneo;
label define hephoneo
	1           "Yes"                                     
	2           "No"                                      
;
label values hufaminc hufaminc;
label define hufaminc
	1           "Less Than $5,000"                        
	2           "5,000 to 7,499"                          
	3           "7,500 to 9,999"                          
	4           "10,000 to 12,499"                        
	5           "12,500 to 14,999"                        
	6           "15,000 to 19,999"                        
	7           "20,000 to 24,999"                        
	8           "25,000 to 29,999"                        
	9           "30,000 to 34,999"                        
	10          "35,000 to 39,999"                        
	11          "40,000 to 49,999"                        
	12          "50,000 to 59,999"                        
	13          "60,000 to 74,999"                        
	14          "75,000 or more"                          
;
label values hutypea  hutypea;
label define hutypea 
	1           "No One Home (NOH)"                       
	2           "Temporarily Absent (TA)"                 
	3           "Refused (REF)"                           
	4           "Other Occupied - Specify"                
;
label values hutypb   hutypb; 
label define hutypb  
	1           "Vacant Regular"                          
	2           "Temporarily Occupied By Persons W/Ure"   
	3           "Vacant-storage Of Hhld Furniture"        
	4           "Unfit Or To Be Demolished"               
	5           "Under Construction, Not Ready"           
	6           "Converted To Temp Business Or Storage"   
	7           "Unoccupied Tent Site Or Trailer Site"    
	8           "Permit Granted Construction Not"         
	9           "Other Type B - Specify"                  
;
label values hutypc   hutypc; 
label define hutypc  
	1           "Demolished"                              
	2           "House Or Trailer Moved"                  
	3           "Outside Segment"                         
	4           "Converted To Perm. Business Or Storage"  
	5           "Merged"                                  
	6           "Condemned"                               
	8           "Unused Line Of Listing Sheet"            
	9           "Other - Specify"                         
;
label values hrintsta hrintsta;
label define hrintsta
	1           "Interview"                               
	2           "Type A Non-interview"                    
	3           "Type B Non-interview"                    
	4           "Type C Non-interview"                    
;
label values hrhtype  hrhtype;
label define hrhtype 
	0           "Non-interview Household"                 
	1           "Husband/Wife Primary Family"             
	2           "Husb/Wife Prim. Family"                  
	3           "Unmarried Civilian Male-Prim."           
	4           "Unmarried Civ. Female-Prim Fam Hhlder"   
	5           "Primary Family HHLDER-RP In AF, Unmar."  
	6           "Civilian Male Primary Individual"        
	7           "Civilian Female Primary Individual"      
	8           "Primary Individual HHLD-RP In AF"        
	9           "Group Quarters With Family"              
	10          "Group Quarters Without Family"           
;
label values huinttyp huinttyp;
label define huinttyp
	0           "Noninterview/indeterminate"              
	1           "Personal"                                
	2           "Telephone"                               
;
label values hrlonglk hrlonglk;
label define hrlonglk
	0           "Mis 1 Or Replacement HH (No Link)"       
	2           "Mis 2-4 Or Mis 6-8"                      
	3           "Mis 5"                                   
;
label values hubus    hubus;  
label define hubus   
	1           "Yes"                                     
	2           "No"                                      
;
label values gereg    gereg;  
label define gereg   
	1           "Northeast"                               
	2           "Midwest (Formerly North Central)"        
	3           "South"                                   
	4           "West"                                    
;
label values gestcen  gestcen;
label define gestcen 
	11          "ME"                                      
	12          "NH"                                      
	13          "VT"                                      
	14          "MA"                                      
	15          "RI"                                      
	16          "CT"                                      
	21          "NY"                                      
	22          "NJ"                                      
	23          "PA"                                      
	31          "OH"                                      
	32          "IN"                                      
	33          "IL"                                      
	34          "MI"                                      
	35          "WI"                                      
	41          "MN"                                      
	42          "IA"                                      
	43          "MO"                                      
	44          "ND"                                      
	45          "SD"                                      
	46          "NE"                                      
	47          "KS"                                      
	51          "DE"                                      
	52          "MD"                                      
	53          "DC"                                      
	54          "VA"                                      
	55          "WV"                                      
	56          "NC"                                      
	57          "SC"                                      
	58          "GA"                                      
	59          "FL"                                      
	61          "KY"                                      
	62          "TN"                                      
	63          "AL"                                      
	64          "MS"                                      
	71          "AR"                                      
	72          "LA"                                      
	73          "OK"                                      
	74          "TX"                                      
	81          "MT"                                      
	82          "ID"                                      
	83          "WY"                                      
	84          "CO"                                      
	85          "NM"                                      
	86          "AZ"                                      
	87          "UT"                                      
	88          "NV"                                      
	91          "WA"                                      
	92          "OR"                                      
	93          "CA"                                      
	94          "AK"                                      
	95          "HI"                                      
;
label values gecmsa   gecmsa; 
label define gecmsa  
	0           "Not Identified Or Nonmetropolitan"       
;
label values gemsa    gemsa;  
label define gemsa   
	0           "Not Identified Or Non Metropolitan"      
;
label values geco     geco;   
label define geco    
	0           "Not Identified"                          
;
label values gemsast  gemsast;
label define gemsast 
	1           "Central City"                            
	2           "Balance"                                 
	3           "Nonmetropolitan"                         
	4           "Not Identified"                          
;
label values gemetsta gemetsta;
label define gemetsta
	1           "Metropolitan"                            
	2           "Nonmetropolitan"                         
	3           "Not Identified"                          
;
label values geindvcc geindvcc;
label define geindvcc
	0           "Not Identified, Nonmetropolitan,"        
;
label values gemsasz  gemsasz;
label define gemsasz 
	0           "Not Identified Or Nonmetropolitan"       
	2           "100,000 - 249,999"                       
	3           "250,000 - 499,999"                       
	4           "500,000 - 999,999"                       
	5           "1,000,000 - 2,499,999"                   
	6           "2,500,000 - 4,999,999"                   
	7           "5,000,000+"                              
;
label values gecmsasz gecmsasz;
label define gecmsasz
	0           "Not Identified Or Nonmetropolitan"       
	2           "100,000 - 249,999"                       
	3           "250,000 - 499,999"                       
	4           "500,000 - 999,999"                       
	5           "1,000,000 - 2,499,999"                   
	6           "2,500,000 - 4,999,999"                   
	7           "5,000,000+"                              
;
label values proldrrp proldrrp;
label define proldrrp
	1           "Ref Pers With Other Relatives In Hh"     
	2           "Ref Pers With No Other Relatives In Hh"  
	3           "Spouse"                                  
	4           "Child"                                   
	5           "Grandchild"                              
	6           "Parent"                                  
	7           "Brother/Sister"                          
	8           "Other Relative"                          
	9           "Foster Child"                            
	10          "Non-rel Of Ref Per W/Own Rels In Hh"     
	11          "Partner/Roommate"                        
	12          "Non-rel Of Ref Per W/No Own Rels In Hh"  
;
label values pupelig  pupelig;
label define pupelig 
	1           "Eligible For Interview"                  
	2           "Labor Force Fully Complete"              
	3           "Missing Labor Force Data For Person"     
	4           "(Not Used)"                              
	5           "Assigned If Age Is Blank"                
	6           "Armed Forces Member"                     
	7           "Under 15 Years Old"                      
	8           "Not A HH Member"                         
	9           "Deleted"                                 
	10          "Deceased"                                
	11          "End Of List"                             
	12          "After End Of List"                       
;
label values perrp    perrp;  
label define perrp   
	1           "Reference Person W/rels."                
	2           "Reference Person W/o Rels."              
	3           "Spouse"                                  
	4           "Child"                                   
	5           "Grandchild"                              
	6           "Parent"                                  
	7           "Brother/sister"                          
	8           "Other Rel. Or Ref. Person"               
	9           "Foster Child"                            
	10          "Nonrel. Of Ref. Person W/Rels."          
	11          "Not Used"                                
	12          "Nonrel. Of Ref. Person W/O Rels."        
	13          "Unmarried Partner W/Rels."               
	14          "Unmarried Partner W/Out Rels."           
	15          "Housemate/Roommate W/Rels."              
	16          "Housemate/Roommate W/Out Rels."          
	17          "Roomer/Boarder W/Rels."                  
	18          "Roomer/Boarder W/Out Rels."              
;
label values ptage    ptage;  
label define ptage   
	0           "No Top Code"                             
	1           "Top Coded Value For Age"                 
;
label values pemaritl pemaritl;
label define pemaritl
	1           "Married - Spouse Present"                
	2           "Married - Spouse Absent"                 
	3           "Widowed"                                 
	4           "Divorced"                                
	5           "Separated"                               
	6           "Never Married"                           
;
label values pesex    pesex;  
label define pesex   
	1           "Male"                                    
	2           "Female"                                  
;
label values puafever puafever;
label define puafever
	1           "Yes"                                     
	2           "No"                                      
;
label values peafwhen peafwhen;
label define peafwhen
	1           "Vietnam Era (8/64-4/75)"                 
	2           "Korean War (6/50-1/55)"                  
	3           "World War II (9/40-7/47)"                
	4           "World War I (4/17-11/18)"                
	5           "Other Service (All Other Periods)"       
	6           "Nonveteran"                              
;
label values peafnow  peafnow;
label define peafnow 
	1           "Yes"                                     
	2           "No"                                      
;
label values peeduca  peeduca;
label define peeduca 
	31          "Less Than 1st Grade"                     
	32          "1st, 2nd, 3rd Or 4th Grade"              
	33          "5th Or 6th Grade"                        
	34          "7th Or 8th Grade"                        
	35          "9th Grade"                               
	36          "10th Grade"                              
	37          "11th Grade"                              
	38          "12th Grade No Diploma"                   
	39          "High School Grad-Diploma Or"             
	40          "Some College But No Degree"              
	41          "Associate Degree-"                       
	42          "Associate Degree-Academic Program"       
	43          "Bachelor's Degree (Ex: BA, AB, BS)"      
	44          "Master's Degree (Ex: MA, MS, MENG,"      
	45          "Professional School Deg (Ex: MD, DDS,"   
	46          "Doctorate Degree (Ex: PHD, EDD)"         
;
label values perace   perace; 
label define perace  
	1           "White"                                   
	2           "Black"                                   
	3           "American Indian, Aleut, Eskimo"          
	4           "Asian Or Pacific Islander"               
;
label values prorigin prorigin;
label define prorigin
	1           "Mexican American"                        
	2           "Chicano"                                 
	3           "Mexican (Mexicano)"                      
	4           "Puerto Rican"                            
	5           "Cuban"                                   
	6           "Central Or South American"               
	7           "Other Spanish"                           
	8           "All Other"                               
	9           "Don't Know"                              
	10          "NA"                                      
;
label values puchinhh puchinhh;
label define puchinhh
	1           "Person Added"                            
	2           "Person Added - URE"                      
	3           "Person Undeleted"                        
	4           "Person Died"                             
	5           "Deleted For Reason Other Than Death"     
	6           "Person Joined Armed Forces"              
	7           "Person No Longer In Af"                  
	9           "Change In Demographic Information"       
;
label values purelflg purelflg;
label define purelflg
	0           "Not Owner Or Related To Owner"           
	1           "Owner Of Bus Or Related To Owner"        
;
label values prfamnum prfamnum;
label define prfamnum
	0           "Not A Family Member"                     
	1           "Primary Family Member Only"              
	2           "Subfamily No. 2 Member"                  
	3           "Subfamily No. 3 Member"                  
	4           "Subfamily No. 4 Member"                  
	5           "Subfamily No. 5 Member"                  
	6           "Subfamily No. 6 Member"                  
	7           "Subfamily No. 7 Member"                  
	8           "Subfamily No. 8 Member"                  
	9           "Subfamily No. 9 Member"                  
	10          "Subfamily No. 10 Member"                 
	11          "Subfamily No. 11 Member"                 
	12          "Subfamily No. 12 Member"                 
	13          "Subfamily No. 13 Member"                 
	14          "Subfamily No. 14 Member"                 
	15          "Subfamily No. 15 Member"                 
	16          "Subfamily No. 16 Member"                 
	17          "Subfamily No. 17 Member"                 
	18          "Subfamily No. 18 Member"                 
	19          "Subfamily No. 19 Member"                 
;
label values prfamrel prfamrel;
label define prfamrel
	0           "Not A Family Member"                     
	1           "Reference Person"                        
	2           "Spouse"                                  
	3           "Child"                                   
	4           "Other Relative (Primary"                 
;
label values prfamtyp prfamtyp;
label define prfamtyp
	1           "Primary Family"                          
	2           "Primary Individual"                      
	3           "Related Subfamily"                       
	4           "Unrelated Subfamily"                     
	5           "Secondary Individual"                    
;
label values prhspnon prhspnon;
label define prhspnon
	1           "Hispanic"                                
	2           "Non-Hispanic"                            
;
label values prmarsta prmarsta;
label define prmarsta
	1           "Married, Civilian Spouse Present"        
	2           "Married, Armed Forces Spouse Present"    
	3           "Married, Spouse Absent (Exc."            
	4           "Widowed"                                 
	5           "Divorced"                                
	6           "Separated"                               
	7           "Never Married"                           
;
label values prpertyp prpertyp;
label define prpertyp
	1           "Child Household Member"                  
	2           "Adult Civilian Household Member"         
	3           "Adult Armed Forces Household Member"     
;
label values penatvty penatvty;
label define penatvty
	57          "United States"                           
	72          "Puerto Rico"                             
	96          "U.S. Outlying Area"                      
	555         "Abroad, Country Not Known"               
;
label values pemntvty pemntvty;
label define pemntvty
	57          "United States"                           
	72          "Puerto Rico"                             
	96          "U.S. Outlying Area"                      
	555         "Abroad, Country Not Known"               
;
label values pefntvty pefntvty;
label define pefntvty
	57          "United States"                           
	72          "Puerto Rico"                             
	96          "U.S. Outlying Area"                      
	555         "Abroad, Country Not Known"               
;
label values prcitshp prcitshp;
label define prcitshp
	1           "Native, Born In The United States"       
	2           "Native, Born In Puerto Rico Or U.S."     
	3           "Native, Born Abroad Of American"         
	4           "Foreign Born, U.S. Citizen By"           
	5           "Foreign Born, Not A Citizen Of"          
;
label values prinusyr prinusyr;
label define prinusyr
	0           "Not Foreign Born"                        
	1           "Before 1950"                             
	2           "1950-1959"                               
	3           "1960-1964"                               
	4           "1965-1969"                               
	5           "1970-1974"                               
	6           "1975-1979"                               
	7           "1980-1981"                               
	8           "1982-1983"                               
	9           "1984-1985"                               
	10          "1986-1987"                               
	11          "1988-1989"                               
	12          "1990-1991"                               
;
label values puslfprx puslfprx;
label define puslfprx
	1           "Self"                                    
	2           "Proxy"                                   
	3           "Both Self And Proxy"                     
;
label values pemlr    pemlr;  
label define pemlr   
	1           "Employed-At Work"                        
	2           "Employed-Absent"                         
	3           "Unemployed-On Layoff"                    
	4           "Unemployed-Looking"                      
	5           "Not In Labor Force-Retired"              
	6           "Not In Labor Force-Disabled"             
	7           "Not In Labor Force-Other"                
;
label values puwk     puwk;   
label define puwk    
	1           "Yes"                                     
	2           "No"                                      
	3           "Retired"                                 
	4           "Disabled"                                
	5           "Unable To Work"                          
;
label values pubus1   pubus1l;
label define pubus1l 
	1           "Yes"                                     
	2           "No"                                      
;
label values pubus2ot pubus2ot;
label define pubus2ot
	1           "Yes"                                     
	2           "No"                                      
;
label values pubusck1 pubuscka;
label define pubuscka
	1           "Goto PUBUS1"                             
	2           "Goto PURETCK1"                           
;
label values pubusck2 pubusckb;
label define pubusckb
	1           "Goto PUHRUSL1"                           
	2           "Goto PUBUS2"                             
;
label values pubusck3 pubusckc;
label define pubusckc
	1           "Goto PUABSRSN"                           
	2           "Goto PULAY"                              
;
label values pubusck4 pubusckd;
label define pubusckd
	1           "Goto PUHRUSL1"                           
	2           "Goto PUABSPD"                            
;
label values puretot  puretot;
label define puretot 
	1           "Yes"                                     
	2           "No"                                      
	3           "Was Not Retired Last Month"              
;
label values pudis    pudis;  
label define pudis   
	1           "Yes"                                     
	2           "No"                                      
	3           "Did Not Have Disability Last Month"      
;
label values peret1   peret1l;
label define peret1l 
	1           "Yes"                                     
	2           "No"                                      
	3           "Has A Job"                               
;
label values pudis1   pudis1l;
label define pudis1l 
	1           "Yes"                                     
	2           "No"                                      
;
label values pudis2   pudis2l;
label define pudis2l 
	1           "Yes"                                     
	2           "No"                                      
;
label values puabsot  puabsot;
label define puabsot 
	1           "Yes"                                     
	2           "No"                                      
	3           "Retired"                                 
	4           "Disabled"                                
	5           "Unable To Work"                          
;
label values pulay    pulay;  
label define pulay   
	1           "Yes"                                     
	2           "No"                                      
	3           "Retired"                                 
	4           "Disabled"                                
	5           "Unable To Work"                          
;
label values peabsrsn peabsrsn;
label define peabsrsn
	1           "On Layoff"                               
	2           "Slack Work/Business Conditions"          
	3           "Waiting For A New Job To Begin"          
	4           "Vacation/Personal Days"                  
	5           "Own Illness/Injury/Medical"              
	6           "Child Care Problems"                     
	7           "Other Family/Personal Obligation"        
	8           "Maternity/Paternity Leave"               
	9           "Labor Dispute"                           
	10          "Weather Affected Job"                    
	11          "School/Training"                         
	12          "Civic/Military Duty"                     
	13          "Does Not Work In The Business"           
	14          "Other (Specify)"                         
;
label values peabspdo peabspdo;
label define peabspdo
	1           "Yes"                                     
	2           "No"                                      
;
label values pemjot   pemjot; 
label define pemjot  
	1           "Yes"                                     
	2           "No"                                      
;
label values pemjnum  pemjnum;
label define pemjnum 
	2           "Jobs"                                    
	3           "3 Jobs"                                  
	4           "4 Or More Jobs"                          
;
label values pehrftpt pehrftpt;
label define pehrftpt
	1           "Yes"                                     
	2           "No"                                      
	3           "Hours Vary"                              
;
label values pehrwant pehrwant;
label define pehrwant
	1           "Yes"                                     
	2           "No"                                      
	3           "Regular Hours Are Full-Time"             
;
label values pehrrsn1 pehrrsna;
label define pehrrsna
	1           "Slack Work/Business Conditions"          
	2           "Could Only Find Part-time Work"          
	3           "Seasonal Work"                           
	4           "Child Care Problems"                     
	5           "Other Family/Personal Obligations"       
	6           "Health/Medical Limitations"              
	7           "School/Training"                         
	8           "Retired/Social Security Limit On"        
	9           "Full-time Workweek Is Less Than 35 Hrs"  
	10          "Other - Specify"                         
;
label values pehrrsn2 pehrrsnb;
label define pehrrsnb
	1           "Child Care Problems"                     
	2           "Other Family/Personal Obligations"       
	3           "Health/Medical Limitations"              
	4           "School/Training"                         
	5           "Retired/Social Security Limit On"        
	6           "Full-Time Workweek Less Than 35 Hours"   
	7           "Other - Specify"                         
;
label values pehrrsn3 pehrrsnc;
label define pehrrsnc
	1           "Slack Work/Business Conditions"          
	2           "Seasonal Work"                           
	3           "Job Started Or Ended During Week"        
	4           "Vacation/Personal Day"                   
	5           "Own Illness/Injury/Medical Appointment"  
	6           "Holiday (Legal Or Religious)"            
	7           "Child Care Problems"                     
	8           "Other Family/Personal Obligations"       
	9           "Labor Dispute"                           
	10          "Weather Affected Job"                    
	11          "School/Training"                         
	12          "Civic/Military Duty"                     
	13          "Other Reason"                            
;
label values puhroff1 puhroffa;
label define puhroffa
	1           "Yes"                                     
	2           "No"                                      
;
label values puhrot1  puhrot1l;
label define puhrot1l
	1           "Yes"                                     
	2           "No"                                      
;
label values pehravl  pehravl;
label define pehravl 
	1           "Yes"                                     
	2           "No"                                      
;
label values puhrck1  puhrck1l;
label define puhrck1l
	1           "Goto PUHRUSL2"                           
	2           "Goto PUHRUSLT"                           
;
label values puhrck2  puhrck2l;
label define puhrck2l
	1           "If Entry Of 1 In MJ And Entry Of D, R"   
	2           "If Entry Of 1 In Mj And Entry Of , R"    
	3           "If Entry Of 2, D Or R In Mj And Entry"   
	4           "If Entry Of 1 In BUS1 And Entry Of D,"   
	5           "All Others Goto HRCK3-C"                 
;
label values puhrck3  puhrck3l;
label define puhrck3l
	1           "If Entry Of 1 In ABSOT Or (Entry Or 2"   
	2           "If Entry Of 3 In Ret1 Goto HRCK8"        
	3           "If Entry In HRUSLt Is 0-34 Hours Goto"   
	4           "If Entry In HRUSLt Is 35+ Goto HROFF1"   
	5           "All Others Goto HRCK4-C"                 
	6           "Goto PUHRCK4"                            
;
label values puhrck4  puhrck4l;
label define puhrck4l
	1           "If Entry Of 1, D, R OR V In HRFTPT"      
	2           "If ENTRY OF 2, D Or R In BUS2 Then"      
	3           "If HRUSLT Is 0-34 Then GOTO HRWANT"      
	4           "If Entry Of 2 In HRFTPT Then GOTO"       
	5           "All Others GOTO HRACT1"                  
;
label values puhrck5  puhrck5l;
label define puhrck5l
	1           "If Entry Of 1 In MJOT Goto HRACT2"       
	2           "All Others Goto HRCK6-C"                 
;
label values puhrck6  puhrck6l;
label define puhrck6l
	1           "If HRACT1 And HRACT2 Eq 0 And Entry Of"  
	2           "If HRACT1 And HRACT2 Eq 0 Then Store 1"  
	3           "All Others Goto HRACTt-C"                
;
label values puhrck7  puhrck7l;
label define puhrck7l
	1           "(If Entry Of 2, D Or R In Bus2) And"     
	2           "(If Entry Of 2, D Or R In Bus2) And"     
	3           "(If HRUSLt Is 35+ Or If Entry Of 1 In"   
	4           "If Entry Of 1 In Hrwant And HRACTt <"    
	5           "All Others Goto HRCK8"                   
;
label values puhrck12 puhrck1b;
label define puhrck1b
	1           "If Entry Of 2, D Or R In BUS2 And"       
	2           "All Others Goto Iock1"                   
;
label values pulaydt  pulaydt;
label define pulaydt 
	1           "Yes"                                     
	2           "No"                                      
;
label values pulay6m  pulay6m;
label define pulay6m 
	1           "Yes"                                     
	2           "No"                                      
;
label values pelayavl pelayavl;
label define pelayavl
	1           "Yes"                                     
	2           "No"                                      
;
label values pulayavr pulayavr;
label define pulayavr
	1           "Own Temporary Illness"                   
	2           "Going To School"                         
	3           "Other"                                   
;
label values pelaylk  pelaylk;
label define pelaylk 
	1           "Yes"                                     
	2           "No"                                      
;
label values pelayfto pelayfto;
label define pelayfto
	1           "Yes"                                     
	2           "No"                                      
;
label values pulayck1 pulaycka;
label define pulaycka
	1           "Goto PULAYCK3"                           
	2           "Goto PULAYFT"                            
	3           "Goto PULAYDR"                            
;
label values pulayck2 pulayckb;
label define pulayckb
	1           "Goto PULAYDR3"                           
	2           "Goto PULAYFT"                            
;
label values pulayck3 pulayckc;
label define pulayckc
	1           "MISCK = 5 GOTO IO1INT"                   
	2           "I-ICR = 1 OR I-OCR = 1, GOTO IO1INT"     
	3           "ALL OTHERS GOTO SCHCK"                   
;
label values pulk     pulk;   
label define pulk    
	1           "Yes"                                     
	2           "No"                                      
	3           "Retired"                                 
	4           "Disabled"                                
	5           "Unable To Work"                          
;
label values pelkm1   pelkm1l;
label define pelkm1l 
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/courses"  
	12          "Nothing"                                 
	13          "Other Passive"                           
;
label values pulkm2   pulkm2l;
label define pulkm2l 
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Pulbic Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkm3   pulkm3l;
label define pulkm3l 
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/courses"  
	13          "Other Passive"                           
;
label values pulkm4   pulkm4l;
label define pulkm4l 
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Pulbic Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/courses"  
	13          "Other Passive"                           
;
label values pulkm5   pulkm5l;
label define pulkm5l 
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkm6   pulkm6l;
label define pulkm6l 
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Pulbic Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkdk1  pulkdk1l;
label define pulkdk1l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	12          "Nothing"                                 
	13          "Other Passive"                           
;
label values pulkdk2  pulkdk2l;
label define pulkdk2l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkdk3  pulkdk3l;
label define pulkdk3l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkdk4  pulkdk4l;
label define pulkdk4l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkdk5  pulkdk5l;
label define pulkdk5l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkdk6  pulkdk6l;
label define pulkdk6l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkps1  pulkps1l;
label define pulkps1l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	12          "Nothing"                                 
	13          "Other Passive"                           
;
label values pulkps2  pulkps2l;
label define pulkps2l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkps3  pulkps3l;
label define pulkps3l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkps4  pulkps4l;
label define pulkps4l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkps5  pulkps5l;
label define pulkps5l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pulkps6  pulkps6l;
label define pulkps6l
	1           "Contacted Employer Directly/Interview"   
	2           "Contacted Public Employment Agency"      
	3           "Contacted Private Employment Agency"     
	4           "Contacted Friends Or Relatives"          
	5           "Contacted School/University Empl"        
	6           "Sent Out Resumes/Filled Out"             
	7           "Checked Union/Professional Registers"    
	8           "Placed Or Answered Ads"                  
	9           "Other Active"                            
	10          "Looked At Ads"                           
	11          "Attended Job Training Programs/Courses"  
	13          "Other Passive"                           
;
label values pelkavl  pelkavl;
label define pelkavl 
	1           "Yes"                                     
	2           "No"                                      
;
label values pulkavr  pulkavr;
label define pulkavr 
	1           "Waiting For New Job To Begin"            
	2           "Own Temporary Illness"                   
	3           "Going To School"                         
	4           "Other - Specify"                         
;
label values pelkll1o pelkll1o;
label define pelkll1o
	1           "Working"                                 
	2           "School"                                  
	3           "Left Military Service"                   
	4           "Something Else"                          
;
label values pelkll2o pelkll2o;
label define pelkll2o
	1           "Lost Job"                                
	2           "Quit Job"                                
	3           "Temporary Job Ended"                     
;
label values pelklwo  pelklwo;
label define pelklwo 
	1           "Within The Last 12 Months"               
	2           "More Than 12 Months Ago"                 
	3           "Never Worked"                            
;
label values pelkfto  pelkfto;
label define pelkfto 
	1           "Yes"                                     
	2           "No"                                      
	3           "Doesn't Matter"                          
;
label values pedwwnto pedwwnto;
label define pedwwnto
	1           "Yes, Or Maybe, It Depends"               
	2           "No"                                      
	3           "Retired"                                 
	4           "Disabled"                                
	5           "Unable"                                  
;
label values pedwrsn  pedwrsn;
label define pedwrsn 
	1           "Believes No Work Available In Area Of"   
	2           "Couldn't Find Any Work"                  
	3           "Lacks Necessary Schooling/training"      
	4           "Employers Think Too Young Or Too Old"    
	5           "Other Types Of Discrimination"           
	6           "Can't Arrange Child Care"                
	7           "Family Responsibilities"                 
	8           "In School Or Other Training"             
	9           "Ill-health, Physical Disability"         
	10          "Transportation Problems"                 
	11          "Other - Specify"                         
;
label values pedwlko  pedwlko;
label define pedwlko 
	1           "Yes"                                     
	2           "No"                                      
;
label values pedwwk   pedwwk; 
label define pedwwk  
	1           "Yes"                                     
	2           "No"                                      
;
label values pedw4wk  pedw4wk;
label define pedw4wk 
	1           "Yes"                                     
	2           "No"                                      
;
label values pedwlkwk pedwlkwk;
label define pedwlkwk
	1           "Yes"                                     
	2           "No"                                      
;
label values pedwavl  pedwavl;
label define pedwavl 
	1           "Yes"                                     
	2           "No"                                      
;
label values pedwavr  pedwavr;
label define pedwavr 
	1           "Own Temporary Illness"                   
	2           "Going To School"                         
	3           "Other"                                   
;
label values pudwck1  pudwck1l;
label define pudwck1l
	1           "If Entry Of 2 In BUS2 Goto PUSCHCK"      
	2           "If Entry Of 3 On Absrsn Goto UNLFCK1"    
	3           "If Entry Of 1 In Ret1, Store 1 In"       
	4           "All Others Goto PUDWWNT"                 
;
label values pudwck2  pudwck2l;
label define pudwck2l
	1           "If Entry In Dis1 Or Dis2 Goto"           
	2           "If Entry Of 4 In Dwwnt Goto PUDIS1"      
	3           "If Entry Of 5 In Dwwnt Goto PUDIS2"      
	4           "All Others Goto PUDWCK4"                 
;
label values pudwck3  pudwck3l;
label define pudwck3l
	1           "If AGERNG Equals 1-4 Or 9 Goto PUDWCK4"  
	2           "All Others Goto PUNLFCK2"                
;
label values pudwck4  pudwck4l;
label define pudwck4l
	1           "If Entry Of 10 And/or 11 And/or 13"      
	2           "If Entry Of 10 And/or 11 And/or 13"      
	3           "If Entry Of 10 And/or 11 And/Or 13"      
	4           "All Others Goto PUDWRSN"                 
;
label values pudwck5  pudwck5l;
label define pudwck5l
	1           "If Entry Of 1 In LK Then"                
	2           "All Others Goto PUDWLK"                  
;
label values pejhwko  pejhwko;
label define pejhwko 
	1           "Yes"                                     
	2           "No"                                      
;
label values pujhdp1o pujhdp1o;
label define pujhdp1o
	1           "Yes"                                     
	2           "No"                                      
;
label values pejhrsn  pejhrsn;
label define pejhrsn 
	1           "Personal/Family (Including"              
	2           "Return To School"                        
	3           "Health"                                  
	4           "Retirement Or Old Age"                   
	5           "Temp, Seasonal Or Intermittent Job"      
	6           "Slack Work/business Conditions"          
	7           "Unsatisfactory Work Arrangements"        
	8           "Other - Specify"                         
;
label values pejhwant pejhwant;
label define pejhwant
	1           "Yes, Or It Depends"                      
	2           "No"                                      
;
label values pujhck1  pujhck1l;
label define pujhck1l
	1           "PURET1 = 1, -2, Or -3 Then"              
	2           "If MISCK Equals 4 Or 8 Then"             
	3           "All Others Goto PUNLFCK1"                
;
label values pujhck2  pujhck2l;
label define pujhck2l
	1           "If Entry Of 1 In DWWK And"               
	2           "If Entry Of 2, D Or R In DWWK Then"      
	3           "All Others Goto PUJHWK"                  
;
label values prabsrea prabsrea;
label define prabsrea
	1           "Ft Paid-Vacation"                        
	2           "Ft Paid-Own Illness"                     
	3           "Ft Paid-Child Care Problems"             
	4           "Ft Paid-Other Family/Personal"           
	5           "Ft Paid-Maternity/Paternity Leave"       
	6           "Ft Paid-Labor Dispute"                   
	7           "Ft Paid-Weather Affected Job"            
	8           "Ft Paid-School/Training"                 
	9           "Ft Paid-Civic/Military Duty"             
	10          "Ft Paid-Other"                           
	11          "Ft Unpaid-Vacation"                      
	12          "Ft Unpaid-Own Illness"                   
	13          "Ft Unpaid-Child Care Problems"           
	14          "Ft Unpaid-Other Fam/Personal"            
	15          "Ft Unpaid-Maternity/Paternity Leave"     
	16          "Ft Unpaid-Labor Dispute"                 
	17          "Ft Unpaid-Weather Affected Job"          
	18          "Ft Unpaid-School/Training"               
	19          "Ft Unpaid-Civic/Military Duty"           
	20          "Ft Unpaid-Other"                         
	21          "Pt Paid-Vacation"                        
	22          "Pt Paid-Own Illness"                     
	23          "Pt Paid-Child Care Problems"             
	24          "Pt Paid-Other Family/Personal Oblig."    
	25          "Pt Paid-Maternity/Paternity Leave"       
	26          "Pt Paid-Labor Dispute"                   
	27          "Pt Paid-Weather Affected Job"            
	28          "Pt Paid-School/Training"                 
	29          "Pt Paid-Civic/Military Duty"             
	30          "Pt Paid-Other"                           
	31          "Pt Unpaid-Vacation"                      
	32          "Pt Unpaid-Own Illness"                   
	33          "Pt Unpaid-Child Care Problems"           
	34          "Pt Unpaid-Other Fam/Personal"            
	35          "Pt Unpaid-Maternity/Paternity Leave"     
	36          "Pt Unpaid-Labor Dispute"                 
	37          "Pt Unpaid-Weather Affected Job"          
	38          "Pt Unpaid-School/Training"               
	39          "Pt Unpaid-Civic/Military Duty"           
	40          "Pt Unpaid-Other"                         
;
label values prcivlf  prcivlf;
label define prcivlf 
	1           "In Civilian Labor Force"                 
	2           "Not In Civilian Labor Force"             
;
label values prdisc   prdisc; 
label define prdisc  
	1           "Discouraged Worker"                      
	2           "Conditionally Interested"                
	3           "Not Available"                           
;
label values premphrs premphrs;
label define premphrs
	0           "Unemployed And Nilf"                     
	1           "W/job, Not At Work-Illnes"               
	2           "W/job, Not At Work-Vacation"             
	3           "W/job, Not At Work-Weather"              
	4           "W/job, Not At Work-Labor Dispute"        
	5           "W/job, Not At Work-Child Care"           
	6           "W/job, Not At Work-Fam/Pers"             
	7           "W/job, Not At Work-Maternity/"           
	8           "W/job, Not At Work-School/"              
	9           "W/job, Not At Work-Civic/"               
	10          "W/job, Not At Work-Does Not"             
	11          "W/job, Not At Work-Other"                
	12          "At Work- 1-4 Hrs"                        
	13          "At Work- 5-14 Hrs"                       
	14          "At Work- 15-21 Hrs"                      
	15          "At Work- 22-29 Hrs"                      
	16          "At Work- 30-34 Hrs"                      
	17          "At Work- 35-39 Hrs"                      
	18          "At Work- 40 Hrs"                         
	19          "At Work- 41-47 Hrs"                      
	20          "At Work- 48 Hrs"                         
	21          "At Work- 49-59 Hrs"                      
	22          "At Work- 60 Hrs Or More"                 
;
label values prempnot prempnot;
label define prempnot
	1           "Employed"                                
	2           "Unemployed"                              
	3           "Not In Labor Force"                      
	4           "Not In Labor Force"                      
;
label values prexplf  prexplf;
label define prexplf 
	1           "Employed"                                
	2           "Unemployed"                              
;
label values prftlf   prftlf; 
label define prftlf  
	1           "Full Time Labor Force"                   
	2           "Part Time Labor Force"                   
;
label values prhrusl  prhrusl;
label define prhrusl 
	1           "0-20 Hrs"                                
	2           "21-34 Hrs"                               
	3           "35-39 Hrs"                               
	4           "40 Hrs"                                  
	5           "41-49 Hrs"                               
	6           "50 Or More Hrs"                          
	7           "Varies-Full Time"                        
	8           "Varies-Part Time"                        
;
label values prjobsea prjobsea;
label define prjobsea
	1           "Looked Last 4 Weeks - Not Worked"        
	2           "Looked Last 4 Weeks - Worked"            
	3           "Looked Last 4 Weeks - Layoff"            
	4           "Unavailable Job Seekers"                 
	5           "No Recent Job Search"                    
;
label values prpthrs  prpthrs;
label define prpthrs 
	0           "Usually FT, PT For Noneconomic"          
	1           "Usu.FT, Pt Econ Reasons; 1-4 Hrs"        
	2           "Usu.FT, Pt Econ Reasons; 5-14 Hrs"       
	3           "Usu.FT, Pt Econ Reasons; 15-29 Hrs"      
	4           "Usu.FT, Pt Econ Reasons; 30-34 Hrs"      
	5           "Usu.PT, Econ Reasons; 1-4 Hrs"           
	6           "Usu.PT, Econ Reasons; 5-14 Hrs"          
	7           "Usu.PT, Econ Reasons; 15-29 Hrs"         
	8           "Usu.PT, Econ Reasons; 30-34 Hrs"         
	9           "Usu.PT, Non-Econ Reasons; 1-4 Hrs"       
	10          "Usu.PT, Non-Econ Reasons; 5-14 Hrs"      
	11          "Usu.PT, Non-Econ Reasons; 15-29 Hrs"     
	12          "Usu.PT, Non-Econ Reasons; 30-34 Hrs"     
;
label values prptrea  prptrea;
label define prptrea 
	1           "Usu. FT-Slack Work/Business Conditions"  
	2           "Usu. FT-Seasonal Work"                   
	3           "Usu. FT-Job Started/Ended During Week"   
	4           "Usu. FT-Vacation/Personal Day"           
	5           "Usu. FT-Own Illness/Injury/Medical"      
	6           "Usu. FT-Holiday (Religious Or Legal)"    
	7           "Usu. FT-Child Care Problems"             
	8           "Usu. FT-Other Fam/Pers Obligations"      
	9           "Usu. FT-Labor Dispute"                   
	10          "Usu. FT-Weather Affected Job"            
	11          "Usu. FT-School/Training"                 
	12          "Usu. FT-Civic/Military Duty"             
	13          "Usu. FT-Other Reason"                    
	14          "Usu. PT-Slack Work/Business Conditions"  
	15          "Usu. PT-Could Only Find PT Work"         
	16          "Usu. PT-Seasonal Work"                   
	17          "Usu. PT-Child Care Problems"             
	18          "Usu. PT-Other Fam/Pers Obligations"      
	19          "Usu. PT-Health/Medical Limitations"      
	20          "Usu. PT-School/Training"                 
	21          "Usu. PT-Retired/S.S. Limit On"           
	22          "Usu. PT-Workweek <35 Hours"              
	23          "Usu. PT-Other Reason"                    
;
label values prusftpt prusftpt;
label define prusftpt
	1           "Full Time"                               
	2           "Part Time"                               
	3           "Status Unknown"                          
;
label values pruntype pruntype;
label define pruntype
	1           "Job Loser/On Layoff"                     
	2           "Other Job Loser"                         
	3           "Temporary Job Ended"                     
	4           "Job Leaver"                              
	5           "Re-Entrant"                              
	6           "New-Entrant"                             
;
label values prwksch  prwksch;
label define prwksch 
	0           "Not In Labor Force"                      
	1           "At Work"                                 
	2           "With Job, Not At Work"                   
	3           "Unemployed, Seeks FT"                    
	4           "Unemployed, Seeks PT"                    
;
label values prwkstat prwkstat;
label define prwkstat
	1           "Not In Labor Force"                      
	2           "FT Hours (35+), Usually FT"              
	3           "PT For Economic Reasons, Usually FT"     
	4           "PT For Non-Economic Reasons,"            
	5           "Not At Work, Usually FT"                 
	6           "PT Hrs, Usually PT For Economic"         
	7           "PT Hrs, Usually PT For Non-Economic"     
	8           "FT Hours, Usually PT For Economic"       
	9           "FT Hours, Usually PT For Non-Economic"   
	10          "Not At Work, Usually Part-Time"          
	11          "Unemployed FT"                           
	12          "Unemployed PT"                           
;
label values prwntjob prwntjob;
label define prwntjob
	1           "Want A Job"                              
	2           "Other Not In Labor Force"                
;
label values pujhck3  pujhck3l;
label define pujhck3l
	1           "If I-MLR Eq 3 Or 4 Then Goto PUJHDP1"    
	2           "All Others Goto PUJHRSN"                 
;
label values pujhck4  pujhck4l;
label define pujhck4l
	1           "If Entry Of 2, D Or R In PUDW4WK"        
	2           "If Entry Of 1 In PUDW4WK Or In"          
	3           "If I-MLR Equals 1 Or 2 And Entry In"     
	4           "If Entry In PUJHRSN Then Goto PUIO1INT"  
	5           "All Others Goto PUNLFCK1"                
;
label values pujhck5  pujhck5l;
label define pujhck5l
	1           "If I-IO1ICR Equals 1 Or I-IO1OCR"        
	2           "All Others Goto PUIOCK5"                 
;
label values puiodp1  puiodp1l;
label define puiodp1l
	1           "Yes"                                     
	2           "No"                                      
;
label values puiodp2  puiodp2l;
label define puiodp2l
	1           "Yes"                                     
	2           "No"                                      
;
label values puiodp3  puiodp3l;
label define puiodp3l
	1           "YES"                                     
	2           "NO"                                      
;
label values peio1cow peio1cow;
label define peio1cow
	1           "Government - Federal"                    
	2           "Government - State"                      
	3           "Government - Local"                      
	4           "Private, For Profit"                     
	5           "Private, Nonprofit"                      
	6           "Self-Employed, Incorporated"             
	7           "Self-Employed, Unincorporated"           
	8           "Without Pay"                             
;
label values puio1mfg puio1mfg;
label define puio1mfg
	1           "Manufacturing"                           
	2           "Retail Trade"                            
	3           "Wholesale Trade"                         
	4           "Something Else"                          
;
label values peio2cow peio2cow;
label define peio2cow
	1           "Government - Federal"                    
	2           "Government - State"                      
	3           "Government - Local"                      
	4           "Private, For Profit"                     
	5           "Private, Nonprofit"                      
	6           "Self-Employed, Incorporated"             
	7           "Self-Employed, Unincorporated"           
	8           "Without Pay"                             
	9           "Unknown"                                 
	10          "Government, Level Unknown"               
	11          "Self-Employed, Incorp."                  
;
label values puio2mfg puio2mfg;
label define puio2mfg
	1           "Manufacturing"                           
	2           "Retail Trade"                            
	3           "Wholesale Trade"                         
	4           "Something Else"                          
;
label values puiock1  puiock1l;
label define puiock1l
	1           "If {MISCK Eq 1 Or 5) Or MISCK Eq 2-4,"   
	2           "If (MISCK Eq 1 Or 5) Or {(MISCK"         
	3           "If I-IO1NAM Is D, R Or Blank Then"       
	4           "All Others Goto PUIODP1"                 
;
label values puiock2  puiock2l;
label define puiock2l
	1           "If I-IO1ICR Eq 1 Then"                   
	2           "If I-IO1OCR Eq 1 Then"                   
	3           "All Others Goto PUIODP2"                 
;
label values puiock3  puiock3l;
label define puiock3l
	1           "If I-IO1OCC Equals D, R Or"              
	2           "If I-IO1DT1 Is D, R Or Blank"            
	3           "All Others Goto PUIODP3"                 
;
label values prioelg  prioelg;
label define prioelg 
	0           "Not Eligible For Edit"                   
	1           "Eligible For Edit"                       
;
label values prana    prana;  
label define prana   
	1           "Agricultural"                            
	2           "Non-Agricultural"                        
;
label values prcow1   prcow1l;
label define prcow1l 
	1           "Federal Govt"                            
	2           "State Govt"                              
	3           "Local Govt"                              
	4           "Private (Incl. Self-"                    
	5           "Self-Employed, Unincorp."                
	6           "Without Pay"                             
;
label values prcow2   prcow2l;
label define prcow2l 
	1           "Federal Govt"                            
	2           "State Govt"                              
	3           "Local Govt"                              
	4           "Private (Incl. Self-employed"            
	5           "Self-Employed, Unincorp."                
	6           "Without Pay"                             
;
label values prcowpg  prcowpg;
label define prcowpg 
	1           "Private"                                 
	2           "Government"                              
;
label values prdtcow1 prdtcowa;
label define prdtcowa
	1           "Agri., Wage & Salary, Private"           
	2           "Agri., Wage & Salary, Government"        
	3           "Agri., Self-Employed"                    
	4           "Agri., Unpaid"                           
	5           "NonAg, WS, Private, Private Hhlds"       
	6           "NonAg, WS, Private, Other Private"       
	7           "NonAg, WS, Govt, Federal"                
	8           "NonAg, WS, Govt, State"                  
	9           "NonAg, WS, Govt, Local"                  
	10          "NonAg, Self-Employed"                    
	11          "NonAg, Unpaid"                           
;
label values prdtcow2 prdtcowb;
label define prdtcowb
	1           "Agri., Wage & Salary, Private"           
	2           "Agri., Wage & Salary, Government"        
	3           "Agri., Self-Employed"                    
	4           "Agri., Unpaid"                           
	5           "NonAg, WS, Private, Private Hhlds"       
	6           "NonAg, WS, Private, Other Private"       
	7           "NonAg, WS, Govt, Federal"                
	8           "NonAg, WS, Govt, State"                  
	9           "NonAg, WS, Govt, Local"                  
	10          "NonAg, Self-Employed"                    
	11          "NonAg, Unpaid"                           
;
label values prdtind1 prdtinda;
label define prdtinda
	1           "Goods Producing-Agricultural"            
	2           "Goods Producing-Other Agricultural"      
	3           "Mining"                                  
	4           "Construction"                            
	5           "Mfg-Lumber & Wood Prods, Ex"             
	6           "Mfg-Furniture & Fixtures"                
	7           "Mfg-Stone, Clay, Concrete,"              
	8           "Mfg-Primary Metals"                      
	9           "Mfg-Fabricated Metals"                   
	10          "Mfg-Not Specified Metal Industries"      
	11          "Mfg-Machinery, Ex Electrical"            
	12          "Mfg-Electrical Machinery, Equip"         
	13          "Mfg-Motor Vehicles & Equip"              
	14          "Mfg-Aircraft & Parts"                    
	15          "Mfg-Other Transportation Equipment"      
	16          "Mfg-Professional & Photo Equip,"         
	17          "Mfg-Toys, Amusement & Sporting Goods"    
	18          "Mfg-Misc & Nec Mfg Industries"           
	19          "Mfg-Food & Kindred Prods"                
	20          "Mfg-Tobacco Prods"                       
	21          "Mfg-Textile Mill Prods"                  
	22          "Mfg-Apparel & Other Finished"            
	23          "Mfg-Paper & Allied Products"             
	24          "Mfg-Printing, Publishing & Allied Inds"  
	25          "Mfg-Chemicals & Allied Prods"            
	26          "Mfg-Petroleum & Coal Prods"              
	27          "Mfg-Rubber & Misc Plastic Prods"         
	28          "Mfg-Leather & Leather Prods"             
	29          "Transportation"                          
	30          "Communications"                          
	31          "Utilities & Sanitary Services"           
	32          "Wholesale Trade"                         
	33          "Eating And Drinking Places"              
	34          "Other Retail Trade"                      
	35          "Banking And Other Finance"               
	36          "Insurance And Real Estate"               
	37          "Private Household Services"              
	38          "Business Services"                       
	39          "Automobile And Repair Services"          
	40          "Personal Serv Exc Private Households"    
	41          "Entertainment & Recreation Services"     
	42          "Hospitals"                               
	43          "Health Services, Exc. Hospitals"         
	44          "Educational Services"                    
	45          "Social Services"                         
	46          "Other Professional Services"             
	47          "Forestry & Fisheries"                    
	48          "Justice, Public Order & Safety"          
	49          "Admin Of Human Resource Programs"        
	50          "National Security & Internal Affairs"    
	51          "Other Public Administration"             
	52          "Armed Forces"                            
;
label values prdtind2 prdtindb;
label define prdtindb
	1           "Goods Producing-Agricultural Services"   
	2           "Goods Producing-Other Agricultural"      
	3           "Mining"                                  
	4           "Construction"                            
	5           "Mfg-Lumber & Wood Prods, Ex Furniture"   
	6           "Mfg-Furniture & Fixtures"                
	7           "Mfg-Stone, Clay, Concrete, Glass Prods"  
	8           "Mfg-Primary Metals"                      
	9           "Mfg-Fabricated Metals"                   
	10          "Mfg-Not Specified Metal Industries"      
	11          "Mfg-Machinery, Ex Electrical"            
	12          "Mfg-Electrical Machinery, Equip"         
	13          "Mfg-Motor Vehicles & Equip"              
	14          "Mfg-Aircraft & Parts"                    
	15          "Mfg-Other Transportation Equipment"      
	16          "Mfg-Professional & Photo Equip,"         
	17          "Mfg-Toys, Amusement & Sporting Goods"    
	18          "Mfg-Misc & Nec Mfg Industries"           
	19          "Mfg-Food & Kindred Prods"                
	20          "Mfg-Tobacco Prods"                       
	21          "Mfg-Textile Mill Prods"                  
	22          "Mfg-Apparel & Other Finished"            
	23          "Mfg-Paper & Allied Products"             
	24          "Mfg-Printing, Publishing & Allied Inds"  
	25          "Mfg-Chemicals & Allied Prods"            
	26          "Mfg-Petroleum & Coal Prods"              
	27          "Mfg-Rubber & Misc Plastic Prods"         
	28          "Mfg-Leather & Leather Prods"             
	29          "Transportation"                          
	30          "Communications"                          
	31          "Utilities & Sanitary Services"           
	32          "Wholesale Trade"                         
	33          "Eating And Drinking Places"              
	34          "Other Retail Trade"                      
	35          "Banking And Other Finance"               
	36          "Insurance And Real Estate"               
	37          "Private Household Services"              
	38          "Business Services"                       
	39          "Automobile And Repair Services"          
	40          "Personal Serv Exc Private Households"    
	41          "Entertainment & Recreation Services"     
	42          "Hospitals"                               
	43          "Health Services, Exc. Hospitals"         
	44          "Educational Services"                    
	45          "Social Services"                         
	46          "Other Professional Services"             
	47          "Forestry & Fisheries"                    
	48          "Justice, Public Order & Safety"          
	49          "Admin Of Human Resource Programs"        
	50          "National Security & Internal Affairs"    
	51          "Other Public Administration"             
	52          "Armed Forces"                            
;
label values prdtocc1 prdtocca;
label define prdtocca
	1           "Officials & Administrators,"             
	2           "Other Executive, Admin. & Managerial"    
	3           "Management Related Occupations"          
	4           "Engineers"                               
	5           "Mathematical And Computer Scientists"    
	6           "Natural Scientists"                      
	7           "Health Diagnosing Occupations"           
	8           "Health Assessment And Treatment"         
	9           "Teachers, College And University"        
	10          "Teachers, Except College And"            
	11          "Lawyers And Judges"                      
	12          "Other Professional Specialty"            
	13          "Health Technologists And Technicians"    
	14          "Engineering And Science Technicians"     
	15          "Technicians, Except Health,"             
	16          "Supervisors And Proprietors, Sales"      
	17          "Sales Reps, Finance And Business"        
	18          "Sales Reps, Commodities, Except Retail"  
	19          "Sales Workers, Retail & Personal"        
	20          "Sales Related Occupations"               
	21          "Supervisors, Administrative Support"     
	22          "Compute"                                 
	23          "Secretaries, Stenographers, And"         
	24          "Financial Records Processing"            
	25          "Mail And Message Distribution"           
	26          "Other Admin. Support, Including"         
	27          "Private Household Service Occupations"   
	28          "Protective Service"                      
	29          "Food Service"                            
	30          "Health Service"                          
	31          "Cleaning And Building Service"           
	32          "Personal Service"                        
	33          "Mechanics And Repairers"                 
	34          "Construction Trades"                     
	35          "Other Precision Production, Craft, And"  
	36          "Machine Operators, And Tenders, Except"  
	37          "Fabricators, Assemblers, Inspectors,"    
	38          "Motot Vehicle Operators"                 
	39          "Other Transportation And Material"       
	40          "Construction Laborers"                   
	41          "Freight, Stock, & Materials Handlers"    
	42          "Other Handlers, Equipt. Cleaners,"       
	43          "Farm Operators And Managers"             
	44          "Farm Workers And Related Occupations"    
	45          "Forestry And Fishing Occupations"        
	46          "Armed Forces"                            
;
label values prdtocc2 prdtoccb;
label define prdtoccb
	1           "Officials & Administrators,"             
	2           "Other Executive, Admin. & Managerial"    
	3           "Management Related Occupations"          
	4           "Engineers"                               
	5           "Mathematical And Computer Scientists"    
	6           "Natural Scientists"                      
	7           "Health Diagnosing Occupations"           
	8           "Health Assessment And Treatment"         
	9           "Teachers, College And University"        
	10          "Teachers, Except College And"            
	11          "Lawyers And Judges"                      
	12          "Other Professional Speciality"           
	13          "Health Technologists And Technicians"    
	14          "Engineering And Science Technicians"     
	15          "Technicians, Except Health,"             
	16          "Supervisors And Proprietors, Sales"      
	17          "Sales Reps, Finance And Business"        
	18          "Sales Reps, Commodities, Except Retail"  
	19          "Sales Workers, Retail & Personal"        
	20          "Sales Related Occupations"               
	21          "Supervisors, Administrative Support"     
	22          "Computer Equiptment Operators"           
	23          "Secretaries, Stenographers, And"         
	26          "Other Admin. Support, Including"         
	27          "Private Household Service Occupations"   
	28          "Protective Service"                      
	29          "Food Service"                            
	30          "Health Service"                          
	31          "Cleaning And Building Service"           
	32          "Personal Service"                        
	37          "Fabricators, Assemblers, Inspectors,"    
	38          "Motor Vehicle Operators"                 
	39          "Other Transportation And Material"       
	40          "Construction Laborers"                   
	41          "Freight, Stock, & Materials Handlers"    
	42          "Other Handlers, Equipt. Cleaners,"       
	43          "Farm Operators And Managers"             
	44          "Farm Workers And Related Occupations"    
	45          "Forestry And Fishing Occupations"        
	46          "Armed Forces"                            
;
label values premp    premp;  
label define premp   
	1           "Employed Persons (Exc. Farm & Priv Hh)"  
;
label values prmjind1 prmjinda;
label define prmjinda
	1           "Agriculture"                             
	2           "Mining"                                  
	3           "Construction"                            
	4           "Manufacturing - Durable Goods"           
	5           "Manufacturing - Non-Durable Goods"       
	6           "Transportation"                          
	7           "Communications"                          
	8           "Utilities And Sanitary Services"         
	9           "Wholesale Trade"                         
	10          "Retail Trade"                            
	11          "Finance, Insurance, And Real Estate"     
	12          "Private Households"                      
	13          "Business, Auto And Repair Services"      
	14          "Personal Services, Exc. Private Hhlds"   
	15          "Entertainment And Recreation Services"   
	16          "Hospitals"                               
	17          "Medical Services, Exc. Hospitals"        
	18          "Educational Services"                    
	19          "Social Services"                         
	20          "Other Professional Services"             
	21          "Forestry And Fisheries"                  
	22          "Public Administration"                   
	23          "Armed Forces"                            
;
label values prmjind2 prmjindb;
label define prmjindb
	1           "Agriculture"                             
	2           "Mining"                                  
	3           "Construction"                            
	4           "Manufacturing - Durable Goods"           
	5           "Manufacturing - Non-Durable Goods"       
	6           "Transportation"                          
	7           "Communications"                          
	8           "Utilities And Sanitary Services"         
	9           "Wholesale Trade"                         
	10          "Retail Trade"                            
	11          "Finance, Insurance, And Real Estate"     
	12          "Private Households"                      
	13          "Business, Auto And Repair Services"      
	14          "Personal Services, Exc. Private Hhlds"   
	15          "Entertainment And Recreation Services"   
	16          "Hospitals"                               
	17          "Medical Services, Exc. Hospitals"        
	18          "Educational Services"                    
	19          "Social Services"                         
	20          "Other Professional Services"             
	21          "Forestry And Fisheries"                  
	22          "Public Administration"                   
	23          "Armed Forces"                            
;
label values prmjocc1 prmjocca;
label define prmjocca
	1           "Executive, Administrative, &"            
	2           "Professional Specialty Occupations"      
	3           "Technicians And Related Support"         
	4           "Sales Occupations"                       
	5           "Administrative Support Occupations,"     
	6           "Private Household Occupations"           
	7           "Protective Service Occupations"          
	8           "Service Occupations, Except Protective"  
	9           "Precision Production, Craft & Repair"    
	10          "Machine Operators, Assemblers &"         
	11          "Transportation And Material Moving"      
	12          "Handlers, Equip Cleaners, Helpers,"      
	13          "Farming, Forestry And Fishing"           
	14          "Armed Forces"                            
;
label values prmjocc2 prmjoccb;
label define prmjoccb
	1           "Executive, Administrative, &"            
	2           "Professional Specialty Occupations"      
	3           "Technicians And Related Support"         
	4           "Sales Occupations"                       
	5           "Administrative Support Occupations,"     
	6           "Private Household Occupations"           
	7           "Protective Service Occupations"          
	8           "Service Occupations, Except Protective"  
	9           "Precision Production, Craft & Repair"    
	10          "Machine Operators, Assemblers &"         
	11          "Transportation And Material Moving"      
	12          "Handlers, Equip Cleaners, Helpers,"      
	13          "Farming, Forestry And Fishing"           
	14          "Armed Forces"                            
;
label values prmjocgr prmjocgr;
label define prmjocgr
	1           "Managerail & Professional, Technical,"   
	2           "Service Occupations"                     
	3           "Production, Craft, Repair, Operators"    
	4           "Farming, Forestry & Fishing"             
;
label values prnagpws prnagpws;
label define prnagpws
	1           "Non-Ag Priv Wage & Salary (Ex Priv Hh)"  
;
label values prnagws  prnagws;
label define prnagws 
	1           "Non-Ag Wage And Salary Workers"          
;
label values prsjmj   prsjmj; 
label define prsjmj  
	1           "Single Jobholder"                        
	2           "Multiple Jobholder"                      
;
label values prerelg  prerelg;
label define prerelg 
	0           "Not Eligible For Edit"                   
	1           "Eligible For Edit"                       
;
label values peernuot peernuot;
label define peernuot
	1           "Yes"                                     
	2           "No"                                      
;
label values peernper peernper;
label define peernper
	1           "Hourly"                                  
	2           "Weekly"                                  
	3           "Bi-Weekly"                               
	4           "Twice Monthly"                           
	5           "Monthly"                                 
	6           "Annually"                                
	7           "Other - Specify"                         
;
label values peernrt  peernrt;
label define peernrt 
	1           "Yes"                                     
	2           "No"                                      
;
label values peernhry peernhry;
label define peernhry
	1           "Hourly Worker"                           
	2           "NonHourly Worker"                        
;
label values pthr     pthr;   
label define pthr    
	0           "Not Topcoded"                            
	1           "Topcoded"                                
;
label values ptwk     ptwk;   
label define ptwk    
	0           "Not Topcoded"                            
	1           "Topcoded"                                
;
label values ptot     ptot;   
label define ptot    
	0           "Not Topcoded"                            
	1           "Topcoded"                                
;
label values peernlab peernlab;
label define peernlab
	1           "Yes"                                     
	2           "No"                                      
;
label values peerncov peerncov;
label define peerncov
	1           "Yes"                                     
	2           "No"                                      
;
label values penlfjh  penlfjh;
label define penlfjh 
	1           "Within The Last 12 Months"               
	2           "More Than 12 Months Ago"                 
	3           "Never Worked"                            
;
label values penlfret penlfret;
label define penlfret
	1           "Yes"                                     
	2           "No"                                      
;
label values penlfact penlfact;
label define penlfact
	1           "Disabled"                                
	2           "Ill"                                     
	3           "In School"                               
	4           "Taking Care Of House Or"                 
	5           "In Retirement"                           
	6           "Something Else/other"                    
;
label values punlfck1 punlfcka;
label define punlfcka
	1           "If AGERNG Equals 1-4 Or 9"               
	2           "All Others Go to NLFRET"                 
;
label values punlfck2 punlfckb;
label define punlfckb
	1           "If MISCK Equals 4 Or"                    
	2           "All Others Goto LBFR-end"                
;
label values peschenr peschenr;
label define peschenr
	1           "Yes"                                     
	2           "No"                                      
;
label values peschft  peschft;
label define peschft 
	1           "Full-time"                               
	2           "Part-time"                               
;
label values peschlvl peschlvl;
label define peschlvl
	1           "High School"                             
	2           "College Or University"                   
;
label values prnlfsch prnlfsch;
label define prnlfsch
	1           "In School"                               
	2           "Not In School"                           
;
label values prwernal prwernal;
label define prwernal
	0           "No Allocation"                           
	1           "One Or More Components Of"               
;
label values prhernal prhernal;
label define prhernal
	0           "No Allocation"                           
	1           "One Or More Components Of"               
;
label values pedipged pedipged;
label define pedipged
	1           "Graduation From High School"             
	2           "Ged Or Other Equivalent"                 
;
label values pehgcomp pehgcomp;
label define pehgcomp
	1           "Less Than 1st Grade"                     
	2           "1st, 2nd, 3rd, Or 4th Grade"             
	3           "5th Or 6th Grade"                        
	4           "7th Or 8th Grade"                        
	5           "9th Grade"                               
	6           "10th Grade"                              
	7           "11th Grade"                              
	8           "12th Grade (No Diploma)"                 
;
label values pecyc    pecyc;  
label define pecyc   
	1           "Less Than 1 Year (Includes 0 Years"      
	2           "The First Or Freshman Year"              
	3           "The Second Or Sophomore Year"            
	4           "The Third Or Junior Year"                
	5           "Four Or More Years"                      
;
label values pegrprof pegrprof;
label define pegrprof
	1           "Yes"                                     
	2           "No"                                      
;
label values pegr6cor pegr6cor;
label define pegr6cor
	1           "Yes"                                     
	2           "No"                                      
;
label values pems123  pems123l;
label define pems123l
	1           "1 Year Program"                          
	2           "2 Year Program"                          
	3           "3 Year Program"                          
;
label values pesschol pesschol;
label define pesschol
	1           "Yes"                                     
	2           "No"                                      
;
label values pepublic pepublic;
label define pepublic
	1           "Public"                                  
	2           "Private"                                 
;
label values pegrade  pegrade;
label define pegrade 
	13          "1st year of college (freshman)"          
	14          "2nd year of college (sophomore)"         
	15          "3rd year of college (junior)"            
	16          "4th year of college (senior)"            
	17          "1st year of graduate school"             
	18          "2nd year or higher of graduate school"   
;
label values pefull   pefull; 
label define pefull  
	1           "Full-time"                               
	2           "Part-time"                               
;
label values pestype  pestype;
label define pestype 
	1           "2-year college (community or junior college)"
	2           "4-year college or university"            
;
label values pevoca   pevoca; 
label define pevoca  
	1           "Yes"                                     
	2           "No"                                      
;
label values pelastyr pelastyr;
label define pelastyr
	1           "Yes"                                     
	2           "No"                                      
;
label values pelastgd pelastgd;
label define pelastgd
	13          "1st year of college (freshman)"          
	14          "2nd year of college (sophomore)"         
	15          "3rd year of college (junior)"            
	16          "4th year of college (senior)"            
	17          "1st year of graduate school"             
	18          "2nd year or higher of graduate school"   
;
label values peyratt  peyratt;
label define peyratt 
	1           "1998"                                    
	2           "1997 or before"                          
	3           "Never attended"                          
;
label values peyrdeg  peyrdeg;
label define peyrdeg 
	1           "1998"                                    
	2           "1997 or before"                          
;
label values peyrdip  peyrdip;
label define peyrdip 
	1           "1998"                                    
	2           "1997 or before"                          
;
label values peged    peged;  
label define peged   
	1           "Yes"                                     
	2           "No"                                      
;
label values pesusfpx pesusfpx;
label define pesusfpx
	1           "Self"                                    
	2           "Parent"                                  
	3           "Spouse"                                  
	4           "Other relative"                          
	5           "Nonrelative"                             
;
label values pesch35  pesch35l;
label define pesch35l
	1           "Yes"                                     
	2           "No"                                      
;
label values pesch614 pesch61d;
label define pesch61d
	1           "Yes"                                     
	2           "No"                                      
;
label values pechpub  pechpub;
label define pechpub 
	1           "Public"                                  
	2           "Private"                                 
;
label values pechgrde pechgrde;
label define pechgrde
	1           "Nursery (pre-school, prekindergarten) full-day"
	2           "Nursery (pre-school, prekindergarten) part-day"
	3           "Kindergarten full-day"                   
	4           "Kindergarten part-day"                   
;
label values pes56    pes56l; 
label define pes56l  
	1           "Yes"                                     
	2           "No"                                      
;
label values pes57    pes57l; 
label define pes57l  
	1           "Nursery school (pre-school, prekindergarten)"
	2           "Kindergarten"                            
;
label values prenr    prenr;  
label define prenr   
	0           "Not enrolled"                            
	1           "Enrolled"                                
;
label values prenpupr prenpupr;
label define prenpupr
	1           "Enrolled - private school"               
	2           "Enrolled - public school"                
	3           "Not enrolled"                            
;
label values prlevel  prlevel;
label define prlevel 
	20          "Nursery school"                          
	21          "Kindergarten"                            
	13          "1st year of college (freshman)"          
	14          "2nd year of college (sophomore)"         
	15          "3rd year of college (junior)"            
	16          "4th year of college (senior)"            
	17          "1st year of graduate school"             
	18          "2nd year or higher of graduate school"   
;
label values pxsschol pxsschol;
label define pxsschol
	1           "Allocatede"                              
;
label values pxpublic pxpublic;
label define pxpublic
	1           "Allocated"                               
;
label values pxgrade  pxgrade;
label define pxgrade 
	1           "Allocated"                               
;
label values pxfull   pxfull; 
label define pxfull  
	1           "Allocated"                               
;
label values pxstype  pxstype;
label define pxstype 
	1           "Allocated"                               
;
label values pxvoca   pxvoca; 
label define pxvoca  
	1           "Allocated"                               
;
label values pxlastyr pxlastyr;
label define pxlastyr
	1           "Allocated"                               
;
label values pxlastgd pxlastgd;
label define pxlastgd
	1           "Allocated"                               
;
label values pxyrdeg  pxyrdeg;
label define pxyrdeg 
	1           "Allocated"                               
;
label values pxyratt  pxyratt;
label define pxyratt 
	1           "Allocated"                               
;
label values pxyrdip  pxyrdip;
label define pxyrdip 
	1           "Allocated"                               
;
label values pxged    pxged;  
label define pxged   
	1           "Allocated"                               
;
label values pxsch35  pxsch35l;
label define pxsch35l
	1           "Allocated"                               
;
label values pxsch614 pxsch61d;
label define pxsch61d
	1           "Allocated"                               
;
label values pxchpub  pxchpub;
label define pxchpub 
	1           "Allocated"                               
;
label values pxchgrde pxchgrde;
label define pxchgrde
	1           "Allocated"                               
;
label values pxs56    pxs56l; 
label define pxs56l  
	1           "Allocated"                               
;
label values pxs57    pxs57l; 
label define pxs57l  
	1           "Allocated"                               
;

#delimit cr
compress
