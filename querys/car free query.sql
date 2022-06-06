select *
  from orders o
  where o.car_id = 2 and not((o.start_date - to_date('05/03/2022','dd/mm/yyyy') >= 0) or (to_date('05/03/2022','dd/mm/yyyy') - o.end_date >= 0))
