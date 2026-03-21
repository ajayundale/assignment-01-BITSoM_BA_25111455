## Storage Systems

Predicting Readmission Risk (Goal 1):
Patient records and treatment histories are stored in a **relational transactional database (*OLTP*)**. These systems are well-suited for structured medical data, ensure reliability through ACID transactions, and integrate easily with machine learning workflows. However, because training models on a live production database is a recipe for performance lag, we move historical data into a high-performance data warehouse. This allows the AI to crunch massive datasets without slowing down the doctors currently treating patients.

Doctor Queries in Plain English (Goal 2):
To let doctors ask questions in plain English, while the raw records stay in our relational database, we use a **Vector Database** to store **"embeddings"**. This allows a semantic search layer to translate a doctor’s request into the right medical context instantly.

Monthly Reports for Management (Goal 3):
A data warehouse (*OLAP system*) is the backbone here. ETL pipelines (Extract, Transform, Load) move data from transactional systems into the warehouse, where it is aggregated and optimized for reporting. Reporting Tools connect directly to the warehouse to generate department-wise costs, occupancy rates, and other KPIs.

Storing and Streaming real-time Vitals (Goal 4):
A time-series database is ideal for storing continuous vitals like heart rate, oxygen saturation, and blood pressure received from ICU monitoring devices. These databases are optimized for *high-velocity data ingestion* rates and real-time queries.


## OLTP vs OLAP Boundary

1. OLTP (Transactional):
The boundary begins with the EHR system and ICU monitoring feeds. OLTP databases handle patient registration, treatment updates, and vitals ingestion. These systems prioritize speed, reliability, and correctness of individual transactions.

2. ETL Layer:
The Extract, Transform, Load (ETL) process marks the transition. Data is periodically extracted from OLTP systems, cleaned, and transformed into analytical formats.

3. OLAP (Analytical):
Once data enters the data warehouse, it becomes part of the OLAP domain. Here, queries are optimized for aggregation, trend analysis, and reporting. The AI models also consume data from this layer, since they require large-scale historical datasets rather than single transactions.

## Trade-offs
A major trade-off is real-time vs batch processing:
- Challenge: ICU vitals demand real-time ingestion and alerting, while management reports and predictive models rely on batch-processed, cleaned data. Balancing both can strain infrastructure if not carefully designed.
- Mitigation:
1. Use separate specialized storage systems (time-series DB for real-time, warehouse for batch analytics). 
2. Introduce data lake storage as a staging area, allowing both real-time streams and batch pipelines to coexist without bottlenecks.

This design ensures transactional integrity for patient care, analytical depth for management, and flexibility for AI-driven insights, while clearly separating OLTP and OLAP responsibilities.