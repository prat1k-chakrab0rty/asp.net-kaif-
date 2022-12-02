CREATE PROCEDURE [dbo].[manageServices_ServPro]
	@serviceProviderId int
AS BEGIN 

	select serviceName as 'Service Name', serviceDescription as Description, servProStatus as Status, rating as Rating
from serviceprovider inner join services on serviceprovider.serviceId = services.id
where serviceprovider.id = @serviceProviderId

END
	
