libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Macros*/

/*Local Macro*/
%macro A;
proc print data=Sas.Cars;
run;
%mend;

%A

/*Global macro*/
%macro B(mydata);
proc print data=&mydata;
run;
%mend;

%B(SAS.Firstdata);
