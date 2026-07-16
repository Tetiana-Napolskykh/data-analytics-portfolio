# User Conversion & Funnel Analysis Dashboard

**Overview:**  
This Tableau project analyzes **user progression from registration to first payment** using a funnel approach. The dashboard highlights conversion rates, time-to-payment metrics, and interactive insights.

**Data Source:**  
- CSV file: `onboarding_funnel_product(2.0).csv`  
  Fields:
  - `user_id` – unique user identifier
  - `event` – type of event (e.g., registration, trial_start, payment)
  - `event_timestamp` – timestamp of the event

**Key Metrics and KPIs:**  
- Number of registered users  
- Number of users who started trial  
- Number of users who completed first payment  
- Conversion rates between steps  
- Average days from registration to each funnel step  
- Time-to-payment trends per month  

**Dashboard Components:**  
1. KPI Indicators  
   - Blocks for registered, trial, and paid users  
   - Tooltips show conversion rates from registration → trial → paid  
2. Monthly Registration Trends  
   - Line chart showing number of registrations per month  
   - Conversion from registration → trial  
3. Funnel Analysis  
   - Funnel chart showing user progression  
   - Absolute numbers and conversion rates  
4. Interactive Bonus  
   - Graph showing average days from registration to selected funnel step  
   - Dynamic using Tableau Actions and Parameters  

**Tableau Implementation:**  
- Calculated fields for counts, conversion rates, and average days to payment  
- Filters and Actions for interactive experience  
- Multi-sheet layout combining KPIs, trends, and funnel analysis  

**Dashboard Link:**  
- Interactive Tableau dashboard: [Open Dashboard](https://public.tableau.com/app/profile/tetiana.napolskzkh/viz/HW3Blok5/Dashboard2#1)  