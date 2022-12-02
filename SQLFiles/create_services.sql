CREATE TABLE [dbo].[services]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY,
	[name] VARCHAR(50) NOT NULL,
	[description] VARCHAR(MAX) NOT NULL,
	[status] CHAR NOT NULL
)
