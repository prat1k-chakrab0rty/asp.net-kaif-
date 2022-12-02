CREATE PROCEDURE [dbo].[servicesGrid]
	@service varchar(50),
	@name varchar(50),
	@city varchar(50),
	@action varchar(50)
AS BEGIN
	IF @action = 'NoFilter'
		BEGIN select name as 'Service Provider Name',email as 'Email ID',
            serviceName as 'Service Type',serviceDescription as 'Service Description',
            mobile as 'Mobile Number',locality as Locality,city as City,zipcode as Zipcode
            from serviceprovider inner join users on serviceprovider.userid= users.id
            inner join services On serviceprovider.serviceid= services.id END

	IF @action = 'FilterByService'
		BEGIN select name as 'Service Provider Name',email as 'Email ID',
                            serviceName as 'Service Type',serviceDescription as 'Service Description',
                            mobile as 'Mobile Number',locality as Locality,
							city as City,zipcode as Zipcode from serviceprovider inner join users on
                            serviceprovider.userid= users.id inner join services
                            On serviceprovider.serviceid= services.id
                            where serviceid=(select id from services
                            where serviceName=@service)  END
	
	IF @action = 'FilterByName'
		BEGIN select name as 'Service Provider Name',email as 'Email ID',
                            serviceName as 'Service Type',serviceDescription as 'Service Description',
                            mobile as 'Mobile Number',locality as Locality,
							city as City,zipcode as  Zipcode from serviceprovider inner join users on 
                            serviceprovider.userid= users.id inner join services 
                            On serviceprovider.serviceid= services.id
                            where name = @name END

	IF @action = 'FilterByCity'
		BEGIN select name as 'Service Provider Name',email as 'Email ID',
                            serviceName as 'Service Type',serviceDescription as 'Service Description',
                            mobile as 'Mobile Number',locality as Locality,
							city as City,zipcode as  Zipcode from serviceprovider inner join users on 
                            serviceprovider.userid= users.id inner join services 
                            On serviceprovider.serviceid= services.id
                            where city = @city END

	IF @action = 'FilterByServiceAndName'
		BEGIN select name as 'Service Provider Name',email as 'Email ID',
                            serviceName as 'Service Type',serviceDescription as 'Service Description',
                            mobile as 'Mobile Number',locality as Locality,
							city as City,zipcode as Zipcode from serviceprovider inner join users on
                            serviceprovider.userid= users.id inner join services
                            On serviceprovider.serviceid= services.id
                            where serviceid=(select id from services
                            where serviceName=@service)
                            AND name = @name END

	IF @action = 'FilterByServiceAndCity'
		BEGIN select name as 'Service Provider Name',email as 'Email ID',
                            serviceName as 'Service Type',serviceDescription as 'Service Description',
                            mobile as 'Mobile Number',locality as Locality,
							city as City,zipcode as Zipcode from serviceprovider inner join users on
                            serviceprovider.userid= users.id inner join services
                            On serviceprovider.serviceid= services.id
                            where serviceid=(select id from services
                            where serviceName=@service)
                            AND city = @city END
END