clear

cd "/Users/trev/Desktop/ECON 488/cps"
local dat_name "/Users/trev/Desktop/ECON 488/cps/oct96pub.dat"

cd "/Users/trev/Desktop/ECON 488/dta"
local dta_name "./cpsoct96.dta"

cd "/Users/trev/Desktop/ECON 488/dct"
local dct_name "./cpsoct96.dct"

quietly infile using "`dct_name'", using("`dat_name'") clear


//////////////////////////////////////////////////////////////////////////////////////////


#delimit ;

;
label values huinttyp huinttyp;
label define huinttyp
	0           "Noninterview or"               
	1           "Personal"                      
	2           "Telephone"                     
;
label values hufinal  hufinal;
label define hufinal 
	0           "New Interview - Not"           
	1           "Fully Complete CATI"           
	2           "Partially Completed CATI"      
	5           "Labor Force Complete,"         
	24          "HH Occupied Entirely By"       
	115         "Partial Interview With"        
	200         "New Interview -"               
	201         "CAPI Complete"                 
	202         "Callback Needed"               
	203         "Sufficient Partial -"          
	204         "Sufficient Partial - At"       
	205         "Labor Force Complete, -"       
	210         "CAPI Complete"                 
	216         "No One Home"                   
	217         "Temporarily Absent"            
	218         "Refused"                       
	219         "Other Occupied - Specify"      
	224         "Armed Forces Occupied Or"      
	225         "Temp. Occupied W/persons"      
	226         "Vacant Regular"                
	227         "Vacant - Storage Of Hhld"      
	228         "Unfit, To Be Demolished"       
	229         "Under Construction, Not"       
	230         "Converted To Temp"             
	231         "Unoccupied Tent Or"            
	232         "Permit Granted -"              
	233         "Other - Specify"               
	240         "Demolished"                    
	241         "House Or Trailer Moved"        
	242         "Outside Segment"               
	243         "Converted To Perm."            
	244         "Merged"                        
	245         "Condemned"                     
	246         "Built After April 1,"          
	247         "Unused Serial"                 
	248         "Other - Specify"               
;
label values huspnish huspnish;
label define huspnish
	1           "Spanish Only Language"         
;
label values hetenure hetenure;
label define hetenure
	1           "Owned Or Being Bought By"      
	2           "Rented For Cash"               
	3           "Occupied Without Payment"      
;
label values hehousut hehousut;
label define hehousut
	0           "Other Unit"                    
	1           "House, Apartment, Flat"        
	2           "Hu In Nontransient"            
	3           "Hu Permanent In"               
	4           "Hu In Rooming House"           
	5           "Mobile Home Or Trailer"        
	6           "Mobile Home Or Trailer"        
	7           "Hu Not Specified Above"        
	8           "Quarters Not Hu In"            
	9           "Unit Not Perm. In"             
	10          "Unoccupied Tent Site Or"       
	11          "Student Quarters In"           
	12          "Other Unit Not Specified"      
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
	14          "75,000 or More"                
;
label values hutypea  hutypea;
label define hutypea 
	1           "No One Home (Noh)"             
	2           "Temporarily Absent (Ta)"       
	3           "Refused (Ref)"                 
	4           "Other Occupied - Specify"      
;
label values hutypb   hutypb; 
label define hutypb  
	1           "Vacant Regular"                
	2           "Temporarily Occupied By"       
	3           "Vacant-storage Of Hhld"        
	4           "Unfit Or To Be"                
	5           "Under Construction, Not"       
	6           "Converted To Temp"             
	7           "Unoccupied Tent Site Or"       
	8           "Permit Granted"                
	9           "Other Type B - Specify"        
;
label values hutypc   hutypc; 
label define hutypc  
	1           "Demolished"                    
	2           "House Or Trailer Moved"        
	3           "Outside Segment"               
	4           "Converted To Perm."            
	5           "Merged"                        
	6           "Condemned"                     
	8           "Unused Line Of Listing"        
	9           "Other - Specify"               
;
label values hrintsta hrintsta;
label define hrintsta
	1           "Interview"                     
	2           "Type A Non-Interview"          
	3           "Type B Non-Interview"          
	4           "Type C Non-Interview"          
;
label values hrhtype  hrhtype;
label define hrhtype 
	0           "Non-Interview Household"       
	1           "Husband/Wife Primary"          
	2           "Husb/Wife Prim. Family"        
	3           "Unmarried Civilian Male-"      
	4           "Unmarried Civ. Female-"        
	5           "Primary Family Hhlder-Rp"      
	6           "Civilian Male Primary"         
	7           "Civilian Female Primary"       
	8           "Primary Individual Hhld-"      
	9           "Group Quarters With"           
	10          "Group Quarters Without"        
;
label values hrlonglk hrlonglk;
label define hrlonglk
	0           "Mis 1 or Replacement HH"       
	2           "Mis 2-4 or Mis 6-8"            
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
	2           "Midwest"                       
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
label values gestfips gestfips;
label define gestfips
	1           "AL"                            
	2           "AK"                            
	4           "AZ"                            
	5           "AR"                            
	6           "CA"                            
	8           "CO"                            
	9           "CT"                            
	10          "DE"                            
	11          "DC"                            
	12          "FL"                            
	13          "GA"                            
	15          "HI"                            
	16          "ID"                            
	17          "IL"                            
	18          "IN"                            
	19          "IA"                            
	20          "KS"                            
	21          "KY"                            
	22          "LA"                            
	23          "ME"                            
	24          "MD"                            
	25          "MA"                            
	26          "MI"                            
	27          "MN"                            
	28          "MS"                            
	29          "MO"                            
	30          "MT"                            
	31          "NE"                            
	32          "NV"                            
	33          "NH"                            
	34          "NJ"                            
	35          "NM"                            
	36          "NY"                            
	37          "NC"                            
	38          "ND"                            
	39          "OH"                            
	40          "OK"                            
	41          "OR"                            
	42          "PA"                            
	44          "RI"                            
	45          "SC"                            
	46          "SD"                            
	47          "TN"                            
	48          "TX"                            
	49          "UT"                            
	50          "VT"                            
	51          "VA"                            
	53          "WA"                            
	54          "WV"                            
	55          "WI"                            
	56          "WY"                            
;
label values gecmsa   gecmsa; 
label define gecmsa  
	0           "Not Identified Or"             
;
label values gemsa    gemsa;  
label define gemsa   
	0           "Identified Or"                 
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
	0           "Not Identified,"               
