create database Course
use Course

create table Students(
	Id int primary key identity(1,1),
	[Name] nvarchar(50),
	Surname nvarchar(50),
	Age int,
	Email nvarchar(50),
	[Address] nvarchar(50)
)
INSERT INTO Students([Name],Surname,Age,Email,[Address])
VALUES('Konul','Ibrahimova',27,'konul@gmail.com','Bayil'),
      ('Cinare','Ibadova',22,'cinare@gmail.com','Lokbatan'),
	  ('Roya','Meherremova',27,'roya@gmail.com','Sumqayit'),
	  ('Shaig','Kazimov',25,'shaig@gmail.com','Sedmoy'),
	  ('Cavid','Ismayilzade',22,'cavid@gmail.com','Sulutepe')

select * from Students

create table StudentArchives(
	[Id] int primary key identity(1,1),
	[StudentID] int,
	[Operation] nvarchar(10),
	[Date] Datetime
)


create procedure usp_deleteStudent
@id int
as
BEGIN
	delete from Students where Id = @id
END

exec usp_deleteStudent 5


create trigger trg_deleteStudent on Students
after delete
as
BEGIN
	insert into StudentArchives([StudentID],[Operation],[Date])
	select Id,'Delete',GETDATE() from deleted
END