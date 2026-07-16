# BigQuery Data Analysis Projects

This folder contains two analytical SQL projects built in **Google BigQuery** using data from the public GA4 e-commerce dataset.  
Both projects demonstrate real-world data preparation, aggregation, and conversion tracking for business and marketing analytics.

---

## Project 1: Data Preparation for BI Systems

📁 **Files:**  
- `queries/project_1_prepare_data.sql` → SQL query  
- `sample_results/project1_sample.csv` → sample output

🔗 **View on BigQuery:** [Task 1 Link](https://console.cloud.google.com/bigquery?sq=911909349233:497044bf52d34e89ad51b52e5be69b84)

**Goal:**  
Prepare a clean dataset for BI visualization (Tableau / Power BI) including event, user, and session details.

**Key steps:**  
- Extract events, user IDs, and session identifiers from GA4 data  
- Filter events for 2021  
- Include only relevant event types: `session_start`, `view_item`, `add_to_cart`, `begin_checkout`, `add_shipping_info`, `add_payment_info`, `purchase`  
- Add country, device, and traffic source dimensions

**Result:**  
A ready-to-use table for BI tools that allows detailed user behavior and funnel analysis.

---

## Project 2: Conversion Rate Analysis by Traffic Channel

📁 **Files:**  
- `queries/project_2_conversion_analysis.sql` → SQL query  
- `sample_results/project2_sample.csv` → sample output

🔗 **View on BigQuery:** [Task 2 Link](https://console.cloud.google.com/bigquery?sq=911909349233:d7c3a3d85b294a078d4327c9718f03de)

**Goal:**  
Calculate conversion rates across user sessions and marketing channels.

**Key steps:**  
- Build session-level details combining user and session identifiers  
- Count events by funnel stage (`session_start` → `add_to_cart` → `begin_checkout` → `purchase`)  
- Aggregate by date and traffic source  
- Compute conversion metrics for each stage

**Result:**  
A summarized table showing key marketing conversion ratios and traffic performance trends for 2021.

---

### Tools & Skills Demonstrated
- SQL (BigQuery Standard SQL)  
- Google Analytics 4 schema understanding  
- Data aggregation & funnel analysis  
- ETL for BI visualization (Tableau / Power BI)