;
label values gemsasz  gemsasz;
label define gemsasz 
	0           "Not Identified Or"             
	2           "100,000 - 249,999"             
	3           "250,000 - 499,999"             
	4           "500,000 - 999,999"             
	5           "1,000,000 - 2,499,999"         
	6           "2,500,000 - 4,999,999"         
	7           "5,000,000+"                    
;
label values gecmsasz gecmsasz;
label define gecmsasz
	0           "Not Identified Or"             
	2           "100,000 - 249,999"             
	3           "250,000 - 499,999"             
	4           "500,000 - 999,999"             
	5           "1,000,000 - 2,499,999"         
	6           "2,500,000 - 4,999,999"         
	7           "5,000,000+"                    
;
label values proldrrp proldrrp;
label define proldrrp
	1           "Ref Pers With Other"           
	2           "Ref Pers With No Other"        
	3           "Spouse"                        
	4           "Child"                         
	5           "Grandchild"                    
	6           "Parent"                        
	7           "Brother/Sister"                
	8           "Other Relative"                
	9           "Foster Child"                  
	10          "Non-Rel Of Ref Per W/Own"      
	11          "Partner/roommate"              
	12          "Non-Rel Of Ref Per W/No"       
;
label values pupelig  pupelig;
label define pupelig 
	1           "Eligible For Interview"        
	2           "Labor Force Fully"             
	3           "Missing Labor Force Data"      
	4           "(Not Used)"                    
	5           "Assigned If Age Is Blank"      
	6           "Armed Forces Member"           
	7           "Under 15 Years Old"            
	8           "Not a HH Member"               
	9           "Deleted"                       
	10          "Deceased"                      
	11          "End Of List"                   
	12          "After End Of List"             
;
label values perrp    perrp;  
label define perrp   
	1           "Reference Person"              
	2           "Reference Person W/O"          
	3           "Spouse"                        
	4           "Child"                         
	5           "Grandchild"                    
	6           "Parent"                        
	7           "Brother/Sister"                
	8           "Other Rel. Or Ref."            
	9           "Foster Child"                  
	10          "Nonrel. Of Ref. Person"        
	11          "Not Used"                      
	12          "Nonrel. Of Ref. Person"        
	13          "Unmarried Partner"             
	14          "Unmarried Partner W/Out"       
	15          "Housemate/Roommate"            
	16          "Housemate/Roommate W/Out"      
	17          "Roomer/Boarder W/Rels."        
	18          "Roomer/Boarder W/Out"          
;
label values peparent peparent;
label define peparent
	-1          "No Parent"                     
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
label values pespouse pespouse;
label define pespouse
	-1          "No Spouse"                     
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
	5           "Other Service (All Other"      
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
	32          "1st, 2nd, 3rd Or 4th"          
	33          "5th Or 6th Grade"              
	34          "7th Or 8th Grade"              
	35          "9th Grade"                     
	36          "10th Grade"                    
	37          "11th Grade"                    
	38          "12th Grade No Diploma"         
	39          "High School Grad-Diploma"      
	40          "Some College But No"           
	41          "Associate Degree-"             
	42          "Associate Degree-"             
	43          "Bachelor's Degree (Ex:"        
	44          "Master's Degree (Ex:"          
	45          "Professional School Deg"       
	46          "Doctorate Degree (Ex:"         
;
label values perace   perace; 
label define perace  
	1           "White"                         
	2           "Black"                         
	3           "American Indian, Aleut,"       
	4           "Asian Or Pacific"              
	5           "Other - Specify (Delete"       
;
label values prorigin prorigin;
label define prorigin
	1           "Mexican American"              
	2           "Chicano"                       
	3           "Mexican (Mexicano)"            
	4           "Puerto Rican"                  
	5           "Cuban"                         
	6           "Central Or South"              
	7           "Other Spanish"                 
	8           "All Other"                     
	9           "Don't Know"                    
	10          "NA"                            
;
label values puchinhh puchinhh;
label define puchinhh
	1           "Person Added"                  
	2           "Person Added - Ure"            
	3           "Person Undeleted"              
	4           "Person Died"                   
	5           "Deleted For Reason Other"      
	6           "Person Joined Armed"           
	7           "Person No Longer In AF"        
	9           "Change In Demographic"         
;
label values purelflg purelflg;
label define purelflg
	0           "Not Owner Or Related To"       
	1           "Owner Of Bus Or Related"       
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
	4           "Other Relative"                
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
	2           "Non-Hipsanic"                  
;
label values prmarsta prmarsta;
label define prmarsta
	1           "Married, Civilian Spouse"      
	2           "Married, Armed Forces"         
	3           "Married, Spouse Absent"        
	4           "Widowed"                       
	5           "Divorced"                      
	6           "Separated"                     
	7           "Never Married"                 
;
label values prpertyp prpertyp;
label define prpertyp
	1           "Child Household Member"        
	2           "Adult Civilian Household"      
	3           "Adult Armed Forces"            
;
label values penatvty penatvty;
label define penatvty
	57          "United States"                 
	72          "Puerto Rico"                   
	96          "U.S. Outlying Area"            
	555         "Abroad, Country Not"           
;
label values pemntvty pemntvty;
label define pemntvty
	57          "United States"                 
	72          "Puerto Rico"                   
	96          "U.S. Outlying Area * See"      
	555         "Abroad, Country Not"           
;
label values pefntvty pefntvty;
label define pefntvty
	57          "United States"                 
	72          "Puerto Rico"                   
	96          "U.S. Outlying Area"            
	555         "Abroad, Country Not"           
;
label values prcitshp prcitshp;
label define prcitshp
	1           "Native, Born In The"           
	2           "Native, Born In Puerto"        
	3           "Native, Born Abroad Of"        
	4           "Foreign Born, U.S."            
	5           "Foreign Born, Not A"           
;
label values prinusyr prinusyr;
label define prinusyr
	-1          "Not In Universe (Born In"      
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
	5           "Not In Labor Force-"           
	6           "Not In Labor Force-"           
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
	1           "Goto PUHURSL1"                 
	2           "Goto PUABSPD"                  
;
label values puretot  puretot;
label define puretot 
	1           "Yes"                           
	2           "No"                            
	3           "Was Not Retired Last"          
;
label values pudis    pudis;  
label define pudis   
	1           "Yes"                           
	2           "No"                            
	3           "Did Not Have Disability"       
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
	2           "Slack Work/Business"           
	3           "Waiting For A New Job To"      
	4           "Vacation/Personal Days"        
	5           "Own Illness/Injury/"           
	6           "Child Care Problems"           
	7           "Other Family/Personal"         
	8           "Maternity/Paternity"           
	9           "Labor Dispute"                 
	10          "Weather Affected Job"          
	11          "School/Training"               
	12          "Civic/Military Duty"           
	13          "Does Not Work In The"          
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
	2           "2 Jobs"                        
	3           "3 Jobs"                        
	4           "4 Or More Jobs"                
