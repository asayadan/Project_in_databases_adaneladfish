select o.costumer_id, sum(daysRent.diff)
from orders o,(SELECT io.order_id,end_date - start_date as diff
from orders io
) daysRent
where o.order_id = daysRent.Order_Id
group by o.costumer_id

 
