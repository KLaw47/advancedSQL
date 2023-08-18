SELECT *
FROM 
	sales s 
WHERE 
	s.deposit >= 5000
OR 
	s.payment_method LIKE 'americanexpress'
ORDER BY s.deposit ASC  