USE [!ESTY&TAMAR]
GO

UPDATE [dbo].[Subject]
   SET [Color] = '97ffff'
 WHERE Id%10 = 1
GO
UPDATE [dbo].[Subject]
   SET [Color] = 'f497ff'
 WHERE Id%10 = 2
GO

UPDATE [dbo].[Subject]
   SET [Color] = 'b5ff97'
 WHERE Id%10 = 3
GO

UPDATE [dbo].[Subject]
   SET [Color] = 'ffed97'
 WHERE Id%10 = 4
GO
UPDATE [dbo].[Subject]
   SET [Color] = 'f79bd6'
 WHERE Id%10 = 5
GO
UPDATE [dbo].[Subject]
   SET [Color] = 'df3030'
 WHERE Id%10 = 6
GO
UPDATE [dbo].[Subject]
   SET [Color] = 'f98760'
 WHERE Id%10 = 7
GO
UPDATE [dbo].[Subject]
   SET [Color] = 'fa1234'
 WHERE Id%10 = 8
GO
UPDATE [dbo].[Subject]
   SET [Color] = 'fe0008'
 WHERE Id%10 = 9
GO
UPDATE [dbo].[Subject]
   SET [Color] = 'ef6830'
 WHERE Id%10 = 0
GO







