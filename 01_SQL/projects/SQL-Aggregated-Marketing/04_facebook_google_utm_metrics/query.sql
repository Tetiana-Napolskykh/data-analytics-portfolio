with CTE_1 as(
select ad_date , url_parameters , 
			coalesce (spend,0) as spend, 
			coalesce (impressions, 0) as impressions,
			coalesce (reach ,0) as reach,
			coalesce (clicks ,0) as clicks,
			coalesce (leads , 0) as leads,
			coalesce (value,0) as value  
from facebook_ads_basic_daily fabd
	join facebook_adset fa on fabd.adset_id = fa.adset_id
	join facebook_campaign fc on fabd.campaign_id = fc.campaign_id 
union
select ad_date , url_parameters , 
			coalesce (spend,0) as spend, 
			coalesce (impressions, 0) as impressions,
			coalesce (reach ,0) as reach, 
			coalesce (clicks ,0) as clicks,
			coalesce (leads , 0) as leads,
			coalesce (value,0) as value
from google_ads_basic_daily gabd)
select ad_date,
	case
		when lower(substring(url_parameters, 'utm_medium=([^&#$]+)')) ='nan' then null
		else lower(substring(url_parameters, 'utm_medium=([^&#$]+)'))
	end as utm_campaign,
			sum(spend) as sum_spend,
			sum(impressions) as sum_impressions,
			sum(clicks) as sum_clicks,
			sum(value) as sum_value,
	case
		when sum (clicks)>0 then round (sum(spend)/sum(clicks)::numeric,2)
		else 0 
	end as CPC,
	case
		when sum (impressions)<> 0 then round (sum (spend)/ sum(impressions)::numeric, 2)
		else 0 
	end as CPM,
	case
		when sum (clicks)> 0 then round(sum (clicks)/ sum(impressions)::numeric ,2)
		else 0
	end as CTR,
	case
		when sum (spend)> 0 then round ((sum (value)-sum(spend))/ sum(spend)::numeric ,2)
		else 0
	end as ROMI
from CTE_1
group by ad_date, utm_campaign
order by ad_date

