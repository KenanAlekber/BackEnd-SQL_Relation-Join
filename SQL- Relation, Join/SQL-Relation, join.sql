CREATE DATABASE Relation
USE Relation

--Task-1

CREATE TABLE Users
(
	Id int primary key identity,
	Username nvarchar(25) NOT NULL CHECK(len(Username) >= 5),
	Password nvarchar(25) NOT NULL CHECK(len(Password) >= 8)
)

CREATE TABLE Roles
(
	Id int primary key identity,
	Name nvarchar(20) NOT NULL CHECK(len(Name) >= 3),
	UserId int FOREIGN KEY REFERENCES Users(Id)
)

SELECT * FROM Users as u
FULL OUTER JOIN Roles as r
ON r.UserId = u.Id


--Task-2

CREATE TABLE Categories
(
	Id int identity primary key,
	Name nvarchar(20) NOT NULL,
	ParentId int FOREIGN KEY REFERENCES Categories(Id)
)

SELECT c.Name as 'Kateqoriya', sc.Name as 'SubKateqoriya' FROM Categories as c
LEFT JOIN Categories as sc
ON c.ParentId = sc.Id