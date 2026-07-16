select ad_date, campaign_id,  
sum (spend) AS all_spend,
sum (value) AS all_value,
sum (impressions ) AS all_impr, 
sum (clicks) AS all_clicks,
round(sum (spend)::numeric/nullif(sum(clicks),0),2) as CPC,
round(sum (spend)::numeric*1000/nullif(sum(impressions),0),2) as CPM,
round(sum (clicks)::numeric*100/nullif(sum(impressions),0),2) as CTR,
round((sum(value)-sum(spend))::numeric/nullif(sum(spend),0),2) as ROMI
from "facebook_ads_basic_daily" fabdp 
where impressions>0
and clicks>0
group by ad_date, campaign_id;