;
label values pehrusl1 pehrusla;
label define pehrusla
	-4          "Hours Vary"                    
;
label values pehrusl2 pehruslb;
label define pehruslb
	-4          "Hours Vary"                    
;
label values pehrftpt pehrftpt;
label define pehrftpt
	1           "Yes"                           
	2           "No"                            
	3           "Hours Vary"                    
;
label values pehruslt pehruslt;
label define pehruslt
	-4          "Varies"                        
;
label values pehrwant pehrwant;
label define pehrwant
	1           "Yes"                           
	2           "No"                            
	3           "Regular Hours Are Full-"       
;
label values pehrrsn1 pehrrsna;
label define pehrrsna
	1           "Slack Work/Business"           
	2           "Could Only Find Part-"         
	3           "Seasonal Work"                 
	4           "Child Care Problems"           
	5           "Other Family/Personal"         
	6           "Health/Medical"                
	7           "School/Training"               
	8           "Retired/Social Security"       
	9           "Full-Time Workweek Is"         
	10          "Other - Specify"               
;
label values pehrrsn2 pehrrsnb;
label define pehrrsnb
	1           "Child Care Problems"           
	2           "Other Family/Personal"         
	3           "Health/Medical"                
	4           "School/Training"               
	5           "Retired/Social Security"       
	6           "Full-Time Workweek Less"       
	7           "Other - Specify"               
;
label values pehrrsn3 pehrrsnc;
label define pehrrsnc
	1           "Slack Work/Business"           
	2           "Seasonal Work"                 
	3           "Job Started Or Ended"          
	4           "Vacation/Personal Day"         
	5           "Own Illness/Injury/"           
	6           "Holiday (Legal Or"             
	7           "Child Care Problems"           
	8           "Other Family/Personal"         
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
	1           "If entry of 1 in MJ and"       
	2           "If entry of 1 in MJ and"       
	3           "If entry of 2, D or R in"      
	4           "If entry of 1 in BUS1"         
	5           "All others goto HRCK3-C"       
;
label values puhrck3  puhrck3l;
label define puhrck3l
	1           "If entry of 1 in Absot"        
	2           "If entry of 3 in RET1"         
	3           "If entry in HRUSLT is 0-"      
	4           "If entry in HRUSLT is"         
	5           "All others goto HRCK4-C"       
	6           "Goto PUHRCK4"                  
;
label values puhrck4  puhrck4l;
label define puhrck4l
	1           "If entry of 1, D, R or V"      
	2           "If entry of 2, D or R in"      
	3           "If HRUSLT is 0-34 then"        
	4           "If entry of 2 in HRFTPT"       
	5           "All others goto HRACT1"        
;
label values puhrck5  puhrck5l;
label define puhrck5l
	1           "If entry of 1 in MJOT"         
	2           "All others goto HRCK6-C"       
;
label values puhrck6  puhrck6l;
label define puhrck6l
	1           "If HRACT1 and HRACT2 EQ"       
	2           "If HRACT1 and HRACT2 EQ"       
	3           "All others goto HRACTT-C"      
;
label values puhrck7  puhrck7l;
label define puhrck7l
	1           "(If entry of 2, D or R"        
	2           "(If entry of 2, D or R"        
	3           "(If HRUSLT is 35+ or if"       
	4           "If entry of 1 in HRWANT"       
	5           "All others goto HRCK8"         
;
label values puhrck12 puhrck1b;
label define puhrck1b
	1           "If entry of 2, D or R in"      
	2           "All others goto IOCK1"         
;
label values pulaydth pulaydth;
label define pulaydth
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
	1           "MISCK = 5 goto IO1INT"         
	2           "I-ICR = 1 or I-OCR = 1,"       
	3           "All others goto SCHCK"         
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
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked"                       
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	12          "Nothing"                       
	13          "Other Passive"                 
;
label values pulkm2   pulkm2l;
label define pulkm2l 
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkm3   pulkm3l;
label define pulkm3l 
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkm4   pulkm4l;
label define pulkm4l 
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkm5   pulkm5l;
label define pulkm5l 
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkm6   pulkm6l;
label define pulkm6l 
	1           "Contacted Employer"            
	2           "Contacted Pulbic"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkdk1  pulkdk1l;
label define pulkdk1l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	12          "Nothing"                       
	13          "Other Passive"                 
;
label values pulkdk2  pulkdk2l;
label define pulkdk2l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkdk3  pulkdk3l;
label define pulkdk3l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkdk4  pulkdk4l;
label define pulkdk4l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkdk5  pulkdk5l;
label define pulkdk5l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkdk6  pulkdk6l;
label define pulkdk6l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted"                     
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkps1  pulkps1l;
label define pulkps1l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	12          "Nothing"                       
	13          "Other Passive"                 
;
label values pulkps2  pulkps2l;
label define pulkps2l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkps3  pulkps3l;
label define pulkps3l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkps4  pulkps4l;
label define pulkps4l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkps5  pulkps5l;
label define pulkps5l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pulkps6  pulkps6l;
label define pulkps6l
	1           "Contacted Employer"            
	2           "Contacted Public"              
	3           "Contacted Private"             
	4           "Contacted Friends Or"          
	5           "Contacted School/"             
	6           "Sent Out Resumes/Filled"       
	7           "Checked Union/"                
	8           "Placed Or Answered Ads"        
	9           "Other Active"                  
	10          "Looked At Ads"                 
	11          "Attended Job Training"         
	13          "Other Passive"                 
;
label values pelkavl  pelkavl;
label define pelkavl 
	1           "Yes"                           
	2           "No"                            
;
label values pulkavr  pulkavr;
label define pulkavr 
	1           "Waiting For New Job To"        
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
	1           "Within The Last 12"            
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
	1           "Yes, Or Maybe, It"             
	2           "No"                            
	3           "Retired"                       
	4           "Disabled"                      
	5           "Unable"                        
;
label values pedwrsn  pedwrsn;
label define pedwrsn 
	1           "Believes No Work"              
	2           "Couldn't Find Any Work"        
	3           "Lacks Necessary"               
	4           "Employers Think Too"           
	5           "Other Types Of"                
	6           "Can't Arrange Child Care"      
	7           "Family Responsibilities"       
	8           "In School Or Other"            
	9           "Ill-Health, Physical"          
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
	1           "If Entry Of 2 In BUS2"         
	2           "If Entry Of 3 On ABSRSN"       
	3           "If Entry Of 1 In RDT1,"        
	4           "All Others Goto PUDWWNT"       
