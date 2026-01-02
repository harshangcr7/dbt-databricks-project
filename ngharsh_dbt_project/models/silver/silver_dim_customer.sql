with deduped as (
SELECT customer_sk, customer_code, first_name, last_name, gender, email, phone, loyalty_tier, signup_date, updated_datetime,
      row_number() over (
          partition by customer_sk
          order by updated_datetime desc
      ) as rn 
FROM {{ ref('bronze_dim_customer') }} c
) 
SELECT customer_sk, customer_code, first_name, last_name, gender, email, phone, loyalty_tier, signup_date, updated_datetime
FROM deduped WHERE rn=1