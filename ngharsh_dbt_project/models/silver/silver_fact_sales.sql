SELECT f.*, d.date FROM {{ ref('bronze_fact_sales') }} f
JOIN {{ ref('bronze_dim_date') }} d on d.date_sk = f.date_sk