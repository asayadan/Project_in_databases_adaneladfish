create or replace function getExtrasPriceOfOrder( orederId number) return number
is 
  res number;
  
  cursor extrasPerPeople is(
  select sum(e.price) as priceOfExtras
  from extrasfororders efo,extras e
  where orederId = efo.order_id  and efo.extra_id = e.extra_id
  );
  
  rowInTable extrasPerPeople%rowtype;
  total number;
  
begin
  total := 0;
  open extrasPerPeople;
  if(extrasPerPeople%Notfound) then
   res := 0;
  else
   loop
     fetch  extrasPerPeople into rowIntable;
     exit when extrasPerPeople%Notfound;
     total := total + rowIntable.priceOfExtras;
   end loop;
  end if;
  res := total;
  return (res);
end getExtrasPriceOfOrder;
