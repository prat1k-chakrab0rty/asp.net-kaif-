CREATE TABLE [dbo].[bookings]
(
	[bookingId] INT NOT NULL IDENTITY, 
    [dateTime] DATETIME NOT NULL, 
    [serviceId] INT FOREIGN KEY REFERENCES services(id) NOT NULL, 
    [userId] INT FOREIGN KEY REFERENCES users(id) NOT NULL, 
    [serviceProviderId] INT FOREIGN KEY REFERENCES serviceprovider(id) NOT NULL, 
    [description] VARCHAR(MAX) NOT NULL, 
    [status] CHAR NOT NULL, 
    [rating] INT NULL,
	PRIMARY KEY (dateTime, bookingId)
)
