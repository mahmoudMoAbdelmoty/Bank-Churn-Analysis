![alt text]()

# Bank-Churn-Analysis

### Project Overview
Analysis of bank churn data. Churn in this context signifies the number of customers who have left the bank.

## WorkFlow
### Data Connection
Establish a stable connection to the source of the bank churn data.

### Data Preparation
Data cleaning and preparation are crucial for accurate analysis.The following steps outline the data preparation process:
- Check data types and column names.
- Ensure column names begin with a capital letter.
- Modify values for clarity and understanding:
  - Churn Status: 1 – Churned, 0 – Not Churned
  - Activity Status: 1 – Active, 0 – Inactive
  - Credit Card Status: 1 – Owned, 0 – Not Owned
 
### Data Modeling and Analysis
Construct reference tables and develop conditional columns:

- Create a reference table from the customer data table, rename it to 'Age Groups', retain only the 'Age Group' column, and eliminate duplicates.
- Introduce an 'Age Group ID' conditional column in the 'Age Groups' table.
- Similarly, create reference tables for 'Account Balance' and 'Credit Scores'. Insert respective IDs as conditional columns.

### Data Visualization
Cards:

- Displaying the number of customers.
- Showcasing the churn rate.
- Representing the number of lost customers.

Charts:

- Donut charts for:
  - Number of customers by gender.
  - Number of customers by activity status.
  - Number of customers by credit card status.
  - Number of customers by country.
  - Number of customers by churn rate.
- Line clustered bar chart showing customers and churn rate by age group.
- Line and stacked column chart for customers and churn rate by credit score.
