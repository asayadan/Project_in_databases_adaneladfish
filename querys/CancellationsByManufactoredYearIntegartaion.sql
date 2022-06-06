select EXTRACT (YEAR from C.MANUFACTURING_DATE), count(*)
from dastraus.cars C,orders o,cancellations ca
where o.order_id = ca.cancelation_id and c.license_plate = o.car_id 
group by EXTRACT (YEAR from C.MANUFACTURING_DATE)
order by EXTRACT (YEAR from C.MANUFACTURING_DATE) desc
