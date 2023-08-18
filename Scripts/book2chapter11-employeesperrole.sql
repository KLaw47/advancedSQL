SELECT
    et.employee_type_name,
    COUNT(e.employee_id) AS employee_count
FROM employeetypes et
LEFT JOIN employees e ON et.employee_type_id = e.employee_type_id
GROUP BY et.employee_type_name
ORDER BY employee_count DESC;