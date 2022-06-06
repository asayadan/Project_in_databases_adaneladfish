select c.cause, count(*)
from cancellations c
group by c.cause
order by count(*) desc
