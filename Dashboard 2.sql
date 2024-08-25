-- Monthly Trends by Issue Date 
SELECT 
    MONTHNAME(issue_date) AS Issue_Month,
    COUNT(id) AS Tot_Applications,
    SUM(loan_amount) AS Tot_Funded_Amount,
    SUM(total_payment) AS Tot_Received_Amount
FROM
    financial_loan
GROUP BY MONTHNAME(issue_date)
ORDER BY FIELD(Issue_Month,
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November', 
        'December'
); 


-- Regional Analysis by State 
SELECT 
    address_state AS Issue_State,
    COUNT(id) AS Tot_Applications,
    SUM(loan_amount) AS Tot_Funded_Amount,
    SUM(total_payment) AS Tot_Received_Amount
FROM
    financial_loan
GROUP BY Issue_State
order by Issue_State;

-- Loan Term Analysis
 SELECT 
    term AS Loan_Term,
    COUNT(id) AS Tot_Applications,
    SUM(loan_amount) AS Tot_Funded_Amount,
    SUM(total_payment) AS Tot_Received_Amount
FROM
    financial_loan
GROUP BY term
order by term;

-- Employee Length Analysis
 SELECT 
    emp_length AS Employee_Length,
    COUNT(id) AS Tot_Applications,
    SUM(loan_amount) AS Tot_Funded_Amount,
    SUM(total_payment) AS Tot_Received_Amount
FROM
    financial_loan
GROUP BY emp_length
order by emp_length;

-- Loan Purpose Analysis
 SELECT 
    purpose AS Loan_Purpose,
    COUNT(id) AS Tot_Applications,
    SUM(loan_amount) AS Tot_Funded_Amount,
    SUM(total_payment) AS Tot_Received_Amount
FROM
    financial_loan
GROUP BY purpose
order by purpose;

-- Home Ownership Analysis
 SELECT 
    home_ownership AS Home_Ownership,
    COUNT(id) AS Tot_Applications,
    SUM(loan_amount) AS Tot_Funded_Amount,
    SUM(total_payment) AS Tot_Received_Amount
FROM
    financial_loan
GROUP BY home_ownership
order by home_ownership;