with sesions_details as (
  SELECT 
      date(timestamp_micros(event_timestamp)) date_event, 
      event_timestamp,
      traffic_source.source source_name,
      traffic_source.medium source_medium,
      traffic_source.name campaign_name, 
      event_name,
      concat (user_pseudo_id,(select value.int_value from e.event_params where key = 'ga_session_id')) user_session_id
 FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` e
  limit 1000),
sessions_counts as (
  select
      date_event,       
      source_name,
      source_medium,
      campaign_name,
      user_session_id,
      count (case when event_name ='session_start' then event_timestamp end) as session_start_count,
      count (case when event_name ='add_to_cart' then event_timestamp end) as cart_count,
      count (case when event_name = 'begin_checkout' then event_timestamp end) as checkout_count, 
      count (case when event_name = 'purchase' then event_timestamp end) as purchase_count     
 from sesions_details
 group by date_event,source_name,source_medium,campaign_name,user_session_id
 order by date_event,user_session_id)
 select 
      date_event,       
      source_name,
      source_medium,
      campaign_name, 
      count(user_session_id) user_session_count,
      case
        when sum(session_start_count)!=0 then round(sum(cart_count)/sum(session_start_count),2) 
      end visit_to_cart,
      case
        when sum(session_start_count)!=0 then round(sum(checkout_count)/sum(session_start_count),2) 
      end visit_to_checkout,
      case
        when sum(session_start_count)!=0 then round(sum(purchase_count)/sum(session_start_count),2) 
      end visit_to_purchase
  from sessions_counts
  group by date_event,source_name,source_medium, campaign_name
  order by date_event, count(user_session_id) desc;