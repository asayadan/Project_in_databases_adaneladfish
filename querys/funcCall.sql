--0,to_date("05/03/2022","dd/mm/yyyy"),to_date("05/03/2022","dd/mm/yyyy")
declare 
  c boolean;
begin
  c:= isCarFree (0,to_date("05/03/2022","dd/mm/yyyy"),to_date("05/03/2022","dd/mm/yyyy"));
  dbms_output.put_line('answer is: ' || c);
  end;
  
  
