CREATE TABLE [dbo].[serviceprovider]
(
	[id] INT NOT NULL UNIQUE IDENTITY, 
    [serviceId] INT FOREIGN KEY REFERENCES services(id) NOT NULL, 
    [userId] INT FOREIGN KEY REFERENCES users(id) NOT NULL, 
    [status] CHAR NOT NULL, 
    [rating] FLOAT NOT NULL,
	PRIMARY KEY (serviceId, userId)
	
)