;
label values pudwck2  pudwck2l;
label define pudwck2l
	1           "If Entry In DIS1 Or DIS2"      
	2           "If Entry Of 4 In DWWNT"        
	3           "If Entry Of 5 In DWWNT"        
	4           "All Others Goto PUDWCK4"       
;
label values pudwck3  pudwck3l;
label define pudwck3l
	1           "If AGERNG Equals 1-4 Or"       
	2           "All Others Goto PUNLFCK2"      
;
label values pudwck4  pudwck4l;
label define pudwck4l
	1           "If entry of 10 and/or 11"      
	2           "If entry of 10 and/or 11"      
	3           "If entry of 10 and/or 11"      
	4           "All others goto PUDWRSN"       
;
label values pudwck5  pudwck5l;
label define pudwck5l
	1           "If entry of 1 in LK then"      
	2           "All others goto PUDWLK"        
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
	1           "Personal/Family"               
	2           "Return To School"              
	3           "Health"                        
	4           "Retirement Or Old Age"         
	5           "Temp, Seasonal Or"             
	6           "Slack Work/Business"           
	7           "Unsatisfactory Work"           
	8           "Other - Specify"               
;
label values pejhwant pejhwant;
label define pejhwant
	1           "Yes, Or It Depends"            
	2           "No"                            
;
label values pujhck1  pujhck1l;
label define pujhck1l
	1           "IF PURET1 = 1, -2, or -3"      
	2           "IF MISCK equals 4 or 8"        
	3           "ll others goto PUNLFCK1"       
;
label values pujhck2  pujhck2l;
label define pujhck2l
	1           "If entry of 1 in DWWK"         
	2           "If entry of 2, D or R in"      
	3           "All others goto PUJHWK"        
;
label values prabsrea prabsrea;
label define prabsrea
	1           "Ft Paid-Vacation"              
	2           "Ft Paid-Own Illness"           
	3           "Ft Paid-Child Care"            
	4           "Ft Paid-Other"                 
	5           "Ft Paid-"                      
	6           "Ft Paid-Labor Dispute"         
	7           "Ft Paid-Weather Affected"      
	8           "Ft Paid-School/Training"       
	9           "Ft Paid-Civic/Military"        
	10          "Ft Paid-Other"                 
	11          "Ft Unpaid-Vacation"            
	12          "Ft Unpaid-Own Illness"         
	13          "Ft Unpaid-Child Care"          
	14          "Ft Unpaid-Other"               
	15          "Ft Unpaid-"                    
	16          "Ft Unpaid-Labor Dispute"       
	17          "Ft Unpaid-Weather"             
	18          "Ft Unpaid-"                    
	19          "Ft Unpaid-Civic/Military"      
	20          "Ft Unpaid-Other"               
	22          "Pt Paid-Own Illness"           
	23          "Pt Paid-Child Care"            
	24          "Pt Paid-Other Family/"         
	25          "Pt Paid-Maternity/"            
	26          "Pt Paid-Labor Dispute"         
	27          "Pt Paid-Weather Affected"      
	28          "Pt Paid-School/Training"       
	29          "Pt Paid-Civic/Military"        
	30          "Pt Paid-Other"                 
	31          "Pt Unpaid-Vacation"            
	32          "Pt Unpaid-Own Illness"         
	33          "Pt Unpaid-Child Care"          
	34          "Pt Unpaid-Other Fam/"          
	35          "Pt Unpaid-Maternity/"          
	36          "Pt Unpaid-Labor Dispute"       
	37          "Pt Unpaid-Weather"             
	38          "Pt Unpaid-School/"             
	39          "Pt Unpaid-Civic/Military"      
	40          "Pt Unpaid-Other"               
;
label values prcivlf  prcivlf;
label define prcivlf 
	1           "In Civilian Labor Force"       
	2           "Not In Civilian Labor"         
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
	1           "W/Job, Not At Work-"           
	2           "W/Job, Not At Work-"           
	3           "W/Job, Not At Work-"           
	4           "W/Job, Not At Work-Labor"      
	5           "W/Job, Not At Work-Child"      
	6           "W/Job, Not At Work-"           
	7           "W/Job, Not At Work-"           
	8           "W/Job, Not At Work-"           
	9           "W/Job, Not At Work-"           
	10          "W/Job, Not At Work-Does"       
	11          "W/Job, Not At Work-Other"      
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
	1           "Looked Last 4 Weeks -"         
	2           "Looked Last 4 Weeks -"         
	3           "Looked Last 4 Weeks -"         
	4           "Unavailable Job Seekers"       
	5           "No Recent Job Search"          
;
label values prpthrs  prpthrs;
label define prpthrs 
	0           "Usualy Ft, Pt For"             
	1           "Usu.Ft, Pt Econ Reasons;"      
	2           "Usu.Ft, Pt Econ Reasons;"      
	3           "Usu.Ft, Pt Econ Reasons;"      
	4           "Usu.Ft, Pt Econ Reasons;"      
	5           "Usu.Pt, Econ Reasons;"         
	6           "Usu.Pt, Econ Reasons;"         
	7           "Usu.Pt, Econ Reasons;"         
	8           "Usu.Pt, Econ Reasons;"         
	9           "Usu.Pt, Non-Econ"              
	10          "Usu.Pt, Non-Econ"              
	11          "Usu.Pt, Non-Econ"              
	12          "Usu.Pt, Non-Econ"              
;
label values prptrea  prptrea;
label define prptrea 
	1           "Usu. Ft-Slack"                 
	2           "Usu. Ft-Seasonal Work"         
	3           "Usu. Ft-Job"                   
	4           "Usu. Ft-"                      
	5           "Usu. Ft-Own"                   
	6           "Usu. Ft-Holiday"               
	7           "Usu. Ft-Child Care"            
	8           "Usu. Ft-Other Fam/Pers"        
	9           "Usu. Ft-Labor Dispute"         
	10          "Usu. Ft-Weather Affected"      
	11          "Usu. Ft-School/Training"       
	12          "Usu. Ft-Civic/Military"        
	13          "Usu. Ft-Other Reason"          
	14          "Usu. Pt-Slack"                 
	15          "Usu. Pt-Could Only Find"       
	16          "Usu. Pt-Seasonal Work"         
	17          "Usu. Pt-Child Care"            
	18          "Usu. Pt-Other Fam/Pers"        
	19          "Usu. Pt-Health/Medical"        
	20          "Usu. Pt-School/Training"       
	21          "Usu. Pt-Retired/S.S."          
	22          "Usu. Pt-Workweek <35"          
	23          "Usu. Pt-Other Reason"          
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
	3           "Unemployed, Seeks Ft"          
	4           "Unemployed, Seeks Pt"          
