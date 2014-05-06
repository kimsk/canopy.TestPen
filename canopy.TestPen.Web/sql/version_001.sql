USE [CanopyTestPen]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Runs
CREATE TABLE [dbo].[Runs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Runs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO

--Pages
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RunId] [int] NOT NULL,
	[Area] [nvarchar](max) NOT NULL,
	[Section] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

--Cases
CREATE TABLE [dbo].[Cases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RunId] [int] NOT NULL,
	[PageId] [int] NOT NULL,
	[Feature] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Criticality] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

--Scenarios
CREATE TABLE [dbo].[Scenarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RunId] [int] NOT NULL,
	[CaseId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Criticality] [nvarchar](max) NOT NULL,
	[TestType] [nvarchar](max) NOT NULL,
	[TestExecutionType] [nvarchar](max) NOT NULL,
	[TestStatus] [nvarchar](max) NOT NULL,
	[Configuration] [int] NOT NULL,
	[Code] [bit] NOT NULL,
	[Comment] [nvarchar](max) NULL
 CONSTRAINT [PK_Scenarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
