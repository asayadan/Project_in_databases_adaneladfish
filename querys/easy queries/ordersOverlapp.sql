select o1.order_id, o2.order_id, o1.costumer_id
from orders o1,orders o2
where exists (select * from cancellations R where R.CAUSE = 'because' and R.ORDER_ID = o1.order_id ) and not exists (select * from cancellations R where R.CAUSE = 'because' and R.ORDER_ID = o2.order_id ) and o1.order_id > o2.order_id and o1.start_date > o2.start_date and o1.start_date < o2.end_date  and o1.costumer_id = o2.costumer_id








