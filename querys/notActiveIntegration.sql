select C.LICENSE_PLATE,O.ORDER_ID, CU.NAME, CU.CUSTOMER_ID,C.CAR_MODEL
from dastraus.cars C, orders O,dastraus.customers CU
where C.LICENSE_PLATE = O.Car_ID and CU.CUSTOMER_ID = o.costumer_id and C.ACTIVE = 0
order by C.LICENSE_PLATE
