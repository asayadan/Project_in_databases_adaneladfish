create view paymentsLeft as
select o.payments - numpayment.temp  as diff, o.order_id
      from orders o,(
      select payments.order_id, count(*) as temp
      from payments
      group by payments.order_id ) numPayment
where o.order_id = numPayment.order_id and o.payments - numpayment.temp <> 0 
order by o.order_id
