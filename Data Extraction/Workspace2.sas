/*Workspace for data manipulation*/
/*Created Table for states*/
data SAS.States;
infile 'C:\2017\Work\Wireclass\SAS_Workshop\USStates.txt';
length State$15. Region$20.;
Input State$ Region$ Area Population;
run;

/*Creating instance from mother dataset*/
data SAS.Example;
set SAS.States;
run;

/*Keeping variables in dataset*/
data SAS.Keeping;
set SAS.Example(keep=State Area);
run;

/*Dropping variables*/
data SAS.Dropping;
set SAS.Example(drop=Area);
run;


/*Set of observation form dataset*/
data SAS.Observation;
set SAS.Example(firstobs=3 obs=13);
run;


/*Sorting of dataset*/
proc sort data=SAS.States out=SAS.States_population;
by descending Population;
run;
