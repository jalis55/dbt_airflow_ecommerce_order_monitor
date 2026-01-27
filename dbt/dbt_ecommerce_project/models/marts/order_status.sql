with order_status as (
select 
    o.order_id,
    c.name as customer_name,
    o.order_date,
    s.status,
    s.shipped_at,
    s.delivered_at,
    DATEDIFF('hour',s.shipped_at,s.delivered_at) as delivery_hours

from 
    {{ref('stg_orders')}} o
    join {{ref('stg_shipments')}} s on o.order_id = s.order_id
    join {{ref('stg_customers')}} c on o.customer_id = c.customer_id
)

select 
order_id,
customer_name,
delivery_hours,
case
    when status='shipped' and delivery_hours > 20 then 'Delayed'
    else status
end as order_status

from order_status
