create view SumExtras as
(select o.order_id, sum(e.price) as price
from orders o,extrasfororders efo,extras e
where o.order_id = efo.order_id  and efo.extra_id = e.extra_id
group by o.order_id 
union
(select oLL.order_id, 0
from orders oLL,extrasfororders efo
minus
select distinct efo.order_id, 0
from extrasfororders efo));


