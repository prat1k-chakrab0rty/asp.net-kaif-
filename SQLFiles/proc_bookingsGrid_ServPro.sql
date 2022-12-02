CREATE PROCEDURE [dbo].[bookingsGrid_ServPro]
	@serviceProviderId int
	
AS BEGIN

	select name as 'Customer Name', mobile as Mobile, address as Address, locality as Locality,
		city as City, serviceName as 'Service Type', description as Description, dateTime as 'Date & time',
		status as Status, rating as Rating
		from bookings inner join users on bookings.userId = users.id
		inner join services on bookings.serviceId = services.id
		where serviceProviderId = @serviceProviderId /*AND
		users.id = (select userId from bookings where serviceProviderId = @serviceProviderId)*/

END