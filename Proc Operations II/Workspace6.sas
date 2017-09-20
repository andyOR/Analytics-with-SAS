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
