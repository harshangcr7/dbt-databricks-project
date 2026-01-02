select
    fs.sales_id,
    fs.date,


    {{concat('c.first_name','c.last_name')}} as name,
    c.gender,
    c.loyalty_tier,
  

    p.product_name,
    p.category,


    s.store_name,
    s.state_province,
    s.country,

    fs.quantity,
    fs.gross_amount,
    fs.discount_amount,
    fs.net_amount,
    fs.payment_method,
    case when fr.sales_id is not null then 1 else 0 end as return_flag,
    fr.refund_amount    

from {{ ref('silver_fact_sales') }} fs
left join {{ ref('customers_snapshot') }} c
    on fs.customer_sk = c.customer_sk
    and fs.date < c.dbt_valid_to
left join {{ ref('silver_dim_product') }} p
    on fs.product_sk = p.product_sk
left join {{ ref('silver_dim_store') }} s
    on fs.store_sk = s.store_sk
left join {{ ref('silver_fact_returns') }} fr
    on fs.sales_id = fr.sales_id
