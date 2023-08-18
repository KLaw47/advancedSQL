select distinct
	employees.last_name || ', ' || employees.first_name employee_name,
	sales.employee_id,
	sum(sales.price) over() total_sales,
	sum(sales.price) over(partition by employees.employee_id) total_employee_sales
from
	employees
join
	sales
on
	sales.employee_id = employees.employee_id 
order by employee_name