;
label values prwkstat prwkstat;
label define prwkstat
	1           "Not In Labor Force"            
	2           "Ft Hours (35+),"               
	3           "Pt For Economic Reasons,"      
	4           "Pt For Non-Economic"           
	5           "Not At Work, Usually Ft"       
	6           "Pt Hrs, Usually Pt For"        
	7           "Pt Hrs, Usually Pt For"        
	8           "Ft Hours, Usually Pt For"      
	9           "Ft Hours, Usually Pt For"      
	10          "Not At Work, Usually"          
	11          "Unemployed Ft"                 
	12          "Unemployed Pt"                 
;
label values prwntjob prwntjob;
label define prwntjob
	1           "Want A Job"                    
	2           "Other Not In Labor Force"      
;
label values pujhck3  pujhck3l;
label define pujhck3l
	1           "If I-MLR EQ 3 or 4 then"       
	2           "All others goto PUJHRSN"       
;
label values pujhck4  pujhck4l;
label define pujhck4l
	1           "If entry of 2, D or R in"      
	2           "If entry of 1 in PUDW4WK"      
	3           "If I-MLR equals 1 or 2"        
	4           "If entry in PUJHRSN then"      
	5           "All others goto PUNLFCK1"      
;
label values pujhck5  pujhck5l;
label define pujhck5l
	1           "If I-IO1ICR equals 1 or"       
	2           "All others goto PUIOCK5"       
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
	1           "Yes"                           
	2           "No"                            
;
label values peio1cow peio1cow;
label define peio1cow
	1           "Government - Federal"          
	2           "Government - State"            
	3           "Government - Local"            
	4           "Private, For Profit"           
	5           "Private, Nonprofit"            
	6           "Self-Employed,"                
	7           "Self-Employed,"                
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
	6           "Self-Employed,"                
	7           "Self-Employed,"                
	8           "Without Pay"                   
	9           "Unknown"                       
	10          "Government, Level"             
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
	1           "If {MISCK EQ 1 or 5) or"       
	2           "If (MISCK EQ 1 or 5) or"       
	3           "If I-IO1NAM is D, R or"        
	4           "All others goto PUIODP1"       
;
label values puiock2  puiock2l;
label define puiock2l
	1           "If I-IO1ICR EQ 1 then"         
	2           "If I-IO1OCR EQ 1 then"         
	3           "All others goto PUIODP2"       
;
label values puiock3  puiock3l;
label define puiock3l
	1           "If I-IO1OCC equals D, R"       
	2           "If I-IO1DT1 is D, R or"        
	3           "All others goto PUIODP3"       
;
label values prioelg  prioelg;
label define prioelg 
	0           "Not Eligible For Edit"         
	1           "Eligible For Edit"             
;
label values pragna   pragna; 
label define pragna  
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
	4           "Private (Incl. Self-"          
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
	1           "Agri., Wage & Salary,"         
	2           "Agri., Wage & Salary,"         
	3           "Agri., Self-Employed"          
	4           "Agri., Unpaid"                 
	5           "Nonag, Ws, Private,"           
	6           "Nonag, Ws, Private,"           
	7           "Nonag, Ws, Govt, Federal"      
	8           "Nonag, Ws, Govt, State"        
	9           "Nonag, Ws, Govt, Local"        
	10          "Nonag, Self-Employed"          
	11          "Nonag, Unpaid"                 
;
label values prdtcow2 prdtcowb;
label define prdtcowb
	1           "Agri., Wage & Salary,"         
	2           "Agri., Wage & Salary,"         
	3           "Agri., Self-Employed"          
	4           "Agri., Unpaid"                 
	5           "Nonag, Ws, Private,"           
	6           "Nonag, Ws, Private,"           
	7           "Nonag, Ws, Govt, Federal"      
	8           "Nonag, Ws, Govt, State"        
	9           "Nonag, Ws, Govt, Local"        
	10          "Nonag, Self-Employed"          
	11          "Nonag, Unpaid"                 
;
label values prdtind1 prdtinda;
label define prdtinda
	1           "Goods Producing-"              
	2           "Goods Producing-Other"         
	3           "Mining"                        
	4           "Construction"                  
	5           "Mfg-Lumber & Wood Prods,"      
	6           "Mfg-Furniture & Fixtures"      
	7           "Mfg-Stone, Clay,"              
	8           "Mfg-Primary Metals"            
	9           "Mfg-Fabricated Metals"         
	10          "Mfg-Not Specified Metal"       
	11          "Mfg-Machinery, Ex"             
	12          "Mfg-Electrical"                
	13          "Mfg-Motor Vehicles &"          
	14          "Mfg-Aircraft & Parts"          
	15          "Mfg-Other Transportation"      
	16          "Mfg-Professional & Photo"      
	17          "Mfg-Toys, Amusement &"         
	18          "Mfg-Misc & Nec Mfg"            
	19          "Mfg-Food & Kindred"            
	20          "Mfg-Tobacco Prods"             
	21          "Mfg-Textile Mill Prods"        
	22          "Mfg-Apparel & Other"           
	23          "Mfg-Paper & Allied"            
	24          "Mfg-Printing,"                 
	25          "Mfg-Chemicals & Allied"        
	26          "Mfg-Petroleum & Coal"          
	27          "Mfg-Rubber & Misc"             
	28          "Mfg-Leather & Leather"         
	29          "Transportation"                
	30          "Communications"                
	31          "Utilities & Sanitary"          
	32          "Wholesale Trade"               
	33          "Eating And Drinking"           
	34          "Other Retail Trade"            
	35          "Banking And Other"             
	36          "Insurance And Real"            
	37          "Private Household"             
	38          "Business Services"             
	39          "Automobile And Repair"         
	40          "Personal Serv Exc"             
	41          "Entertainment &"               
	42          "Hospitals"                     
	43          "Health Services, Exc."         
	44          "Educational Services"          
	45          "Social Services"               
	46          "Other Professional"            
	47          "Forestry & Fisheries"          
	48          "Justice, Public Order &"       
	49          "Admin Of Human Resource"       
	50          "National Security &"           
	51          "Other Public"                  
	52          "Armed Forces"                  
