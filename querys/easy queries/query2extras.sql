select cars.car_id , extras.extra_id,count(*)
from cars,orders,Extrasfororders,extras
where cars.car_id = orders.car_id and orders.order_id = extrasfororders.order_id and extrasfororders.extra_id = extras.extra_id 
group by cars.car_id, extras.extra_id 
having count(*) > 4
order by Cars.Car_Id
