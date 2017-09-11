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

/*Export SAS file into other file formats*/

/*Export SAS file into CSV format*/

proc export data=Sashelp.Cars
outfile='C:\2017\Work\Github\SAS\Analytics-with-SAS\Getting Data into SAS\Cars.csv'
dbms=csv replace;
run;

/*Export SAS file into xlsx format*/
proc export data=Sashelp.Cars
outfile='C:\2017\Work\Github\SAS\Analytics-with-SAS\Getting Data into SAS\Cars.xlsx'
dbms=xlsx replace;
run;


/*Export SAS file into text format*/
proc export data=Sashelp.Class
outfile='C:\2017\Work\Github\SAS\Analytics-with-SAS\Getting Data into SAS\Class.txt'
dbms=tab replace;
run;

/*Export SAS file into text format with comma delimiter*/
proc export data=Sashelp.Class
outfile='C:\2017\Work\Github\SAS\Analytics-with-SAS\Getting Data into SAS\Class.txt'
dbms=dlm replace;
delimiter=',';
run;

/*Data Preparation with conditional, logical and unique operator*/

/*IF conditional operator*/
data statesif;
set Sas.States;
if Region='South' then status='yes';
else status='no';
run;

/*Elseif conditional operator*/
data SAS.statesElseif;
set Sas.States;length status$5.;
if Region='South' then status='yes';
else if Region='Central' then status='right';
else status='no';
run;


/*Where conditional operator*/
data Sas.StatesWhr;
set SAS.States;
where Region='Northwest';
run;


/*Logical Operators in SAS*/
data SAS.CarsAnd;
set Sashelp.Cars;
where Make='Audi' and Type='Sedan';
run;


/*Logical OR operator*/
data SAS.CarsOr;
set Sashelp.Cars;
where Make='Audi'and Type='Sedan' or 
Make='BMW' and Type='Sports';
run;


/*/*Logical IN operator*/
data SAS.CarsIn;
set Sashelp.Cars;
where Make In('Audi' 'BMW' 'Buick' 'Cadillac' 'Chevrolet') and Type='Sports';
run;


/*Unique Operators*/
data SAS.CarsUnique;
set Sashelp.Cars;
where Make = 'Audi' and Type = 'Sports' and Horsepower > 400;
run;

data SAS.CarsUnique1;
set Sashelp.Cars;
where Make = 'Audi' and Type = 'Sports' and Horsepower > 400;
run;


data SAS.CarsUnique2;
set Sashelp.Cars;
where Make = 'Audi' and Cylinders^=6;
run;

end
