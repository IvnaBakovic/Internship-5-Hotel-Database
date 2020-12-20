--creating database for hotels
-- 1. korak
CREATE DATABASE HotelDatabase

-- 2. korak
USE HotelDatabase

--3. korak
create table Hotels (
Id int IDENTITY(1,1) PRIMARY KEY,
Name nvarchar(100) NOT NULL,
Address nvarchar(100),
PostalCode int,
HotelCategorization int CHECK(HotelCategorization between 1 AND 5),
Capacity int
)


create table WorkingPlaces(
Id int IDENTITY(1,1) PRIMARY KEY,
JobName nvarchar(100) NOT NULL
)

create table Buyers(
Id int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
PhoneNumber nvarchar(15) NOT NULL,
Address nvarchar(30),
PostalCode int,
Email nvarchar(50) NOT NULL
)

create table AccommodationTypes(
Id int IDENTITY(1,1) PRIMARY KEY,
AccomodationName nvarchar(50) NOT NULL,
Price decimal(5,2) NOT NULL
)

create table Guests(
Id int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
PhoneNumber nvarchar(30) NOT NULL
)

-- 4. korak

create table Employees(
Id int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
HotelId int FOREIGN KEY REFERENCES Hotels(Id) NOT NULL,
WorkingPlaceId int FOREIGN KEY REFERENCES WorkingPlaces(Id) NOT NULL,
StartOfEmployment datetime2 NOT NULL,
EndOfEmployment datetime2,
PhoneNumber nvarchar(50),
Address nvarchar(50),
PostalCode int
)

create table Rooms(
Id int IDENTITY(1,1) PRIMARY KEY,
HotelId int FOREIGN KEY REFERENCES Hotels(Id) NOT NULL,
RoomNumber int NOT NULL,
Capacity int,
Price decimal(5,2)
)

create table Bookings(
Id int IDENTITY(1,1) PRIMARY KEY,
BuyersId int FOREIGN KEY REFERENCES Buyers(Id) NOT NULL,
AccomodationId int FOREIGN KEY REFERENCES AccommodationTypes(Id) NOT NULL,
BookingDate DATETIME2 NOT NULL,
CheckInDate DATETIME2 NOT NULL,
CheckOutDate DATETIME2 NOT NULL,
TotalPrice DECIMAL(9,2),
TransactionDate DATETIME2 NOT NULL
)

-- 5. korak

create table BookingRooms(
BookingId int FOREIGN KEY REFERENCES Bookings(Id) NOT NULL,
RoomId int FOREIGN KEY REFERENCES Rooms(Id) NOT NULL,
GuestId int FOREIGN KEY REFERENCES Guests(Id) NOT NULL,
CONSTRAINT BookingRoomsPrimaryKey PRIMARY KEY(BookingId, RoomId, GuestId)
)

-- 6. korak

insert into  Hotels(Name, Address, PostalCode, HotelCategorization, Capacity) VALUES
('Hotel Sunce','Ulica petar petric 3', 21000, 4,200),
('Hotel Amfora','žnjanska ulica 4', 21000, 5, 300),
('Hotel Marul','Ulica Marka Marulića 3',21000, 3, 123),
('Hotel Split','Poljička ulica 3', 21000, 3, 56),
('Hotel Marjan','Marjanska ulica', 21000, 5, 23)

insert into  WorkingPlaces(JobName) VALUES
('Concierge'),
('Receptionist'),
('Maid'),
('Hotel Manager'),
('Room Service')

insert into  Buyers(FirstName, LastName, PhoneNumber, Address, PostalCode, Email) VALUES
('Petra','Ivić','38521374485','Poljička ulica',21000,'petraivic@gmail.com'),
('Dominik','Krupić','385956781254','Poljička ulica', 10000,'dominik@gmail.com'),
('Marina','Dobrić','385956781254',NULL, 20000,'marina@gmail.com'),
('Luka','Marić','385956781254','Frankopanska ulica', 12340,'lukamaric@gmail.com'),
('Ivna','Baković','385943209828','Mosećka ulica', 21000,'ivna@gmail.com'),
('Lucija','Tomić','385943209828','Cvijete Zuzorić 3', 12345,'lucija@gmail.com'),
('Ante','Lukić','385943209828','Put Brda 7', NULL,'ante@gmail.com'),
('Mario','Baković','385943209828','Teslina ulica', NULL,'mbakovic@gmail.com')

insert into  AccommodationTypes(AccomodationName,Price) VALUES
('NOTHING-INCLUDED',0),
('HALF BOARD', 49.99),
('FULL BOARD', 99.99)

insert into  Guests(FirstName, LastName, PhoneNumber) VALUES
('Petra','Ivić','38521374485'),
('Dominik','Krupić','385956781254'),
('Marija','Dobrić','385956781254'),
('Luka','Marić','385956781254'),
('Ivna','Baković','385943209828'),
('Lucija','Tomić','385943209828'),
('Luka','Tomić','385943209828'),
('Ante','Lukić','385943209828'),
('Dora','Lukić','385943209828'),
('Mario','Baković','385943209828')


-- 7. korak

insert into  Rooms(HotelId, RoomNumber, Capacity, Price) VALUES
(2,3,3,123.22),
(1,1,2,123.22),
(1,11,3,200.3),
(1,6,1,120),
(1,7,4,200.99),
(1,8,2,100),
(2,1,2,123.22),
(3,11,3,200.3),
(4,6,1,120),
(5,7,4,200.99),
(4,111,2,100),
(1,71,2,123.22),
(2,3,2,123.22)

