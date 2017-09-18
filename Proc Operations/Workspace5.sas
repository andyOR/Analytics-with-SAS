libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

/*Arrays*/
data SAS.Fish_arrays;
set SAShelp.Fish;
run;

/*Changing observation value 35 from Fish rows of Length1, Length2 and Length3 through Arrays*/
data SAS.Arrays;
set SAS.Fish_arrays;
array ff(3) Length1 Length2 Length3;
do i = 1 to 3;
if ff(i)=35 then ff(i)=50;
end;
run;

/*Need to drop extra i column*/
data SAS.Arrays1;
set SAS.Arrays (drop=i);
run;


/*Finding mean*/
proc means data=SAS.Fish_arrays maxdec=2;
var Length1 Height Width Weight;
run;

/*By keyword for species classification*/
proc means data=SAS.Fish_arrays maxdec=2;
var Length1 Height Width Weight;
by Species;
run;

/*Class keyword for matrix output*/
proc means data=SAS.Fish_arrays maxdec=2;
var Length1 Height Width Weight;
class Species;
run;


