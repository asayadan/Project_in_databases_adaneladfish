create view pay as
SELECT orders.order_id,(end_date - start_date) * pricing.price + sumExtras.price price
from orders,pricing,sumExtras
where orders.pricing_id = pricing.pricing_id and sumExtras.order_id = orders.order_id
order by orders.order_id; 
