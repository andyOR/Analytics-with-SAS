libname SAS 'C:\2017\Work\Wireclass\SAS_Workshop';

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

/*Proc SQl Keep and drop - Never used as it don't suffice to rules of comma seperation */
Proc sql;
select * from Sashelp.Class (keep= Name Height Weight);
quit;


/*Proc SQL Operators*/
/*Where Operator*/
Proc sql;
select * from Sashelp.Failure
where Process = "Process A";
quit;

/*Where & AND Operator*/

Proc sql;
select * from Sashelp.shoes
where Region="South America" and Product="Men's Dress";
quit;


/*When Keyword - Used in Advanced SAS*/
proc sql;
select  Region, Sales,
Case
when Sales between 1 and 100000 then 'Low Volume'
when Sales between 100001 and 200000 then 'Medium Volume'
else 'High Volume'
end as Sales from SAShelp.shoes;
quit;


/*Between Keyword*/
proc sql;
select * from SAShelp.shoes
where Region="Western Europe" and Sales between 1 and 50000;
quit;

proc sql;
select * from SAShelp.shoes
where Region="Western Europe" and 1<=Sales< 50000;
quit;


/*Finding missing variable in Advanced SAS*/
/*no nmiss keyword*/
/*Missing Keyword*/
proc sql;
select * from Sashelp.holiday
where begin is missing;
quit;


/*Filling missing keyword with Coalesce*/

data SAS.holiday1;
set SAShelp.holiday;
run;

proc sql;
select Name,desc, coalesce(begin, 0) as New_begin
from SAS.holiday1;
quit;

/*Group Keyword*/
proc sql;
select Product,Region, sum(Stores) as New_stores
from Sashelp.shoes
group by Product, Region;
quit;
