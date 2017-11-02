libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Create a dataset*/
data SAS.Firstdata;length City$10.;
Input City$ ID$ SAL Date_of_Joining;
informat Date_of_Joining ddmmyy10.0;
format Date_of_Joining Date9.;
datalines;
newyork T1 3000 12/07/2005
chicago T2 4000 05/08/2007
miami T3 4500 02/12/2006
washington T4 6000 09/05/2010
;
run;

proc print data=SAS.Firstdata;
run;

/*Space between data variables*/
data SAS.Movies;
Input Name & $20. Genre & $15.;
datalines;
Independence day  Sci-fi
Die Hard  Action
Notting Hill  Romantic
;
run;

proc print data=SAS.Movies;
run;

/*Reading other format file*/
data SAS.TexttoSas;
infile 'C:\2017\Work\Wireclass\SAS_Workshop\Text1.txt';
length State$15. Region$20.;
Input State$ Region$ Area;
run;


/*Reading text file with observation on multiple lines*/
data SAS.Text2toSas;
infile 'C:\2017\Work\Wireclass\SAS_Workshop\Text2.txt';
length State$15. Region$20.;
Input State$ Region$ / Area #3 Population;
run;







