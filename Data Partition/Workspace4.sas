libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Data Partitioning with conditional operations, logical and unique operators */

/*Making different datasets*/

data data1 data2 data3;
set Sashelp.Cars;
if Make='Acura' and Type='Sedan' then output data1;
else if Make='Audi' and Type='Sedan' then output data2;
else if Make='BMW' and Type='Sedan' then output data3;
run;


/*Proc Steps/*/
proc print data=Sashelp.Cars;
var Make Type Origin Cylinders Horsepower;
run;


proc print data=Sashelp.Cars;
var Make Type Origin Cylinders Horsepower;
where Make='BMW';
run;

/*Finding number of observation in dataset with n*/
proc print data=Sashelp.Cars n;
var Make Type Origin Cylinders Horsepower;
where Make='BMW';
run;

/*By keyword*/
proc print data=Sashelp.Cars n;
var Make Type Origin Cylinders Horsepower;
By Make;
run;

/*Sum Keyword*/
proc print data=Sashelp.Cars n;
var Make Type Origin Cylinders Horsepower;
sum MSRP Cylinders;
run;

proc print data=Sashelp.Cars n;
var Make Type Origin Cylinders Horsepower;
sum MSRP Cylinders;
By Make;
run;


/*Publishing results in different format*/
/*PDF*/
ods pdf body='C:\2017\Work\Github\SAS\Analytics-with-SAS\Data Partition\Report.pdf';
proc print data=Sashelp.Cars n;
var Make Type Origin Cylinders Horsepower;
sum MSRP Cylinders;
By Make;
run;
