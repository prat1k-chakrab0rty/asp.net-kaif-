CREATE PROCEDURE [dbo].[bookingscrud]
	@serviceId int,
	@userId int,
	@serviceProviderId int,
	@description varchar(max),
	@action varchar(20),
	@status char(1),
	@dateTime datetime

AS BEGIN 

	IF @action = 'Insert'

	BEGIN

		insert into bookings(dateTime, serviceId, userId, serviceProviderId, description, status, rating) 
			values (CONVERT(VARCHAR(19), GETDATE(), 120), @serviceId, @userId, @serviceProviderId, description, 0)

	END

	IF @action = 'UpdateStatus'

	BEGIN

		update bookings set status = @status where dateTime = @dateTime

	END

END