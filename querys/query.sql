create or replace procedure ordersWithSpecificExtraAndDays( days integer, extrasInt integer)
is 
x number:=0;

cursor extrasPrint is
       select o.order_id as orderID 
       from extrasfororders e, orders o
       where e.extra_id = extrasInt and o.order_id = e.order_id and o.end_date-o.start_date = days
       order by o.order_id;
s1 extrasPrint%Rowtype;
begin 
  open extrasPrint;
  if(extrasPrint%Notfound) then
  dbms_output.put_line('No');
  else
    loop
      fetch extrasPrint into s1;
      exit when extrasPrint%notfound;
      dbms_output.put_line(to_char(s1.orderID,'999999'));
    end loop;
    end if;
end ordersWithSpecificExtraAndDays;

