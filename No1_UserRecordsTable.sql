Create TABLE tbUser (
  UserID BIGINT NOT NULL IDENTITY(0,1),
  UserName VARCHAR(20) NOT NULL,
  UserNo INT NOT NULL,
  CreateDate DATETIME NOT NULL DEFAULT GETDATE90,
  CONSTRAINT PK_tbUser PRIMARY KEY (UserID)
);
GO


CREATE PROCEDURE usp_tbUser_Select
  @UserID BIGINT = NULL
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    UserID,
    UserName,
    UserNo,
    CreateDate
  FROM tbUser
  WHERE (UserID IS NULL OR UserID = @UserID);
END;
GO


CREATE PROCEDURE usp_tbUser_Insert
  @UserName VARCHAR(20),
  @USerNo INT
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO tbUser (UserName, UserNo, CreateDate)
  VALUES (@UserName, @UserNo, GETDATE());

  SELECT SCOPE_IDENTITY() as NewUserID;
END;
GO


CREATE PROCEDURE usp_tbUser_Update
  @UserID BIGINT,
  @UserName VARCHAR(20),
  @UserNo INT
AS
BEGIN
 SET NOCOUNT ON;

 UPDATE tbUser
 SET
   UserName = @UserName
   UserNo = @UserNo
 WHERE UserID = @UserID;
END;
GO


CREATE PROCEDURE usp_tbUser_Delete
  @UserID BIGINT
AS
BEGIN
  SET NO COUNT ON;

  DELETE FROM tbUser
  WHERE UserID = @UserID;
END;
GO
