CREATE PROCEDURE [dbo].[serviceProvidercrud]
	@id int,
	@serviceId int,
	@userId int,
	@servProStatus char(1),
	@rating int,
	@action varchar(50)
AS BEGIN

	IF @action = 'Insert'

		BEGIN

			insert into serviceprovider(serviceId,userId,servProStatus,rating)
				values(@serviceId, @userId, @servProStatus, 0)

		END

	IF @action = 'UpdateStatus'

		BEGIN

			update serviceprovider set servProStatus = case servProStatus
			when 'I' then 'A'
			when 'A' then 'I' END where id = @id

	IF @action = 'Delete'

		BEGIN
			
			delete from serviceprovider where userId = @userId AND serviceid = @serviceId

		END
END END