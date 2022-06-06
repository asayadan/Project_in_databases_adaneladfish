declare 
  result number;
  orderNumber number := 1;
begin 
  result := getExtrasPriceOfOrder(orderNumber);
  dbms_output.put_line('sum of extras for order '||to_char(orderNumber,'999999') ||' is: '|| to_char(result,'999.99'));
end;
