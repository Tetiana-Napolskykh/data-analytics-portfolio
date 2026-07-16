SELECT
timestamp_micros(event_timestamp) event_time,
user_pseudo_id, 
(select value.int_value from GA.event_params where key = 'ga_session_id') session_id,
event_name, 
geo.country,
device.category,
traffic_source.source,
traffic_source.medium,
traffic_source.name campaign_name
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` GA 
where _table_suffix between '20210101' and '20211231'
and 
event_name in ('session_start','view_item', 'add_to_cart', 'begin_checkout', 'add_shipping_info', 'add_payment_info', 'purchase')
LIMIT 1000