insert into  Employees(FirstName, LastName, HotelId, WorkingPlaceId, StartOfEmployment, EndOfEmployment, PhoneNumber, Address, PostalCode) VALUES
('Ivan','Ivić',1,1,'2018-12-01',NULL,NULL,'Poljička ulica', 21000),
('Dora','Krupić',1,2,'2018-12-01',NULL,'385956781254','Poljička ulica', 21000),
('Ivano','Dobrić',1,3,'2018-06-01',NULL,'385956781254','Imotska ulica', 21000),
('Marija','Marić',1,3,'2017-06-01',NULL,'385956781254','Frankopanska ulica', 21000),
('Jelena','Jelić',1,3,'2015-04-01',NULL,'385943209828','Mosećka ulica', 21000),
('Mira','Tomić',2,1,'2016-04-01',NULL,'385943209828','Cvijete Zuzorić 3', 21000),
('Dominik','Lukić',5,4,'2015-03-01',NULL,'385943209828','Put Brda 7', 21000),
('Luka','Baković',4,5,'2019-04-01',NULL,'385943209828','Teslina ulica', 21000)

insert into  Bookings(BuyersId, AccomodationId, BookingDate, CheckInDate, CheckOutDate, TotalPrice, TransactionDate) VALUES
(1,2,'2020-07-01','2020-07-26','2020-07-30', 120.56, '2020-07-06'),
(2,2,'2020-08-01','2020-12-26','2020-12-30', 1893.56, '2020-08-06'),
(3,2,'2020-12-01','2020-12-05','2020-12-30', 1876.56, '2020-12-04'),
(4,2,'2019-07-01','2019-07-26','2019-07-30', 2235.56, '2020-07-06'),
(5,3,'2020-01-01','2020-01-26','2020-01-30', 234.56, '2020-01-05'),
(6,3,'2020-12-01','2020-12-01','2020-12-30', 500.56, '2020-07-06'),
(7,3,'2020-11-01','2020-12-05','2020-12-16', 200.56, '2020-12-01'),
(8,1,'2020-05-01','2020-05-25','2020-05-26', 345.56, '2020-05-10')


-- 8. korak
insert into  BookingRooms(BookingId, RoomId, GuestId) VALUES
(2,1,1),
(3,2,2),
(4,3,3),
(5,4,4),
(6,5,5),
(7,6,6),
(7,6,7),
(8,8,8),
(8,8,9),
(8,8,10)

-- Dohvatiti sve sobe hotela određenog imena, i to poredane uzlazno po svom broju

select * from Rooms
INNER JOIN Hotels ON Rooms.HotelId = Hotels.Id
WHERE Hotels.Name LIKE 'Hotel Sunce'
ORDER BY Rooms.RoomNumber


-- Dohvatiti sve sobe u svim hotelima kojima broj počinje sa brojem 1

select * from Rooms WHERE RoomNumber LIKE '1%'


-- Dohvatiti samo ime i prezime svih čistačica u određenom hotelu

select FirstName, LastName 
from Employees
LEFT JOIN WorkingPlaces ON Employees.WorkingPlaceId = WorkingPlaces.Id
where WorkingPlaces.JobName='Maid' AND Employees.HotelId=1

-- Dohvatiti kupnje od 1.12.2020. koje prelaze cijenu od 1000

select * from Bookings where TransactionDate>'2020-12-01' and TotalPrice>1000

-- Dohvatiti sve boravke u svim hotelima koji su trenutno u tijeku

select * from Bookings where CheckInDate < GETDATE() AND GETDATE()< CheckOutDate


-- Izbrisati sve boravke koji su napravljeni prije 1.1.2020.

DELETE FROM BookingRooms
WHERE BookingRooms.BookingId  in (select Id from Bookings where Bookings.CheckOutDate<= '2020-01-01')

DELETE FROM Bookings where Bookings.CheckOutDate<= '2020-01-01'

-- Sve sobe drugog hotela po redu koje imaju kapacitet 3 povećati kapacitet na 4

UPDATE Rooms SET Capacity = 4 WHERE HotelId=2 AND Capacity=3


-- Dohvatiti povijesni pregled boravaka određene sobe, poredano po vremenu boravka

select 
Buyers.FirstName as 'BuyerFirstName',
Buyers.LastName as 'BuyerLastName',
Bookings.CheckInDate,
Bookings.CheckOutDate, 
Guests.FirstName as 'GuestFirstName', 
Guests.LastName as 'GuestLastName'
from Bookings
left join Buyers ON Bookings.BuyersId= Buyers.Id  
left join BookingRooms ON Bookings.Id = BookingRooms.BookingId
left join Rooms ON BookingRooms.RoomId = Rooms.Id
left join Guests ON BookingRooms.GuestId = Guests.Id 
where Rooms.Id = 8
ORDER BY Bookings.CheckInDate


-- Dohvatiti sve boravke koji su bili ili pansion ili polupansion, i to samo u određenom hotelu

select Bookings.CheckInDate,
Bookings.CheckOutDate, 
Guests.FirstName as 'GuestFirstName', 
Guests.LastName as 'GuestLastName'
from Bookings
left join BookingRooms ON Bookings.Id = BookingRooms.BookingId
left join Rooms ON BookingRooms.RoomId = Rooms.Id
left join Hotels ON Rooms.HotelId=Hotels.Id
left join Guests ON BookingRooms.GuestId = Guests.Id 
where (Bookings.AccomodationId=2 OR Bookings.AccomodationId=3) AND Hotels.Name LIKE 'Hotel Sunce'



-- Promovirati 2 zaposlenika sobne posluge u recepcioniste

UPDATE Employees SET Employees.WorkingPlaceId = 2 where Employees.WorkingPlaceId=3


