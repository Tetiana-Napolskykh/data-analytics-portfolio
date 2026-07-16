select fabd.ad_date, fabd.spend, fabd.clicks, 
fabd.spend/fabd.clicks as fild
from public.facebook_ads_basic_daily fabd 
where clicks>0
order by ad_date desc 
;