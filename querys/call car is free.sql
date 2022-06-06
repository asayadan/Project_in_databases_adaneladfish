--call for is car free function

declare 
c number := 3;
startD date := to_date('05/03/2022','dd/mm/yyyy');
endD date := to_date('05/03/2022','dd/mm/yyyy');
res boolean;
begin
  res := isCarFree (c,startD,endD);
  
  if res = true then
    dbms_output.put_line('empty dates');
   else
     dbms_output.put_line('full dates');
 end if;
end;
  
