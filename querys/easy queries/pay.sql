



select priceperorder.order_id ,PricePerOrder.price + sumExtras.price as price,PricePerOrder.price as basePrice, sumExtras.price as extrasPrice
from PricePerOrder, SumExtras
where pricePerOrder.order_id = sumExtras.order_id
order by Priceperorder.order_id