;
label values prdtind2 prdtindb;
label define prdtindb
	1           "Goods Producing-"              
	2           "Goods Producing-Other"         
	3           "Mining"                        
	4           "Construction"                  
	5           "Mfg-Lumber & Wood Prods,"      
	6           "Mfg-Furniture & Fixtures"      
	7           "Mfg-Stone, Clay,"              
	8           "Mfg-Primary Metals"            
	9           "Mfg-Fabricated Metals"         
	10          "Mfg-Not Specified Metal"       
	11          "Mfg-Machinery, Ex"             
	12          "Mfg-Electrical"                
	13          "Mfg-Motor Vehicles &"          
	14          "Mfg-Aircraft & Parts"          
	15          "Mfg-Other Transportation"      
	16          "Mfg-Professional & Photo"      
	17          "Mfg-Toys, Amusement &"         
	18          "Mfg-Misc & Nec Mfg"            
	19          "Mfg-Food & Kindred Prods"      
	20          "Mfg-Tobacco Prods"             
	21          "Mfg-Textile Mill Prods"        
	22          "Mfg-Apparel & Other"           
	23          "Mfg-Paper & Allied"            
	24          "Mfg-Printing, Publishing"      
	25          "Mfg-Chemicals & Allied"        
	26          "Mfg-Petroleum & Coal"          
	27          "Mfg-Rubber & Misc"             
	28          "Mfg-Leather & Leather"         
	29          "Transportation"                
	30          "Communications"                
	31          "Utilities & Sanitary"          
	32          "Wholesale Trade"               
	33          "Eating And Drinking"           
	34          "Other Retail Trade"            
	35          "Banking And Other"             
	36          "Insurance And Real"            
	37          "Private Household"             
	38          "Business Services"             
	39          "Automobile And Repair"         
	40          "Personal Serv Exc"             
	41          "Entertainment &"               
	42          "Hospitals"                     
	43          "Health Services, Exc."         
	44          "Educational Services"          
	45          "Social Services"               
	46          "Other Professional"            
	47          "Forestry & Fisheries"          
	48          "Justice, Public Order &"       
	49          "Admin Of Human Resource"       
	50          "National Security &"           
	51          "Other Public"                  
	52          "Armed Forces"                  
;
label values prdtocc1 prdtocca;
label define prdtocca
	1           "Officials &"                   
	2           "Other Executive, Admin."       
	3           "Management Related"            
	4           "Engineers"                     
	5           "Mathematical And"              
	6           "Natural Scientists"            
	7           "Health Diagnosing"             
	8           "Health Assessment And"         
	9           "Teachers, College And"         
	10          "Teachers, Except College"      
	11          "Lawyers And Judges"            
	12          "Other Professional"            
	13          "Health Technologists And"      
	14          "Engineering And Science"       
	15          "Technicians, Except"           
	16          "Supervisors And"               
	17          "Sales Reps, Finance And"       
	18          "Sales Reps, Commodities,"      
	19          "Sales Workers, Retail &"       
	20          "Sales Related"                 
	21          "Supervisors,"                  
	22          "Computer Equiptment"           
	23          "Secretaries,"                  
	24          "Financial Records"             
	25          "Mail And Message"              
	26          "Other Admin. Support,"         
	27          "Private Household"             
	28          "Protective Service"            
	29          "Food Service"                  
	30          "Health Service"                
	31          "Cleaning And Building"         
	32          "Personal Service"              
	33          "Mechanics And Repairers"       
	34          "Construction Trades"           
	35          "Other Precision"               
	36          "Machine Operators, And"        
	37          "Fabricators, Assemblers,"      
	38          "Motot Vehicle Operators"       
	39          "Other Transportation And"      
	40          "Construction Laborers"         
	41          "Freight, Stock, &"             
	42          "Other Handlers, Equipt."       
	43          "Farm Operators And"            
	44          "Farm Workers And Related"      
	45          "Forestry And Fishing"          
	46          "Armed Forces"                  
;
label values prdtocc2 prdtoccb;
label define prdtoccb
	1           "Officials &"                   
	2           "Other Executive, Admin."       
	3           "Management Related"            
	4           "Engineers"                     
	5           "Mathematical And"              
	6           "Natural Scientists"            
	7           "Health Diagnosing"             
	8           "Health Assessment And"         
	9           "Teachers, College And"         
	10          "Teachers, Except College"      
	11          "Lawyers And Judges"            
	12          "Other Professional"            
	13          "Health Technologists And"      
	14          "Engineering And Science"       
	15          "Technicians, Except"           
	16          "Supervisors And"               
	17          "Sales Reps, Finance And"       
	18          "Sales Reps, Commodities,"      
	19          "Sales Workers, Retail &"       
	20          "Sales Related"                 
	21          "Supervisors,"                  
	22          "Computer Equiptment"           
	23          "Secretaries,"                  
	24          "Financial Records"             
	25          "Mail And Message"              
	26          "Other Admin. Support,"         
	27          "Private Household"             
	28          "Protective Service"            
	29          "Food Service"                  
	30          "Health Service"                
	31          "Cleaning And Building"         
	32          "Personal Service"              
	33          "Mechanics And Repairers"       
	34          "Construction Trades"           
	35          "Other Precision"               
	36          "Machine Operators, And"        
	37          "Fabricators, Assemblers,"      
	38          "Motot Vehicle Operators"       
	39          "Other Transportation And"      
	40          "Construction Laborers"         
	41          "Freight, Stock, &"             
	42          "Other Handlers, Equipt."       
	43          "Farm Operators And"            
	44          "Farm Workers And Related"      
	45          "Forestry And Fishing"          
	46          "Armed Forces"                  
;
label values premp    premp;  
label define premp   
	1           "Employed Persons (Exc."        
;
label values prmjind1 prmjinda;
label define prmjinda
	1           "Agriculture"                   
	2           "Mining"                        
	3           "Construction"                  
	4           "Manufacturing - Durable"       
	5           "Manufacturing - Non-"          
	6           "Transportation"                
	7           "Communications"                
	8           "Utilities And Sanitary"        
	9           "Wholesale Trade"               
	10          "Retail Trade"                  
	11          "Finance, Insurance, And"       
	12          "Private Households"            
	13          "Business, Auto And"            
	14          "Personal Services, Exc."       
	15          "Entertainment And"             
	16          "Hospitals"                     
	17          "Medical Services, Exc."        
	18          "Educational Services"          
	19          "Social Services"               
	20          "Other Professional"            
	21          "Forestry And Fisheries"        
	22          "Public Administration"         
	23          "Armed Forces"                  
