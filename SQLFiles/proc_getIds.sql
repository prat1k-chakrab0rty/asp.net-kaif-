CREATE PROCEDURE [dbo].[getIdsForBooking]
	@email varchar(50),
	@serviceName varchar(50),
	@serviceProviderName varchar(50),
	@serviceProviderEmail varchar(50),
	@action varchar(30)
AS BEGIN 
	
	IF @action = 'GetUserId'
		BEGIN 
			
			select id as userId from users where email = @email

		END

	IF @action = 'GetServiceId'
		BEGIN
			
			select id as serviceId from services where serviceName = @serviceName

		END

	IF @action = 'GetServiceProviderId'
		BEGIN
			
			select id as serviceProviderId from serviceprovider where userId = (select id as userId from users where name = @serviceProviderName)

		END
	
	IF @action = 'GetServiceProviderIdUsingEmail'
		BEGIN

			select id as serviceProviderId from serviceprovider where userId = (select id as userId from users where email = @serviceProviderEmail)	

		END

END