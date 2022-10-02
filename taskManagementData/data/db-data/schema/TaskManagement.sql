USE [master]
GO

/****** Object:  Database [TaskManagement]    Script Date: 6/8/2021 11:38:42 AM ******/
CREATE DATABASE [TaskManagement]
GO

USE [TaskManagement]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [CreateDate] [datetime]  constraint DF_Task_Inserted default getdate(),
    [RequiredByDate] [datetime]  NULL,
    [TaskDescription] [varchar](8000)  NULL,
    [TaskStatus] [varchar](20)  NULL,
    [TaskType] [varchar](20)  NULL,
    [AssignedUser] [varchar](30)  NULL,
    [NextActionDate] [datetime]  NULL,

    CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [TaskId] [int]  NOT NULL,
    [DateAdded] [datetime]  constraint DF_Comment_Inserted default getdate(),
    [CommentText] [varchar](8000)  NULL,
    [CommentType] [varchar](20)  NULL,
    [ReminderDate] [datetime]  NULL,

    CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [UserCode] [varchar](30)  NULL,
    [UserName] [varchar](30)  NULL,

    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED
(
[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

GO