;
label values prmjind2 prmjindb;
label define prmjindb
	1           "Agriculture"                   
	2           "Mining"                        
	3           "Construction"                  
	4           "Manufacturing - Durable"       
	5           "Manufacturing - Non-"          
	6           "Transportation"                
	7           "Communications"                
	8           "Utilities And Sanitary"        
	9           "Wholesale Trade"               
	10          "Retail Trade"                  
	11          "Finance, Insurance, And"       
	12          "Private Households"            
	13          "Business, Auto And"            
	14          "Personal Services, Exc."       
	15          "Entertainment And"             
	16          "Hospitals"                     
	17          "Medical Services, Exc."        
	18          "Educational Services"          
	19          "Social Services"               
	20          "Other Professional"            
	21          "Forestry And Fisheries"        
	22          "Public Administration"         
	23          "Armed Forces"                  
;
label values prmjocc1 prmjocca;
label define prmjocca
	1           "Executive,"                    
	2           "Professional Specialty"        
	3           "Technicians And Related"       
	4           "Sales Occupations"             
	5           "Administrative Support"        
	6           "Private Household"             
	7           "Protective Service"            
	8           "Service Occupations,"          
	9           "Precision Production,"         
	10          "Machine Operators,"            
	11          "Transportation And"            
	12          "Handlers, Equip"               
	13          "Farming, Forestry And"         
	14          "Armed Forces"                  
;
label values prmjocc2 prmjoccb;
label define prmjoccb
	1           "Executive,"                    
	2           "Professional Specialty"        
	3           "Technicians And Related"       
	4           "Sales Occupations"             
	5           "Administrative Support"        
	6           "Private Household"             
	7           "Protective Service"            
	8           "Service Occupations,"          
	9           "Precision Production,"         
	10          "Machine Operators,"            
	11          "Transportation And"            
	12          "Handlers, Equip"               
	13          "Farming, Forestry And"         
	14          "Armed Forces"                  
;
label values prmjocgr prmjocgr;
label define prmjocgr
	1           "Managerail &"                  
	2           "Service Occupations"           
	3           "Production, Craft,"            
	4           "Farming, Forestry &"           
;
label values prnagpws prnagpws;
label define prnagpws
	1           "Non-ag Priv Wage &"            
;
label values prnagws  prnagws;
label define prnagws 
	1           "Non-ag Wage And Salary"        
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
	2           "Nonhourly Worker"              
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
label values peernvr1 peernvra;
label define peernvra
	1           "Yes"                           
	2           "No"                            
;
label values peernvr3 peernvrc;
label define peernvrc
	1           "Yes"                           
	2           "No"                            
;
label values ptot     ptot;   
label define ptot    
	0           "Not Topcoded"                  
	1           "Topcoded"                      
;
label values puernvr4 puernvrd;
label define puernvrd
	1           "Yes"                           
	2           "No"                            
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
	1           "Within The Last"               
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
	6           "Something Else/Other"          
;
label values punlfck1 punlfcka;
label define punlfcka
	1           "If AGERNG Equals 1-4 or"       
	2           "All Others Goto NlFRET"        
;
label values punlfck2 punlfckb;
label define punlfckb
	1           "If MISCL Equals 4 or 8"        
	2           "All Others Goto LBFR-END"      
;
label values peschenr peschenr;
label define peschenr
	1           "Yes"                           
	2           "No"                            
;
label values peschft  peschft;
label define peschft 
	1           "Full-Time"                     
	2           "Part-Time"                     
;
label values peschlvl peschlvl;
label define peschlvl
	1           "High School"                   
	2           "College or University"         
;
label values prnlfsch prnlfsch;
label define prnlfsch
	1           "In School"                     
	2           "Not in School PERSON'S"        
;
label values prwernal prwernal;
label define prwernal
	0           "NO ALLOCATION"                 
	1           "ONE OR MORE"                   
;
label values prhernal prhernal;
label define prhernal
	0           "NO ALLOCATION"                 
	1           "ONE OR MORE COMPONENT"         
;
label values pesschol pesschol;
label define pesschol
	1           "Yes  (Ask PEPUBLIC)"           
	2           "No   (Skip to PEVOCA)"         
;
label values pepublic pepublic;
label define pepublic
	-1          "Out of universe"               
	1           "Public"                        
	2           "Private"                       
;
label values pegrade  pegrade;
label define pegrade 
	-1          "Out of universe"               
	13          "1st year of college (freshman)"
	14          "2nd year of college (sophomore)"
	15          "3rd year of college (junior)"  
	16          "4th year of college (senior)"  
	17          "1st year of graduate school"   
	18          "2nd year or higher of graduate school"
;
label values pefull   pefull; 
label define pefull  
	-1          "Out of universe"               
	1           "Full-time"                     
	2           "Part-time"                     
;
label values pestype  pestype;
label define pestype 
	-1          "Out of universe"               
	1           "2-year college (community or"  
	2           "4-year college or university"  
;
label values pevoca   pevoca; 
label define pevoca  
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pelastyr pelastyr;
label define pelastyr
	1           "Yes  (Ask PELASTGD)"           
	2           "No   (Skip to Internal Check"  
;
label values pelastgd pelastgd;
label define pelastgd
	-1          "Out of universe"               
	13          "1st year of college (freshman)"
	14          "2nd year of college (sophomore)"
	15          "3rd year of college (junior)"  
	16          "4th year of college (senior)"  
	17          "1st year of graduate school"   
	18          "2nd year or higher of graduate"
;
label values peyratt  peyratt;
label define peyratt 
	-1          "Out of universe"               
	1           "1996"                          
	2           "1995 or before"                
	3           "Never attended"                
;
label values peyrdeg  peyrdeg;
label define peyrdeg 
	-1          "Out of universe"               
	1           "1996"                          
	2           "1995 or before"                
;
label values peyrdip  peyrdip;
label define peyrdip 
	-1          "Out of universe"               
	1           "1996"                          
	2           "1995 or before"                
;
label values peged    peged;  
label define peged   
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pus51    pus51l; 
label define pus51l  
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Self"                          
	2           "Parent"                        
	3           "Spouse"                        
	4           "Other relative"                
	5           "Nonrelative"                   
;
label values pesusfpx pesusfpx;
label define pesusfpx
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Self"                          
	2           "Parent"                        
	3           "Spouse"                        
	4           "Other relative"                
	5           "Nonrelative"                   
