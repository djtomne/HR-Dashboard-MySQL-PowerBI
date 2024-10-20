# HR-Dashboard-MySQL-PowerBI



## Data Used
**Data** - HR Data with over 22000 rows from 2000 to 2020
**Data Cleaning & Analysis** - MySQL Workbench
**Data Visualization** - Power BI

## Questions
1: What is the gender breakdown of employees in the company?
2: What is the race/ethnicity breakdown of employees in the company?
3: What is the age distribution of employees in the company?
4: How many employees work at headquarters versus remote locations?
5: What is the average length of employment for employees who have been terminated
6: How does the gender distribution vary across departments?
7: What is the distribution of job titles across the company?
8: Which departments has the highest turnover rate?
9: What is the distribution of employees across locations by city and state?
10: How has the company's employee count changed over time based on hire and term dates?
11: What is thge tenure distribution for each department?

## Summary of Findings
* There are more male employees.
* White race is the most dominant while Native Hawaiian or Other Pacific Islander are the least dominant.
* The youngest employee is 22 years old and the oldest employee is 58 years old.
* 5 age groups were created (18-24, 25-34, 35-44, 45-54, 55-64). A large number of employees were between 35-44 followed by 25-34 while the smallest group was 18-24.
* There are more employees working at the headquarters than remotely.
* The average length of employment for terminated employees is around 8 years.
* There are more male employees than female employees.
* The Auditing department has the highest turnover rate followed by Legal. The least turnover rate is Marketing.
* A large number of employees come from the state of Ohio.
* The net change in emoloyees has fluctuated over the year,reflecting instability in growth or reduction.
* The average tenure for each department is ranging from 9 to 11 years. Departments such as Business Development, Engineering, Research and Development, Sales, and Services have the highest average tenure of 11 years, while the Legal department stands out with the lowest at 9 years.

## Limitations
* Some records had negative ages and these were excluded during querying. Ages used were 18 years and above.
* The term dates will be null if the employee has not resigned.The term dates considered were those less than or equal to the current date.
