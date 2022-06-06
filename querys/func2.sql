create or replace function isCarFree(carId integer, orderStart date, orderFinish date) return boolean
is 
res boolean;

emptyDay number;

begin
  
  select count(*) into emptyDay from orders o
  where o.car_id = carId and not((o.start_date - orderFinish >= 0) or (orderStart - o.end_date >= 0));

  if orderStart > orderFinish then
    dbms_output.put_line('invlid dates');
  end if;

  if (emptyDay = 0) then
    res := true;
    dbms_output.put_line('empty');
  else
    dbms_output.put_line('full');
    res := false;
  end if;
    
  return (res);
end iscarfree;
