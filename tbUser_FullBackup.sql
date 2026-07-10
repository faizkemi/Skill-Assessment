USE master;
GO

-- Variables
DECLARE @DatabaseName NVARCHAR (128) = N'YOUR DATABASE';
DECLARE @BackupFolder NVARCHAR(256) N'C:\Backups\';
DECLARE @BackupFileName NVARCHAR(512);
DECLARE @BackupSetName NVARCHAR(512);
DECLARE @Timestamp NVARCHAR(20):

-- Build a timestamp string: YYYYMMDD HHMMSS
SET @Timestamp = CONVERT (NVARCHAR(8), GETDATE(), 112)   -- YYYYMMDD
                   + '_'
                   + REPLACE (CONVERT (NVARCHAR(8), GETDATE(), 108), ':','');  -- HHMMSS

SET @BackupFileName = @Backup Folder + @DatabaseName + '_FULL_' @Timestamp + '.bak';
SET @BackupSetName = @DatabaseName + 'Full Backup' + @Timestamp;

  
-- Perform Full Backup
BACKUP DATABASE @DatabaseName
TO DISK @BackupFileName
WITH
  NAME = @BackupSetName,
  CHECKSUM,
  COMPRESSION;
GO

  
--Verify the backup (reads and validates checksums)
DECLARE @DatabaseName NVARCHAR (128) = N'YOUR DATABASE;
DECLARE @BackupFolder NVARCHAR (256) = N'C:\Backups\;
DECLARE @BackupFileName NVARCHAR(512):
DECLARE @Timestamp NVARCHAR (20);

SET @Timestamp = CONVERT (NVARCHAR(8), GETDATE(), 112)   -- YYYYMMDD
                   + '_'
                   + REPLACE (CONVERT (NVARCHAR(8), GETDATE(), 108), ':','');  -- HHMMSS

SET @BackupFileName = @Backup Folder + @DatabaseName + '_FULL_' @Timestamp + '.bak';
RESTORE VERIFYONLY
FROM DISK Backupřilellame
WITH CHECKSUM;
GO
