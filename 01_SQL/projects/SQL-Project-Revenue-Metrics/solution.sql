WITH user_monthly as(
	select date(DATE_TRUNC('month', payment_date)) AS pay_month,
		user_id,
        game_name,
        SUM(revenue_amount_usd) AS total_revenue
	from games_payments gp
    GROUP BY
        user_id,
        game_name,
        pay_month),
revenue_prev_next_month as(select *, 
    date (pay_month - interval '1' month) as previous_month,
    date (pay_month + interval '1' month) as next_month,
    lag (total_revenue) over (PARTITION BY user_id ORDER BY pay_month) AS previous_month_revenue,
    LEAD(total_revenue) OVER (PARTITION BY user_id ORDER BY pay_month) AS next_month_revenue,
    lag (pay_month) OVER (PARTITION BY user_id ORDER BY pay_month) AS previous_paid_month,
    lead (pay_month) OVER (PARTITION BY user_id ORDER BY pay_month) AS next_paid_month
    from user_monthly),
revenue_metrics as(select pay_month,
		user_id,
		game_name,
		total_revenue,
CASE 
    WHEN previous_month_revenue IS NULL 
    then user_id 
END AS new_paid_users,
CASE 
    WHEN previous_paid_month IS NULL 
    THEN total_revenue 
END AS new_mrr,
CASE 
    WHEN next_month_revenue IS NULL 
    THEN user_id 
    END AS churned_users,
CASE 
    WHEN next_paid_month != next_month
    THEN total_revenue
END AS churned_revenue, 
CASE 
    WHEN previous_paid_month = previous_month and total_revenue>previous_month_revenue
    THEN total_revenue - previous_month_revenue
END AS expansion_mrr,
CASE 
    WHEN previous_paid_month = previous_month and total_revenue<previous_month_revenue
    THEN total_revenue - previous_month_revenue
END AS contraction_revenue,
CASE 
    WHEN previous_paid_month != previous_month and previous_paid_month IS not NULL
    THEN total_revenue
END AS back_from_churt_revenue,
previous_paid_month, previous_month
from revenue_prev_next_month)
select rm.*, gpu."language", gpu.has_older_device_model,gpu.age
from revenue_metrics as rm
left join games_paid_users gpu using (user_id)