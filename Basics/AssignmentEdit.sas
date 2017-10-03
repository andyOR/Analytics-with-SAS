libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Reading United States Data with Six Variables*/
data UnitedStates;
infile 'C:\2017\Work\Wireclass\SAS_Workshop\UnitedStates.txt';
length State$15. Region$20. Capital$20. State_Party$20.;
Input State$ Region$ Capital$ Area Population State_Party$ ;
run;

proc print data=UnitedStates;
run;


/*Reading Cars data with Seven variables*/
data SAS.Cars;
length Mfg$20. Division$20. Make$15.;
Input Year Mfg$ Division$ Make$ Index Engine Cylinder;
datalines;
2018 Volkswagen Audi Roadster 46 2.0 4
2017 BMW BMW Champions 488 3.0 6
2015 Jaguar Jaguar F-Type 161 3.0 6
2016 Mercedez-Benz Mercedes AMG 191 4.0 8
2018 Porsche Porsche Boxster 202 2.0 4
;
run;

proc print data=SAS.Cars;
run;


/*Assignment 2*/

proc import datafile='C:\2017\Work\Wireclass\JUNKFOOD.xls'
out=JUNKFOOD
dbms=xls replace;
run;

data JUNKFOOD1;
set JUNKFOOD(keep=FOOD TYPE PRICE);
run;

data JUNKFOOD2;
set JUNKFOOD(firstobs=1 obs=15);
run;

data JUNKFOOD3;
set JUNKFOOD;
where TYPE='Fries' or TYPE='Shake';
run;

data JUNKFOOD4;
set JUNKFOOD;
where TYPE='Fries' and PRICE < 0.80;
run;

/*Assignment 3*/
proc import datafile='C:\2017\Work\Wireclass\EMPLOYEE.csv'
out=employee_new
dbms=csv replace;
run;

/*Educ var stat*/
proc means data=employee_new maxdec=2;
var educ;
run;

/*Educ stat by gender*/

proc format;
value $sex 'm'='Male'
           'f'='Female'
;
run;

data employee_new_1;
set employee_new;
format gender $sex.;
run;

proc means data=employee_new_1 maxdec=2;
var educ;
class gender;
run;


proc means data=employee_new_1 noprint;
var educ;
class gender;
output out=gender_class;
run;

ods pdf body='C:\2017\Work\Wireclass\Assignments\employee.pdf';
proc print data=gender_class;
run;
ods pdf close;


/*Sum of salary for gender*/
proc means data=employee_new_1 maxdec=2;
var educ;
class gender;
output out=SAS.SUM_report (drop=_Type_ _Freq_)sum=SUM;
run;

/*New Data set from employee Dataset- Employee_1*/
data employee_new1;
set employee_new_1 (keep=gender educ jobcat);
where gender='Male' and jobcat < 2 and educ > 11 and educ < 16;
run;


/*New Data set from employee Dataset- Employee_2*/
data employee_data1 employee_data2;
set employee_new_1  (keep=gender educ jobcat salary);
salary=INPUT(salary,dollar11.);
if gender='m' and jobcat < 2 and educ > 11 and educ < 16 then output employee_data1;
if gender='f' and jobcat < 2 and educ > 7 and educ < 13 and salary > 10000 then output employee_data2;
run;


/*Assignment 4*/
proc import datafile='C:\2017\Work\Wireclass\JUNKFOOD.xls'
out=JUNKFOOD
dbms=xls replace;
run;
/*Sum price by variation type*/
/*Ordering of Type Variable*/
proc sort data=Junkfood out=Junkfood1;
by Type;
run;

proc means data=Junkfood1 maxdec=2 noprint;
var Price;
by Type;
output out=SAS.SUM_totprice (drop=_Type_ _Freq_)sum=SUM;
run;
proc sort data=SAS.SUM_totprice;
by descending Sum;
run;

proc freq data=Junkfood;
table Type * Price;
run;
/*Question 2*/
proc freq data=Junkfood;
table Type;
run;

/*Question 3*/
proc format;
value $food 'Hamburger' = 1
            'RB Sandwich' = 2
			'Fish Sandwich' = 3
			'Ch Sandwich'= 4
			'Ch Nugget' = 5
			'Ch 2pc' = 6
			'Fries' = 7
			'Shake' = 8
;
run;

data XYZ;
set Junkfood;
format Type $food.;
run;

/*Question 4*/
data XYZ2;
set Junkfood;
array ff(5) Weight Calories Protein Fat Satfat;
do i = 1 to 5;
if ff(i)=11 then ff(i)=3;
end;
run;

data XYZ2;
set XYZ2 (drop=i);
run;

/*Question 5*/
proc tabulate data=JunkFood;
var Sodium Calcium Price;
class Type;
table Type all,mean *(Sodium) max*(Calcium) sum*(Price);
run;

proc tabulate data=JunkFood;
var Sodium Calcium Price;
class Type;
table Type all, sum*(Sodium Calcium Price);
run;
