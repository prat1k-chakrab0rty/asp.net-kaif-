CREATE TABLE [dbo].[users]
(
	[id] INT NOT NULL identity, 
    [name] VARCHAR(50) NOT NULL, 
    [email] VARCHAR(50) NOT NULL, 
    [mobile] BIGINT NOT NULL, 
    [address] VARCHAR(MAX) NOT NULL, 
    [zipcode] INT NOT NULL, 
    [city] VARCHAR(50) NOT NULL, 
    [locality] VARCHAR(50) NOT NULL, 
    [password] VARCHAR(50) NOT NULL, 
    [roleId] INT NOT NULL,
	PRIMARY KEY(email, roleId),
	FOREIGN KEY (roleId) REFERENCES [dbo].[roles](Id)
)
