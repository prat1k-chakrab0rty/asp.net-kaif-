CREATE PROCEDURE [dbo].[myBookings]
	@email varchar(50)
AS BEGIN 

		select serviceName as 'Service Type', description as Description, datetime as 'Date & time',
			name as 'Service Provider Name', email as Email, 
			mobile as Mobile, locality as Locality, city as City, status as Status, 
			rating as Rating
			from bookings inner join users on bookings.userId = users.Id
			inner join services on bookings.serviceId = services.id
			where userId = (select id from users where email = @email)

END
