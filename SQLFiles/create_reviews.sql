CREATE TABLE [dbo].[Table]
(
	[bookingId] INT NOT NULL PRIMARY KEY foreign key references bookings(bookingId), 
    [seekerRating] INT NOT NULL, 
    [seekerReview] VARCHAR(MAX) NULL, 
    [providerRating] INT NOT NULL, 
    [providerReview] VARCHAR(MAX) NULL,

)
