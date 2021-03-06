use master
go

CREATE DATABASE ServicePoint
ON  PRIMARY 
( NAME = N'ServicePoint', FILENAME = N'c:\_sql_data\ServicePoint.mdf' , SIZE = 100MB , MAXSIZE = UNLIMITED, FILEGROWTH = 10MB )
 LOG ON 
( NAME = N'ServicePoint_log', FILENAME = N'c:\_sql_data\ServicePoint_log.ldf' , SIZE = 50MB , MAXSIZE = 2048GB , FILEGROWTH = 10MB )
GO

USE [ServicePoint]
GO
CREATE TABLE [dbo].[CurrentExecution](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[GUID] [uniqueidentifier] NULL,
	[session_id] [int] NULL,
	[status] [nvarchar](60) NULL,
	[db_name] [nvarchar](128) NULL,
	[object_name] [nvarchar](128) NULL,
	[command] [nvarchar](32) NULL,
	[cpu_time] [int] NULL,
	[total_elapsed_time] [int] NULL,
	[logical_reads] [bigint] NULL,
	[reads] [bigint] NULL,
	[writes] [bigint] NULL,
	[blocking_session_id] [smallint] NULL,
	[wait_type] [nvarchar](120) NULL,
	[wait_time] [int] NULL,
	[wait_resource] [nvarchar](512) NULL,
	[t_i_level] [smallint] NULL,
	[row_count] [bigint] NULL,
	[percent_complete] [numeric](5, 2) NULL,
	[query_text] [nvarchar](max) NULL,
	[full_query_text] [nvarchar](max) NULL,
	[user_objects_alloc_page_count] [bigint] NULL,
	[user_objects_dealloc_page_count] [bigint] NULL,
	[login_name] [nvarchar](128) NULL,
	[original_login_name] [nvarchar](128) NULL,
	[login_time] [datetime] NULL,
	[host_name] [nvarchar](128) NULL,
	[program_name] [nvarchar](128) NULL,
	[client_interface_name] [nvarchar](32) NULL,
	[nt_domain] [nvarchar](128) NULL,
	[nt_user_name] [nvarchar](128) NULL,
	[session_cpu_time] [int] NULL,
	[session_memory_usage] [int] NULL,
	[session_logical_reads] [bigint] NULL,
	[session_physical_reads] [bigint] NULL,
	[session_writes] [bigint] NULL,
	[lock_timeout] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [CI_CurrentExecution_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_CurrentExecution_RegDate_ServerNum] ON [dbo].[CurrentExecution]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_PCID]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_PCID](
	[NUM] [int] NULL,
	[P_Code] [nvarchar](5) NULL,
	[C_Code] [nvarchar](5) NULL,
	[R_Code] [nvarchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CI_F_PCID]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_F_PCID] ON [dbo].[F_PCID]
(
	[NUM] ASC,
	[P_Code] ASC,
	[C_Code] ASC,
	[R_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAlertOptions]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlertOptions](
	[CompanyNum] [int] NULL,
	[PushInterval] [int] NULL,
	[PushMaxOccurs] [int] NULL,
	[PushResetInterval] [int] NULL,
	[UsePushAlert] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbAlertOptions_CompanyNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbAlertOptions_CompanyNum] ON [dbo].[tbAlertOptions]
(
	[CompanyNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAlertRules]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlertRules](
	[ServerType] [nvarchar](30) NULL,
	[ReasonCode] [nvarchar](5) NOT NULL,
	[PCID] [nvarchar](5) NOT NULL,
	[Threshold] [float] NULL,
	[TOperator] [int] NULL,
	[ReasonCodeDesc] [nvarchar](250) NULL,
	[InstanceName] [nvarchar](200) NULL,
	[Duration] [int] NULL,
	[HasReference] [bit] NULL,
	[RecordApps] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[AlertLevel] [nvarchar](12) NULL,
	[RefDescription] [nvarchar](64) NULL,
	[ReqActionCode] [nvarchar](5) NULL,
	[RegionCode] [nvarchar](10) NULL,
	[MobileAlert] [nvarchar](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CI_tbAlertRules_ReasonCode_PCID]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbAlertRules_ReasonCode_PCID] ON [dbo].[tbAlertRules]
(
	[ReasonCode] ASC,
	[PCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAlertRules_Server]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlertRules_Server](
	[Num] [int] IDENTITY(1,1) NOT NULL,
	[ServerNum] [int] NULL,
	[ServerType] [nvarchar](30) NULL,
	[ReasonCode] [nvarchar](5) NULL,
	[PCID] [nvarchar](5) NULL,
	[Threshold] [float] NULL,
	[TOperator] [int] NULL,
	[ReasonCodeDesc] [nvarchar](250) NULL,
	[InstanceName] [nvarchar](200) NULL,
	[Duration] [int] NULL,
	[HasReference] [bit] NULL,
	[RecordApps] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[AlertLevel] [nvarchar](12) NULL,
	[RefDescription] [nvarchar](64) NULL,
	[ReqActionCode] [nvarchar](5) NULL,
	[MobileAlert] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbAlerts]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlerts](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[ReasonCode] [nvarchar](5) NULL,
	[InstanceName] [nvarchar](200) NULL,
	[PValue] [float] NULL,
	[AlertStatus] [int] NULL,
	[AlertDescription] [nvarchar](250) NULL,
	[AlertRecordID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbAlerts_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbAlerts_RegDate_ServerNum] ON [dbo].[tbAlerts]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAlerts_Info]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlerts_Info](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[ReasonCode] [nvarchar](5) NULL,
	[InstanceName] [nvarchar](200) NULL,
	[PValue] [float] NULL,
	[AlertStatus] [int] NULL,
	[AlertDescription] [nvarchar](250) NULL,
	[AlertRecordID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbAlerts_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbAlerts_RegDate_ServerNum] ON [dbo].[tbAlerts_Info]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAppTrace]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAppTrace](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[AlertRecordID] [uniqueidentifier] NULL,
	[ReasonCode] [nvarchar](5) NULL,
	[URI] [nvarchar](128) NULL,
	[ClientLocation] [nvarchar](64) NULL,
	[RunningTime] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbAppTrace_RegDate]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbAppTrace_RegDate] ON [dbo].[tbAppTrace]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbBlock]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbBlock](
	[RegDate] [datetime] NULL,
	[Timein] [datetime] NULL,
	[ServerNum] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[LAST_BATCH] [datetime] NULL,
	[SPID] [int] NULL,
	[Blocked_SPID] [int] NULL,
	[WAITTIME] [bigint] NULL,
	[WAITTYPE] [binary](1) NULL,
	[LASTWAITTYPE] [nvarchar](64) NULL,
	[STATUS] [nvarchar](60) NULL,
	[LOGINAME] [nvarchar](128) NULL,
	[Query_Text] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [CI_tbBlock_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbBlock_ServerNum] ON [dbo].[tbBlock]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDashboard]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDashboard](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[P0] [float] NULL,
	[P1] [float] NULL,
	[P2] [float] NULL,
	[P3] [float] NULL,
	[P4] [float] NULL,
	[P5] [float] NULL,
	[P6] [float] NULL,
	[P7] [float] NULL,
	[P8] [float] NULL,
	[P9] [float] NULL,
	[P10] [float] NULL,
	[P11] [float] NULL,
	[P12] [float] NULL,
	[P13] [float] NULL,
	[P14] [float] NULL,
	[P15] [float] NULL,
	[P16] [float] NULL,
	[P17] [float] NULL,
	[P18] [float] NULL,
	[P19] [float] NULL,
	[P20] [float] NULL,
	[P21] [float] NULL,
	[P22] [float] NULL,
	[P23] [float] NULL,
	[P24] [float] NULL,
	[P25] [float] NULL,
	[P26] [float] NULL,
	[P27] [float] NULL,
	[P28] [float] NULL,
	[P29] [float] NULL,
	[P30] [float] NULL,
	[P31] [float] NULL,
	[P32] [float] NULL,
	[P33] [float] NULL,
	[P34] [float] NULL,
	[P35] [float] NULL,
	[P36] [float] NULL,
	[P37] [float] NULL,
	[P38] [float] NULL,
	[P39] [float] NULL,
	[P40] [float] NULL,
	[P41] [float] NULL,
	[P42] [float] NULL,
	[P43] [float] NULL,
	[P44] [float] NULL,
	[P45] [float] NULL,
	[P46] [float] NULL,
	[P47] [float] NULL,
	[P48] [float] NULL,
	[P49] [float] NULL,
	[P50] [float] NULL,
	[P51] [float] NULL,
	[P52] [float] NULL,
	[P53] [float] NULL,
	[P54] [float] NULL,
	[P55] [float] NULL,
	[P56] [float] NULL,
	[P57] [float] NULL,
	[P58] [float] NULL,
	[P59] [float] NULL,
	[P60] [float] NULL,
	[P61] [float] NULL,
	[P62] [float] NULL,
	[P63] [float] NULL,
	[P64] [float] NULL,
	[P65] [float] NULL,
	[P66] [float] NULL,
	[P67] [float] NULL,
	[P68] [float] NULL,
	[P69] [float] NULL,
	[P70] [float] NULL,
	[P71] [float] NULL,
	[P72] [float] NULL,
	[P73] [float] NULL,
	[P74] [float] NULL,
	[P75] [float] NULL,
	[P76] [float] NULL,
	[P77] [float] NULL,
	[P78] [float] NULL,
	[P79] [float] NULL,
	[P80] [float] NULL,
	[P81] [float] NULL,
	[P82] [float] NULL,
	[P83] [float] NULL,
	[P84] [float] NULL,
	[P85] [float] NULL,
	[P86] [float] NULL,
	[P87] [float] NULL,
	[P88] [float] NULL,
	[P89] [float] NULL,
	[P90] [float] NULL,
	[P91] [float] NULL,
	[P92] [float] NULL,
	[P93] [float] NULL,
	[P94] [float] NULL,
	[P95] [float] NULL,
	[P96] [float] NULL,
	[P97] [float] NULL,
	[P98] [float] NULL,
	[P99] [float] NULL,
	[P100] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbDashboard_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbDashboard_RegDate_ServerNum] ON [dbo].[tbDashboard]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDatabase]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDatabase](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[database_name] [nvarchar](256) NULL,
	[create_date] [datetime] NULL,
	[compatibility_level] [int] NULL,
	[collation_name] [nvarchar](256) NULL,
	[user_access_desc] [nvarchar](120) NULL,
	[is_read_only] [int] NULL,
	[is_auto_shrink_on] [int] NULL,
	[state_desc] [nvarchar](120) NULL,
	[is_in_standby] [int] NULL,
	[snapshot_isolation_state_desc] [nvarchar](120) NULL,
	[is_read_committed_snapshot_on] [int] NULL,
	[recovery_model_desc] [nvarchar](120) NULL,
	[page_verify_option_desc] [nvarchar](120) NULL,
	[is_auto_create_stats_on] [int] NULL,
	[is_auto_update_stats_on] [int] NULL,
	[is_auto_update_stats_async_on] [int] NULL,
	[is_fulltext_enabled] [int] NULL,
	[is_trustworthy_on] [int] NULL,
	[is_parameterization_forced] [int] NULL,
	[is_db_chaining_on] [int] NULL,
	[is_broker_enabled] [int] NULL,
	[is_published] [int] NULL,
	[is_subscribed] [int] NULL,
	[is_merge_published] [int] NULL,
	[is_distributor] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbDatabase_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbDatabase_RegDate_ServerNum] ON [dbo].[tbDatabase]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDataBaseFileSize]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDataBaseFileSize](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[Total_Databases_Size_MB] [float] NULL,
	[Datafile_Size_MB] [float] NULL,
	[Reserved_MB] [float] NULL,
	[Reserved_Percent] [float] NULL,
	[Unallocated_Space_MB] [float] NULL,
	[Unallocated_Percent] [float] NULL,
	[Data_MB] [float] NULL,
	[Data_Percent] [float] NULL,
	[Index_MB] [float] NULL,
	[Index_Percent] [float] NULL,
	[Unused_MB] [float] NULL,
	[Unused_Percent] [float] NULL,
	[Transaction_Log_Size] [float] NULL,
	[Log_Size_MB] [float] NULL,
	[Log_Used_Size_MB] [float] NULL,
	[Log_Used_Size_Percent] [float] NULL,
	[Log_Unused_Size_MB] [float] NULL,
	[Log_UnUsed_Size_Percent] [float] NULL,
	[Avg_vlf_Size] [float] NULL,
	[Total_vlf_cnt] [int] NULL,
	[Active_vlf_cnt] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbDataBaseFileSize_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbDataBaseFileSize_RegDate_ServerNum] ON [dbo].[tbDataBaseFileSize]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDisk]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDisk](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[InstanceName] [nvarchar](50) NULL,
	[P195] [float] NULL,
	[P015] [float] NULL,
	[P196] [float] NULL,
	[P164] [float] NULL,
	[P190] [float] NULL,
	[P191] [float] NULL,
	[P192] [float] NULL,
	[P193] [float] NULL,
	[P017] [float] NULL,
	[P197] [float] NULL,
	[P016] [float] NULL,
	[P206] [float] NULL,
	[P207] [float] NULL,
	[P198] [float] NULL,
	[P194] [float] NULL,
	[P208] [float] NULL,
	[P209] [float] NULL,
	[P210] [float] NULL,
	[P211] [float] NULL,
	[P212] [float] NULL,
	[P213] [float] NULL,
	[P018] [float] NULL,
	[P214] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbDisk_RegDate]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbDisk_RegDate] ON [dbo].[tbDisk]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbHostStatus]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHostStatus](
	[ServerNum] [int] NULL,
	[HostName] [nvarchar](64) NULL,
	[CurrentStatus] [int] NULL,
	[RegDate] [datetime] NULL,
	[ServerType] [nvarchar](30) NULL,
	[LastUpdateDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[DisplayName] [nvarchar](50) NULL,
	[RAMSize] [bigint] NULL,
	[DisplayGroup] [nvarchar](30) NULL,
	[WinVer] [nvarchar](50) NULL,
	[Processors] [int] NULL,
	[IPAddress] [nvarchar](128) NULL,
	[AgentVer] [nvarchar](50) NULL,
	[CompanyNum] [int] NULL,
	[LicenseKey] [nvarchar](64) NULL,
	[RegionCode] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbHostStatus_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbHostStatus_ServerNum_TimeIn] ON [dbo].[tbHostStatus]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbIISLog]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbIISLog](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[HostHeader] [nvarchar](128) NULL,
	[SiteName] [nvarchar](64) NULL,
	[URI] [nvarchar](128) NULL,
	[Hits] [int] NULL,
	[MaxTimeTaken] [int] NULL,
	[AvgTimeTaken] [int] NULL,
	[SCBytes] [real] NULL,
	[CSBytes] [real] NULL,
	[StatusCode] [int] NULL,
	[Win32StatusCode] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbIISLog_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbIISLog_RegDate_ServerNum] ON [dbo].[tbIISLog]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbIndexDuplication]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbIndexDuplication](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[DatabaseName] [nvarchar](100) NULL,
	[ObjectName] [nvarchar](255) NULL,
	[IndexName] [nvarchar](255) NULL,
	[DuplicationIndexName] [nvarchar](255) NULL,
	[is_primary_key] [int] NULL,
	[is_unique] [int] NULL,
	[type] [nvarchar](100) NULL,
	[IndexColumns] [nvarchar](2000) NULL,
	[IncludedColumns] [nvarchar](2000) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbIndexDuplication_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbIndexDuplication_RegDate_ServerNum] ON [dbo].[tbIndexDuplication]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMember]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMember](
	[MemberNum] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[UserPWD] [nvarchar](100) NULL,
	[Name] [nvarchar](50) NULL,
	[RegDate] [datetime] NULL,
	[HP] [nvarchar](40) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CompanyNum] [int] NULL,
	[Grade] [int] NULL,
	[UUID] [nvarchar](128) NULL,
	[RegistrationID] [nvarchar](255) NULL,
	[PushCreatedDate] [datetime] NULL,
	[PushUpdatedDate] [datetime] NULL,
	[Activated] [tinyint] NULL,
	[DeviceKind] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbMember_Master_MemberNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbMember_Master_MemberNum] ON [dbo].[tbMember]
(
	[MemberNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbObjectCheck]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbObjectCheck](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[db_name] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[parent_object_name] [varchar](255) NULL,
	[type_desc] [varchar](255) NULL,
	[create_date] [datetime] NULL,
	[modify_date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbObjectCheck_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbObjectCheck_RegDate_ServerNum] ON [dbo].[tbObjectCheck]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPCID]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPCID](
	[PCID] [nvarchar](5) NULL,
	[ServerType] [nvarchar](30) NOT NULL,
	[PObjectName] [nvarchar](50) NOT NULL,
	[PCounterName] [nvarchar](50) NOT NULL,
	[HasInstance] [bit] NULL,
	[ValueDescription] [nvarchar](64) NULL,
	[RValueDescription] [nvarchar](64) NULL,
 CONSTRAINT [PK_PObjectName_PCounterName] PRIMARY KEY NONCLUSTERED 
(
	[PObjectName] ASC,
	[PCounterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbPCID_Server]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPCID_Server](
	[Num] [int] IDENTITY(1,1) NOT NULL,
	[ServerNum] [int] NOT NULL,
	[PCID] [nvarchar](5) NOT NULL,
	[ServerType] [nvarchar](30) NOT NULL,
	[PObjectName] [nvarchar](50) NOT NULL,
	[PCounterName] [nvarchar](50) NOT NULL,
	[HasInstance] [bit] NULL,
	[ValueDescription] [nvarchar](64) NULL,
	[RValueDescription] [nvarchar](64) NULL,
	[used] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbPerfmonValues]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPerfmonValues](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[PCID] [nvarchar](5) NULL,
	[PValue] [float] NULL,
	[RValue] [nvarchar](64) NULL,
	[InstanceName] [nvarchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbPerfmonValues_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbPerfmonValues_RegDate_ServerNum] ON [dbo].[tbPerfmonValues]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPerfmonValues_CPU]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPerfmonValues_CPU](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[PCID] [nvarchar](5) NULL,
	[PValue] [float] NULL,
	[RValue] [nvarchar](64) NULL,
	[InstanceName] [nvarchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbPerfmonValues_CPU_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbPerfmonValues_CPU_RegDate_ServerNum] ON [dbo].[tbPerfmonValues_CPU]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPerfmonValues_Memory]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPerfmonValues_Memory](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[PCID] [nvarchar](5) NULL,
	[PValue] [float] NULL,
	[RValue] [nvarchar](64) NULL,
	[InstanceName] [nvarchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbPerfmonValues_Memory_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbPerfmonValues_Memory_RegDate_ServerNum] ON [dbo].[tbPerfmonValues_Memory]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPInstance]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPInstance](
	[PCID] [nvarchar](5) NOT NULL,
	[InstanceName] [nvarchar](200) NOT NULL,
	[IfContains] [bit] NULL,
 CONSTRAINT [PK_PCID_InstanceName] PRIMARY KEY NONCLUSTERED 
(
	[PCID] ASC,
	[InstanceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CI_tbPInstance_PCID]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbPInstance_PCID] ON [dbo].[tbPInstance]
(
	[PCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPInstance_Server]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPInstance_Server](
	[Num] [int] IDENTITY(1,1) NOT NULL,
	[ServerNum] [int] NULL,
	[PCID] [nvarchar](5) NULL,
	[InstanceName] [nvarchar](200) NULL,
	[IfContains] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CI_tbPInstance_Server_Server_Num_ServerNum_PCID]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbPInstance_Server_Server_Num_ServerNum_PCID] ON [dbo].[tbPInstance_Server]
(
	[Num] ASC,
	[ServerNum] ASC,
	[PCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbQueryDefinition]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbQueryDefinition](
	[QueryID] [int] NULL,
	[Interval] [int] NULL,
	[DestinationTable] [nvarchar](50) NULL,
	[Query] [nvarchar](max) NULL,
	[Enabled] [bit] NULL,
	[QueryDescription] [nvarchar](128) NULL,
	[SPName] [nvarchar](1000) NULL,
	[OccursTime] [nvarchar](10) NULL,
	[IsProcedure] [nvarchar](5) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbQueryDefinition_Server]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbQueryDefinition_Server](
	[ServerNum] [int] NULL,
	[QueryID] [int] NULL,
	[Interval] [int] NULL,
	[DestinationTable] [nvarchar](50) NULL,
	[Query] [nvarchar](max) NULL,
	[Enabled] [bit] NULL,
	[QueryDescription] [nvarchar](128) NULL,
	[SPName] [nvarchar](1000) NULL,
	[OccursTime] [nvarchar](10) NULL,
	[IsProcedure] [nvarchar](5) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [CI_tbQueryDefinition_Server_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbQueryDefinition_Server_ServerNum] ON [dbo].[tbQueryDefinition_Server]
(
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRequestStatus]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRequestStatus](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[HostHeader] [nvarchar](128) NULL,
	[SiteName] [nvarchar](64) NULL,
	[ValueDescription] [nvarchar](64) NULL,
	[TotalNumber] [real] NULL,
	[LogValue] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [CI_tbRequestStatus_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbRequestStatus_RegDate_ServerNum] ON [dbo].[tbRequestStatus]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbServers_Member]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbServers_Member](
	[Num] [int] IDENTITY(1,1) NOT NULL,
	[CompanyNum] [int] NULL,
	[MemberNum] [int] NULL,
	[ServerNum] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbServers_Member_Num_CompanyNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbServers_Member_Num_CompanyNum] ON [dbo].[tbServers_Member]
(
	[Num] ASC,
	[CompanyNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbServiceStatus]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbServiceStatus](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[HostHeader] [nvarchar](128) NULL,
	[SiteName] [nvarchar](64) NULL,
	[TotalHits] [int] NULL,
	[TotalSCBytes] [real] NULL,
	[TotalCSBytes] [real] NULL,
	[TotalCIP] [int] NULL,
	[TotalErrors] [int] NULL,
	[AnalyzedLogTime] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbServiceStatus_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbServiceStatus_RegDate_ServerNum] ON [dbo].[tbServiceStatus]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLAgentErrorlog]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLAgentErrorlog](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[LogDate] [datetime] NULL,
	[ProcessInfo] [nvarchar](100) NULL,
	[ErrorText] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLAgentErrorlog_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLAgentErrorlog_RegDate_ServerNum] ON [dbo].[tbSQLAgentErrorlog]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLAgentFail]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLAgentFail](
	[RegDate] [datetime] NOT NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NOT NULL,
	[JOB_NAME] [sysname] NOT NULL,
	[RUN_REQUESTED_DATE] [datetime] NULL,
	[LAST_EXECUTED_STEP_ID] [int] NULL,
	[JOB_HISTORY_ID] [int] NULL,
	[MESSAGE] [nvarchar](4000) NULL,
	[STEP_NAME] [sysname] NOT NULL,
	[COMMAND] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLAgentFail_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLAgentFail_RegDate_ServerNum] ON [dbo].[tbSQLAgentFail]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLAgentStatus]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLAgentStatus](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NOT NULL,
	[JOB_NAME] [sysname] NOT NULL,
	[enabled] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLAgentStatus_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLAgentStatus_RegDate_ServerNum] ON [dbo].[tbSQLAgentStatus]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLConfiguration]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLConfiguration](
	[name] [nvarchar](35) NOT NULL,
	[value] [sql_variant] NULL,
	[minimum] [sql_variant] NULL,
	[maximum] [sql_variant] NULL,
	[value_in_use] [sql_variant] NULL,
	[description] [nvarchar](255) NOT NULL,
	[is_dynamic] [bit] NOT NULL,
	[is_advanced] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CI_tbSQLconfiguration_name]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLconfiguration_name] ON [dbo].[tbSQLConfiguration]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLConfiguration_Server]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLConfiguration_Server](
	[ServerNum] [int] NULL,
	[Name] [nvarchar](35) NULL,
	[Value] [sql_variant] NULL,
	[Minimum] [sql_variant] NULL,
	[Maximum] [sql_variant] NULL,
	[Value_in_use] [sql_variant] NULL,
	[description] [nvarchar](255) NULL,
	[is_dynamic] [bit] NULL,
	[is_advanced] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSQLErrorlog]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLErrorlog](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[LogDate] [datetime] NULL,
	[ProcessInfo] [nvarchar](100) NULL,
	[ErrorText] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLErrorlog_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLErrorlog_RegDate_ServerNum] ON [dbo].[tbSQLErrorlog]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLIndexFlagment]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLIndexFlagment](
	[RegDate] [datetime] NOT NULL,
	[TimeIn] [datetime] NOT NULL,
	[ServerNum] [int] NOT NULL,
	[db_name] [nvarchar](128) NULL,
	[object_name] [nvarchar](128) NULL,
	[index_name] [nvarchar](128) NULL,
	[index_type] [nvarchar](60) NULL,
	[alloc_unit_type] [nvarchar](60) NULL,
	[index_depth] [tinyint] NULL,
	[index_level] [tinyint] NULL,
	[avg_frag_percent] [numeric](5, 2) NULL,
	[fragment_count] [bigint] NULL,
	[avg_frag_size_in_page] [numeric](28, 2) NULL,
	[page_count] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLIndexFlagment_Regdate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLIndexFlagment_Regdate_ServerNum] ON [dbo].[tbSQLIndexFlagment]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLLinkedCheck]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLLinkedCheck](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[LinkedName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLLinkedCheck_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLLinkedCheck_RegDate_ServerNum] ON [dbo].[tbSQLLinkedCheck]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLLock]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLLock](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[InstanceName] [nvarchar](50) NULL,
	[P129] [float] NULL,
	[P130] [float] NULL,
	[P131] [float] NULL,
	[P132] [float] NULL,
	[P133] [float] NULL,
	[P134] [float] NULL,
	[P199] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLLock_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLLock_RegDate_ServerNum] ON [dbo].[tbSQLLock]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLMemory]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLMemory](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[P081] [float] NULL,
	[P082] [float] NULL,
	[P083] [float] NULL,
	[P084] [float] NULL,
	[P085] [float] NULL,
	[P086] [float] NULL,
	[P087] [float] NULL,
	[P088] [float] NULL,
	[P089] [float] NULL,
	[P090] [float] NULL,
	[P092] [float] NULL,
	[P096] [float] NULL,
	[P097] [float] NULL,
	[P098] [float] NULL,
	[P099] [float] NULL,
	[P172] [float] NULL,
	[P173] [float] NULL,
	[P174] [float] NULL,
	[P175] [float] NULL,
	[P126] [float] NULL,
	[P127] [float] NULL,
	[P128] [float] NULL,
	[P167] [float] NULL,
	[P100] [float] NULL,
	[P101] [float] NULL,
	[P102] [float] NULL,
	[P103] [float] NULL,
	[P104] [float] NULL,
	[P105] [float] NULL,
	[P168] [float] NULL,
	[P176] [float] NULL,
	[P177] [float] NULL,
	[P178] [float] NULL,
	[P179] [float] NULL,
	[P180] [float] NULL,
	[P181] [float] NULL,
	[P182] [float] NULL,
	[P183] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLMemory_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLMemory_RegDate_ServerNum] ON [dbo].[tbSQLMemory]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLServerInfo]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLServerInfo](
	[ServerNum] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[MachineName] [nvarchar](128) NULL,
	[ServerName] [nvarchar](128) NULL,
	[InstanceName] [nvarchar](128) NULL,
	[IsClustered] [int] NULL,
	[ComputerNamePhysicalNetBIOS] [nvarchar](128) NULL,
	[Edition] [nvarchar](128) NULL,
	[ProductLevel] [nvarchar](128) NULL,
	[ProductVersion] [nvarchar](128) NULL,
	[ProcessID] [int] NULL,
	[Collation] [nvarchar](128) NULL,
	[IsFullTextInstalled] [int] NULL,
	[IsIntegratedSecurityOnly] [int] NULL,
	[IsHadrEnabled] [int] NULL,
	[HadrManagerStatus] [int] NULL,
	[IsXTPSupported] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLServerInfo_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLServerInfo_ServerNum] ON [dbo].[tbSQLServerInfo]
(
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLServiceStatus]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLServiceStatus](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[servicename] [nvarchar](256) NULL,
	[process_id] [int] NULL,
	[startup_type_desc] [nvarchar](256) NULL,
	[status_desc] [nvarchar](256) NULL,
	[last_startup_time] [nvarchar](30) NULL,
	[service_account] [nvarchar](256) NULL,
	[is_clustered] [nvarchar](1) NULL,
	[cluster_nodename] [nvarchar](256) NULL,
	[filename] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLServiceStatus_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLServiceStatus_RegDate_ServerNum] ON [dbo].[tbSQLServiceStatus]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLSession]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLSession](
	[RegDate] [datetime] NOT NULL,
	[TimeIn] [datetime] NOT NULL,
	[ServerNum] [int] NOT NULL,
	[Login_Name] [nvarchar](128) NOT NULL,
	[Host_Name] [nvarchar](128) NULL,
	[Client_Net_Address] [nvarchar](48) NULL,
	[TotalSession] [int] NULL,
	[ActiveSession] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLSession_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLSession_RegDate_ServerNum] ON [dbo].[tbSQLSession]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLSpace]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLSpace](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[InstanceName] [nvarchar](50) NULL,
	[P114] [float] NULL,
	[P115] [float] NULL,
	[P116] [float] NULL,
	[P117] [float] NULL,
	[P118] [float] NULL,
	[P119] [float] NULL,
	[P120] [float] NULL,
	[P121] [float] NULL,
	[P122] [float] NULL,
	[P123] [float] NULL,
	[P124] [float] NULL,
	[P125] [float] NULL,
	[P169] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLSpace_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLSpace_RegDate_ServerNum] ON [dbo].[tbSQLSpace]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSQLWait]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSQLWait](
	[RegDate] [datetime] NULL,
	[TimeIn] [datetime] NULL,
	[ServerNum] [int] NULL,
	[InstanceName] [nvarchar](50) NULL,
	[P146] [float] NULL,
	[P147] [float] NULL,
	[P148] [float] NULL,
	[P149] [float] NULL,
	[P150] [float] NULL,
	[P151] [float] NULL,
	[P185] [float] NULL,
	[P186] [float] NULL,
	[P187] [float] NULL,
	[P188] [float] NULL,
	[P189] [float] NULL,
	[P215] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbSQLWait_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbSQLWait_ServerNum] ON [dbo].[tbSQLWait]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTableSize]    Script Date: 2017-03-30 오전 10:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTableSize](
	[RegDate] [datetime] NULL,
	[Timein] [datetime] NULL,
	[ServerNum] [int] NULL,
	[DatabaseName] [nvarchar](200) NULL,
	[SchemaName] [nvarchar](200) NULL,
	[TableName] [nvarchar](200) NULL,
	[Row_Count] [bigint] NULL,
	[Reserved_KB] [bigint] NULL,
	[Data_KB] [bigint] NULL,
	[IndexSize_KB] [bigint] NULL,
	[Unused_KB] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [CI_tbTableSize_RegDate_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE CLUSTERED INDEX [CI_tbTableSize_RegDate_ServerNum] ON [dbo].[tbTableSize]
(
	[RegDate] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_CurrentExecution_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_CurrentExecution_TimeIn_ServerNum] ON [dbo].[CurrentExecution]
(
	[TimeIn] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_tbAlertRules_RegionCode_ReasonCode]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAlertRules_RegionCode_ReasonCode] ON [dbo].[tbAlertRules]
(
	[RegionCode] ASC,
	[ReasonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_tbAlertRules_Server_Num]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAlertRules_Server_Num] ON [dbo].[tbAlertRules_Server]
(
	[ServerNum] ASC,
	[ReasonCode] ASC,
	[PCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_tbAlertRules_Server_Num_ReasonCode_AlertLevel]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAlertRules_Server_Num_ReasonCode_AlertLevel] ON [dbo].[tbAlertRules_Server]
(
	[ServerNum] ASC,
	[ReasonCode] ASC,
	[AlertLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbAlerts_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAlerts_ServerNum_TimeIn] ON [dbo].[tbAlerts]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbAlerts_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAlerts_TimeIn_ServerNum] ON [dbo].[tbAlerts]
(
	[TimeIn] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbAlerts_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAlerts_ServerNum_TimeIn] ON [dbo].[tbAlerts_Info]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbAlerts_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAlerts_TimeIn_ServerNum] ON [dbo].[tbAlerts_Info]
(
	[TimeIn] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbAppTrace_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbAppTrace_ServerNum_TimeIn] ON [dbo].[tbAppTrace]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)
INCLUDE ( 	[AlertRecordID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbBlock_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbBlock_ServerNum_TimeIn] ON [dbo].[tbBlock]
(
	[ServerNum] ASC,
	[Timein] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbDashboard_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbDashboard_ServerNum_TimeIn] ON [dbo].[tbDashboard]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbDatabase_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbDatabase_ServerNum_TimeIn] ON [dbo].[tbDatabase]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbDataBaseFileSize_ServerNum_RegDate]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbDataBaseFileSize_ServerNum_RegDate] ON [dbo].[tbDataBaseFileSize]
(
	[ServerNum] ASC,
	[RegDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbDataBaseFileSize_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbDataBaseFileSize_ServerNum_TimeIn] ON [dbo].[tbDataBaseFileSize]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbDisk_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbDisk_TimeIn_ServerNum] ON [dbo].[tbDisk]
(
	[TimeIn] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbIISLog_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbIISLog_ServerNum_TimeIn] ON [dbo].[tbIISLog]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbIndexDuplication_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbIndexDuplication_ServerNum_TimeIn] ON [dbo].[tbIndexDuplication]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_tbMember_Master_Email]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbMember_Master_Email] ON [dbo].[tbMember]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_CI_tbObjectCheck_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_CI_tbObjectCheck_ServerNum_TimeIn] ON [dbo].[tbObjectCheck]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_tbPCID_Server]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbPCID_Server] ON [dbo].[tbPCID_Server]
(
	[ServerNum] ASC,
	[PCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbperfmonValues_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbperfmonValues_TimeIn_ServerNum] ON [dbo].[tbPerfmonValues]
(
	[TimeIn] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbperfmonValues_CPU_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbperfmonValues_CPU_TimeIn_ServerNum] ON [dbo].[tbPerfmonValues_CPU]
(
	[TimeIn] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbperfmonValues_Memory_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbperfmonValues_Memory_TimeIn_ServerNum] ON [dbo].[tbPerfmonValues_Memory]
(
	[TimeIn] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_tbPInstance_Server_Server_ServerNum_PCID]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbPInstance_Server_Server_ServerNum_PCID] ON [dbo].[tbPInstance_Server]
(
	[ServerNum] ASC,
	[PCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbRequestStatus_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbRequestStatus_TimeIn_ServerNum] ON [dbo].[tbRequestStatus]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbServers_Member_CompanyNum_MemberNum_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbServers_Member_CompanyNum_MemberNum_ServerNum] ON [dbo].[tbServers_Member]
(
	[CompanyNum] ASC,
	[MemberNum] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbServers_Member_MemberNum_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbServers_Member_MemberNum_ServerNum] ON [dbo].[tbServers_Member]
(
	[MemberNum] ASC,
	[ServerNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbServiceStatus_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbServiceStatus_TimeIn_ServerNum] ON [dbo].[tbServiceStatus]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLAgentErrorlog_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLAgentErrorlog_ServerNum_TimeIn] ON [dbo].[tbSQLAgentErrorlog]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLAgentFail_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLAgentFail_ServerNum_TimeIn] ON [dbo].[tbSQLAgentFail]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLAgentStatus_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLAgentStatus_ServerNum_TimeIn] ON [dbo].[tbSQLAgentStatus]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLErrorlog_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLErrorlog_ServerNum_TimeIn] ON [dbo].[tbSQLErrorlog]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLIndexFlagment_TimeIn_ServerNum]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLIndexFlagment_TimeIn_ServerNum] ON [dbo].[tbSQLIndexFlagment]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLLinkedCheck_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLLinkedCheck_ServerNum_TimeIn] ON [dbo].[tbSQLLinkedCheck]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLLock_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLLock_ServerNum_TimeIn] ON [dbo].[tbSQLLock]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLMemory_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLMemory_ServerNum_TimeIn] ON [dbo].[tbSQLMemory]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLServiceStatus_ServerNum_RegDate]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLServiceStatus_ServerNum_RegDate] ON [dbo].[tbSQLServiceStatus]
(
	[ServerNum] ASC,
	[RegDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLServiceStatus_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLServiceStatus_ServerNum_TimeIn] ON [dbo].[tbSQLServiceStatus]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLSession_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLSession_ServerNum_TimeIn] ON [dbo].[tbSQLSession]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLSpace_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLSpace_ServerNum_TimeIn] ON [dbo].[tbSQLSpace]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbSQLWait_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbSQLWait_ServerNum_TimeIn] ON [dbo].[tbSQLWait]
(
	[ServerNum] ASC,
	[TimeIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_tbTableSize_ServerNum_TimeIn]    Script Date: 2017-03-30 오전 10:08:17 ******/
CREATE NONCLUSTERED INDEX [NCI_tbTableSize_ServerNum_TimeIn] ON [dbo].[tbTableSize]
(
	[ServerNum] ASC,
	[Timein] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [ServicePoint]
GO
/****** Object:  StoredProcedure [dbo].[p_SQLServerInfo_Update]    Script Date: 2017-03-30 오전 10:09:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[p_SQLServerInfo_Update]
@RegDate datetime,
@TimeIn datetime,
@ServerNum int,
@MachineName nvarchar(128),
@ServerName nvarchar(128),
@InstanceName nvarchar(128),
@IsClustered int,
@ComputerNamePhysicalNetBIOS nvarchar(128),
@Edition nvarchar(128),
@ProductLevel nvarchar(128),
@ProductVersion	nvarchar(128),
@ProcessID int,
@Collation nvarchar(128),
@IsFullTextInstalled int,
@IsIntegratedSecurityOnly int,
@IsHadrEnabled int,
@HadrManagerStatus int,
@IsXTPSupported int

as

set nocount on
set transaction isolation level read uncommitted 

update tbSQLServerInfo set
	LastUpdateDate = @RegDate,
	MachineName = @MachineName,
	ServerName = @ServerName,
	InstanceName = @InstanceName,
	IsClustered = @IsClustered,
	ComputerNamePhysicalNetBIOS = @ComputerNamePhysicalNetBIOS,
	Edition = @Edition,
	ProductLevel = @ProductLevel,
	ProductVersion = @ProductVersion,
	ProcessID = @ProcessID,
	Collation = @Collation,
	IsFullTextInstalled = @IsFullTextInstalled,
	IsIntegratedSecurityOnly = @IsIntegratedSecurityOnly,
	IsHadrEnabled = @IsHadrEnabled,
	HadrManagerStatus = @HadrManagerStatus,
	IsXTPSupported = @IsXTPSupported
where ServerNum = @ServerNum

if @@ROWCOUNT = 0
begin
	insert into tbSQLServerInfo (
	ServerNum,
LastUpdateDate,
MachineName,
ServerName,
InstanceName,
IsClustered,
ComputerNamePhysicalNetBIOS,
Edition,
ProductLevel,
ProductVersion,
ProcessID,
Collation,
IsFullTextInstalled,
IsIntegratedSecurityOnly,
IsHadrEnabled,
HadrManagerStatus,
IsXTPSupported)
values (
@ServerNum,
@RegDate,
@MachineName,
@ServerName,
@InstanceName,
@IsClustered,
@ComputerNamePhysicalNetBIOS,
@Edition,
@ProductLevel,
@ProductVersion,
@ProcessID,
@Collation,
@IsFullTextInstalled,
@IsIntegratedSecurityOnly,
@IsHadrEnabled,
@HadrManagerStatus,
@IsXTPSupported
)
end
GO

CREATE procedure [dbo].[p_tbSQLConfiguration_Add]
@RegDate datetime,
@TimeIn datetime,
@ServerNum int,
@Name nvarchar(35), 
@Value int, 
@Minimum int, 
@Maximum int, 
@Value_in_use int,
@is_dynamic bit,
@is_advanced bit

as

set nocount on
set transaction isolation level read uncommitted

update tbSQLConfiguration_Server set
	ServerNum = @ServerNum,
	Name = @Name,
	Value = @Value,
	Minimum = @Minimum,
	Maximum = @Maximum,
	Value_in_use = @Value_in_use,
	is_dynamic = @is_dynamic,
	is_advanced = @is_advanced
where ServerNum = @ServerNum
	and Name = @Name

if @@ROWCOUNT = 0
begin
	insert into tbSQLConfiguration_Server (ServerNum, Name, Value, Minimum, Maximum, Value_in_use, description, is_dynamic, is_advanced)
	select @ServerNum, Name, Value, Minimum, Maximum, Value_in_use, description, is_dynamic, is_advanced from tbSQLConfiguration
end

GO

INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1, N'P001', N'C001', N'R001')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2, N'P002', N'C002', N'R002')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3, N'P003', N'C003', N'R003')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4, N'P004', N'C004', N'R004')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (5, N'P005', N'C005', N'R005')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (6, N'P006', N'C006', N'R006')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (7, N'P007', N'C007', N'R007')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (8, N'P008', N'C008', N'R008')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (9, N'P009', N'C009', N'R009')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (10, N'P010', N'C010', N'R010')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (11, N'P011', N'C011', N'R011')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (12, N'P012', N'C012', N'R012')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (13, N'P013', N'C013', N'R013')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (14, N'P014', N'C014', N'R014')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (15, N'P015', N'C015', N'R015')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (16, N'P016', N'C016', N'R016')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (17, N'P017', N'C017', N'R017')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (18, N'P018', N'C018', N'R018')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (19, N'P019', N'C019', N'R019')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (20, N'P020', N'C020', N'R020')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (21, N'P021', N'C021', N'R021')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (22, N'P022', N'C022', N'R022')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (23, N'P023', N'C023', N'R023')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (24, N'P024', N'C024', N'R024')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (25, N'P025', N'C025', N'R025')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (26, N'P026', N'C026', N'R026')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (27, N'P027', N'C027', N'R027')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (28, N'P028', N'C028', N'R028')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (29, N'P029', N'C029', N'R029')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (30, N'P030', N'C030', N'R030')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (31, N'P031', N'C031', N'R031')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (32, N'P032', N'C032', N'R032')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (33, N'P033', N'C033', N'R033')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (34, N'P034', N'C034', N'R034')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (35, N'P035', N'C035', N'R035')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (36, N'P036', N'C036', N'R036')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (37, N'P037', N'C037', N'R037')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (38, N'P038', N'C038', N'R038')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (39, N'P039', N'C039', N'R039')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (40, N'P040', N'C040', N'R040')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (41, N'P041', N'C041', N'R041')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (42, N'P042', N'C042', N'R042')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (43, N'P043', N'C043', N'R043')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (44, N'P044', N'C044', N'R044')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (45, N'P045', N'C045', N'R045')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (46, N'P046', N'C046', N'R046')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (47, N'P047', N'C047', N'R047')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (48, N'P048', N'C048', N'R048')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (49, N'P049', N'C049', N'R049')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (50, N'P050', N'C050', N'R050')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (51, N'P051', N'C051', N'R051')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (52, N'P052', N'C052', N'R052')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (53, N'P053', N'C053', N'R053')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (54, N'P054', N'C054', N'R054')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (55, N'P055', N'C055', N'R055')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (56, N'P056', N'C056', N'R056')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (57, N'P057', N'C057', N'R057')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (58, N'P058', N'C058', N'R058')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (59, N'P059', N'C059', N'R059')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (60, N'P060', N'C060', N'R060')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (61, N'P061', N'C061', N'R061')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (62, N'P062', N'C062', N'R062')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (63, N'P063', N'C063', N'R063')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (64, N'P064', N'C064', N'R064')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (65, N'P065', N'C065', N'R065')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (66, N'P066', N'C066', N'R066')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (67, N'P067', N'C067', N'R067')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (68, N'P068', N'C068', N'R068')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (69, N'P069', N'C069', N'R069')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (70, N'P070', N'C070', N'R070')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (71, N'P071', N'C071', N'R071')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (72, N'P072', N'C072', N'R072')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (73, N'P073', N'C073', N'R073')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (74, N'P074', N'C074', N'R074')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (75, N'P075', N'C075', N'R075')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (76, N'P076', N'C076', N'R076')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (77, N'P077', N'C077', N'R077')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (78, N'P078', N'C078', N'R078')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (79, N'P079', N'C079', N'R079')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (80, N'P080', N'C080', N'R080')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (81, N'P081', N'C081', N'R081')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (82, N'P082', N'C082', N'R082')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (83, N'P083', N'C083', N'R083')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (84, N'P084', N'C084', N'R084')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (85, N'P085', N'C085', N'R085')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (86, N'P086', N'C086', N'R086')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (87, N'P087', N'C087', N'R087')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (88, N'P088', N'C088', N'R088')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (89, N'P089', N'C089', N'R089')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (90, N'P090', N'C090', N'R090')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (91, N'P091', N'C091', N'R091')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (92, N'P092', N'C092', N'R092')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (93, N'P093', N'C093', N'R093')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (94, N'P094', N'C094', N'R094')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (95, N'P095', N'C095', N'R095')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (96, N'P096', N'C096', N'R096')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (97, N'P097', N'C097', N'R097')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (98, N'P098', N'C098', N'R098')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (99, N'P099', N'C099', N'R099')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (100, N'P100', N'C100', N'R100')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (101, N'P101', N'C101', N'R101')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (102, N'P102', N'C102', N'R102')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (103, N'P103', N'C103', N'R103')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (104, N'P104', N'C104', N'R104')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (105, N'P105', N'C105', N'R105')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (106, N'P106', N'C106', N'R106')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (107, N'P107', N'C107', N'R107')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (108, N'P108', N'C108', N'R108')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (109, N'P109', N'C109', N'R109')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (110, N'P110', N'C110', N'R110')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (111, N'P111', N'C111', N'R111')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (112, N'P112', N'C112', N'R112')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (113, N'P113', N'C113', N'R113')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (114, N'P114', N'C114', N'R114')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (115, N'P115', N'C115', N'R115')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (116, N'P116', N'C116', N'R116')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (117, N'P117', N'C117', N'R117')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (118, N'P118', N'C118', N'R118')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (119, N'P119', N'C119', N'R119')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (120, N'P120', N'C120', N'R120')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (121, N'P121', N'C121', N'R121')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (122, N'P122', N'C122', N'R122')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (123, N'P123', N'C123', N'R123')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (124, N'P124', N'C124', N'R124')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (125, N'P125', N'C125', N'R125')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (126, N'P126', N'C126', N'R126')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (127, N'P127', N'C127', N'R127')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (128, N'P128', N'C128', N'R128')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (129, N'P129', N'C129', N'R129')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (130, N'P130', N'C130', N'R130')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (131, N'P131', N'C131', N'R131')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (132, N'P132', N'C132', N'R132')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (133, N'P133', N'C133', N'R133')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (134, N'P134', N'C134', N'R134')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (135, N'P135', N'C135', N'R135')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (136, N'P136', N'C136', N'R136')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (137, N'P137', N'C137', N'R137')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (138, N'P138', N'C138', N'R138')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (139, N'P139', N'C139', N'R139')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (140, N'P140', N'C140', N'R140')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (141, N'P141', N'C141', N'R141')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (142, N'P142', N'C142', N'R142')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (143, N'P143', N'C143', N'R143')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (144, N'P144', N'C144', N'R144')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (145, N'P145', N'C145', N'R145')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (146, N'P146', N'C146', N'R146')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (147, N'P147', N'C147', N'R147')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (148, N'P148', N'C148', N'R148')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (149, N'P149', N'C149', N'R149')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (150, N'P150', N'C150', N'R150')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (151, N'P151', N'C151', N'R151')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (152, N'P152', N'C152', N'R152')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (153, N'P153', N'C153', N'R153')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (154, N'P154', N'C154', N'R154')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (155, N'P155', N'C155', N'R155')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (156, N'P156', N'C156', N'R156')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (157, N'P157', N'C157', N'R157')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (158, N'P158', N'C158', N'R158')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (159, N'P159', N'C159', N'R159')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (160, N'P160', N'C160', N'R160')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (161, N'P161', N'C161', N'R161')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (162, N'P162', N'C162', N'R162')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (163, N'P163', N'C163', N'R163')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (164, N'P164', N'C164', N'R164')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (165, N'P165', N'C165', N'R165')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (166, N'P166', N'C166', N'R166')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (167, N'P167', N'C167', N'R167')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (168, N'P168', N'C168', N'R168')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (169, N'P169', N'C169', N'R169')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (170, N'P170', N'C170', N'R170')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (171, N'P171', N'C171', N'R171')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (172, N'P172', N'C172', N'R172')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (173, N'P173', N'C173', N'R173')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (174, N'P174', N'C174', N'R174')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (175, N'P175', N'C175', N'R175')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (176, N'P176', N'C176', N'R176')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (177, N'P177', N'C177', N'R177')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (178, N'P178', N'C178', N'R178')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (179, N'P179', N'C179', N'R179')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (180, N'P180', N'C180', N'R180')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (181, N'P181', N'C181', N'R181')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (182, N'P182', N'C182', N'R182')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (183, N'P183', N'C183', N'R183')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (184, N'P184', N'C184', N'R184')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (185, N'P185', N'C185', N'R185')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (186, N'P186', N'C186', N'R186')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (187, N'P187', N'C187', N'R187')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (188, N'P188', N'C188', N'R188')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (189, N'P189', N'C189', N'R189')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (190, N'P190', N'C190', N'R190')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (191, N'P191', N'C191', N'R191')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (192, N'P192', N'C192', N'R192')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (193, N'P193', N'C193', N'R193')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (194, N'P194', N'C194', N'R194')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (195, N'P195', N'C195', N'R195')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (196, N'P196', N'C196', N'R196')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (197, N'P197', N'C197', N'R197')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (198, N'P198', N'C198', N'R198')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (199, N'P199', N'C199', N'R199')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (200, N'P200', N'C200', N'R200')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (201, N'P201', N'C201', N'R201')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (202, N'P202', N'C202', N'R202')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (203, N'P203', N'C203', N'R203')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (204, N'P204', N'C204', N'R204')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (205, N'P205', N'C205', N'R205')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (206, N'P206', N'C206', N'R206')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (207, N'P207', N'C207', N'R207')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (208, N'P208', N'C208', N'R208')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (209, N'P209', N'C209', N'R209')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (210, N'P210', N'C210', N'R210')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (211, N'P211', N'C211', N'R211')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (212, N'P212', N'C212', N'R212')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (213, N'P213', N'C213', N'R213')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (214, N'P214', N'C214', N'R214')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (215, N'P215', N'C215', N'R215')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (216, N'P216', N'C216', N'R216')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (217, N'P217', N'C217', N'R217')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (218, N'P218', N'C218', N'R218')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (219, N'P219', N'C219', N'R219')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (220, N'P220', N'C220', N'R220')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (221, N'P221', N'C221', N'R221')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (222, N'P222', N'C222', N'R222')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (223, N'P223', N'C223', N'R223')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (224, N'P224', N'C224', N'R224')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (225, N'P225', N'C225', N'R225')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (226, N'P226', N'C226', N'R226')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (227, N'P227', N'C227', N'R227')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (228, N'P228', N'C228', N'R228')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (229, N'P229', N'C229', N'R229')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (230, N'P230', N'C230', N'R230')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (231, N'P231', N'C231', N'R231')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (232, N'P232', N'C232', N'R232')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (233, N'P233', N'C233', N'R233')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (234, N'P234', N'C234', N'R234')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (235, N'P235', N'C235', N'R235')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (236, N'P236', N'C236', N'R236')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (237, N'P237', N'C237', N'R237')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (238, N'P238', N'C238', N'R238')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (239, N'P239', N'C239', N'R239')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (240, N'P240', N'C240', N'R240')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (241, N'P241', N'C241', N'R241')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (242, N'P242', N'C242', N'R242')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (243, N'P243', N'C243', N'R243')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (244, N'P244', N'C244', N'R244')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (245, N'P245', N'C245', N'R245')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (246, N'P246', N'C246', N'R246')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (247, N'P247', N'C247', N'R247')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (248, N'P248', N'C248', N'R248')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (249, N'P249', N'C249', N'R249')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (250, N'P250', N'C250', N'R250')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (251, N'P251', N'C251', N'R251')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (252, N'P252', N'C252', N'R252')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (253, N'P253', N'C253', N'R253')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (254, N'P254', N'C254', N'R254')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (255, N'P255', N'C255', N'R255')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (256, N'P256', N'C256', N'R256')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (257, N'P257', N'C257', N'R257')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (258, N'P258', N'C258', N'R258')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (259, N'P259', N'C259', N'R259')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (260, N'P260', N'C260', N'R260')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (261, N'P261', N'C261', N'R261')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (262, N'P262', N'C262', N'R262')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (263, N'P263', N'C263', N'R263')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (264, N'P264', N'C264', N'R264')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (265, N'P265', N'C265', N'R265')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (266, N'P266', N'C266', N'R266')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (267, N'P267', N'C267', N'R267')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (268, N'P268', N'C268', N'R268')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (269, N'P269', N'C269', N'R269')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (270, N'P270', N'C270', N'R270')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (271, N'P271', N'C271', N'R271')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (272, N'P272', N'C272', N'R272')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (273, N'P273', N'C273', N'R273')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (274, N'P274', N'C274', N'R274')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (275, N'P275', N'C275', N'R275')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (276, N'P276', N'C276', N'R276')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (277, N'P277', N'C277', N'R277')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (278, N'P278', N'C278', N'R278')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (279, N'P279', N'C279', N'R279')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (280, N'P280', N'C280', N'R280')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (281, N'P281', N'C281', N'R281')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (282, N'P282', N'C282', N'R282')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (283, N'P283', N'C283', N'R283')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (284, N'P284', N'C284', N'R284')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (285, N'P285', N'C285', N'R285')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (286, N'P286', N'C286', N'R286')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (287, N'P287', N'C287', N'R287')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (288, N'P288', N'C288', N'R288')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (289, N'P289', N'C289', N'R289')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (290, N'P290', N'C290', N'R290')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (291, N'P291', N'C291', N'R291')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (292, N'P292', N'C292', N'R292')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (293, N'P293', N'C293', N'R293')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (294, N'P294', N'C294', N'R294')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (295, N'P295', N'C295', N'R295')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (296, N'P296', N'C296', N'R296')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (297, N'P297', N'C297', N'R297')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (298, N'P298', N'C298', N'R298')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (299, N'P299', N'C299', N'R299')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (300, N'P300', N'C300', N'R300')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (301, N'P301', N'C301', N'R301')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (302, N'P302', N'C302', N'R302')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (303, N'P303', N'C303', N'R303')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (304, N'P304', N'C304', N'R304')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (305, N'P305', N'C305', N'R305')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (306, N'P306', N'C306', N'R306')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (307, N'P307', N'C307', N'R307')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (308, N'P308', N'C308', N'R308')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (309, N'P309', N'C309', N'R309')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (310, N'P310', N'C310', N'R310')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (311, N'P311', N'C311', N'R311')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (312, N'P312', N'C312', N'R312')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (313, N'P313', N'C313', N'R313')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (314, N'P314', N'C314', N'R314')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (315, N'P315', N'C315', N'R315')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (316, N'P316', N'C316', N'R316')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (317, N'P317', N'C317', N'R317')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (318, N'P318', N'C318', N'R318')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (319, N'P319', N'C319', N'R319')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (320, N'P320', N'C320', N'R320')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (321, N'P321', N'C321', N'R321')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (322, N'P322', N'C322', N'R322')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (323, N'P323', N'C323', N'R323')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (324, N'P324', N'C324', N'R324')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (325, N'P325', N'C325', N'R325')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (326, N'P326', N'C326', N'R326')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (327, N'P327', N'C327', N'R327')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (328, N'P328', N'C328', N'R328')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (329, N'P329', N'C329', N'R329')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (330, N'P330', N'C330', N'R330')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (331, N'P331', N'C331', N'R331')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (332, N'P332', N'C332', N'R332')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (333, N'P333', N'C333', N'R333')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (334, N'P334', N'C334', N'R334')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (335, N'P335', N'C335', N'R335')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (336, N'P336', N'C336', N'R336')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (337, N'P337', N'C337', N'R337')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (338, N'P338', N'C338', N'R338')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (339, N'P339', N'C339', N'R339')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (340, N'P340', N'C340', N'R340')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (341, N'P341', N'C341', N'R341')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (342, N'P342', N'C342', N'R342')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (343, N'P343', N'C343', N'R343')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (344, N'P344', N'C344', N'R344')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (345, N'P345', N'C345', N'R345')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (346, N'P346', N'C346', N'R346')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (347, N'P347', N'C347', N'R347')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (348, N'P348', N'C348', N'R348')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (349, N'P349', N'C349', N'R349')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (350, N'P350', N'C350', N'R350')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (351, N'P351', N'C351', N'R351')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (352, N'P352', N'C352', N'R352')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (353, N'P353', N'C353', N'R353')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (354, N'P354', N'C354', N'R354')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (355, N'P355', N'C355', N'R355')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (356, N'P356', N'C356', N'R356')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (357, N'P357', N'C357', N'R357')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (358, N'P358', N'C358', N'R358')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (359, N'P359', N'C359', N'R359')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (360, N'P360', N'C360', N'R360')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (361, N'P361', N'C361', N'R361')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (362, N'P362', N'C362', N'R362')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (363, N'P363', N'C363', N'R363')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (364, N'P364', N'C364', N'R364')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (365, N'P365', N'C365', N'R365')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (366, N'P366', N'C366', N'R366')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (367, N'P367', N'C367', N'R367')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (368, N'P368', N'C368', N'R368')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (369, N'P369', N'C369', N'R369')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (370, N'P370', N'C370', N'R370')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (371, N'P371', N'C371', N'R371')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (372, N'P372', N'C372', N'R372')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (373, N'P373', N'C373', N'R373')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (374, N'P374', N'C374', N'R374')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (375, N'P375', N'C375', N'R375')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (376, N'P376', N'C376', N'R376')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (377, N'P377', N'C377', N'R377')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (378, N'P378', N'C378', N'R378')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (379, N'P379', N'C379', N'R379')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (380, N'P380', N'C380', N'R380')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (381, N'P381', N'C381', N'R381')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (382, N'P382', N'C382', N'R382')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (383, N'P383', N'C383', N'R383')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (384, N'P384', N'C384', N'R384')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (385, N'P385', N'C385', N'R385')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (386, N'P386', N'C386', N'R386')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (387, N'P387', N'C387', N'R387')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (388, N'P388', N'C388', N'R388')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (389, N'P389', N'C389', N'R389')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (390, N'P390', N'C390', N'R390')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (391, N'P391', N'C391', N'R391')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (392, N'P392', N'C392', N'R392')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (393, N'P393', N'C393', N'R393')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (394, N'P394', N'C394', N'R394')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (395, N'P395', N'C395', N'R395')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (396, N'P396', N'C396', N'R396')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (397, N'P397', N'C397', N'R397')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (398, N'P398', N'C398', N'R398')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (399, N'P399', N'C399', N'R399')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (400, N'P400', N'C400', N'R400')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (401, N'P401', N'C401', N'R401')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (402, N'P402', N'C402', N'R402')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (403, N'P403', N'C403', N'R403')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (404, N'P404', N'C404', N'R404')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (405, N'P405', N'C405', N'R405')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (406, N'P406', N'C406', N'R406')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (407, N'P407', N'C407', N'R407')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (408, N'P408', N'C408', N'R408')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (409, N'P409', N'C409', N'R409')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (410, N'P410', N'C410', N'R410')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (411, N'P411', N'C411', N'R411')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (412, N'P412', N'C412', N'R412')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (413, N'P413', N'C413', N'R413')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (414, N'P414', N'C414', N'R414')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (415, N'P415', N'C415', N'R415')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (416, N'P416', N'C416', N'R416')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (417, N'P417', N'C417', N'R417')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (418, N'P418', N'C418', N'R418')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (419, N'P419', N'C419', N'R419')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (420, N'P420', N'C420', N'R420')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (421, N'P421', N'C421', N'R421')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (422, N'P422', N'C422', N'R422')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (423, N'P423', N'C423', N'R423')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (424, N'P424', N'C424', N'R424')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (425, N'P425', N'C425', N'R425')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (426, N'P426', N'C426', N'R426')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (427, N'P427', N'C427', N'R427')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (428, N'P428', N'C428', N'R428')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (429, N'P429', N'C429', N'R429')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (430, N'P430', N'C430', N'R430')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (431, N'P431', N'C431', N'R431')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (432, N'P432', N'C432', N'R432')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (433, N'P433', N'C433', N'R433')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (434, N'P434', N'C434', N'R434')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (435, N'P435', N'C435', N'R435')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (436, N'P436', N'C436', N'R436')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (437, N'P437', N'C437', N'R437')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (438, N'P438', N'C438', N'R438')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (439, N'P439', N'C439', N'R439')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (440, N'P440', N'C440', N'R440')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (441, N'P441', N'C441', N'R441')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (442, N'P442', N'C442', N'R442')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (443, N'P443', N'C443', N'R443')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (444, N'P444', N'C444', N'R444')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (445, N'P445', N'C445', N'R445')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (446, N'P446', N'C446', N'R446')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (447, N'P447', N'C447', N'R447')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (448, N'P448', N'C448', N'R448')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (449, N'P449', N'C449', N'R449')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (450, N'P450', N'C450', N'R450')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (451, N'P451', N'C451', N'R451')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (452, N'P452', N'C452', N'R452')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (453, N'P453', N'C453', N'R453')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (454, N'P454', N'C454', N'R454')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (455, N'P455', N'C455', N'R455')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (456, N'P456', N'C456', N'R456')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (457, N'P457', N'C457', N'R457')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (458, N'P458', N'C458', N'R458')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (459, N'P459', N'C459', N'R459')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (460, N'P460', N'C460', N'R460')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (461, N'P461', N'C461', N'R461')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (462, N'P462', N'C462', N'R462')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (463, N'P463', N'C463', N'R463')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (464, N'P464', N'C464', N'R464')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (465, N'P465', N'C465', N'R465')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (466, N'P466', N'C466', N'R466')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (467, N'P467', N'C467', N'R467')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (468, N'P468', N'C468', N'R468')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (469, N'P469', N'C469', N'R469')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (470, N'P470', N'C470', N'R470')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (471, N'P471', N'C471', N'R471')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (472, N'P472', N'C472', N'R472')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (473, N'P473', N'C473', N'R473')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (474, N'P474', N'C474', N'R474')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (475, N'P475', N'C475', N'R475')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (476, N'P476', N'C476', N'R476')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (477, N'P477', N'C477', N'R477')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (478, N'P478', N'C478', N'R478')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (479, N'P479', N'C479', N'R479')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (480, N'P480', N'C480', N'R480')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (481, N'P481', N'C481', N'R481')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (482, N'P482', N'C482', N'R482')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (483, N'P483', N'C483', N'R483')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (484, N'P484', N'C484', N'R484')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (485, N'P485', N'C485', N'R485')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (486, N'P486', N'C486', N'R486')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (487, N'P487', N'C487', N'R487')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (488, N'P488', N'C488', N'R488')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (489, N'P489', N'C489', N'R489')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (490, N'P490', N'C490', N'R490')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (491, N'P491', N'C491', N'R491')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (492, N'P492', N'C492', N'R492')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (493, N'P493', N'C493', N'R493')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (494, N'P494', N'C494', N'R494')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (495, N'P495', N'C495', N'R495')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (496, N'P496', N'C496', N'R496')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (497, N'P497', N'C497', N'R497')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (498, N'P498', N'C498', N'R498')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (499, N'P499', N'C499', N'R499')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (500, N'P500', N'C500', N'R500')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (501, N'P501', N'C501', N'R501')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (502, N'P502', N'C502', N'R502')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (503, N'P503', N'C503', N'R503')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (504, N'P504', N'C504', N'R504')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (505, N'P505', N'C505', N'R505')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (506, N'P506', N'C506', N'R506')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (507, N'P507', N'C507', N'R507')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (508, N'P508', N'C508', N'R508')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (509, N'P509', N'C509', N'R509')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (510, N'P510', N'C510', N'R510')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (511, N'P511', N'C511', N'R511')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (512, N'P512', N'C512', N'R512')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (513, N'P513', N'C513', N'R513')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (514, N'P514', N'C514', N'R514')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (515, N'P515', N'C515', N'R515')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (516, N'P516', N'C516', N'R516')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (517, N'P517', N'C517', N'R517')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (518, N'P518', N'C518', N'R518')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (519, N'P519', N'C519', N'R519')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (520, N'P520', N'C520', N'R520')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (521, N'P521', N'C521', N'R521')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (522, N'P522', N'C522', N'R522')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (523, N'P523', N'C523', N'R523')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (524, N'P524', N'C524', N'R524')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (525, N'P525', N'C525', N'R525')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (526, N'P526', N'C526', N'R526')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (527, N'P527', N'C527', N'R527')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (528, N'P528', N'C528', N'R528')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (529, N'P529', N'C529', N'R529')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (530, N'P530', N'C530', N'R530')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (531, N'P531', N'C531', N'R531')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (532, N'P532', N'C532', N'R532')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (533, N'P533', N'C533', N'R533')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (534, N'P534', N'C534', N'R534')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (535, N'P535', N'C535', N'R535')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (536, N'P536', N'C536', N'R536')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (537, N'P537', N'C537', N'R537')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (538, N'P538', N'C538', N'R538')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (539, N'P539', N'C539', N'R539')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (540, N'P540', N'C540', N'R540')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (541, N'P541', N'C541', N'R541')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (542, N'P542', N'C542', N'R542')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (543, N'P543', N'C543', N'R543')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (544, N'P544', N'C544', N'R544')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (545, N'P545', N'C545', N'R545')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (546, N'P546', N'C546', N'R546')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (547, N'P547', N'C547', N'R547')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (548, N'P548', N'C548', N'R548')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (549, N'P549', N'C549', N'R549')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (550, N'P550', N'C550', N'R550')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (551, N'P551', N'C551', N'R551')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (552, N'P552', N'C552', N'R552')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (553, N'P553', N'C553', N'R553')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (554, N'P554', N'C554', N'R554')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (555, N'P555', N'C555', N'R555')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (556, N'P556', N'C556', N'R556')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (557, N'P557', N'C557', N'R557')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (558, N'P558', N'C558', N'R558')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (559, N'P559', N'C559', N'R559')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (560, N'P560', N'C560', N'R560')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (561, N'P561', N'C561', N'R561')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (562, N'P562', N'C562', N'R562')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (563, N'P563', N'C563', N'R563')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (564, N'P564', N'C564', N'R564')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (565, N'P565', N'C565', N'R565')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (566, N'P566', N'C566', N'R566')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (567, N'P567', N'C567', N'R567')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (568, N'P568', N'C568', N'R568')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (569, N'P569', N'C569', N'R569')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (570, N'P570', N'C570', N'R570')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (571, N'P571', N'C571', N'R571')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (572, N'P572', N'C572', N'R572')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (573, N'P573', N'C573', N'R573')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (574, N'P574', N'C574', N'R574')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (575, N'P575', N'C575', N'R575')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (576, N'P576', N'C576', N'R576')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (577, N'P577', N'C577', N'R577')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (578, N'P578', N'C578', N'R578')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (579, N'P579', N'C579', N'R579')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (580, N'P580', N'C580', N'R580')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (581, N'P581', N'C581', N'R581')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (582, N'P582', N'C582', N'R582')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (583, N'P583', N'C583', N'R583')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (584, N'P584', N'C584', N'R584')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (585, N'P585', N'C585', N'R585')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (586, N'P586', N'C586', N'R586')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (587, N'P587', N'C587', N'R587')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (588, N'P588', N'C588', N'R588')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (589, N'P589', N'C589', N'R589')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (590, N'P590', N'C590', N'R590')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (591, N'P591', N'C591', N'R591')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (592, N'P592', N'C592', N'R592')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (593, N'P593', N'C593', N'R593')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (594, N'P594', N'C594', N'R594')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (595, N'P595', N'C595', N'R595')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (596, N'P596', N'C596', N'R596')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (597, N'P597', N'C597', N'R597')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (598, N'P598', N'C598', N'R598')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (599, N'P599', N'C599', N'R599')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (600, N'P600', N'C600', N'R600')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (601, N'P601', N'C601', N'R601')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (602, N'P602', N'C602', N'R602')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (603, N'P603', N'C603', N'R603')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (604, N'P604', N'C604', N'R604')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (605, N'P605', N'C605', N'R605')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (606, N'P606', N'C606', N'R606')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (607, N'P607', N'C607', N'R607')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (608, N'P608', N'C608', N'R608')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (609, N'P609', N'C609', N'R609')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (610, N'P610', N'C610', N'R610')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (611, N'P611', N'C611', N'R611')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (612, N'P612', N'C612', N'R612')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (613, N'P613', N'C613', N'R613')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (614, N'P614', N'C614', N'R614')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (615, N'P615', N'C615', N'R615')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (616, N'P616', N'C616', N'R616')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (617, N'P617', N'C617', N'R617')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (618, N'P618', N'C618', N'R618')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (619, N'P619', N'C619', N'R619')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (620, N'P620', N'C620', N'R620')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (621, N'P621', N'C621', N'R621')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (622, N'P622', N'C622', N'R622')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (623, N'P623', N'C623', N'R623')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (624, N'P624', N'C624', N'R624')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (625, N'P625', N'C625', N'R625')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (626, N'P626', N'C626', N'R626')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (627, N'P627', N'C627', N'R627')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (628, N'P628', N'C628', N'R628')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (629, N'P629', N'C629', N'R629')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (630, N'P630', N'C630', N'R630')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (631, N'P631', N'C631', N'R631')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (632, N'P632', N'C632', N'R632')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (633, N'P633', N'C633', N'R633')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (634, N'P634', N'C634', N'R634')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (635, N'P635', N'C635', N'R635')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (636, N'P636', N'C636', N'R636')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (637, N'P637', N'C637', N'R637')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (638, N'P638', N'C638', N'R638')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (639, N'P639', N'C639', N'R639')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (640, N'P640', N'C640', N'R640')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (641, N'P641', N'C641', N'R641')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (642, N'P642', N'C642', N'R642')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (643, N'P643', N'C643', N'R643')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (644, N'P644', N'C644', N'R644')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (645, N'P645', N'C645', N'R645')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (646, N'P646', N'C646', N'R646')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (647, N'P647', N'C647', N'R647')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (648, N'P648', N'C648', N'R648')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (649, N'P649', N'C649', N'R649')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (650, N'P650', N'C650', N'R650')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (651, N'P651', N'C651', N'R651')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (652, N'P652', N'C652', N'R652')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (653, N'P653', N'C653', N'R653')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (654, N'P654', N'C654', N'R654')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (655, N'P655', N'C655', N'R655')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (656, N'P656', N'C656', N'R656')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (657, N'P657', N'C657', N'R657')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (658, N'P658', N'C658', N'R658')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (659, N'P659', N'C659', N'R659')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (660, N'P660', N'C660', N'R660')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (661, N'P661', N'C661', N'R661')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (662, N'P662', N'C662', N'R662')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (663, N'P663', N'C663', N'R663')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (664, N'P664', N'C664', N'R664')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (665, N'P665', N'C665', N'R665')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (666, N'P666', N'C666', N'R666')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (667, N'P667', N'C667', N'R667')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (668, N'P668', N'C668', N'R668')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (669, N'P669', N'C669', N'R669')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (670, N'P670', N'C670', N'R670')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (671, N'P671', N'C671', N'R671')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (672, N'P672', N'C672', N'R672')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (673, N'P673', N'C673', N'R673')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (674, N'P674', N'C674', N'R674')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (675, N'P675', N'C675', N'R675')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (676, N'P676', N'C676', N'R676')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (677, N'P677', N'C677', N'R677')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (678, N'P678', N'C678', N'R678')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (679, N'P679', N'C679', N'R679')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (680, N'P680', N'C680', N'R680')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (681, N'P681', N'C681', N'R681')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (682, N'P682', N'C682', N'R682')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (683, N'P683', N'C683', N'R683')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (684, N'P684', N'C684', N'R684')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (685, N'P685', N'C685', N'R685')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (686, N'P686', N'C686', N'R686')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (687, N'P687', N'C687', N'R687')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (688, N'P688', N'C688', N'R688')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (689, N'P689', N'C689', N'R689')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (690, N'P690', N'C690', N'R690')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (691, N'P691', N'C691', N'R691')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (692, N'P692', N'C692', N'R692')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (693, N'P693', N'C693', N'R693')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (694, N'P694', N'C694', N'R694')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (695, N'P695', N'C695', N'R695')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (696, N'P696', N'C696', N'R696')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (697, N'P697', N'C697', N'R697')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (698, N'P698', N'C698', N'R698')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (699, N'P699', N'C699', N'R699')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (700, N'P700', N'C700', N'R700')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (701, N'P701', N'C701', N'R701')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (702, N'P702', N'C702', N'R702')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (703, N'P703', N'C703', N'R703')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (704, N'P704', N'C704', N'R704')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (705, N'P705', N'C705', N'R705')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (706, N'P706', N'C706', N'R706')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (707, N'P707', N'C707', N'R707')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (708, N'P708', N'C708', N'R708')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (709, N'P709', N'C709', N'R709')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (710, N'P710', N'C710', N'R710')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (711, N'P711', N'C711', N'R711')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (712, N'P712', N'C712', N'R712')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (713, N'P713', N'C713', N'R713')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (714, N'P714', N'C714', N'R714')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (715, N'P715', N'C715', N'R715')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (716, N'P716', N'C716', N'R716')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (717, N'P717', N'C717', N'R717')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (718, N'P718', N'C718', N'R718')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (719, N'P719', N'C719', N'R719')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (720, N'P720', N'C720', N'R720')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (721, N'P721', N'C721', N'R721')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (722, N'P722', N'C722', N'R722')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (723, N'P723', N'C723', N'R723')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (724, N'P724', N'C724', N'R724')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (725, N'P725', N'C725', N'R725')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (726, N'P726', N'C726', N'R726')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (727, N'P727', N'C727', N'R727')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (728, N'P728', N'C728', N'R728')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (729, N'P729', N'C729', N'R729')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (730, N'P730', N'C730', N'R730')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (731, N'P731', N'C731', N'R731')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (732, N'P732', N'C732', N'R732')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (733, N'P733', N'C733', N'R733')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (734, N'P734', N'C734', N'R734')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (735, N'P735', N'C735', N'R735')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (736, N'P736', N'C736', N'R736')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (737, N'P737', N'C737', N'R737')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (738, N'P738', N'C738', N'R738')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (739, N'P739', N'C739', N'R739')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (740, N'P740', N'C740', N'R740')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (741, N'P741', N'C741', N'R741')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (742, N'P742', N'C742', N'R742')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (743, N'P743', N'C743', N'R743')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (744, N'P744', N'C744', N'R744')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (745, N'P745', N'C745', N'R745')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (746, N'P746', N'C746', N'R746')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (747, N'P747', N'C747', N'R747')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (748, N'P748', N'C748', N'R748')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (749, N'P749', N'C749', N'R749')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (750, N'P750', N'C750', N'R750')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (751, N'P751', N'C751', N'R751')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (752, N'P752', N'C752', N'R752')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (753, N'P753', N'C753', N'R753')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (754, N'P754', N'C754', N'R754')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (755, N'P755', N'C755', N'R755')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (756, N'P756', N'C756', N'R756')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (757, N'P757', N'C757', N'R757')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (758, N'P758', N'C758', N'R758')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (759, N'P759', N'C759', N'R759')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (760, N'P760', N'C760', N'R760')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (761, N'P761', N'C761', N'R761')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (762, N'P762', N'C762', N'R762')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (763, N'P763', N'C763', N'R763')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (764, N'P764', N'C764', N'R764')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (765, N'P765', N'C765', N'R765')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (766, N'P766', N'C766', N'R766')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (767, N'P767', N'C767', N'R767')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (768, N'P768', N'C768', N'R768')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (769, N'P769', N'C769', N'R769')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (770, N'P770', N'C770', N'R770')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (771, N'P771', N'C771', N'R771')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (772, N'P772', N'C772', N'R772')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (773, N'P773', N'C773', N'R773')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (774, N'P774', N'C774', N'R774')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (775, N'P775', N'C775', N'R775')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (776, N'P776', N'C776', N'R776')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (777, N'P777', N'C777', N'R777')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (778, N'P778', N'C778', N'R778')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (779, N'P779', N'C779', N'R779')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (780, N'P780', N'C780', N'R780')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (781, N'P781', N'C781', N'R781')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (782, N'P782', N'C782', N'R782')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (783, N'P783', N'C783', N'R783')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (784, N'P784', N'C784', N'R784')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (785, N'P785', N'C785', N'R785')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (786, N'P786', N'C786', N'R786')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (787, N'P787', N'C787', N'R787')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (788, N'P788', N'C788', N'R788')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (789, N'P789', N'C789', N'R789')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (790, N'P790', N'C790', N'R790')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (791, N'P791', N'C791', N'R791')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (792, N'P792', N'C792', N'R792')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (793, N'P793', N'C793', N'R793')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (794, N'P794', N'C794', N'R794')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (795, N'P795', N'C795', N'R795')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (796, N'P796', N'C796', N'R796')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (797, N'P797', N'C797', N'R797')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (798, N'P798', N'C798', N'R798')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (799, N'P799', N'C799', N'R799')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (800, N'P800', N'C800', N'R800')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (801, N'P801', N'C801', N'R801')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (802, N'P802', N'C802', N'R802')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (803, N'P803', N'C803', N'R803')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (804, N'P804', N'C804', N'R804')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (805, N'P805', N'C805', N'R805')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (806, N'P806', N'C806', N'R806')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (807, N'P807', N'C807', N'R807')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (808, N'P808', N'C808', N'R808')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (809, N'P809', N'C809', N'R809')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (810, N'P810', N'C810', N'R810')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (811, N'P811', N'C811', N'R811')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (812, N'P812', N'C812', N'R812')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (813, N'P813', N'C813', N'R813')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (814, N'P814', N'C814', N'R814')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (815, N'P815', N'C815', N'R815')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (816, N'P816', N'C816', N'R816')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (817, N'P817', N'C817', N'R817')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (818, N'P818', N'C818', N'R818')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (819, N'P819', N'C819', N'R819')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (820, N'P820', N'C820', N'R820')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (821, N'P821', N'C821', N'R821')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (822, N'P822', N'C822', N'R822')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (823, N'P823', N'C823', N'R823')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (824, N'P824', N'C824', N'R824')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (825, N'P825', N'C825', N'R825')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (826, N'P826', N'C826', N'R826')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (827, N'P827', N'C827', N'R827')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (828, N'P828', N'C828', N'R828')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (829, N'P829', N'C829', N'R829')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (830, N'P830', N'C830', N'R830')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (831, N'P831', N'C831', N'R831')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (832, N'P832', N'C832', N'R832')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (833, N'P833', N'C833', N'R833')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (834, N'P834', N'C834', N'R834')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (835, N'P835', N'C835', N'R835')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (836, N'P836', N'C836', N'R836')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (837, N'P837', N'C837', N'R837')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (838, N'P838', N'C838', N'R838')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (839, N'P839', N'C839', N'R839')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (840, N'P840', N'C840', N'R840')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (841, N'P841', N'C841', N'R841')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (842, N'P842', N'C842', N'R842')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (843, N'P843', N'C843', N'R843')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (844, N'P844', N'C844', N'R844')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (845, N'P845', N'C845', N'R845')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (846, N'P846', N'C846', N'R846')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (847, N'P847', N'C847', N'R847')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (848, N'P848', N'C848', N'R848')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (849, N'P849', N'C849', N'R849')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (850, N'P850', N'C850', N'R850')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (851, N'P851', N'C851', N'R851')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (852, N'P852', N'C852', N'R852')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (853, N'P853', N'C853', N'R853')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (854, N'P854', N'C854', N'R854')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (855, N'P855', N'C855', N'R855')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (856, N'P856', N'C856', N'R856')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (857, N'P857', N'C857', N'R857')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (858, N'P858', N'C858', N'R858')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (859, N'P859', N'C859', N'R859')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (860, N'P860', N'C860', N'R860')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (861, N'P861', N'C861', N'R861')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (862, N'P862', N'C862', N'R862')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (863, N'P863', N'C863', N'R863')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (864, N'P864', N'C864', N'R864')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (865, N'P865', N'C865', N'R865')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (866, N'P866', N'C866', N'R866')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (867, N'P867', N'C867', N'R867')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (868, N'P868', N'C868', N'R868')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (869, N'P869', N'C869', N'R869')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (870, N'P870', N'C870', N'R870')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (871, N'P871', N'C871', N'R871')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (872, N'P872', N'C872', N'R872')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (873, N'P873', N'C873', N'R873')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (874, N'P874', N'C874', N'R874')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (875, N'P875', N'C875', N'R875')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (876, N'P876', N'C876', N'R876')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (877, N'P877', N'C877', N'R877')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (878, N'P878', N'C878', N'R878')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (879, N'P879', N'C879', N'R879')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (880, N'P880', N'C880', N'R880')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (881, N'P881', N'C881', N'R881')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (882, N'P882', N'C882', N'R882')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (883, N'P883', N'C883', N'R883')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (884, N'P884', N'C884', N'R884')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (885, N'P885', N'C885', N'R885')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (886, N'P886', N'C886', N'R886')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (887, N'P887', N'C887', N'R887')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (888, N'P888', N'C888', N'R888')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (889, N'P889', N'C889', N'R889')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (890, N'P890', N'C890', N'R890')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (891, N'P891', N'C891', N'R891')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (892, N'P892', N'C892', N'R892')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (893, N'P893', N'C893', N'R893')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (894, N'P894', N'C894', N'R894')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (895, N'P895', N'C895', N'R895')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (896, N'P896', N'C896', N'R896')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (897, N'P897', N'C897', N'R897')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (898, N'P898', N'C898', N'R898')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (899, N'P899', N'C899', N'R899')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (900, N'P900', N'C900', N'R900')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (901, N'P901', N'C901', N'R901')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (902, N'P902', N'C902', N'R902')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (903, N'P903', N'C903', N'R903')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (904, N'P904', N'C904', N'R904')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (905, N'P905', N'C905', N'R905')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (906, N'P906', N'C906', N'R906')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (907, N'P907', N'C907', N'R907')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (908, N'P908', N'C908', N'R908')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (909, N'P909', N'C909', N'R909')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (910, N'P910', N'C910', N'R910')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (911, N'P911', N'C911', N'R911')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (912, N'P912', N'C912', N'R912')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (913, N'P913', N'C913', N'R913')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (914, N'P914', N'C914', N'R914')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (915, N'P915', N'C915', N'R915')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (916, N'P916', N'C916', N'R916')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (917, N'P917', N'C917', N'R917')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (918, N'P918', N'C918', N'R918')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (919, N'P919', N'C919', N'R919')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (920, N'P920', N'C920', N'R920')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (921, N'P921', N'C921', N'R921')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (922, N'P922', N'C922', N'R922')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (923, N'P923', N'C923', N'R923')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (924, N'P924', N'C924', N'R924')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (925, N'P925', N'C925', N'R925')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (926, N'P926', N'C926', N'R926')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (927, N'P927', N'C927', N'R927')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (928, N'P928', N'C928', N'R928')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (929, N'P929', N'C929', N'R929')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (930, N'P930', N'C930', N'R930')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (931, N'P931', N'C931', N'R931')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (932, N'P932', N'C932', N'R932')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (933, N'P933', N'C933', N'R933')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (934, N'P934', N'C934', N'R934')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (935, N'P935', N'C935', N'R935')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (936, N'P936', N'C936', N'R936')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (937, N'P937', N'C937', N'R937')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (938, N'P938', N'C938', N'R938')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (939, N'P939', N'C939', N'R939')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (940, N'P940', N'C940', N'R940')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (941, N'P941', N'C941', N'R941')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (942, N'P942', N'C942', N'R942')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (943, N'P943', N'C943', N'R943')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (944, N'P944', N'C944', N'R944')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (945, N'P945', N'C945', N'R945')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (946, N'P946', N'C946', N'R946')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (947, N'P947', N'C947', N'R947')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (948, N'P948', N'C948', N'R948')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (949, N'P949', N'C949', N'R949')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (950, N'P950', N'C950', N'R950')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (951, N'P951', N'C951', N'R951')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (952, N'P952', N'C952', N'R952')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (953, N'P953', N'C953', N'R953')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (954, N'P954', N'C954', N'R954')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (955, N'P955', N'C955', N'R955')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (956, N'P956', N'C956', N'R956')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (957, N'P957', N'C957', N'R957')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (958, N'P958', N'C958', N'R958')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (959, N'P959', N'C959', N'R959')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (960, N'P960', N'C960', N'R960')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (961, N'P961', N'C961', N'R961')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (962, N'P962', N'C962', N'R962')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (963, N'P963', N'C963', N'R963')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (964, N'P964', N'C964', N'R964')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (965, N'P965', N'C965', N'R965')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (966, N'P966', N'C966', N'R966')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (967, N'P967', N'C967', N'R967')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (968, N'P968', N'C968', N'R968')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (969, N'P969', N'C969', N'R969')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (970, N'P970', N'C970', N'R970')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (971, N'P971', N'C971', N'R971')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (972, N'P972', N'C972', N'R972')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (973, N'P973', N'C973', N'R973')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (974, N'P974', N'C974', N'R974')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (975, N'P975', N'C975', N'R975')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (976, N'P976', N'C976', N'R976')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (977, N'P977', N'C977', N'R977')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (978, N'P978', N'C978', N'R978')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (979, N'P979', N'C979', N'R979')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (980, N'P980', N'C980', N'R980')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (981, N'P981', N'C981', N'R981')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (982, N'P982', N'C982', N'R982')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (983, N'P983', N'C983', N'R983')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (984, N'P984', N'C984', N'R984')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (985, N'P985', N'C985', N'R985')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (986, N'P986', N'C986', N'R986')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (987, N'P987', N'C987', N'R987')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (988, N'P988', N'C988', N'R988')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (989, N'P989', N'C989', N'R989')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (990, N'P990', N'C990', N'R990')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (991, N'P991', N'C991', N'R991')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (992, N'P992', N'C992', N'R992')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (993, N'P993', N'C993', N'R993')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (994, N'P994', N'C994', N'R994')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (995, N'P995', N'C995', N'R995')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (996, N'P996', N'C996', N'R996')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (997, N'P997', N'C997', N'R997')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (998, N'P998', N'C998', N'R998')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (999, N'P999', N'C999', N'R999')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1000, N'P1000', N'C1000', N'R1000')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1001, N'P1001', N'C1001', N'R1001')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1002, N'P1002', N'C1002', N'R1002')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1003, N'P1003', N'C1003', N'R1003')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1004, N'P1004', N'C1004', N'R1004')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1005, N'P1005', N'C1005', N'R1005')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1006, N'P1006', N'C1006', N'R1006')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1007, N'P1007', N'C1007', N'R1007')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1008, N'P1008', N'C1008', N'R1008')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1009, N'P1009', N'C1009', N'R1009')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1010, N'P1010', N'C1010', N'R1010')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1011, N'P1011', N'C1011', N'R1011')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1012, N'P1012', N'C1012', N'R1012')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1013, N'P1013', N'C1013', N'R1013')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1014, N'P1014', N'C1014', N'R1014')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1015, N'P1015', N'C1015', N'R1015')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1016, N'P1016', N'C1016', N'R1016')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1017, N'P1017', N'C1017', N'R1017')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1018, N'P1018', N'C1018', N'R1018')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1019, N'P1019', N'C1019', N'R1019')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1020, N'P1020', N'C1020', N'R1020')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1021, N'P1021', N'C1021', N'R1021')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1022, N'P1022', N'C1022', N'R1022')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1023, N'P1023', N'C1023', N'R1023')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1024, N'P1024', N'C1024', N'R1024')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1025, N'P1025', N'C1025', N'R1025')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1026, N'P1026', N'C1026', N'R1026')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1027, N'P1027', N'C1027', N'R1027')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1028, N'P1028', N'C1028', N'R1028')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1029, N'P1029', N'C1029', N'R1029')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1030, N'P1030', N'C1030', N'R1030')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1031, N'P1031', N'C1031', N'R1031')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1032, N'P1032', N'C1032', N'R1032')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1033, N'P1033', N'C1033', N'R1033')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1034, N'P1034', N'C1034', N'R1034')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1035, N'P1035', N'C1035', N'R1035')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1036, N'P1036', N'C1036', N'R1036')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1037, N'P1037', N'C1037', N'R1037')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1038, N'P1038', N'C1038', N'R1038')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1039, N'P1039', N'C1039', N'R1039')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1040, N'P1040', N'C1040', N'R1040')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1041, N'P1041', N'C1041', N'R1041')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1042, N'P1042', N'C1042', N'R1042')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1043, N'P1043', N'C1043', N'R1043')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1044, N'P1044', N'C1044', N'R1044')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1045, N'P1045', N'C1045', N'R1045')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1046, N'P1046', N'C1046', N'R1046')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1047, N'P1047', N'C1047', N'R1047')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1048, N'P1048', N'C1048', N'R1048')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1049, N'P1049', N'C1049', N'R1049')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1050, N'P1050', N'C1050', N'R1050')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1051, N'P1051', N'C1051', N'R1051')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1052, N'P1052', N'C1052', N'R1052')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1053, N'P1053', N'C1053', N'R1053')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1054, N'P1054', N'C1054', N'R1054')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1055, N'P1055', N'C1055', N'R1055')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1056, N'P1056', N'C1056', N'R1056')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1057, N'P1057', N'C1057', N'R1057')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1058, N'P1058', N'C1058', N'R1058')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1059, N'P1059', N'C1059', N'R1059')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1060, N'P1060', N'C1060', N'R1060')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1061, N'P1061', N'C1061', N'R1061')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1062, N'P1062', N'C1062', N'R1062')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1063, N'P1063', N'C1063', N'R1063')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1064, N'P1064', N'C1064', N'R1064')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1065, N'P1065', N'C1065', N'R1065')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1066, N'P1066', N'C1066', N'R1066')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1067, N'P1067', N'C1067', N'R1067')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1068, N'P1068', N'C1068', N'R1068')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1069, N'P1069', N'C1069', N'R1069')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1070, N'P1070', N'C1070', N'R1070')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1071, N'P1071', N'C1071', N'R1071')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1072, N'P1072', N'C1072', N'R1072')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1073, N'P1073', N'C1073', N'R1073')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1074, N'P1074', N'C1074', N'R1074')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1075, N'P1075', N'C1075', N'R1075')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1076, N'P1076', N'C1076', N'R1076')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1077, N'P1077', N'C1077', N'R1077')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1078, N'P1078', N'C1078', N'R1078')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1079, N'P1079', N'C1079', N'R1079')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1080, N'P1080', N'C1080', N'R1080')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1081, N'P1081', N'C1081', N'R1081')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1082, N'P1082', N'C1082', N'R1082')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1083, N'P1083', N'C1083', N'R1083')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1084, N'P1084', N'C1084', N'R1084')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1085, N'P1085', N'C1085', N'R1085')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1086, N'P1086', N'C1086', N'R1086')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1087, N'P1087', N'C1087', N'R1087')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1088, N'P1088', N'C1088', N'R1088')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1089, N'P1089', N'C1089', N'R1089')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1090, N'P1090', N'C1090', N'R1090')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1091, N'P1091', N'C1091', N'R1091')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1092, N'P1092', N'C1092', N'R1092')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1093, N'P1093', N'C1093', N'R1093')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1094, N'P1094', N'C1094', N'R1094')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1095, N'P1095', N'C1095', N'R1095')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1096, N'P1096', N'C1096', N'R1096')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1097, N'P1097', N'C1097', N'R1097')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1098, N'P1098', N'C1098', N'R1098')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1099, N'P1099', N'C1099', N'R1099')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1100, N'P1100', N'C1100', N'R1100')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1101, N'P1101', N'C1101', N'R1101')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1102, N'P1102', N'C1102', N'R1102')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1103, N'P1103', N'C1103', N'R1103')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1104, N'P1104', N'C1104', N'R1104')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1105, N'P1105', N'C1105', N'R1105')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1106, N'P1106', N'C1106', N'R1106')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1107, N'P1107', N'C1107', N'R1107')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1108, N'P1108', N'C1108', N'R1108')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1109, N'P1109', N'C1109', N'R1109')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1110, N'P1110', N'C1110', N'R1110')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1111, N'P1111', N'C1111', N'R1111')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1112, N'P1112', N'C1112', N'R1112')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1113, N'P1113', N'C1113', N'R1113')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1114, N'P1114', N'C1114', N'R1114')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1115, N'P1115', N'C1115', N'R1115')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1116, N'P1116', N'C1116', N'R1116')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1117, N'P1117', N'C1117', N'R1117')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1118, N'P1118', N'C1118', N'R1118')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1119, N'P1119', N'C1119', N'R1119')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1120, N'P1120', N'C1120', N'R1120')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1121, N'P1121', N'C1121', N'R1121')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1122, N'P1122', N'C1122', N'R1122')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1123, N'P1123', N'C1123', N'R1123')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1124, N'P1124', N'C1124', N'R1124')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1125, N'P1125', N'C1125', N'R1125')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1126, N'P1126', N'C1126', N'R1126')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1127, N'P1127', N'C1127', N'R1127')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1128, N'P1128', N'C1128', N'R1128')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1129, N'P1129', N'C1129', N'R1129')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1130, N'P1130', N'C1130', N'R1130')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1131, N'P1131', N'C1131', N'R1131')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1132, N'P1132', N'C1132', N'R1132')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1133, N'P1133', N'C1133', N'R1133')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1134, N'P1134', N'C1134', N'R1134')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1135, N'P1135', N'C1135', N'R1135')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1136, N'P1136', N'C1136', N'R1136')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1137, N'P1137', N'C1137', N'R1137')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1138, N'P1138', N'C1138', N'R1138')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1139, N'P1139', N'C1139', N'R1139')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1140, N'P1140', N'C1140', N'R1140')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1141, N'P1141', N'C1141', N'R1141')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1142, N'P1142', N'C1142', N'R1142')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1143, N'P1143', N'C1143', N'R1143')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1144, N'P1144', N'C1144', N'R1144')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1145, N'P1145', N'C1145', N'R1145')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1146, N'P1146', N'C1146', N'R1146')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1147, N'P1147', N'C1147', N'R1147')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1148, N'P1148', N'C1148', N'R1148')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1149, N'P1149', N'C1149', N'R1149')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1150, N'P1150', N'C1150', N'R1150')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1151, N'P1151', N'C1151', N'R1151')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1152, N'P1152', N'C1152', N'R1152')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1153, N'P1153', N'C1153', N'R1153')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1154, N'P1154', N'C1154', N'R1154')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1155, N'P1155', N'C1155', N'R1155')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1156, N'P1156', N'C1156', N'R1156')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1157, N'P1157', N'C1157', N'R1157')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1158, N'P1158', N'C1158', N'R1158')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1159, N'P1159', N'C1159', N'R1159')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1160, N'P1160', N'C1160', N'R1160')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1161, N'P1161', N'C1161', N'R1161')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1162, N'P1162', N'C1162', N'R1162')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1163, N'P1163', N'C1163', N'R1163')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1164, N'P1164', N'C1164', N'R1164')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1165, N'P1165', N'C1165', N'R1165')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1166, N'P1166', N'C1166', N'R1166')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1167, N'P1167', N'C1167', N'R1167')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1168, N'P1168', N'C1168', N'R1168')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1169, N'P1169', N'C1169', N'R1169')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1170, N'P1170', N'C1170', N'R1170')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1171, N'P1171', N'C1171', N'R1171')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1172, N'P1172', N'C1172', N'R1172')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1173, N'P1173', N'C1173', N'R1173')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1174, N'P1174', N'C1174', N'R1174')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1175, N'P1175', N'C1175', N'R1175')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1176, N'P1176', N'C1176', N'R1176')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1177, N'P1177', N'C1177', N'R1177')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1178, N'P1178', N'C1178', N'R1178')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1179, N'P1179', N'C1179', N'R1179')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1180, N'P1180', N'C1180', N'R1180')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1181, N'P1181', N'C1181', N'R1181')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1182, N'P1182', N'C1182', N'R1182')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1183, N'P1183', N'C1183', N'R1183')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1184, N'P1184', N'C1184', N'R1184')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1185, N'P1185', N'C1185', N'R1185')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1186, N'P1186', N'C1186', N'R1186')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1187, N'P1187', N'C1187', N'R1187')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1188, N'P1188', N'C1188', N'R1188')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1189, N'P1189', N'C1189', N'R1189')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1190, N'P1190', N'C1190', N'R1190')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1191, N'P1191', N'C1191', N'R1191')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1192, N'P1192', N'C1192', N'R1192')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1193, N'P1193', N'C1193', N'R1193')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1194, N'P1194', N'C1194', N'R1194')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1195, N'P1195', N'C1195', N'R1195')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1196, N'P1196', N'C1196', N'R1196')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1197, N'P1197', N'C1197', N'R1197')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1198, N'P1198', N'C1198', N'R1198')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1199, N'P1199', N'C1199', N'R1199')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1200, N'P1200', N'C1200', N'R1200')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1201, N'P1201', N'C1201', N'R1201')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1202, N'P1202', N'C1202', N'R1202')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1203, N'P1203', N'C1203', N'R1203')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1204, N'P1204', N'C1204', N'R1204')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1205, N'P1205', N'C1205', N'R1205')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1206, N'P1206', N'C1206', N'R1206')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1207, N'P1207', N'C1207', N'R1207')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1208, N'P1208', N'C1208', N'R1208')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1209, N'P1209', N'C1209', N'R1209')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1210, N'P1210', N'C1210', N'R1210')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1211, N'P1211', N'C1211', N'R1211')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1212, N'P1212', N'C1212', N'R1212')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1213, N'P1213', N'C1213', N'R1213')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1214, N'P1214', N'C1214', N'R1214')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1215, N'P1215', N'C1215', N'R1215')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1216, N'P1216', N'C1216', N'R1216')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1217, N'P1217', N'C1217', N'R1217')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1218, N'P1218', N'C1218', N'R1218')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1219, N'P1219', N'C1219', N'R1219')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1220, N'P1220', N'C1220', N'R1220')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1221, N'P1221', N'C1221', N'R1221')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1222, N'P1222', N'C1222', N'R1222')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1223, N'P1223', N'C1223', N'R1223')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1224, N'P1224', N'C1224', N'R1224')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1225, N'P1225', N'C1225', N'R1225')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1226, N'P1226', N'C1226', N'R1226')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1227, N'P1227', N'C1227', N'R1227')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1228, N'P1228', N'C1228', N'R1228')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1229, N'P1229', N'C1229', N'R1229')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1230, N'P1230', N'C1230', N'R1230')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1231, N'P1231', N'C1231', N'R1231')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1232, N'P1232', N'C1232', N'R1232')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1233, N'P1233', N'C1233', N'R1233')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1234, N'P1234', N'C1234', N'R1234')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1235, N'P1235', N'C1235', N'R1235')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1236, N'P1236', N'C1236', N'R1236')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1237, N'P1237', N'C1237', N'R1237')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1238, N'P1238', N'C1238', N'R1238')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1239, N'P1239', N'C1239', N'R1239')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1240, N'P1240', N'C1240', N'R1240')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1241, N'P1241', N'C1241', N'R1241')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1242, N'P1242', N'C1242', N'R1242')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1243, N'P1243', N'C1243', N'R1243')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1244, N'P1244', N'C1244', N'R1244')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1245, N'P1245', N'C1245', N'R1245')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1246, N'P1246', N'C1246', N'R1246')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1247, N'P1247', N'C1247', N'R1247')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1248, N'P1248', N'C1248', N'R1248')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1249, N'P1249', N'C1249', N'R1249')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1250, N'P1250', N'C1250', N'R1250')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1251, N'P1251', N'C1251', N'R1251')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1252, N'P1252', N'C1252', N'R1252')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1253, N'P1253', N'C1253', N'R1253')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1254, N'P1254', N'C1254', N'R1254')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1255, N'P1255', N'C1255', N'R1255')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1256, N'P1256', N'C1256', N'R1256')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1257, N'P1257', N'C1257', N'R1257')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1258, N'P1258', N'C1258', N'R1258')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1259, N'P1259', N'C1259', N'R1259')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1260, N'P1260', N'C1260', N'R1260')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1261, N'P1261', N'C1261', N'R1261')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1262, N'P1262', N'C1262', N'R1262')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1263, N'P1263', N'C1263', N'R1263')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1264, N'P1264', N'C1264', N'R1264')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1265, N'P1265', N'C1265', N'R1265')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1266, N'P1266', N'C1266', N'R1266')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1267, N'P1267', N'C1267', N'R1267')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1268, N'P1268', N'C1268', N'R1268')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1269, N'P1269', N'C1269', N'R1269')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1270, N'P1270', N'C1270', N'R1270')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1271, N'P1271', N'C1271', N'R1271')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1272, N'P1272', N'C1272', N'R1272')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1273, N'P1273', N'C1273', N'R1273')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1274, N'P1274', N'C1274', N'R1274')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1275, N'P1275', N'C1275', N'R1275')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1276, N'P1276', N'C1276', N'R1276')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1277, N'P1277', N'C1277', N'R1277')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1278, N'P1278', N'C1278', N'R1278')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1279, N'P1279', N'C1279', N'R1279')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1280, N'P1280', N'C1280', N'R1280')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1281, N'P1281', N'C1281', N'R1281')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1282, N'P1282', N'C1282', N'R1282')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1283, N'P1283', N'C1283', N'R1283')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1284, N'P1284', N'C1284', N'R1284')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1285, N'P1285', N'C1285', N'R1285')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1286, N'P1286', N'C1286', N'R1286')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1287, N'P1287', N'C1287', N'R1287')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1288, N'P1288', N'C1288', N'R1288')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1289, N'P1289', N'C1289', N'R1289')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1290, N'P1290', N'C1290', N'R1290')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1291, N'P1291', N'C1291', N'R1291')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1292, N'P1292', N'C1292', N'R1292')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1293, N'P1293', N'C1293', N'R1293')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1294, N'P1294', N'C1294', N'R1294')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1295, N'P1295', N'C1295', N'R1295')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1296, N'P1296', N'C1296', N'R1296')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1297, N'P1297', N'C1297', N'R1297')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1298, N'P1298', N'C1298', N'R1298')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1299, N'P1299', N'C1299', N'R1299')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1300, N'P1300', N'C1300', N'R1300')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1301, N'P1301', N'C1301', N'R1301')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1302, N'P1302', N'C1302', N'R1302')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1303, N'P1303', N'C1303', N'R1303')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1304, N'P1304', N'C1304', N'R1304')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1305, N'P1305', N'C1305', N'R1305')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1306, N'P1306', N'C1306', N'R1306')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1307, N'P1307', N'C1307', N'R1307')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1308, N'P1308', N'C1308', N'R1308')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1309, N'P1309', N'C1309', N'R1309')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1310, N'P1310', N'C1310', N'R1310')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1311, N'P1311', N'C1311', N'R1311')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1312, N'P1312', N'C1312', N'R1312')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1313, N'P1313', N'C1313', N'R1313')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1314, N'P1314', N'C1314', N'R1314')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1315, N'P1315', N'C1315', N'R1315')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1316, N'P1316', N'C1316', N'R1316')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1317, N'P1317', N'C1317', N'R1317')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1318, N'P1318', N'C1318', N'R1318')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1319, N'P1319', N'C1319', N'R1319')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1320, N'P1320', N'C1320', N'R1320')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1321, N'P1321', N'C1321', N'R1321')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1322, N'P1322', N'C1322', N'R1322')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1323, N'P1323', N'C1323', N'R1323')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1324, N'P1324', N'C1324', N'R1324')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1325, N'P1325', N'C1325', N'R1325')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1326, N'P1326', N'C1326', N'R1326')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1327, N'P1327', N'C1327', N'R1327')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1328, N'P1328', N'C1328', N'R1328')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1329, N'P1329', N'C1329', N'R1329')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1330, N'P1330', N'C1330', N'R1330')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1331, N'P1331', N'C1331', N'R1331')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1332, N'P1332', N'C1332', N'R1332')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1333, N'P1333', N'C1333', N'R1333')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1334, N'P1334', N'C1334', N'R1334')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1335, N'P1335', N'C1335', N'R1335')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1336, N'P1336', N'C1336', N'R1336')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1337, N'P1337', N'C1337', N'R1337')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1338, N'P1338', N'C1338', N'R1338')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1339, N'P1339', N'C1339', N'R1339')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1340, N'P1340', N'C1340', N'R1340')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1341, N'P1341', N'C1341', N'R1341')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1342, N'P1342', N'C1342', N'R1342')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1343, N'P1343', N'C1343', N'R1343')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1344, N'P1344', N'C1344', N'R1344')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1345, N'P1345', N'C1345', N'R1345')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1346, N'P1346', N'C1346', N'R1346')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1347, N'P1347', N'C1347', N'R1347')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1348, N'P1348', N'C1348', N'R1348')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1349, N'P1349', N'C1349', N'R1349')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1350, N'P1350', N'C1350', N'R1350')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1351, N'P1351', N'C1351', N'R1351')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1352, N'P1352', N'C1352', N'R1352')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1353, N'P1353', N'C1353', N'R1353')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1354, N'P1354', N'C1354', N'R1354')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1355, N'P1355', N'C1355', N'R1355')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1356, N'P1356', N'C1356', N'R1356')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1357, N'P1357', N'C1357', N'R1357')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1358, N'P1358', N'C1358', N'R1358')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1359, N'P1359', N'C1359', N'R1359')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1360, N'P1360', N'C1360', N'R1360')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1361, N'P1361', N'C1361', N'R1361')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1362, N'P1362', N'C1362', N'R1362')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1363, N'P1363', N'C1363', N'R1363')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1364, N'P1364', N'C1364', N'R1364')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1365, N'P1365', N'C1365', N'R1365')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1366, N'P1366', N'C1366', N'R1366')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1367, N'P1367', N'C1367', N'R1367')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1368, N'P1368', N'C1368', N'R1368')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1369, N'P1369', N'C1369', N'R1369')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1370, N'P1370', N'C1370', N'R1370')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1371, N'P1371', N'C1371', N'R1371')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1372, N'P1372', N'C1372', N'R1372')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1373, N'P1373', N'C1373', N'R1373')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1374, N'P1374', N'C1374', N'R1374')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1375, N'P1375', N'C1375', N'R1375')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1376, N'P1376', N'C1376', N'R1376')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1377, N'P1377', N'C1377', N'R1377')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1378, N'P1378', N'C1378', N'R1378')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1379, N'P1379', N'C1379', N'R1379')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1380, N'P1380', N'C1380', N'R1380')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1381, N'P1381', N'C1381', N'R1381')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1382, N'P1382', N'C1382', N'R1382')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1383, N'P1383', N'C1383', N'R1383')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1384, N'P1384', N'C1384', N'R1384')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1385, N'P1385', N'C1385', N'R1385')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1386, N'P1386', N'C1386', N'R1386')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1387, N'P1387', N'C1387', N'R1387')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1388, N'P1388', N'C1388', N'R1388')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1389, N'P1389', N'C1389', N'R1389')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1390, N'P1390', N'C1390', N'R1390')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1391, N'P1391', N'C1391', N'R1391')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1392, N'P1392', N'C1392', N'R1392')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1393, N'P1393', N'C1393', N'R1393')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1394, N'P1394', N'C1394', N'R1394')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1395, N'P1395', N'C1395', N'R1395')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1396, N'P1396', N'C1396', N'R1396')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1397, N'P1397', N'C1397', N'R1397')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1398, N'P1398', N'C1398', N'R1398')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1399, N'P1399', N'C1399', N'R1399')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1400, N'P1400', N'C1400', N'R1400')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1401, N'P1401', N'C1401', N'R1401')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1402, N'P1402', N'C1402', N'R1402')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1403, N'P1403', N'C1403', N'R1403')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1404, N'P1404', N'C1404', N'R1404')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1405, N'P1405', N'C1405', N'R1405')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1406, N'P1406', N'C1406', N'R1406')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1407, N'P1407', N'C1407', N'R1407')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1408, N'P1408', N'C1408', N'R1408')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1409, N'P1409', N'C1409', N'R1409')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1410, N'P1410', N'C1410', N'R1410')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1411, N'P1411', N'C1411', N'R1411')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1412, N'P1412', N'C1412', N'R1412')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1413, N'P1413', N'C1413', N'R1413')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1414, N'P1414', N'C1414', N'R1414')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1415, N'P1415', N'C1415', N'R1415')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1416, N'P1416', N'C1416', N'R1416')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1417, N'P1417', N'C1417', N'R1417')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1418, N'P1418', N'C1418', N'R1418')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1419, N'P1419', N'C1419', N'R1419')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1420, N'P1420', N'C1420', N'R1420')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1421, N'P1421', N'C1421', N'R1421')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1422, N'P1422', N'C1422', N'R1422')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1423, N'P1423', N'C1423', N'R1423')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1424, N'P1424', N'C1424', N'R1424')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1425, N'P1425', N'C1425', N'R1425')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1426, N'P1426', N'C1426', N'R1426')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1427, N'P1427', N'C1427', N'R1427')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1428, N'P1428', N'C1428', N'R1428')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1429, N'P1429', N'C1429', N'R1429')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1430, N'P1430', N'C1430', N'R1430')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1431, N'P1431', N'C1431', N'R1431')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1432, N'P1432', N'C1432', N'R1432')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1433, N'P1433', N'C1433', N'R1433')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1434, N'P1434', N'C1434', N'R1434')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1435, N'P1435', N'C1435', N'R1435')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1436, N'P1436', N'C1436', N'R1436')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1437, N'P1437', N'C1437', N'R1437')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1438, N'P1438', N'C1438', N'R1438')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1439, N'P1439', N'C1439', N'R1439')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1440, N'P1440', N'C1440', N'R1440')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1441, N'P1441', N'C1441', N'R1441')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1442, N'P1442', N'C1442', N'R1442')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1443, N'P1443', N'C1443', N'R1443')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1444, N'P1444', N'C1444', N'R1444')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1445, N'P1445', N'C1445', N'R1445')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1446, N'P1446', N'C1446', N'R1446')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1447, N'P1447', N'C1447', N'R1447')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1448, N'P1448', N'C1448', N'R1448')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1449, N'P1449', N'C1449', N'R1449')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1450, N'P1450', N'C1450', N'R1450')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1451, N'P1451', N'C1451', N'R1451')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1452, N'P1452', N'C1452', N'R1452')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1453, N'P1453', N'C1453', N'R1453')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1454, N'P1454', N'C1454', N'R1454')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1455, N'P1455', N'C1455', N'R1455')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1456, N'P1456', N'C1456', N'R1456')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1457, N'P1457', N'C1457', N'R1457')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1458, N'P1458', N'C1458', N'R1458')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1459, N'P1459', N'C1459', N'R1459')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1460, N'P1460', N'C1460', N'R1460')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1461, N'P1461', N'C1461', N'R1461')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1462, N'P1462', N'C1462', N'R1462')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1463, N'P1463', N'C1463', N'R1463')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1464, N'P1464', N'C1464', N'R1464')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1465, N'P1465', N'C1465', N'R1465')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1466, N'P1466', N'C1466', N'R1466')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1467, N'P1467', N'C1467', N'R1467')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1468, N'P1468', N'C1468', N'R1468')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1469, N'P1469', N'C1469', N'R1469')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1470, N'P1470', N'C1470', N'R1470')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1471, N'P1471', N'C1471', N'R1471')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1472, N'P1472', N'C1472', N'R1472')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1473, N'P1473', N'C1473', N'R1473')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1474, N'P1474', N'C1474', N'R1474')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1475, N'P1475', N'C1475', N'R1475')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1476, N'P1476', N'C1476', N'R1476')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1477, N'P1477', N'C1477', N'R1477')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1478, N'P1478', N'C1478', N'R1478')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1479, N'P1479', N'C1479', N'R1479')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1480, N'P1480', N'C1480', N'R1480')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1481, N'P1481', N'C1481', N'R1481')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1482, N'P1482', N'C1482', N'R1482')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1483, N'P1483', N'C1483', N'R1483')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1484, N'P1484', N'C1484', N'R1484')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1485, N'P1485', N'C1485', N'R1485')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1486, N'P1486', N'C1486', N'R1486')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1487, N'P1487', N'C1487', N'R1487')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1488, N'P1488', N'C1488', N'R1488')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1489, N'P1489', N'C1489', N'R1489')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1490, N'P1490', N'C1490', N'R1490')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1491, N'P1491', N'C1491', N'R1491')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1492, N'P1492', N'C1492', N'R1492')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1493, N'P1493', N'C1493', N'R1493')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1494, N'P1494', N'C1494', N'R1494')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1495, N'P1495', N'C1495', N'R1495')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1496, N'P1496', N'C1496', N'R1496')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1497, N'P1497', N'C1497', N'R1497')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1498, N'P1498', N'C1498', N'R1498')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1499, N'P1499', N'C1499', N'R1499')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1500, N'P1500', N'C1500', N'R1500')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1501, N'P1501', N'C1501', N'R1501')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1502, N'P1502', N'C1502', N'R1502')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1503, N'P1503', N'C1503', N'R1503')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1504, N'P1504', N'C1504', N'R1504')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1505, N'P1505', N'C1505', N'R1505')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1506, N'P1506', N'C1506', N'R1506')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1507, N'P1507', N'C1507', N'R1507')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1508, N'P1508', N'C1508', N'R1508')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1509, N'P1509', N'C1509', N'R1509')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1510, N'P1510', N'C1510', N'R1510')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1511, N'P1511', N'C1511', N'R1511')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1512, N'P1512', N'C1512', N'R1512')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1513, N'P1513', N'C1513', N'R1513')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1514, N'P1514', N'C1514', N'R1514')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1515, N'P1515', N'C1515', N'R1515')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1516, N'P1516', N'C1516', N'R1516')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1517, N'P1517', N'C1517', N'R1517')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1518, N'P1518', N'C1518', N'R1518')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1519, N'P1519', N'C1519', N'R1519')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1520, N'P1520', N'C1520', N'R1520')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1521, N'P1521', N'C1521', N'R1521')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1522, N'P1522', N'C1522', N'R1522')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1523, N'P1523', N'C1523', N'R1523')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1524, N'P1524', N'C1524', N'R1524')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1525, N'P1525', N'C1525', N'R1525')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1526, N'P1526', N'C1526', N'R1526')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1527, N'P1527', N'C1527', N'R1527')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1528, N'P1528', N'C1528', N'R1528')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1529, N'P1529', N'C1529', N'R1529')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1530, N'P1530', N'C1530', N'R1530')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1531, N'P1531', N'C1531', N'R1531')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1532, N'P1532', N'C1532', N'R1532')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1533, N'P1533', N'C1533', N'R1533')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1534, N'P1534', N'C1534', N'R1534')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1535, N'P1535', N'C1535', N'R1535')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1536, N'P1536', N'C1536', N'R1536')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1537, N'P1537', N'C1537', N'R1537')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1538, N'P1538', N'C1538', N'R1538')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1539, N'P1539', N'C1539', N'R1539')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1540, N'P1540', N'C1540', N'R1540')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1541, N'P1541', N'C1541', N'R1541')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1542, N'P1542', N'C1542', N'R1542')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1543, N'P1543', N'C1543', N'R1543')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1544, N'P1544', N'C1544', N'R1544')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1545, N'P1545', N'C1545', N'R1545')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1546, N'P1546', N'C1546', N'R1546')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1547, N'P1547', N'C1547', N'R1547')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1548, N'P1548', N'C1548', N'R1548')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1549, N'P1549', N'C1549', N'R1549')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1550, N'P1550', N'C1550', N'R1550')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1551, N'P1551', N'C1551', N'R1551')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1552, N'P1552', N'C1552', N'R1552')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1553, N'P1553', N'C1553', N'R1553')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1554, N'P1554', N'C1554', N'R1554')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1555, N'P1555', N'C1555', N'R1555')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1556, N'P1556', N'C1556', N'R1556')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1557, N'P1557', N'C1557', N'R1557')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1558, N'P1558', N'C1558', N'R1558')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1559, N'P1559', N'C1559', N'R1559')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1560, N'P1560', N'C1560', N'R1560')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1561, N'P1561', N'C1561', N'R1561')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1562, N'P1562', N'C1562', N'R1562')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1563, N'P1563', N'C1563', N'R1563')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1564, N'P1564', N'C1564', N'R1564')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1565, N'P1565', N'C1565', N'R1565')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1566, N'P1566', N'C1566', N'R1566')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1567, N'P1567', N'C1567', N'R1567')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1568, N'P1568', N'C1568', N'R1568')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1569, N'P1569', N'C1569', N'R1569')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1570, N'P1570', N'C1570', N'R1570')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1571, N'P1571', N'C1571', N'R1571')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1572, N'P1572', N'C1572', N'R1572')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1573, N'P1573', N'C1573', N'R1573')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1574, N'P1574', N'C1574', N'R1574')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1575, N'P1575', N'C1575', N'R1575')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1576, N'P1576', N'C1576', N'R1576')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1577, N'P1577', N'C1577', N'R1577')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1578, N'P1578', N'C1578', N'R1578')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1579, N'P1579', N'C1579', N'R1579')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1580, N'P1580', N'C1580', N'R1580')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1581, N'P1581', N'C1581', N'R1581')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1582, N'P1582', N'C1582', N'R1582')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1583, N'P1583', N'C1583', N'R1583')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1584, N'P1584', N'C1584', N'R1584')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1585, N'P1585', N'C1585', N'R1585')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1586, N'P1586', N'C1586', N'R1586')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1587, N'P1587', N'C1587', N'R1587')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1588, N'P1588', N'C1588', N'R1588')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1589, N'P1589', N'C1589', N'R1589')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1590, N'P1590', N'C1590', N'R1590')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1591, N'P1591', N'C1591', N'R1591')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1592, N'P1592', N'C1592', N'R1592')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1593, N'P1593', N'C1593', N'R1593')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1594, N'P1594', N'C1594', N'R1594')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1595, N'P1595', N'C1595', N'R1595')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1596, N'P1596', N'C1596', N'R1596')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1597, N'P1597', N'C1597', N'R1597')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1598, N'P1598', N'C1598', N'R1598')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1599, N'P1599', N'C1599', N'R1599')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1600, N'P1600', N'C1600', N'R1600')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1601, N'P1601', N'C1601', N'R1601')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1602, N'P1602', N'C1602', N'R1602')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1603, N'P1603', N'C1603', N'R1603')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1604, N'P1604', N'C1604', N'R1604')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1605, N'P1605', N'C1605', N'R1605')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1606, N'P1606', N'C1606', N'R1606')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1607, N'P1607', N'C1607', N'R1607')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1608, N'P1608', N'C1608', N'R1608')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1609, N'P1609', N'C1609', N'R1609')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1610, N'P1610', N'C1610', N'R1610')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1611, N'P1611', N'C1611', N'R1611')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1612, N'P1612', N'C1612', N'R1612')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1613, N'P1613', N'C1613', N'R1613')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1614, N'P1614', N'C1614', N'R1614')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1615, N'P1615', N'C1615', N'R1615')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1616, N'P1616', N'C1616', N'R1616')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1617, N'P1617', N'C1617', N'R1617')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1618, N'P1618', N'C1618', N'R1618')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1619, N'P1619', N'C1619', N'R1619')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1620, N'P1620', N'C1620', N'R1620')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1621, N'P1621', N'C1621', N'R1621')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1622, N'P1622', N'C1622', N'R1622')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1623, N'P1623', N'C1623', N'R1623')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1624, N'P1624', N'C1624', N'R1624')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1625, N'P1625', N'C1625', N'R1625')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1626, N'P1626', N'C1626', N'R1626')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1627, N'P1627', N'C1627', N'R1627')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1628, N'P1628', N'C1628', N'R1628')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1629, N'P1629', N'C1629', N'R1629')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1630, N'P1630', N'C1630', N'R1630')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1631, N'P1631', N'C1631', N'R1631')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1632, N'P1632', N'C1632', N'R1632')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1633, N'P1633', N'C1633', N'R1633')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1634, N'P1634', N'C1634', N'R1634')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1635, N'P1635', N'C1635', N'R1635')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1636, N'P1636', N'C1636', N'R1636')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1637, N'P1637', N'C1637', N'R1637')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1638, N'P1638', N'C1638', N'R1638')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1639, N'P1639', N'C1639', N'R1639')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1640, N'P1640', N'C1640', N'R1640')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1641, N'P1641', N'C1641', N'R1641')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1642, N'P1642', N'C1642', N'R1642')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1643, N'P1643', N'C1643', N'R1643')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1644, N'P1644', N'C1644', N'R1644')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1645, N'P1645', N'C1645', N'R1645')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1646, N'P1646', N'C1646', N'R1646')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1647, N'P1647', N'C1647', N'R1647')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1648, N'P1648', N'C1648', N'R1648')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1649, N'P1649', N'C1649', N'R1649')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1650, N'P1650', N'C1650', N'R1650')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1651, N'P1651', N'C1651', N'R1651')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1652, N'P1652', N'C1652', N'R1652')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1653, N'P1653', N'C1653', N'R1653')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1654, N'P1654', N'C1654', N'R1654')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1655, N'P1655', N'C1655', N'R1655')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1656, N'P1656', N'C1656', N'R1656')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1657, N'P1657', N'C1657', N'R1657')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1658, N'P1658', N'C1658', N'R1658')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1659, N'P1659', N'C1659', N'R1659')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1660, N'P1660', N'C1660', N'R1660')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1661, N'P1661', N'C1661', N'R1661')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1662, N'P1662', N'C1662', N'R1662')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1663, N'P1663', N'C1663', N'R1663')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1664, N'P1664', N'C1664', N'R1664')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1665, N'P1665', N'C1665', N'R1665')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1666, N'P1666', N'C1666', N'R1666')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1667, N'P1667', N'C1667', N'R1667')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1668, N'P1668', N'C1668', N'R1668')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1669, N'P1669', N'C1669', N'R1669')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1670, N'P1670', N'C1670', N'R1670')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1671, N'P1671', N'C1671', N'R1671')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1672, N'P1672', N'C1672', N'R1672')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1673, N'P1673', N'C1673', N'R1673')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1674, N'P1674', N'C1674', N'R1674')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1675, N'P1675', N'C1675', N'R1675')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1676, N'P1676', N'C1676', N'R1676')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1677, N'P1677', N'C1677', N'R1677')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1678, N'P1678', N'C1678', N'R1678')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1679, N'P1679', N'C1679', N'R1679')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1680, N'P1680', N'C1680', N'R1680')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1681, N'P1681', N'C1681', N'R1681')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1682, N'P1682', N'C1682', N'R1682')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1683, N'P1683', N'C1683', N'R1683')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1684, N'P1684', N'C1684', N'R1684')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1685, N'P1685', N'C1685', N'R1685')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1686, N'P1686', N'C1686', N'R1686')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1687, N'P1687', N'C1687', N'R1687')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1688, N'P1688', N'C1688', N'R1688')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1689, N'P1689', N'C1689', N'R1689')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1690, N'P1690', N'C1690', N'R1690')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1691, N'P1691', N'C1691', N'R1691')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1692, N'P1692', N'C1692', N'R1692')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1693, N'P1693', N'C1693', N'R1693')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1694, N'P1694', N'C1694', N'R1694')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1695, N'P1695', N'C1695', N'R1695')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1696, N'P1696', N'C1696', N'R1696')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1697, N'P1697', N'C1697', N'R1697')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1698, N'P1698', N'C1698', N'R1698')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1699, N'P1699', N'C1699', N'R1699')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1700, N'P1700', N'C1700', N'R1700')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1701, N'P1701', N'C1701', N'R1701')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1702, N'P1702', N'C1702', N'R1702')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1703, N'P1703', N'C1703', N'R1703')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1704, N'P1704', N'C1704', N'R1704')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1705, N'P1705', N'C1705', N'R1705')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1706, N'P1706', N'C1706', N'R1706')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1707, N'P1707', N'C1707', N'R1707')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1708, N'P1708', N'C1708', N'R1708')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1709, N'P1709', N'C1709', N'R1709')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1710, N'P1710', N'C1710', N'R1710')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1711, N'P1711', N'C1711', N'R1711')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1712, N'P1712', N'C1712', N'R1712')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1713, N'P1713', N'C1713', N'R1713')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1714, N'P1714', N'C1714', N'R1714')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1715, N'P1715', N'C1715', N'R1715')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1716, N'P1716', N'C1716', N'R1716')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1717, N'P1717', N'C1717', N'R1717')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1718, N'P1718', N'C1718', N'R1718')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1719, N'P1719', N'C1719', N'R1719')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1720, N'P1720', N'C1720', N'R1720')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1721, N'P1721', N'C1721', N'R1721')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1722, N'P1722', N'C1722', N'R1722')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1723, N'P1723', N'C1723', N'R1723')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1724, N'P1724', N'C1724', N'R1724')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1725, N'P1725', N'C1725', N'R1725')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1726, N'P1726', N'C1726', N'R1726')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1727, N'P1727', N'C1727', N'R1727')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1728, N'P1728', N'C1728', N'R1728')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1729, N'P1729', N'C1729', N'R1729')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1730, N'P1730', N'C1730', N'R1730')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1731, N'P1731', N'C1731', N'R1731')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1732, N'P1732', N'C1732', N'R1732')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1733, N'P1733', N'C1733', N'R1733')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1734, N'P1734', N'C1734', N'R1734')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1735, N'P1735', N'C1735', N'R1735')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1736, N'P1736', N'C1736', N'R1736')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1737, N'P1737', N'C1737', N'R1737')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1738, N'P1738', N'C1738', N'R1738')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1739, N'P1739', N'C1739', N'R1739')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1740, N'P1740', N'C1740', N'R1740')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1741, N'P1741', N'C1741', N'R1741')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1742, N'P1742', N'C1742', N'R1742')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1743, N'P1743', N'C1743', N'R1743')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1744, N'P1744', N'C1744', N'R1744')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1745, N'P1745', N'C1745', N'R1745')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1746, N'P1746', N'C1746', N'R1746')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1747, N'P1747', N'C1747', N'R1747')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1748, N'P1748', N'C1748', N'R1748')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1749, N'P1749', N'C1749', N'R1749')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1750, N'P1750', N'C1750', N'R1750')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1751, N'P1751', N'C1751', N'R1751')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1752, N'P1752', N'C1752', N'R1752')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1753, N'P1753', N'C1753', N'R1753')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1754, N'P1754', N'C1754', N'R1754')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1755, N'P1755', N'C1755', N'R1755')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1756, N'P1756', N'C1756', N'R1756')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1757, N'P1757', N'C1757', N'R1757')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1758, N'P1758', N'C1758', N'R1758')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1759, N'P1759', N'C1759', N'R1759')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1760, N'P1760', N'C1760', N'R1760')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1761, N'P1761', N'C1761', N'R1761')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1762, N'P1762', N'C1762', N'R1762')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1763, N'P1763', N'C1763', N'R1763')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1764, N'P1764', N'C1764', N'R1764')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1765, N'P1765', N'C1765', N'R1765')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1766, N'P1766', N'C1766', N'R1766')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1767, N'P1767', N'C1767', N'R1767')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1768, N'P1768', N'C1768', N'R1768')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1769, N'P1769', N'C1769', N'R1769')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1770, N'P1770', N'C1770', N'R1770')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1771, N'P1771', N'C1771', N'R1771')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1772, N'P1772', N'C1772', N'R1772')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1773, N'P1773', N'C1773', N'R1773')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1774, N'P1774', N'C1774', N'R1774')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1775, N'P1775', N'C1775', N'R1775')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1776, N'P1776', N'C1776', N'R1776')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1777, N'P1777', N'C1777', N'R1777')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1778, N'P1778', N'C1778', N'R1778')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1779, N'P1779', N'C1779', N'R1779')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1780, N'P1780', N'C1780', N'R1780')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1781, N'P1781', N'C1781', N'R1781')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1782, N'P1782', N'C1782', N'R1782')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1783, N'P1783', N'C1783', N'R1783')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1784, N'P1784', N'C1784', N'R1784')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1785, N'P1785', N'C1785', N'R1785')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1786, N'P1786', N'C1786', N'R1786')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1787, N'P1787', N'C1787', N'R1787')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1788, N'P1788', N'C1788', N'R1788')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1789, N'P1789', N'C1789', N'R1789')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1790, N'P1790', N'C1790', N'R1790')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1791, N'P1791', N'C1791', N'R1791')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1792, N'P1792', N'C1792', N'R1792')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1793, N'P1793', N'C1793', N'R1793')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1794, N'P1794', N'C1794', N'R1794')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1795, N'P1795', N'C1795', N'R1795')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1796, N'P1796', N'C1796', N'R1796')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1797, N'P1797', N'C1797', N'R1797')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1798, N'P1798', N'C1798', N'R1798')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1799, N'P1799', N'C1799', N'R1799')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1800, N'P1800', N'C1800', N'R1800')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1801, N'P1801', N'C1801', N'R1801')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1802, N'P1802', N'C1802', N'R1802')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1803, N'P1803', N'C1803', N'R1803')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1804, N'P1804', N'C1804', N'R1804')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1805, N'P1805', N'C1805', N'R1805')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1806, N'P1806', N'C1806', N'R1806')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1807, N'P1807', N'C1807', N'R1807')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1808, N'P1808', N'C1808', N'R1808')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1809, N'P1809', N'C1809', N'R1809')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1810, N'P1810', N'C1810', N'R1810')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1811, N'P1811', N'C1811', N'R1811')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1812, N'P1812', N'C1812', N'R1812')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1813, N'P1813', N'C1813', N'R1813')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1814, N'P1814', N'C1814', N'R1814')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1815, N'P1815', N'C1815', N'R1815')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1816, N'P1816', N'C1816', N'R1816')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1817, N'P1817', N'C1817', N'R1817')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1818, N'P1818', N'C1818', N'R1818')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1819, N'P1819', N'C1819', N'R1819')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1820, N'P1820', N'C1820', N'R1820')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1821, N'P1821', N'C1821', N'R1821')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1822, N'P1822', N'C1822', N'R1822')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1823, N'P1823', N'C1823', N'R1823')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1824, N'P1824', N'C1824', N'R1824')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1825, N'P1825', N'C1825', N'R1825')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1826, N'P1826', N'C1826', N'R1826')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1827, N'P1827', N'C1827', N'R1827')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1828, N'P1828', N'C1828', N'R1828')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1829, N'P1829', N'C1829', N'R1829')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1830, N'P1830', N'C1830', N'R1830')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1831, N'P1831', N'C1831', N'R1831')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1832, N'P1832', N'C1832', N'R1832')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1833, N'P1833', N'C1833', N'R1833')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1834, N'P1834', N'C1834', N'R1834')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1835, N'P1835', N'C1835', N'R1835')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1836, N'P1836', N'C1836', N'R1836')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1837, N'P1837', N'C1837', N'R1837')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1838, N'P1838', N'C1838', N'R1838')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1839, N'P1839', N'C1839', N'R1839')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1840, N'P1840', N'C1840', N'R1840')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1841, N'P1841', N'C1841', N'R1841')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1842, N'P1842', N'C1842', N'R1842')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1843, N'P1843', N'C1843', N'R1843')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1844, N'P1844', N'C1844', N'R1844')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1845, N'P1845', N'C1845', N'R1845')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1846, N'P1846', N'C1846', N'R1846')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1847, N'P1847', N'C1847', N'R1847')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1848, N'P1848', N'C1848', N'R1848')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1849, N'P1849', N'C1849', N'R1849')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1850, N'P1850', N'C1850', N'R1850')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1851, N'P1851', N'C1851', N'R1851')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1852, N'P1852', N'C1852', N'R1852')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1853, N'P1853', N'C1853', N'R1853')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1854, N'P1854', N'C1854', N'R1854')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1855, N'P1855', N'C1855', N'R1855')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1856, N'P1856', N'C1856', N'R1856')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1857, N'P1857', N'C1857', N'R1857')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1858, N'P1858', N'C1858', N'R1858')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1859, N'P1859', N'C1859', N'R1859')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1860, N'P1860', N'C1860', N'R1860')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1861, N'P1861', N'C1861', N'R1861')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1862, N'P1862', N'C1862', N'R1862')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1863, N'P1863', N'C1863', N'R1863')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1864, N'P1864', N'C1864', N'R1864')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1865, N'P1865', N'C1865', N'R1865')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1866, N'P1866', N'C1866', N'R1866')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1867, N'P1867', N'C1867', N'R1867')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1868, N'P1868', N'C1868', N'R1868')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1869, N'P1869', N'C1869', N'R1869')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1870, N'P1870', N'C1870', N'R1870')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1871, N'P1871', N'C1871', N'R1871')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1872, N'P1872', N'C1872', N'R1872')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1873, N'P1873', N'C1873', N'R1873')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1874, N'P1874', N'C1874', N'R1874')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1875, N'P1875', N'C1875', N'R1875')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1876, N'P1876', N'C1876', N'R1876')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1877, N'P1877', N'C1877', N'R1877')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1878, N'P1878', N'C1878', N'R1878')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1879, N'P1879', N'C1879', N'R1879')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1880, N'P1880', N'C1880', N'R1880')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1881, N'P1881', N'C1881', N'R1881')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1882, N'P1882', N'C1882', N'R1882')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1883, N'P1883', N'C1883', N'R1883')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1884, N'P1884', N'C1884', N'R1884')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1885, N'P1885', N'C1885', N'R1885')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1886, N'P1886', N'C1886', N'R1886')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1887, N'P1887', N'C1887', N'R1887')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1888, N'P1888', N'C1888', N'R1888')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1889, N'P1889', N'C1889', N'R1889')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1890, N'P1890', N'C1890', N'R1890')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1891, N'P1891', N'C1891', N'R1891')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1892, N'P1892', N'C1892', N'R1892')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1893, N'P1893', N'C1893', N'R1893')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1894, N'P1894', N'C1894', N'R1894')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1895, N'P1895', N'C1895', N'R1895')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1896, N'P1896', N'C1896', N'R1896')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1897, N'P1897', N'C1897', N'R1897')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1898, N'P1898', N'C1898', N'R1898')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1899, N'P1899', N'C1899', N'R1899')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1900, N'P1900', N'C1900', N'R1900')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1901, N'P1901', N'C1901', N'R1901')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1902, N'P1902', N'C1902', N'R1902')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1903, N'P1903', N'C1903', N'R1903')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1904, N'P1904', N'C1904', N'R1904')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1905, N'P1905', N'C1905', N'R1905')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1906, N'P1906', N'C1906', N'R1906')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1907, N'P1907', N'C1907', N'R1907')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1908, N'P1908', N'C1908', N'R1908')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1909, N'P1909', N'C1909', N'R1909')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1910, N'P1910', N'C1910', N'R1910')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1911, N'P1911', N'C1911', N'R1911')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1912, N'P1912', N'C1912', N'R1912')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1913, N'P1913', N'C1913', N'R1913')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1914, N'P1914', N'C1914', N'R1914')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1915, N'P1915', N'C1915', N'R1915')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1916, N'P1916', N'C1916', N'R1916')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1917, N'P1917', N'C1917', N'R1917')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1918, N'P1918', N'C1918', N'R1918')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1919, N'P1919', N'C1919', N'R1919')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1920, N'P1920', N'C1920', N'R1920')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1921, N'P1921', N'C1921', N'R1921')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1922, N'P1922', N'C1922', N'R1922')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1923, N'P1923', N'C1923', N'R1923')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1924, N'P1924', N'C1924', N'R1924')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1925, N'P1925', N'C1925', N'R1925')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1926, N'P1926', N'C1926', N'R1926')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1927, N'P1927', N'C1927', N'R1927')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1928, N'P1928', N'C1928', N'R1928')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1929, N'P1929', N'C1929', N'R1929')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1930, N'P1930', N'C1930', N'R1930')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1931, N'P1931', N'C1931', N'R1931')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1932, N'P1932', N'C1932', N'R1932')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1933, N'P1933', N'C1933', N'R1933')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1934, N'P1934', N'C1934', N'R1934')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1935, N'P1935', N'C1935', N'R1935')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1936, N'P1936', N'C1936', N'R1936')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1937, N'P1937', N'C1937', N'R1937')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1938, N'P1938', N'C1938', N'R1938')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1939, N'P1939', N'C1939', N'R1939')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1940, N'P1940', N'C1940', N'R1940')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1941, N'P1941', N'C1941', N'R1941')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1942, N'P1942', N'C1942', N'R1942')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1943, N'P1943', N'C1943', N'R1943')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1944, N'P1944', N'C1944', N'R1944')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1945, N'P1945', N'C1945', N'R1945')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1946, N'P1946', N'C1946', N'R1946')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1947, N'P1947', N'C1947', N'R1947')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1948, N'P1948', N'C1948', N'R1948')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1949, N'P1949', N'C1949', N'R1949')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1950, N'P1950', N'C1950', N'R1950')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1951, N'P1951', N'C1951', N'R1951')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1952, N'P1952', N'C1952', N'R1952')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1953, N'P1953', N'C1953', N'R1953')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1954, N'P1954', N'C1954', N'R1954')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1955, N'P1955', N'C1955', N'R1955')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1956, N'P1956', N'C1956', N'R1956')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1957, N'P1957', N'C1957', N'R1957')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1958, N'P1958', N'C1958', N'R1958')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1959, N'P1959', N'C1959', N'R1959')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1960, N'P1960', N'C1960', N'R1960')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1961, N'P1961', N'C1961', N'R1961')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1962, N'P1962', N'C1962', N'R1962')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1963, N'P1963', N'C1963', N'R1963')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1964, N'P1964', N'C1964', N'R1964')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1965, N'P1965', N'C1965', N'R1965')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1966, N'P1966', N'C1966', N'R1966')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1967, N'P1967', N'C1967', N'R1967')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1968, N'P1968', N'C1968', N'R1968')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1969, N'P1969', N'C1969', N'R1969')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1970, N'P1970', N'C1970', N'R1970')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1971, N'P1971', N'C1971', N'R1971')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1972, N'P1972', N'C1972', N'R1972')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1973, N'P1973', N'C1973', N'R1973')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1974, N'P1974', N'C1974', N'R1974')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1975, N'P1975', N'C1975', N'R1975')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1976, N'P1976', N'C1976', N'R1976')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1977, N'P1977', N'C1977', N'R1977')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1978, N'P1978', N'C1978', N'R1978')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1979, N'P1979', N'C1979', N'R1979')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1980, N'P1980', N'C1980', N'R1980')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1981, N'P1981', N'C1981', N'R1981')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1982, N'P1982', N'C1982', N'R1982')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1983, N'P1983', N'C1983', N'R1983')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1984, N'P1984', N'C1984', N'R1984')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1985, N'P1985', N'C1985', N'R1985')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1986, N'P1986', N'C1986', N'R1986')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1987, N'P1987', N'C1987', N'R1987')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1988, N'P1988', N'C1988', N'R1988')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1989, N'P1989', N'C1989', N'R1989')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1990, N'P1990', N'C1990', N'R1990')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1991, N'P1991', N'C1991', N'R1991')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1992, N'P1992', N'C1992', N'R1992')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1993, N'P1993', N'C1993', N'R1993')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1994, N'P1994', N'C1994', N'R1994')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1995, N'P1995', N'C1995', N'R1995')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1996, N'P1996', N'C1996', N'R1996')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1997, N'P1997', N'C1997', N'R1997')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1998, N'P1998', N'C1998', N'R1998')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (1999, N'P1999', N'C1999', N'R1999')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2000, N'P2000', N'C2000', N'R2000')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2001, N'P2001', N'C2001', N'R2001')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2002, N'P2002', N'C2002', N'R2002')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2003, N'P2003', N'C2003', N'R2003')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2004, N'P2004', N'C2004', N'R2004')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2005, N'P2005', N'C2005', N'R2005')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2006, N'P2006', N'C2006', N'R2006')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2007, N'P2007', N'C2007', N'R2007')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2008, N'P2008', N'C2008', N'R2008')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2009, N'P2009', N'C2009', N'R2009')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2010, N'P2010', N'C2010', N'R2010')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2011, N'P2011', N'C2011', N'R2011')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2012, N'P2012', N'C2012', N'R2012')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2013, N'P2013', N'C2013', N'R2013')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2014, N'P2014', N'C2014', N'R2014')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2015, N'P2015', N'C2015', N'R2015')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2016, N'P2016', N'C2016', N'R2016')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2017, N'P2017', N'C2017', N'R2017')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2018, N'P2018', N'C2018', N'R2018')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2019, N'P2019', N'C2019', N'R2019')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2020, N'P2020', N'C2020', N'R2020')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2021, N'P2021', N'C2021', N'R2021')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2022, N'P2022', N'C2022', N'R2022')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2023, N'P2023', N'C2023', N'R2023')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2024, N'P2024', N'C2024', N'R2024')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2025, N'P2025', N'C2025', N'R2025')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2026, N'P2026', N'C2026', N'R2026')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2027, N'P2027', N'C2027', N'R2027')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2028, N'P2028', N'C2028', N'R2028')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2029, N'P2029', N'C2029', N'R2029')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2030, N'P2030', N'C2030', N'R2030')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2031, N'P2031', N'C2031', N'R2031')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2032, N'P2032', N'C2032', N'R2032')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2033, N'P2033', N'C2033', N'R2033')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2034, N'P2034', N'C2034', N'R2034')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2035, N'P2035', N'C2035', N'R2035')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2036, N'P2036', N'C2036', N'R2036')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2037, N'P2037', N'C2037', N'R2037')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2038, N'P2038', N'C2038', N'R2038')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2039, N'P2039', N'C2039', N'R2039')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2040, N'P2040', N'C2040', N'R2040')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2041, N'P2041', N'C2041', N'R2041')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2042, N'P2042', N'C2042', N'R2042')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2043, N'P2043', N'C2043', N'R2043')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2044, N'P2044', N'C2044', N'R2044')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2045, N'P2045', N'C2045', N'R2045')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2046, N'P2046', N'C2046', N'R2046')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2047, N'P2047', N'C2047', N'R2047')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2048, N'P2048', N'C2048', N'R2048')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2049, N'P2049', N'C2049', N'R2049')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2050, N'P2050', N'C2050', N'R2050')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2051, N'P2051', N'C2051', N'R2051')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2052, N'P2052', N'C2052', N'R2052')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2053, N'P2053', N'C2053', N'R2053')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2054, N'P2054', N'C2054', N'R2054')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2055, N'P2055', N'C2055', N'R2055')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2056, N'P2056', N'C2056', N'R2056')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2057, N'P2057', N'C2057', N'R2057')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2058, N'P2058', N'C2058', N'R2058')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2059, N'P2059', N'C2059', N'R2059')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2060, N'P2060', N'C2060', N'R2060')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2061, N'P2061', N'C2061', N'R2061')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2062, N'P2062', N'C2062', N'R2062')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2063, N'P2063', N'C2063', N'R2063')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2064, N'P2064', N'C2064', N'R2064')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2065, N'P2065', N'C2065', N'R2065')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2066, N'P2066', N'C2066', N'R2066')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2067, N'P2067', N'C2067', N'R2067')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2068, N'P2068', N'C2068', N'R2068')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2069, N'P2069', N'C2069', N'R2069')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2070, N'P2070', N'C2070', N'R2070')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2071, N'P2071', N'C2071', N'R2071')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2072, N'P2072', N'C2072', N'R2072')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2073, N'P2073', N'C2073', N'R2073')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2074, N'P2074', N'C2074', N'R2074')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2075, N'P2075', N'C2075', N'R2075')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2076, N'P2076', N'C2076', N'R2076')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2077, N'P2077', N'C2077', N'R2077')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2078, N'P2078', N'C2078', N'R2078')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2079, N'P2079', N'C2079', N'R2079')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2080, N'P2080', N'C2080', N'R2080')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2081, N'P2081', N'C2081', N'R2081')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2082, N'P2082', N'C2082', N'R2082')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2083, N'P2083', N'C2083', N'R2083')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2084, N'P2084', N'C2084', N'R2084')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2085, N'P2085', N'C2085', N'R2085')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2086, N'P2086', N'C2086', N'R2086')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2087, N'P2087', N'C2087', N'R2087')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2088, N'P2088', N'C2088', N'R2088')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2089, N'P2089', N'C2089', N'R2089')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2090, N'P2090', N'C2090', N'R2090')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2091, N'P2091', N'C2091', N'R2091')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2092, N'P2092', N'C2092', N'R2092')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2093, N'P2093', N'C2093', N'R2093')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2094, N'P2094', N'C2094', N'R2094')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2095, N'P2095', N'C2095', N'R2095')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2096, N'P2096', N'C2096', N'R2096')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2097, N'P2097', N'C2097', N'R2097')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2098, N'P2098', N'C2098', N'R2098')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2099, N'P2099', N'C2099', N'R2099')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2100, N'P2100', N'C2100', N'R2100')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2101, N'P2101', N'C2101', N'R2101')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2102, N'P2102', N'C2102', N'R2102')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2103, N'P2103', N'C2103', N'R2103')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2104, N'P2104', N'C2104', N'R2104')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2105, N'P2105', N'C2105', N'R2105')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2106, N'P2106', N'C2106', N'R2106')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2107, N'P2107', N'C2107', N'R2107')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2108, N'P2108', N'C2108', N'R2108')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2109, N'P2109', N'C2109', N'R2109')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2110, N'P2110', N'C2110', N'R2110')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2111, N'P2111', N'C2111', N'R2111')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2112, N'P2112', N'C2112', N'R2112')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2113, N'P2113', N'C2113', N'R2113')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2114, N'P2114', N'C2114', N'R2114')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2115, N'P2115', N'C2115', N'R2115')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2116, N'P2116', N'C2116', N'R2116')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2117, N'P2117', N'C2117', N'R2117')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2118, N'P2118', N'C2118', N'R2118')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2119, N'P2119', N'C2119', N'R2119')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2120, N'P2120', N'C2120', N'R2120')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2121, N'P2121', N'C2121', N'R2121')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2122, N'P2122', N'C2122', N'R2122')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2123, N'P2123', N'C2123', N'R2123')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2124, N'P2124', N'C2124', N'R2124')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2125, N'P2125', N'C2125', N'R2125')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2126, N'P2126', N'C2126', N'R2126')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2127, N'P2127', N'C2127', N'R2127')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2128, N'P2128', N'C2128', N'R2128')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2129, N'P2129', N'C2129', N'R2129')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2130, N'P2130', N'C2130', N'R2130')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2131, N'P2131', N'C2131', N'R2131')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2132, N'P2132', N'C2132', N'R2132')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2133, N'P2133', N'C2133', N'R2133')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2134, N'P2134', N'C2134', N'R2134')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2135, N'P2135', N'C2135', N'R2135')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2136, N'P2136', N'C2136', N'R2136')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2137, N'P2137', N'C2137', N'R2137')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2138, N'P2138', N'C2138', N'R2138')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2139, N'P2139', N'C2139', N'R2139')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2140, N'P2140', N'C2140', N'R2140')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2141, N'P2141', N'C2141', N'R2141')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2142, N'P2142', N'C2142', N'R2142')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2143, N'P2143', N'C2143', N'R2143')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2144, N'P2144', N'C2144', N'R2144')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2145, N'P2145', N'C2145', N'R2145')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2146, N'P2146', N'C2146', N'R2146')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2147, N'P2147', N'C2147', N'R2147')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2148, N'P2148', N'C2148', N'R2148')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2149, N'P2149', N'C2149', N'R2149')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2150, N'P2150', N'C2150', N'R2150')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2151, N'P2151', N'C2151', N'R2151')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2152, N'P2152', N'C2152', N'R2152')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2153, N'P2153', N'C2153', N'R2153')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2154, N'P2154', N'C2154', N'R2154')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2155, N'P2155', N'C2155', N'R2155')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2156, N'P2156', N'C2156', N'R2156')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2157, N'P2157', N'C2157', N'R2157')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2158, N'P2158', N'C2158', N'R2158')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2159, N'P2159', N'C2159', N'R2159')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2160, N'P2160', N'C2160', N'R2160')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2161, N'P2161', N'C2161', N'R2161')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2162, N'P2162', N'C2162', N'R2162')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2163, N'P2163', N'C2163', N'R2163')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2164, N'P2164', N'C2164', N'R2164')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2165, N'P2165', N'C2165', N'R2165')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2166, N'P2166', N'C2166', N'R2166')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2167, N'P2167', N'C2167', N'R2167')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2168, N'P2168', N'C2168', N'R2168')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2169, N'P2169', N'C2169', N'R2169')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2170, N'P2170', N'C2170', N'R2170')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2171, N'P2171', N'C2171', N'R2171')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2172, N'P2172', N'C2172', N'R2172')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2173, N'P2173', N'C2173', N'R2173')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2174, N'P2174', N'C2174', N'R2174')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2175, N'P2175', N'C2175', N'R2175')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2176, N'P2176', N'C2176', N'R2176')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2177, N'P2177', N'C2177', N'R2177')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2178, N'P2178', N'C2178', N'R2178')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2179, N'P2179', N'C2179', N'R2179')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2180, N'P2180', N'C2180', N'R2180')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2181, N'P2181', N'C2181', N'R2181')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2182, N'P2182', N'C2182', N'R2182')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2183, N'P2183', N'C2183', N'R2183')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2184, N'P2184', N'C2184', N'R2184')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2185, N'P2185', N'C2185', N'R2185')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2186, N'P2186', N'C2186', N'R2186')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2187, N'P2187', N'C2187', N'R2187')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2188, N'P2188', N'C2188', N'R2188')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2189, N'P2189', N'C2189', N'R2189')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2190, N'P2190', N'C2190', N'R2190')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2191, N'P2191', N'C2191', N'R2191')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2192, N'P2192', N'C2192', N'R2192')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2193, N'P2193', N'C2193', N'R2193')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2194, N'P2194', N'C2194', N'R2194')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2195, N'P2195', N'C2195', N'R2195')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2196, N'P2196', N'C2196', N'R2196')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2197, N'P2197', N'C2197', N'R2197')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2198, N'P2198', N'C2198', N'R2198')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2199, N'P2199', N'C2199', N'R2199')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2200, N'P2200', N'C2200', N'R2200')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2201, N'P2201', N'C2201', N'R2201')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2202, N'P2202', N'C2202', N'R2202')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2203, N'P2203', N'C2203', N'R2203')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2204, N'P2204', N'C2204', N'R2204')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2205, N'P2205', N'C2205', N'R2205')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2206, N'P2206', N'C2206', N'R2206')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2207, N'P2207', N'C2207', N'R2207')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2208, N'P2208', N'C2208', N'R2208')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2209, N'P2209', N'C2209', N'R2209')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2210, N'P2210', N'C2210', N'R2210')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2211, N'P2211', N'C2211', N'R2211')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2212, N'P2212', N'C2212', N'R2212')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2213, N'P2213', N'C2213', N'R2213')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2214, N'P2214', N'C2214', N'R2214')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2215, N'P2215', N'C2215', N'R2215')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2216, N'P2216', N'C2216', N'R2216')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2217, N'P2217', N'C2217', N'R2217')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2218, N'P2218', N'C2218', N'R2218')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2219, N'P2219', N'C2219', N'R2219')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2220, N'P2220', N'C2220', N'R2220')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2221, N'P2221', N'C2221', N'R2221')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2222, N'P2222', N'C2222', N'R2222')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2223, N'P2223', N'C2223', N'R2223')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2224, N'P2224', N'C2224', N'R2224')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2225, N'P2225', N'C2225', N'R2225')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2226, N'P2226', N'C2226', N'R2226')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2227, N'P2227', N'C2227', N'R2227')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2228, N'P2228', N'C2228', N'R2228')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2229, N'P2229', N'C2229', N'R2229')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2230, N'P2230', N'C2230', N'R2230')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2231, N'P2231', N'C2231', N'R2231')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2232, N'P2232', N'C2232', N'R2232')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2233, N'P2233', N'C2233', N'R2233')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2234, N'P2234', N'C2234', N'R2234')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2235, N'P2235', N'C2235', N'R2235')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2236, N'P2236', N'C2236', N'R2236')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2237, N'P2237', N'C2237', N'R2237')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2238, N'P2238', N'C2238', N'R2238')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2239, N'P2239', N'C2239', N'R2239')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2240, N'P2240', N'C2240', N'R2240')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2241, N'P2241', N'C2241', N'R2241')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2242, N'P2242', N'C2242', N'R2242')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2243, N'P2243', N'C2243', N'R2243')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2244, N'P2244', N'C2244', N'R2244')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2245, N'P2245', N'C2245', N'R2245')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2246, N'P2246', N'C2246', N'R2246')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2247, N'P2247', N'C2247', N'R2247')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2248, N'P2248', N'C2248', N'R2248')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2249, N'P2249', N'C2249', N'R2249')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2250, N'P2250', N'C2250', N'R2250')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2251, N'P2251', N'C2251', N'R2251')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2252, N'P2252', N'C2252', N'R2252')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2253, N'P2253', N'C2253', N'R2253')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2254, N'P2254', N'C2254', N'R2254')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2255, N'P2255', N'C2255', N'R2255')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2256, N'P2256', N'C2256', N'R2256')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2257, N'P2257', N'C2257', N'R2257')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2258, N'P2258', N'C2258', N'R2258')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2259, N'P2259', N'C2259', N'R2259')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2260, N'P2260', N'C2260', N'R2260')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2261, N'P2261', N'C2261', N'R2261')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2262, N'P2262', N'C2262', N'R2262')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2263, N'P2263', N'C2263', N'R2263')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2264, N'P2264', N'C2264', N'R2264')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2265, N'P2265', N'C2265', N'R2265')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2266, N'P2266', N'C2266', N'R2266')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2267, N'P2267', N'C2267', N'R2267')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2268, N'P2268', N'C2268', N'R2268')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2269, N'P2269', N'C2269', N'R2269')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2270, N'P2270', N'C2270', N'R2270')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2271, N'P2271', N'C2271', N'R2271')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2272, N'P2272', N'C2272', N'R2272')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2273, N'P2273', N'C2273', N'R2273')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2274, N'P2274', N'C2274', N'R2274')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2275, N'P2275', N'C2275', N'R2275')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2276, N'P2276', N'C2276', N'R2276')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2277, N'P2277', N'C2277', N'R2277')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2278, N'P2278', N'C2278', N'R2278')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2279, N'P2279', N'C2279', N'R2279')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2280, N'P2280', N'C2280', N'R2280')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2281, N'P2281', N'C2281', N'R2281')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2282, N'P2282', N'C2282', N'R2282')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2283, N'P2283', N'C2283', N'R2283')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2284, N'P2284', N'C2284', N'R2284')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2285, N'P2285', N'C2285', N'R2285')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2286, N'P2286', N'C2286', N'R2286')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2287, N'P2287', N'C2287', N'R2287')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2288, N'P2288', N'C2288', N'R2288')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2289, N'P2289', N'C2289', N'R2289')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2290, N'P2290', N'C2290', N'R2290')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2291, N'P2291', N'C2291', N'R2291')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2292, N'P2292', N'C2292', N'R2292')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2293, N'P2293', N'C2293', N'R2293')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2294, N'P2294', N'C2294', N'R2294')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2295, N'P2295', N'C2295', N'R2295')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2296, N'P2296', N'C2296', N'R2296')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2297, N'P2297', N'C2297', N'R2297')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2298, N'P2298', N'C2298', N'R2298')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2299, N'P2299', N'C2299', N'R2299')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2300, N'P2300', N'C2300', N'R2300')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2301, N'P2301', N'C2301', N'R2301')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2302, N'P2302', N'C2302', N'R2302')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2303, N'P2303', N'C2303', N'R2303')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2304, N'P2304', N'C2304', N'R2304')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2305, N'P2305', N'C2305', N'R2305')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2306, N'P2306', N'C2306', N'R2306')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2307, N'P2307', N'C2307', N'R2307')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2308, N'P2308', N'C2308', N'R2308')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2309, N'P2309', N'C2309', N'R2309')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2310, N'P2310', N'C2310', N'R2310')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2311, N'P2311', N'C2311', N'R2311')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2312, N'P2312', N'C2312', N'R2312')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2313, N'P2313', N'C2313', N'R2313')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2314, N'P2314', N'C2314', N'R2314')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2315, N'P2315', N'C2315', N'R2315')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2316, N'P2316', N'C2316', N'R2316')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2317, N'P2317', N'C2317', N'R2317')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2318, N'P2318', N'C2318', N'R2318')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2319, N'P2319', N'C2319', N'R2319')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2320, N'P2320', N'C2320', N'R2320')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2321, N'P2321', N'C2321', N'R2321')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2322, N'P2322', N'C2322', N'R2322')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2323, N'P2323', N'C2323', N'R2323')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2324, N'P2324', N'C2324', N'R2324')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2325, N'P2325', N'C2325', N'R2325')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2326, N'P2326', N'C2326', N'R2326')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2327, N'P2327', N'C2327', N'R2327')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2328, N'P2328', N'C2328', N'R2328')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2329, N'P2329', N'C2329', N'R2329')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2330, N'P2330', N'C2330', N'R2330')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2331, N'P2331', N'C2331', N'R2331')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2332, N'P2332', N'C2332', N'R2332')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2333, N'P2333', N'C2333', N'R2333')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2334, N'P2334', N'C2334', N'R2334')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2335, N'P2335', N'C2335', N'R2335')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2336, N'P2336', N'C2336', N'R2336')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2337, N'P2337', N'C2337', N'R2337')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2338, N'P2338', N'C2338', N'R2338')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2339, N'P2339', N'C2339', N'R2339')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2340, N'P2340', N'C2340', N'R2340')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2341, N'P2341', N'C2341', N'R2341')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2342, N'P2342', N'C2342', N'R2342')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2343, N'P2343', N'C2343', N'R2343')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2344, N'P2344', N'C2344', N'R2344')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2345, N'P2345', N'C2345', N'R2345')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2346, N'P2346', N'C2346', N'R2346')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2347, N'P2347', N'C2347', N'R2347')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2348, N'P2348', N'C2348', N'R2348')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2349, N'P2349', N'C2349', N'R2349')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2350, N'P2350', N'C2350', N'R2350')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2351, N'P2351', N'C2351', N'R2351')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2352, N'P2352', N'C2352', N'R2352')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2353, N'P2353', N'C2353', N'R2353')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2354, N'P2354', N'C2354', N'R2354')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2355, N'P2355', N'C2355', N'R2355')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2356, N'P2356', N'C2356', N'R2356')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2357, N'P2357', N'C2357', N'R2357')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2358, N'P2358', N'C2358', N'R2358')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2359, N'P2359', N'C2359', N'R2359')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2360, N'P2360', N'C2360', N'R2360')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2361, N'P2361', N'C2361', N'R2361')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2362, N'P2362', N'C2362', N'R2362')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2363, N'P2363', N'C2363', N'R2363')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2364, N'P2364', N'C2364', N'R2364')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2365, N'P2365', N'C2365', N'R2365')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2366, N'P2366', N'C2366', N'R2366')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2367, N'P2367', N'C2367', N'R2367')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2368, N'P2368', N'C2368', N'R2368')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2369, N'P2369', N'C2369', N'R2369')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2370, N'P2370', N'C2370', N'R2370')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2371, N'P2371', N'C2371', N'R2371')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2372, N'P2372', N'C2372', N'R2372')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2373, N'P2373', N'C2373', N'R2373')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2374, N'P2374', N'C2374', N'R2374')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2375, N'P2375', N'C2375', N'R2375')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2376, N'P2376', N'C2376', N'R2376')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2377, N'P2377', N'C2377', N'R2377')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2378, N'P2378', N'C2378', N'R2378')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2379, N'P2379', N'C2379', N'R2379')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2380, N'P2380', N'C2380', N'R2380')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2381, N'P2381', N'C2381', N'R2381')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2382, N'P2382', N'C2382', N'R2382')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2383, N'P2383', N'C2383', N'R2383')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2384, N'P2384', N'C2384', N'R2384')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2385, N'P2385', N'C2385', N'R2385')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2386, N'P2386', N'C2386', N'R2386')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2387, N'P2387', N'C2387', N'R2387')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2388, N'P2388', N'C2388', N'R2388')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2389, N'P2389', N'C2389', N'R2389')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2390, N'P2390', N'C2390', N'R2390')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2391, N'P2391', N'C2391', N'R2391')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2392, N'P2392', N'C2392', N'R2392')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2393, N'P2393', N'C2393', N'R2393')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2394, N'P2394', N'C2394', N'R2394')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2395, N'P2395', N'C2395', N'R2395')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2396, N'P2396', N'C2396', N'R2396')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2397, N'P2397', N'C2397', N'R2397')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2398, N'P2398', N'C2398', N'R2398')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2399, N'P2399', N'C2399', N'R2399')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2400, N'P2400', N'C2400', N'R2400')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2401, N'P2401', N'C2401', N'R2401')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2402, N'P2402', N'C2402', N'R2402')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2403, N'P2403', N'C2403', N'R2403')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2404, N'P2404', N'C2404', N'R2404')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2405, N'P2405', N'C2405', N'R2405')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2406, N'P2406', N'C2406', N'R2406')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2407, N'P2407', N'C2407', N'R2407')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2408, N'P2408', N'C2408', N'R2408')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2409, N'P2409', N'C2409', N'R2409')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2410, N'P2410', N'C2410', N'R2410')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2411, N'P2411', N'C2411', N'R2411')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2412, N'P2412', N'C2412', N'R2412')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2413, N'P2413', N'C2413', N'R2413')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2414, N'P2414', N'C2414', N'R2414')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2415, N'P2415', N'C2415', N'R2415')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2416, N'P2416', N'C2416', N'R2416')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2417, N'P2417', N'C2417', N'R2417')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2418, N'P2418', N'C2418', N'R2418')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2419, N'P2419', N'C2419', N'R2419')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2420, N'P2420', N'C2420', N'R2420')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2421, N'P2421', N'C2421', N'R2421')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2422, N'P2422', N'C2422', N'R2422')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2423, N'P2423', N'C2423', N'R2423')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2424, N'P2424', N'C2424', N'R2424')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2425, N'P2425', N'C2425', N'R2425')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2426, N'P2426', N'C2426', N'R2426')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2427, N'P2427', N'C2427', N'R2427')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2428, N'P2428', N'C2428', N'R2428')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2429, N'P2429', N'C2429', N'R2429')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2430, N'P2430', N'C2430', N'R2430')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2431, N'P2431', N'C2431', N'R2431')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2432, N'P2432', N'C2432', N'R2432')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2433, N'P2433', N'C2433', N'R2433')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2434, N'P2434', N'C2434', N'R2434')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2435, N'P2435', N'C2435', N'R2435')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2436, N'P2436', N'C2436', N'R2436')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2437, N'P2437', N'C2437', N'R2437')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2438, N'P2438', N'C2438', N'R2438')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2439, N'P2439', N'C2439', N'R2439')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2440, N'P2440', N'C2440', N'R2440')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2441, N'P2441', N'C2441', N'R2441')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2442, N'P2442', N'C2442', N'R2442')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2443, N'P2443', N'C2443', N'R2443')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2444, N'P2444', N'C2444', N'R2444')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2445, N'P2445', N'C2445', N'R2445')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2446, N'P2446', N'C2446', N'R2446')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2447, N'P2447', N'C2447', N'R2447')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2448, N'P2448', N'C2448', N'R2448')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2449, N'P2449', N'C2449', N'R2449')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2450, N'P2450', N'C2450', N'R2450')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2451, N'P2451', N'C2451', N'R2451')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2452, N'P2452', N'C2452', N'R2452')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2453, N'P2453', N'C2453', N'R2453')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2454, N'P2454', N'C2454', N'R2454')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2455, N'P2455', N'C2455', N'R2455')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2456, N'P2456', N'C2456', N'R2456')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2457, N'P2457', N'C2457', N'R2457')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2458, N'P2458', N'C2458', N'R2458')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2459, N'P2459', N'C2459', N'R2459')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2460, N'P2460', N'C2460', N'R2460')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2461, N'P2461', N'C2461', N'R2461')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2462, N'P2462', N'C2462', N'R2462')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2463, N'P2463', N'C2463', N'R2463')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2464, N'P2464', N'C2464', N'R2464')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2465, N'P2465', N'C2465', N'R2465')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2466, N'P2466', N'C2466', N'R2466')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2467, N'P2467', N'C2467', N'R2467')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2468, N'P2468', N'C2468', N'R2468')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2469, N'P2469', N'C2469', N'R2469')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2470, N'P2470', N'C2470', N'R2470')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2471, N'P2471', N'C2471', N'R2471')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2472, N'P2472', N'C2472', N'R2472')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2473, N'P2473', N'C2473', N'R2473')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2474, N'P2474', N'C2474', N'R2474')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2475, N'P2475', N'C2475', N'R2475')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2476, N'P2476', N'C2476', N'R2476')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2477, N'P2477', N'C2477', N'R2477')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2478, N'P2478', N'C2478', N'R2478')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2479, N'P2479', N'C2479', N'R2479')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2480, N'P2480', N'C2480', N'R2480')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2481, N'P2481', N'C2481', N'R2481')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2482, N'P2482', N'C2482', N'R2482')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2483, N'P2483', N'C2483', N'R2483')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2484, N'P2484', N'C2484', N'R2484')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2485, N'P2485', N'C2485', N'R2485')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2486, N'P2486', N'C2486', N'R2486')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2487, N'P2487', N'C2487', N'R2487')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2488, N'P2488', N'C2488', N'R2488')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2489, N'P2489', N'C2489', N'R2489')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2490, N'P2490', N'C2490', N'R2490')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2491, N'P2491', N'C2491', N'R2491')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2492, N'P2492', N'C2492', N'R2492')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2493, N'P2493', N'C2493', N'R2493')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2494, N'P2494', N'C2494', N'R2494')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2495, N'P2495', N'C2495', N'R2495')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2496, N'P2496', N'C2496', N'R2496')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2497, N'P2497', N'C2497', N'R2497')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2498, N'P2498', N'C2498', N'R2498')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2499, N'P2499', N'C2499', N'R2499')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2500, N'P2500', N'C2500', N'R2500')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2501, N'P2501', N'C2501', N'R2501')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2502, N'P2502', N'C2502', N'R2502')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2503, N'P2503', N'C2503', N'R2503')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2504, N'P2504', N'C2504', N'R2504')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2505, N'P2505', N'C2505', N'R2505')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2506, N'P2506', N'C2506', N'R2506')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2507, N'P2507', N'C2507', N'R2507')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2508, N'P2508', N'C2508', N'R2508')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2509, N'P2509', N'C2509', N'R2509')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2510, N'P2510', N'C2510', N'R2510')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2511, N'P2511', N'C2511', N'R2511')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2512, N'P2512', N'C2512', N'R2512')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2513, N'P2513', N'C2513', N'R2513')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2514, N'P2514', N'C2514', N'R2514')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2515, N'P2515', N'C2515', N'R2515')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2516, N'P2516', N'C2516', N'R2516')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2517, N'P2517', N'C2517', N'R2517')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2518, N'P2518', N'C2518', N'R2518')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2519, N'P2519', N'C2519', N'R2519')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2520, N'P2520', N'C2520', N'R2520')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2521, N'P2521', N'C2521', N'R2521')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2522, N'P2522', N'C2522', N'R2522')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2523, N'P2523', N'C2523', N'R2523')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2524, N'P2524', N'C2524', N'R2524')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2525, N'P2525', N'C2525', N'R2525')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2526, N'P2526', N'C2526', N'R2526')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2527, N'P2527', N'C2527', N'R2527')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2528, N'P2528', N'C2528', N'R2528')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2529, N'P2529', N'C2529', N'R2529')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2530, N'P2530', N'C2530', N'R2530')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2531, N'P2531', N'C2531', N'R2531')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2532, N'P2532', N'C2532', N'R2532')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2533, N'P2533', N'C2533', N'R2533')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2534, N'P2534', N'C2534', N'R2534')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2535, N'P2535', N'C2535', N'R2535')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2536, N'P2536', N'C2536', N'R2536')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2537, N'P2537', N'C2537', N'R2537')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2538, N'P2538', N'C2538', N'R2538')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2539, N'P2539', N'C2539', N'R2539')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2540, N'P2540', N'C2540', N'R2540')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2541, N'P2541', N'C2541', N'R2541')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2542, N'P2542', N'C2542', N'R2542')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2543, N'P2543', N'C2543', N'R2543')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2544, N'P2544', N'C2544', N'R2544')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2545, N'P2545', N'C2545', N'R2545')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2546, N'P2546', N'C2546', N'R2546')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2547, N'P2547', N'C2547', N'R2547')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2548, N'P2548', N'C2548', N'R2548')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2549, N'P2549', N'C2549', N'R2549')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2550, N'P2550', N'C2550', N'R2550')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2551, N'P2551', N'C2551', N'R2551')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2552, N'P2552', N'C2552', N'R2552')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2553, N'P2553', N'C2553', N'R2553')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2554, N'P2554', N'C2554', N'R2554')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2555, N'P2555', N'C2555', N'R2555')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2556, N'P2556', N'C2556', N'R2556')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2557, N'P2557', N'C2557', N'R2557')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2558, N'P2558', N'C2558', N'R2558')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2559, N'P2559', N'C2559', N'R2559')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2560, N'P2560', N'C2560', N'R2560')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2561, N'P2561', N'C2561', N'R2561')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2562, N'P2562', N'C2562', N'R2562')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2563, N'P2563', N'C2563', N'R2563')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2564, N'P2564', N'C2564', N'R2564')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2565, N'P2565', N'C2565', N'R2565')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2566, N'P2566', N'C2566', N'R2566')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2567, N'P2567', N'C2567', N'R2567')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2568, N'P2568', N'C2568', N'R2568')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2569, N'P2569', N'C2569', N'R2569')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2570, N'P2570', N'C2570', N'R2570')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2571, N'P2571', N'C2571', N'R2571')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2572, N'P2572', N'C2572', N'R2572')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2573, N'P2573', N'C2573', N'R2573')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2574, N'P2574', N'C2574', N'R2574')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2575, N'P2575', N'C2575', N'R2575')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2576, N'P2576', N'C2576', N'R2576')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2577, N'P2577', N'C2577', N'R2577')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2578, N'P2578', N'C2578', N'R2578')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2579, N'P2579', N'C2579', N'R2579')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2580, N'P2580', N'C2580', N'R2580')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2581, N'P2581', N'C2581', N'R2581')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2582, N'P2582', N'C2582', N'R2582')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2583, N'P2583', N'C2583', N'R2583')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2584, N'P2584', N'C2584', N'R2584')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2585, N'P2585', N'C2585', N'R2585')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2586, N'P2586', N'C2586', N'R2586')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2587, N'P2587', N'C2587', N'R2587')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2588, N'P2588', N'C2588', N'R2588')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2589, N'P2589', N'C2589', N'R2589')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2590, N'P2590', N'C2590', N'R2590')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2591, N'P2591', N'C2591', N'R2591')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2592, N'P2592', N'C2592', N'R2592')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2593, N'P2593', N'C2593', N'R2593')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2594, N'P2594', N'C2594', N'R2594')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2595, N'P2595', N'C2595', N'R2595')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2596, N'P2596', N'C2596', N'R2596')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2597, N'P2597', N'C2597', N'R2597')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2598, N'P2598', N'C2598', N'R2598')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2599, N'P2599', N'C2599', N'R2599')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2600, N'P2600', N'C2600', N'R2600')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2601, N'P2601', N'C2601', N'R2601')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2602, N'P2602', N'C2602', N'R2602')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2603, N'P2603', N'C2603', N'R2603')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2604, N'P2604', N'C2604', N'R2604')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2605, N'P2605', N'C2605', N'R2605')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2606, N'P2606', N'C2606', N'R2606')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2607, N'P2607', N'C2607', N'R2607')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2608, N'P2608', N'C2608', N'R2608')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2609, N'P2609', N'C2609', N'R2609')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2610, N'P2610', N'C2610', N'R2610')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2611, N'P2611', N'C2611', N'R2611')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2612, N'P2612', N'C2612', N'R2612')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2613, N'P2613', N'C2613', N'R2613')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2614, N'P2614', N'C2614', N'R2614')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2615, N'P2615', N'C2615', N'R2615')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2616, N'P2616', N'C2616', N'R2616')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2617, N'P2617', N'C2617', N'R2617')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2618, N'P2618', N'C2618', N'R2618')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2619, N'P2619', N'C2619', N'R2619')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2620, N'P2620', N'C2620', N'R2620')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2621, N'P2621', N'C2621', N'R2621')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2622, N'P2622', N'C2622', N'R2622')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2623, N'P2623', N'C2623', N'R2623')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2624, N'P2624', N'C2624', N'R2624')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2625, N'P2625', N'C2625', N'R2625')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2626, N'P2626', N'C2626', N'R2626')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2627, N'P2627', N'C2627', N'R2627')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2628, N'P2628', N'C2628', N'R2628')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2629, N'P2629', N'C2629', N'R2629')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2630, N'P2630', N'C2630', N'R2630')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2631, N'P2631', N'C2631', N'R2631')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2632, N'P2632', N'C2632', N'R2632')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2633, N'P2633', N'C2633', N'R2633')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2634, N'P2634', N'C2634', N'R2634')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2635, N'P2635', N'C2635', N'R2635')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2636, N'P2636', N'C2636', N'R2636')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2637, N'P2637', N'C2637', N'R2637')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2638, N'P2638', N'C2638', N'R2638')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2639, N'P2639', N'C2639', N'R2639')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2640, N'P2640', N'C2640', N'R2640')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2641, N'P2641', N'C2641', N'R2641')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2642, N'P2642', N'C2642', N'R2642')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2643, N'P2643', N'C2643', N'R2643')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2644, N'P2644', N'C2644', N'R2644')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2645, N'P2645', N'C2645', N'R2645')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2646, N'P2646', N'C2646', N'R2646')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2647, N'P2647', N'C2647', N'R2647')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2648, N'P2648', N'C2648', N'R2648')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2649, N'P2649', N'C2649', N'R2649')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2650, N'P2650', N'C2650', N'R2650')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2651, N'P2651', N'C2651', N'R2651')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2652, N'P2652', N'C2652', N'R2652')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2653, N'P2653', N'C2653', N'R2653')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2654, N'P2654', N'C2654', N'R2654')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2655, N'P2655', N'C2655', N'R2655')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2656, N'P2656', N'C2656', N'R2656')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2657, N'P2657', N'C2657', N'R2657')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2658, N'P2658', N'C2658', N'R2658')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2659, N'P2659', N'C2659', N'R2659')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2660, N'P2660', N'C2660', N'R2660')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2661, N'P2661', N'C2661', N'R2661')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2662, N'P2662', N'C2662', N'R2662')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2663, N'P2663', N'C2663', N'R2663')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2664, N'P2664', N'C2664', N'R2664')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2665, N'P2665', N'C2665', N'R2665')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2666, N'P2666', N'C2666', N'R2666')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2667, N'P2667', N'C2667', N'R2667')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2668, N'P2668', N'C2668', N'R2668')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2669, N'P2669', N'C2669', N'R2669')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2670, N'P2670', N'C2670', N'R2670')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2671, N'P2671', N'C2671', N'R2671')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2672, N'P2672', N'C2672', N'R2672')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2673, N'P2673', N'C2673', N'R2673')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2674, N'P2674', N'C2674', N'R2674')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2675, N'P2675', N'C2675', N'R2675')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2676, N'P2676', N'C2676', N'R2676')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2677, N'P2677', N'C2677', N'R2677')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2678, N'P2678', N'C2678', N'R2678')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2679, N'P2679', N'C2679', N'R2679')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2680, N'P2680', N'C2680', N'R2680')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2681, N'P2681', N'C2681', N'R2681')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2682, N'P2682', N'C2682', N'R2682')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2683, N'P2683', N'C2683', N'R2683')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2684, N'P2684', N'C2684', N'R2684')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2685, N'P2685', N'C2685', N'R2685')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2686, N'P2686', N'C2686', N'R2686')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2687, N'P2687', N'C2687', N'R2687')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2688, N'P2688', N'C2688', N'R2688')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2689, N'P2689', N'C2689', N'R2689')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2690, N'P2690', N'C2690', N'R2690')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2691, N'P2691', N'C2691', N'R2691')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2692, N'P2692', N'C2692', N'R2692')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2693, N'P2693', N'C2693', N'R2693')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2694, N'P2694', N'C2694', N'R2694')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2695, N'P2695', N'C2695', N'R2695')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2696, N'P2696', N'C2696', N'R2696')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2697, N'P2697', N'C2697', N'R2697')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2698, N'P2698', N'C2698', N'R2698')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2699, N'P2699', N'C2699', N'R2699')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2700, N'P2700', N'C2700', N'R2700')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2701, N'P2701', N'C2701', N'R2701')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2702, N'P2702', N'C2702', N'R2702')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2703, N'P2703', N'C2703', N'R2703')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2704, N'P2704', N'C2704', N'R2704')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2705, N'P2705', N'C2705', N'R2705')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2706, N'P2706', N'C2706', N'R2706')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2707, N'P2707', N'C2707', N'R2707')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2708, N'P2708', N'C2708', N'R2708')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2709, N'P2709', N'C2709', N'R2709')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2710, N'P2710', N'C2710', N'R2710')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2711, N'P2711', N'C2711', N'R2711')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2712, N'P2712', N'C2712', N'R2712')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2713, N'P2713', N'C2713', N'R2713')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2714, N'P2714', N'C2714', N'R2714')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2715, N'P2715', N'C2715', N'R2715')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2716, N'P2716', N'C2716', N'R2716')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2717, N'P2717', N'C2717', N'R2717')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2718, N'P2718', N'C2718', N'R2718')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2719, N'P2719', N'C2719', N'R2719')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2720, N'P2720', N'C2720', N'R2720')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2721, N'P2721', N'C2721', N'R2721')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2722, N'P2722', N'C2722', N'R2722')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2723, N'P2723', N'C2723', N'R2723')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2724, N'P2724', N'C2724', N'R2724')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2725, N'P2725', N'C2725', N'R2725')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2726, N'P2726', N'C2726', N'R2726')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2727, N'P2727', N'C2727', N'R2727')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2728, N'P2728', N'C2728', N'R2728')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2729, N'P2729', N'C2729', N'R2729')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2730, N'P2730', N'C2730', N'R2730')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2731, N'P2731', N'C2731', N'R2731')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2732, N'P2732', N'C2732', N'R2732')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2733, N'P2733', N'C2733', N'R2733')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2734, N'P2734', N'C2734', N'R2734')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2735, N'P2735', N'C2735', N'R2735')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2736, N'P2736', N'C2736', N'R2736')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2737, N'P2737', N'C2737', N'R2737')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2738, N'P2738', N'C2738', N'R2738')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2739, N'P2739', N'C2739', N'R2739')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2740, N'P2740', N'C2740', N'R2740')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2741, N'P2741', N'C2741', N'R2741')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2742, N'P2742', N'C2742', N'R2742')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2743, N'P2743', N'C2743', N'R2743')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2744, N'P2744', N'C2744', N'R2744')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2745, N'P2745', N'C2745', N'R2745')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2746, N'P2746', N'C2746', N'R2746')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2747, N'P2747', N'C2747', N'R2747')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2748, N'P2748', N'C2748', N'R2748')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2749, N'P2749', N'C2749', N'R2749')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2750, N'P2750', N'C2750', N'R2750')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2751, N'P2751', N'C2751', N'R2751')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2752, N'P2752', N'C2752', N'R2752')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2753, N'P2753', N'C2753', N'R2753')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2754, N'P2754', N'C2754', N'R2754')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2755, N'P2755', N'C2755', N'R2755')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2756, N'P2756', N'C2756', N'R2756')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2757, N'P2757', N'C2757', N'R2757')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2758, N'P2758', N'C2758', N'R2758')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2759, N'P2759', N'C2759', N'R2759')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2760, N'P2760', N'C2760', N'R2760')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2761, N'P2761', N'C2761', N'R2761')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2762, N'P2762', N'C2762', N'R2762')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2763, N'P2763', N'C2763', N'R2763')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2764, N'P2764', N'C2764', N'R2764')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2765, N'P2765', N'C2765', N'R2765')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2766, N'P2766', N'C2766', N'R2766')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2767, N'P2767', N'C2767', N'R2767')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2768, N'P2768', N'C2768', N'R2768')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2769, N'P2769', N'C2769', N'R2769')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2770, N'P2770', N'C2770', N'R2770')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2771, N'P2771', N'C2771', N'R2771')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2772, N'P2772', N'C2772', N'R2772')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2773, N'P2773', N'C2773', N'R2773')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2774, N'P2774', N'C2774', N'R2774')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2775, N'P2775', N'C2775', N'R2775')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2776, N'P2776', N'C2776', N'R2776')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2777, N'P2777', N'C2777', N'R2777')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2778, N'P2778', N'C2778', N'R2778')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2779, N'P2779', N'C2779', N'R2779')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2780, N'P2780', N'C2780', N'R2780')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2781, N'P2781', N'C2781', N'R2781')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2782, N'P2782', N'C2782', N'R2782')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2783, N'P2783', N'C2783', N'R2783')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2784, N'P2784', N'C2784', N'R2784')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2785, N'P2785', N'C2785', N'R2785')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2786, N'P2786', N'C2786', N'R2786')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2787, N'P2787', N'C2787', N'R2787')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2788, N'P2788', N'C2788', N'R2788')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2789, N'P2789', N'C2789', N'R2789')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2790, N'P2790', N'C2790', N'R2790')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2791, N'P2791', N'C2791', N'R2791')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2792, N'P2792', N'C2792', N'R2792')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2793, N'P2793', N'C2793', N'R2793')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2794, N'P2794', N'C2794', N'R2794')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2795, N'P2795', N'C2795', N'R2795')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2796, N'P2796', N'C2796', N'R2796')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2797, N'P2797', N'C2797', N'R2797')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2798, N'P2798', N'C2798', N'R2798')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2799, N'P2799', N'C2799', N'R2799')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2800, N'P2800', N'C2800', N'R2800')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2801, N'P2801', N'C2801', N'R2801')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2802, N'P2802', N'C2802', N'R2802')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2803, N'P2803', N'C2803', N'R2803')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2804, N'P2804', N'C2804', N'R2804')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2805, N'P2805', N'C2805', N'R2805')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2806, N'P2806', N'C2806', N'R2806')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2807, N'P2807', N'C2807', N'R2807')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2808, N'P2808', N'C2808', N'R2808')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2809, N'P2809', N'C2809', N'R2809')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2810, N'P2810', N'C2810', N'R2810')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2811, N'P2811', N'C2811', N'R2811')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2812, N'P2812', N'C2812', N'R2812')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2813, N'P2813', N'C2813', N'R2813')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2814, N'P2814', N'C2814', N'R2814')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2815, N'P2815', N'C2815', N'R2815')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2816, N'P2816', N'C2816', N'R2816')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2817, N'P2817', N'C2817', N'R2817')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2818, N'P2818', N'C2818', N'R2818')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2819, N'P2819', N'C2819', N'R2819')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2820, N'P2820', N'C2820', N'R2820')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2821, N'P2821', N'C2821', N'R2821')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2822, N'P2822', N'C2822', N'R2822')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2823, N'P2823', N'C2823', N'R2823')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2824, N'P2824', N'C2824', N'R2824')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2825, N'P2825', N'C2825', N'R2825')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2826, N'P2826', N'C2826', N'R2826')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2827, N'P2827', N'C2827', N'R2827')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2828, N'P2828', N'C2828', N'R2828')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2829, N'P2829', N'C2829', N'R2829')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2830, N'P2830', N'C2830', N'R2830')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2831, N'P2831', N'C2831', N'R2831')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2832, N'P2832', N'C2832', N'R2832')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2833, N'P2833', N'C2833', N'R2833')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2834, N'P2834', N'C2834', N'R2834')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2835, N'P2835', N'C2835', N'R2835')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2836, N'P2836', N'C2836', N'R2836')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2837, N'P2837', N'C2837', N'R2837')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2838, N'P2838', N'C2838', N'R2838')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2839, N'P2839', N'C2839', N'R2839')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2840, N'P2840', N'C2840', N'R2840')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2841, N'P2841', N'C2841', N'R2841')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2842, N'P2842', N'C2842', N'R2842')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2843, N'P2843', N'C2843', N'R2843')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2844, N'P2844', N'C2844', N'R2844')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2845, N'P2845', N'C2845', N'R2845')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2846, N'P2846', N'C2846', N'R2846')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2847, N'P2847', N'C2847', N'R2847')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2848, N'P2848', N'C2848', N'R2848')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2849, N'P2849', N'C2849', N'R2849')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2850, N'P2850', N'C2850', N'R2850')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2851, N'P2851', N'C2851', N'R2851')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2852, N'P2852', N'C2852', N'R2852')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2853, N'P2853', N'C2853', N'R2853')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2854, N'P2854', N'C2854', N'R2854')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2855, N'P2855', N'C2855', N'R2855')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2856, N'P2856', N'C2856', N'R2856')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2857, N'P2857', N'C2857', N'R2857')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2858, N'P2858', N'C2858', N'R2858')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2859, N'P2859', N'C2859', N'R2859')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2860, N'P2860', N'C2860', N'R2860')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2861, N'P2861', N'C2861', N'R2861')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2862, N'P2862', N'C2862', N'R2862')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2863, N'P2863', N'C2863', N'R2863')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2864, N'P2864', N'C2864', N'R2864')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2865, N'P2865', N'C2865', N'R2865')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2866, N'P2866', N'C2866', N'R2866')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2867, N'P2867', N'C2867', N'R2867')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2868, N'P2868', N'C2868', N'R2868')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2869, N'P2869', N'C2869', N'R2869')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2870, N'P2870', N'C2870', N'R2870')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2871, N'P2871', N'C2871', N'R2871')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2872, N'P2872', N'C2872', N'R2872')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2873, N'P2873', N'C2873', N'R2873')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2874, N'P2874', N'C2874', N'R2874')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2875, N'P2875', N'C2875', N'R2875')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2876, N'P2876', N'C2876', N'R2876')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2877, N'P2877', N'C2877', N'R2877')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2878, N'P2878', N'C2878', N'R2878')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2879, N'P2879', N'C2879', N'R2879')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2880, N'P2880', N'C2880', N'R2880')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2881, N'P2881', N'C2881', N'R2881')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2882, N'P2882', N'C2882', N'R2882')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2883, N'P2883', N'C2883', N'R2883')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2884, N'P2884', N'C2884', N'R2884')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2885, N'P2885', N'C2885', N'R2885')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2886, N'P2886', N'C2886', N'R2886')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2887, N'P2887', N'C2887', N'R2887')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2888, N'P2888', N'C2888', N'R2888')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2889, N'P2889', N'C2889', N'R2889')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2890, N'P2890', N'C2890', N'R2890')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2891, N'P2891', N'C2891', N'R2891')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2892, N'P2892', N'C2892', N'R2892')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2893, N'P2893', N'C2893', N'R2893')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2894, N'P2894', N'C2894', N'R2894')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2895, N'P2895', N'C2895', N'R2895')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2896, N'P2896', N'C2896', N'R2896')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2897, N'P2897', N'C2897', N'R2897')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2898, N'P2898', N'C2898', N'R2898')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2899, N'P2899', N'C2899', N'R2899')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2900, N'P2900', N'C2900', N'R2900')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2901, N'P2901', N'C2901', N'R2901')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2902, N'P2902', N'C2902', N'R2902')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2903, N'P2903', N'C2903', N'R2903')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2904, N'P2904', N'C2904', N'R2904')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2905, N'P2905', N'C2905', N'R2905')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2906, N'P2906', N'C2906', N'R2906')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2907, N'P2907', N'C2907', N'R2907')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2908, N'P2908', N'C2908', N'R2908')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2909, N'P2909', N'C2909', N'R2909')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2910, N'P2910', N'C2910', N'R2910')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2911, N'P2911', N'C2911', N'R2911')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2912, N'P2912', N'C2912', N'R2912')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2913, N'P2913', N'C2913', N'R2913')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2914, N'P2914', N'C2914', N'R2914')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2915, N'P2915', N'C2915', N'R2915')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2916, N'P2916', N'C2916', N'R2916')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2917, N'P2917', N'C2917', N'R2917')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2918, N'P2918', N'C2918', N'R2918')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2919, N'P2919', N'C2919', N'R2919')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2920, N'P2920', N'C2920', N'R2920')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2921, N'P2921', N'C2921', N'R2921')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2922, N'P2922', N'C2922', N'R2922')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2923, N'P2923', N'C2923', N'R2923')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2924, N'P2924', N'C2924', N'R2924')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2925, N'P2925', N'C2925', N'R2925')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2926, N'P2926', N'C2926', N'R2926')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2927, N'P2927', N'C2927', N'R2927')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2928, N'P2928', N'C2928', N'R2928')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2929, N'P2929', N'C2929', N'R2929')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2930, N'P2930', N'C2930', N'R2930')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2931, N'P2931', N'C2931', N'R2931')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2932, N'P2932', N'C2932', N'R2932')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2933, N'P2933', N'C2933', N'R2933')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2934, N'P2934', N'C2934', N'R2934')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2935, N'P2935', N'C2935', N'R2935')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2936, N'P2936', N'C2936', N'R2936')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2937, N'P2937', N'C2937', N'R2937')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2938, N'P2938', N'C2938', N'R2938')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2939, N'P2939', N'C2939', N'R2939')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2940, N'P2940', N'C2940', N'R2940')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2941, N'P2941', N'C2941', N'R2941')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2942, N'P2942', N'C2942', N'R2942')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2943, N'P2943', N'C2943', N'R2943')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2944, N'P2944', N'C2944', N'R2944')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2945, N'P2945', N'C2945', N'R2945')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2946, N'P2946', N'C2946', N'R2946')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2947, N'P2947', N'C2947', N'R2947')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2948, N'P2948', N'C2948', N'R2948')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2949, N'P2949', N'C2949', N'R2949')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2950, N'P2950', N'C2950', N'R2950')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2951, N'P2951', N'C2951', N'R2951')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2952, N'P2952', N'C2952', N'R2952')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2953, N'P2953', N'C2953', N'R2953')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2954, N'P2954', N'C2954', N'R2954')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2955, N'P2955', N'C2955', N'R2955')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2956, N'P2956', N'C2956', N'R2956')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2957, N'P2957', N'C2957', N'R2957')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2958, N'P2958', N'C2958', N'R2958')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2959, N'P2959', N'C2959', N'R2959')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2960, N'P2960', N'C2960', N'R2960')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2961, N'P2961', N'C2961', N'R2961')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2962, N'P2962', N'C2962', N'R2962')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2963, N'P2963', N'C2963', N'R2963')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2964, N'P2964', N'C2964', N'R2964')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2965, N'P2965', N'C2965', N'R2965')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2966, N'P2966', N'C2966', N'R2966')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2967, N'P2967', N'C2967', N'R2967')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2968, N'P2968', N'C2968', N'R2968')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2969, N'P2969', N'C2969', N'R2969')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2970, N'P2970', N'C2970', N'R2970')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2971, N'P2971', N'C2971', N'R2971')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2972, N'P2972', N'C2972', N'R2972')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2973, N'P2973', N'C2973', N'R2973')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2974, N'P2974', N'C2974', N'R2974')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2975, N'P2975', N'C2975', N'R2975')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2976, N'P2976', N'C2976', N'R2976')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2977, N'P2977', N'C2977', N'R2977')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2978, N'P2978', N'C2978', N'R2978')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2979, N'P2979', N'C2979', N'R2979')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2980, N'P2980', N'C2980', N'R2980')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2981, N'P2981', N'C2981', N'R2981')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2982, N'P2982', N'C2982', N'R2982')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2983, N'P2983', N'C2983', N'R2983')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2984, N'P2984', N'C2984', N'R2984')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2985, N'P2985', N'C2985', N'R2985')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2986, N'P2986', N'C2986', N'R2986')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2987, N'P2987', N'C2987', N'R2987')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2988, N'P2988', N'C2988', N'R2988')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2989, N'P2989', N'C2989', N'R2989')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2990, N'P2990', N'C2990', N'R2990')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2991, N'P2991', N'C2991', N'R2991')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2992, N'P2992', N'C2992', N'R2992')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2993, N'P2993', N'C2993', N'R2993')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2994, N'P2994', N'C2994', N'R2994')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2995, N'P2995', N'C2995', N'R2995')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2996, N'P2996', N'C2996', N'R2996')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2997, N'P2997', N'C2997', N'R2997')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2998, N'P2998', N'C2998', N'R2998')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (2999, N'P2999', N'C2999', N'R2999')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3000, N'P3000', N'C3000', N'R3000')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3001, N'P3001', N'C3001', N'R3001')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3002, N'P3002', N'C3002', N'R3002')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3003, N'P3003', N'C3003', N'R3003')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3004, N'P3004', N'C3004', N'R3004')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3005, N'P3005', N'C3005', N'R3005')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3006, N'P3006', N'C3006', N'R3006')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3007, N'P3007', N'C3007', N'R3007')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3008, N'P3008', N'C3008', N'R3008')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3009, N'P3009', N'C3009', N'R3009')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3010, N'P3010', N'C3010', N'R3010')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3011, N'P3011', N'C3011', N'R3011')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3012, N'P3012', N'C3012', N'R3012')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3013, N'P3013', N'C3013', N'R3013')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3014, N'P3014', N'C3014', N'R3014')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3015, N'P3015', N'C3015', N'R3015')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3016, N'P3016', N'C3016', N'R3016')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3017, N'P3017', N'C3017', N'R3017')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3018, N'P3018', N'C3018', N'R3018')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3019, N'P3019', N'C3019', N'R3019')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3020, N'P3020', N'C3020', N'R3020')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3021, N'P3021', N'C3021', N'R3021')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3022, N'P3022', N'C3022', N'R3022')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3023, N'P3023', N'C3023', N'R3023')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3024, N'P3024', N'C3024', N'R3024')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3025, N'P3025', N'C3025', N'R3025')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3026, N'P3026', N'C3026', N'R3026')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3027, N'P3027', N'C3027', N'R3027')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3028, N'P3028', N'C3028', N'R3028')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3029, N'P3029', N'C3029', N'R3029')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3030, N'P3030', N'C3030', N'R3030')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3031, N'P3031', N'C3031', N'R3031')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3032, N'P3032', N'C3032', N'R3032')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3033, N'P3033', N'C3033', N'R3033')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3034, N'P3034', N'C3034', N'R3034')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3035, N'P3035', N'C3035', N'R3035')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3036, N'P3036', N'C3036', N'R3036')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3037, N'P3037', N'C3037', N'R3037')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3038, N'P3038', N'C3038', N'R3038')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3039, N'P3039', N'C3039', N'R3039')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3040, N'P3040', N'C3040', N'R3040')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3041, N'P3041', N'C3041', N'R3041')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3042, N'P3042', N'C3042', N'R3042')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3043, N'P3043', N'C3043', N'R3043')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3044, N'P3044', N'C3044', N'R3044')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3045, N'P3045', N'C3045', N'R3045')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3046, N'P3046', N'C3046', N'R3046')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3047, N'P3047', N'C3047', N'R3047')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3048, N'P3048', N'C3048', N'R3048')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3049, N'P3049', N'C3049', N'R3049')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3050, N'P3050', N'C3050', N'R3050')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3051, N'P3051', N'C3051', N'R3051')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3052, N'P3052', N'C3052', N'R3052')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3053, N'P3053', N'C3053', N'R3053')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3054, N'P3054', N'C3054', N'R3054')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3055, N'P3055', N'C3055', N'R3055')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3056, N'P3056', N'C3056', N'R3056')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3057, N'P3057', N'C3057', N'R3057')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3058, N'P3058', N'C3058', N'R3058')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3059, N'P3059', N'C3059', N'R3059')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3060, N'P3060', N'C3060', N'R3060')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3061, N'P3061', N'C3061', N'R3061')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3062, N'P3062', N'C3062', N'R3062')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3063, N'P3063', N'C3063', N'R3063')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3064, N'P3064', N'C3064', N'R3064')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3065, N'P3065', N'C3065', N'R3065')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3066, N'P3066', N'C3066', N'R3066')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3067, N'P3067', N'C3067', N'R3067')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3068, N'P3068', N'C3068', N'R3068')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3069, N'P3069', N'C3069', N'R3069')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3070, N'P3070', N'C3070', N'R3070')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3071, N'P3071', N'C3071', N'R3071')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3072, N'P3072', N'C3072', N'R3072')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3073, N'P3073', N'C3073', N'R3073')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3074, N'P3074', N'C3074', N'R3074')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3075, N'P3075', N'C3075', N'R3075')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3076, N'P3076', N'C3076', N'R3076')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3077, N'P3077', N'C3077', N'R3077')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3078, N'P3078', N'C3078', N'R3078')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3079, N'P3079', N'C3079', N'R3079')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3080, N'P3080', N'C3080', N'R3080')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3081, N'P3081', N'C3081', N'R3081')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3082, N'P3082', N'C3082', N'R3082')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3083, N'P3083', N'C3083', N'R3083')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3084, N'P3084', N'C3084', N'R3084')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3085, N'P3085', N'C3085', N'R3085')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3086, N'P3086', N'C3086', N'R3086')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3087, N'P3087', N'C3087', N'R3087')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3088, N'P3088', N'C3088', N'R3088')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3089, N'P3089', N'C3089', N'R3089')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3090, N'P3090', N'C3090', N'R3090')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3091, N'P3091', N'C3091', N'R3091')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3092, N'P3092', N'C3092', N'R3092')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3093, N'P3093', N'C3093', N'R3093')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3094, N'P3094', N'C3094', N'R3094')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3095, N'P3095', N'C3095', N'R3095')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3096, N'P3096', N'C3096', N'R3096')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3097, N'P3097', N'C3097', N'R3097')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3098, N'P3098', N'C3098', N'R3098')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3099, N'P3099', N'C3099', N'R3099')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3100, N'P3100', N'C3100', N'R3100')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3101, N'P3101', N'C3101', N'R3101')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3102, N'P3102', N'C3102', N'R3102')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3103, N'P3103', N'C3103', N'R3103')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3104, N'P3104', N'C3104', N'R3104')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3105, N'P3105', N'C3105', N'R3105')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3106, N'P3106', N'C3106', N'R3106')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3107, N'P3107', N'C3107', N'R3107')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3108, N'P3108', N'C3108', N'R3108')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3109, N'P3109', N'C3109', N'R3109')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3110, N'P3110', N'C3110', N'R3110')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3111, N'P3111', N'C3111', N'R3111')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3112, N'P3112', N'C3112', N'R3112')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3113, N'P3113', N'C3113', N'R3113')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3114, N'P3114', N'C3114', N'R3114')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3115, N'P3115', N'C3115', N'R3115')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3116, N'P3116', N'C3116', N'R3116')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3117, N'P3117', N'C3117', N'R3117')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3118, N'P3118', N'C3118', N'R3118')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3119, N'P3119', N'C3119', N'R3119')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3120, N'P3120', N'C3120', N'R3120')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3121, N'P3121', N'C3121', N'R3121')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3122, N'P3122', N'C3122', N'R3122')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3123, N'P3123', N'C3123', N'R3123')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3124, N'P3124', N'C3124', N'R3124')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3125, N'P3125', N'C3125', N'R3125')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3126, N'P3126', N'C3126', N'R3126')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3127, N'P3127', N'C3127', N'R3127')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3128, N'P3128', N'C3128', N'R3128')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3129, N'P3129', N'C3129', N'R3129')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3130, N'P3130', N'C3130', N'R3130')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3131, N'P3131', N'C3131', N'R3131')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3132, N'P3132', N'C3132', N'R3132')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3133, N'P3133', N'C3133', N'R3133')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3134, N'P3134', N'C3134', N'R3134')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3135, N'P3135', N'C3135', N'R3135')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3136, N'P3136', N'C3136', N'R3136')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3137, N'P3137', N'C3137', N'R3137')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3138, N'P3138', N'C3138', N'R3138')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3139, N'P3139', N'C3139', N'R3139')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3140, N'P3140', N'C3140', N'R3140')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3141, N'P3141', N'C3141', N'R3141')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3142, N'P3142', N'C3142', N'R3142')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3143, N'P3143', N'C3143', N'R3143')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3144, N'P3144', N'C3144', N'R3144')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3145, N'P3145', N'C3145', N'R3145')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3146, N'P3146', N'C3146', N'R3146')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3147, N'P3147', N'C3147', N'R3147')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3148, N'P3148', N'C3148', N'R3148')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3149, N'P3149', N'C3149', N'R3149')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3150, N'P3150', N'C3150', N'R3150')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3151, N'P3151', N'C3151', N'R3151')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3152, N'P3152', N'C3152', N'R3152')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3153, N'P3153', N'C3153', N'R3153')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3154, N'P3154', N'C3154', N'R3154')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3155, N'P3155', N'C3155', N'R3155')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3156, N'P3156', N'C3156', N'R3156')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3157, N'P3157', N'C3157', N'R3157')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3158, N'P3158', N'C3158', N'R3158')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3159, N'P3159', N'C3159', N'R3159')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3160, N'P3160', N'C3160', N'R3160')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3161, N'P3161', N'C3161', N'R3161')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3162, N'P3162', N'C3162', N'R3162')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3163, N'P3163', N'C3163', N'R3163')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3164, N'P3164', N'C3164', N'R3164')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3165, N'P3165', N'C3165', N'R3165')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3166, N'P3166', N'C3166', N'R3166')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3167, N'P3167', N'C3167', N'R3167')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3168, N'P3168', N'C3168', N'R3168')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3169, N'P3169', N'C3169', N'R3169')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3170, N'P3170', N'C3170', N'R3170')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3171, N'P3171', N'C3171', N'R3171')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3172, N'P3172', N'C3172', N'R3172')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3173, N'P3173', N'C3173', N'R3173')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3174, N'P3174', N'C3174', N'R3174')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3175, N'P3175', N'C3175', N'R3175')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3176, N'P3176', N'C3176', N'R3176')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3177, N'P3177', N'C3177', N'R3177')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3178, N'P3178', N'C3178', N'R3178')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3179, N'P3179', N'C3179', N'R3179')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3180, N'P3180', N'C3180', N'R3180')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3181, N'P3181', N'C3181', N'R3181')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3182, N'P3182', N'C3182', N'R3182')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3183, N'P3183', N'C3183', N'R3183')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3184, N'P3184', N'C3184', N'R3184')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3185, N'P3185', N'C3185', N'R3185')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3186, N'P3186', N'C3186', N'R3186')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3187, N'P3187', N'C3187', N'R3187')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3188, N'P3188', N'C3188', N'R3188')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3189, N'P3189', N'C3189', N'R3189')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3190, N'P3190', N'C3190', N'R3190')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3191, N'P3191', N'C3191', N'R3191')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3192, N'P3192', N'C3192', N'R3192')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3193, N'P3193', N'C3193', N'R3193')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3194, N'P3194', N'C3194', N'R3194')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3195, N'P3195', N'C3195', N'R3195')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3196, N'P3196', N'C3196', N'R3196')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3197, N'P3197', N'C3197', N'R3197')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3198, N'P3198', N'C3198', N'R3198')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3199, N'P3199', N'C3199', N'R3199')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3200, N'P3200', N'C3200', N'R3200')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3201, N'P3201', N'C3201', N'R3201')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3202, N'P3202', N'C3202', N'R3202')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3203, N'P3203', N'C3203', N'R3203')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3204, N'P3204', N'C3204', N'R3204')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3205, N'P3205', N'C3205', N'R3205')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3206, N'P3206', N'C3206', N'R3206')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3207, N'P3207', N'C3207', N'R3207')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3208, N'P3208', N'C3208', N'R3208')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3209, N'P3209', N'C3209', N'R3209')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3210, N'P3210', N'C3210', N'R3210')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3211, N'P3211', N'C3211', N'R3211')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3212, N'P3212', N'C3212', N'R3212')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3213, N'P3213', N'C3213', N'R3213')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3214, N'P3214', N'C3214', N'R3214')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3215, N'P3215', N'C3215', N'R3215')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3216, N'P3216', N'C3216', N'R3216')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3217, N'P3217', N'C3217', N'R3217')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3218, N'P3218', N'C3218', N'R3218')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3219, N'P3219', N'C3219', N'R3219')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3220, N'P3220', N'C3220', N'R3220')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3221, N'P3221', N'C3221', N'R3221')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3222, N'P3222', N'C3222', N'R3222')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3223, N'P3223', N'C3223', N'R3223')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3224, N'P3224', N'C3224', N'R3224')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3225, N'P3225', N'C3225', N'R3225')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3226, N'P3226', N'C3226', N'R3226')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3227, N'P3227', N'C3227', N'R3227')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3228, N'P3228', N'C3228', N'R3228')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3229, N'P3229', N'C3229', N'R3229')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3230, N'P3230', N'C3230', N'R3230')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3231, N'P3231', N'C3231', N'R3231')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3232, N'P3232', N'C3232', N'R3232')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3233, N'P3233', N'C3233', N'R3233')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3234, N'P3234', N'C3234', N'R3234')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3235, N'P3235', N'C3235', N'R3235')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3236, N'P3236', N'C3236', N'R3236')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3237, N'P3237', N'C3237', N'R3237')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3238, N'P3238', N'C3238', N'R3238')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3239, N'P3239', N'C3239', N'R3239')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3240, N'P3240', N'C3240', N'R3240')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3241, N'P3241', N'C3241', N'R3241')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3242, N'P3242', N'C3242', N'R3242')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3243, N'P3243', N'C3243', N'R3243')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3244, N'P3244', N'C3244', N'R3244')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3245, N'P3245', N'C3245', N'R3245')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3246, N'P3246', N'C3246', N'R3246')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3247, N'P3247', N'C3247', N'R3247')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3248, N'P3248', N'C3248', N'R3248')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3249, N'P3249', N'C3249', N'R3249')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3250, N'P3250', N'C3250', N'R3250')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3251, N'P3251', N'C3251', N'R3251')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3252, N'P3252', N'C3252', N'R3252')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3253, N'P3253', N'C3253', N'R3253')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3254, N'P3254', N'C3254', N'R3254')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3255, N'P3255', N'C3255', N'R3255')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3256, N'P3256', N'C3256', N'R3256')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3257, N'P3257', N'C3257', N'R3257')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3258, N'P3258', N'C3258', N'R3258')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3259, N'P3259', N'C3259', N'R3259')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3260, N'P3260', N'C3260', N'R3260')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3261, N'P3261', N'C3261', N'R3261')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3262, N'P3262', N'C3262', N'R3262')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3263, N'P3263', N'C3263', N'R3263')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3264, N'P3264', N'C3264', N'R3264')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3265, N'P3265', N'C3265', N'R3265')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3266, N'P3266', N'C3266', N'R3266')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3267, N'P3267', N'C3267', N'R3267')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3268, N'P3268', N'C3268', N'R3268')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3269, N'P3269', N'C3269', N'R3269')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3270, N'P3270', N'C3270', N'R3270')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3271, N'P3271', N'C3271', N'R3271')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3272, N'P3272', N'C3272', N'R3272')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3273, N'P3273', N'C3273', N'R3273')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3274, N'P3274', N'C3274', N'R3274')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3275, N'P3275', N'C3275', N'R3275')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3276, N'P3276', N'C3276', N'R3276')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3277, N'P3277', N'C3277', N'R3277')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3278, N'P3278', N'C3278', N'R3278')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3279, N'P3279', N'C3279', N'R3279')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3280, N'P3280', N'C3280', N'R3280')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3281, N'P3281', N'C3281', N'R3281')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3282, N'P3282', N'C3282', N'R3282')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3283, N'P3283', N'C3283', N'R3283')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3284, N'P3284', N'C3284', N'R3284')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3285, N'P3285', N'C3285', N'R3285')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3286, N'P3286', N'C3286', N'R3286')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3287, N'P3287', N'C3287', N'R3287')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3288, N'P3288', N'C3288', N'R3288')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3289, N'P3289', N'C3289', N'R3289')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3290, N'P3290', N'C3290', N'R3290')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3291, N'P3291', N'C3291', N'R3291')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3292, N'P3292', N'C3292', N'R3292')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3293, N'P3293', N'C3293', N'R3293')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3294, N'P3294', N'C3294', N'R3294')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3295, N'P3295', N'C3295', N'R3295')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3296, N'P3296', N'C3296', N'R3296')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3297, N'P3297', N'C3297', N'R3297')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3298, N'P3298', N'C3298', N'R3298')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3299, N'P3299', N'C3299', N'R3299')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3300, N'P3300', N'C3300', N'R3300')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3301, N'P3301', N'C3301', N'R3301')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3302, N'P3302', N'C3302', N'R3302')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3303, N'P3303', N'C3303', N'R3303')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3304, N'P3304', N'C3304', N'R3304')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3305, N'P3305', N'C3305', N'R3305')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3306, N'P3306', N'C3306', N'R3306')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3307, N'P3307', N'C3307', N'R3307')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3308, N'P3308', N'C3308', N'R3308')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3309, N'P3309', N'C3309', N'R3309')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3310, N'P3310', N'C3310', N'R3310')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3311, N'P3311', N'C3311', N'R3311')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3312, N'P3312', N'C3312', N'R3312')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3313, N'P3313', N'C3313', N'R3313')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3314, N'P3314', N'C3314', N'R3314')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3315, N'P3315', N'C3315', N'R3315')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3316, N'P3316', N'C3316', N'R3316')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3317, N'P3317', N'C3317', N'R3317')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3318, N'P3318', N'C3318', N'R3318')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3319, N'P3319', N'C3319', N'R3319')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3320, N'P3320', N'C3320', N'R3320')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3321, N'P3321', N'C3321', N'R3321')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3322, N'P3322', N'C3322', N'R3322')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3323, N'P3323', N'C3323', N'R3323')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3324, N'P3324', N'C3324', N'R3324')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3325, N'P3325', N'C3325', N'R3325')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3326, N'P3326', N'C3326', N'R3326')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3327, N'P3327', N'C3327', N'R3327')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3328, N'P3328', N'C3328', N'R3328')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3329, N'P3329', N'C3329', N'R3329')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3330, N'P3330', N'C3330', N'R3330')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3331, N'P3331', N'C3331', N'R3331')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3332, N'P3332', N'C3332', N'R3332')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3333, N'P3333', N'C3333', N'R3333')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3334, N'P3334', N'C3334', N'R3334')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3335, N'P3335', N'C3335', N'R3335')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3336, N'P3336', N'C3336', N'R3336')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3337, N'P3337', N'C3337', N'R3337')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3338, N'P3338', N'C3338', N'R3338')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3339, N'P3339', N'C3339', N'R3339')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3340, N'P3340', N'C3340', N'R3340')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3341, N'P3341', N'C3341', N'R3341')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3342, N'P3342', N'C3342', N'R3342')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3343, N'P3343', N'C3343', N'R3343')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3344, N'P3344', N'C3344', N'R3344')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3345, N'P3345', N'C3345', N'R3345')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3346, N'P3346', N'C3346', N'R3346')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3347, N'P3347', N'C3347', N'R3347')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3348, N'P3348', N'C3348', N'R3348')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3349, N'P3349', N'C3349', N'R3349')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3350, N'P3350', N'C3350', N'R3350')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3351, N'P3351', N'C3351', N'R3351')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3352, N'P3352', N'C3352', N'R3352')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3353, N'P3353', N'C3353', N'R3353')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3354, N'P3354', N'C3354', N'R3354')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3355, N'P3355', N'C3355', N'R3355')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3356, N'P3356', N'C3356', N'R3356')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3357, N'P3357', N'C3357', N'R3357')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3358, N'P3358', N'C3358', N'R3358')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3359, N'P3359', N'C3359', N'R3359')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3360, N'P3360', N'C3360', N'R3360')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3361, N'P3361', N'C3361', N'R3361')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3362, N'P3362', N'C3362', N'R3362')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3363, N'P3363', N'C3363', N'R3363')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3364, N'P3364', N'C3364', N'R3364')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3365, N'P3365', N'C3365', N'R3365')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3366, N'P3366', N'C3366', N'R3366')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3367, N'P3367', N'C3367', N'R3367')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3368, N'P3368', N'C3368', N'R3368')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3369, N'P3369', N'C3369', N'R3369')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3370, N'P3370', N'C3370', N'R3370')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3371, N'P3371', N'C3371', N'R3371')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3372, N'P3372', N'C3372', N'R3372')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3373, N'P3373', N'C3373', N'R3373')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3374, N'P3374', N'C3374', N'R3374')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3375, N'P3375', N'C3375', N'R3375')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3376, N'P3376', N'C3376', N'R3376')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3377, N'P3377', N'C3377', N'R3377')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3378, N'P3378', N'C3378', N'R3378')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3379, N'P3379', N'C3379', N'R3379')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3380, N'P3380', N'C3380', N'R3380')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3381, N'P3381', N'C3381', N'R3381')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3382, N'P3382', N'C3382', N'R3382')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3383, N'P3383', N'C3383', N'R3383')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3384, N'P3384', N'C3384', N'R3384')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3385, N'P3385', N'C3385', N'R3385')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3386, N'P3386', N'C3386', N'R3386')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3387, N'P3387', N'C3387', N'R3387')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3388, N'P3388', N'C3388', N'R3388')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3389, N'P3389', N'C3389', N'R3389')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3390, N'P3390', N'C3390', N'R3390')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3391, N'P3391', N'C3391', N'R3391')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3392, N'P3392', N'C3392', N'R3392')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3393, N'P3393', N'C3393', N'R3393')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3394, N'P3394', N'C3394', N'R3394')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3395, N'P3395', N'C3395', N'R3395')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3396, N'P3396', N'C3396', N'R3396')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3397, N'P3397', N'C3397', N'R3397')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3398, N'P3398', N'C3398', N'R3398')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3399, N'P3399', N'C3399', N'R3399')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3400, N'P3400', N'C3400', N'R3400')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3401, N'P3401', N'C3401', N'R3401')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3402, N'P3402', N'C3402', N'R3402')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3403, N'P3403', N'C3403', N'R3403')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3404, N'P3404', N'C3404', N'R3404')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3405, N'P3405', N'C3405', N'R3405')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3406, N'P3406', N'C3406', N'R3406')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3407, N'P3407', N'C3407', N'R3407')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3408, N'P3408', N'C3408', N'R3408')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3409, N'P3409', N'C3409', N'R3409')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3410, N'P3410', N'C3410', N'R3410')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3411, N'P3411', N'C3411', N'R3411')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3412, N'P3412', N'C3412', N'R3412')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3413, N'P3413', N'C3413', N'R3413')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3414, N'P3414', N'C3414', N'R3414')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3415, N'P3415', N'C3415', N'R3415')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3416, N'P3416', N'C3416', N'R3416')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3417, N'P3417', N'C3417', N'R3417')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3418, N'P3418', N'C3418', N'R3418')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3419, N'P3419', N'C3419', N'R3419')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3420, N'P3420', N'C3420', N'R3420')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3421, N'P3421', N'C3421', N'R3421')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3422, N'P3422', N'C3422', N'R3422')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3423, N'P3423', N'C3423', N'R3423')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3424, N'P3424', N'C3424', N'R3424')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3425, N'P3425', N'C3425', N'R3425')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3426, N'P3426', N'C3426', N'R3426')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3427, N'P3427', N'C3427', N'R3427')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3428, N'P3428', N'C3428', N'R3428')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3429, N'P3429', N'C3429', N'R3429')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3430, N'P3430', N'C3430', N'R3430')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3431, N'P3431', N'C3431', N'R3431')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3432, N'P3432', N'C3432', N'R3432')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3433, N'P3433', N'C3433', N'R3433')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3434, N'P3434', N'C3434', N'R3434')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3435, N'P3435', N'C3435', N'R3435')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3436, N'P3436', N'C3436', N'R3436')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3437, N'P3437', N'C3437', N'R3437')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3438, N'P3438', N'C3438', N'R3438')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3439, N'P3439', N'C3439', N'R3439')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3440, N'P3440', N'C3440', N'R3440')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3441, N'P3441', N'C3441', N'R3441')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3442, N'P3442', N'C3442', N'R3442')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3443, N'P3443', N'C3443', N'R3443')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3444, N'P3444', N'C3444', N'R3444')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3445, N'P3445', N'C3445', N'R3445')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3446, N'P3446', N'C3446', N'R3446')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3447, N'P3447', N'C3447', N'R3447')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3448, N'P3448', N'C3448', N'R3448')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3449, N'P3449', N'C3449', N'R3449')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3450, N'P3450', N'C3450', N'R3450')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3451, N'P3451', N'C3451', N'R3451')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3452, N'P3452', N'C3452', N'R3452')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3453, N'P3453', N'C3453', N'R3453')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3454, N'P3454', N'C3454', N'R3454')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3455, N'P3455', N'C3455', N'R3455')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3456, N'P3456', N'C3456', N'R3456')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3457, N'P3457', N'C3457', N'R3457')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3458, N'P3458', N'C3458', N'R3458')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3459, N'P3459', N'C3459', N'R3459')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3460, N'P3460', N'C3460', N'R3460')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3461, N'P3461', N'C3461', N'R3461')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3462, N'P3462', N'C3462', N'R3462')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3463, N'P3463', N'C3463', N'R3463')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3464, N'P3464', N'C3464', N'R3464')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3465, N'P3465', N'C3465', N'R3465')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3466, N'P3466', N'C3466', N'R3466')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3467, N'P3467', N'C3467', N'R3467')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3468, N'P3468', N'C3468', N'R3468')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3469, N'P3469', N'C3469', N'R3469')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3470, N'P3470', N'C3470', N'R3470')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3471, N'P3471', N'C3471', N'R3471')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3472, N'P3472', N'C3472', N'R3472')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3473, N'P3473', N'C3473', N'R3473')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3474, N'P3474', N'C3474', N'R3474')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3475, N'P3475', N'C3475', N'R3475')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3476, N'P3476', N'C3476', N'R3476')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3477, N'P3477', N'C3477', N'R3477')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3478, N'P3478', N'C3478', N'R3478')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3479, N'P3479', N'C3479', N'R3479')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3480, N'P3480', N'C3480', N'R3480')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3481, N'P3481', N'C3481', N'R3481')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3482, N'P3482', N'C3482', N'R3482')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3483, N'P3483', N'C3483', N'R3483')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3484, N'P3484', N'C3484', N'R3484')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3485, N'P3485', N'C3485', N'R3485')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3486, N'P3486', N'C3486', N'R3486')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3487, N'P3487', N'C3487', N'R3487')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3488, N'P3488', N'C3488', N'R3488')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3489, N'P3489', N'C3489', N'R3489')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3490, N'P3490', N'C3490', N'R3490')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3491, N'P3491', N'C3491', N'R3491')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3492, N'P3492', N'C3492', N'R3492')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3493, N'P3493', N'C3493', N'R3493')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3494, N'P3494', N'C3494', N'R3494')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3495, N'P3495', N'C3495', N'R3495')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3496, N'P3496', N'C3496', N'R3496')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3497, N'P3497', N'C3497', N'R3497')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3498, N'P3498', N'C3498', N'R3498')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3499, N'P3499', N'C3499', N'R3499')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3500, N'P3500', N'C3500', N'R3500')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3501, N'P3501', N'C3501', N'R3501')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3502, N'P3502', N'C3502', N'R3502')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3503, N'P3503', N'C3503', N'R3503')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3504, N'P3504', N'C3504', N'R3504')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3505, N'P3505', N'C3505', N'R3505')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3506, N'P3506', N'C3506', N'R3506')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3507, N'P3507', N'C3507', N'R3507')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3508, N'P3508', N'C3508', N'R3508')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3509, N'P3509', N'C3509', N'R3509')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3510, N'P3510', N'C3510', N'R3510')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3511, N'P3511', N'C3511', N'R3511')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3512, N'P3512', N'C3512', N'R3512')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3513, N'P3513', N'C3513', N'R3513')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3514, N'P3514', N'C3514', N'R3514')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3515, N'P3515', N'C3515', N'R3515')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3516, N'P3516', N'C3516', N'R3516')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3517, N'P3517', N'C3517', N'R3517')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3518, N'P3518', N'C3518', N'R3518')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3519, N'P3519', N'C3519', N'R3519')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3520, N'P3520', N'C3520', N'R3520')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3521, N'P3521', N'C3521', N'R3521')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3522, N'P3522', N'C3522', N'R3522')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3523, N'P3523', N'C3523', N'R3523')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3524, N'P3524', N'C3524', N'R3524')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3525, N'P3525', N'C3525', N'R3525')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3526, N'P3526', N'C3526', N'R3526')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3527, N'P3527', N'C3527', N'R3527')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3528, N'P3528', N'C3528', N'R3528')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3529, N'P3529', N'C3529', N'R3529')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3530, N'P3530', N'C3530', N'R3530')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3531, N'P3531', N'C3531', N'R3531')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3532, N'P3532', N'C3532', N'R3532')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3533, N'P3533', N'C3533', N'R3533')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3534, N'P3534', N'C3534', N'R3534')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3535, N'P3535', N'C3535', N'R3535')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3536, N'P3536', N'C3536', N'R3536')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3537, N'P3537', N'C3537', N'R3537')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3538, N'P3538', N'C3538', N'R3538')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3539, N'P3539', N'C3539', N'R3539')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3540, N'P3540', N'C3540', N'R3540')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3541, N'P3541', N'C3541', N'R3541')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3542, N'P3542', N'C3542', N'R3542')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3543, N'P3543', N'C3543', N'R3543')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3544, N'P3544', N'C3544', N'R3544')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3545, N'P3545', N'C3545', N'R3545')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3546, N'P3546', N'C3546', N'R3546')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3547, N'P3547', N'C3547', N'R3547')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3548, N'P3548', N'C3548', N'R3548')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3549, N'P3549', N'C3549', N'R3549')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3550, N'P3550', N'C3550', N'R3550')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3551, N'P3551', N'C3551', N'R3551')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3552, N'P3552', N'C3552', N'R3552')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3553, N'P3553', N'C3553', N'R3553')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3554, N'P3554', N'C3554', N'R3554')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3555, N'P3555', N'C3555', N'R3555')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3556, N'P3556', N'C3556', N'R3556')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3557, N'P3557', N'C3557', N'R3557')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3558, N'P3558', N'C3558', N'R3558')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3559, N'P3559', N'C3559', N'R3559')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3560, N'P3560', N'C3560', N'R3560')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3561, N'P3561', N'C3561', N'R3561')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3562, N'P3562', N'C3562', N'R3562')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3563, N'P3563', N'C3563', N'R3563')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3564, N'P3564', N'C3564', N'R3564')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3565, N'P3565', N'C3565', N'R3565')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3566, N'P3566', N'C3566', N'R3566')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3567, N'P3567', N'C3567', N'R3567')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3568, N'P3568', N'C3568', N'R3568')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3569, N'P3569', N'C3569', N'R3569')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3570, N'P3570', N'C3570', N'R3570')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3571, N'P3571', N'C3571', N'R3571')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3572, N'P3572', N'C3572', N'R3572')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3573, N'P3573', N'C3573', N'R3573')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3574, N'P3574', N'C3574', N'R3574')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3575, N'P3575', N'C3575', N'R3575')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3576, N'P3576', N'C3576', N'R3576')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3577, N'P3577', N'C3577', N'R3577')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3578, N'P3578', N'C3578', N'R3578')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3579, N'P3579', N'C3579', N'R3579')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3580, N'P3580', N'C3580', N'R3580')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3581, N'P3581', N'C3581', N'R3581')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3582, N'P3582', N'C3582', N'R3582')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3583, N'P3583', N'C3583', N'R3583')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3584, N'P3584', N'C3584', N'R3584')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3585, N'P3585', N'C3585', N'R3585')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3586, N'P3586', N'C3586', N'R3586')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3587, N'P3587', N'C3587', N'R3587')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3588, N'P3588', N'C3588', N'R3588')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3589, N'P3589', N'C3589', N'R3589')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3590, N'P3590', N'C3590', N'R3590')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3591, N'P3591', N'C3591', N'R3591')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3592, N'P3592', N'C3592', N'R3592')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3593, N'P3593', N'C3593', N'R3593')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3594, N'P3594', N'C3594', N'R3594')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3595, N'P3595', N'C3595', N'R3595')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3596, N'P3596', N'C3596', N'R3596')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3597, N'P3597', N'C3597', N'R3597')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3598, N'P3598', N'C3598', N'R3598')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3599, N'P3599', N'C3599', N'R3599')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3600, N'P3600', N'C3600', N'R3600')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3601, N'P3601', N'C3601', N'R3601')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3602, N'P3602', N'C3602', N'R3602')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3603, N'P3603', N'C3603', N'R3603')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3604, N'P3604', N'C3604', N'R3604')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3605, N'P3605', N'C3605', N'R3605')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3606, N'P3606', N'C3606', N'R3606')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3607, N'P3607', N'C3607', N'R3607')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3608, N'P3608', N'C3608', N'R3608')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3609, N'P3609', N'C3609', N'R3609')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3610, N'P3610', N'C3610', N'R3610')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3611, N'P3611', N'C3611', N'R3611')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3612, N'P3612', N'C3612', N'R3612')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3613, N'P3613', N'C3613', N'R3613')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3614, N'P3614', N'C3614', N'R3614')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3615, N'P3615', N'C3615', N'R3615')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3616, N'P3616', N'C3616', N'R3616')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3617, N'P3617', N'C3617', N'R3617')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3618, N'P3618', N'C3618', N'R3618')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3619, N'P3619', N'C3619', N'R3619')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3620, N'P3620', N'C3620', N'R3620')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3621, N'P3621', N'C3621', N'R3621')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3622, N'P3622', N'C3622', N'R3622')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3623, N'P3623', N'C3623', N'R3623')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3624, N'P3624', N'C3624', N'R3624')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3625, N'P3625', N'C3625', N'R3625')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3626, N'P3626', N'C3626', N'R3626')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3627, N'P3627', N'C3627', N'R3627')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3628, N'P3628', N'C3628', N'R3628')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3629, N'P3629', N'C3629', N'R3629')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3630, N'P3630', N'C3630', N'R3630')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3631, N'P3631', N'C3631', N'R3631')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3632, N'P3632', N'C3632', N'R3632')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3633, N'P3633', N'C3633', N'R3633')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3634, N'P3634', N'C3634', N'R3634')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3635, N'P3635', N'C3635', N'R3635')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3636, N'P3636', N'C3636', N'R3636')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3637, N'P3637', N'C3637', N'R3637')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3638, N'P3638', N'C3638', N'R3638')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3639, N'P3639', N'C3639', N'R3639')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3640, N'P3640', N'C3640', N'R3640')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3641, N'P3641', N'C3641', N'R3641')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3642, N'P3642', N'C3642', N'R3642')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3643, N'P3643', N'C3643', N'R3643')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3644, N'P3644', N'C3644', N'R3644')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3645, N'P3645', N'C3645', N'R3645')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3646, N'P3646', N'C3646', N'R3646')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3647, N'P3647', N'C3647', N'R3647')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3648, N'P3648', N'C3648', N'R3648')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3649, N'P3649', N'C3649', N'R3649')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3650, N'P3650', N'C3650', N'R3650')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3651, N'P3651', N'C3651', N'R3651')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3652, N'P3652', N'C3652', N'R3652')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3653, N'P3653', N'C3653', N'R3653')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3654, N'P3654', N'C3654', N'R3654')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3655, N'P3655', N'C3655', N'R3655')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3656, N'P3656', N'C3656', N'R3656')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3657, N'P3657', N'C3657', N'R3657')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3658, N'P3658', N'C3658', N'R3658')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3659, N'P3659', N'C3659', N'R3659')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3660, N'P3660', N'C3660', N'R3660')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3661, N'P3661', N'C3661', N'R3661')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3662, N'P3662', N'C3662', N'R3662')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3663, N'P3663', N'C3663', N'R3663')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3664, N'P3664', N'C3664', N'R3664')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3665, N'P3665', N'C3665', N'R3665')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3666, N'P3666', N'C3666', N'R3666')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3667, N'P3667', N'C3667', N'R3667')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3668, N'P3668', N'C3668', N'R3668')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3669, N'P3669', N'C3669', N'R3669')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3670, N'P3670', N'C3670', N'R3670')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3671, N'P3671', N'C3671', N'R3671')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3672, N'P3672', N'C3672', N'R3672')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3673, N'P3673', N'C3673', N'R3673')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3674, N'P3674', N'C3674', N'R3674')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3675, N'P3675', N'C3675', N'R3675')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3676, N'P3676', N'C3676', N'R3676')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3677, N'P3677', N'C3677', N'R3677')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3678, N'P3678', N'C3678', N'R3678')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3679, N'P3679', N'C3679', N'R3679')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3680, N'P3680', N'C3680', N'R3680')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3681, N'P3681', N'C3681', N'R3681')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3682, N'P3682', N'C3682', N'R3682')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3683, N'P3683', N'C3683', N'R3683')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3684, N'P3684', N'C3684', N'R3684')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3685, N'P3685', N'C3685', N'R3685')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3686, N'P3686', N'C3686', N'R3686')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3687, N'P3687', N'C3687', N'R3687')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3688, N'P3688', N'C3688', N'R3688')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3689, N'P3689', N'C3689', N'R3689')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3690, N'P3690', N'C3690', N'R3690')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3691, N'P3691', N'C3691', N'R3691')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3692, N'P3692', N'C3692', N'R3692')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3693, N'P3693', N'C3693', N'R3693')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3694, N'P3694', N'C3694', N'R3694')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3695, N'P3695', N'C3695', N'R3695')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3696, N'P3696', N'C3696', N'R3696')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3697, N'P3697', N'C3697', N'R3697')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3698, N'P3698', N'C3698', N'R3698')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3699, N'P3699', N'C3699', N'R3699')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3700, N'P3700', N'C3700', N'R3700')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3701, N'P3701', N'C3701', N'R3701')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3702, N'P3702', N'C3702', N'R3702')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3703, N'P3703', N'C3703', N'R3703')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3704, N'P3704', N'C3704', N'R3704')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3705, N'P3705', N'C3705', N'R3705')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3706, N'P3706', N'C3706', N'R3706')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3707, N'P3707', N'C3707', N'R3707')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3708, N'P3708', N'C3708', N'R3708')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3709, N'P3709', N'C3709', N'R3709')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3710, N'P3710', N'C3710', N'R3710')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3711, N'P3711', N'C3711', N'R3711')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3712, N'P3712', N'C3712', N'R3712')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3713, N'P3713', N'C3713', N'R3713')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3714, N'P3714', N'C3714', N'R3714')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3715, N'P3715', N'C3715', N'R3715')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3716, N'P3716', N'C3716', N'R3716')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3717, N'P3717', N'C3717', N'R3717')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3718, N'P3718', N'C3718', N'R3718')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3719, N'P3719', N'C3719', N'R3719')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3720, N'P3720', N'C3720', N'R3720')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3721, N'P3721', N'C3721', N'R3721')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3722, N'P3722', N'C3722', N'R3722')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3723, N'P3723', N'C3723', N'R3723')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3724, N'P3724', N'C3724', N'R3724')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3725, N'P3725', N'C3725', N'R3725')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3726, N'P3726', N'C3726', N'R3726')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3727, N'P3727', N'C3727', N'R3727')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3728, N'P3728', N'C3728', N'R3728')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3729, N'P3729', N'C3729', N'R3729')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3730, N'P3730', N'C3730', N'R3730')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3731, N'P3731', N'C3731', N'R3731')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3732, N'P3732', N'C3732', N'R3732')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3733, N'P3733', N'C3733', N'R3733')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3734, N'P3734', N'C3734', N'R3734')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3735, N'P3735', N'C3735', N'R3735')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3736, N'P3736', N'C3736', N'R3736')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3737, N'P3737', N'C3737', N'R3737')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3738, N'P3738', N'C3738', N'R3738')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3739, N'P3739', N'C3739', N'R3739')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3740, N'P3740', N'C3740', N'R3740')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3741, N'P3741', N'C3741', N'R3741')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3742, N'P3742', N'C3742', N'R3742')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3743, N'P3743', N'C3743', N'R3743')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3744, N'P3744', N'C3744', N'R3744')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3745, N'P3745', N'C3745', N'R3745')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3746, N'P3746', N'C3746', N'R3746')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3747, N'P3747', N'C3747', N'R3747')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3748, N'P3748', N'C3748', N'R3748')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3749, N'P3749', N'C3749', N'R3749')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3750, N'P3750', N'C3750', N'R3750')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3751, N'P3751', N'C3751', N'R3751')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3752, N'P3752', N'C3752', N'R3752')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3753, N'P3753', N'C3753', N'R3753')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3754, N'P3754', N'C3754', N'R3754')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3755, N'P3755', N'C3755', N'R3755')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3756, N'P3756', N'C3756', N'R3756')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3757, N'P3757', N'C3757', N'R3757')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3758, N'P3758', N'C3758', N'R3758')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3759, N'P3759', N'C3759', N'R3759')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3760, N'P3760', N'C3760', N'R3760')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3761, N'P3761', N'C3761', N'R3761')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3762, N'P3762', N'C3762', N'R3762')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3763, N'P3763', N'C3763', N'R3763')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3764, N'P3764', N'C3764', N'R3764')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3765, N'P3765', N'C3765', N'R3765')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3766, N'P3766', N'C3766', N'R3766')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3767, N'P3767', N'C3767', N'R3767')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3768, N'P3768', N'C3768', N'R3768')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3769, N'P3769', N'C3769', N'R3769')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3770, N'P3770', N'C3770', N'R3770')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3771, N'P3771', N'C3771', N'R3771')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3772, N'P3772', N'C3772', N'R3772')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3773, N'P3773', N'C3773', N'R3773')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3774, N'P3774', N'C3774', N'R3774')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3775, N'P3775', N'C3775', N'R3775')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3776, N'P3776', N'C3776', N'R3776')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3777, N'P3777', N'C3777', N'R3777')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3778, N'P3778', N'C3778', N'R3778')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3779, N'P3779', N'C3779', N'R3779')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3780, N'P3780', N'C3780', N'R3780')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3781, N'P3781', N'C3781', N'R3781')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3782, N'P3782', N'C3782', N'R3782')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3783, N'P3783', N'C3783', N'R3783')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3784, N'P3784', N'C3784', N'R3784')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3785, N'P3785', N'C3785', N'R3785')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3786, N'P3786', N'C3786', N'R3786')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3787, N'P3787', N'C3787', N'R3787')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3788, N'P3788', N'C3788', N'R3788')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3789, N'P3789', N'C3789', N'R3789')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3790, N'P3790', N'C3790', N'R3790')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3791, N'P3791', N'C3791', N'R3791')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3792, N'P3792', N'C3792', N'R3792')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3793, N'P3793', N'C3793', N'R3793')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3794, N'P3794', N'C3794', N'R3794')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3795, N'P3795', N'C3795', N'R3795')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3796, N'P3796', N'C3796', N'R3796')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3797, N'P3797', N'C3797', N'R3797')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3798, N'P3798', N'C3798', N'R3798')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3799, N'P3799', N'C3799', N'R3799')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3800, N'P3800', N'C3800', N'R3800')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3801, N'P3801', N'C3801', N'R3801')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3802, N'P3802', N'C3802', N'R3802')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3803, N'P3803', N'C3803', N'R3803')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3804, N'P3804', N'C3804', N'R3804')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3805, N'P3805', N'C3805', N'R3805')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3806, N'P3806', N'C3806', N'R3806')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3807, N'P3807', N'C3807', N'R3807')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3808, N'P3808', N'C3808', N'R3808')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3809, N'P3809', N'C3809', N'R3809')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3810, N'P3810', N'C3810', N'R3810')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3811, N'P3811', N'C3811', N'R3811')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3812, N'P3812', N'C3812', N'R3812')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3813, N'P3813', N'C3813', N'R3813')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3814, N'P3814', N'C3814', N'R3814')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3815, N'P3815', N'C3815', N'R3815')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3816, N'P3816', N'C3816', N'R3816')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3817, N'P3817', N'C3817', N'R3817')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3818, N'P3818', N'C3818', N'R3818')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3819, N'P3819', N'C3819', N'R3819')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3820, N'P3820', N'C3820', N'R3820')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3821, N'P3821', N'C3821', N'R3821')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3822, N'P3822', N'C3822', N'R3822')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3823, N'P3823', N'C3823', N'R3823')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3824, N'P3824', N'C3824', N'R3824')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3825, N'P3825', N'C3825', N'R3825')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3826, N'P3826', N'C3826', N'R3826')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3827, N'P3827', N'C3827', N'R3827')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3828, N'P3828', N'C3828', N'R3828')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3829, N'P3829', N'C3829', N'R3829')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3830, N'P3830', N'C3830', N'R3830')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3831, N'P3831', N'C3831', N'R3831')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3832, N'P3832', N'C3832', N'R3832')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3833, N'P3833', N'C3833', N'R3833')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3834, N'P3834', N'C3834', N'R3834')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3835, N'P3835', N'C3835', N'R3835')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3836, N'P3836', N'C3836', N'R3836')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3837, N'P3837', N'C3837', N'R3837')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3838, N'P3838', N'C3838', N'R3838')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3839, N'P3839', N'C3839', N'R3839')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3840, N'P3840', N'C3840', N'R3840')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3841, N'P3841', N'C3841', N'R3841')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3842, N'P3842', N'C3842', N'R3842')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3843, N'P3843', N'C3843', N'R3843')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3844, N'P3844', N'C3844', N'R3844')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3845, N'P3845', N'C3845', N'R3845')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3846, N'P3846', N'C3846', N'R3846')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3847, N'P3847', N'C3847', N'R3847')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3848, N'P3848', N'C3848', N'R3848')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3849, N'P3849', N'C3849', N'R3849')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3850, N'P3850', N'C3850', N'R3850')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3851, N'P3851', N'C3851', N'R3851')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3852, N'P3852', N'C3852', N'R3852')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3853, N'P3853', N'C3853', N'R3853')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3854, N'P3854', N'C3854', N'R3854')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3855, N'P3855', N'C3855', N'R3855')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3856, N'P3856', N'C3856', N'R3856')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3857, N'P3857', N'C3857', N'R3857')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3858, N'P3858', N'C3858', N'R3858')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3859, N'P3859', N'C3859', N'R3859')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3860, N'P3860', N'C3860', N'R3860')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3861, N'P3861', N'C3861', N'R3861')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3862, N'P3862', N'C3862', N'R3862')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3863, N'P3863', N'C3863', N'R3863')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3864, N'P3864', N'C3864', N'R3864')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3865, N'P3865', N'C3865', N'R3865')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3866, N'P3866', N'C3866', N'R3866')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3867, N'P3867', N'C3867', N'R3867')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3868, N'P3868', N'C3868', N'R3868')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3869, N'P3869', N'C3869', N'R3869')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3870, N'P3870', N'C3870', N'R3870')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3871, N'P3871', N'C3871', N'R3871')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3872, N'P3872', N'C3872', N'R3872')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3873, N'P3873', N'C3873', N'R3873')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3874, N'P3874', N'C3874', N'R3874')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3875, N'P3875', N'C3875', N'R3875')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3876, N'P3876', N'C3876', N'R3876')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3877, N'P3877', N'C3877', N'R3877')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3878, N'P3878', N'C3878', N'R3878')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3879, N'P3879', N'C3879', N'R3879')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3880, N'P3880', N'C3880', N'R3880')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3881, N'P3881', N'C3881', N'R3881')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3882, N'P3882', N'C3882', N'R3882')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3883, N'P3883', N'C3883', N'R3883')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3884, N'P3884', N'C3884', N'R3884')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3885, N'P3885', N'C3885', N'R3885')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3886, N'P3886', N'C3886', N'R3886')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3887, N'P3887', N'C3887', N'R3887')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3888, N'P3888', N'C3888', N'R3888')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3889, N'P3889', N'C3889', N'R3889')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3890, N'P3890', N'C3890', N'R3890')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3891, N'P3891', N'C3891', N'R3891')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3892, N'P3892', N'C3892', N'R3892')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3893, N'P3893', N'C3893', N'R3893')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3894, N'P3894', N'C3894', N'R3894')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3895, N'P3895', N'C3895', N'R3895')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3896, N'P3896', N'C3896', N'R3896')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3897, N'P3897', N'C3897', N'R3897')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3898, N'P3898', N'C3898', N'R3898')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3899, N'P3899', N'C3899', N'R3899')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3900, N'P3900', N'C3900', N'R3900')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3901, N'P3901', N'C3901', N'R3901')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3902, N'P3902', N'C3902', N'R3902')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3903, N'P3903', N'C3903', N'R3903')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3904, N'P3904', N'C3904', N'R3904')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3905, N'P3905', N'C3905', N'R3905')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3906, N'P3906', N'C3906', N'R3906')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3907, N'P3907', N'C3907', N'R3907')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3908, N'P3908', N'C3908', N'R3908')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3909, N'P3909', N'C3909', N'R3909')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3910, N'P3910', N'C3910', N'R3910')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3911, N'P3911', N'C3911', N'R3911')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3912, N'P3912', N'C3912', N'R3912')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3913, N'P3913', N'C3913', N'R3913')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3914, N'P3914', N'C3914', N'R3914')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3915, N'P3915', N'C3915', N'R3915')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3916, N'P3916', N'C3916', N'R3916')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3917, N'P3917', N'C3917', N'R3917')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3918, N'P3918', N'C3918', N'R3918')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3919, N'P3919', N'C3919', N'R3919')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3920, N'P3920', N'C3920', N'R3920')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3921, N'P3921', N'C3921', N'R3921')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3922, N'P3922', N'C3922', N'R3922')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3923, N'P3923', N'C3923', N'R3923')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3924, N'P3924', N'C3924', N'R3924')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3925, N'P3925', N'C3925', N'R3925')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3926, N'P3926', N'C3926', N'R3926')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3927, N'P3927', N'C3927', N'R3927')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3928, N'P3928', N'C3928', N'R3928')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3929, N'P3929', N'C3929', N'R3929')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3930, N'P3930', N'C3930', N'R3930')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3931, N'P3931', N'C3931', N'R3931')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3932, N'P3932', N'C3932', N'R3932')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3933, N'P3933', N'C3933', N'R3933')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3934, N'P3934', N'C3934', N'R3934')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3935, N'P3935', N'C3935', N'R3935')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3936, N'P3936', N'C3936', N'R3936')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3937, N'P3937', N'C3937', N'R3937')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3938, N'P3938', N'C3938', N'R3938')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3939, N'P3939', N'C3939', N'R3939')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3940, N'P3940', N'C3940', N'R3940')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3941, N'P3941', N'C3941', N'R3941')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3942, N'P3942', N'C3942', N'R3942')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3943, N'P3943', N'C3943', N'R3943')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3944, N'P3944', N'C3944', N'R3944')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3945, N'P3945', N'C3945', N'R3945')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3946, N'P3946', N'C3946', N'R3946')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3947, N'P3947', N'C3947', N'R3947')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3948, N'P3948', N'C3948', N'R3948')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3949, N'P3949', N'C3949', N'R3949')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3950, N'P3950', N'C3950', N'R3950')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3951, N'P3951', N'C3951', N'R3951')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3952, N'P3952', N'C3952', N'R3952')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3953, N'P3953', N'C3953', N'R3953')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3954, N'P3954', N'C3954', N'R3954')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3955, N'P3955', N'C3955', N'R3955')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3956, N'P3956', N'C3956', N'R3956')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3957, N'P3957', N'C3957', N'R3957')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3958, N'P3958', N'C3958', N'R3958')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3959, N'P3959', N'C3959', N'R3959')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3960, N'P3960', N'C3960', N'R3960')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3961, N'P3961', N'C3961', N'R3961')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3962, N'P3962', N'C3962', N'R3962')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3963, N'P3963', N'C3963', N'R3963')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3964, N'P3964', N'C3964', N'R3964')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3965, N'P3965', N'C3965', N'R3965')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3966, N'P3966', N'C3966', N'R3966')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3967, N'P3967', N'C3967', N'R3967')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3968, N'P3968', N'C3968', N'R3968')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3969, N'P3969', N'C3969', N'R3969')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3970, N'P3970', N'C3970', N'R3970')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3971, N'P3971', N'C3971', N'R3971')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3972, N'P3972', N'C3972', N'R3972')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3973, N'P3973', N'C3973', N'R3973')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3974, N'P3974', N'C3974', N'R3974')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3975, N'P3975', N'C3975', N'R3975')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3976, N'P3976', N'C3976', N'R3976')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3977, N'P3977', N'C3977', N'R3977')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3978, N'P3978', N'C3978', N'R3978')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3979, N'P3979', N'C3979', N'R3979')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3980, N'P3980', N'C3980', N'R3980')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3981, N'P3981', N'C3981', N'R3981')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3982, N'P3982', N'C3982', N'R3982')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3983, N'P3983', N'C3983', N'R3983')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3984, N'P3984', N'C3984', N'R3984')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3985, N'P3985', N'C3985', N'R3985')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3986, N'P3986', N'C3986', N'R3986')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3987, N'P3987', N'C3987', N'R3987')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3988, N'P3988', N'C3988', N'R3988')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3989, N'P3989', N'C3989', N'R3989')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3990, N'P3990', N'C3990', N'R3990')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3991, N'P3991', N'C3991', N'R3991')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3992, N'P3992', N'C3992', N'R3992')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3993, N'P3993', N'C3993', N'R3993')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3994, N'P3994', N'C3994', N'R3994')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3995, N'P3995', N'C3995', N'R3995')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3996, N'P3996', N'C3996', N'R3996')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3997, N'P3997', N'C3997', N'R3997')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3998, N'P3998', N'C3998', N'R3998')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (3999, N'P3999', N'C3999', N'R3999')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4000, N'P4000', N'C4000', N'R4000')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4001, N'P4001', N'C4001', N'R4001')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4002, N'P4002', N'C4002', N'R4002')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4003, N'P4003', N'C4003', N'R4003')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4004, N'P4004', N'C4004', N'R4004')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4005, N'P4005', N'C4005', N'R4005')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4006, N'P4006', N'C4006', N'R4006')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4007, N'P4007', N'C4007', N'R4007')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4008, N'P4008', N'C4008', N'R4008')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4009, N'P4009', N'C4009', N'R4009')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4010, N'P4010', N'C4010', N'R4010')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4011, N'P4011', N'C4011', N'R4011')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4012, N'P4012', N'C4012', N'R4012')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4013, N'P4013', N'C4013', N'R4013')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4014, N'P4014', N'C4014', N'R4014')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4015, N'P4015', N'C4015', N'R4015')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4016, N'P4016', N'C4016', N'R4016')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4017, N'P4017', N'C4017', N'R4017')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4018, N'P4018', N'C4018', N'R4018')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4019, N'P4019', N'C4019', N'R4019')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4020, N'P4020', N'C4020', N'R4020')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4021, N'P4021', N'C4021', N'R4021')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4022, N'P4022', N'C4022', N'R4022')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4023, N'P4023', N'C4023', N'R4023')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4024, N'P4024', N'C4024', N'R4024')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4025, N'P4025', N'C4025', N'R4025')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4026, N'P4026', N'C4026', N'R4026')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4027, N'P4027', N'C4027', N'R4027')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4028, N'P4028', N'C4028', N'R4028')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4029, N'P4029', N'C4029', N'R4029')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4030, N'P4030', N'C4030', N'R4030')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4031, N'P4031', N'C4031', N'R4031')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4032, N'P4032', N'C4032', N'R4032')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4033, N'P4033', N'C4033', N'R4033')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4034, N'P4034', N'C4034', N'R4034')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4035, N'P4035', N'C4035', N'R4035')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4036, N'P4036', N'C4036', N'R4036')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4037, N'P4037', N'C4037', N'R4037')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4038, N'P4038', N'C4038', N'R4038')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4039, N'P4039', N'C4039', N'R4039')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4040, N'P4040', N'C4040', N'R4040')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4041, N'P4041', N'C4041', N'R4041')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4042, N'P4042', N'C4042', N'R4042')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4043, N'P4043', N'C4043', N'R4043')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4044, N'P4044', N'C4044', N'R4044')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4045, N'P4045', N'C4045', N'R4045')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4046, N'P4046', N'C4046', N'R4046')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4047, N'P4047', N'C4047', N'R4047')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4048, N'P4048', N'C4048', N'R4048')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4049, N'P4049', N'C4049', N'R4049')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4050, N'P4050', N'C4050', N'R4050')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4051, N'P4051', N'C4051', N'R4051')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4052, N'P4052', N'C4052', N'R4052')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4053, N'P4053', N'C4053', N'R4053')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4054, N'P4054', N'C4054', N'R4054')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4055, N'P4055', N'C4055', N'R4055')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4056, N'P4056', N'C4056', N'R4056')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4057, N'P4057', N'C4057', N'R4057')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4058, N'P4058', N'C4058', N'R4058')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4059, N'P4059', N'C4059', N'R4059')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4060, N'P4060', N'C4060', N'R4060')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4061, N'P4061', N'C4061', N'R4061')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4062, N'P4062', N'C4062', N'R4062')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4063, N'P4063', N'C4063', N'R4063')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4064, N'P4064', N'C4064', N'R4064')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4065, N'P4065', N'C4065', N'R4065')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4066, N'P4066', N'C4066', N'R4066')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4067, N'P4067', N'C4067', N'R4067')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4068, N'P4068', N'C4068', N'R4068')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4069, N'P4069', N'C4069', N'R4069')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4070, N'P4070', N'C4070', N'R4070')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4071, N'P4071', N'C4071', N'R4071')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4072, N'P4072', N'C4072', N'R4072')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4073, N'P4073', N'C4073', N'R4073')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4074, N'P4074', N'C4074', N'R4074')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4075, N'P4075', N'C4075', N'R4075')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4076, N'P4076', N'C4076', N'R4076')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4077, N'P4077', N'C4077', N'R4077')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4078, N'P4078', N'C4078', N'R4078')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4079, N'P4079', N'C4079', N'R4079')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4080, N'P4080', N'C4080', N'R4080')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4081, N'P4081', N'C4081', N'R4081')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4082, N'P4082', N'C4082', N'R4082')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4083, N'P4083', N'C4083', N'R4083')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4084, N'P4084', N'C4084', N'R4084')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4085, N'P4085', N'C4085', N'R4085')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4086, N'P4086', N'C4086', N'R4086')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4087, N'P4087', N'C4087', N'R4087')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4088, N'P4088', N'C4088', N'R4088')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4089, N'P4089', N'C4089', N'R4089')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4090, N'P4090', N'C4090', N'R4090')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4091, N'P4091', N'C4091', N'R4091')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4092, N'P4092', N'C4092', N'R4092')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4093, N'P4093', N'C4093', N'R4093')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4094, N'P4094', N'C4094', N'R4094')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4095, N'P4095', N'C4095', N'R4095')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4096, N'P4096', N'C4096', N'R4096')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4097, N'P4097', N'C4097', N'R4097')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4098, N'P4098', N'C4098', N'R4098')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4099, N'P4099', N'C4099', N'R4099')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4100, N'P4100', N'C4100', N'R4100')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4101, N'P4101', N'C4101', N'R4101')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4102, N'P4102', N'C4102', N'R4102')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4103, N'P4103', N'C4103', N'R4103')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4104, N'P4104', N'C4104', N'R4104')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4105, N'P4105', N'C4105', N'R4105')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4106, N'P4106', N'C4106', N'R4106')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4107, N'P4107', N'C4107', N'R4107')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4108, N'P4108', N'C4108', N'R4108')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4109, N'P4109', N'C4109', N'R4109')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4110, N'P4110', N'C4110', N'R4110')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4111, N'P4111', N'C4111', N'R4111')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4112, N'P4112', N'C4112', N'R4112')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4113, N'P4113', N'C4113', N'R4113')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4114, N'P4114', N'C4114', N'R4114')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4115, N'P4115', N'C4115', N'R4115')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4116, N'P4116', N'C4116', N'R4116')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4117, N'P4117', N'C4117', N'R4117')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4118, N'P4118', N'C4118', N'R4118')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4119, N'P4119', N'C4119', N'R4119')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4120, N'P4120', N'C4120', N'R4120')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4121, N'P4121', N'C4121', N'R4121')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4122, N'P4122', N'C4122', N'R4122')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4123, N'P4123', N'C4123', N'R4123')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4124, N'P4124', N'C4124', N'R4124')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4125, N'P4125', N'C4125', N'R4125')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4126, N'P4126', N'C4126', N'R4126')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4127, N'P4127', N'C4127', N'R4127')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4128, N'P4128', N'C4128', N'R4128')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4129, N'P4129', N'C4129', N'R4129')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4130, N'P4130', N'C4130', N'R4130')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4131, N'P4131', N'C4131', N'R4131')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4132, N'P4132', N'C4132', N'R4132')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4133, N'P4133', N'C4133', N'R4133')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4134, N'P4134', N'C4134', N'R4134')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4135, N'P4135', N'C4135', N'R4135')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4136, N'P4136', N'C4136', N'R4136')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4137, N'P4137', N'C4137', N'R4137')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4138, N'P4138', N'C4138', N'R4138')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4139, N'P4139', N'C4139', N'R4139')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4140, N'P4140', N'C4140', N'R4140')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4141, N'P4141', N'C4141', N'R4141')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4142, N'P4142', N'C4142', N'R4142')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4143, N'P4143', N'C4143', N'R4143')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4144, N'P4144', N'C4144', N'R4144')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4145, N'P4145', N'C4145', N'R4145')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4146, N'P4146', N'C4146', N'R4146')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4147, N'P4147', N'C4147', N'R4147')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4148, N'P4148', N'C4148', N'R4148')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4149, N'P4149', N'C4149', N'R4149')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4150, N'P4150', N'C4150', N'R4150')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4151, N'P4151', N'C4151', N'R4151')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4152, N'P4152', N'C4152', N'R4152')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4153, N'P4153', N'C4153', N'R4153')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4154, N'P4154', N'C4154', N'R4154')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4155, N'P4155', N'C4155', N'R4155')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4156, N'P4156', N'C4156', N'R4156')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4157, N'P4157', N'C4157', N'R4157')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4158, N'P4158', N'C4158', N'R4158')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4159, N'P4159', N'C4159', N'R4159')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4160, N'P4160', N'C4160', N'R4160')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4161, N'P4161', N'C4161', N'R4161')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4162, N'P4162', N'C4162', N'R4162')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4163, N'P4163', N'C4163', N'R4163')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4164, N'P4164', N'C4164', N'R4164')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4165, N'P4165', N'C4165', N'R4165')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4166, N'P4166', N'C4166', N'R4166')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4167, N'P4167', N'C4167', N'R4167')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4168, N'P4168', N'C4168', N'R4168')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4169, N'P4169', N'C4169', N'R4169')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4170, N'P4170', N'C4170', N'R4170')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4171, N'P4171', N'C4171', N'R4171')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4172, N'P4172', N'C4172', N'R4172')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4173, N'P4173', N'C4173', N'R4173')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4174, N'P4174', N'C4174', N'R4174')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4175, N'P4175', N'C4175', N'R4175')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4176, N'P4176', N'C4176', N'R4176')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4177, N'P4177', N'C4177', N'R4177')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4178, N'P4178', N'C4178', N'R4178')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4179, N'P4179', N'C4179', N'R4179')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4180, N'P4180', N'C4180', N'R4180')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4181, N'P4181', N'C4181', N'R4181')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4182, N'P4182', N'C4182', N'R4182')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4183, N'P4183', N'C4183', N'R4183')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4184, N'P4184', N'C4184', N'R4184')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4185, N'P4185', N'C4185', N'R4185')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4186, N'P4186', N'C4186', N'R4186')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4187, N'P4187', N'C4187', N'R4187')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4188, N'P4188', N'C4188', N'R4188')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4189, N'P4189', N'C4189', N'R4189')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4190, N'P4190', N'C4190', N'R4190')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4191, N'P4191', N'C4191', N'R4191')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4192, N'P4192', N'C4192', N'R4192')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4193, N'P4193', N'C4193', N'R4193')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4194, N'P4194', N'C4194', N'R4194')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4195, N'P4195', N'C4195', N'R4195')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4196, N'P4196', N'C4196', N'R4196')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4197, N'P4197', N'C4197', N'R4197')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4198, N'P4198', N'C4198', N'R4198')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4199, N'P4199', N'C4199', N'R4199')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4200, N'P4200', N'C4200', N'R4200')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4201, N'P4201', N'C4201', N'R4201')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4202, N'P4202', N'C4202', N'R4202')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4203, N'P4203', N'C4203', N'R4203')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4204, N'P4204', N'C4204', N'R4204')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4205, N'P4205', N'C4205', N'R4205')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4206, N'P4206', N'C4206', N'R4206')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4207, N'P4207', N'C4207', N'R4207')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4208, N'P4208', N'C4208', N'R4208')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4209, N'P4209', N'C4209', N'R4209')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4210, N'P4210', N'C4210', N'R4210')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4211, N'P4211', N'C4211', N'R4211')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4212, N'P4212', N'C4212', N'R4212')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4213, N'P4213', N'C4213', N'R4213')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4214, N'P4214', N'C4214', N'R4214')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4215, N'P4215', N'C4215', N'R4215')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4216, N'P4216', N'C4216', N'R4216')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4217, N'P4217', N'C4217', N'R4217')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4218, N'P4218', N'C4218', N'R4218')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4219, N'P4219', N'C4219', N'R4219')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4220, N'P4220', N'C4220', N'R4220')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4221, N'P4221', N'C4221', N'R4221')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4222, N'P4222', N'C4222', N'R4222')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4223, N'P4223', N'C4223', N'R4223')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4224, N'P4224', N'C4224', N'R4224')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4225, N'P4225', N'C4225', N'R4225')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4226, N'P4226', N'C4226', N'R4226')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4227, N'P4227', N'C4227', N'R4227')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4228, N'P4228', N'C4228', N'R4228')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4229, N'P4229', N'C4229', N'R4229')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4230, N'P4230', N'C4230', N'R4230')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4231, N'P4231', N'C4231', N'R4231')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4232, N'P4232', N'C4232', N'R4232')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4233, N'P4233', N'C4233', N'R4233')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4234, N'P4234', N'C4234', N'R4234')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4235, N'P4235', N'C4235', N'R4235')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4236, N'P4236', N'C4236', N'R4236')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4237, N'P4237', N'C4237', N'R4237')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4238, N'P4238', N'C4238', N'R4238')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4239, N'P4239', N'C4239', N'R4239')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4240, N'P4240', N'C4240', N'R4240')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4241, N'P4241', N'C4241', N'R4241')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4242, N'P4242', N'C4242', N'R4242')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4243, N'P4243', N'C4243', N'R4243')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4244, N'P4244', N'C4244', N'R4244')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4245, N'P4245', N'C4245', N'R4245')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4246, N'P4246', N'C4246', N'R4246')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4247, N'P4247', N'C4247', N'R4247')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4248, N'P4248', N'C4248', N'R4248')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4249, N'P4249', N'C4249', N'R4249')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4250, N'P4250', N'C4250', N'R4250')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4251, N'P4251', N'C4251', N'R4251')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4252, N'P4252', N'C4252', N'R4252')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4253, N'P4253', N'C4253', N'R4253')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4254, N'P4254', N'C4254', N'R4254')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4255, N'P4255', N'C4255', N'R4255')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4256, N'P4256', N'C4256', N'R4256')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4257, N'P4257', N'C4257', N'R4257')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4258, N'P4258', N'C4258', N'R4258')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4259, N'P4259', N'C4259', N'R4259')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4260, N'P4260', N'C4260', N'R4260')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4261, N'P4261', N'C4261', N'R4261')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4262, N'P4262', N'C4262', N'R4262')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4263, N'P4263', N'C4263', N'R4263')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4264, N'P4264', N'C4264', N'R4264')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4265, N'P4265', N'C4265', N'R4265')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4266, N'P4266', N'C4266', N'R4266')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4267, N'P4267', N'C4267', N'R4267')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4268, N'P4268', N'C4268', N'R4268')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4269, N'P4269', N'C4269', N'R4269')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4270, N'P4270', N'C4270', N'R4270')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4271, N'P4271', N'C4271', N'R4271')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4272, N'P4272', N'C4272', N'R4272')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4273, N'P4273', N'C4273', N'R4273')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4274, N'P4274', N'C4274', N'R4274')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4275, N'P4275', N'C4275', N'R4275')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4276, N'P4276', N'C4276', N'R4276')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4277, N'P4277', N'C4277', N'R4277')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4278, N'P4278', N'C4278', N'R4278')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4279, N'P4279', N'C4279', N'R4279')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4280, N'P4280', N'C4280', N'R4280')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4281, N'P4281', N'C4281', N'R4281')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4282, N'P4282', N'C4282', N'R4282')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4283, N'P4283', N'C4283', N'R4283')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4284, N'P4284', N'C4284', N'R4284')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4285, N'P4285', N'C4285', N'R4285')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4286, N'P4286', N'C4286', N'R4286')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4287, N'P4287', N'C4287', N'R4287')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4288, N'P4288', N'C4288', N'R4288')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4289, N'P4289', N'C4289', N'R4289')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4290, N'P4290', N'C4290', N'R4290')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4291, N'P4291', N'C4291', N'R4291')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4292, N'P4292', N'C4292', N'R4292')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4293, N'P4293', N'C4293', N'R4293')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4294, N'P4294', N'C4294', N'R4294')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4295, N'P4295', N'C4295', N'R4295')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4296, N'P4296', N'C4296', N'R4296')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4297, N'P4297', N'C4297', N'R4297')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4298, N'P4298', N'C4298', N'R4298')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4299, N'P4299', N'C4299', N'R4299')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4300, N'P4300', N'C4300', N'R4300')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4301, N'P4301', N'C4301', N'R4301')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4302, N'P4302', N'C4302', N'R4302')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4303, N'P4303', N'C4303', N'R4303')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4304, N'P4304', N'C4304', N'R4304')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4305, N'P4305', N'C4305', N'R4305')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4306, N'P4306', N'C4306', N'R4306')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4307, N'P4307', N'C4307', N'R4307')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4308, N'P4308', N'C4308', N'R4308')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4309, N'P4309', N'C4309', N'R4309')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4310, N'P4310', N'C4310', N'R4310')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4311, N'P4311', N'C4311', N'R4311')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4312, N'P4312', N'C4312', N'R4312')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4313, N'P4313', N'C4313', N'R4313')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4314, N'P4314', N'C4314', N'R4314')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4315, N'P4315', N'C4315', N'R4315')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4316, N'P4316', N'C4316', N'R4316')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4317, N'P4317', N'C4317', N'R4317')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4318, N'P4318', N'C4318', N'R4318')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4319, N'P4319', N'C4319', N'R4319')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4320, N'P4320', N'C4320', N'R4320')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4321, N'P4321', N'C4321', N'R4321')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4322, N'P4322', N'C4322', N'R4322')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4323, N'P4323', N'C4323', N'R4323')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4324, N'P4324', N'C4324', N'R4324')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4325, N'P4325', N'C4325', N'R4325')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4326, N'P4326', N'C4326', N'R4326')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4327, N'P4327', N'C4327', N'R4327')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4328, N'P4328', N'C4328', N'R4328')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4329, N'P4329', N'C4329', N'R4329')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4330, N'P4330', N'C4330', N'R4330')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4331, N'P4331', N'C4331', N'R4331')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4332, N'P4332', N'C4332', N'R4332')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4333, N'P4333', N'C4333', N'R4333')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4334, N'P4334', N'C4334', N'R4334')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4335, N'P4335', N'C4335', N'R4335')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4336, N'P4336', N'C4336', N'R4336')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4337, N'P4337', N'C4337', N'R4337')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4338, N'P4338', N'C4338', N'R4338')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4339, N'P4339', N'C4339', N'R4339')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4340, N'P4340', N'C4340', N'R4340')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4341, N'P4341', N'C4341', N'R4341')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4342, N'P4342', N'C4342', N'R4342')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4343, N'P4343', N'C4343', N'R4343')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4344, N'P4344', N'C4344', N'R4344')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4345, N'P4345', N'C4345', N'R4345')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4346, N'P4346', N'C4346', N'R4346')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4347, N'P4347', N'C4347', N'R4347')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4348, N'P4348', N'C4348', N'R4348')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4349, N'P4349', N'C4349', N'R4349')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4350, N'P4350', N'C4350', N'R4350')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4351, N'P4351', N'C4351', N'R4351')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4352, N'P4352', N'C4352', N'R4352')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4353, N'P4353', N'C4353', N'R4353')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4354, N'P4354', N'C4354', N'R4354')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4355, N'P4355', N'C4355', N'R4355')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4356, N'P4356', N'C4356', N'R4356')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4357, N'P4357', N'C4357', N'R4357')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4358, N'P4358', N'C4358', N'R4358')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4359, N'P4359', N'C4359', N'R4359')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4360, N'P4360', N'C4360', N'R4360')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4361, N'P4361', N'C4361', N'R4361')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4362, N'P4362', N'C4362', N'R4362')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4363, N'P4363', N'C4363', N'R4363')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4364, N'P4364', N'C4364', N'R4364')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4365, N'P4365', N'C4365', N'R4365')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4366, N'P4366', N'C4366', N'R4366')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4367, N'P4367', N'C4367', N'R4367')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4368, N'P4368', N'C4368', N'R4368')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4369, N'P4369', N'C4369', N'R4369')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4370, N'P4370', N'C4370', N'R4370')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4371, N'P4371', N'C4371', N'R4371')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4372, N'P4372', N'C4372', N'R4372')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4373, N'P4373', N'C4373', N'R4373')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4374, N'P4374', N'C4374', N'R4374')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4375, N'P4375', N'C4375', N'R4375')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4376, N'P4376', N'C4376', N'R4376')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4377, N'P4377', N'C4377', N'R4377')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4378, N'P4378', N'C4378', N'R4378')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4379, N'P4379', N'C4379', N'R4379')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4380, N'P4380', N'C4380', N'R4380')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4381, N'P4381', N'C4381', N'R4381')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4382, N'P4382', N'C4382', N'R4382')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4383, N'P4383', N'C4383', N'R4383')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4384, N'P4384', N'C4384', N'R4384')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4385, N'P4385', N'C4385', N'R4385')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4386, N'P4386', N'C4386', N'R4386')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4387, N'P4387', N'C4387', N'R4387')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4388, N'P4388', N'C4388', N'R4388')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4389, N'P4389', N'C4389', N'R4389')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4390, N'P4390', N'C4390', N'R4390')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4391, N'P4391', N'C4391', N'R4391')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4392, N'P4392', N'C4392', N'R4392')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4393, N'P4393', N'C4393', N'R4393')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4394, N'P4394', N'C4394', N'R4394')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4395, N'P4395', N'C4395', N'R4395')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4396, N'P4396', N'C4396', N'R4396')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4397, N'P4397', N'C4397', N'R4397')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4398, N'P4398', N'C4398', N'R4398')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4399, N'P4399', N'C4399', N'R4399')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4400, N'P4400', N'C4400', N'R4400')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4401, N'P4401', N'C4401', N'R4401')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4402, N'P4402', N'C4402', N'R4402')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4403, N'P4403', N'C4403', N'R4403')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4404, N'P4404', N'C4404', N'R4404')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4405, N'P4405', N'C4405', N'R4405')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4406, N'P4406', N'C4406', N'R4406')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4407, N'P4407', N'C4407', N'R4407')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4408, N'P4408', N'C4408', N'R4408')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4409, N'P4409', N'C4409', N'R4409')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4410, N'P4410', N'C4410', N'R4410')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4411, N'P4411', N'C4411', N'R4411')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4412, N'P4412', N'C4412', N'R4412')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4413, N'P4413', N'C4413', N'R4413')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4414, N'P4414', N'C4414', N'R4414')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4415, N'P4415', N'C4415', N'R4415')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4416, N'P4416', N'C4416', N'R4416')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4417, N'P4417', N'C4417', N'R4417')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4418, N'P4418', N'C4418', N'R4418')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4419, N'P4419', N'C4419', N'R4419')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4420, N'P4420', N'C4420', N'R4420')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4421, N'P4421', N'C4421', N'R4421')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4422, N'P4422', N'C4422', N'R4422')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4423, N'P4423', N'C4423', N'R4423')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4424, N'P4424', N'C4424', N'R4424')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4425, N'P4425', N'C4425', N'R4425')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4426, N'P4426', N'C4426', N'R4426')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4427, N'P4427', N'C4427', N'R4427')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4428, N'P4428', N'C4428', N'R4428')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4429, N'P4429', N'C4429', N'R4429')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4430, N'P4430', N'C4430', N'R4430')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4431, N'P4431', N'C4431', N'R4431')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4432, N'P4432', N'C4432', N'R4432')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4433, N'P4433', N'C4433', N'R4433')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4434, N'P4434', N'C4434', N'R4434')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4435, N'P4435', N'C4435', N'R4435')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4436, N'P4436', N'C4436', N'R4436')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4437, N'P4437', N'C4437', N'R4437')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4438, N'P4438', N'C4438', N'R4438')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4439, N'P4439', N'C4439', N'R4439')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4440, N'P4440', N'C4440', N'R4440')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4441, N'P4441', N'C4441', N'R4441')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4442, N'P4442', N'C4442', N'R4442')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4443, N'P4443', N'C4443', N'R4443')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4444, N'P4444', N'C4444', N'R4444')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4445, N'P4445', N'C4445', N'R4445')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4446, N'P4446', N'C4446', N'R4446')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4447, N'P4447', N'C4447', N'R4447')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4448, N'P4448', N'C4448', N'R4448')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4449, N'P4449', N'C4449', N'R4449')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4450, N'P4450', N'C4450', N'R4450')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4451, N'P4451', N'C4451', N'R4451')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4452, N'P4452', N'C4452', N'R4452')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4453, N'P4453', N'C4453', N'R4453')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4454, N'P4454', N'C4454', N'R4454')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4455, N'P4455', N'C4455', N'R4455')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4456, N'P4456', N'C4456', N'R4456')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4457, N'P4457', N'C4457', N'R4457')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4458, N'P4458', N'C4458', N'R4458')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4459, N'P4459', N'C4459', N'R4459')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4460, N'P4460', N'C4460', N'R4460')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4461, N'P4461', N'C4461', N'R4461')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4462, N'P4462', N'C4462', N'R4462')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4463, N'P4463', N'C4463', N'R4463')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4464, N'P4464', N'C4464', N'R4464')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4465, N'P4465', N'C4465', N'R4465')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4466, N'P4466', N'C4466', N'R4466')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4467, N'P4467', N'C4467', N'R4467')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4468, N'P4468', N'C4468', N'R4468')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4469, N'P4469', N'C4469', N'R4469')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4470, N'P4470', N'C4470', N'R4470')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4471, N'P4471', N'C4471', N'R4471')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4472, N'P4472', N'C4472', N'R4472')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4473, N'P4473', N'C4473', N'R4473')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4474, N'P4474', N'C4474', N'R4474')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4475, N'P4475', N'C4475', N'R4475')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4476, N'P4476', N'C4476', N'R4476')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4477, N'P4477', N'C4477', N'R4477')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4478, N'P4478', N'C4478', N'R4478')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4479, N'P4479', N'C4479', N'R4479')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4480, N'P4480', N'C4480', N'R4480')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4481, N'P4481', N'C4481', N'R4481')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4482, N'P4482', N'C4482', N'R4482')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4483, N'P4483', N'C4483', N'R4483')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4484, N'P4484', N'C4484', N'R4484')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4485, N'P4485', N'C4485', N'R4485')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4486, N'P4486', N'C4486', N'R4486')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4487, N'P4487', N'C4487', N'R4487')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4488, N'P4488', N'C4488', N'R4488')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4489, N'P4489', N'C4489', N'R4489')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4490, N'P4490', N'C4490', N'R4490')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4491, N'P4491', N'C4491', N'R4491')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4492, N'P4492', N'C4492', N'R4492')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4493, N'P4493', N'C4493', N'R4493')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4494, N'P4494', N'C4494', N'R4494')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4495, N'P4495', N'C4495', N'R4495')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4496, N'P4496', N'C4496', N'R4496')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4497, N'P4497', N'C4497', N'R4497')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4498, N'P4498', N'C4498', N'R4498')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4499, N'P4499', N'C4499', N'R4499')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4500, N'P4500', N'C4500', N'R4500')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4501, N'P4501', N'C4501', N'R4501')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4502, N'P4502', N'C4502', N'R4502')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4503, N'P4503', N'C4503', N'R4503')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4504, N'P4504', N'C4504', N'R4504')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4505, N'P4505', N'C4505', N'R4505')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4506, N'P4506', N'C4506', N'R4506')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4507, N'P4507', N'C4507', N'R4507')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4508, N'P4508', N'C4508', N'R4508')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4509, N'P4509', N'C4509', N'R4509')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4510, N'P4510', N'C4510', N'R4510')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4511, N'P4511', N'C4511', N'R4511')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4512, N'P4512', N'C4512', N'R4512')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4513, N'P4513', N'C4513', N'R4513')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4514, N'P4514', N'C4514', N'R4514')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4515, N'P4515', N'C4515', N'R4515')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4516, N'P4516', N'C4516', N'R4516')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4517, N'P4517', N'C4517', N'R4517')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4518, N'P4518', N'C4518', N'R4518')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4519, N'P4519', N'C4519', N'R4519')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4520, N'P4520', N'C4520', N'R4520')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4521, N'P4521', N'C4521', N'R4521')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4522, N'P4522', N'C4522', N'R4522')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4523, N'P4523', N'C4523', N'R4523')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4524, N'P4524', N'C4524', N'R4524')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4525, N'P4525', N'C4525', N'R4525')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4526, N'P4526', N'C4526', N'R4526')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4527, N'P4527', N'C4527', N'R4527')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4528, N'P4528', N'C4528', N'R4528')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4529, N'P4529', N'C4529', N'R4529')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4530, N'P4530', N'C4530', N'R4530')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4531, N'P4531', N'C4531', N'R4531')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4532, N'P4532', N'C4532', N'R4532')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4533, N'P4533', N'C4533', N'R4533')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4534, N'P4534', N'C4534', N'R4534')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4535, N'P4535', N'C4535', N'R4535')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4536, N'P4536', N'C4536', N'R4536')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4537, N'P4537', N'C4537', N'R4537')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4538, N'P4538', N'C4538', N'R4538')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4539, N'P4539', N'C4539', N'R4539')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4540, N'P4540', N'C4540', N'R4540')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4541, N'P4541', N'C4541', N'R4541')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4542, N'P4542', N'C4542', N'R4542')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4543, N'P4543', N'C4543', N'R4543')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4544, N'P4544', N'C4544', N'R4544')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4545, N'P4545', N'C4545', N'R4545')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4546, N'P4546', N'C4546', N'R4546')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4547, N'P4547', N'C4547', N'R4547')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4548, N'P4548', N'C4548', N'R4548')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4549, N'P4549', N'C4549', N'R4549')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4550, N'P4550', N'C4550', N'R4550')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4551, N'P4551', N'C4551', N'R4551')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4552, N'P4552', N'C4552', N'R4552')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4553, N'P4553', N'C4553', N'R4553')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4554, N'P4554', N'C4554', N'R4554')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4555, N'P4555', N'C4555', N'R4555')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4556, N'P4556', N'C4556', N'R4556')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4557, N'P4557', N'C4557', N'R4557')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4558, N'P4558', N'C4558', N'R4558')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4559, N'P4559', N'C4559', N'R4559')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4560, N'P4560', N'C4560', N'R4560')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4561, N'P4561', N'C4561', N'R4561')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4562, N'P4562', N'C4562', N'R4562')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4563, N'P4563', N'C4563', N'R4563')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4564, N'P4564', N'C4564', N'R4564')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4565, N'P4565', N'C4565', N'R4565')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4566, N'P4566', N'C4566', N'R4566')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4567, N'P4567', N'C4567', N'R4567')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4568, N'P4568', N'C4568', N'R4568')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4569, N'P4569', N'C4569', N'R4569')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4570, N'P4570', N'C4570', N'R4570')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4571, N'P4571', N'C4571', N'R4571')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4572, N'P4572', N'C4572', N'R4572')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4573, N'P4573', N'C4573', N'R4573')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4574, N'P4574', N'C4574', N'R4574')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4575, N'P4575', N'C4575', N'R4575')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4576, N'P4576', N'C4576', N'R4576')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4577, N'P4577', N'C4577', N'R4577')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4578, N'P4578', N'C4578', N'R4578')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4579, N'P4579', N'C4579', N'R4579')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4580, N'P4580', N'C4580', N'R4580')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4581, N'P4581', N'C4581', N'R4581')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4582, N'P4582', N'C4582', N'R4582')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4583, N'P4583', N'C4583', N'R4583')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4584, N'P4584', N'C4584', N'R4584')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4585, N'P4585', N'C4585', N'R4585')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4586, N'P4586', N'C4586', N'R4586')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4587, N'P4587', N'C4587', N'R4587')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4588, N'P4588', N'C4588', N'R4588')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4589, N'P4589', N'C4589', N'R4589')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4590, N'P4590', N'C4590', N'R4590')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4591, N'P4591', N'C4591', N'R4591')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4592, N'P4592', N'C4592', N'R4592')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4593, N'P4593', N'C4593', N'R4593')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4594, N'P4594', N'C4594', N'R4594')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4595, N'P4595', N'C4595', N'R4595')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4596, N'P4596', N'C4596', N'R4596')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4597, N'P4597', N'C4597', N'R4597')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4598, N'P4598', N'C4598', N'R4598')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4599, N'P4599', N'C4599', N'R4599')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4600, N'P4600', N'C4600', N'R4600')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4601, N'P4601', N'C4601', N'R4601')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4602, N'P4602', N'C4602', N'R4602')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4603, N'P4603', N'C4603', N'R4603')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4604, N'P4604', N'C4604', N'R4604')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4605, N'P4605', N'C4605', N'R4605')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4606, N'P4606', N'C4606', N'R4606')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4607, N'P4607', N'C4607', N'R4607')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4608, N'P4608', N'C4608', N'R4608')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4609, N'P4609', N'C4609', N'R4609')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4610, N'P4610', N'C4610', N'R4610')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4611, N'P4611', N'C4611', N'R4611')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4612, N'P4612', N'C4612', N'R4612')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4613, N'P4613', N'C4613', N'R4613')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4614, N'P4614', N'C4614', N'R4614')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4615, N'P4615', N'C4615', N'R4615')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4616, N'P4616', N'C4616', N'R4616')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4617, N'P4617', N'C4617', N'R4617')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4618, N'P4618', N'C4618', N'R4618')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4619, N'P4619', N'C4619', N'R4619')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4620, N'P4620', N'C4620', N'R4620')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4621, N'P4621', N'C4621', N'R4621')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4622, N'P4622', N'C4622', N'R4622')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4623, N'P4623', N'C4623', N'R4623')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4624, N'P4624', N'C4624', N'R4624')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4625, N'P4625', N'C4625', N'R4625')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4626, N'P4626', N'C4626', N'R4626')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4627, N'P4627', N'C4627', N'R4627')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4628, N'P4628', N'C4628', N'R4628')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4629, N'P4629', N'C4629', N'R4629')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4630, N'P4630', N'C4630', N'R4630')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4631, N'P4631', N'C4631', N'R4631')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4632, N'P4632', N'C4632', N'R4632')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4633, N'P4633', N'C4633', N'R4633')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4634, N'P4634', N'C4634', N'R4634')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4635, N'P4635', N'C4635', N'R4635')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4636, N'P4636', N'C4636', N'R4636')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4637, N'P4637', N'C4637', N'R4637')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4638, N'P4638', N'C4638', N'R4638')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4639, N'P4639', N'C4639', N'R4639')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4640, N'P4640', N'C4640', N'R4640')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4641, N'P4641', N'C4641', N'R4641')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4642, N'P4642', N'C4642', N'R4642')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4643, N'P4643', N'C4643', N'R4643')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4644, N'P4644', N'C4644', N'R4644')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4645, N'P4645', N'C4645', N'R4645')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4646, N'P4646', N'C4646', N'R4646')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4647, N'P4647', N'C4647', N'R4647')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4648, N'P4648', N'C4648', N'R4648')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4649, N'P4649', N'C4649', N'R4649')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4650, N'P4650', N'C4650', N'R4650')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4651, N'P4651', N'C4651', N'R4651')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4652, N'P4652', N'C4652', N'R4652')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4653, N'P4653', N'C4653', N'R4653')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4654, N'P4654', N'C4654', N'R4654')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4655, N'P4655', N'C4655', N'R4655')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4656, N'P4656', N'C4656', N'R4656')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4657, N'P4657', N'C4657', N'R4657')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4658, N'P4658', N'C4658', N'R4658')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4659, N'P4659', N'C4659', N'R4659')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4660, N'P4660', N'C4660', N'R4660')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4661, N'P4661', N'C4661', N'R4661')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4662, N'P4662', N'C4662', N'R4662')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4663, N'P4663', N'C4663', N'R4663')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4664, N'P4664', N'C4664', N'R4664')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4665, N'P4665', N'C4665', N'R4665')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4666, N'P4666', N'C4666', N'R4666')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4667, N'P4667', N'C4667', N'R4667')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4668, N'P4668', N'C4668', N'R4668')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4669, N'P4669', N'C4669', N'R4669')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4670, N'P4670', N'C4670', N'R4670')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4671, N'P4671', N'C4671', N'R4671')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4672, N'P4672', N'C4672', N'R4672')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4673, N'P4673', N'C4673', N'R4673')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4674, N'P4674', N'C4674', N'R4674')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4675, N'P4675', N'C4675', N'R4675')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4676, N'P4676', N'C4676', N'R4676')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4677, N'P4677', N'C4677', N'R4677')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4678, N'P4678', N'C4678', N'R4678')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4679, N'P4679', N'C4679', N'R4679')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4680, N'P4680', N'C4680', N'R4680')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4681, N'P4681', N'C4681', N'R4681')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4682, N'P4682', N'C4682', N'R4682')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4683, N'P4683', N'C4683', N'R4683')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4684, N'P4684', N'C4684', N'R4684')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4685, N'P4685', N'C4685', N'R4685')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4686, N'P4686', N'C4686', N'R4686')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4687, N'P4687', N'C4687', N'R4687')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4688, N'P4688', N'C4688', N'R4688')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4689, N'P4689', N'C4689', N'R4689')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4690, N'P4690', N'C4690', N'R4690')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4691, N'P4691', N'C4691', N'R4691')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4692, N'P4692', N'C4692', N'R4692')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4693, N'P4693', N'C4693', N'R4693')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4694, N'P4694', N'C4694', N'R4694')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4695, N'P4695', N'C4695', N'R4695')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4696, N'P4696', N'C4696', N'R4696')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4697, N'P4697', N'C4697', N'R4697')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4698, N'P4698', N'C4698', N'R4698')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4699, N'P4699', N'C4699', N'R4699')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4700, N'P4700', N'C4700', N'R4700')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4701, N'P4701', N'C4701', N'R4701')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4702, N'P4702', N'C4702', N'R4702')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4703, N'P4703', N'C4703', N'R4703')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4704, N'P4704', N'C4704', N'R4704')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4705, N'P4705', N'C4705', N'R4705')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4706, N'P4706', N'C4706', N'R4706')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4707, N'P4707', N'C4707', N'R4707')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4708, N'P4708', N'C4708', N'R4708')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4709, N'P4709', N'C4709', N'R4709')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4710, N'P4710', N'C4710', N'R4710')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4711, N'P4711', N'C4711', N'R4711')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4712, N'P4712', N'C4712', N'R4712')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4713, N'P4713', N'C4713', N'R4713')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4714, N'P4714', N'C4714', N'R4714')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4715, N'P4715', N'C4715', N'R4715')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4716, N'P4716', N'C4716', N'R4716')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4717, N'P4717', N'C4717', N'R4717')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4718, N'P4718', N'C4718', N'R4718')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4719, N'P4719', N'C4719', N'R4719')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4720, N'P4720', N'C4720', N'R4720')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4721, N'P4721', N'C4721', N'R4721')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4722, N'P4722', N'C4722', N'R4722')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4723, N'P4723', N'C4723', N'R4723')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4724, N'P4724', N'C4724', N'R4724')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4725, N'P4725', N'C4725', N'R4725')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4726, N'P4726', N'C4726', N'R4726')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4727, N'P4727', N'C4727', N'R4727')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4728, N'P4728', N'C4728', N'R4728')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4729, N'P4729', N'C4729', N'R4729')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4730, N'P4730', N'C4730', N'R4730')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4731, N'P4731', N'C4731', N'R4731')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4732, N'P4732', N'C4732', N'R4732')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4733, N'P4733', N'C4733', N'R4733')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4734, N'P4734', N'C4734', N'R4734')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4735, N'P4735', N'C4735', N'R4735')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4736, N'P4736', N'C4736', N'R4736')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4737, N'P4737', N'C4737', N'R4737')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4738, N'P4738', N'C4738', N'R4738')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4739, N'P4739', N'C4739', N'R4739')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4740, N'P4740', N'C4740', N'R4740')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4741, N'P4741', N'C4741', N'R4741')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4742, N'P4742', N'C4742', N'R4742')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4743, N'P4743', N'C4743', N'R4743')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4744, N'P4744', N'C4744', N'R4744')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4745, N'P4745', N'C4745', N'R4745')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4746, N'P4746', N'C4746', N'R4746')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4747, N'P4747', N'C4747', N'R4747')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4748, N'P4748', N'C4748', N'R4748')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4749, N'P4749', N'C4749', N'R4749')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4750, N'P4750', N'C4750', N'R4750')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4751, N'P4751', N'C4751', N'R4751')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4752, N'P4752', N'C4752', N'R4752')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4753, N'P4753', N'C4753', N'R4753')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4754, N'P4754', N'C4754', N'R4754')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4755, N'P4755', N'C4755', N'R4755')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4756, N'P4756', N'C4756', N'R4756')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4757, N'P4757', N'C4757', N'R4757')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4758, N'P4758', N'C4758', N'R4758')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4759, N'P4759', N'C4759', N'R4759')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4760, N'P4760', N'C4760', N'R4760')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4761, N'P4761', N'C4761', N'R4761')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4762, N'P4762', N'C4762', N'R4762')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4763, N'P4763', N'C4763', N'R4763')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4764, N'P4764', N'C4764', N'R4764')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4765, N'P4765', N'C4765', N'R4765')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4766, N'P4766', N'C4766', N'R4766')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4767, N'P4767', N'C4767', N'R4767')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4768, N'P4768', N'C4768', N'R4768')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4769, N'P4769', N'C4769', N'R4769')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4770, N'P4770', N'C4770', N'R4770')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4771, N'P4771', N'C4771', N'R4771')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4772, N'P4772', N'C4772', N'R4772')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4773, N'P4773', N'C4773', N'R4773')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4774, N'P4774', N'C4774', N'R4774')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4775, N'P4775', N'C4775', N'R4775')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4776, N'P4776', N'C4776', N'R4776')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4777, N'P4777', N'C4777', N'R4777')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4778, N'P4778', N'C4778', N'R4778')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4779, N'P4779', N'C4779', N'R4779')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4780, N'P4780', N'C4780', N'R4780')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4781, N'P4781', N'C4781', N'R4781')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4782, N'P4782', N'C4782', N'R4782')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4783, N'P4783', N'C4783', N'R4783')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4784, N'P4784', N'C4784', N'R4784')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4785, N'P4785', N'C4785', N'R4785')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4786, N'P4786', N'C4786', N'R4786')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4787, N'P4787', N'C4787', N'R4787')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4788, N'P4788', N'C4788', N'R4788')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4789, N'P4789', N'C4789', N'R4789')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4790, N'P4790', N'C4790', N'R4790')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4791, N'P4791', N'C4791', N'R4791')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4792, N'P4792', N'C4792', N'R4792')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4793, N'P4793', N'C4793', N'R4793')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4794, N'P4794', N'C4794', N'R4794')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4795, N'P4795', N'C4795', N'R4795')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4796, N'P4796', N'C4796', N'R4796')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4797, N'P4797', N'C4797', N'R4797')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4798, N'P4798', N'C4798', N'R4798')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4799, N'P4799', N'C4799', N'R4799')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4800, N'P4800', N'C4800', N'R4800')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4801, N'P4801', N'C4801', N'R4801')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4802, N'P4802', N'C4802', N'R4802')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4803, N'P4803', N'C4803', N'R4803')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4804, N'P4804', N'C4804', N'R4804')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4805, N'P4805', N'C4805', N'R4805')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4806, N'P4806', N'C4806', N'R4806')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4807, N'P4807', N'C4807', N'R4807')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4808, N'P4808', N'C4808', N'R4808')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4809, N'P4809', N'C4809', N'R4809')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4810, N'P4810', N'C4810', N'R4810')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4811, N'P4811', N'C4811', N'R4811')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4812, N'P4812', N'C4812', N'R4812')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4813, N'P4813', N'C4813', N'R4813')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4814, N'P4814', N'C4814', N'R4814')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4815, N'P4815', N'C4815', N'R4815')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4816, N'P4816', N'C4816', N'R4816')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4817, N'P4817', N'C4817', N'R4817')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4818, N'P4818', N'C4818', N'R4818')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4819, N'P4819', N'C4819', N'R4819')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4820, N'P4820', N'C4820', N'R4820')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4821, N'P4821', N'C4821', N'R4821')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4822, N'P4822', N'C4822', N'R4822')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4823, N'P4823', N'C4823', N'R4823')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4824, N'P4824', N'C4824', N'R4824')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4825, N'P4825', N'C4825', N'R4825')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4826, N'P4826', N'C4826', N'R4826')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4827, N'P4827', N'C4827', N'R4827')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4828, N'P4828', N'C4828', N'R4828')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4829, N'P4829', N'C4829', N'R4829')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4830, N'P4830', N'C4830', N'R4830')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4831, N'P4831', N'C4831', N'R4831')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4832, N'P4832', N'C4832', N'R4832')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4833, N'P4833', N'C4833', N'R4833')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4834, N'P4834', N'C4834', N'R4834')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4835, N'P4835', N'C4835', N'R4835')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4836, N'P4836', N'C4836', N'R4836')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4837, N'P4837', N'C4837', N'R4837')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4838, N'P4838', N'C4838', N'R4838')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4839, N'P4839', N'C4839', N'R4839')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4840, N'P4840', N'C4840', N'R4840')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4841, N'P4841', N'C4841', N'R4841')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4842, N'P4842', N'C4842', N'R4842')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4843, N'P4843', N'C4843', N'R4843')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4844, N'P4844', N'C4844', N'R4844')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4845, N'P4845', N'C4845', N'R4845')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4846, N'P4846', N'C4846', N'R4846')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4847, N'P4847', N'C4847', N'R4847')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4848, N'P4848', N'C4848', N'R4848')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4849, N'P4849', N'C4849', N'R4849')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4850, N'P4850', N'C4850', N'R4850')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4851, N'P4851', N'C4851', N'R4851')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4852, N'P4852', N'C4852', N'R4852')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4853, N'P4853', N'C4853', N'R4853')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4854, N'P4854', N'C4854', N'R4854')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4855, N'P4855', N'C4855', N'R4855')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4856, N'P4856', N'C4856', N'R4856')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4857, N'P4857', N'C4857', N'R4857')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4858, N'P4858', N'C4858', N'R4858')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4859, N'P4859', N'C4859', N'R4859')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4860, N'P4860', N'C4860', N'R4860')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4861, N'P4861', N'C4861', N'R4861')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4862, N'P4862', N'C4862', N'R4862')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4863, N'P4863', N'C4863', N'R4863')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4864, N'P4864', N'C4864', N'R4864')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4865, N'P4865', N'C4865', N'R4865')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4866, N'P4866', N'C4866', N'R4866')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4867, N'P4867', N'C4867', N'R4867')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4868, N'P4868', N'C4868', N'R4868')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4869, N'P4869', N'C4869', N'R4869')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4870, N'P4870', N'C4870', N'R4870')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4871, N'P4871', N'C4871', N'R4871')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4872, N'P4872', N'C4872', N'R4872')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4873, N'P4873', N'C4873', N'R4873')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4874, N'P4874', N'C4874', N'R4874')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4875, N'P4875', N'C4875', N'R4875')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4876, N'P4876', N'C4876', N'R4876')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4877, N'P4877', N'C4877', N'R4877')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4878, N'P4878', N'C4878', N'R4878')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4879, N'P4879', N'C4879', N'R4879')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4880, N'P4880', N'C4880', N'R4880')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4881, N'P4881', N'C4881', N'R4881')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4882, N'P4882', N'C4882', N'R4882')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4883, N'P4883', N'C4883', N'R4883')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4884, N'P4884', N'C4884', N'R4884')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4885, N'P4885', N'C4885', N'R4885')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4886, N'P4886', N'C4886', N'R4886')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4887, N'P4887', N'C4887', N'R4887')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4888, N'P4888', N'C4888', N'R4888')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4889, N'P4889', N'C4889', N'R4889')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4890, N'P4890', N'C4890', N'R4890')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4891, N'P4891', N'C4891', N'R4891')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4892, N'P4892', N'C4892', N'R4892')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4893, N'P4893', N'C4893', N'R4893')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4894, N'P4894', N'C4894', N'R4894')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4895, N'P4895', N'C4895', N'R4895')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4896, N'P4896', N'C4896', N'R4896')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4897, N'P4897', N'C4897', N'R4897')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4898, N'P4898', N'C4898', N'R4898')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4899, N'P4899', N'C4899', N'R4899')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4900, N'P4900', N'C4900', N'R4900')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4901, N'P4901', N'C4901', N'R4901')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4902, N'P4902', N'C4902', N'R4902')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4903, N'P4903', N'C4903', N'R4903')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4904, N'P4904', N'C4904', N'R4904')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4905, N'P4905', N'C4905', N'R4905')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4906, N'P4906', N'C4906', N'R4906')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4907, N'P4907', N'C4907', N'R4907')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4908, N'P4908', N'C4908', N'R4908')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4909, N'P4909', N'C4909', N'R4909')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4910, N'P4910', N'C4910', N'R4910')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4911, N'P4911', N'C4911', N'R4911')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4912, N'P4912', N'C4912', N'R4912')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4913, N'P4913', N'C4913', N'R4913')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4914, N'P4914', N'C4914', N'R4914')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4915, N'P4915', N'C4915', N'R4915')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4916, N'P4916', N'C4916', N'R4916')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4917, N'P4917', N'C4917', N'R4917')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4918, N'P4918', N'C4918', N'R4918')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4919, N'P4919', N'C4919', N'R4919')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4920, N'P4920', N'C4920', N'R4920')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4921, N'P4921', N'C4921', N'R4921')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4922, N'P4922', N'C4922', N'R4922')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4923, N'P4923', N'C4923', N'R4923')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4924, N'P4924', N'C4924', N'R4924')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4925, N'P4925', N'C4925', N'R4925')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4926, N'P4926', N'C4926', N'R4926')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4927, N'P4927', N'C4927', N'R4927')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4928, N'P4928', N'C4928', N'R4928')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4929, N'P4929', N'C4929', N'R4929')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4930, N'P4930', N'C4930', N'R4930')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4931, N'P4931', N'C4931', N'R4931')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4932, N'P4932', N'C4932', N'R4932')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4933, N'P4933', N'C4933', N'R4933')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4934, N'P4934', N'C4934', N'R4934')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4935, N'P4935', N'C4935', N'R4935')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4936, N'P4936', N'C4936', N'R4936')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4937, N'P4937', N'C4937', N'R4937')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4938, N'P4938', N'C4938', N'R4938')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4939, N'P4939', N'C4939', N'R4939')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4940, N'P4940', N'C4940', N'R4940')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4941, N'P4941', N'C4941', N'R4941')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4942, N'P4942', N'C4942', N'R4942')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4943, N'P4943', N'C4943', N'R4943')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4944, N'P4944', N'C4944', N'R4944')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4945, N'P4945', N'C4945', N'R4945')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4946, N'P4946', N'C4946', N'R4946')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4947, N'P4947', N'C4947', N'R4947')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4948, N'P4948', N'C4948', N'R4948')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4949, N'P4949', N'C4949', N'R4949')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4950, N'P4950', N'C4950', N'R4950')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4951, N'P4951', N'C4951', N'R4951')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4952, N'P4952', N'C4952', N'R4952')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4953, N'P4953', N'C4953', N'R4953')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4954, N'P4954', N'C4954', N'R4954')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4955, N'P4955', N'C4955', N'R4955')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4956, N'P4956', N'C4956', N'R4956')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4957, N'P4957', N'C4957', N'R4957')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4958, N'P4958', N'C4958', N'R4958')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4959, N'P4959', N'C4959', N'R4959')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4960, N'P4960', N'C4960', N'R4960')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4961, N'P4961', N'C4961', N'R4961')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4962, N'P4962', N'C4962', N'R4962')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4963, N'P4963', N'C4963', N'R4963')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4964, N'P4964', N'C4964', N'R4964')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4965, N'P4965', N'C4965', N'R4965')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4966, N'P4966', N'C4966', N'R4966')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4967, N'P4967', N'C4967', N'R4967')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4968, N'P4968', N'C4968', N'R4968')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4969, N'P4969', N'C4969', N'R4969')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4970, N'P4970', N'C4970', N'R4970')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4971, N'P4971', N'C4971', N'R4971')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4972, N'P4972', N'C4972', N'R4972')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4973, N'P4973', N'C4973', N'R4973')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4974, N'P4974', N'C4974', N'R4974')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4975, N'P4975', N'C4975', N'R4975')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4976, N'P4976', N'C4976', N'R4976')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4977, N'P4977', N'C4977', N'R4977')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4978, N'P4978', N'C4978', N'R4978')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4979, N'P4979', N'C4979', N'R4979')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4980, N'P4980', N'C4980', N'R4980')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4981, N'P4981', N'C4981', N'R4981')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4982, N'P4982', N'C4982', N'R4982')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4983, N'P4983', N'C4983', N'R4983')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4984, N'P4984', N'C4984', N'R4984')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4985, N'P4985', N'C4985', N'R4985')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4986, N'P4986', N'C4986', N'R4986')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4987, N'P4987', N'C4987', N'R4987')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4988, N'P4988', N'C4988', N'R4988')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4989, N'P4989', N'C4989', N'R4989')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4990, N'P4990', N'C4990', N'R4990')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4991, N'P4991', N'C4991', N'R4991')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4992, N'P4992', N'C4992', N'R4992')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4993, N'P4993', N'C4993', N'R4993')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4994, N'P4994', N'C4994', N'R4994')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4995, N'P4995', N'C4995', N'R4995')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4996, N'P4996', N'C4996', N'R4996')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4997, N'P4997', N'C4997', N'R4997')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4998, N'P4998', N'C4998', N'R4998')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (4999, N'P4999', N'C4999', N'R4999')
GO
INSERT [dbo].[F_PCID] ([NUM], [P_Code], [C_Code], [R_Code]) VALUES (5000, N'P5000', N'C5000', N'R5000')
GO
INSERT [dbo].[tbMember] ([MemberNum], [Email], [UserPWD], [Name], [RegDate], [HP], [CompanyName], [CompanyNum], [Grade], [UUID], [RegistrationID], [PushCreatedDate], [PushUpdatedDate], [Activated], [DeviceKind]) VALUES (1, N'admin@sqlmvp.kr', N'4f0bGR6fTST5Q4Ur3wu9Mg==', N'Admin', getdate(), N'00000000000', N'', 1, 9, NULL, NULL, NULL, NULL, NULL, NULL)
GO

insert into tbPCID values ('P001', 'Windows', 'Processor', '% Processor time', '1', '%CPU Utilization', 'Number of Processors')
insert into tbPCID values ('P002', 'Windows', 'Processor', '% Privileged time', '1', '%CPU Utilization in Kernel', 'Number of Processors')
insert into tbPCID values ('P003', 'Windows', 'System', 'Context switches/sec', '0', 'Context switches/sec', 'Context switches/sec per CPU')
insert into tbPCID values ('P004', 'Windows', 'System', 'Processor Queue Length', '0', 'Processor Queue Length', 'Number of Processors')
insert into tbPCID values ('P005', 'Windows', '.NET CLR Memory', '% Time in GC', '1', '%Time in GC', 'AppPool Desc(PID)')
insert into tbPCID values ('P006', 'Windows', 'Process', '% Processor time', '1', '%CPU Utilization', 'AppPool Desc(PID)')
insert into tbPCID values ('P007', 'Windows', 'Memory', 'Available Mbytes', '0', 'Available Bytes(MB)', 'Total RAM Size')
insert into tbPCID values ('P008', 'Windows', 'Memory', 'Committed bytes', '0', 'Total Committed Bytes(MB)', 'Total RAM Size')
insert into tbPCID values ('P009', 'Windows', 'Memory', 'Free System Page Table Entries', '0', 'Free System PTE in Kernel', 'Boolean, 64bit OS = true')
insert into tbPCID values ('P010', 'Windows', 'Memory', 'Pool Paged Bytes', '0', 'Pool Pages Bytes(Kernel)', 'Boolean, 64bit OS = true')
insert into tbPCID values ('P011', 'Windows', 'Memory', 'Pool Nonpaged Bytes', '0', 'Pool Nonpaged Bytes(Kernel)', 'Boolean, 64bit OS = true')
insert into tbPCID values ('P012', 'Windows', '.NET CLR Memory', '# Bytes in all Heaps', '1', 'Size of .NET managed memory', 'AppPool Desc(PID)')
insert into tbPCID values ('P013', 'Windows', 'Process', 'Private Bytes', '1', 'Process Memory(Private)', 'AppPool Desc(PID)')
insert into tbPCID values ('P014', 'Windows', 'Process', 'ID Process', '1', 'Process ID', 'AppPool Desc(PID)')
insert into tbPCID values ('P015', 'Windows', 'LogicalDisk', '% Disk Time', '1', '%Disk Utilization', '')
insert into tbPCID values ('P016', 'Windows', 'LogicalDisk', 'Avg. Disk sec/Read', '1', 'Avg. Disk sec/Read', '')
insert into tbPCID values ('P017', 'Windows', 'LogicalDisk', 'Avg. Disk Queue Length', '1', 'Average Disk Queue Length', '')
insert into tbPCID values ('P018', 'Windows', 'LogicalDisk', 'Free Megabytes', '1', 'Available Disk Space(MB)', '')
insert into tbPCID values ('P019', 'Windows', 'Network Interface', 'Current bandwidth', '1', 'Current bandwidth', 'Bandwidth(Bytes)')
insert into tbPCID values ('P020', 'Windows', 'Network Interface', 'Bytes total/sec', '1', 'Bytes total/sec', 'Bandwidth(Bytes)')
insert into tbPCID values ('P021', 'Windows', 'Network Interface', 'Output queue length', '1', 'Output queue length', 'Bandwidth(Bytes)')
insert into tbPCID values ('P022', 'Web', 'Web Service', 'Bytes Total/sec', '1', 'Bytes Total/sec', '')
insert into tbPCID values ('P023', 'Web', 'Web Service', 'Current connections', '1', 'Number of Connections', '')
insert into tbPCID values ('P024', 'Web', 'Web Service', 'Service Uptime', '1', 'Web Site Uptime', 'Initial downtime when it has been started')
insert into tbPCID values ('P025', 'Web', 'Web Service', 'ISAPI Extension Requests/sec', '1', 'ISAPI Extension Requets/sec', '')
insert into tbPCID values ('P026', 'Web', 'Active Server Pages', 'Request Wait Time', '0', 'ASP Request Wait Time', 'host headers (if exist)')
insert into tbPCID values ('P027', 'Web', 'Active Server Pages', 'Request Execution Time', '0', 'ASP Request Execution Time', 'host headers (if exist)')
insert into tbPCID values ('P028', 'Web', 'Active Server Pages', 'Requests Executing', '0', 'ASP Requests Executing', 'host headers (if exist)')
insert into tbPCID values ('P029', 'Web', 'Active Server Pages', 'Requests Queued', '0', 'ASP Requests Queued', 'host headers (if exist)')
insert into tbPCID values ('P030', 'Web', 'Active Server Pages', 'Requests/Sec', '0', 'ASP Requests/Sec', 'host headers (if exist)')
insert into tbPCID values ('P031', 'Web', 'Active Server Pages', 'Sessions Total', '0', 'ASP Sessions Total', 'host headers (if exist)')
insert into tbPCID values ('P032', 'Web', '.NET Data Provider for SqlServer', 'NumberOfActiveConnections', '1', 'Number of Active DB Connections', 'Site Desc - App Pool Desc(ROOT/AppName) [PID]')
insert into tbPCID values ('P033', 'Web', '.NET Data Provider for SqlServer', 'NumberOfPooledConnections', '1', 'Number of Pooled Connections(SQL)', 'Site Desc - App Pool Desc(ROOT/AppName) [PID]')
insert into tbPCID values ('P034', 'Web', '.NET Data Provider for SqlServer', 'NumberOfNonPooledConnections', '1', 'Number of Non-Pooled Connections(SQL)', 'Site Desc - App Pool Desc(ROOT/AppName) [PID]')
insert into tbPCID values ('P035', 'Web', 'ASP.NET Apps v2.0.50727', 'Request Execution Time', '1', 'ASP.NET Request Execution Time', 'Site Desc - Root/AppName')
insert into tbPCID values ('P036', 'Web', 'ASP.NET Apps v2.0.50727', 'Requests Executing', '1', 'ASP.NET Requests Executing', 'Site Desc - Root/AppName')
insert into tbPCID values ('P037', 'Web', 'ASP.NET Apps v2.0.50727', 'Requests In Application Queue', '1', 'ASP.NET Requests In Application Queue', 'Site Desc - Root/AppName')
insert into tbPCID values ('P038', 'Web', 'ASP.NET Apps v2.0.50727', 'Request Wait Time', '1', 'ASP.NET Request Wait Time', 'Site Desc - Root/AppName')
insert into tbPCID values ('P039', 'Web', 'ASP.NET Apps v2.0.50727', 'Requests/Sec', '1', 'ASP.NET Requests/Sec', 'Site Desc - Root/AppName')
insert into tbPCID values ('P040', 'Web', 'ASP.NET Apps v2.0.50727', 'Sessions Active', '1', 'ASP.NET Active Sessions', 'Site Desc - Root/AppName')
insert into tbPCID values ('P041', 'Web', 'ASP.NET Apps v4.0.30319', 'Request Execution Time', '1', 'ASP.NET Request Execution Time', 'Site Desc - Root/AppName')
insert into tbPCID values ('P042', 'Web', 'ASP.NET Apps v4.0.30319', 'Requests Executing', '1', 'ASP.NET Requests Executing', 'Site Desc - Root/AppName')
insert into tbPCID values ('P043', 'Web', 'ASP.NET Apps v4.0.30319', 'Requests In Application Queue', '1', 'ASP.NET Requests In Application Queue', 'Site Desc - Root/AppName')
insert into tbPCID values ('P044', 'Web', 'ASP.NET Apps v4.0.30319', 'Request Wait Time', '1', 'ASP.NET Request Wait Time', 'Site Desc - Root/AppName')
insert into tbPCID values ('P045', 'Web', 'ASP.NET Apps v4.0.30319', 'Requests/Sec', '1', 'ASP.NET Requests/Sec', 'Site Desc - Root/AppName')
insert into tbPCID values ('P046', 'Web', 'ASP.NET Apps v4.0.30319', 'Sessions Active', '1', 'ASP.NET Active Sessions', 'Site Desc - Root/AppName')
insert into tbPCID values ('P047', 'Web', 'ASP.NET Apps v1.1', 'Request Execution Time', '1', 'ASP.NET Request Execution Time', 'Site Desc - Root/AppName')
insert into tbPCID values ('P048', 'Web', 'ASP.NET Apps v1.1', 'Requests Executing', '1', 'ASP.NET Requests Executing', 'Site Desc - Root/AppName')
insert into tbPCID values ('P049', 'Web', 'ASP.NET Apps v1.1', 'Requests In Application Queue', '1', 'ASP.NET Requests In Application Queue', 'Site Desc - Root/AppName')
insert into tbPCID values ('P050', 'Web', 'ASP.NET Apps v1.1', 'Request Wait Time', '1', 'ASP.NET Request Wait Time', 'Site Desc - Root/AppName')
insert into tbPCID values ('P051', 'Web', 'ASP.NET Apps v1.1', 'Requests/Sec', '1', 'ASP.NET Requests/Sec', 'Site Desc - Root/AppName')
insert into tbPCID values ('P052', 'Web', 'ASP.NET Apps v1.1', 'Sessions Active', '1', 'ASP.NET Active Sessions', 'Site Desc - Root/AppName')
insert into tbPCID values ('P053', 'Web', 'ASP.NET v2.0.50727', 'Requests Queued', '0', 'ASP.NET v2 Queued Requests', '')
insert into tbPCID values ('P054', 'Web', 'ASP.NET v4.0.30319', 'Requests Queued', '0', 'ASP.NET v4 Queued Requests', '')
insert into tbPCID values ('P055', 'BizTalk', 'BizTalk:Message Box:Host Counters', 'Host Queue - Length', '1', 'Number of messages in BizTalk Host Queue', '')
insert into tbPCID values ('P056', 'BizTalk', 'BizTalk:Message Box:Host Counters', 'Host Queue - Suspended Msgs - Length', '1', 'Number of suspended messages in BizTalk Host Queue', '')
insert into tbPCID values ('P057', 'BizTalk', 'XLANG/s Orchestrations', 'Orchestrations suspended/sec', '1', 'Orchestrations suspended/sec', '')
insert into tbPCID values ('P058', 'BizTalk', 'XLANG/s Orchestrations', 'Persistence points/sec', '1', 'Persistence points/sec', '')
insert into tbPCID values ('P059', 'BizTalk', 'BizTalk Messaging', 'document processed', '1', 'Total number of BizTalk documents processed', '')
insert into tbPCID values ('P060', 'BizTalk', 'BizTalk Messaging', 'document processed/sec', '1', 'Number of processed documents/sec', '')
insert into tbPCID values ('P061', 'BizTalk', 'BizTalk:Message Agent', 'Message delivery delay (ms)', '1', 'Message delivery delay due to throttling(ms)', '')
insert into tbPCID values ('P062', 'BizTalk', 'BizTalk:Message Agent', 'Message publishing delay (ms)', '1', 'Message publishing delay due to throttling(ms)', '')
insert into tbPCID values ('P063', 'BizTalk', 'BizTalk:Message Agent', 'Message delivery throttling state', '1', 'Throttling State for Message Delivery', '')
insert into tbPCID values ('P064', 'BizTalk', 'BizTalk:Message Agent', 'Message publishing throttling state', '1', 'Throttling State for Message Publishing', '')
insert into tbPCID values ('P065', 'BizTalk', 'BizTalk:Messaging', 'ID Process', '1', 'Process ID of BizTalk Host Instance', '')
insert into tbPCID values ('P066', 'BizTalk', 'BizTalk:Messaging Latency', 'Inbound Latency (sec)', '1', 'Average latency in milliseconds for inbound processing', '')
insert into tbPCID values ('P067', 'BizTalk', 'BizTalk:Messaging Latency', 'Request-Response Latency (sec)', '1', 'Average latency in milliseconds for Request-Response processing', '')
insert into tbPCID values ('P068', 'BizTalk', 'BizTalk:Messaging Latency', 'Outbound Adapter Latency (sec)', '1', 'Average latency in milliseconds for outbound processing', '')
insert into tbPCID values ('P069', 'BizTalk', 'XLANG/s Orchestrations', 'Megabytes allocated private memory', '1', 'Size of private bytes(MB) of BizTalk Process', '')
insert into tbPCID values ('P070', 'BizTalk', 'BizTalk:Messaging', 'Active receive locations', '1', 'Number of active receive locations', '')
insert into tbPCID values ('P071', 'SQL', 'SQLServer:Access Methods', 'Forwarded Records/sec', '0', 'SQL - Forwarded Records/sec', '')
insert into tbPCID values ('P072', 'SQL', 'SQLServer:Access Methods', 'FreeSpace Scans/sec', '0', 'SQL - FreeSpace Scans/sec', '')
insert into tbPCID values ('P073', 'SQL', 'SQLServer:Access Methods', 'Full Scans/sec', '0', 'SQL - Full Scans/sec', '')
insert into tbPCID values ('P074', 'SQL', 'SQLServer:Access Methods', 'Index Searches/sec', '0', 'SQL - Index Searches/sec', '')
insert into tbPCID values ('P075', 'SQL', 'SQLServer:Access Methods', 'Page Splits/sec', '0', 'SQL - Page Splits/sec', '')
insert into tbPCID values ('P076', 'SQL', 'SQLServer:Access Methods', 'Scan Point Revalidations/sec', '0', 'SQL - Scan Point Revalidations/sec', '')
insert into tbPCID values ('P077', 'SQL', 'SQLServer:Access Methods', 'Workfiles Created/sec', '0', 'SQL - Workfiles Created/sec', '')
insert into tbPCID values ('P078', 'SQL', 'SQLServer:Access Methods', 'Worktables Created/sec', '0', 'SQL - Worktables Created/sec', '')
insert into tbPCID values ('P079', 'SQL', 'SQLServer:Access Methods', 'Table Lock Escalations/sec', '0', 'SQL - Table Lock Escalations/sec', '')
insert into tbPCID values ('P080', 'SQL', 'SQLServer:Access Methods', 'Worktables From Cache Ratio', '0', 'SQL - Worktables From Cache Ratio', '')
insert into tbPCID values ('P081', 'SQL', 'SQLServer:Buffer Manager', 'Buffer cache hit ratio', '0', 'SQL - Buffer cache hit ratio', '')
insert into tbPCID values ('P082', 'SQL', 'SQLServer:Buffer Manager', 'Checkpoint pages/sec', '0', 'SQL - Checkpoint pages/sec', '')
insert into tbPCID values ('P083', 'SQL', 'SQLServer:Buffer Manager', 'Lazy writes/sec', '0', 'SQL - Lazy writes/sec', '')
insert into tbPCID values ('P084', 'SQL', 'SQLServer:Buffer Manager', 'Page life expectancy', '0', 'SQL - Page life expectancy', '')
insert into tbPCID values ('P085', 'SQL', 'SQLServer:Buffer Manager', 'Page lookups/sec', '0', 'SQL - Page lookups/sec', '')
insert into tbPCID values ('P086', 'SQL', 'SQLServer:Buffer Manager', 'Page reads/sec', '0', 'SQL - Page reads/sec', '')
insert into tbPCID values ('P087', 'SQL', 'SQLServer:Buffer Manager', 'Page writes/sec', '0', 'SQL - Page writes/sec', '')
insert into tbPCID values ('P088', 'SQL', 'SQLServer:Buffer Manager', 'Readahead pages/sec', '0', 'SQL - Readahead pages/sec', '')
insert into tbPCID values ('P089', 'SQL', 'SQLServer:Buffer Manager', 'Free list stalls/sec', '0', 'SQL - Free list stalls/sec', '')
insert into tbPCID values ('P090', 'SQL', 'SQLServer:Buffer Manager', 'Database Pages', '0', 'SQL - Database Pages', '')
insert into tbPCID values ('P091', 'SQL', 'SQLServer:Plan Cache', 'Cache Pages', '1', 'SQL - Procedure Cache Pages', '')
insert into tbPCID values ('P092', 'SQL', 'SQLServer:Buffer Manager', 'Target pages', '0', 'SQL - Target pages', '')
insert into tbPCID values ('P096', 'SQL', 'SQLServer:General Statistics', 'Logins/sec', '0', 'SQL - Logins/sec', '')
insert into tbPCID values ('P097', 'SQL', 'SQLServer:General Statistics', 'Logouts/sec', '0', 'SQL - Logouts/sec', '')
insert into tbPCID values ('P098', 'SQL', 'SQLServer:General Statistics', 'User Connections', '0', 'SQL - User Connections', '')
insert into tbPCID values ('P099', 'SQL', 'SQLServer:General Statistics', 'Active Temp Tables', '0', 'Active Temp Tables', '')
insert into tbPCID values ('P100', 'SQL', 'SQLServer:Memory Manager', 'Target Server Memory (KB)', '0', 'SQL - Target Server Memory (KB)', '')
insert into tbPCID values ('P101', 'SQL', 'SQLServer:Memory Manager', 'Total Server Memory (KB)', '0', 'SQL - Total Server Memory (KB)', '')
insert into tbPCID values ('P102', 'SQL', 'SQLServer:Memory Manager', 'Granted Workspace Memory (KB)', '0', 'SQL - Granted Workspace Memory (KB)', '')
insert into tbPCID values ('P103', 'SQL', 'SQLServer:Memory Manager', 'Maximum Workspace Memory (KB)', '0', 'SQL - Maximum Workspace Memory (KB)', '')
insert into tbPCID values ('P104', 'SQL', 'SQLServer:Memory Manager', 'Memory Grants Outstanding', '0', 'SQL - Memory Grants Outstanding', '')
insert into tbPCID values ('P105', 'SQL', 'SQLServer:Memory Manager', 'Memory Grants Pending', '0', 'SQL - Memory Grants Pending', '')
insert into tbPCID values ('P106', 'SQL', 'SQLServer:SQL Statistics', 'Batch Requests/sec', '0', 'SQL - Batch Requests/sec', '')
insert into tbPCID values ('P107', 'SQL', 'SQLServer:SQL Statistics', 'SQL Compilations/sec', '0', 'SQL - SQL Compilations/sec', '')
insert into tbPCID values ('P108', 'SQL', 'SQLServer:SQL Statistics', 'SQL Re-Compilations/sec', '0', 'SQL - SQL Re-Compilations/sec', '')
insert into tbPCID values ('P109', 'SQL', 'SQLServer:SQL Statistics', 'Auto-Param Attempts/sec', '0', 'SQL - Auto-Param Attempts/sec', '')
insert into tbPCID values ('P110', 'SQL', 'SQLServer:SQL Statistics', 'Failed Auto-Params/sec', '0', 'SQL - Failed Auto-Params/sec', '')
insert into tbPCID values ('P111', 'SQL', 'SQLServer:SQL Statistics', 'Unsafe Auto-Params/sec', '0', 'SQL - Unsafe Auto-Params/sec', '')
insert into tbPCID values ('P112', 'SQL', 'SQLServer:SQL Statistics', 'SQL Attention Rate', '0', 'SQL Attention Rate', '')
insert into tbPCID values ('P113', 'SQL', 'SQLServer:CLR', 'CLR Execution', '0', 'Total Execution time in CLR ( microseconds )', '')
insert into tbPCID values ('P114', 'SQL', 'SQLServer:Databases', 'Active Transactions', '1', 'Number of active update transactions for the database', '')
insert into tbPCID values ('P115', 'SQL', 'SQLServer:Databases', 'Data File(s) Size (KB)', '1', 'The cumulative size of all the data files in the database', '')
insert into tbPCID values ('P116', 'SQL', 'SQLServer:Databases', 'Log File(s) Size (KB)', '1', 'The cumulative size of all the log files in the database', '')
insert into tbPCID values ('P117', 'SQL', 'SQLServer:Databases', 'Log File(s) Used Size (KB)', '1', 'The cumulative used size of all the log files in the database', '')
insert into tbPCID values ('P118', 'SQL', 'SQLServer:Databases', 'Log Flush Waits/sec', '1', 'Number of commits waiting on log flush', '')
insert into tbPCID values ('P119', 'SQL', 'SQLServer:Databases', 'Log Flushes/sec', '1', 'SQL - Log Flushes/sec', '')
insert into tbPCID values ('P120', 'SQL', 'SQLServer:Databases', 'Log Bytes Flushed/sec', '1', 'SQL - Log Bytes Flushed/sec', '')
insert into tbPCID values ('P121', 'SQL', 'SQLServer:Databases', 'Log Flush Wait Time', '1', 'SQL - Log Flush Wait Time', '')
insert into tbPCID values ('P122', 'SQL', 'SQLServer:Databases', 'Log Growths', '1', 'SQL - Log Growths', '')
insert into tbPCID values ('P123', 'SQL', 'SQLServer:Databases', 'Log Shrinks', '1', 'SQL - Log Shrinks', '')
insert into tbPCID values ('P124', 'SQL', 'SQLServer:Databases', 'Log Truncations', '1', 'SQL - Log Truncations', '')
insert into tbPCID values ('P125', 'SQL', 'SQLServer:Databases', 'Percent Log Used', '1', 'SQL - Percent Log Used', '')
insert into tbPCID values ('P126', 'SQL', 'SQLServer:Latches', 'Latch Waits/sec', '0', 'SQL - Latch Waits/sec', '')
insert into tbPCID values ('P127', 'SQL', 'SQLServer:Latches', 'Number of SuperLatches', '0', 'SQL - Current number of SuperLatches', '')
insert into tbPCID values ('P128', 'SQL', 'SQLServer:Latches', 'Total Latch Wait Time (ms)', '0', 'Total Latch Wait Time (ms)', '')
insert into tbPCID values ('P129', 'SQL', 'SQLServer:Locks', 'Average Wait Time (ms)', '1', 'SQL - Average Wait Time (ms)', '')
insert into tbPCID values ('P130', 'SQL', 'SQLServer:Locks', 'Lock Requests/sec', '1', 'SQL - Lock Requests/sec', '')
insert into tbPCID values ('P131', 'SQL', 'SQLServer:Locks', 'Lock Timeouts/sec', '1', 'SQL - Lock Timeouts/sec', '')
insert into tbPCID values ('P132', 'SQL', 'SQLServer:Locks', 'Lock Wait Time (ms)', '1', 'SQL - Lock Wait Time (ms)', '')
insert into tbPCID values ('P133', 'SQL', 'SQLServer:Locks', 'Lock Waits/sec', '1', 'SQL - Lock Waits/sec', '')
insert into tbPCID values ('P134', 'SQL', 'SQLServer:Locks', 'Number of Deadlocks/sec', '1', 'SQL - Number of Deadlocks/sec', '')
insert into tbPCID values ('P138', 'SQL', 'SQLServer:Plan Cache', 'Cache Hit Ratio', '1', 'SQL - Plan Cache Hit Ratio', '')
insert into tbPCID values ('P139', 'SQL', 'SQLServer:Resource pool Stats', 'CPU Usage %', '1', 'SQL - CPU Usage %', '')

insert into tbPCID values ('P144', 'SQL', 'SQLServer:Transactions', 'Free Space in tempdb (KB)', '0', 'Free Space in tempdb (KB)', '')
insert into tbPCID values ('P145', 'SQL', 'SQLServer:Transactions', 'Longest Transaction Running Time', '0', 'Longest Transation Running Time', '')
insert into tbPCID values ('P146', 'SQL', 'SQLServer:Wait Statistics', 'Lock waits', '1', 'SQL - Lock waits', '')
insert into tbPCID values ('P147', 'SQL', 'SQLServer:Wait Statistics', 'Log buffer waits', '1', 'SQL - Log buffer waits', '')
insert into tbPCID values ('P148', 'SQL', 'SQLServer:Wait Statistics', 'Log write waits', '1', 'SQL - Log write waits', '')
insert into tbPCID values ('P149', 'SQL', 'SQLServer:Wait Statistics', 'Memory grant queue waits', '1', 'SQL - Memory grant queue waits', '')
insert into tbPCID values ('P150', 'SQL', 'SQLServer:Wait Statistics', 'Network IO waits', '1', 'SQL - Network IO waits', '')
insert into tbPCID values ('P151', 'SQL', 'SQLServer:Wait Statistics', 'Page IO Latch waits', '1', 'SQL - Page IO Latch waits', '')

insert into tbPCID values ('P153', 'SQL', 'SQLServer:Cursor Manager by Type', 'Active cursors', '1', 'SQL - Active cursors', '')
insert into tbPCID values ('P154', 'Windows', 'PhysicalDisk', '% Disk Read Time', '1', '% Physical Disk Read Time', '')
insert into tbPCID values ('P155', 'Windows', 'PhysicalDisk', '% Disk Time', '1', '% Physical Disk Time', '')
insert into tbPCID values ('P156', 'Windows', 'PhysicalDisk', '% Disk Write Time', '1', '% Physical Disk Write Time', '')
insert into tbPCID values ('P157', 'Windows', 'PhysicalDisk', '% Idle Time', '1', '% Physical Idle Time', '')
insert into tbPCID values ('P158', 'Windows', 'PhysicalDisk', 'Avg. Disk Bytes/Read', '1', 'Avg. Physical Disk Bytes/Read', '')
insert into tbPCID values ('P159', 'Windows', 'PhysicalDisk', 'Avg. Disk Bytes/Transfer', '1', 'Avg. Physical Disk Bytes/Transfer', '')
insert into tbPCID values ('P160', 'Windows', 'PhysicalDisk', 'Avg. Disk Bytes/Write', '1', 'Avg. Physical Disk Bytes/Write', '')
insert into tbPCID values ('P161', 'Windows', 'PhysicalDisk', 'Avg. Disk Queue Length', '1', 'Avg. Physical Disk Queue Length', '')
insert into tbPCID values ('P162', 'Windows', 'PhysicalDisk', 'Current Disk Queue Length', '1', 'Current Physical Disk Queue Length', '')
insert into tbPCID values ('P163', 'Windows', 'PhysicalDisk', 'Split IO/Sec', '1', 'Physical Disk - Split IO/Sec', '')
insert into tbPCID values ('P164', 'Windows', 'LogicalDisk', '% Free Space', '1', '(%) Free Disk Space of Logical Drive', '')
insert into tbPCID values ('P165', 'Windows', 'PhysicalDisk', 'Avg. Disk Read Queue Length', '1', 'Current Physical Disk Read Queue Length', '')
insert into tbPCID values ('P166', 'Windows', 'PhysicalDisk', 'Avg. Disk Write Queue Length', '1', 'Current Physical Disk Read Queue Length', '')
insert into tbPCID values ('P167', 'SQL', 'SQLServer:Latches', 'Average Latch Wait Time (ms)', '0', 'SQL - Average Latch Wait Time (ms)', '')
insert into tbPCID values ('P168', 'SQL', 'SQLServer:Memory Manager', 'Connection Memory (KB)', '0', 'SQL - Connection Memory', '')
insert into tbPCID values ('P169', 'SQL', 'SQLServer:Databases', 'Log Cache Hit Ratio', '1', 'SQL - Log Cache Hit Ratio', '')
insert into tbPCID values ('P170', 'Windows', 'Network Interface', 'Bytes Received/sec', '1', 'Bytes Received/sec', '')
insert into tbPCID values ('P171', 'Windows', 'Network Interface', 'Bytes Sent/sec', '1', 'Bytes Sent/sec', '')
insert into tbPCID values ('P172', 'SQL', 'SQLServer:General Statistics', 'Processes blocked', '0', 'SQL - Processes blocked', '')
insert into tbPCID values ('P173', 'SQL', 'SQLServer:General Statistics', 'Temp Tables Creation Rate', '0', 'SQL - Temp Tables Creation Rate', '')
insert into tbPCID values ('P174', 'SQL', 'SQLServer:General Statistics', 'Temp Tables For Destruction', '0', 'SQL - Temp Tables For Destruction', '')
insert into tbPCID values ('P175', 'SQL', 'SQLServer:General Statistics', 'Connection Reset/sec', '0', 'SQL - Connection Reset/sec', '')
insert into tbPCID values ('P176', 'SQL', 'SQLServer:Memory Manager', 'Database Cache Memory (KB)', '0', 'SQL - Database Cache Memory (KB)', '')
insert into tbPCID values ('P177', 'SQL', 'SQLServer:Memory Manager', 'Free Memory (KB)', '0', 'SQL - Free Memory (KB)', '')
insert into tbPCID values ('P178', 'SQL', 'SQLServer:Memory Manager', 'Lock Memory (KB)', '0', 'SQL - Lock Memory (KB)', '')
insert into tbPCID values ('P179', 'SQL', 'SQLServer:Memory Manager', 'Log Pool Memory (KB)', '0', 'SQL - Log Pool Memory (KB)', '')
insert into tbPCID values ('P180', 'SQL', 'SQLServer:Memory Manager', 'Optimizer Memory (KB)', '0', 'SQL - Optomizer Memory (KB)', '')
insert into tbPCID values ('P181', 'SQL', 'SQLServer:Memory Manager', 'Reserved Server Memory (KB)', '0', 'SQL - Reserved Server Memory (KB)', '')
insert into tbPCID values ('P182', 'SQL', 'SQLServer:Memory Manager', 'SQL Cache Memory (KB)', '0', 'SQL - SQL Cache Memory (KB)', '')
insert into tbPCID values ('P183', 'SQL', 'SQLServer:Memory Manager', 'Stolen Server Memory (KB)', '0', 'SQL - Stolen Server Memory (KB)', '')
insert into tbPCID values ('P184', 'SQL', 'SQLServer:Transactions', 'Transactions', '0', 'SQL - Transactions', '')
insert into tbPCID values ('P185', 'SQL', 'SQLServer:Wait Statistics', 'Non-Page latch waits', '1', 'SQL - Non-Page latch waits', '')
insert into tbPCID values ('P186', 'SQL', 'SQLServer:Wait Statistics', 'Page latch waits', '1', 'SQL - Page latch waits', '')
insert into tbPCID values ('P187', 'SQL', 'SQLServer:Wait Statistics', 'Thread-safe memory objects waits', '1', 'SQL - Thread-safe memory objects waits', '')
insert into tbPCID values ('P188', 'SQL', 'SQLServer:Wait Statistics', 'Transaction ownership waits', '1', 'SQL - Transaction ownership waits', '')
insert into tbPCID values ('P189', 'SQL', 'SQLServer:Wait Statistics', 'Wait for the worker', '1', 'SQL - Wait for the worker', '')
insert into tbPCID values ('P190', 'Windows', 'LogicalDisk', '% Idle Time', '1', '% Logical Idle Time', '')
insert into tbPCID values ('P191', 'Windows', 'LogicalDisk', 'Avg. Disk Bytes/Read', '1', 'Avg. Logical Disk Bytes/Read', '')
insert into tbPCID values ('P192', 'Windows', 'LogicalDisk', 'Avg. Disk Bytes/Transfer', '1', 'Avg. Logical Disk Bytes/Transfer', '')
insert into tbPCID values ('P193', 'Windows', 'LogicalDisk', 'Avg. Disk Bytes/Write', '1', 'Avg. Logical Disk Bytes/Write', '')
insert into tbPCID values ('P194', 'Windows', 'LogicalDisk', 'Current Disk Queue Length', '1', 'Current Physical Disk Queue Length', '')
insert into tbPCID values ('P195', 'Windows', 'LogicalDisk', '% Disk Read Time', '1', '% Logical Disk Read Time', '')
insert into tbPCID values ('P196', 'Windows', 'LogicalDisk', '% Disk Write Time', '1', '% Logical Disk Write Time', '')
insert into tbPCID values ('P197', 'Windows', 'LogicalDisk', 'Avg. Disk Read Queue Length', '1', 'Avg. Disk Read Queue Length', '')
insert into tbPCID values ('P198', 'Windows', 'LogicalDisk', 'Avg. Disk Write Queue Length', '1', 'Avg. Disk Write Queue Length', '')
insert into tbPCID values ('P199', 'SQL', 'SQLServer:Locks', 'Lock Timeouts (timeout > 0)/sec', '1', 'SQL - Lock Timeouts (timeout > 0)/sec', '')
insert into tbPCID values ('P200', 'Windows', 'PhysicalDisk', 'Disk Reads/sec', '1', 'Physical Disk Reads/sec', '')
insert into tbPCID values ('P201', 'Windows', 'PhysicalDisk', 'Disk Writes/sec', '1', 'Physical Disk Write/sec', '')
insert into tbPCID values ('P202', 'Web', 'W3SVC_W3WP', 'Active Requests', '1', 'Web - Number of active requests', '')
insert into tbPCID values ('P203', 'Web', 'W3SVC_W3WP', 'Requests / Sec', '1', 'Web - Total Requests/sec', '')
insert into tbPCID values ('P204', 'Web', 'Web Service', 'Current Anonymous Users', '1', 'Current Number of Anonymous Users', '')
insert into tbPCID values ('P205', 'Web', 'Web Service', 'Current NonAnonymous Users', '1', 'Current Number of Non-Anonymous Users', '')
insert into tbPCID values ('P206', 'Windows', 'LogicalDisk', 'Avg. Disk sec/Transfer', '1', 'Avg. Disk sec/Transfer', '')
insert into tbPCID values ('P207', 'Windows', 'LogicalDisk', 'Avg. Disk sec/Write', '1', 'Avg. Disk sec/Write', '')
insert into tbPCID values ('P208', 'Windows', 'LogicalDisk', 'Disk Bytes/sec', '1', 'Disk Bytes/sec', '')
insert into tbPCID values ('P209', 'Windows', 'LogicalDisk', 'Disk Read Bytes/sec', '1', 'Disk Read Bytes/sec', '')
insert into tbPCID values ('P210', 'Windows', 'LogicalDisk', 'Disk Reads/sec', '1', 'Disk Reads/sec', '')
insert into tbPCID values ('P211', 'Windows', 'LogicalDisk', 'Disk Transfers/sec', '1', 'Disk Transfers/sec', '')
insert into tbPCID values ('P212', 'Windows', 'LogicalDisk', 'Disk Write Bytes/sec', '1', 'Disk Write Bytes/sec', '')
insert into tbPCID values ('P213', 'Windows', 'LogicalDisk', 'Disk Writes/sec', '1', 'Disk Writes/sec', '')
insert into tbPCID values ('P214', 'Windows', 'LogicalDisk', 'Split IO/Sec', '1', 'Split IO/Sec', '')
insert into tbPInstance values ('P001', '_Total', '0')
insert into tbPInstance values ('P002', '_Total', '0')
insert into tbPInstance values ('P005', 'w3wp', '1')
insert into tbPInstance values ('P006', 'java', '0')
insert into tbPInstance values ('P006', 'javaw', '0')
insert into tbPInstance values ('P006', 'w3wp', '0')
insert into tbPInstance values ('P012', 'w3wp', '1')
insert into tbPInstance values ('P013', 'java', '0')
insert into tbPInstance values ('P013', 'javaw', '0')
insert into tbPInstance values ('P013', 'w3wp', '0')
insert into tbPInstance values ('P014', 'java', '0')
insert into tbPInstance values ('P014', 'javaw', '0')
insert into tbPInstance values ('P014', 'w3wp', '0')
insert into tbPInstance values ('P091', '_Total', '0')
insert into tbPInstance values ('P138', '_Total', '0')
insert into tbPInstance values ('P139', 'default', '0')
insert into tbPInstance values ('P146', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P147', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P148', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P149', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P150', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P151', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P153', '_Total', '0')
insert into tbPInstance values ('P185', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P186', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P187', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P188', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P189', 'Average wait time (ms)', '0')
insert into tbPInstance values ('P202', '_Total', '0')
insert into tbPInstance values ('P203', '_Total', '0')
insert into tbAlertRules values (N'Windows', N'R001', N'P001', N'75', N'1', N'높은 CPU 사용률({t}% 이상)이 1분 이상 동안 지속되었습니다. ', N'_Total', N'60', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R001', N'P001', N'75', N'1', N'High CPU %Utilization({t}%) for more than 1 minute. ', N'_Total', N'60', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R001', N'P001', N'75', N'1', N'高いCPU使用率が1分以上間持続しました。({t}%)', N'_Total', N'60', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R002', N'P001', N'95', N'1', N'높은 CPU 사용률({t}% 이상)이 1분 이상 동안 지속되었습니다. ', N'_Total', N'60', N'0', N'1', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R002', N'P001', N'95', N'1', N'High CPU %Utilization({t}%) for more than 1 minute.', N'_Total', N'60', N'0', N'1', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R002', N'P001', N'95', N'1', N'高いCPU使用率が1分以上間持続しました。({t}%)', N'_Total', N'60', N'0', N'1', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R003', N'P004', N'2', N'0', N'CPU처리 지연이 발견되었습니다. CPU당 대기 쓰레드 수가 {t}보다 큽니다.', N'', N'60', N'1', N'1', N'1', N'Warning', N'#CPU(Number of Processors)', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R003', N'P004', N'2', N'0', N'Processor delay is found. (Processor Queue Length per CPU is greater than {t})', N'', N'60', N'1', N'1', N'1', N'Warning', N'#CPU(Number of Processors)', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R003', N'P004', N'2', N'0', N'CPU処理の引き延ばしが発見されました。CPU当たり待機スレッド数が{t}より大きいです。', N'', N'60', N'1', N'1', N'1', N'Warning', N'#CPU(Number of Processors)', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R004', N'P007', N'20', N'2', N'가용한 RAM의 크기가 {t}MB 이하입니다.', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R004', N'P007', N'20', N'2', N'Lack of available memory(Available RAM is less than {t}MB)', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R004', N'P007', N'20', N'2', N'利用できるRAMは{t}MB以下です。', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R005', N'P007', N'200', N'2', N'가용한 RAM의 크기가 {t}MB 이하입니다.', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R005', N'P007', N'200', N'2', N'Lack of available memory(Available RAM is less than {t}MB)', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R005', N'P007', N'200', N'2', N'利用できるRAMは{t}MB以下です。', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R006', N'P008', N'0.9', N'0', N'시스템에서 커밋된 메모리의 크기가 RAM의 90% 이상에 도달했습니다.', N'', N'0', N'1', N'0', N'1', N'Information', N'Size of RAM(90%)', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R006', N'P008', N'0.9', N'0', N'Exessive system-wide committed memory size(greater than 90% of RAM)', N'', N'0', N'1', N'0', N'1', N'Information', N'Size of RAM(90%)', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R006', N'P008', N'0.9', N'0', N'システムでコミットされたメモリーの大きさがRAMの90%以上に到逹しました。', N'', N'0', N'1', N'0', N'1', N'Information', N'Size of RAM(90%)', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R007', N'P008', N'1', N'0', N'시스템에서 커밋된 메모리의 크기가 RAM의 크기보다 큽니다.', N'', N'0', N'1', N'0', N'1', N'Warning', N'Size of RAM(99%)', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R007', N'P008', N'1', N'0', N'The size of system-wide committed memory is greater than RAM size', N'', N'0', N'1', N'0', N'1', N'Warning', N'Size of RAM(99%)', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R007', N'P008', N'1', N'0', N'システムでコミットされたメモリーの大きさがRAMの大きさより大きいです。', N'', N'0', N'1', N'0', N'1', N'Warning', N'Size of RAM(99%)', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R008', N'P009', N'10000', N'2', N'커널의 할당 가능한 페이지 테이블 항목이 부족합니다.', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R008', N'P009', N'10000', N'2', N'Lack of free system page table entries(PTE) in kernel', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R008', N'P009', N'10000', N'2', N'カーネルの割り当て可能なページテーブル項目が不足です。', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R009', N'P009', N'1000', N'2', N'커널의 할당 가능한 페이지 테이블 항목이 매우 부족합니다.', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R009', N'P009', N'1000', N'2', N'Lack of free system page table entries(PTE) in kernel', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R009', N'P009', N'1000', N'2', N'カーネルの割り当て可能なページテーブル項目が非常に不足です。', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R010', N'P010', N'650000000', N'1', N'커널의 페이지된 풀의 크기가 최대값에 도달했습니다..', N'', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R010', N'P010', N'650000000', N'1', N'Maximum pool paged bytes(lack of kernel resource)', N'', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R010', N'P010', N'650000000', N'1', N'カーネルのページされたプールの大きさが最大値に到逹しました。', N'', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R011', N'P011', N'256000000', N'1', N'커널의 페이지되지 않은 풀의 크기 최대값에 도달했습니다.', N'', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R011', N'P011', N'256000000', N'1', N'Maximum pool non-paged bytes(lack of kernel resource)', N'', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R011', N'P011', N'256000000', N'1', N'カーネルのページされないプールの大きさ最大値に到逹しました。', N'', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R012', N'P013', N'800000000', N'1', N'웹 응용프로그램 작업자프로세스(W3WP) 메모리 사용량이 높습니다.({t}bytes 이상)', N'w3wp', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R012', N'P013', N'800000000', N'1', N'Size of W3WP Process memory is high. (greater than {t} bytes)', N'w3wp', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R012', N'P013', N'800000000', N'1', N'ウェブアプリケーション作業者プロセス(W3WP)メモリー使用量が高いです。({t}bytes 以上)', N'w3wp', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R013', N'P013', N'1200000000', N'1', N'웹 응용프로그램 작업자프로세스(W3WP) 메모리 사용량이 매우 높습니다.({t}bytes 이상)', N'w3wp', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R013', N'P013', N'1200000000', N'1', N'Size of W3WP Process memory is very high. (greater than {t}GB)', N'w3wp', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R013', N'P013', N'1200000000', N'1', N'ウェブアプリケーション作業者プロセス(W3WP)メモリー使用量が非常に高いです。({t}bytes以上)', N'w3wp', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R014', N'P013', N'1600000000', N'1', N'웹 응용프로그램 작업자프로세스(W3WP) 메모리 사용량이 매우 높습니다.({t}bytes이상)', N'w3wp', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R014', N'P013', N'1600000000', N'1', N'Size of W3WP Process memory is too high.(greater than {t}GB)', N'w3wp', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R014', N'P013', N'1600000000', N'1', N'ウェブアプリケーション作業者プロセス(W3WP)メモリー使用量が非常に高いです。({t}bytes 以上)', N'w3wp', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R015', N'P014', N'0', N'0', N'웹 응용프로그램 작업자프로세스(W3WP)가 종료되었거나 재활용 되었습니다.', N'w3wp', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R015', N'P014', N'0', N'0', N'An application pool has been shutdowned, or recycled', N'w3wp', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R015', N'P014', N'0', N'0', N'ウェブアプリケーション作業者プロセス(W3WP)が終了されたかリサイクルされました。', N'w3wp', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R016', N'P016', N'0.025', N'1', N'디스크 성능의 저하가 발생하였습니다. (읽기당 소요시간 25ms이상)', N'C:', N'60', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R016', N'P016', N'0.025', N'1', N'Poor disk performance (more than 25ms per read)', N'C:', N'60', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R016', N'P016', N'0.025', N'1', N'ディスク性能の低下が発生しました。(読み取り当たり所要時間25ms以上)', N'C:', N'60', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R017', N'P018', N'2000', N'2', N'디스크의 여유 공간이 {t}GB 이하입니다. ({p}MB 남음)', N'C:', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R017', N'P018', N'2000', N'2', N'Lack of free disk space (less than {t}MB)', N'C:', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R017', N'P018', N'2000', N'2', N'ディスクの空き空間が{t}MB以下です。', N'C:', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R018', N'P018', N'200', N'2', N'디스크의 여유 공간이 {t}MB 이하입니다. ({p}MB 남음)', N'C:', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R018', N'P018', N'200', N'2', N'Lack of free disk space (less than {t}MB)', N'C:', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R018', N'P018', N'200', N'2', N'ディスクの空き空間が{t}MB以下です.', N'C:', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R019', N'P020', N'0.7', N'0', N'네트워크 사용량이 대역폭의 70% 이상입니다. 가용 대역폭의 여유가 부족합니다.', N'All Instances', N'60', N'1', N'1', N'1', N'Warning', N'Network bandwidth', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R019', N'P020', N'0.7', N'0', N'Lack of available network bandwidth (bytes/sec is greater than 70% of bandwidth)', N'All Instances', N'60', N'1', N'1', N'1', N'Warning', N'Network bandwidth', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R019', N'P020', N'0.7', N'0', N'ネットワーク使用量が帯域幅の70%以上です。使用帯域幅の空きが不足です。', N'All Instances', N'60', N'1', N'1', N'1', N'Warning', N'Network bandwidth', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R020', N'P024', N'0', N'3', N'웹사이트의 서비스가 중단되었습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R020', N'P024', N'0', N'3', N'A web site has been stopped.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R020', N'P024', N'0', N'3', N'ウェブサイトのサービスが中断されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R021', N'P029', N'1', N'1', N'ASP 응용프로그램의 처리 지연이 발생하고 있습니다.', N'', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R021', N'P029', N'1', N'1', N'ASP Applications are being delayed.', N'', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R021', N'P029', N'1', N'1', N'ASPアプリケーションの処理が混み合っています。', N'', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R022', N'P033', N'90', N'0', N'응용프로그램의 SQL 서버 연결풀 크기 최대값에 도달하였습니다.', N'All Instances', N'0', N'1', N'1', N'1', N'Warning', N'Max Pool Size', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R022', N'P033', N'90', N'0', N'Maximum number of pooled SQL connections has been reached.', N'All Instances', N'0', N'1', N'1', N'1', N'Warning', N'Max Pool Size', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R022', N'P033', N'90', N'0', N'アプリケーションのSQLサーバーコネクションプール大きさが最大値に到逹しました。', N'All Instances', N'0', N'1', N'1', N'1', N'Warning', N'Max Pool Size', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R023', N'P034', N'3600', N'0', N'응용프로그램의 풀링 되지 않은 SQL서버 연결수가 매우 많습니다.', N'All Instances', N'0', N'1', N'1', N'1', N'Warning', N'Total non-pooled connections', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R023', N'P034', N'3600', N'0', N'There are too many non-pooled SQL connections.', N'All Instances', N'0', N'1', N'1', N'1', N'Warning', N'Total non-pooled connections', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R023', N'P034', N'3600', N'0', N'アプリケーションのプーリングされてないSQLサーバコネクションが多すぎです。', N'All Instances', N'0', N'1', N'1', N'1', N'Warning', N'Total non-pooled connections', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R024', N'P037', N'1', N'1', N'ASP.NET 응용프로그램의 처리 지연이 발생하고 있습니다. 추가 요청은 대기 상태가 됩니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R024', N'P037', N'1', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be queued.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R024', N'P037', N'1', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は待機状態となります。', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R025', N'P037', N'99', N'1', N'ASP.NET 응용프로그램의 처리 지연이 발생하고 있습니다. 추가 요청은 거부 될 수 있습니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R025', N'P037', N'99', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be rejected.', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R025', N'P037', N'99', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は拒否されることもあります。', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R026', N'P043', N'1', N'1', N'ASP.NET 응용프로그램의 처리 지연이 발생하고 있습니다. 추가 요청은 대기 상태가 됩니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R026', N'P043', N'1', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be queued.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R026', N'P043', N'1', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は待機状態となります。', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R027', N'P043', N'99', N'1', N'ASP.NET 응용프로그램의 처리 지연이 발생하고 있습니다. 추가 요청은 거부 될 수 있습니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R027', N'P043', N'99', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be rejected.', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R027', N'P043', N'99', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は拒否されることもあります。', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R028', N'P049', N'1', N'1', N'ASP.NET 응용프로그램의 처리 지연이 발생하고 있습니다. 추가 요청은 대기 상태가 됩니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R028', N'P049', N'1', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be queued.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R028', N'P049', N'1', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は待機状態となります。', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R029', N'P049', N'99', N'1', N'ASP.NET 응용프로그램의 처리 지연이 발생하고 있습니다. 추가 요청은 거부 될 수 있습니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R029', N'P049', N'99', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be rejected.', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R029', N'P049', N'99', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は拒否されることもあります。', N'All Instances', N'30', N'0', N'1', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R030', N'P038', N'5000', N'1', N'ASP.NET 응용프로그램의 처리 지연발생으로, 실행 요청의 대기 시간이 5초 이상입니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R030', N'P038', N'5000', N'1', N'ASP.NET Applications are being delayed. Requests are waiting more than 5 seconds', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R030', N'P038', N'5000', N'1', N'ASP.NETアプリケーションの処理混み合いの影響で、実行要請の待機時間が5秒以上です。', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R031', N'P044', N'5000', N'1', N'ASP.NET 응용프로그램의 처리 지연발생으로, 실행 요청의 대기 시간이 5초 이상입니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R031', N'P044', N'5000', N'1', N'ASP.NET Applications are being delayed. Requests are waiting more than 5 seconds', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R031', N'P044', N'5000', N'1', N'ASP.NETアプリケーションの処理混み合いの影響で、実行要請の待機時間が5秒以上です。', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R032', N'P050', N'5000', N'1', N'ASP.NET 응용프로그램의 처리 지연발생으로, 실행 요청의 대기 시간이 5초 이상입니다.', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R032', N'P050', N'5000', N'1', N'ASP.NET Applications are being delayed. Requests are waiting more than 5 seconds', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R032', N'P050', N'5000', N'1', N'ASP.NETアプリケーションの処理混み合いの影響で、実行要請の待機時間が5秒以上です。', N'All Instances', N'30', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R033', N'P017', N'1', N'1', N'디스크 입출력의 지연이 발견되었습니다.', N'C:', N'60', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R033', N'P017', N'1', N'1', N'Disk IO delays are found', N'C:', N'60', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R033', N'P017', N'1', N'1', N'ディスク入出力の混み合いが発見されました。', N'C:', N'60', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R034', N'P021', N'1', N'1', N'네트워크 송수신의 지연이 발견되었습니다.', N'All Instances', N'60', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R034', N'P021', N'1', N'1', N'Network IO delays are found.', N'All Instances', N'60', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R034', N'P021', N'1', N'1', N'ネットワーク送受信の混み合いが発見されました。', N'All Instances', N'60', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R035', N'P013', N'20000000', N'0', N'웹응용프로그램 작업자 프로세스(W3WP)메모리가 수 초간 20MB이상 급증하였습니다.', N'w3wp', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R035', N'P013', N'20000000', N'0', N'Process(w3wp.exe) memory has been increased by more than 20MB during a few seconds.', N'w3wp', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R035', N'P013', N'20000000', N'0', N'ウェブアプリケーション作業者プロセス(W3WP)メモリーが数秒間20MB以上急増しました。', N'w3wp', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R036', N'P013', N'800000000', N'1', N'웹 응용프로그램 작업자프로세스(java) 메모리 사용량이 높습니다.(800MB이상)', N'java', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R036', N'P013', N'800000000', N'1', N'Size of Worker Process memory is high. (greater than 800MB)', N'java', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R036', N'P013', N'800000000', N'1', N'ウェブアプリケーション作業者プロセス(java)メモリー使用量が高いです。(800MB以上)', N'java', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R037', N'P013', N'1200000000', N'1', N'웹 응용프로그램 작업자프로세스(java) 메모리 사용량이 매우 높습니다.(1200MB이상)', N'java', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R037', N'P013', N'1200000000', N'1', N'Size of Worker Process memory is very high. (greater than 1.2GB)', N'java', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R037', N'P013', N'1200000000', N'1', N'ウェブアプリケーション作業者プロセス(java)メモリー使用量が非常に高いです。(1200MB以上)', N'java', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R038', N'P013', N'1600000000', N'1', N'웹 응용프로그램 작업자프로세스(java) 메모리 사용량이 매우 높습니다.(1600MB이상)', N'java', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R038', N'P013', N'1600000000', N'1', N'Size of Worker Process memory is too high.(greater than 1.6GB)', N'java', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R038', N'P013', N'1600000000', N'1', N'ウェブアプリケーション作業者プロセス(java)メモリー使用量が非常に高いです。(1600MB以上)', N'java', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R039', N'P014', N'0', N'0', N'웹 응용프로그램 작업자프로세스(java)가 종료되거나 재활용 되었습니다.', N'java', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R039', N'P014', N'0', N'0', N'An application pool has been shutdowned, or recycled', N'java', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R039', N'P014', N'0', N'0', N'ウェブアプリケーション作業者プロセス(java)が終了されたかリサイクルされました。', N'java', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R040', N'P013', N'800000000', N'1', N'웹 응용프로그램 작업자프로세스(javaw) 메모리 사용량이 높습니다.(800MB이상)', N'javaw', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R040', N'P013', N'800000000', N'1', N'Size of Worker Process memory is high. (greater than 800MB)', N'javaw', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R040', N'P013', N'800000000', N'1', N'ウェブアプリケーション作業者プロセス(javaw)メモリー使用量が高いです。(800MB以上)', N'javaw', N'0', N'1', N'0', N'1', N'Information', N'32bit, or 64bit Windows', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R041', N'P013', N'1200000000', N'1', N'웹 응용프로그램 작업자프로세스(javaw) 메모리 사용량이 매우 높습니다.(1200MB이상)', N'javaw', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R041', N'P013', N'1200000000', N'1', N'Size of Worker Process memory is very high. (greater than 1.2GB)', N'javaw', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R041', N'P013', N'1200000000', N'1', N'ウェブアプリケーション作業者プロセス(javaw)メモリー使用量が非常に高いです。(1200MB以上)', N'javaw', N'0', N'1', N'0', N'1', N'Warning', N'32bit, or 64bit Windows', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R042', N'P013', N'1600000000', N'1', N'웹 응용프로그램 작업자프로세스(javaw) 메모리 사용량이 매우 높습니다.(1600MB이상)', N'javaw', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R042', N'P013', N'1600000000', N'1', N'Size of Worker Process memory is too high.(greater than 1.6GB)', N'javaw', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R042', N'P013', N'1600000000', N'1', N'ウェブアプリケーション作業者プロセス(javaw)メモリー使用量が非常に高いです。(1600MB以上)', N'javaw', N'0', N'1', N'0', N'1', N'Critical', N'32bit, or 64bit Windows', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R043', N'P014', N'0', N'0', N'웹 응용프로그램 작업자프로세스(javaw)가 종료되거나 재활용 되었습니다.', N'javaw', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R043', N'P014', N'0', N'0', N'An application pool has been shutdowned, or recycled', N'javaw', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R043', N'P014', N'0', N'0', N'ウェブアプリケーション作業者プロセス(javaw)が終了されたかリサイクルされました。', N'javaw', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R044', N'P024', N'0', N'0', N'웹사이트의 응답이 없습니다. 하트비트 요청이 실패하였습니다.', N'', N'0', N'1', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R044', N'P024', N'0', N'0', N'The site failed to response for the health check request.', N'', N'0', N'1', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R044', N'P024', N'0', N'0', N'ウェブサイトの応答がないです。ハートビート要請が失敗しました。', N'', N'0', N'1', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R045', N'P024', N'0', N'0', N'웹사이트의 응답이 오류를 반환합니다.. 하트비트 요청에 정상응답하지 않습니다.', N'', N'0', N'1', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Web', N'R045', N'P024', N'0', N'0', N'The site responsed with an error for the health check request.', N'', N'0', N'1', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Web', N'R045', N'P024', N'0', N'0', N'ウェブサイトの応答がエラーを返還します。ハートビート要請に正常応答しません。', N'', N'0', N'1', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Web', N'R046', N'P013', N'20000000', N'0', N'웹응용프로그램 작업자 프로세스(java)메모리가 수 초간 20MB이상 급증하였습니다.', N'java', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R046', N'P013', N'20000000', N'0', N'Process(Java) memory has been increased by more than 20MB during a few seconds.', N'java', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R046', N'P013', N'20000000', N'0', N'ウェブアプリケーション作業者プロセス(java)メモリーが数秒間20MB以上急増しました。', N'java', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R047', N'P013', N'20000000', N'0', N'웹응용프로그램 작업자 프로세스(javaw)메모리가 수 초간 20MB이상 급증하였습니다.', N'javaw', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R047', N'P013', N'20000000', N'0', N'Process(Java) memory has been increased by more than 20MB during a few seconds.', N'javaw', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R047', N'P013', N'20000000', N'0', N'ウェブアプリケーション作業者プロセス(javaw)メモリーが数秒間20MB以上急増しました。', N'javaw', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R048', N'P053', N'0', N'1', N'ASP.NET 응용프로그램((#{p}개)의 처리 지연이 발생하고 있습니다. 추가 요청은 대기 상태가 됩니다.', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R048', N'P053', N'0', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be queued.', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R048', N'P053', N'0', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は待機状態となります。', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Web', N'R049', N'P054', N'0', N'1', N'ASP.NET 응용프로그램(#{p}개)의 처리 지연이 발생하고 있습니다. 추가 요청은 대기 상태가 됩니다.', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Web', N'R049', N'P054', N'0', N'1', N'ASP.NET Applications are being delayed. Incoming requests can be queued.', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Web', N'R049', N'P054', N'0', N'1', N'ASP.NETアプリケーションの処理混み合いが発生しています。追加要請は待機状態となります。', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R050', N'P055', N'0', N'1', N'BizTalk 메시지 처리가 지연되고 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R050', N'P055', N'0', N'1', N'BizTalk Message Processing is being queued.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R050', N'P055', N'0', N'1', N'BizTalkメッセージ処理が混み合っています。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R051', N'P056', N'0', N'1', N'BizTalk 호스트 대기열에 보류된(Suspended) 메시지들이 발견되었습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R051', N'P056', N'0', N'1', N'Suspended messages are found in BizTalk Host Queue.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R051', N'P056', N'0', N'1', N'BizTalkホスト待機列に保留された(Suspended)メッセージたちが発見されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R052', N'P057', N'0', N'1', N'BizTalk 오케스트레이션의 처리가 보류되고 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R052', N'P057', N'0', N'1', N'BizTalk Orchestrations are being suspended.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R052', N'P057', N'0', N'1', N'BizTalkオーケストレーションの処理が保留されています.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R053', N'P061', N'5000', N'1', N'BizTalk 메시지의 전달이 5초이상 지연되고 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R053', N'P061', N'5000', N'1', N'BizTalk Message Delivery is being delayed more than 5 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R053', N'P061', N'5000', N'1', N'BizTalkメッセージの伝達が5秒以上遅れています。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R054', N'P061', N'10000', N'1', N'BizTalk 메시지의 전달이 10초이상 지연되고 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R054', N'P061', N'10000', N'1', N'BizTalk Message Delivery is being delayed more than 10 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R054', N'P061', N'10000', N'1', N'BizTalkメッセージの伝達が10秒以上遅れています。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R055', N'P062', N'5000', N'1', N'BizTalk 메시지의 수신이 5초이상 지연되고 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R055', N'P062', N'5000', N'1', N'Publishing BizTalk Message is being delayed more than 5 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R055', N'P062', N'5000', N'1', N'BizTalkメッセージの受信が5秒以上遅れています。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R056', N'P062', N'10000', N'1', N'BizTalk 메시지의 수신이 10초이상 지연되고 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R056', N'P062', N'10000', N'1', N'Publishing BizTalk Message is being delayed more than 10 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R056', N'P062', N'10000', N'1', N'BizTalkメッセージの受信が10秒以上遅れています。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R057', N'P063', N'0', N'0', N'BizTalk 메시지의 전달이 처리량 조절 상태에 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R057', N'P063', N'0', N'0', N'BizTalk Host for delivering messages is under throttling state.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R057', N'P063', N'0', N'0', N'BizTalkメッセージの伝達が処理量調節状態にあります。', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'BizTalk', N'R058', N'P064', N'0', N'0', N'BizTalk 메시지의 수신이 처리량 조절 상태에 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R058', N'P064', N'0', N'0', N'BizTalk Host for publishing messages is under throttling state.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R058', N'P064', N'0', N'0', N'BizTalkメッセージの受信が処理量調節状態にあります。', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'BizTalk', N'R059', N'P065', N'0', N'0', N'BizTalk 호스트 - 서비스 프로세스가 중단되었습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R059', N'P065', N'0', N'0', N'A BisTalk Host Instance(Service Process) has been stopped, or shutdowned.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R059', N'P065', N'0', N'0', N'BizTalkホスト-サービスプロセスが中断されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'BizTalk', N'R060', N'P066', N'5000', N'1', N'BizTalk 메시지 수신 소요 시간이 5초 이상입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R060', N'P066', N'5000', N'1', N'BizTalk Message Inbound Latency is greater than 5 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R060', N'P066', N'5000', N'1', N'BizTalkメッセージ受信所要時間が5秒以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R061', N'P066', N'10000', N'1', N'BizTalk 메시지 수신 소요 시간이 10초 이상입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R061', N'P066', N'10000', N'1', N'BizTalk Message Inbound Latency is greater than 10 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R061', N'P066', N'10000', N'1', N'BizTalkメッセージ受信所要時間が10秒以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R062', N'P067', N'5000', N'1', N'BizTalk 메시지 Request-Response 소요 시간이 5초 이상입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R062', N'P067', N'5000', N'1', N'BizTalk Message Latency for Request-Response is greater than 5 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R062', N'P067', N'5000', N'1', N'BizTalkメッセージRequest-Response所要時間が5秒以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R063', N'P067', N'10000', N'1', N'BizTalk 메시지 Request-Response 소요 시간이 10초 이상입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R063', N'P067', N'10000', N'1', N'BizTalk Message Latency for Request-Response is greater than 10 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R063', N'P067', N'10000', N'1', N'BizTalkメッセージRequest-Response所要時間が10秒以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R064', N'P068', N'5000', N'1', N'BizTalk 메시지 전송 소요 시간이 5초 이상입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R064', N'P068', N'5000', N'1', N'BizTalk Message Outbound Latency is greater than 5 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R064', N'P068', N'5000', N'1', N'BizTalkメッセージ送信所要時間が5秒以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R065', N'P068', N'10000', N'1', N'BizTalk 메시지 전송 소요 시간이 10초 이상입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R065', N'P068', N'10000', N'1', N'BizTalk Message Outbound Latency is greater than 10 seconds', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R065', N'P068', N'10000', N'1', N'BizTalkメッセージ送信所要時間が10秒以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R066', N'P069', N'450', N'1', N'BizTalk 호스트 프로세스가 메모리 크기 조정 상태에 도달하고 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'BizTalk', N'R066', N'P069', N'450', N'1', N'BizTalk Host Process is approaching its memory throttling condition', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'BizTalk', N'R066', N'P069', N'450', N'1', N'BizTalkホストプロセスがメモリー大きさ調整状態に到逹しています。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'BizTalk', N'R067', N'P070', N'0', N'0', N'BizTalk 응용프로그램 또는 호스트가 비활성화 되었습니다. 수신 메시지를 손실할 수 있습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R067', N'P070', N'0', N'0', N'BizTalk server can lose incoming messages. A BizTalk Application, or Host has been disabled', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'BizTalk', N'R067', N'P070', N'0', N'0', N'BizTalkアプリケーションまたはホストが非活性化になりました。受信メッセージを損失することがあります。', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R068', N'P164', N'20', N'2', N'논리 디스크의 여유 공간이, 디스크 크기의 {t}% 이하입니다. ', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'Windows', N'R068', N'P164', N'20', N'2', N'Low free disk space in a logical drive (less than {t}%)', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'Windows', N'R068', N'P164', N'20', N'2', N'論理ディスクの空き空間が、ディスク大きさの{t}%以下です。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'Windows', N'R069', N'P164', N'10', N'2', N'논리 디스크의 여유 공간이, 디스크 크기의 {t}% 이하입니다. ', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R069', N'P164', N'10', N'2', N'Low free disk space in a logical drive (less than {t}%)', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R069', N'P164', N'10', N'2', N'論理ディスクの空き空間が、ディスク大きさの{t}%以下です。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R100', N'P071', N'10', N'1', N'[SQL] Forwarded Records 수치가 Batch Requests 대비 {t}% 이상 입니다. ', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R100', N'P071', N'10', N'1', N'High number of Fowarded Records/sec (more than {t}%)', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R100', N'P071', N'10', N'1', N'[SQL] Forwarded Records数値がBatch Requests備え{t}%以上です。', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R101', N'P073', N'1000', N'1', N'[SQL] 테이블 스캔 횟수가 인덱스 스캔 횟수 보다 많습니다.', N'', N'0', N'1', N'0', N'1', N'Information', N'Index Searches/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R101', N'P073', N'1000', N'1', N'[SQL] Excessive Full Scans/sec found', N'', N'0', N'1', N'0', N'1', N'Information', N'Index Searches/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R101', N'P073', N'1000', N'1', N'[SQL] テーブルスキャン回数がインデックススキャン回数より多いです。', N'', N'0', N'1', N'0', N'1', N'Information', N'Index Searches/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R102', N'P074', N'1000', N'2', N'[SQL] 인덱스 스캔 횟수가 테이블 스캔 횟수 보다 적습니다.', N'', N'0', N'1', N'0', N'1', N'Information', N'Full Scans/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R102', N'P074', N'1000', N'2', N'[SQL] Excessive Index Seraches/sec found', N'', N'0', N'1', N'0', N'1', N'Information', N'Full Scans/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R102', N'P074', N'1000', N'2', N'[SQL] インデックススキャン回数がテーブルスキャン回数より少ないです。', N'', N'0', N'1', N'0', N'1', N'Information', N'Full Scans/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R103', N'P075', N'20', N'1', N'[SQL] Batch Requests 대비 페이지 분할 비율이 {t}% 이상 입니다.', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R103', N'P075', N'20', N'1', N'[SQL] Excessive Page Splits/sec found (greater than {t})', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R103', N'P075', N'20', N'1', N'[SQL] Batch Requests 備えページ分割の割合が{t}%以上です。', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R104', N'P076', N'10', N'2', N'[SQL] 검색 지점이 검색을 계속하기 위해 유효성을 다시 검사해야 하는 횟수가 낮습니다.', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R104', N'P076', N'10', N'2', N'[SQL] Low number of Scan Point Revalidations/sec found', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R104', N'P076', N'10', N'2', N'[SQL] 検索ポイントが検索を続くために有效性をまた検査しなければならない回数が低いです。', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R105', N'P077', N'20', N'1', N'[SQL] 초당 생성된 임시 작업 파일 수가 {t} 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R105', N'P077', N'20', N'1', N'[SQL] Excessive Workfiles Created/sec found (greater than {t})', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R105', N'P077', N'20', N'1', N'[SQL] 秒当たり生成された一時作業ファイル数が{t}以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R106', N'P078', N'20', N'1', N'[SQL] 초당 생성된  임시 테이블 수가 {t} 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R106', N'P078', N'20', N'1', N'[SQL] Excessive Worktables Created/sec found (greater than {t})', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R106', N'P078', N'20', N'1', N'[SQL] 秒当たり生成された一時テーブル数が{t}以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R107', N'P081', N'50', N'2', N'[SQL] 버퍼 캐시 적중 비율이 {t}% 이하 입니다.', N'', N'0', N'0', N'1', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R107', N'P081', N'50', N'2', N'[SQL] Too low Buffer cache hit ratio (less than {t})', N'', N'0', N'0', N'1', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R107', N'P081', N'50', N'2', N'[SQL] バッファーキャッシュ的中の割合が{t}%以下です。', N'', N'0', N'0', N'1', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R108', N'P081', N'90', N'2', N'[SQL] 버퍼 캐시 적중 비율이 {t}% 이하 입니다.', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R108', N'P081', N'90', N'2', N'[SQL] Buffer cache hit ratio is low (less than {t})', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R108', N'P081', N'90', N'2', N'[SQL] バッファーキャッシュ的中の割合が{t}%以下です。', N'', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R109', N'P083', N'20', N'1', N'[SQL] 버퍼 관리자의 지연기록기 수치가 {t} 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R109', N'P083', N'20', N'1', N'[SQL] High number of Lazy writes/sec found (greater than {t})', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R109', N'P083', N'20', N'1', N'[SQL] バッファー管理者の遅れ記録数値が{t}以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R110', N'P084', N'300', N'2', N'[SQL] 버퍼 풀에 머무르는 대기 시간이 {t} 이하 입니다.', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R110', N'P084', N'300', N'2', N'[SQL] SQL Buffer Manager - Page life expectancy is too low (less than {t})', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R110', N'P084', N'300', N'2', N'[SQL] バッファープールにとどまる待機時間が{t}以下です。', N'', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R111', N'P085', N'100', N'2', N'[SQL] Batch Requests 대비 버퍼 풀에서 페이지 찾는 수가 낮습니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R111', N'P085', N'100', N'2', N'[SQL] Low number of Page lookups/sec found', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R111', N'P085', N'100', N'2', N'[SQL] Batch Requests 備えバッファープールでページを呼出数が低いです。', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R112', N'P086', N'90', N'1', N'[SQL] 물리적인 페이지 읽기수가 {t} 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R112', N'P086', N'90', N'1', N'[SQL] Excessive Page reads/sec found (greater than {t})', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R112', N'P086', N'90', N'1', N'[SQL] 物理的なページ読み取り数が{t}以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R113', N'P087', N'90', N'1', N'[SQL] 물리적인 페이지 쓰기 수가 {t} 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R113', N'P087', N'90', N'1', N'[SQL] Excessive Page writes/sec found (greater than {t})', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R113', N'P087', N'90', N'1', N'[SQL] 物理的なページ書き込み数が{t}以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R114', N'P088', N'20', N'1', N'[SQL] 페이지 읽기 대비 예측하여 읽은 페이지 수가 20% 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R114', N'P088', N'20', N'1', N'[SQL] High number of Page reads per Readahead pages/sec', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R114', N'P088', N'20', N'1', N'[SQL] ページ読み取り備え予測して読んだページ数が20%以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R116', N'P096', N'2', N'1', N'[SQL] 초당 로그인 수가 {t} 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R116', N'P096', N'2', N'1', N'[SQL] Too frequent Logins/sec, more than {t} logins/sec', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R116', N'P096', N'2', N'1', N'[SQL] 秒当たりログイン数が{t}以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R117', N'P097', N'2', N'1', N'[SQL] 초당 로그아웃 수가 {t} 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R117', N'P097', N'2', N'1', N'[SQL] Too frequent Logouts/sec, more than {t} logouts/sec', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R117', N'P097', N'2', N'1', N'[SQL] 秒当たりログアウト数が{t}以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R119', N'P107', N'10', N'1', N'[SQL] Batch Requests 대비 컴파일 발생 빈도가 {t}% 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R119', N'P107', N'10', N'1', N'[SQL] High number of SQL Compilations/sec found (greater than {t}%)', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R119', N'P107', N'10', N'1', N'[SQL] Batch Requests 備えコンパイル発生頻度が{t}%以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R120', N'P108', N'10', N'1', N'[SQL] Batch Requests 대비 재컴파일 발생 빈도가 {t}% 이상 입니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R120', N'P108', N'10', N'1', N'[SQL] High number of SQL Re-Compilations/sec found (greater than {t}%)', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R120', N'P108', N'10', N'1', N'[SQL] Batch Requests 備え再コンパイル発生頻度が{t}%以上です。', N'', N'0', N'0', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R121', N'P109', N'1', N'1', N'[SQL] 자동 매개화 변수가 발견되었습니다.', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R121', N'P109', N'1', N'1', N'[SQL] Auto-Param Attempts/sec has been found ', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R121', N'P109', N'1', N'1', N'[SQL] 自動媒介化変数が発見されました。', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R122', N'P110', N'1', N'1', N'[SQL] 실패한 자동 매개화 변수가 발견되었습니다.', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R122', N'P110', N'1', N'1', N'[SQL] Failed Auto-Params/sec has been found', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R122', N'P110', N'1', N'1', N'[SQL] 失敗した自動媒介化変数が発見されました。', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R123', N'P111', N'0', N'1', N'[SQL] 안전하지 않은 자동 매개화 변수가 발견되었습니다.', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R123', N'P111', N'0', N'1', N'[SQL] Unsafe Auto-Params/sec has been found', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R123', N'P111', N'0', N'1', N'[SQL] 安全ではない自動媒介化変数が発見されました。', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R124', N'P117', N'80', N'1', N'[SQL] 디스크 크기에 비해 로그파일 사용 비율이 높습니다.', N'All Instances', N'0', N'1', N'1', N'1', N'Information', N'Log File(s) Size (KB)', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R124', N'P117', N'80', N'1', N'[SQL] Log File(s) Used Size (KB) is high, considering disk space', N'All Instances', N'0', N'1', N'1', N'1', N'Information', N'Log File(s) Size (KB)', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R124', N'P117', N'80', N'1', N'[SQL] ディスク大きさに比べてログファイル使用の割合が高いです。', N'All Instances', N'0', N'1', N'1', N'1', N'Information', N'Log File(s) Size (KB)', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R125', N'P118', N'1', N'1', N'[SQL] 초당 로그 기록을 기다리는 커밋 수가 높습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R125', N'P118', N'1', N'1', N'[SQL] High number of Log Flush Waits/sec found', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R125', N'P118', N'1', N'1', N'[SQL] 秒当たりログ記録を待つコミット数が高いです。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R126', N'P119', N'1', N'1', N'[SQL] 초당 로그 플러시 수가 높습니다.', N'All Instances', N'0', N'0', N'1', N'0', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R126', N'P119', N'1', N'1', N'[SQL] High number of Log Flushes/sec found', N'All Instances', N'0', N'0', N'1', N'0', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R126', N'P119', N'1', N'1', N'[SQL] 秒当たりログフラッシュ数が高いです。', N'All Instances', N'0', N'0', N'1', N'0', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R127', N'P128', N'10', N'1', N'[SQL] 래치 요청에 대한 총 래치 대기 시간이 높습니다.', N'', N'0', N'1', N'1', N'1', N'Information', N'Total Latch Wait Time (ms)', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R127', N'P128', N'10', N'1', N'[SQL] Total Latch Wait Time (ms) per Latches Wait/sec is long', N'', N'0', N'1', N'1', N'1', N'Information', N'Total Latch Wait Time (ms)', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R127', N'P128', N'10', N'1', N'[SQL] ラーチ要請に対する総ラーチ待機時間が高いです。', N'', N'0', N'1', N'1', N'1', N'Information', N'Total Latch Wait Time (ms)', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R128', N'P127', N'0', N'1', N'[SQL] 수퍼 래치가 발견되었습니다.', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R128', N'P127', N'0', N'1', N'[SQL] High Number of SuperLatches found', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R128', N'P127', N'0', N'1', N'[SQL] スーパーラーチが発見されました。', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R129', N'P129', N'500', N'1', N'[SQL] 잠금 요청에 대한 평균 대기 시간이 {t}ms 이상 입니다.', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R129', N'P129', N'500', N'1', N'SQL : Locks - Average Wait Time (ms) is long (greater than {t}ms)', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R129', N'P129', N'500', N'1', N'[SQL] 閉ざし要請に対する平均待機時間が{t}ms以上です。', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R130', N'P130', N'1000', N'1', N'[SQL] 잠금 관리자에서 요청한 잠금 수가 {t} 이상 입니다.', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R130', N'P130', N'1000', N'1', N'High number of SQL Lock Requests/sec found (greater than {t})', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R130', N'P130', N'1000', N'1', N'[SQL] 閉ざし管理者で要請した閉ざし数が{t}以上です。', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R131', N'P131', N'1', N'1', N'[SQL] 초당 발견되는 Lock Time Out 수치가 높습니다.', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R131', N'P131', N'1', N'1', N'High number of SQL Lock Timeouts/sec found', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R131', N'P131', N'1', N'1', N'[SQL] 秒当たり発見されるLock Time Out数値が高いです。', N'_Total', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R132', N'P133', N'0', N'0', N'[SQL] 블럭킹이 발견 되었습니다.', N'_Total', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R132', N'P133', N'0', N'0', N'High number of SQL Lock Waits/sec found', N'_Total', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R132', N'P133', N'0', N'0', N'[SQL] ブルロックキングが発見されました。', N'_Total', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R133', N'P134', N'0', N'1', N'[SQL] 데드락이 발견되었습니다.', N'_Total', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R133', N'P134', N'0', N'1', N'SQL : Locks - Deadlocks/sec is greater than zero', N'_Total', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R133', N'P134', N'0', N'1', N'[SQL] デドラックが発見されました。', N'_Total', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R135', N'P138', N'80', N'2', N'[SQL] 플랜 캐시 적중 비율이 {t}% 이하 입니다.', N'_Total', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R135', N'P138', N'80', N'2', N'SQL - Plan Cache Hit Ratio is too low (less than {t}%)', N'_Total', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R135', N'P138', N'80', N'2', N'[SQL] プランキャッシュ的中の割合が{t}%以下です。', N'_Total', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R136', N'P143', N'0', N'1', N'[SQL] DB Offline Errors 오류가 발견되었습니다.', N'DB Offline Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R136', N'P143', N'0', N'1', N'SQL - Errors/sec has been found', N'DB Offline Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R136', N'P143', N'0', N'1', N'[SQL] DB Offline Errorsエラーが発見されました。', N'DB Offline Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R137', N'P145', N'60', N'1', N'[SQL] 오랜 시간의 트랜잭션이 발견되었습니다.', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R137', N'P145', N'60', N'1', N'SQL - Longest Transation Running Time is greater than 60 seconds', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R137', N'P145', N'60', N'1', N'[SQL] 長時間のトランザクションが発見されました。', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R138', N'P146', N'0', N'1', N'[SQL] 잠금을 기다리는 프로세스가 발견되었습니다.', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R138', N'P146', N'0', N'1', N'SQL - Lock Waits have been found', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R138', N'P146', N'0', N'1', N'[SQL] 閉ざすことを待つプロセスが発見されました。', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R139', N'P147', N'0', N'1', N'[SQL] 로그 버퍼 사용을 기다리는 프로세스가 발견되었습니다.', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R139', N'P147', N'0', N'1', N'SQL - Log buffer waits have been found', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R139', N'P147', N'0', N'1', N'[SQL] ログバッファー使用を待つプロセスが発見されました。', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R140', N'P148', N'0', N'1', N'[SQL] 로그 버퍼 작성을 기다리는 프로세스가 발견되었습니다.', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R140', N'P148', N'0', N'1', N'SQL - Log write waits have been found', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R140', N'P148', N'0', N'1', N'[SQL] ログバッファー作成を待つプロセスが発見されました。', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R141', N'P149', N'0', N'1', N'[SQL] 메모리 부여를 기다리는 프로세스가 발견되었습니다.', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R141', N'P149', N'0', N'1', N'SQL - Memory grant queue waits have been found', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R141', N'P149', N'0', N'1', N'[SQL] メモリー付与を待つプロセスが発見されました。', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R142', N'P150', N'0', N'1', N'[SQL] 네트워크 IO 대기가 발견되었습니다.', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R142', N'P150', N'0', N'1', N'SQL - Network IO waits have been found', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R142', N'P150', N'0', N'1', N'[SQL] ネットワークIO待機が発見されました。', N'All Instances', N'0', N'0', N'1', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R143', N'P151', N'0', N'1', N'[SQL] 페이지 IO 래치가 발견되었습니다.', N'All Instances', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R143', N'P151', N'0', N'1', N'SQL - Page IO Latch waits have been found', N'All Instances', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R143', N'P151', N'0', N'1', N'[SQL] ページIOラーチが発見されました。', N'All Instances', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R144', N'P122', N'0', N'0', N'[SQL] 로그파일이 증가 하였습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R144', N'P122', N'0', N'0', N'SQL - Log Growth has been found', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R144', N'P122', N'0', N'0', N'[SQL] ログファイルが増加しました。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R145', N'P125', N'90', N'1', N'[SQL] 사용중인 로그 공간 비율이 {t}% 이상 입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R145', N'P125', N'90', N'1', N'SQL - High Percent Log Used (greater than {t}%)', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R145', N'P125', N'90', N'1', N'[SQL] 使用中のログ空間の割合が{t}%以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R146', N'P089', N'2', N'1', N'[SQL] 초당 사용가능한 페이지를 기다리는 수가 높습니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R146', N'P089', N'2', N'1', N'SQL - High number of Free list stalls/sec found', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R146', N'P089', N'2', N'1', N'[SQL] 秒当たり使用可能なページを待ち数が多いです。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R148', N'P105', N'0', N'1', N'[SQL] 메모리 그랜트가 발견되었습니다.', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R148', N'P105', N'0', N'1', N'SQL - High number of Memory Grants Pending ', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R148', N'P105', N'0', N'1', N'[SQL] メモリーグラントが発見されました。', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R149', N'P112', N'0', N'1', N'[SQL] 클라이언트의 데이터베이스에 대한 초당 실행 종료 요청 수가 높습니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R149', N'P112', N'0', N'1', N'High number of SQL Attention Rate', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R149', N'P112', N'0', N'1', N'[SQL] クライアントのデータベースに対する秒当たり実行終了要請数が多いです。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R150', N'P080', N'80', N'2', N'[SQL] 작업 테이블의 캐시 적중 비율이 {t} 이하 입니다.', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R150', N'P080', N'80', N'2', N'[SQL] Worktables From Cache Ratio (less than {t})', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R150', N'P080', N'80', N'2', N'[SQL] 作業テーブルのキャッシュ的中の割合が{t}以下です。', N'', N'0', N'0', N'1', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R151', N'', N'0', N'0', N'[SQL] SQL Server 응답이 지연되거나 무응답 상태 입니다.', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R151', N'', N'0', N'0', N'SQL - Heartbeat monitoring query does not response', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R151', N'', N'0', N'0', N'[SQL] SQL Server応答が遅れたか応答なしの状態です。', N'', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R152', N'P164', N'1', N'2', N'논리 디스크의 여유 공간이, 디스크 크기의 {t}% 이하입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R152', N'P164', N'1', N'2', N'Low free disk space in a logical drive (less than {t}%)', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R152', N'P164', N'1', N'2', N'論理ディスクの空き空間が、ディスク大きさの{t}%以下です。', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R153', N'P139', N'75', N'1', N'SQL CPU 사용률 {t}% 이상이 1분 이상 지속되었습니다.', N'sqlservr', N'60', N'0', N'1', N'0', N'Warning', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R153', N'P139', N'75', N'1', N'[SQL] High CPU %Utilization({t}%) of SQL Service for more than 1 minute.', N'sqlservr', N'60', N'0', N'1', N'0', N'Warning', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R153', N'P139', N'75', N'1', N'SQL CPU使用率{t}%以上が1分以上持続しました。', N'sqlservr', N'60', N'0', N'1', N'0', N'Warning', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R155', N'P139', N'95', N'1', N'SQL CPU 사용률 {t}% 이상이 1분 이상 지속되었습니다.', N'sqlservr', N'60', N'0', N'1', N'0', N'Critical', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R155', N'P139', N'95', N'1', N'[SQL] High CPU %Utilization({t}%) of SQL Service for more than 1 minute.', N'sqlservr', N'60', N'0', N'1', N'0', N'Critical', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R155', N'P139', N'95', N'1', N'SQL CPU使用率{t}%以上が1分以上持続しました。', N'sqlservr', N'60', N'0', N'1', N'0', N'Critical', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R156', N'P071', N'20', N'1', N'[SQL] Forwarded Records 수치가 Batch Requests 대비 {t}% 이상 입니다. ', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R156', N'P071', N'20', N'1', N'High number of Fowarded Records/sec (more than {t}%)', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R156', N'P071', N'20', N'1', N'[SQL] Forwarded Records数値がBatch Requests備え{t}%以上です。', N'', N'0', N'1', N'0', N'1', N'Information', N'Batch Requests/sec', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R157', N'P121', N'0', N'1', N'[SQL] Log Flush Wait Time이 0 이상이 입니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R157', N'P121', N'0', N'1', N'[SQL] Log Flush Wait Time is greater than 0', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R157', N'P121', N'0', N'1', N'[SQL] Log Flush Wait Timeが0以上です。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R158', N'P123', N'0', N'0', N'[SQL] 데이터베이스 로그가 축소 되었습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R158', N'P123', N'0', N'0', N'[SQL] Log Shrinks found', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R158', N'P123', N'0', N'0', N'[SQL] データベースログが縮小されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R159', N'P143', N'0', N'1', N'[SQL] Info Errors오류가 발견되었습니다.', N'Info Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R159', N'P143', N'0', N'1', N'[SQL] Info Errors have been found', N'Info Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R159', N'P143', N'0', N'1', N'[SQL] Info Errorsエラーが発見されました。', N'Info Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R160', N'P143', N'0', N'1', N'[SQL] Kill Connection Errors 오류가 발견되었습니다.', N'Kill Connection Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R160', N'P143', N'0', N'1', N'[SQL] Kill Connection Errors found', N'Kill Connection Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R160', N'P143', N'0', N'1', N'[SQL] Kill Connection Errors エラーが発見されました。', N'Kill Connection Errors', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R161', N'P143', N'0', N'1', N'[SQL] User Erros오류가 발견되었습니다.', N'User Erros', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R161', N'P143', N'0', N'1', N'[SQL] User Errors found', N'User Erros', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R161', N'P143', N'0', N'1', N'[SQL] User Errosエラーが発見されました。', N'User Erros', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R162', N'P079', N'0', N'1', N'[SQL] 락 에스컬레이션이 발견 되었습니다.', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R162', N'P079', N'0', N'1', N'[SQL] Table Lock Escalations/sec is greater than 0', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R162', N'P079', N'0', N'1', N'[SQL] ロックエスカレーションが発見されました。', N'', N'0', N'0', N'0', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R163', N'', N'0', N'0', N'[SQL] SQL Agent Job 실패가 발견 되었습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R163', N'', N'0', N'0', N'SQL Agent Job Failure has been detected', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R163', N'', N'0', N'0', N'[SQL] SQL Agent Job 失敗が発見されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R164', N'', N'0', N'0', N'[SQL] SQL Agent Job 이 활성화 되었습니다. ', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R164', N'', N'0', N'0', N'SQL Job Status has been changed - SQL Agent Job has been enabled', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R164', N'', N'0', N'0', N'[SQL] SQL Agent Job が活性化されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R165', N'', N'0', N'0', N'[SQL] SQL Agent Job 이 비활성화 되었습니다. ', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R165', N'', N'0', N'0', N'SQL Job Status has been changed - SQL Agent Job has been disabled', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R165', N'', N'0', N'0', N'[SQL] SQL Agent Job が非活性化されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R166', N'', N'0', N'0', N'[SQL] SQL Agent Job 이 추가 되었습니다. ', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R166', N'', N'0', N'0', N'SQL Agent Job has been added', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R166', N'', N'0', N'0', N'[SQL] SQL Agent Job が追加されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R167', N'', N'0', N'0', N'[SQL] SQL Agent Job 이 삭제 되었습니다. ', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R167', N'', N'0', N'0', N'SQL Agent Job has been deleted', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R167', N'', N'0', N'0', N'[SQL] SQL Agent Job が削除されました。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R168', N'', N'0', N'0', N'[SQL] 링크드 서버 응답이 없습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'SQL', N'R168', N'', N'0', N'0', N'SQL - No response from a linked server', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'SQL', N'R168', N'', N'0', N'0', N'[SQL] 結ばれたサーバーからの応答がありません。', N'All Instances', N'0', N'0', N'0', N'1', N'Warning', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'Windows', N'R169', N'', N'0', N'0', N'Service Point Agent가 응답이 없습니다.', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'KR', N'Y')	insert into tbAlertRules values (N'Windows', N'R169', N'', N'0', N'0', N'Service Point Agent is not responding. Services can not be monitored', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'EN', N'Y')	insert into tbAlertRules values (N'Windows', N'R169', N'', N'0', N'0', N'Service Point Agentが応答がないです。', N'All Instances', N'0', N'0', N'0', N'1', N'Critical', N'', N'', N'JP', N'Y')
insert into tbAlertRules values (N'SQL', N'R170', N'', N'0', N'0', N'[SQL] Service 응답이 없습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R170', N'', N'0', N'0', N'[SQL] Service 응답이 없습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R170', N'', N'0', N'0', N'[SQL] Service 응답이 없습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R171', N'', N'0', N'0', N'[SQL] SQL 정보가 변경되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R171', N'', N'0', N'0', N'[SQL] SQL 정보가 변경되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R171', N'', N'0', N'0', N'[SQL] SQL 정보가 변경되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R172', N'', N'0', N'0', N'[SQL] 환경설정 정보가 변경되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R172', N'', N'0', N'0', N'[SQL] 환경설정 정보가 변경되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R172', N'', N'0', N'0', N'[SQL] 환경설정 정보가 변경되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbAlertRules values (N'SQL', N'R173', N'', N'1', N'0', N'[SQL] {p}분 이상 실행중인 쿼리가 발견되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'KR', N'N')	insert into tbAlertRules values (N'SQL', N'R173', N'', N'1', N'0', N'[SQL] {p}분 이상 실행중인 쿼리가 발견되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'EN', N'N')	insert into tbAlertRules values (N'SQL', N'R173', N'', N'1', N'0', N'[SQL] {p}분 이상 실행중인 쿼리가 발견되었습니다.', N'All Instances', N'', N'', N'', N'1', N'Information', N'', N'', N'JP', N'N')
insert into tbSQLConfiguration values ('access check cache bucket count', 0, 0, 65536, 0, 'Default hash bucket count for the access check result security cache', 1, 1)
insert into tbSQLConfiguration values ('access check cache quota', 0, 0, 2147483647, 0, 'Default quota for the access check result security cache', 1, 1)
insert into tbSQLConfiguration values ('Ad Hoc Distributed Queries', 0, 0, 1, 0, 'Enable or disable Ad Hoc Distributed Queries', 1, 1)
insert into tbSQLConfiguration values ('affinity I/O mask', 0, -2147483648, 2147483647, 0, 'affinity I/O mask', 0, 1)
insert into tbSQLConfiguration values ('affinity mask', 0, -2147483648, 2147483647, 0, 'affinity mask', 1, 1)
insert into tbSQLConfiguration values ('affinity64 I/O mask', 0, -2147483648, 2147483647, 0, 'affinity64 I/O mask', 0, 1)
insert into tbSQLConfiguration values ('affinity64 mask', 0, -2147483648, 2147483647, 0, 'affinity64 mask', 1, 1)
insert into tbSQLConfiguration values ('Agent XPs', 1, 0, 1, 1, 'Enable or disable Agent XPs', 1, 1)
insert into tbSQLConfiguration values ('allow updates', 0, 0, 1, 0, 'Allow updates to system tables', 1, 0)
insert into tbSQLConfiguration values ('awe enabled', 0, 0, 1, 0, 'AWE enabled in the server', 0, 1)
insert into tbSQLConfiguration values ('backup checksum default', 0, 0, 1, 0, 'Enable checksum of backups by default', 1, 0)
insert into tbSQLConfiguration values ('backup compression default', 0, 0, 1, 0, 'Enable compression of backups by default', 1, 0)
insert into tbSQLConfiguration values ('blocked process threshold', 0, 0, 86400, 0, 'Blocked process reporting threshold', 1, 1)
insert into tbSQLConfiguration values ('blocked process threshold (s)', 0, 0, 86400, 0, 'Blocked process reporting threshold', 1, 1)
insert into tbSQLConfiguration values ('c2 audit mode', 0, 0, 1, 0, 'c2 audit mode', 0, 1)
insert into tbSQLConfiguration values ('clr enabled', 1, 0, 1, 1, 'CLR user code execution enabled in the server', 1, 0)
insert into tbSQLConfiguration values ('common criteria compliance enabled', 0, 0, 1, 0, 'Common Criteria compliance mode enabled', 0, 1)
insert into tbSQLConfiguration values ('contained database authentication', 0, 0, 1, 0, 'Enables contained databases and contained authentication', 1, 0)
insert into tbSQLConfiguration values ('cost threshold for parallelism', 5, 0, 32767, 5, 'cost threshold for parallelism', 1, 1)
insert into tbSQLConfiguration values ('cross db ownership chaining', 0, 0, 1, 0, 'Allow cross db ownership chaining', 1, 0)
insert into tbSQLConfiguration values ('cursor threshold', -1, -1, 2147483647, -1, 'cursor threshold', 1, 1)
insert into tbSQLConfiguration values ('Database Mail XPs', 0, 0, 1, 0, 'Enable or disable Database Mail XPs', 1, 1)
insert into tbSQLConfiguration values ('default full-text language', 1042, 0, 2147483647, 1042, 'default full-text language', 1, 1)
insert into tbSQLConfiguration values ('default language', 29, 0, 9999, 29, 'default language', 1, 0)
insert into tbSQLConfiguration values ('default trace enabled', 1, 0, 1, 1, 'Enable or disable the default trace', 1, 1)
insert into tbSQLConfiguration values ('disallow results from triggers', 0, 0, 1, 0, 'Disallow returning results from triggers', 1, 1)
insert into tbSQLConfiguration values ('EKM provider enabled', 0, 0, 1, 0, 'Enable or disable EKM provider', 1, 1)
insert into tbSQLConfiguration values ('filestream access level', 0, 0, 2, 0, 'Sets the FILESTREAM access level', 1, 0)
insert into tbSQLConfiguration values ('fill factor (%)', 0, 0, 100, 0, 'Default fill factor percentage', 0, 1)
insert into tbSQLConfiguration values ('ft crawl bandwidth (max)', 100, 0, 32767, 100, 'Max number of full-text crawl buffers', 1, 1)
insert into tbSQLConfiguration values ('ft crawl bandwidth (min)', 0, 0, 32767, 0, 'Number of reserved full-text crawl buffers', 1, 1)
insert into tbSQLConfiguration values ('ft notify bandwidth (max)', 100, 0, 32767, 100, 'Max number of full-text notifications buffers', 1, 1)
insert into tbSQLConfiguration values ('ft notify bandwidth (min)', 0, 0, 32767, 0, 'Number of reserved full-text notifications buffers', 1, 1)
insert into tbSQLConfiguration values ('index create memory (KB)', 0, 704, 2147483647, 0, 'Memory for index create sorts (kBytes)', 1, 1)
insert into tbSQLConfiguration values ('in-doubt xact resolution', 0, 0, 2, 0, 'Recovery policy for DTC transactions with unknown outcome', 1, 1)
insert into tbSQLConfiguration values ('lightweight pooling', 0, 0, 1, 0, 'User mode scheduler uses lightweight pooling', 0, 1)
insert into tbSQLConfiguration values ('locks', 0, 5000, 2147483647, 0, 'Number of locks for all users', 0, 1)
insert into tbSQLConfiguration values ('max degree of parallelism', 0, 0, 32767, 0, 'maximum degree of parallelism', 1, 1)
insert into tbSQLConfiguration values ('max full-text crawl range', 4, 0, 256, 4, 'Maximum  crawl ranges allowed in full-text indexing', 1, 1)
insert into tbSQLConfiguration values ('max server memory (MB)', 2147483647, 128, 2147483647, 2147483647, 'Maximum size of server memory (MB)', 1, 1)
insert into tbSQLConfiguration values ('max text repl size (B)', 65536, -1, 2147483647, 65536, 'Maximum size of a text field in replication.', 1, 0)
insert into tbSQLConfiguration values ('max worker threads', 0, 128, 65535, 0, 'Maximum worker threads', 1, 1)
insert into tbSQLConfiguration values ('media retention', 0, 0, 365, 0, 'Tape retention period in days', 1, 1)
insert into tbSQLConfiguration values ('min memory per query (KB)', 1024, 512, 2147483647, 1024, 'minimum memory per query (kBytes)', 1, 1)
insert into tbSQLConfiguration values ('min server memory (MB)', 0, 0, 2147483647, 16, 'Minimum size of server memory (MB)', 1, 1)
insert into tbSQLConfiguration values ('nested triggers', 1, 0, 1, 1, 'Allow triggers to be invoked within triggers', 1, 0)
insert into tbSQLConfiguration values ('network packet size (B)', 4096, 512, 32767, 4096, 'Network packet size', 1, 1)
insert into tbSQLConfiguration values ('Ole Automation Procedures', 0, 0, 1, 0, 'Enable or disable Ole Automation Procedures', 1, 1)
insert into tbSQLConfiguration values ('open objects', 0, 0, 2147483647, 0, 'Number of open database objects', 0, 1)
insert into tbSQLConfiguration values ('optimize for ad hoc workloads', 0, 0, 1, 0, 'When this option is set, plan cache size is further reduced for single-use adhoc OLTP workload.', 1, 1)
insert into tbSQLConfiguration values ('PH timeout (s)', 60, 1, 3600, 60, 'DB connection timeout for full-text protocol handler (s)', 1, 1)
insert into tbSQLConfiguration values ('precompute rank', 0, 0, 1, 0, 'Use precomputed rank for full-text query', 1, 1)
insert into tbSQLConfiguration values ('priority boost', 0, 0, 1, 0, 'Priority boost', 0, 1)
insert into tbSQLConfiguration values ('query governor cost limit', 0, 0, 2147483647, 0, 'Maximum estimated cost allowed by query governor', 1, 1)
insert into tbSQLConfiguration values ('query wait (s)', -1, -1, 2147483647, -1, 'maximum time to wait for query memory (s)', 1, 1)
insert into tbSQLConfiguration values ('recovery interval (min)', 0, 0, 32767, 0, 'Maximum recovery interval in minutes', 1, 1)
insert into tbSQLConfiguration values ('remote access', 1, 0, 1, 1, 'Allow remote access', 0, 0)
insert into tbSQLConfiguration values ('remote admin connections', 0, 0, 1, 0, 'Dedicated Admin Connections are allowed from remote clients', 1, 0)
insert into tbSQLConfiguration values ('remote login timeout (s)', 10, 0, 2147483647, 10, 'remote login timeout', 1, 0)
insert into tbSQLConfiguration values ('remote proc trans', 0, 0, 1, 0, 'Create DTC transaction for remote procedures', 1, 0)
insert into tbSQLConfiguration values ('remote query timeout (s)', 600, 0, 2147483647, 600, 'remote query timeout', 1, 0)
insert into tbSQLConfiguration values ('Replication XPs', 0, 0, 1, 0, 'Enable or disable Replication XPs', 1, 1)
insert into tbSQLConfiguration values ('scan for startup procs', 1, 0, 1, 1, 'scan for startup stored procedures', 0, 1)
insert into tbSQLConfiguration values ('server trigger recursion', 1, 0, 1, 1, 'Allow recursion for server level triggers', 1, 0)
insert into tbSQLConfiguration values ('set working set size', 0, 0, 1, 0, 'set working set size', 0, 1)
insert into tbSQLConfiguration values ('show advanced options', 0, 0, 1, 0, 'show advanced options', 1, 0)
insert into tbSQLConfiguration values ('SMO and DMO XPs', 1, 0, 1, 1, 'Enable or disable SMO and DMO XPs', 1, 1)
insert into tbSQLConfiguration values ('SQL Mail XPs', 0, 0, 1, 0, 'Enable or disable SQL Mail XPs', 1, 1)
insert into tbSQLConfiguration values ('transform noise words', 0, 0, 1, 0, 'Transform noise words for full-text query', 1, 1)
insert into tbSQLConfiguration values ('two digit year cutoff', 2049, 1753, 9999, 2049, 'two digit year cutoff', 1, 1)
insert into tbSQLConfiguration values ('user connections', 0, 0, 32767, 0, 'Number of user connections allowed', 0, 1)
insert into tbSQLConfiguration values ('user options', 0, 0, 32767, 0, 'user options', 1, 0)
insert into tbSQLConfiguration values ('Web Assistant Procedures', 0, 0, 1, 0, 'Enable or disable Web Assistant Procedures', 1, 1)
insert into tbSQLConfiguration values ('xp_cmdshell', 0, 0, 1, 0, 'Enable or disable command shell', 1, 1)
go

INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (1, 3, N'CurrentExecution', N'set nocount on
set transaction isolation level read uncommitted

select
r.session_id, 
r.status,
db_name(r.database_id) as db_name,
object_name(qt.objectid) as object_name,
r.command,
r.cpu_time,
r.total_elapsed_time,
r.logical_reads,
r.reads,
r.writes,
r.blocking_session_id,
r.wait_type,
r.wait_time,
r.wait_resource,
r.transaction_isolation_level as t_i_level,
r.row_count,
r.percent_complete,
SUBSTRING(qt.text,(r.statement_start_offset / 2) + 1, ((case when r.statement_end_offset = -1 then datalength(qt.text)  else r.statement_end_offset end - r.statement_start_offset) / 2) + 1) as query_text,
qt.text as full_query_text,
u.user_objects_alloc_page_count,
u.user_objects_dealloc_page_count,
s.login_name,
s.original_login_name,
convert(nvarchar(23), s.login_time, 121) as login_time,
s.host_name,
s.program_name,
s.client_interface_name,
s.nt_domain,
s.nt_user_name,
s.cpu_time as session_cpu_time,
s.memory_usage as session_memory_usage,
s.logical_reads as session_logical_reads,
s.reads as session_physical_reads,
s.writes as session_writes,
s.lock_timeout  
from sys.dm_exec_requests as r with(nolock) 
	cross apply sys.dm_exec_sql_text(sql_handle) as qt   
	inner join sys.dm_db_session_space_usage as u with(nolock)   
		on r.session_id = u.session_id  
	left join sys.dm_exec_sessions as s with(nolock)   
		on r.session_id = s.session_id  
where r.session_id > 50  and r.session_id <> @@SPID
order by r.session_id asc', 1, N'exec Query Collect', N'RegDate,TimeIn,ServerNum,GUID,session_id,status,db_name,object_name,command,cpu_time,total_elapsed_time,logical_reads,reads,writes,blocking_session_id,wait_type,wait_time,wait_resource,t_i_level,row_count,percent_complete,query_text,full_query_text,user_objects_alloc_page_count,user_objects_dealloc_page_count,login_name,original_login_name,login_time,host_name,program_name,client_interface_name,nt_domain,nt_user_name,session_cpu_time,session_memory_usage,session_logical_reads,session_physical_reads,session_writes,lock_timeout', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (3, 30, N'tbSQLAgentStatus', N'select NAME AS JOB_NAME, [enabled] FROM MSDB.DBO.SYSJOBS', 1, N'SQL Job Agent Status', N'RegDate,TimeIn,ServerNum,JOB_NAME,enabled', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (5, 60, N'tbSQLErrorlog', N'set nocount on
set transaction isolation level read uncommitted

declare @errorlog table (
LogDate datetime, 
ProcessInfo varchar(100), 
ErrorText varchar(4000)
)
declare @check_date datetime
declare @start_date datetime

set @check_date = GETDATE()
set @start_date = dateadd(minute, -10,  GETDATE())

insert into @errorlog (LogDate, ProcessInfo, ErrorText)
exec xp_readerrorlog 0, 1, NULL, NULL, @start_date, @check_date

select convert(nvarchar(23), LogDate, 121) as LogDate, ProcessInfo, ErrorText from @errorlog ', 1, N'SQLErrorlog', N'RegDate,TimeIn,ServerNum,LogDate,ProcessInfo,ErrorText', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (14, 60, NULL, N'select name, value, minimum, maximum, value_in_use, is_dynamic, is_advanced from sys.configurations with (nolock)', 1, N'SQLConfiguration', N'p_tbSQLConfiguration_Add', NULL, N'Y')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (15, 300, N'tbDataBaseFileSize', N'begin try
	drop table #DBFile
end try begin catch end catch

begin try
	drop table #dbid
end try begin catch end catch

declare @QueryString nvarchar(max)
declare @QueryString2 nvarchar(max)
declare @Min_dbid int
declare @Max_dbid int
declare @name nvarchar(128)
select dbid, name into #dbid from sys.sysdatabases with (nolock) where databasepropertyex (name, ''Status'') <> ''OFFLINE''
select @Min_dbid = min(dbid), @Max_dbid = max(dbid) from #dbid


create table #DBFile (
DatabaseName nvarchar(128),
Total_Databases_Size_MB float,
Datafile_Size_MB float,
Reserved_MB float,
Reserved_Percent float,
Unallocated_Space_MB float,
Unallocated_Percent float,
Data_MB float,
Data_Percent float,
Index_MB float,
Index_Percent float,
Unused_MB float,
Unused_Percent float,
Transaction_Log_Size float,
Log_Size_MB float,
Log_Used_Size_MB float,
Log_Used_Size_Percent float,
Log_Unused_Size_MB float,
Log_UnUsed_Size_Percent float,
Avg_vlf_Size float,
Total_vlf_cnt int,
Active_vlf_cnt int
)	

while @Min_dbid <= @Max_dbid
begin

	select @name = name from #dbid where dbid = @Min_dbid

	set @QueryString = 
	''use '' + @name + ''
	
	declare @dbsize bigint
	declare @database_size_mb float
	declare @unallocated_space_mb float
	declare @reserved_mb float
	declare @data_mb float
	declare @index_mb float
	declare @unused_mb float
	declare @reservedpages bigint
	declare @pages bigint
	declare @usedpages bigint
	declare @logsize bigint
	declare @log_size_mb float

	select
		@dbsize = sum(convert(bigint,case when status & 64 = 0 then size else 0 end)),
		@logsize = sum(convert(bigint,case when status & 64 != 0 then size else 0 end))
	from dbo.sysfiles

	select
		@reservedpages = sum(a.total_pages),
		@usedpages = sum(a.used_pages),
		@pages = sum(CASE WHEN it.internal_type IN (202,204) THEN 0 WHEN a.type != 1 THEN a.used_pages WHEN p.index_id < 2 THEN a.data_pages ELSE 0 END)
	from sys.partitions as p
		join sys.allocation_units as a on p.partition_id = a.container_id
		left join sys.internal_tables as it on p.object_id = it.object_id

	select @database_size_mb = (convert(dec (19,2),@dbsize) + convert(dec(19,2),@logsize)) * 8192 / 1048576.0
	select @unallocated_space_mb =(case
	when @dbsize >= @reservedpages then (convert (dec (19,2),@dbsize) - convert (dec (19,2),@reservedpages)) * 8192 / 1048576.0
	else 0
	end)

	select  @reserved_mb = @reservedpages * 8192 / 1048576.0
	select  @data_mb = @pages * 8192 / 1048576.0
	select  @log_size_mb = convert(dec(19,2),@logsize) * 8192 / 1048576.0
	select  @index_mb = (@usedpages - @pages) * 8192 / 1048576.0
	select  @unused_mb = (@reservedpages - @usedpages) * 8192 / 1048576.0
	--==============================여기까지 데이터 파일 사이즈 구하기''

	set @QueryString2 = ''
	declare @Logsize_mb float
	declare @Log_Used_size_mb float
	declare @Log_UnUsed_Size_mb float
	declare @Avg_vlf_size float
	declare @Total_vlf_cnt int
	declare @Active_vlf_cnt int
	declare @vercheck int
	set @vercheck = (SELECT SUBSTRING(convert(nvarchar(10),SERVERPROPERTY(''''ProductVersion'''')), 0, CHARINDEX(''''.'''', convert(nvarchar(10),SERVERPROPERTY(''''ProductVersion'''')))))

	if (@vercheck > 10)
	begin
			declare @logfilestats_2012 table (
				RecoveryUnitID int,
				fileid int,
				filesize decimal(28,0),
				startoffset decimal(28,0),
				fseqno decimal(28,0),
				status tinyint,
				parity tinyint,
				createlsn varchar(50))
	
		
			insert into @logfilestats_2012
			exec (''''dbcc loginfo with no_infomsgs'''')

			select 
				@Logsize_mb = sum(a.filesize)  * 1.0 / (1048576.0), 
				@Log_Used_size_mb = sum(case when a.status > 0 then a.filesize else 0 end) * 1.0 / (1048576.0),
				@Log_UnUsed_Size_mb = sum(case when a.status <= 0 then a.filesize else 0 end) * 1.0 / (1048576.0),
				@Avg_vlf_size = avg(a.filesize * 1.0 / (1048576.0)),
				@Total_vlf_cnt = count(a.filesize),
				@Active_vlf_cnt = sum(case when a.status = 0 then 0 else 1 end)
			from @logfilestats_2012 as a
				inner join sys.master_files mf with(nolock)
					on mf.database_id = db_id() and a.fileid = mf.file_id
			group by a.fileid
	end
	else
	begin
		declare @logfilestats table (
				fileid int,
				filesize decimal(28,0),
				startoffset decimal(28,0),
				fseqno decimal(28,0),
				status tinyint,
				parity tinyint,
				createlsn varchar(50))
	
		
			insert into @logfilestats
			exec (''''dbcc loginfo with no_infomsgs'''')

			select 
				@Logsize_mb = sum(a.filesize)  * 1.0 / (1048576.0), 
				@Log_Used_size_mb = sum(case when a.status > 0 then a.filesize else 0 end) * 1.0 / (1048576.0), 
				@Log_UnUsed_Size_mb = sum(case when a.status <= 0 then a.filesize else 0 end) * 1.0 / (1048576.0), 
				@Avg_vlf_size = avg(a.filesize * 1.0 / (1048576.0)),
				@Total_vlf_cnt = count(a.filesize), 
				@Active_vlf_cnt = sum(case when a.status = 0 then 0 else 1 end)
			from @logfilestats as a
				inner join sys.master_files mf with(nolock)
					on mf.database_id = db_id() and a.fileid = mf.file_id
			group by a.fileid

	end
	--===============================여기까지 로그 파일 사이즈 및 VLF 구하기

	insert into #DBFile
	select
	db_name(),
	@database_size_mb as [Total_database_size_mb],
	(@reserved_mb + @unallocated_space_mb) as [datafile_size],
	@reserved_mb as [reserved_mb],
	cast(@reserved_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as [reserved_Percent],
	@unallocated_space_mb as [unallocated_space_mb],
	cast(@unallocated_space_mb*100.0/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as  [unallocated_Percent],
	@data_mb as [data_mb],
	cast(@data_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as [data_Percent],
	@index_mb as [Index_mb],
	cast(@index_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2)) as [index_Percent],
	@unused_mb as [Unused_mb],
	cast(@unused_mb*100/(@reserved_mb + @unallocated_space_mb) as decimal(10,2))as [unused_Percent],
	@log_size_mb as [transaction_log_size],
	@Logsize_mb as [Logsize_mb],
	@Log_Used_size_mb as [Log_Used_size_mb],
	cast(@Log_Used_size_mb*100.0/(@log_size_mb) as decimal(28,1)) as [Log_Used_size_Percent],
	@Log_UnUsed_Size_mb as [Log_UnUsed_Size_mb], 
	cast(@Log_UnUsed_Size_mb*100.0/(@log_size_mb) as decimal(28,1)) as [Log_UnUsed_size_Percent],
	@Avg_vlf_size as [Avg_vlf_size],
	@Total_vlf_cnt as [Total_vlf_cnt],
	@Active_vlf_cnt as [Active_vlf_cnt]''

	exec (@QueryString + @QueryString2)
	set @Min_dbid = @Min_dbid + 1

end

select 
	DatabaseName, Total_Databases_Size_MB, Datafile_Size_MB, Reserved_MB, Reserved_Percent,
	Unallocated_Space_MB, Unallocated_Percent, Data_MB, Data_Percent, Index_MB,
	Index_Percent, Unused_MB, Unused_Percent,Transaction_Log_Size, Log_Size_MB, 
	Log_Unused_Size_MB, Log_UnUsed_Size_Percent, Log_Unused_Size_MB, Log_UnUsed_Size_Percent, Avg_vlf_Size, 
	Total_vlf_cnt, Active_vlf_cnt
from #DBFile', 1, N'DatabaseFileSize', N'RegDate,TimeIn,ServerNum,DatabaseName,Total_Databases_Size_MB,Datafile_Size_MB,Reserved_MB,Reserved_Percent,Unallocated_Space_MB,Unallocated_Percent,Data_MB,Data_Percent,Index_MB,Index_Percent,Unused_MB,Unused_Percent,Transaction_Log_Size,Log_Size_MB,Log_Used_Size_MB,Log_Used_Size_Percent,Log_Unused_Size_MB,Log_UnUsed_Size_Percent,Avg_vlf_Size,Total_vlf_cnt,Active_vlf_cnt', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (7, 3, N'tbBlock', N'SELECT
	DB_NAME(a.dbid) AS [DatabaseName],
	convert(nvarchar(23), a.Last_Batch, 121) as Last_Batch, 
	a.SPID,
	a.BLOCKED as Blocked_SPID, 
	a.WAITTIME, 
	a.LASTWAITTYPE,  
	a.STATUS, 
	a.LOGINAME, 
	SUBSTRING(c.text, b.statement_start_offset/2,(CASE WHEN b.statement_end_offset = -1 THEN LEN(CONVERT(nvarchar(MAX), c.text)) * 2 ELSE b.statement_end_offset END - b.statement_start_offset)/2) as SQLStatement
FROM SYS.SYSPROCESSES as a with (nolock)
	inner join sys.dm_exec_requests as b with (nolock) on a.spid = b.session_id
	CROSS APPLY sys.dm_exec_sql_text(b.sql_handle) AS c
WHERE a.BLOCKED <> 0 OR (a.SPID IN (SELECT BLOCKED FROM SYS.SYSPROCESSES with (nolock)))', 0, N'SQL Block', N'RegDate, Timein, ServerNum, DatabaseName, LAST_BATCH, SPID, Blocked_SPID, WAITTIME, LASTWAITTYPE, STATUS, LOGINAME, Query_Text', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (2, 30, N'tbSQLAgentFail', N'set nocount on
set transaction isolation level read uncommitted

SELECT
	A.NAME AS JOB_NAME, 
	convert(nvarchar(23), B.RUN_REQUESTED_DATE, 121) as RUN_REQUESTED_DATE, 
	B.LAST_EXECUTED_STEP_ID, 
	B.JOB_HISTORY_ID, 
	C.[MESSAGE], 
	D.STEP_NAME, 
	D.COMMAND
FROM MSDB.DBO.SYSJOBS AS A
 INNER JOIN MSDB.DBO.SYSJOBACTIVITY AS B ON A.JOB_ID = B.JOB_ID
 INNER JOIN MSDB.DBO.SYSJOBHISTORY AS C ON A.JOB_ID = C.JOB_ID AND B.JOB_HISTORY_ID = C.INSTANCE_ID + 1
 INNER JOIN MSDB.DBO.SYSJOBSTEPS AS D ON A.JOB_ID = D.JOB_ID AND B.LAST_EXECUTED_STEP_ID = D.STEP_ID
WHERE A.ENABLED = 1 AND C.RUN_STATUS = 0 AND CONVERT(NVARCHAR(10), B.RUN_REQUESTED_DATE, 120) = CONVERT(NVARCHAR(10), GETDATE(), 120)', 1, N'SQL Job Agent Fail Check', N'RegDate,TimeIn,ServerNum,JOB_NAME,RUN_REQUESTED_DATE,LAST_EXECUTED_STEP_ID,JOB_HISTORY_ID,MESSAGE,STEP_NAME,COMMAND', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (4, 60, N'tbSQLLinkedCheck', N'set nocount on
set transaction isolation level read uncommitted

declare @linked_server table
(
	idx int identity(1,1) not null primary key,
	server_id int,
	server_nm sysname
)

declare @linked_server_OfflineList table (
check_date datetime,
ServerName nvarchar(100),
Linked_Name nvarchar(100))

declare @rowcnt int
declare @idx int
declare @id int
declare @name sysname
declare @sql nvarchar(max)

insert into @linked_server (server_id, server_nm)
select server_id, name from sys.servers with(nolock)
where server_id > 0
	
set @rowcnt = @@ROWCOUNT
set @idx = 1
print @rowcnt
while @idx <= @rowcnt
begin
	select @id = server_id, @name = server_nm from @linked_server where idx = @idx
	
	begin try
		set @sql = ''exec sp_testlinkedserver @servername = ['' + @name + '']''
		exec (@sql)
	end try
	begin catch
		insert @linked_server_OfflineList
		SELECT getdate(), @@Servername, @name
	end catch
	
	set @idx = @idx + 1
	print @idx
end

select Linked_Name from @linked_server_OfflineList', 1, N'SQL LinkedServer Check', N'RegDate, TimeIn, ServerNum, LinkedName', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (16, 15, N'tbSQLSession', N'select
	ES.Login_name, 
	ES.[host_name], 
	EC.client_net_address,
	COUNT(ES.session_id) AS TotalSession,
	SUM(CASE WHEN ES.status = ''running'' THEN 1 ELSE 0 END) AS ActiveSession
from SYS.DM_EXEC_SESSIONS AS ES WITH (NOLOCK) 
	left outer join SYS.DM_EXEC_CONNECTIONS AS EC WITH (NOLOCK)
		ON ES.SESSION_ID = EC.SESSION_ID 
group by EC.CLIENT_NET_ADDRESS,  ES.[HOST_NAME], ES.LOGIN_NAME', 1, N'SQL Session', N'RegDate, TimeIn, ServerNum, Login_Name, Host_Name, Client_Net_Address, TotalSession, ActiveSession', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (6, 0, N'tbTableSize', N'set nocount on
set transaction isolation level read uncommitted 

begin try
	drop table #TableSize
end try begin catch end catch

create  table #TableSize (
[DatabaseName] nvarchar(200),
[SchemaName] nvarchar(200),
[TableName] nvarchar(200),
[Row_Count] bigint,
[Reserved(KB)] bigint,
[Data(KB)] bigint,
[IndexSize(KB)] bigint,
[Unused(KB)] bigint
)

exec sp_MSforeachdb ''
use ?;

declare @DB_Name nvarchar(50)
set @DB_Name = db_name()
if @DB_Name in (''''master'''', ''''model'''', ''''msdb'''', ''''tempdb'''')
	return

insert into #TableSize
SELECT
	top 10
	db_name() as [DatabaseName],
	a3.name AS [SchemaName],
	a2.name AS [TableName],
	a1.rows as Row_Count,
	(a1.reserved + ISNULL(a4.reserved,0))* 8 AS [Reserved(KB)], 
	a1.data * 8 AS [Data(KB)],
	(CASE WHEN (a1.used + ISNULL(a4.used,0)) > a1.data THEN (a1.used + ISNULL(a4.used,0)) - a1.data ELSE 0 END) * 8 AS [IndexSize(KB)],
	(CASE WHEN (a1.reserved + ISNULL(a4.reserved,0)) > a1.used THEN (a1.reserved + ISNULL(a4.reserved,0)) - a1.used ELSE 0 END) * 8 AS [Unused(KB)]
FROM
 (SELECT 
  ps.object_id,
  SUM (CASE WHEN (ps.index_id < 2) THEN row_count ELSE 0 END) AS [rows],
  SUM (ps.reserved_page_count) AS reserved,
  SUM (CASE WHEN (ps.index_id < 2) THEN (ps.in_row_data_page_count + ps.lob_used_page_count + ps.row_overflow_used_page_count) ELSE (ps.lob_used_page_count + ps.row_overflow_used_page_count) END) AS data,
  SUM (ps.used_page_count) AS used
 FROM sys.dm_db_partition_stats ps
 GROUP BY ps.object_id) AS a1
LEFT OUTER JOIN 
 (SELECT 
  it.parent_id,
  SUM(ps.reserved_page_count) AS reserved,
  SUM(ps.used_page_count) AS used
  FROM sys.dm_db_partition_stats ps
	INNER JOIN sys.internal_tables it ON (it.object_id = ps.object_id)
  WHERE it.internal_type IN (202,204)
  GROUP BY it.parent_id) AS a4 ON (a4.parent_id = a1.object_id)
	INNER JOIN sys.all_objects a2  ON ( a1.object_id = a2.object_id ) 
	INNER JOIN sys.schemas a3 ON (a2.schema_id = a3.schema_id)
WHERE a2.type <> N''''S'''' and a2.type <> N''''IT''''
ORDER BY [Reserved(KB)] desc''

select 
	getdate() as RegDate, getdate() as TimeIn, 0 as ServerNum,
	[DatabaseName], [SchemaName], [TableName], [Row_Count], [Reserved(KB)], 
	[Data(KB)], [IndexSize(KB)], [Unused(KB)]
from #TableSize
order by [DatabaseName], [Reserved(KB)] desc', 1, N'Table Size Check', N'RegDate,Timein,ServerNum,DatabaseName,SchemaName,TableName,Row_Count,Reserved_KB,Data_KB,IndexSize_KB,Unused_KB', N'18:48', N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (13, 15, N'tbSQLServiceStatus', N'IF (SELECT SUBSTRING(CONVERT(NVARCHAR(128), SERVERPROPERTY(''PRODUCTVERSION'')), 1, CHARINDEX(''.'', CONVERT(NVARCHAR(128), SERVERPROPERTY(''PRODUCTVERSION''))) -1)) NOT IN (9, 10)
BEGIN
	SELECT SERVICENAME, PROCESS_ID, STARTUP_TYPE_DESC, STATUS_DESC, CONVERT(NVARCHAR(23), CONVERT(DATETIME, LAST_STARTUP_TIME), 121) AS LAST_STARTUP_TIME, SERVICE_ACCOUNT, IS_CLUSTERED, CLUSTER_NODENAME, [FILENAME] FROM SYS.DM_SERVER_SERVICES WITH (NOLOCK)
END

', 1, N'SQLServiceStatus', N'RegDate, TimeIn, ServerNum, servicename, process_id, startup_type_desc, status_desc, last_startup_time, service_account, is_clustered, cluster_nodename, [filename]', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (18, 60, N'tbSQLAgentErrorlog', N'set nocount on
set transaction isolation level read uncommitted

declare @errorlog table (
LogDate datetime, 
ProcessInfo varchar(100), 
ErrorText varchar(4000)
)
declare @check_date datetime
declare @start_date datetime

set @check_date = GETDATE()
set @start_date = dateadd(minute, -1,  GETDATE())

insert into @errorlog (LogDate, ProcessInfo, ErrorText)
exec xp_readerrorlog 0, 2, NULL, NULL, @start_date, @check_date

select convert(nvarchar(23), LogDate, 121)as LogDate, ProcessInfo, ErrorText from @errorlog ', 1, N'SQLAgentErrorlog', N'RegDate,TimeIn,ServerNum,LogDate,ProcessInfo,ErrorText', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (8, 60, N'tbObjectCheck', N'declare @object_check table(
[db_name] [varchar](255) NULL,
[name] [varchar](255) NULL,
[parent_object_name] [varchar](255) NULL,
[type_desc] [varchar](255) NULL,
[create_date] [datetime] NULL,
[modify_date] [datetime] NULL)

insert into @object_check
exec sp_msforeachdb ''
use ?;

declare @CurrentDate datetime
set @CurrentDate = getdate()
	
declare @DB_Name nvarchar(50)
set @DB_Name = db_name()
if @DB_Name in (''''tempdb'''')
	return

select
	''''?'''' as db_name,
	name, 
	isnull(object_name(parent_object_id), '''''''') as parent_object_name, 
	type_desc, 
	create_date, 
	modify_date 
from 
	sys.all_objects with(nolock)
where 
	is_ms_shipped = 0 
	and (create_date >= dateadd(MINUTE, -1, @CurrentDate) and create_date < @CurrentDate 
		or modify_date >= dateadd(MINUTE, -1, @CurrentDate) and modify_date < @CurrentDate) order by type_desc, name''

select 
	[db_name], 
	name, 
	parent_object_name, 
	type_desc, 
	convert(nvarchar(23), create_date, 121), 
	convert(nvarchar(23), modify_date, 121) 
from @object_check', 1, N'SQL Object (Table / Procedure)', N'RegDate, TimeIn, ServerNum, [db_name], name, parent_object_name, type_desc, create_date, modify_date', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (9, 60, N'tbDatabase', N'select
	name as database_name, 
	convert(nvarchar(23), create_date, 121) as create_date,
	compatibility_level,
	collation_name,
	user_access_desc,
	is_read_only,
	is_auto_shrink_on,  
	state_desc, 
	is_in_standby,
	snapshot_isolation_state_desc,
	is_read_committed_snapshot_on,
	recovery_model_desc,
	page_verify_option_desc,
	is_auto_create_stats_on,
	is_auto_update_stats_on,
	is_auto_update_stats_async_on,
	is_fulltext_enabled,
	is_trustworthy_on,
	is_parameterization_forced,
	is_db_chaining_on,
	is_broker_enabled,
	is_published,
	is_subscribed,
	is_merge_published,
	is_distributor
from 
	sys.databases with(nolock)', 1, N'Database Check', N'RegDate,TimeIn,ServerNum,database_name,create_date,compatibility_level,collation_name,user_access_desc,is_read_only,is_auto_shrink_on,state_desc,is_in_standby,snapshot_isolation_state_desc,is_read_committed_snapshot_on,recovery_model_desc,page_verify_option_desc,is_auto_create_stats_on,is_auto_update_stats_on,is_auto_update_stats_async_on,is_fulltext_enabled,is_trustworthy_on,is_parameterization_forced,is_db_chaining_on,is_broker_enabled,is_published,is_subscribed,is_merge_published,is_distributor', NULL, N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (11, 0, N'tbIndexDuplication', N'set nocount on
set transaction isolation level read uncommitted

declare @index_dup_check table (
DatabaseName nvarchar(100),
ObjectName nvarchar(255),
IndexName nvarchar(255),
DuplicationIndexName nvarchar(255),
is_primary_key int,
is_unique int,
type nvarchar(100),
IndexColumns nvarchar(2000),
IncludedColumns nvarchar(2000))

insert into @index_dup_check
exec sp_msforeachdb ''
use ?;

declare @DB_Name nvarchar(50)
set @DB_Name = db_name()
if @DB_Name in (''''master'''', ''''model'''', ''''msdb'''', ''''tempdb'''')
	return

select 
	DB_NAME() as DatabaseName, OBJECT_NAME(a.object_id) as ObjectName, i.name as IndexName,
	i2.name as DuplicationIndexName, i.is_primary_key as is_primary_key, 
	case when i.is_unique | i.is_unique_constraint > 0 then 1 else 0 end as is_unique,
	lower(i.type_desc) as type, a.columns as IndexColumns,
	isnull(STUFF((
		select '''', '''' + COL_NAME(ic.object_id, ic.column_id) 
		from sys.index_columns ic with(nolock) 
		where ic.object_id = a.object_id and ic.index_id = a.index_id and ic.is_included_column = 1
		order by index_column_id
		for xml path('''''''')), 1, 1, ''''''''), ''''''''
	) as IncludedColumns
from
	(
		select distinct a.object_id, a.index_id,
			isnull(STUFF((
				select '''', '''' + COL_NAME(ic.object_id, ic.column_id) 
				from sys.index_columns ic with(nolock) 
				where ic.object_id = a.object_id and ic.index_id = a.index_id and ic.is_included_column = 0
				order by key_ordinal
				for xml path('''''''')), 1, 1, ''''''''), ''''''''
			) as columns
		from 
			sys.index_columns a with(nolock)
	) a
	inner join (
		select distinct 
			a.object_id, a.index_id,
			isnull(STUFF((
				select '''', '''' + COL_NAME(ic.object_id, ic.column_id) 
				from sys.index_columns ic with(nolock) 
				where ic.object_id = a.object_id and ic.index_id = a.index_id and ic.is_included_column = 0
				order by key_ordinal
				for xml path('''''''')), 1, 1, ''''''''), ''''''''
			) as columns
		from 
			sys.index_columns a with(nolock)
	) b
		on a.object_id = b.object_id and a.index_id <> b.index_id and a.columns = b.columns
	inner join sys.indexes i with(nolock)
		on a.object_id = i.object_id and a.index_id = i.index_id
	inner join sys.indexes i2 with(nolock)
		on b.object_id = i2.object_id and b.index_id = i2.index_id
where
	db_id() > 4
order by DatabaseName, ObjectName, IndexName, DuplicationIndexName''

select 
	DatabaseName, 
	ObjectName, 
	IndexName, 
	DuplicationIndexName, 
	is_primary_key, 
	is_unique, 
	type, 
	IndexColumns, 
	IncludedColumns 
from @index_dup_check ', 1, N'Index Duplication', N'RegDate,TimeIn,ServerNum,DatabaseName,ObjectName,IndexName,DuplicationIndexName,is_primary_key,is_unique,type,IndexColumns,IncludedColumns', N'15:00', N'N')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (12, 300, NULL, N'set nocount on
set transaction isolation level read uncommitted  

-- Get selected server properties (SQL Server 2005, 2008, 2008R2) 
IF (SELECT SUBSTRING(CONVERT(NVARCHAR(128), SERVERPROPERTY(''ProductVersion'')), 1, CHARINDEX(''.'', CONVERT(NVARCHAR(128), SERVERPROPERTY(''ProductVersion''))) -1)) in (9, 10)
BEGIN
	SELECT
	SERVERPROPERTY(''MachineName'') AS [MachineName], 
	SERVERPROPERTY(''ServerName'') AS [ServerName],  
	SERVERPROPERTY(''InstanceName'') AS [Instance],
	SERVERPROPERTY(''IsClustered'') AS [IsClustered], 
	SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') AS [ComputerNamePhysicalNetBIOS], 
	SERVERPROPERTY(''Edition'') AS [Edition], 
	SERVERPROPERTY(''ProductLevel'') AS [ProductLevel], 
	SERVERPROPERTY(''ProductVersion'') AS [ProductVersion], 
	SERVERPROPERTY(''ProcessID'') AS [ProcessID],
	SERVERPROPERTY(''Collation'') AS [Collation], 
	SERVERPROPERTY(''IsFullTextInstalled'') AS [IsFullTextInstalled], 
	SERVERPROPERTY(''IsIntegratedSecurityOnly'') AS [IsIntegratedSecurityOnly],
	0 AS [IsHadrEnabled], 
	0 AS [HadrManagerStatus],
	0 as [IsXTPSupported]
END



-- Get selected server properties (SQL Server 2012)
IF (SELECT SUBSTRING(CONVERT(NVARCHAR(128), SERVERPROPERTY(''ProductVersion'')), 1, CHARINDEX(''.'', CONVERT(NVARCHAR(128), SERVERPROPERTY(''ProductVersion''))) -1)) in (11)
BEGIN
	SELECT 
	SERVERPROPERTY(''MachineName'') AS [MachineName], 
	SERVERPROPERTY(''ServerName'') AS [ServerName],  
	SERVERPROPERTY(''InstanceName'') AS [Instance], 
	SERVERPROPERTY(''IsClustered'') AS [IsClustered], 
	SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') AS [ComputerNamePhysicalNetBIOS], 
	SERVERPROPERTY(''Edition'') AS [Edition], 
	SERVERPROPERTY(''ProductLevel'') AS [ProductLevel], 
	SERVERPROPERTY(''ProductVersion'') AS [ProductVersion], 
	SERVERPROPERTY(''ProcessID'') AS [ProcessID],
	SERVERPROPERTY(''Collation'') AS [Collation], 
	SERVERPROPERTY(''IsFullTextInstalled'') AS [IsFullTextInstalled], 
	SERVERPROPERTY(''IsIntegratedSecurityOnly'') AS [IsIntegratedSecurityOnly],
	SERVERPROPERTY(''IsHadrEnabled'') AS [IsHadrEnabled], 
	SERVERPROPERTY(''HadrManagerStatus'') AS [HadrManagerStatus],
	0 as [IsXTPSupported]

END

-- Get selected server properties (SQL Server 2014)
IF (SELECT SUBSTRING(CONVERT(NVARCHAR(128), SERVERPROPERTY(''ProductVersion'')), 1, CHARINDEX(''.'', CONVERT(NVARCHAR(128), SERVERPROPERTY(''ProductVersion''))) -1)) in (12)
BEGIN
	SELECT 
	SERVERPROPERTY(''MachineName'') AS [MachineName], 
	SERVERPROPERTY(''ServerName'') AS [ServerName],  
	SERVERPROPERTY(''InstanceName'') AS [Instance], 
	SERVERPROPERTY(''IsClustered'') AS [IsClustered], 
	SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') AS [ComputerNamePhysicalNetBIOS], 
	SERVERPROPERTY(''Edition'') AS [Edition], 
	SERVERPROPERTY(''ProductLevel'') AS [ProductLevel], 
	SERVERPROPERTY(''ProductVersion'') AS [ProductVersion], 
	SERVERPROPERTY(''ProcessID'') AS [ProcessID],
	SERVERPROPERTY(''Collation'') AS [Collation], 
	SERVERPROPERTY(''IsFullTextInstalled'') AS [IsFullTextInstalled], 
	SERVERPROPERTY(''IsIntegratedSecurityOnly'') AS [IsIntegratedSecurityOnly],
	SERVERPROPERTY(''IsHadrEnabled'') AS [IsHadrEnabled], 
	SERVERPROPERTY(''HadrManagerStatus'') AS [HadrManagerStatus],
	SERVERPROPERTY(''IsXTPSupported'') AS [IsXTPSupported]
END', 1, N'SQLServerInfo', N'p_SQLServerInfo_Update', NULL, N'Y')
GO
INSERT [dbo].[tbQueryDefinition] ([QueryID], [Interval], [DestinationTable], [Query], [Enabled], [QueryDescription], [SPName], [OccursTime], [IsProcedure]) VALUES (17, 180, N'tbSQLIndexFlagment', N'set nocount on

begin try
	drop table #index_frag_check
end try begin catch end catch

begin try
	drop table #dbid
end try begin catch end catch

declare @QueryString nvarchar(max)
declare @Min_dbid int
declare @Max_dbid int
declare @name nvarchar(128)
declare @dbid int
select IDENTITY(INT, 1,1) AS NUM, dbid, name into #dbid from sys.sysdatabases with (nolock) where databasepropertyex (name, ''Status'') <> ''OFFLINE''

select @Min_dbid = min(NUM), @Max_dbid = max(NUM) from #dbid


 create table #index_frag_check (
	[db_name] [nvarchar](128) NULL,
	[object_name] [nvarchar](128) NULL,
	[index_name] [nvarchar](128) NULL,
	[index_type] [nvarchar](60) NULL,
	[alloc_unit_type] [nvarchar](60) NULL,
	[index_depth] [tinyint] NULL,
	[index_level] [tinyint] NULL,
	[avg_frag_percent] [numeric](5, 2) NULL,
	[fragment_count] [bigint] NULL,
	[avg_frag_size_in_page] [numeric](28, 2) NULL,
	[page_count] [bigint] NULL)

while @Min_dbid < @Max_dbid
begin
	select @name = name, @dbid = dbid from #dbid where NUM = @Min_dbid

	set @QueryString = 
	''use '' + @name + ''
	INSERT INTO #index_frag_check(db_name, object_name, index_name, index_type, alloc_unit_type, index_depth, index_level, avg_frag_percent, fragment_count, avg_frag_size_in_page, page_count)
	select 
		DB_NAME(s.database_id) as db_name,
		OBJECT_NAME(s.object_id, database_id) as object_name,
		i.name as index_name,
		s.index_type_desc,
		s.alloc_unit_type_desc,
		s.index_depth,
		s.index_level,
		cast(s.avg_fragmentation_in_percent as numeric(5,2)) as avg_fragmentation_in_percent,
		fragment_count,
		cast(s.avg_fragment_size_in_pages as numeric(28,2)) as avg_fragment_size_in_pages,
		s.page_count
	from 
		sys.dm_db_index_physical_stats(''+convert(nvarchar(10), @dbid)+'', null, null, null, null) s
		inner join sys.indexes i with(nolock)
			on s.object_id = i.object_id and s.index_id = i.index_id
	where 
		page_count > 0 and s.alloc_unit_type_desc not in (''''LOB_DATA'''', ''''ROW_OVERFLOW_DATA '''') and DB_NAME(database_id) not in (''''tempdb'''', ''''master'''', ''''msdb'''', ''''model'''')
	''

	exec (@QueryString)
	set @Min_dbid = @Min_dbid + 1

end

select
	[db_name], [object_name], 
	index_name, index_type, 
	alloc_unit_type, 
	index_depth, 
	index_level, 
	avg_frag_percent, 
	fragment_count, 
	avg_frag_size_in_page,
	page_count 
from #index_frag_check

', 1, N'Index Flagment', N'RegDate, TimeIn, ServerNum, [db_name], [object_name], index_name, index_type, alloc_unit_type, index_depth, index_level, avg_frag_percent, fragment_count, avg_frag_size_in_page, page_count', NULL, N'N')
GO

