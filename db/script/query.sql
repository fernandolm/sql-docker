select
	c.FirstName || ' ' || c.LastName as "Full Name",
	o.OrderId,
	to_char(o.DateCreated, 'dd/MM/yyyy hh24:mi:ss') as DateCreated,
	o.MethodOfPurchase as "Purchase Method",
	od.ProductNumber,
	od.ProductOrigin
from
	customer c
inner join
	Orders o
on
	o.PersonId = c.PersonId
inner join
	OrdersDetails od
on
	od.OrderID = o.OrderID
where
	od.ProductID = 1112222333;