;
label values pxsschol pxsschol;
label define pxsschol
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxpublic pxpublic;
label define pxpublic
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxgrade  pxgrade;
label define pxgrade 
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxfull   pxfull; 
label define pxfull  
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxstype  pxstype;
label define pxstype 
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxvoca   pxvoca; 
label define pxvoca  
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxlastyr pxlastyr;
label define pxlastyr
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxlastgd pxlastgd;
label define pxlastgd
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxyrdeg  pxyrdeg;
label define pxyrdeg 
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxyratt  pxyratt;
label define pxyratt 
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxyrdip  pxyrdip;
label define pxyrdip 
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pesch35  pesch35l;
label define pesch35l
	-1          "Out of universe"               
	1           "Yes  (Skip to PECHPUB)"        
	2           "No    (Skip to Internal"       
;
label values pesch614 pesch61d;
label define pesch61d
	-1          "Out of universe"               
	1           "Yes   (Ask PECHPUB)"           
	2           "No     (Skip to Internal"      
;
label values pechpub  pechpub;
label define pechpub 
	-1          "Out of universe"               
	1           "Public"                        
	2           "Private"                       
;
label values pechgrde pechgrde;
label define pechgrde
	-1          "Out of universe"               
	1           "Nursery (pre-school,"          
	2           "Nursery (pre-school,"          
	3           "Kindergarten full-day"         
	4           "Kindergarten part-day"         
;
label values pes56    pes56l; 
label define pes56l  
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes      (Ask S57)"            
	2           "No        (Skip to S58a)"      
;
label values pes57    pes57l; 
label define pes57l  
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Nursery school (pre-school,"   
	2           "Kindergarten"                  
;
label values pesss1   pesss1l;
label define pesss1l 
	-9          "N/A"                           
	-5          "Year-Round School"             
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesss2   pesss2l;
label define pesss2l 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesss4   pesss4l;
label define pesss4l 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pesss5   pesss5l;
label define pesss5l 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesss6   pesss6l;
label define pesss6l 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "To retake subject"             
	2           "Other reason"                  
;
label values pesss7   pesss7l;
label define pesss7l 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pesss8a  pesss8a;
label define pesss8a 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second language"
	3           "Take subjects not offered during"
;
label values pesss8b  pesss8b;
label define pesss8b 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second language"
	3           "Take subjects not offered during"
;
label values pesss8c  pesss8c;
label define pesss8c 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second language"
	3           "Take subjects not offered during"
;
label values pesss9a  pesss9a;
label define pesss9a 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second"     
	3           "Take subjects not offered during"
	4           "Take regular high school"      
	5           "Take courses for college credit?"
	6           "Take subjects for some other"  
;
label values pesss9b  pesss9b;
label define pesss9b 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second"     
	3           "Take subjects not offered during"
	4           "Take regular high school"      
	5           "Take courses for college credit?"
	6           "Take subjects for some other"  
;
label values pesss9c  pesss9c;
label define pesss9c 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second"     
	3           "Take subjects not offered during"
	4           "Take regular high school"      
	5           "Take courses for college credit?"
	6           "Take subjects for some other"  
;
label values pesss9d  pesss9d;
label define pesss9d 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second"     
	3           "Take subjects not offered during"
	4           "Take regular high school"      
	5           "Take courses for college credit?"
	6           "Take subjects for some other"  
;
label values pesss9e  pesss9e;
label define pesss9e 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second"     
	3           "Take subjects not offered during"
	4           "Take regular high school"      
	5           "Take courses for college credit?"
	6           "Take subjects for some other"  
;
label values pesss9f  pesss9f;
label define pesss9f 
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Improve basic skills, such as" 
	2           "Learn English as a second"     
	3           "Take subjects not offered during"
	4           "Take regular high school"      
	5           "Take courses for college credit?"
	6           "Take subjects for some other"  
;
label values pessws1  pessws1l;
label define pessws1l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pessws2  pessws2l;
label define pessws2l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pessws3  pessws3l;
label define pessws3l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pessws4  pessws4l;
label define pessws4l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	12          "NUMBER OF WEEKS"               
;
label values pessws5  pessws5l;
label define pessws5l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pessws6  pessws6l;
label define pessws6l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pessws7  pessws7l;
label define pessws7l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pessws8  pessws8l;
label define pessws8l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pessoa1  pessoa1l;
label define pessoa1l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pessoa2  pessoa2l;
label define pessoa2l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Yes"                           
	2           "No"                            
;
label values pessoa3  pessoa3l;
label define pessoa3l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pessoa4a pessoa4a;
label define pessoa4a
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4b pessoa4b;
label define pessoa4b
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4c pessoa4c;
label define pessoa4c
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4d pessoa4d;
label define pessoa4d
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4e pessoa4e;
label define pessoa4e
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4f pessoa4f;
label define pessoa4f
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4g pessoa4g;
label define pessoa4g
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4h pessoa4h;
label define pessoa4h
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa4i pessoa4i;
label define pessoa4i
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "Arts, such as music, dance,"   
	2           "Sports, such as swimming,"     
	3           "Computers?"                    
	4           "Math and science, such as algebra,"
	5           "Language arts, such as creative"
	6           "History and social studies, such"
	7           "Foreign languages, such as"    
	8           "Religious studies, such as Bible"
	9           "Any other type of activity?"   
;
label values pessoa5  pessoa5l;
label define pessoa5l
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesyrs1a pesyrs1a;
label define pesyrs1a
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs1b pesyrs1b;
label define pesyrs1b
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs1c pesyrs1c;
label define pesyrs1c
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs1d pesyrs1d;
label define pesyrs1d
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs1e pesyrs1e;
label define pesyrs1e
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs1f pesyrs1f;
label define pesyrs1f
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs1g pesyrs1g;
label define pesyrs1g
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs1h pesyrs1h;
label define pesyrs1h
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
	1           "January"                       
	2           "February"                      
	3           "March"                         
	4           "April"                         
	5           "May"                           
	6           "June"                          
	7           "July"                          
	8           "August"                        
	9           "September"                     
	10          "October"                       
	11          "November"                      
	12          "December"                      
;
label values pesyrs2a pesyrs2a;
label define pesyrs2a
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesyrs2b pesyrs2b;
label define pesyrs2b
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesyrs2c pesyrs2c;
label define pesyrs2c
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesyrs2d pesyrs2d;
label define pesyrs2d
	-9          "N/A"                           
	-3          "Refusal"                       
	-2          "Don't know"                    
	-1          "Out of universe"               
;
label values pesyrs2e pesyrs2e;
label define pesyrs2e
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxsch614 pxsch61d;
label define pxsch61d
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxchpub  pxchpub;
label define pxchpub 
	0           "Not allocated"                 
	1           "Allocated"                     
;
label values pxchgrde pxchgrde;
label define pxchgrde
	0           "Not allocated"                 
	1           "Allocated"                     
;
