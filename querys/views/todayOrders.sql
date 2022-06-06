create view today as
select * 
from orders o,DASTRAUS.CARS C,DASTRAUS.CUSTOMERS CU
where o.end_date - current_Date >= 0 and current_date - o.start_date >= 0 and c.license_plate = o.car_id and o.costumer_id = CU.CUSTOMER_ID
order by o.order_id
