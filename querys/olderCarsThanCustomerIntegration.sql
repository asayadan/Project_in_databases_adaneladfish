select CU.CUSTOMER_ID,CU.NAME,count(*)
from dastraus.customers CU, dastraus.cars C, orders o
where  C.LICENSE_PLATE = O.Car_ID and CU.CUSTOMER_ID = o.costumer_id and C.MANUFACTURING_DATE < CU.DATE_OF_BIRTH 
group by CU.CUSTOMER_ID,CU.NAME
having count(*)  >  4
order by count(*) desc
