## Database Recommendation
ETL Decisions
1. Cleaning up the "Date" mess
Problem: Our source data contains different formats — some rows used DD/MM/YYYY, while others used YYYY-MM-DD. This would have made any time-based analysis impossible.
Resolution: All dates were converted into standard ISO format (YYYY-MM-DD) before being loaded to dim_date table. Now, whether you’re looking at a sale from January or June, the system reads it the same way.

2. Hunting down missing Store Cities
Problem: A handful of transactions were missing the store_city info, leaving gaps in our geographic reporting.
Resolution: Since the store_name appeared accurate, we built a quick lookup table to cross-reference the name and automatically fill in the missing city. Problem solved—no more "Unknown" locations in our charts.

3. Fixing inconsistent Category names
Problem: We had a "messy data" problem where "electronics," "ELECTRONICS," and "Electronics" were being treated as three different categories. 
Resolution: All categories were standardized to Title Case (e.g., "Electronics", "Groceries") to ensure consistency in the dim_product table.
