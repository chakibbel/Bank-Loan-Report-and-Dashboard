-- Display the table
select * from financial_loan;

-- Total loan applications
select  count(distinct id) as Total_applications from financial_loan;  
-- MTD total loan applications
select count(distinct id) as MTD_loan_applications from financial_loan
where month(issue_date)=12 and year(issue_date) = 2021;
-- PMTD total loan applications
select count(distinct id) as PMTD_loan_applications from financial_loan
where month(issue_date)=11 and year(issue_date) = 2021;

-- Total funded amount
select sum(loan_amount) as total_funded_amount from financial_loan;
-- MTD Funded amount
select sum(loan_amount) as MTD_total_funded from financial_loan
where month(issue_date)=12 and year(issue_date) = 2021;
-- PMTD Funded amount
select sum(loan_amount) as PMTD_total_funded from financial_loan
where month(issue_date)=11 and year(issue_date) = 2021;

-- Total Amount Received
select sum(total_payment) as Total_amount_received from financial_loan; 
-- MTD received amount
select sum(total_payment) as MTD_total_received from financial_loan
where month(issue_date)=12 and year(issue_date) = 2021;
-- PMTD received amount
select sum(total_payment) as PMTD_total_received from financial_loan
where month(issue_date)=11 and year(issue_date) = 2021;

-- Average Interest Rate
select round(avg(int_rate)*100, 2) as AVG_Int_Rate from financial_loan; 
-- MTD average interest rate
select round(avg(int_rate)*100, 2) as MTD_AVG_Int_Rate from financial_loan
where month(issue_date)=12 and year(issue_date) = 2021;
-- PMTD average interest rate
select round(avg(int_rate)*100, 2) as PMTD_AVG_Int_Rate from financial_loan
where month(issue_date)=11 and year(issue_date) = 2021;

-- Average Debt to Income Ratio
select round(avg(dti)*100, 2) as AVG_DTI from financial_loan;
-- MTD DTI
select round(avg(dti)*100, 2) as MTD_AVG_DTI from financial_loan
where month(issue_date)=12 and year(issue_date) = 2021;
-- PMTD DTI
select round(avg(dti)*100, 2) as PMTD_AVG_DTI from financial_loan
where month(issue_date)=11 and year(issue_date) = 2021;

-- Good loan application percentage
select count(id) * 100  / (select count(id) from financial_loan) as Good_loan_PCT
from financial_loan
where (loan_status = 'Fully Paid') or (loan_status = 'Current');

-- Good Loan Applications
select count(id) as Tot_good_loans from financial_loan
where (loan_status = 'Fully Paid') or (loan_status = 'Current');

-- Good Loan Funded Amount
select sum(loan_amount) as Good_total_funded from financial_loan
where (loan_status = 'Fully Paid') or (loan_status = 'Current');

-- Good Loan Total Received Amount:
 select sum(total_payment) as Good_total_received from financial_loan
 where (loan_status = 'Fully Paid') or (loan_status = 'Current');
 
 -- Bad loan application percentage
select count(id) * 100  / (select count(id) from financial_loan) as Bad_loan_PCT
from financial_loan
where (loan_status = 'Charged Off'); 
 
-- Bad Loan Applications
select count(id) as Tot_Bad_Loans from financial_loan
where (loan_status = 'Charged Off');

-- Bad Loan Funded Amount
select sum(loan_amount) as Bad_total_funded from financial_loan
where (loan_status = 'Charged Off');

-- Bad Loan Total Received Amount:
SELECT 
    SUM(total_payment) AS Bad_total_received
FROM
    financial_loan
WHERE
    (loan_status = 'Charged Off');

-- Loan status grid view
SELECT 
    loan_status,
    COUNT(DISTINCT id) AS Total_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS Total_amount_received,
    ROUND(AVG(int_rate) * 100, 2) AS Int_Rate,
    ROUND(AVG(dti) * 100, 2) AS AVG_DTI
FROM
    financial_loan
GROUP BY loan_status;

SELECT 
    loan_status,
    COUNT(DISTINCT id) AS MTD_loan_applications,
    SUM(loan_amount) AS MTD_total_funded,
    SUM(total_payment) AS MTD_total_received
FROM
    financial_loan
WHERE
    MONTH(issue_date) = 12
GROUP BY loan_status;
		