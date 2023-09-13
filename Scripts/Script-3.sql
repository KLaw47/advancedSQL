
CREATE TABLE acc_receivable (
acc_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
credit_amount NUMERIC(8, 2),
debit_amount NUMERIC(8, 2),
date_recived DATE,
sale_id INT,
FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE
);
