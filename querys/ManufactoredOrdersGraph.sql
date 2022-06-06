select EXTRACT (YEAR from C.MANUFACTURING_DATE), count(*)
from dastraus.cars C,orders o
where not exists (select * from Cancellations Can where o.order_id = Can.Order_Id) and c.license_plate = o.car_id 
group by EXTRACT (YEAR from C.MANUFACTURING_DATE)
order by EXTRACT (YEAR from C.MANUFACTURING_DATE) desc
