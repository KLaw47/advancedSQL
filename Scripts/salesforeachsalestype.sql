SELECT s.*, st.sales_type_name
FROM sales s
JOIN salestypes st ON s.sales_type_id = st.sales_type_id 