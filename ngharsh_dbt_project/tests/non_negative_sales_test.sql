SELECT *
 FROM 
 {{ ref('silver_fact_sales') }}
 WHERE net_amount<0