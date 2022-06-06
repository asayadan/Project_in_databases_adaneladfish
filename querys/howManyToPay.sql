 select orders.costumer_id , sum(pay.price / orders.payments * paymentsLeft.Diff) as sumLeft
from orders,pay, 
     (select o.payments - numpayment.temp  as diff, o.order_id
      from orders o,(
      select payments.order_id, count(*) as temp
      from payments
      group by payments.order_id ) numPayment
      where o.order_id = numPayment.order_id  ) paymentsLeft
where orders.order_id = paymentsLeft.order_id and pay.order_id = orders.order_id
group by orders.costumer_id
order by orders.costumer_id
