# Facebook Ads Campaign Metrics

**Goal:**  
Calculate key advertising metrics by campaign and date, using aggregated data from the `facebook_ads_basic_daily` table.

**Task:**  
1. Select the following fields from `facebook_ads_basic_daily`:  
   - `ad_date` — ad display date  
   - `campaign_id` — unique campaign identifier  
   - Aggregated metrics per date and campaign_id:  
     - total spend  
     - total impressions  
     - total clicks  
     - total conversion value  
2. Calculate the following metrics for each date and campaign_id:  
   - CPC (Cost per Click)  
   - CPM (Cost per Thousand Impressions)  
   - CTR (Click-Through Rate)  
   - ROMI (Return on Marketing Investment)  
3. Group the table by `ad_date` and `campaign_id`.  
4. Filter data to avoid division by zero (e.g., `impressions > 0` and `clicks > 0`).  