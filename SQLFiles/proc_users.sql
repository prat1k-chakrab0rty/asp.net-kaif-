CREATE PROCEDURE userscrud(
	@id int = null,
	@name varchar(50) = null,
	@email varchar(50) = null,
	@mobile bigint = null,
	@address varchar(max) = null,
	@zipcode int = null,
	@city varchar(50) = null,
	@locality varchar(50) = null,
	@password varchar(50) = null,
	@roleId int = null,
	@action varchar(6) = null)
AS BEGIN 
IF @action = 'insert'
	INSERT INTO users(name, email, mobile, address, zipcode, city, locality, password, roleId)
	VALUES (@name, @email, @mobile, @address, @zipcode, @city, @locality, @password, @roleId)
END