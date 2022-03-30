*Author: Chibuikem Oparaoji
;

FILENAME REFFILE '/home/u57042395/warzoneData.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=Wardata2;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=Wardata2; RUN;
*summary for good variable;
proc freq data=Wardata2;
label good='player quality';
table good;
run;
*bar chart for good varible;
proc gchart data=wardata2;
hbar good;
run;

*summary for work variable;
proc freq data=Wardata2;
label work='full time employment status';
table work;
run;
*bar chart for work varible;
proc gchart data=wardata2;
hbar work;
run;

*historgram for wins;
*also creates summary stats for all numeric varibles;
proc univariate data = wardata2;
histogram wins / midpoints=0 to 500 by 50 normal;
title "Histogram of wins"
run;

*stem and leaf plot for hours;
proc univariate data=wardata2 plot;
var hours;
run;

*stem and leaf plot for KD;
proc univariate data=wardata2 plot;
var KD;
run;


*sorting for summary stats;
proc sort data=wardata2;
by work;
run;
*Summary stats based on employment status;
proc means data=wardata2;
var wins hours KD;
by work;
title "Summary stats grouped by employment status";
*Making the histograms by the work varibale;
proc univariate data = wardata2 noprint;
histogram KD wins hours /normal;
class work;
title "Histograms"
run;

*sorting for summary stats but for good;
proc sort data=wardata2;
by good;
run;
*Summary stats based on player quality;
proc means data=wardata2;
var wins hours KD;
by good;
title "Summary stats grouped by player quality";
*Making the histograms by the player quality;
proc univariate data = wardata2 noprint;
histogram KD wins hours /normal;
class good;
title "Histograms"
run;

*Creating data set without wins outliers so I 
can use it when I need to identify relationships using the wins variable;
Data wardata1;
set wardata2;
if wins < 300;
if hours < 40;
if KD < 2.2;
run;

*Scatter plots of numeric data;
proc sgscatter data=wardata2;
matrix hours KD wins / group=work diagonal=(histogram kernel);
 run;

proc univariate data = wardata2 noprint;
histogram hours KD /normal;
title "Histogram";
run;


*Data step to creat a dummy variable for work;
data wardata1;
set wardata1;
if work='yes' then do;
w1 =1;
end;
else if work ='no' then do;
w1 = 0;
end;
run;

*Veiwing the proc reg results;
proc reg data=wardata1;
model wins = KD hours w1 /R;
run;
*removing outliers;
Data warreg;
set wardata1;
if wins = 22 then delete;
if hours = 34.66 then delete;
if wins = 165 then delete;
run;

*crearting model;
proc reg data=warreg;
model wins = KD hours w1;
run;

*Testing the significance of hours and w1;
proc reg data=warreg;
model wins = KD hours w1;
test1: test hours=0,w1=0; 
run;

*final model;
proc reg data=warreg;
model wins = KD;
run;


*Veiwing the proc reg results;
proc reg data=wardata1;
model hours = KD wins w1 /R;
run;

*removing outliers;
Data warreg1;
set wardata1;
if wins = 22 then delete;
if hours = 34.66 then delete;
if wins = 165 then delete;
if KD = 0.39 then delete;
if KD = 1.1 then delete;
run;


*crearting model;
proc reg data=warreg1;
model hours = KD wins w1;
run;

*Testing the significance of KD and wins;
proc reg data=warreg1;
model hours = KD wins w1;
test1: test wins=0,KD=0; 
run;
*Testing the significance of wins;
proc reg data=warreg1;
model hours = KD wins w1;
test1: test wins=0; 
run;

*final model;
proc glm data=warreg1;
model hours = KD w1;
run;





