select o.order_id,o.start_date  
from orders o,cancellations canc
where o.start_date > to_date('2022-04-01','yyyy-mm-dd') 
