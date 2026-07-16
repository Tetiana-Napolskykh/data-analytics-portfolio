with fb_nt as(
select
		fabd.ad_date ,
		fc.campaign_name,
		fa.adset_name,
		fabd.spend,
		fabd.impressions,
		fabd.reach  ,
		fabd.clicks ,
		fabd.leads ,
		fabd.value , 
'facebook' as add_source
from facebook_ads_basic_daily fabd 
join facebook_campaign fc 
on fabd.campaign_id = fc.campaign_id 
join facebook_adset fa 
on fabd.adset_id = fa.adset_id 
union all
select 
		gabd.ad_date ,
		gabd.campaign_name  ,
		gabd.adset_name ,
		gabd.spend ,
		gabd.impressions ,
		gabd.reach ,
		gabd.clicks ,
		gabd.leads ,
		gabd.value, 
'google' as add_source
from google_ads_basic_daily gabd 
)
select 
		fb_nt.ad_date,
		fb_nt.campaign_name,
sum (spend)as spend,
count  (impressions) as impressions,
count  (clicks) as clicks,
sum (value) as value
from fb_nt
group by fb_nt.ad_date, fb_nt.campaign_name
order by fb_nt.ad_date desc
;