# Product Revenue & User Analysis Dashboard

**Overview:**  
This project is a comprehensive Tableau dashboard analyzing **revenue data** for a product-based company. The dashboard focuses on user payments, product performance, and revenue trends across locations. The analysis is based on CSV data containing user payments and product information, and demonstrates advanced Tableau skills, KPI calculations, and cohort analysis.

**Data Source:**  
- CSV file: `saas_revenue.csv`  
  Fields:
  - `user_id` – unique user identifier  
  - `payment_date` – date of payment  
  - `location` – user location  
  - `software_name` – product name  
  - `is_enterprise_customer` – boolean flag for enterprise customers  
  - `revenue_amount` – payment amount  

**Key Metrics and KPIs:**  
- Total Revenue (monthly, by location, by product)  
- Paid Users Count  
- Average Revenue Per Paid User (ARPPU)  
- Monthly Change in Revenue  
- Monthly Recurrent Revenue (MRR)  
- New MRR (revenue from users who became paid in the given month)  
- Conversion Rates: registration → trial → paid  

**Dashboard Components:**  
- Indicators / Summary  
- Monthly Revenue trends  
- Revenue by Products and Locations  
- Cohort Analysis  
- User Funnel Analysis  

**Tableau Implementation:**  
- Calculated fields: `Total Revenue`, `Paid Users Count`, `ARPPU`  
- Filters applied: location, product, and date (interactive)  
- Multi-sheet layout combining summary, trends, product/location breakdowns, and cohort analysis  

**Dashboard Link:**  
- Interactive Tableau dashboard: [Open Dashboard](https://public.tableau.com/app/profile/tetiana.napolskzkh/viz/HomeWork1Blok3/Indicatorsorprojectresults)  