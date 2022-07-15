create table Customer
(
	PersonID		int			generated always as identity	not null,
	FirstName		varchar(100)								not null,
	LastName		varchar(100)								not null,
	Age				int											not null,
	Occupation		varchar(100)								not null,
	MaritalStatus	varchar(100)								not null,
	primary key(PersonID)
);

insert into Customer(FirstName, LastName, Age, Occupation, MaritalStatus) values
('John', 'Smith', 28, 'Backend Developer', 'single'),
('Mike', 'Johnson', 20, 'Frontend Developer', 'married'),
('Anne', 'Williams', 32, 'Product Owner', 'divorced'),
('Mary', 'Miller', 52, 'Scrum Master', 'widowed');

create table Orders
(
	OrderID				int			generated always as identity	not null,
	PersonID			int											not null,
	DateCreated			timestamp									not null,
	MethodOfPurchase	varchar(100)								not null,
	primary key(OrderID),
	constraint fk_customer foreign key(PersonID) references Customer(PersonID)
);

insert into Orders(PersonID, DateCreated, MethodOfPurchase) values
(1, now() - INTERVAL '5 days', 'CASH'),
(1, now() - INTERVAL '3 days', 'CREDIT CARD'),
(2, now() - INTERVAL '10 days', 'DEBIT CARD'),
(3, now() - INTERVAL '7 days', 'PAYPAL'),
(4, now() - INTERVAL '1 day', 'PAYPAL'),
(4, now() - INTERVAL '2 days', 'CASH');

create table OrdersDetails
(
	OrderDetailID		int			generated always as identity	not null,
	OrderID				int											not null,
	ProductNumber		int											not null,
	ProductID			int											not null,
	ProductOrigin		varchar(100)								not null,
	primary key(OrderDetailID),
	constraint fk_orders foreign key(OrderID) references Orders(OrderID)
);

insert into OrdersDetails(OrderID, ProductNumber, ProductID, ProductOrigin) values
(1, 1, 1112222333, 'EUA'),
(2, 2, 123, 'MEXICO'),
(3, 3, 456, 'BRAZIL'),
(4, 4, 789, 'ARGENTINA'),
(5, 1, 1112222333, 'EUA'),
(6, 5, 1000, 'JAPAN');
