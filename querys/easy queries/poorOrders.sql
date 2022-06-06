SELECT
  order_id,
  end_date - start_date   daysRent
FROM orders
where end_date - start_date < 3
