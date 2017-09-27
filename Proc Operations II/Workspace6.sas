libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Counting frequency of data variables*/
/*Single variable fequency*/
proc freq data=Sashelp.shoes;
table product;
run;

/*Double variable frequency*/

proc freq data=Sashelp.shoes;
table Region * product;
run;


/*Dropping row percent and column percent*/

proc freq data=Sashelp.shoes;
table Region * product/ norow nocol;
run;

/*Displaying cum. frequency and cum. percent*/
proc freq data=Sashelp.shoes;
table Region * product/ list out=SAS.shoes_sales;
run;

/*Proc formatting*/
/*Formating data observation*/
proc format;
value $gender 'm'='Male'
              'f'='Female'
;
run;

data employee_new_1;
set employee_new;
format sex $gender.;
run;


/*Reports in Proc*/
proc report data=Sashelp.shoes;
column Sales;
run;

proc report data=Sashelp.shoes nowd;
column stores Sales inventory returns;
run;

/*Define Statements*/
proc report data=Sashelp.shoes nowd;
column stores Sales returns;
define stores/analysis max;
define sales/analysis mean;
define returns/analysis min;
run;

/*Product Statement*/
proc report data=Sashelp.shoes nowd;
column Product stores Sales returns;
define stores/analysis max;
define sales/analysis mean;
define returns/analysis min;
define Product/Group;
run;

data SAS.States1;
set SAS.States;
run;
data SAS.States2;
set SAS.Stateswhr;
run;

/*Proc Append two datsets of States1 and States2*/

proc append base=SAS.States1 data=SAS.States2 force;
run;

/*Appending without proc append*/
data SAS.NewStates;
set SAS.States1 SAS.States2;
run;

/*Proc Merge*/
/*Always sort dataset b4 merging*/
proc sort data=Sashelp.Retail out=SAS.merge_eg1;
by Year;
run;

proc sort data=Sashelp.Tourism out=SAS.merge_eg2;
by Year;
run;

data SAS.Merge_data;
merge SAS.merge_eg2 SAS.merge_eg1;
by Year;
run;

/*Advanced SAS*/
/*Proc SQL*/
proc sql;
select Name, Height, Weight from Sashelp.Class;
quit;

/*Selecting all variables in dataset*/
proc sql;
select * from Sashelp.Class;
quit;


/*Data operation with Proc SQL*/
proc sql;
select Name, Sex, Height, Age, Weight, Height * Weight as BMI_index from Sashelp.Class;
quit;


/*Saving work or operation*/
proc sql;
create table SAS.ABC as 
select Name, Sex, Height, Age, Weight, Height * Weight as BMI_index 
from Sashelp.Class;
quit;


/*Ordering dataset by variable in Proc SQL*/
proc sql;
create table SAS.ABC as 
select Name, Sex, Height, Age, Weight, Height * Weight as BMI_index 
from Sashelp.Class
order by Weight;
quit;

proc sql;
create table SAS.ABC as 
select Name, Sex, Height, Age, Weight, Height * Weight as BMI_index 
from Sashelp.Class
order by Weight desc;
quit;

END
