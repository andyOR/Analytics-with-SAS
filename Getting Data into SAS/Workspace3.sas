libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Import other file format into SAS environment*/

/*Import CSV file into SAS*/
proc import datafile='C:\2017\Work\Simulations\Simulation\TimeToFailure.csv'
out=SAS.TOF
dbms=csv replace;
run;

/*Import xlsx file into SAS*/
proc import datafile='C:\2017\Work\Github\SAS\Analytics-with-SAS\Getting Data into SAS\Data.xlsx'
out=SAS.Data_sas
dbms=xlsx replace;
run;

/*Import text file into SAS*/

proc import datafile='C:\2017\Work\Github\SAS\Analytics-with-SAS\Getting Data into SAS\Cars.txt'
out=SAS.Cars
dbms=dlm replace;
delimiter=' ';
getname=no;
run;

/*Import text with space delimiter and multiple rows into SAS*/

PROC IMPORT OUT= SAS.Production 
            DATAFILE= "C:\2017\Work\Github\Regression\Regression-Analysi
s-in-R\Simple Linear Regression\production.txt" 
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
