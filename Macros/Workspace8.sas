libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Macros*/
%macro A;
proc print data=Sas.Cars;
run;
%mend;

%A
