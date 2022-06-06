(select o.order_id,T.extrasNumber
from orders o, (select  P.ORDER_ID , count(*) as extrasNumber
             from Extrasfororders P
             group by P.order_id ) T
where exists (select * from cancellations R where R.CAUSE = 'because' and R.ORDER_ID = o.order_id ) and T.extrasNumber > 2 and T.order_id = o.order_id
)
union 
(
SELECT
  o.order_id, T.extrasNumber
FROM orders o,(select  P.ORDER_ID , count(*) as extrasNumber
             from Extrasfororders P
             group by P.order_id ) T
where o.end_date - o.start_date > 5)
