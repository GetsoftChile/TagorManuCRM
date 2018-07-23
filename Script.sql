USE [bd_crmTagor]
GO
/****** Object:  Table [dbo].[GM_UNIDAD]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_UNIDAD](
	[ID_UNIDAD] [int] NOT NULL,
	[NOMBRE_UNIDAD] [varchar](100) NULL,
 CONSTRAINT [PK_GM_UNIDAD] PRIMARY KEY CLUSTERED 
(
	[ID_UNIDAD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GM_UNIDAD] ([ID_UNIDAD], [NOMBRE_UNIDAD]) VALUES (1, N'Johnson')
INSERT [dbo].[GM_UNIDAD] ([ID_UNIDAD], [NOMBRE_UNIDAD]) VALUES (2, N'Paris')
INSERT [dbo].[GM_UNIDAD] ([ID_UNIDAD], [NOMBRE_UNIDAD]) VALUES (3, N'SISA')
INSERT [dbo].[GM_UNIDAD] ([ID_UNIDAD], [NOMBRE_UNIDAD]) VALUES (4, N'Jumbo')
INSERT [dbo].[GM_UNIDAD] ([ID_UNIDAD], [NOMBRE_UNIDAD]) VALUES (5, N'Easy')
INSERT [dbo].[GM_UNIDAD] ([ID_UNIDAD], [NOMBRE_UNIDAD]) VALUES (6, N'Shopping')
/****** Object:  Table [dbo].[GM_TIPO_MOTIVO_CIERRE]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_TIPO_MOTIVO_CIERRE](
	[ID_TIPO_MOTIVO_CIERRE] [int] NOT NULL,
	[TIPO_MOTIVO_CIERRE] [varchar](40) NULL,
	[ACTIVO] [bit] NULL,
 CONSTRAINT [PK_TIPO_MOTIVO_CIERRE] PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_MOTIVO_CIERRE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GM_TIPIFICACION_RESP]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_TIPIFICACION_RESP](
	[ID_TIPIFICACION] [int] IDENTITY(1,1) NOT NULL,
	[ID_EMPRESA] [int] NULL,
	[NIVEL_1] [varchar](100) NULL,
	[NIVEL_2] [varchar](100) NULL,
	[NIVEL_3] [varchar](100) NULL,
	[NIVEL_4] [varchar](100) NULL,
	[NIVEL_5] [varchar](100) NULL,
	[INSISTENCIA] [tinyint] NULL,
	[ACTIVO] [tinyint] NULL,
	[AGENDAMIENTO] [tinyint] NULL,
	[DERIVA] [tinyint] NULL,
	[ID_RESPONSABLE] [int] NULL,
	[ID_USUARIO_ESC_N1] [int] NULL,
	[ID_USUARIO_ESC_N2] [int] NULL,
	[ID_USUARIO_ESC_N3] [int] NULL,
	[ID_USUARIO_ESC_N4] [int] NULL,
	[SLA_N1] [numeric](18, 4) NULL,
	[SLA_N2] [numeric](18, 4) NULL,
	[SLA_N3] [numeric](18, 4) NULL,
	[SLA_N4] [numeric](18, 4) NULL,
	[RESPUESTA_INTERNA] [varchar](100) NULL,
	[AREA_RES] [varchar](100) NULL,
	[SUB_AREA_RES] [varchar](100) NULL,
	[ID_AREA_RESOLUTORA] [int] NULL,
	[TIPO] [char](1) NULL,
	[ID_TIPO_MOTIVO_CIERRE] [int] NULL,
	[USUARIO1] [varchar](100) NULL,
	[AREA1] [varchar](100) NULL,
	[USUARIO2] [varchar](100) NULL,
	[AREA2] [varchar](100) NULL,
	[USUARIO3] [varchar](100) NULL,
	[AREA3] [varchar](100) NULL,
	[USUARIO4] [varchar](100) NULL,
	[AREA4] [varchar](100) NULL,
	[VISIBLE_ATENTO] [tinyint] NULL,
	[VISIBLE_CLI_INTERNO] [tinyint] NULL,
	[VISIBLE_CLI_EXTERNO] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GM_LOCALIDAD]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_LOCALIDAD](
	[ID_LOCALIDAD] [varchar](10) NOT NULL,
	[NOMBRE_LOCALIDAD] [varchar](100) NULL,
	[ACTIVO] [int] NULL,
 CONSTRAINT [PK_LOCALIDAD] PRIMARY KEY CLUSTERED 
(
	[ID_LOCALIDAD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONSOLIDADO_TEMPO]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONSOLIDADO_TEMPO](
	[ID_TIPIFICACION] [int] NULL,
	[ID_EMPRESA] [int] NULL,
	[NIVEL_1] [varchar](100) NULL,
	[NIVEL_2] [varchar](100) NULL,
	[NIVEL_3] [varchar](100) NULL,
	[NIVEL_4] [varchar](100) NULL,
	[NIVEL_5] [varchar](100) NULL,
	[NIVEL_RESOLUTORIO] [varchar](40) NULL,
	[AREA_RES] [varchar](100) NULL,
	[ID_USUARIO_ESC_N1] [int] NULL,
	[USUARIO1] [varchar](100) NULL,
	[AREA1] [varchar](100) NULL,
	[SLA_N1] [numeric](18, 4) NULL,
	[ID_USUARIO_ESC_N2] [int] NULL,
	[USUARIO2] [varchar](100) NULL,
	[AREA2] [varchar](100) NULL,
	[SLA_N2] [numeric](18, 4) NULL,
	[ID_USUARIO_ESC_N3] [int] NULL,
	[USUARIO3] [varchar](100) NULL,
	[AREA3] [varchar](100) NULL,
	[SLA_N3] [numeric](18, 4) NULL,
	[ID_USUARIO_ESC_N4] [int] NULL,
	[USUARIO4] [varchar](100) NULL,
	[AREA4] [varchar](100) NULL,
	[SLA_N4] [numeric](18, 4) NULL,
	[TIPO] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CASE_MAKER]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CASE_MAKER](
	[caso_id] [int] NULL,
	[descripcion] [varchar](200) NULL,
	[codarea_1_cliente] [int] NULL,
	[telefono_1_cliente] [varchar](15) NULL,
	[codarea_2_cliente] [int] NULL,
	[telefono_2_cliente] [varchar](15) NULL,
	[rut_cliente] [varchar](15) NULL,
	[dv_cliente] [varchar](2) NULL,
	[nombre_cliente] [varchar](50) NULL,
	[apellido_cliente] [varchar](50) NULL,
	[email_cliente] [varchar](50) NULL,
	[llamado_tipo_desc] [varchar](50) NULL,
	[categoria_id] [int] NULL,
	[categoria_desc] [varchar](50) NULL,
	[componente_id] [int] NULL,
	[componente_desc] [varchar](50) NULL,
	[motivo_desc] [varchar](50) NULL,
	[tipo_desc] [varchar](50) NULL,
	[fecha_creacion] [smalldatetime] NULL,
	[fecha_hora_creacion] [varchar](50) NULL,
	[fecha_ultima_modificacion] [varchar](50) NULL,
	[hora_ultima_modificacion] [varchar](50) NULL,
	[dias_resolucion] [varchar](50) NULL,
	[estado_caso_desc] [varchar](50) NULL,
	[Rut] [int] NULL,
	[DV] [char](1) NULL,
	[Nombre_Creador] [varchar](50) NULL,
	[Apellido_Creador] [varchar](50) NULL,
	[ubicacion_desc] [varchar](50) NULL,
	[Nombre_Operador] [varchar](50) NULL,
	[Apellido_Operador] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GM_HISTORIAL_SERNAC]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_HISTORIAL_SERNAC](
	[ID] [int] NULL,
	[MES] [varchar](50) NULL,
	[AGNO] [int] NULL,
	[FOLIO] [varchar](50) NULL,
	[EMPRESA] [varchar](50) NULL,
	[LOCAL] [varchar](50) NULL,
	[MOTIVO] [varchar](400) NULL,
	[COMPENSACION_SOLICITADA] [varchar](400) NULL,
	[COMPENSACION_PAGADA] [varchar](50) NULL,
	[DIFERENCIA] [varchar](50) NULL,
	[OBSERVACION] [varchar](400) NULL,
	[RUT] [varchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarGrupo]    Script Date: 07/23/2018 00:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarGrupo]
as begin

select *
from GM_GRUPO

end
GO
/****** Object:  Table [dbo].[GM_FERIADOS]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GM_FERIADOS](
	[ID_FERIADO] [int] IDENTITY(1,1) NOT NULL,
	[FERIADO] [smalldatetime] NOT NULL,
	[ACTIVO] [tinyint] NULL,
 CONSTRAINT [PK_ID_FERIADO] PRIMARY KEY CLUSTERED 
(
	[ID_FERIADO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GM_ESTADO_ATENCION]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_ESTADO_ATENCION](
	[ID_ESTADO_ATENCION] [tinyint] NOT NULL,
	[ESTADO_ATENCION] [varchar](30) NULL,
	[ACTIVO] [tinyint] NULL,
 CONSTRAINT [PK_GM_ESTADO_ATENCION] PRIMARY KEY CLUSTERED 
(
	[ID_ESTADO_ATENCION] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GM_ESTADO_ATENCION] ([ID_ESTADO_ATENCION], [ESTADO_ATENCION], [ACTIVO]) VALUES (1, N'PENDIENTE', 1)
INSERT [dbo].[GM_ESTADO_ATENCION] ([ID_ESTADO_ATENCION], [ESTADO_ATENCION], [ACTIVO]) VALUES (2, N'DETENIDO', 1)
INSERT [dbo].[GM_ESTADO_ATENCION] ([ID_ESTADO_ATENCION], [ESTADO_ATENCION], [ACTIVO]) VALUES (3, N'CERRADO', 1)
/****** Object:  Table [dbo].[GM_ESCALAMIENTO]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_ESCALAMIENTO](
	[ID_ESCALAMIENTO] [int] IDENTITY(1,1) NOT NULL,
	[ID_TICKET] [int] NULL,
	[ID_USUARIO] [int] NULL,
	[EMAIL] [varchar](100) NULL,
	[ESCALAMIENTO] [tinyint] NULL,
	[FECHA_ENVIO_EMAIL] [smalldatetime] NULL,
	[FECHA_INGRESO] [datetime] NULL,
	[HORAS_SLA] [int] NULL,
	[FECHA_TICKET] [datetime] NULL,
 CONSTRAINT [PK_ESCALAMIENTO] PRIMARY KEY CLUSTERED 
(
	[ID_ESCALAMIENTO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GM_EMPRESA]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_EMPRESA](
	[ID_EMPRESA] [int] NOT NULL,
	[EMPRESA] [varchar](100) NULL,
	[ACTIVO] [bit] NULL,
	[RUT] [varchar](10) NULL,
 CONSTRAINT [PK_EMPRESA] PRIMARY KEY CLUSTERED 
(
	[ID_EMPRESA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GM_EMPRESA] ([ID_EMPRESA], [EMPRESA], [ACTIVO], [RUT]) VALUES (1, N'Tagor', 1, N'1-9')
/****** Object:  Table [dbo].[GM_COMUNA]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_COMUNA](
	[ID_COMUNA] [varchar](10) NOT NULL,
	[NOM_COMUNA] [varchar](60) NOT NULL,
	[NOM_PROVINCIA] [varchar](60) NOT NULL,
	[ID_REGION] [int] NOT NULL,
	[NOM_REGION] [varchar](60) NOT NULL,
 CONSTRAINT [PK_GM_COMUNA] PRIMARY KEY CLUSTERED 
(
	[ID_COMUNA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'01101', N'Iquique', N'Iquique', 1, N'Tarapaca')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'01107', N'Alto Hospicio', N'Iquique', 1, N'Tarapaca')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'01401', N'Pozo Almonte', N'Tamarugal', 1, N'Tarapaca')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'01402', N'Camiña', N'Tamarugal', 1, N'Tarapaca')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'01403', N'Colchane', N'Tamarugal', 1, N'Tarapaca')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'01404', N'Huara', N'Tamarugal', 1, N'Tarapaca')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'01405', N'Pica', N'Tamarugal', 1, N'Tarapaca')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02101', N'Antofagasta', N'Antofagasta', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02102', N'Mejillones', N'Antofagasta', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02103', N'Sierra Gorda', N'Antofagasta', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02104', N'Taltal', N'Antofagasta', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02201', N'Calama', N'El Loa', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02202', N'Ollague', N'El Loa', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02203', N'San Pedro de Atacama', N'El Loa', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02301', N'Tocopilla', N'Tocopilla', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'02302', N'María Elena', N'Tocopilla', 2, N'Antofagasta')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03101', N'Copiapó', N'Copiapo', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03102', N'Caldera', N'Copiapo', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03103', N'Tierra Amarilla', N'Copiapo', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03201', N'Chañaral', N'Chañaral', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03202', N'Diego de Almagro', N'Chañaral', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03301', N'Vallenar', N'Huasco', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03302', N'Alto del Carmen', N'Huasco', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03303', N'Freirina', N'Huasco', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'03304', N'Huasco', N'Huasco', 3, N'Atacama')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04101', N'La Serena', N'Elqui', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04102', N'Coquimbo', N'Elqui', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04103', N'Andacollo', N'Elqui', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04104', N'La Higuera', N'Elqui', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04105', N'Paihuano', N'Elqui', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04106', N'Vicuña', N'Elqui', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04201', N'Illapel', N'Choapa', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04202', N'Canela', N'Choapa', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04203', N'Los Vilos', N'Choapa', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04204', N'Salamanca', N'Choapa', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04301', N'Ovalle', N'Limari', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04302', N'Combarbalá', N'Limari', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04303', N'Monte Patria', N'Limari', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04304', N'Punitaqui', N'Limari', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'04305', N'Río Hurtado', N'Limari', 4, N'Coquimbo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05101', N'Valparaíso', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05102', N'Casablanca', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05103', N'Concón', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05104', N'Juan Fernández', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05105', N'Puchuncaví', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05106', N'Quilpué', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05107', N'Quintero', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05108', N'Villa Alemana', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05109', N'Viña del Mar', N'Valparaiso', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05201', N'Isla de Pascua', N'Isla de Pascua', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05301', N'Los Andes', N'Los Andes', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05302', N'Calle Larga', N'Los Andes', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05303', N'Rinconada', N'Los Andes', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05304', N'San Esteban', N'Los Andes', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05401', N'La Ligua', N'Petorca', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05402', N'Cabildo', N'Petorca', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05403', N'Papudo', N'Petorca', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05404', N'Petorca', N'Petorca', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05405', N'Zapallar', N'Petorca', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05501', N'Quillota', N'Quillota', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05502', N'Calera', N'Quillota', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05503', N'Hijuelas', N'Quillota', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05504', N'La Cruz', N'Quillota', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05505', N'Limache', N'Quillota', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05506', N'Nogales', N'Quillota', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05507', N'Olmué', N'Quillota', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05601', N'San Antonio', N'San Antonio', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05602', N'Algarrobo', N'San Antonio', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05603', N'Cartagena', N'San Antonio', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05604', N'El Quisco', N'San Antonio', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05605', N'El Tabo', N'San Antonio', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05606', N'Santo Domingo', N'San Antonio', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05701', N'San Felipe', N'San Felipe de Aconcagua', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05702', N'Catemu', N'San Felipe de Aconcagua', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05703', N'Llay Llay', N'San Felipe de Aconcagua', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05704', N'Panquehue', N'San Felipe de Aconcagua', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05705', N'Putaendo', N'San Felipe de Aconcagua', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'05706', N'Santa María', N'San Felipe de Aconcagua', 5, N'Valparaiso')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06101', N'Rancagua', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06102', N'Codegua', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06103', N'Coinco', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06104', N'Coltauco', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06105', N'Doñihue', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06106', N'Graneros', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06107', N'Las Cabras', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06108', N'Machalí', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06109', N'Malloa', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06110', N'Mostazal', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06111', N'Olivar', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06112', N'Peumo', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06113', N'Pichidegua', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06114', N'Quinta de Tilcoco', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06115', N'Rengo', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06116', N'Requinoa', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06117', N'San Vicente', N'Cachapoal', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06201', N'Pichilemu', N'Cardenal Caro', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06202', N'La Estrella', N'Cardenal Caro', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06203', N'Litueche', N'Cardenal Caro', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06204', N'Marchihue', N'Cardenal Caro', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06205', N'Navidad', N'Cardenal Caro', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06206', N'Paredones', N'Cardenal Caro', 6, N'del Libertador Gral. Bernardo O''higgins')
GO
print 'Processed 100 total records'
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06301', N'San Fernando', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06302', N'Chépica', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06303', N'Chimbarongo', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06304', N'Lolol', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06305', N'Nancagua', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06306', N'Palmilla', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06307', N'Peralillo', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06308', N'Placilla', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06309', N'Pumanque', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'06310', N'Santa Cruz', N'Colchagua', 6, N'del Libertador Gral. Bernardo O''higgins')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07101', N'Talca', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07102', N'Constitución', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07103', N'Curepto', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07104', N'Empedrado', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07105', N'Maule', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07106', N'Pelarco', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07107', N'Pencahue', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07108', N'Río Claro', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07109', N'San Clemente', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07110', N'San Rafael', N'Talca', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07201', N'Cauquenes', N'Cauquenes', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07202', N'Chanco', N'Cauquenes', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07203', N'Pelluhue', N'Cauquenes', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07301', N'Curicó', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07302', N'Hualañé', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07303', N'Licantén', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07304', N'Molina', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07305', N'Rauco', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07306', N'Romeral', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07307', N'Sagrada Familia', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07308', N'Teno', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07309', N'Vichuquén', N'Curico', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07401', N'Linares', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07402', N'Colbún', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07403', N'Longaví', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07404', N'Parral', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07405', N'Retiro', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07406', N'San Javier', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07407', N'Villa Alegre', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'07408', N'Yerbas Buenas', N'Linares', 7, N'del Maule')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08101', N'Concepción', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08102', N'Coronel', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08103', N'Chiguayante', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08104', N'Florida', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08105', N'Hualqui', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08106', N'Lota', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08107', N'Penco', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08108', N'San Pedro De La Paz', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08109', N'Santa Juana', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08110', N'Talcahuano', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08111', N'Tomé', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08112', N'Hualpén', N'Concepcion', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08201', N'Lebu', N'Arauco', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08202', N'Arauco', N'Arauco', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08203', N'Cañete', N'Arauco', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08204', N'Contulmo', N'Arauco', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08205', N'Curanilahue', N'Arauco', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08206', N'Los Alamos', N'Arauco', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08207', N'Tirua', N'Arauco', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08301', N'Los Angeles', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08302', N'Antuco', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08303', N'Cabrero', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08304', N'Laja', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08305', N'Mulchén', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08306', N'Nacimiento', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08307', N'Negrete', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08308', N'Quilaco', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08309', N'Quilleco', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08310', N'San Rosendo', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08311', N'Santa Bárbara', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08312', N'Tucapel', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08313', N'Yumbel', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08314', N'Alto Biobío', N'Biobio', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08401', N'Chillán', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08402', N'Bulnes', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08403', N'Cobquecura', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08404', N'Coelemu', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08405', N'Coihueco', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08406', N'Chillán Viejo', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08407', N'El Carmen', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08408', N'Ninhue', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08409', N'Ñiquén', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08410', N'Pemuco', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08411', N'Pinto', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08412', N'Portezuelo', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08413', N'Quillón', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08414', N'Quirihue', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08415', N'Ranquil', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08416', N'San Carlos', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08417', N'San Fabián', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08418', N'San Ignacio', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08419', N'San Nicolás', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08420', N'Trehuaco', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'08421', N'Yungay', N'Ñuble', 8, N'del BioBio')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09101', N'Temuco', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09102', N'Carahue', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09103', N'Cunco', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09104', N'Curarrehue', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09105', N'Freire', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09106', N'Galvarino', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09107', N'Gorbea', N'Cautin', 9, N'de la Araucania')
GO
print 'Processed 200 total records'
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09108', N'Lautaro', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09109', N'Loncoche', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09110', N'Melipeuco', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09111', N'Nueva Imperial', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09112', N'Padre Las Casas', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09113', N'Perquenco', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09114', N'Pitrufquén', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09115', N'Pucón', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09116', N'Saavedra', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09117', N'Teodoro Schmidt', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09118', N'Toltén', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09119', N'Vilcún', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09120', N'Villarrica', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09121', N'Cholchol', N'Cautin', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09201', N'Angol', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09202', N'Collipulli', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09203', N'Curacautín', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09204', N'Ercilla', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09205', N'Lonquimay', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09206', N'Los Sauces', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09207', N'Lumaco', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09208', N'Purén', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09209', N'Renaico', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09210', N'Traiguén', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'09211', N'Victoria', N'Malleco', 9, N'de la Araucania')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10101', N'Puerto Montt', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10102', N'Calbuco', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10103', N'Cochamó', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10104', N'Fresia', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10105', N'Frutillar', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10106', N'Los Muermos', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10107', N'Llanquihue', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10108', N'Maullín', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10109', N'Puerto Varas', N'Llanquihue', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10201', N'Castro', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10202', N'Ancud', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10203', N'Chonchi', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10204', N'Curaco de Vélez', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10205', N'Dalcahue', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10206', N'Puqueldón', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10207', N'Queilén', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10208', N'Quellón', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10209', N'Quemchi', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10210', N'Quinchao', N'Chiloe', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10301', N'Osorno', N'Osorno', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10302', N'Puerto Octay', N'Osorno', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10303', N'Purranque', N'Osorno', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10304', N'Puyehue', N'Osorno', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10305', N'Río Negro', N'Osorno', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10306', N'San Juan de la Costa', N'Osorno', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10307', N'San Pablo', N'Osorno', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10401', N'Chaitén', N'Palena', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10402', N'Futaleufú', N'Palena', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10403', N'Hualaihue', N'Palena', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'10404', N'Palena', N'Palena', 10, N'de los Lagos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11101', N'Coihaique', N'Coihaique', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11102', N'Lago Verde', N'Coihaique', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11201', N'Aisén', N'Aisen', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11202', N'Cisnes', N'Aisen', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11203', N'Guaitecas', N'Aisen', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11301', N'Cochrane', N'Capitan Prat', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11302', N'Ohiggins', N'Capitan Prat', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11303', N'Tortel', N'Capitan Prat', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11401', N'Chile Chico', N'General Carrera', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'11402', N'Río Ibáñez', N'General Carrera', 11, N'Aysén del Gral. Carlos Ibáñez del Campo')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12101', N'Punta Arenas', N'Magallanes', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12102', N'Laguna Blanca', N'Magallanes', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12103', N'Río Verde', N'Magallanes', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12104', N'San Gregorio', N'Magallanes', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12201', N'Cabo de Hornos', N'Antartica Chilena', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12202', N'ANTÁRTICA', N'', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12301', N'Porvenir', N'Tierra del Fuego', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12302', N'Primavera', N'Tierra del Fuego', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12303', N'Timaukel', N'Tierra del Fuego', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12401', N'Natales', N'Ultima Esperanza', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'12402', N'Torres del Paine', N'Ultima Esperanza', 12, N'Magallanes')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13101', N'Santiago', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13102', N'Cerrillos', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13103', N'Cerro Navia', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13104', N'Conchalí', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13105', N'El Bosque', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13106', N'Estación Central', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13107', N'Huechuraba', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13108', N'Independencia', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13109', N'La Cisterna', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13110', N'La Florida', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13111', N'La Granja', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13112', N'La Pintana', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13113', N'La Reina', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13114', N'Las Condes', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13115', N'Lo Barnechea', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13116', N'Lo Espejo', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13117', N'Lo Prado', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13118', N'Macul', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13119', N'Maipú', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13120', N'Ñuñoa', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13121', N'Pedro Aguirre Cerda', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13122', N'Peñalolén', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13123', N'Providencia', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13124', N'Pudahuel', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13125', N'Quilicura', N'Santiago', 13, N'Metropolitana')
GO
print 'Processed 300 total records'
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13126', N'Quinta Normal', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13127', N'Recoleta', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13128', N'Renca', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13129', N'San Joaquín', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13130', N'San Miguel', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13131', N'San Ramón', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13132', N'Vitacura', N'Santiago', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13201', N'Puente Alto', N'Cordillera', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13202', N'Pirque', N'Cordillera', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13203', N'San José de Maipo', N'Cordillera', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13301', N'Colina', N'Chacabuco', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13302', N'Lampa', N'Chacabuco', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13303', N'Til til', N'Chacabuco', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13401', N'San Bernardo', N'Maipo', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13402', N'Buin', N'Maipo', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13403', N'Calera de Tango', N'Maipo', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13404', N'Paine', N'Maipo', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13501', N'Melipilla', N'Melipilla', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13502', N'Alhué', N'Melipilla', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13503', N'Curacaví', N'Melipilla', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13504', N'María Pinto', N'Melipilla', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13505', N'San Pedro', N'Melipilla', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13601', N'Talagante', N'Talagante', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13602', N'El Monte', N'Talagante', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13603', N'Isla de Maipo', N'Talagante', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13604', N'Padre Hurtado', N'Talagante', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'13605', N'Peñaflor', N'Talagante', 13, N'Metropolitana')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14101', N'Valdivia', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14102', N'Corral', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14103', N'Lanco', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14104', N'Los Lagos', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14105', N'Máfil', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14106', N'Mariquina', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14107', N'Paillaco', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14108', N'Panguipulli', N'Valdivia', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14201', N'La Unión', N'Ranco', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14202', N'Futrono', N'Ranco', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14203', N'Lago Ranco', N'Ranco', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'14204', N'Río Bueno', N'Ranco', 14, N'Los Ríos')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'15101', N'Arica', N'Arica', 15, N'Arica y Parinacota')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'15102', N'Camarones', N'Arica', 15, N'Arica y Parinacota')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'15201', N'Putre', N'Parinacota', 15, N'Arica y Parinacota')
INSERT [dbo].[GM_COMUNA] ([ID_COMUNA], [NOM_COMUNA], [NOM_PROVINCIA], [ID_REGION], [NOM_REGION]) VALUES (N'15202', N'General Lagos', N'Parinacota', 15, N'Arica y Parinacota')
/****** Object:  Table [dbo].[GM_CLIENTE]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_CLIENTE](
	[EMAIL] [varchar](80) NOT NULL,
	[NOMBRE] [varchar](120) NULL,
	[PATERNO] [varchar](50) NULL,
	[MATERNO] [varchar](50) NULL,
	[TELEFONO] [varchar](20) NULL,
	[CELULAR] [varchar](20) NULL,
	[FECHA_CREACION] [smalldatetime] NULL,
	[ID_USUARIO_CREACION] [int] NULL,
	[FECHA_MODIFICACION] [smalldatetime] NULL,
	[ID_USUARIO_MODIFICACION] [int] NULL,
 CONSTRAINT [PK_GM_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GM_CANAL]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_CANAL](
	[ID_CANAL] [int] NOT NULL,
	[CANAL] [varchar](100) NULL,
	[ACTIVO] [bit] NULL,
 CONSTRAINT [PK_GM_CANAL] PRIMARY KEY CLUSTERED 
(
	[ID_CANAL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GM_AREA]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_AREA](
	[ID_AREA] [int] NOT NULL,
	[AREA] [varchar](100) NULL,
	[ACTIVO] [bit] NULL,
 CONSTRAINT [PK_AREA] PRIMARY KEY CLUSTERED 
(
	[ID_AREA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GM_AREA] ([ID_AREA], [AREA], [ACTIVO]) VALUES (1, N'Electrico', 1)
INSERT [dbo].[GM_AREA] ([ID_AREA], [AREA], [ACTIVO]) VALUES (2, N'Sanitario', 1)
/****** Object:  UserDefinedFunction [dbo].[func_DifHoras]    Script Date: 07/23/2018 00:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- select dbo.[func_DifHoras]('18/02/2016 09:00:00','18/02/2016 15:00:00') 

create FUNCTION [dbo].[func_DifHoras](@StartDate DATETIME,@EndDate DATETIME) 
RETURNS MONEY 
AS 
Begin

--set datefirst 7
declare @RESULTADO MONEY
declare @sd datetime
declare @ed datetime
declare @i int

set @sd = @StartDate
set @ed = @EndDate

Set @i = datediff(second, @sd, convert(char(10), @sd, 126) +
'T18:00:00.000') + ((datediff(day, @sd, @ed) - 1) * (8 * 60 * 60)) +
datediff(second, convert(char(10), @ed, 126) + 'T09:00:00.000', @ed)
/*
select
@i as diferencia_en_segundos,
@i / 3600 as horas,
(@i % 3600) / 60 as minutos,
(@i % 3600) % 60 as segundos
*/

set @RESULTADO = @i / 3600

return (@RESULTADO) 
END


/*
SELECT @@DATEFIRST AS 'First Day'
    ,DATEPART(dw, SYSDATETIME()) AS 'Today';
    */
GO
/****** Object:  UserDefinedFunction [dbo].[fUltimoDiaHabil]    Script Date: 07/23/2018 00:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fUltimoDiaHabil] (@fecha datetime)
returns datetime
as
begin

DECLARE @fechaRetorno as datetime

set @fechaRetorno = (select case when datepart(dw, getdate()) = 6 then getdate()-1 when datepart(dw, getdate()) = 7 then getdate()-2 end as fecha)

return(@fechaRetorno)
end
GO
/****** Object:  UserDefinedFunction [dbo].[fBusinessDays]    Script Date: 07/23/2018 00:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fBusinessDays] (@start datetime, @end datetime)
returns int
as
begin
/*
Descripción:
Función diseñada para calcular los días LABORABLES entre 2 fechas
*/
DECLARE @wks as int, @LabDays as int -- Cálculo de Semanas

/*

Primero calculamos las semanas entre 2 fechas atendiendo a los siguientes casos:

F.Inicio en FinDe y F.Fin DIA.LAB -> Convertimos F.Inicio en DIA.LAB sumando 2 días y calculando el número de semanas
F.Inicio en DIA.LAB y F.Fin en FinDe -> Convertimos F.Fin en DIA.LAB restando 2 días y calculamos el número de semanas
F.Inicio y Fin en Find -> Convertimos F.Inicio y F.Fin en DIA.LAB restando 2 días y calculamos el número de semanas
Cualquier otro caso calculamos el número de semanas entre las fechas
*/

SET @wks = CASE
WHEN datepart( dw, @start) in (6,7) AND datepart( dw, @end)<6 THEN datediff( week, @start+2, @end)
WHEN datepart( dw, @start) < 6 AND datepart( dw, @end) in (6,7) THEN datediff( week, @start, @end-2)
WHEN datepart( dw, @start) in (6,7) AND datepart( dw, @end) in (6,7) THEN datediff( week, @start-2, @end-2)
ELSE
datediff( week, @start, @end)
END

/*

Primero calculamos el número de días DIA.LAB en función de los siguientes casos:

F.Inicio en FinDe y F.Fin DIA.LAB -> Total de semanas calculada * 5 + la distancia entre el lunes y F.Fin
F.Inicio en DIA.LAB y F.Fin en FinDe -> Total de semanas calculada * 5 + la distancia entre el sábado y F.Inicio
F.Inicio y Fin en Find -> Total semanas calculadas * 5 días
Cualquier otro caso calculamos el número de semanas entre las fechas
*/

 

SET @LabDays =
CASE
WHEN datepart( dw, @start) in (6,7) AND datepart( dw, @end) in (6,7) THEN @wks*5
WHEN datepart( dw, @start) in(6,7) AND datepart( dw, @end) < 6  THEN @wks*5 + datepart( dw, @end)
WHEN datepart( dw, @start) < 6 AND datepart( dw, @end) in (6,7) THEN @wks*5 + (6 - datepart( dw, @start))
ELSE
datediff( dd, @start, @end) - @wks*2 + 1
END

return( @LabDays)
end
GO
/****** Object:  UserDefinedFunction [dbo].[f_params_to_list]    Script Date: 07/23/2018 00:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[f_params_to_list] (@par VARCHAR(MAX))
returns @result TABLE (value VARCHAR(30))
AS  
begin
     DECLARE @TempList table
          (
          value VARCHAR(30)
          )

     DECLARE @Value varchar(30), @Pos int

     SET @par = LTRIM(RTRIM(@par))+ ','
     SET @Pos = CHARINDEX(',', @par, 1)

     IF REPLACE(@par, ',', '') <> ''
     BEGIN
          WHILE @Pos > 0
          BEGIN
               SET @Value = LTRIM(RTRIM(LEFT(@par, @Pos - 1)))
               IF @Value <> ''
               BEGIN
                    INSERT INTO @TempList (value) VALUES (@Value) 
               END
               SET @par = RIGHT(@par, LEN(@par) - @Pos)
               SET @Pos = CHARINDEX(',', @par, 1)

          END
     END    
     INSERT @result
     SELECT value 
        FROM @TempList
     RETURN
END
GO
/****** Object:  Table [dbo].[GM_SUCURSAL]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_SUCURSAL](
	[ID_SUCURSAL] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_SUCURSAL] [varchar](50) NULL,
	[ACTIVO] [int] NULL,
	[ID_COMUNA] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GM_SUCURSAL] ON
INSERT [dbo].[GM_SUCURSAL] ([ID_SUCURSAL], [NOMBRE_SUCURSAL], [ACTIVO], [ID_COMUNA]) VALUES (1, N'CENTRAL', 1, NULL)
INSERT [dbo].[GM_SUCURSAL] ([ID_SUCURSAL], [NOMBRE_SUCURSAL], [ACTIVO], [ID_COMUNA]) VALUES (2, N'RM', 1, NULL)
INSERT [dbo].[GM_SUCURSAL] ([ID_SUCURSAL], [NOMBRE_SUCURSAL], [ACTIVO], [ID_COMUNA]) VALUES (3, N'VINA', 1, NULL)
SET IDENTITY_INSERT [dbo].[GM_SUCURSAL] OFF
/****** Object:  Table [dbo].[GM_PERFIL]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_PERFIL](
	[ID_PERFIL] [int] IDENTITY(1,1) NOT NULL,
	[NOM_PERFIL] [varchar](100) NULL,
	[VER_TODOS] [tinyint] NULL,
 CONSTRAINT [PK_GM_PERFIL] PRIMARY KEY CLUSTERED 
(
	[ID_PERFIL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GM_PERFIL] ON
INSERT [dbo].[GM_PERFIL] ([ID_PERFIL], [NOM_PERFIL], [VER_TODOS]) VALUES (1, N'Administrador', NULL)
INSERT [dbo].[GM_PERFIL] ([ID_PERFIL], [NOM_PERFIL], [VER_TODOS]) VALUES (2, N'Técnico', NULL)
INSERT [dbo].[GM_PERFIL] ([ID_PERFIL], [NOM_PERFIL], [VER_TODOS]) VALUES (3, N'Planificador ', NULL)
INSERT [dbo].[GM_PERFIL] ([ID_PERFIL], [NOM_PERFIL], [VER_TODOS]) VALUES (4, N'Cliente', NULL)
INSERT [dbo].[GM_PERFIL] ([ID_PERFIL], [NOM_PERFIL], [VER_TODOS]) VALUES (5, N'Supervisor', NULL)
INSERT [dbo].[GM_PERFIL] ([ID_PERFIL], [NOM_PERFIL], [VER_TODOS]) VALUES (6, N'Administrador de contrato', NULL)
SET IDENTITY_INSERT [dbo].[GM_PERFIL] OFF
/****** Object:  Table [dbo].[GM_PARAMETROS]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_PARAMETROS](
	[ID_PARAMETRO] [int] NOT NULL,
	[EMAIL_CC] [varchar](200) NULL,
	[NOMBRE_CAMPO1] [varchar](25) NULL,
	[NOMBRE_CAMPO2] [varchar](25) NULL,
	[NOMBRE_CAMPO3] [varchar](25) NULL,
	[NOMBRE_CAMPO4] [varchar](25) NULL,
	[NOMBRE_CAMPO5] [varchar](25) NULL,
	[GESTION_ADJUNTO] [tinyint] NULL,
	[CON_CONTACTOS] [tinyint] NULL,
	[ENCUESTA_LOCAL_DIAS] [int] NULL,
 CONSTRAINT [PK_GM_PARAMETROS] PRIMARY KEY CLUSTERED 
(
	[ID_PARAMETRO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[stp_EliminarGestion]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EliminarGestion]
(@idGestion varchar(10))
as begin

	delete from GM_GESTIONES where id_gestion=@idGestion
	--select * from GM_GESTIONES
end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarContacto]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarContacto]
  (@nomContacto varchar(80),@rutCliente varchar(12),
  @email1 varchar(80),@email2 varchar(80),@celular varchar(9),
  @telefono1 varchar(20),@telefono2 varchar(20))
  as begin
  
  insert into dbo.GM_CLIENTE_CONTACTO(NOM_CONTACTO,RUT_CLIENTE,EMAIL_1,EMAIL_2,CELULAR,
  TELEFONO1,TELEFONO2)
  VALUES(@nomContacto,@rutCliente,@email1,@email2,@celular,@telefono1,@telefono2)
  
  
  end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarGestionCliente]    Script Date: 07/23/2018 00:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarGestionCliente]
  (@idGestion int, @nombre varchar(50), @email varchar(50), @telefono varchar(20),@ip varchar(20))
  as begin

	update [dbo].[GM_GESTIONES]
	set CI_NOMBRE=@nombre,CI_EMAIL=@email,CI_TELEFONO=@telefono,CI_IP=''
	where ID_GESTION=@idGestion

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarGestion]    Script Date: 07/23/2018 00:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarGestion]
(@idGestion varchar(20),@idUsuario varchar(10),@idCampo1 varchar(10),@idCampo2 varchar(10),
@idCampo3 varchar(10),@idCampo4 varchar(10),@idCampo5 varchar(10),
@textoCampo1 varchar(100),@textoCampo2 varchar(100),@textoCampo3 varchar(100),
@textoCampo4 varchar(100),@textoCampo5 varchar(100),
@observacion varchar(500),@telefonoAsociado varchar(20),@idCanal varchar(10),
@ruta varchar(250),@fechaAgend varchar(15),@tipo varchar(1),
@llamadoID varchar(20),@llamadoRut varchar(20),@idTicketInsistencia varchar(10),
@idEmpresa varchar(10),@usuarioFirma varchar(100),
@rutCliente varchar(12),@idTipificacion varchar(10),@nivel1 varchar(20),@tipoCliente char(1))
as begin


update GM_GESTIONES
set ID_USUARIO=@idUsuario,ID_CAMPO1=@idCampo1,ID_CAMPO2=@idCampo2,
ID_CAMPO3=@idCampo3,ID_CAMPO4=@idCampo4,ID_CAMPO5=@idCampo5,TEXTO_CAMPO1=@textoCampo2,
TEXTO_CAMPO3=@textoCampo3,TEXTO_CAMPO4=@textoCampo4,TEXTO_CAMPO5=@textoCampo5,
OBSERVACION=@observacion,TELEFONO_ASOCIADO=@telefonoAsociado,ID_CANAL=@idCanal,
RUTA_ARCHIVO=@ruta,FECHA_AGEND=@fechaAgend,TIPO=@tipo,LLAMADO_ID=@llamadoID,
LLAMADO_RUT=@llamadoRut,FECHA_LLAMADA=GETDATE(),ID_TICKET_INSISTENCIA=@idTicketInsistencia,
ID_EMPRESA=@idEmpresa,USUARIO=@usuarioFirma,RUT_CLIENTE=@rutCliente,
ID_TIPIFICACION=@idTipificacion,NIVEL_1 = @nivel1, TIPO_CLIENTE=@tipoCliente
where ID_GESTION=@idGestion

end

--select * from GM_GESTIONES
--select * from gm_atencion
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarGestionRutaArchivo]    Script Date: 07/23/2018 00:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarGestionRutaArchivo]
(@idGestion varchar(10),@ruta varchar(250))
as begin

update GM_GESTIONES
set RUTA_ARCHIVO=@ruta
where id_gestion=@idGestion

--if @ruta <> ''
--begin

--update GM_GESTIONES
--set ruta=@ruta
--where id_gestion=@idGestion

--end


--if @ruta2 <> ''
--begin

--update GM_GESTIONES
--set RUTA2=@ruta2
--where id_gestion=@idGestion

--end

--if @ruta3 <> ''
--begin

--update GM_GESTIONES
--set RUTA3=@ruta3
--where id_gestion=@idGestion

--end

end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresoGestionInicial]    Script Date: 07/23/2018 00:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresoGestionInicial]
(@idUsuario varchar(10),@telefonoAsociado varchar(20),
@llamadoId varchar(100),@llamadorRut varchar(20),
@llamadoParam1 varchar(20),@llamadoParam2 varchar(20))
as begin

insert into dbo.GM_GESTIONES(ID_USUARIO,TELEFONO_ASOCIADO,LLAMADO_ID,
LLAMADO_RUT,LLAMADO_PARAM1,LLAMADO_PARAM2,FECHA_LLAMADA,FECHA_INGRESO)
values(@idUsuario,@telefonoAsociado,@llamadoId,@llamadorRut,@llamadoParam1,@llamadoParam2,getdate(),getdate())

select MAX(id_gestion) as id_gestion from dbo.GM_GESTIONES where ID_USUARIO=@idUsuario

end
GO
/****** Object:  Table [dbo].[TEMPO_1]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMPO_1](
	[FECHA] [tinyint] NULL,
	[FECHA_COMPLETA] [smalldatetime] NULL,
	[GESTIONES] [int] NULL,
	[ID_ESTATUS] [tinyint] NULL,
	[ESTATUS] [varchar](30) NULL,
	[TIPO] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[stp_UpLocalidad]    Script Date: 07/23/2018 00:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_UpLocalidad](@id int, @nombre varchar(100), @activo int)
  as begin

	update gm_localidad
	set [NOMBRE_LOCALIDAD]=@nombre, [ACTIVO]=@activo
	where [ID_LOCALIDAD]=@id

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_UpFeriado]    Script Date: 07/23/2018 00:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_UpFeriado]
 (@idFeriado int, @fecha varchar(10), @activo int)
 as begin

 update [dbo].[GM_FERIADOS]
 set [FERIADO]=@fecha,[ACTIVO]=@activo
 where [ID_FERIADO]=@idFeriado
 end
GO
/****** Object:  StoredProcedure [dbo].[stp_DelLocalidad]    Script Date: 07/23/2018 00:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_DelLocalidad](@id int)
  as begin

	delete from GM_LOCALIDAD
	where ID_LOCALIDAD=@id

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarCliente]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarCliente]
(@email varchar(80),@nombre varchar(120),@paterno varchar(50),
@materno varchar(50),@telefono varchar(20),@celular varchar(20),
@idUsuarioCreacion int)
as begin

if not exists (select * from gm_cliente where email = @email)
begin

insert into gm_cliente(EMAIL,NOMBRE,PATERNO,MATERNO,TELEFONO,CELULAR,
FECHA_CREACION,ID_USUARIO_CREACION)
values(@email,@nombre,@paterno,@materno,@telefono,@celular,getdate(),@idUsuarioCreacion)

end
else begin

update gm_cliente
set NOMBRE=@nombre, paterno=@paterno, materno=@materno, telefono=@telefono,
celular=@celular,fecha_modificacion=GETDATE(),id_usuario_modificacion=@idUsuarioCreacion
where email=@email

end
end
GO
/****** Object:  StoredProcedure [dbo].[stp_ingresarLocalidad]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_ingresarLocalidad](@nombre varchar(100),@activo int)
  as begin

  if not exists(select * from gm_localidad where [NOMBRE_LOCALIDAD]=@nombre)
  begin

	insert into gm_localidad
	([NOMBRE_LOCALIDAD],[ACTIVO])
	values(@nombre,@activo)

	select '0' existe

  end else
  begin

	select '1' existe
	end
  end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarFeriado]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarFeriado]
 (@feriadoFecha varchar(10),@activo int)
 as begin

 insert into GM_FERIADOS(FERIADO,ACTIVO)
 values(@feriadoFecha,@activo)

 end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarParametro]    Script Date: 07/23/2018 00:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarParametro]
(
@idParametro varchar(10),
@emailCC varchar(200),
@nombreCampo1 varchar(25),
@nombreCampo2 varchar(25),
@nombreCampo3 varchar(25),
@nombreCampo4 varchar(25),
@nombreCampo5 varchar(25),
@gestionAdjunto varchar(1)
)
as begin

update GM_PARAMETROS
set EMAIL_CC=@emailCC,NOMBRE_CAMPO1=@nombreCampo1,NOMBRE_CAMPO2=@nombreCampo2,
NOMBRE_CAMPO3=@nombreCampo3,NOMBRE_CAMPO4=@nombreCampo4,NOMBRE_CAMPO5=@nombreCampo5,
GESTION_ADJUNTO=@gestionAdjunto
WHERE ID_PARAMETRO=@idParametro

end
GO
/****** Object:  StoredProcedure [dbo].[stp_EliminarFeriado]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EliminarFeriado]
 (@idFeriado int)
 as begin

 delete from [dbo].[GM_FERIADOS]
 where ID_FERIADO=@idFeriado

 end
GO
/****** Object:  Table [dbo].[GM_MOTIVO_CIERRE]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_MOTIVO_CIERRE](
	[ID_MOTIVO_CIERRE] [int] IDENTITY(1,1) NOT NULL,
	[NOM_MOTIVO_CIERRE] [varchar](100) NULL,
	[ID_TIPO_MOTIVO_CIERRE] [int] NULL,
	[ACTIVO] [tinyint] NULL,
 CONSTRAINT [PK_GM_MOTIVO_CIERRE] PRIMARY KEY CLUSTERED 
(
	[ID_MOTIVO_CIERRE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[diferenciaHoraLabFeb]    Script Date: 07/23/2018 00:51:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[diferenciaHoraLabFeb]
( 
@fInicio smalldatetime, 
@fFin smalldatetime 
) 
RETURNS int 
AS 
BEGIN 
declare @noHoras int 
declare @cuentaLab int 
declare @contador int 
select @noHoras = dateDiff(hour, @fInicio, @fFin) 
select @cuentaLab = 0 
select @contador = 0 

while(@contador < @noHoras) 
begin 
declare @diaSemana int 
declare @hora int
declare @fecha datetime
select @diaSemana = datePart(weekDay, dateAdd("hh", @contador, @fInicio)) 
select @hora = datePart(hh, dateAdd("hh", @contador, @fInicio))
select @fecha = dateAdd("hh", @contador, @fInicio)
if (/*@diaSemana <> 6 and*/ @diaSemana <> 7 and @hora >= 9 and @hora < 18 and convert(varchar(10),@fecha,103) not in (select FERIADO from GM_FERIADOS where ACTIVO=1)) 
begin 
select @cuentaLab = @cuentaLab + 1 
end 
select @contador = @contador + 1 
end

RETURN @cuentaLab 
END
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarTipoMotivoCierre]    Script Date: 07/23/2018 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarTipoMotivoCierre]
  as begin

  select * from GM_TIPO_MOTIVO_CIERRE

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarSucursal]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_BuscarSucursal](@activo int)
as begin

select * from GM_SUCURSAL s
where (@activo is null) or (s.ACTIVO=@activo)

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarHistorialSernac]    Script Date: 07/23/2018 00:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarHistorialSernac](@rut varchar(15))
  as begin

  select *
  from GM_HISTORIAL_SERNAC
  where RUT=@rut

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarPerfil]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarPerfil]
(@nombre varchar(100))
as begin

select * from GM_PERFIL

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarParametro]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarParametro](@idParametro varchar(10))
as begin

SELECT * FROM GM_PARAMETROS
WHERE ID_PARAMETRO=@idParametro

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarLocalidad]    Script Date: 07/23/2018 00:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarLocalidad](@activo int)
  as begin

  select *, case when activo = 1 then 'Si' else 'No' end as Activo2
  from gm_localidad
  where (@activo is null) or (activo = @activo)

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarFeriado]    Script Date: 07/23/2018 00:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarFeriado]
 (@activo int
 )
 as begin

 select *, case when activo = 1 then 'Si' else 'No' end as activo2  from GM_FERIADOS
 where (@activo is null) or (activo = @activo)

 end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarEstadoAtencion]    Script Date: 07/23/2018 00:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarEstadoAtencion]
as begin

select * from dbo.GM_ESTADO_ATENCION

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarEmpresa]    Script Date: 07/23/2018 00:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarEmpresa]
(@idEmpresa varchar(10))
as begin

select * 
from GM_EMPRESA e
where ((@idEmpresa is null) or (e.ID_EMPRESA = @idEmpresa))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarComuna]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarComuna]
(@nombre varchar(30))
as begin

select * from GM_COMUNA
where ((@nombre is null) or NOM_COMUNA like ('%' + @nombre + '%'))

end


--stp_BuscarComuna ''
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarClientePorEmail]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarClientePorEmail]
(@email varchar(80))
as begin

select * 
from gm_cliente
where EMAIL=@email

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarCaseMaker]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarCaseMaker](@rutCliente varchar(15))
as begin

select * from case_maker
where cast(rut_cliente as varchar(13))+'-'+dv_cliente=@rutCliente

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarCanalPorTipoCliente]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarCanalPorTipoCliente]

as begin

select * 
from gm_canal c
where activo = 1

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarCanal]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarCanal]
(@nombre varchar(50))
as begin

select * from gm_canal
where activo = 1 and ((@nombre is null) or (CANAL LIKE '%' + @nombre + '%'))


end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarArea]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarArea]
as begin

select * from gm_area

end
GO
/****** Object:  StoredProcedure [dbo].[proc_CargaTempo]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [proc_CargaTempo] 0
CREATE procedure [dbo].[proc_CargaTempo]
(
@intRegProc as integer
)

AS

SET NOCOUNT ON;

DECLARE @contador int
DECLARE @intCuantosDeudor int

DECLARE @strNombreArchivo varchar(60)
DECLARE @strTipoArchivo varchar(15)

DECLARE @intCuantosCuota int
DECLARE @strRutDeudor varchar(12)
DECLARE @fuente varchar(255)
DECLARE @strFechaHoy varchar(25)
DECLARE @strMsgError varchar(70)
DECLARE @strSql varchar(250)
DECLARE @BulkFile varchar(120)

---truncate table CONSOLIDADO_TEMPO


--SET @BulkFile = 'G:\Clientes\Activos\Costanera Norte\Cargas\PRIMERA\CARGA_DEUDA_JUD2.CSV'

---select @strNombreArchivo = nombre_archivo from carga_Archivos 
---where nombre_archivo like 'DOCUMENTOS%' and fecha_proceso is null 

set @strNombreArchivo = 'exporte_escalamiento.csv'
print @strNombreArchivo

SET @BulkFile = 'E:\Clientes\Matikard\' + @strNombreArchivo

	select @strFechaHoy =  replace(replace(replace(replace(convert(varchar(20),getdate(),21),'-',''),':',''),' ',''),'.','')

print @intRegProc

if @intRegProc = 0
	begin
		---print 'hola'
		---print @BulkFile
		TRUNCATE TABLE dbo.CONSOLIDADO_TEMPO
		SET @strSQL = 'BULK INSERT CONSOLIDADO_TEMPO FROM ''' + @BulkFile + '''' + ' with ( fieldterminator ='';'' , ROWTERMINATOR = ''\n'', FIRSTROW = 2 ,CODEPAGE = ''ACP'')'
		---print 'strSQL='
		---print @strSQL
		EXEC(@strSQL)
	end
	

select 'CARGA OK' as RESULTADO

select * from CONSOLIDADO_TEMPO
GO
/****** Object:  Table [dbo].[GM_ZONA]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_ZONA](
	[ID_ZONA] [int] NOT NULL,
	[NOMBRE_ZONA] [varchar](150) NULL,
	[ID_COMUNA] [varchar](10) NULL,
	[ACTIVO] [int] NULL,
 CONSTRAINT [PK_GM_ZONA] PRIMARY KEY CLUSTERED 
(
	[ID_ZONA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (1, N'Arica', N'15101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (2, N'Iquique', N'01101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (3, N'Antofagasta', N'02101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (4, N'Calama', N'02201', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (5, N'Copiapo', N'03101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (6, N'La Serena', N'04101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (7, N'Coquimbo', N'04102', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (8, N'Rancagua', N'06101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (9, N'Curico/Talca', N'07101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (10, N'Talca/Linares', N'07401', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (11, N'Chillan', N'08401', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (12, N'Concepcion 1', N'08101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (13, N'Concepcion 2', N'08101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (14, N'Temuco', N'09101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (15, N'Osorno/Valdivia', N'10301', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (16, N'Puerto Montt', N'10101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (17, N'Viña', N'05109', 1)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (18, N'Valparaiso', N'05101', 1)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (19, N'Quilpue', N'05106', 1)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (20, N'Quillota', N'05501', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (21, N'Los Andes/San Felipe', N'05301', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (22, N'Estacion Central', N'13106', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (23, N'Centro Centro', N'13101', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (24, N'Pudahuel', N'13124', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (25, N'Quilicura/Chicureo', N'13125', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (26, N'Melipilla/Talagante', N'13501', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (27, N'Cerrillos', N'13102', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (28, N'Maipu', N'13119', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (29, N'San Bernardo', N'13401', 1)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (30, N'La Florida', N'13110', 1)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (31, N'Puente Alto', N'13201', 1)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (32, N'Peñalolen', N'13122', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (33, N'Bilbao', N'13123', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (34, N'Providencia', N'13123', 0)
INSERT [dbo].[GM_ZONA] ([ID_ZONA], [NOMBRE_ZONA], [ID_COMUNA], [ACTIVO]) VALUES (35, N'Las Condes', N'13114', 0)
/****** Object:  Table [dbo].[GM_USUARIO]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_USUARIO](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](100) NULL,
	[CONTRASENA] [varchar](100) NULL,
	[EMAIL] [varchar](100) NULL,
	[PERFIL] [varchar](50) NULL,
	[NOMBRE] [varchar](200) NULL,
	[ACTIVO] [bit] NULL,
	[ID_PERFIL] [int] NULL,
	[RUTA_FOTO] [varchar](250) NULL,
	[ID_EMPRESA] [int] NULL,
	[ID_AREA] [int] NULL,
	[ID_SUCURSAL] [int] NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GM_USUARIO] ON
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (1, N'LDIAZ', N'LDIAZ', N'ldiaz@interweb.cl', N'Admin', N'LEONARDO DIAZ', 1, 1, N'assets/img/Perfil_1_16394005-1_Leonardo.png', 1, 0, 1)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (3, N'planificador', N'planificador', N'ldiaz@interweb.cl', NULL, N'Programador', 0, 3, NULL, 1, 0, 1)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (6, N'GRODRIGUEZ', N'GRODRIGUEZ', N'grodriguez@tagor.cl', NULL, N'GUILLERMO RODRIGUEZ', 1, 3, NULL, 1, 0, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (7, N'JRUBILAR', N'JRUBILAR', N'JRUBULAR@TAGOR.CL', NULL, N'JOHN RUBILAR', 1, 5, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (8, N'SGARCIA', N'SGARCIA', N'SE.GARCIA405@GMAIL.COM', NULL, N'SERGIO GARCIA', 1, 5, NULL, 1, 1, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (9, N'VREYES', N'VREYES', N'VREYES@TAGOR.CL', NULL, N'VICTOR REYES', 1, 5, NULL, 1, 2, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (10, N'ACORTES', N'ACORTES', N'ACORTES@TAGOR.CL', NULL, N'ALEXIS CORTES', 1, 5, NULL, 1, 2, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (11, N'JMATURANA', N'JMATURANA', N'ldiaz@getsoft.cl', NULL, N'JOSE LUIS MATURANA', 0, 4, NULL, 1, 0, 1)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (12, N'PNAVARRO', N'PNAVARRO', N'ldiaz@getsoft.cl', NULL, N'PABLO NAVARRO', 0, 4, NULL, 1, 0, 1)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (13, N'LMUNOZ', N'LMUNOZ', N'ldiaz@getsoft.cl', NULL, N'LUIS MUNOZ', 0, 4, NULL, 1, 0, 1)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (14, N'GORELLANA', N'GORELLANA', N'GORELLANA@TAGOR.CL', NULL, N'GABRIEL ORELLANA', 1, 3, NULL, 1, 0, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (15, N'ODIAZ', N'ODIAZ', N'odiaz@tagor.cl', NULL, N'OMAR DIAZ', 1, 1, NULL, 1, 0, 1)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (16, N'RSALAS', N'RSALAS', N'RSALAS@TAGOR.CL', NULL, N'RODOLFO SALAS', 1, 6, NULL, 1, 0, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (17, N'FDOREN', N'FDOREN', N'felipe.doren@gmail.com', NULL, N'FELIPE DOREN', 1, 2, NULL, 1, 1, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (18, N'ACARUSO', N'ACARUSO', N'ACARUSO@TAGOR.CL', NULL, N'ANGEL CARUSO', 1, 2, NULL, 1, 0, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (19, N'RCLARK', N'RCLARK', N'RONALDCLARKDIAZ@GMAIL.COM', NULL, N'RONALD CLARK DIAZ', 1, 2, NULL, 1, 2, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (20, N'CHIDALGO', N'CHIDALGO', N'HIDALGOCESAR31@GMAIL.COM', NULL, N'CESAR HIDALGO', 1, 2, NULL, 1, 1, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (21, N'JULLOA', N'JULLOA', N'JORDAN.ULLOA22@GMAIL.COM', NULL, N'JORDAN ULLOA', 1, 2, NULL, 1, 1, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (22, N'MROJAS', N'MROJAS', N'MANU-RO62@HOTMAIL.COM', NULL, N'MANUEL ROJAS', 1, 2, NULL, 1, 2, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (23, N'MVELOZO', N'MVELOZO', N'MARIOVELOZOM@HOTMAIL.COM', NULL, N'MARIO VELOZO', 1, 2, NULL, 1, 1, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (24, N'ZARIAS', N'ZARIAS', N'ZAMIR.ARIASC@GMAIL.COM', NULL, N'ZAMIR ARIAS', 1, 2, NULL, 1, 2, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (25, N'YORELLANA', N'YORELLANA', N'Y.ORELLANA.TRABUCCO@OUTLOOK.COM', NULL, N'YERKO ORELLANA', 1, 2, NULL, 1, 1, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (26, N'GNUNEZ', N'GNUNEZ', N'GABO.ALFADRACONI28@HOTMAIL.COM', NULL, N'GABRIEL NUNEZ', 1, 2, NULL, 1, 2, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (27, N'FLARA', N'FLARA', N'PANXOXINITOS@GMAIL.COM', NULL, N'FRANCISCO LARA', 1, 2, NULL, 1, 1, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (28, N'DJARA', N'DJARA', N'DIEGOJARA3009@GMAIL.COM', NULL, N'DAVID JARA', 1, 2, NULL, 1, 2, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (29, N'JCARRASCO', N'mateo2015', N'JMKITCORP@HOTMAIL.COM', NULL, N'JOSE MIGUEL CARRASCO CARREÑO', 1, 2, NULL, 1, 2, 2)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (30, N'ACANCINO', N'ACANCINO', N'AARONANDRES.CANCINO@GMAIL.COM', NULL, N'AARON CANCINO', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (31, N'JDroguett', N'Jonathan Droguett', N'JONATHAN.DROGUETT@LIVE.COM', NULL, N'Jonathan Droguett', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (32, N'CAROS', N'CAROS', N'TEC.ELECTRICO_AROS@HOTMAIL.COM', NULL, N'CRISTIAN AROS', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (33, N'JESPINOZA', N'JESPINOZA', N'JONASEBASTIANE@HOTMAIL.COM', NULL, N'JONATHAN ESPINOZA', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (34, N'MOPAZO', N'MOPAZO', N'MAECKOL.OPAZO@GMAIL.COM', NULL, N'MAECKOL OPAZO', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (35, N'JFLORES', N'JFLORES', N'SLIPJOSE@HOTMAIL.COM', NULL, N'JOSE FLORES', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (36, N'KPEREZ', N'KPEREZ', N'KEVINSEBASTIAN.PZ@GMAIL.COM', NULL, N'KEVIN PEREZ', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (37, N'JPACHECO', N'JPACHECO', N'JUAN.PACHECOHUERTA.2016@GMAIL.COM', NULL, N'JUAN PACHECO', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (38, N'BSEPULVEDA', N'BSEPULVEDA', N'BASTIANSEPULVEDA1995@GMAIL.COM', NULL, N'BASTIAN SEPULVEDA', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (39, N'RNIETO', N'RNIETO', N'RICARDOIGNACIO.N@GMAIL.COM', NULL, N'RICARDO NIETO', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (40, N'RSILVA', N'RSILVA', N'RAFAELSG93@GMAIL.COM', NULL, N'RAFAEL SILVA', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (41, N'JZAMORA', N'JZAMORA', N'JAVIER.ZAMORA.SALVA@GMAIL.COM', NULL, N'JAVIER ZAMORA', 1, 2, NULL, 1, 1, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (42, N'CGUASH', N'CGUASH', N'lapy1611@gmail.com', NULL, N'CRISTIAN GUASH', 1, 2, NULL, 1, 2, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (43, N'ACAMPOS', N'ACAMPOS', N'ldiaz@getsoft.cl', NULL, N'ANTONIO CAMPOS', 1, 2, NULL, 1, 2, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (44, N'JMANCILLA', N'JMANCILLA', N'jaimemancilla1966@gmail.com', NULL, N'JAIME MANCILLA', 1, 2, NULL, 1, 2, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (45, N'ECISTERNAS', N'ECISTERNAS', N'enriquecisternascontreras@gmail.com', NULL, N'ENRIQUE CISTERNAS', 1, 2, NULL, 1, 2, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (46, N'RMANZANO', N'RMANZANO', N'rmanzano@tagor.cl', NULL, N'ROSA MANZANO', 1, 6, NULL, 1, 0, 3)
INSERT [dbo].[GM_USUARIO] ([ID_USUARIO], [USUARIO], [CONTRASENA], [EMAIL], [PERFIL], [NOMBRE], [ACTIVO], [ID_PERFIL], [RUTA_FOTO], [ID_EMPRESA], [ID_AREA], [ID_SUCURSAL]) VALUES (47, N'VCHAURA', N'VCHAURA', N'VCHAURA@TAGOR.CL', NULL, N'VICTOR CHAURA', 1, 1, NULL, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[GM_USUARIO] OFF
/****** Object:  Table [dbo].[GM_TIPIFICACION]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_TIPIFICACION](
	[ID_TIPIFICACION] [int] IDENTITY(1,1) NOT NULL,
	[ID_EMPRESA] [int] NULL,
	[CLASE] [varchar](15) NULL,
	[ID_AREA] [int] NULL,
	[NIVEL_1] [varchar](100) NULL,
	[NIVEL_2] [varchar](100) NULL,
	[NIVEL_3] [varchar](100) NULL,
	[NIVEL_4] [varchar](100) NULL,
	[NIVEL_5] [varchar](100) NULL,
	[INSISTENCIA] [tinyint] NULL,
	[ACTIVO] [tinyint] NULL,
	[AGENDAMIENTO] [tinyint] NULL,
	[DERIVA] [tinyint] NULL,
	[ID_USUARIO_ESC_N1] [int] NULL,
	[ID_USUARIO_ESC_N2] [int] NULL,
	[ID_USUARIO_ESC_N3] [int] NULL,
	[ID_USUARIO_ESC_N4] [int] NULL,
	[SLA_N1] [int] NULL,
	[SLA_N2] [int] NULL,
	[SLA_N3] [int] NULL,
	[SLA_N4] [int] NULL,
	[TIPO] [char](1) NULL,
	[ID_TIPO_MOTIVO_CIERRE] [int] NULL,
	[VISIBLE_CLI_INTERNO] [tinyint] NULL,
	[VISIBLE_CLI_EXTERNO] [tinyint] NULL,
	[FECHA_MODIFICACION] [datetime] NULL,
	[DETENIDO] [tinyint] NULL,
	[IdIVR] [int] NULL,
	[TIPIFICACION_IVR] [varchar](5) NULL,
 CONSTRAINT [PK_GM_TIPIFICACION] PRIMARY KEY CLUSTERED 
(
	[ID_TIPIFICACION] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GM_TIPIFICACION] ON
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (177, 1, N'P', 1, N'TABLEROS', N'Reapriete de terminales', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 1, NULL, NULL, NULL, N'D', NULL, NULL, NULL, CAST(0x0000A90E00BC6F3B AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (178, 1, N'P', 1, N'TABLEROS', N'Chequear funcionamiento instrumentos (amp./volt)', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 1, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (179, 1, N'P', 1, N'TABLEROS', N'Chequeo luces pilotos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 2, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (180, 1, N'P', 1, N'TABLEROS', N'Revisión aislación conductores', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 3, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (181, 1, N'P', 1, N'TABLEROS', N'Efectuar limpieza interior tableros', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 4, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (182, 1, N'P', 1, N'TABLEROS', N'Revision contactos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 5, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (183, 1, N'P', 1, N'TABLEROS', N'Medicion parametros de Corrientes y Voltajes grales.', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 6, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (184, 1, N'P', 1, N'TABLEROS', N'Medición Termografica', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 7, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (185, 1, N'P', 1, N'ALUMBRADO', N'Chequear Lampisteria', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 8, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (186, 1, N'P', 1, N'ALUMBRADO', N'Chequear Ballast electronicos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 9, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (187, 1, N'P', 1, N'ALUMBRADO', N'Chequeo de Funcionamiento general', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 10, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (188, 1, N'P', 1, N'ENCHUFES', N'Revision modulos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 11, NULL, NULL, NULL, N'D', NULL, NULL, NULL, CAST(0x0000A8F500F61B05 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (189, 1, N'P', 1, N'ENCHUFES', N'Medicion voltajes entre fase-neutro y neutro-tierra', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 12, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (190, 1, N'P', 1, N'ENCHUFES', N'Rev. General Ench. Monofasicos y trifasicos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 13, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (191, 1, N'P', 1, N'CIRCUITOS', N'Chequeo estado de circuitos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, 14, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (192, 1, N'P', 1, N'CIRCUITOS', N'Revisar operación ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (193, 1, N'P', 1, N'CIRCUITOS', N'Revisar conexionado ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (194, 1, N'P', 1, N'CANALIZACIONES', N'Rev. Estado de E.P.C', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (195, 1, N'P', 1, N'CANALIZACIONES', N'Chequeo de can. PVC', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (196, 1, N'C', 1, N'TABLEROS', N'Reapriete de terminales', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (197, 1, N'C', 1, N'TABLEROS', N'Chequear funcionamiento instrumentos (amp./volt)', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (198, 1, N'C', 1, N'TABLEROS', N'Chequeo luces pilotos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (199, 1, N'C', 1, N'TABLEROS', N'Revisión aislación conductores', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (200, 1, N'C', 1, N'TABLEROS', N'Efectuar limpieza interior tableros', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (201, 1, N'C', 1, N'TABLEROS', N'Revision contactos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (202, 1, N'C', 1, N'TABLEROS', N'Medicion parametros de Corrientes y Voltajes grales.', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (203, 1, N'C', 1, N'TABLEROS', N'Medición Termografica', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (204, 1, N'C', 1, N'ALUMBRADO', N'Chequear Lampisteria', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (205, 1, N'C', 1, N'ALUMBRADO', N'Chequear Ballast electronicos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (206, 1, N'C', 1, N'ALUMBRADO', N'Chequeo de Funcionamiento general', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (207, 1, N'C', 1, N'ENCHUFES', N'Revision modulos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (208, 1, N'C', 1, N'ENCHUFES', N'Medicion voltajes entre fase-neutro y neutro-tierra', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (209, 1, N'C', 1, N'ENCHUFES', N'Rev. General Ench. Monofasicos y trifasicos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (210, 1, N'C', 1, N'CIRCUITOS', N'Chequeo estado de circuitos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (211, 1, N'C', 1, N'CIRCUITOS', N'Revisar operación ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (212, 1, N'C', 1, N'CIRCUITOS', N'Revisar conexionado ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (213, 1, N'C', 1, N'CANALIZACIONES', N'Rev. Estado de E.P.C', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (214, 1, N'C', 1, N'CANALIZACIONES', N'Chequeo de can. PVC', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (215, 1, N'CP', 1, N'TABLEROS', N'Reapriete de terminales', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (216, 1, N'CP', 1, N'TABLEROS', N'Chequear funcionamiento instrumentos (amp./volt)', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (217, 1, N'CP', 1, N'TABLEROS', N'Chequeo luces pilotos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (218, 1, N'CP', 1, N'TABLEROS', N'Revisión aislación conductores', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (219, 1, N'CP', 1, N'TABLEROS', N'Efectuar limpieza interior tableros', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (220, 1, N'CP', 1, N'TABLEROS', N'Revision contactos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (221, 1, N'CP', 1, N'TABLEROS', N'Medicion parametros de Corrientes y Voltajes grales.', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (222, 1, N'CP', 1, N'TABLEROS', N'Medición Termografica', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (223, 1, N'CP', 1, N'ALUMBRADO', N'Chequear Lampisteria', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (224, 1, N'CP', 1, N'ALUMBRADO', N'Chequear Ballast electronicos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (225, 1, N'CP', 1, N'ALUMBRADO', N'Chequeo de Funcionamiento general', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (226, 1, N'CP', 1, N'ENCHUFES', N'Revision modulos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (227, 1, N'CP', 1, N'ENCHUFES', N'Medicion voltajes entre fase-neutro y neutro-tierra', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (228, 1, N'CP', 1, N'ENCHUFES', N'Rev. General Ench. Monofasicos y trifasicos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (229, 1, N'CP', 1, N'CIRCUITOS', N'Chequeo estado de circuitos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (230, 1, N'CP', 1, N'CIRCUITOS', N'Revisar operación ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (231, 1, N'CP', 1, N'CIRCUITOS', N'Revisar conexionado ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (232, 1, N'CP', 1, N'CANALIZACIONES', N'Rev. Estado de E.P.C', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (233, 1, N'CP', 1, N'CANALIZACIONES', N'Chequeo de can. PVC', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (234, 1, N'P', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Llaves', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (235, 1, N'P', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Flexible ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (236, 1, N'P', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Sifón ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (237, 1, N'P', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Desagüe visible ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (238, 1, N'P', 2, N'WC, URINARIOS', N'Chequear Equipo ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (239, 1, N'P', 2, N'WC, URINARIOS', N'Chequear funcionamiento Descarga ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (240, 1, N'P', 2, N'WC, URINARIOS', N'Chequear funcionamiento llave de corte', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (241, 1, N'P', 2, N'WC, URINARIOS', N'Chequear Desagüe ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (242, 1, N'P', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear Equipos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (243, 1, N'P', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear sellos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (244, 1, N'P', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear Desagües ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (245, 1, N'P', 2, N'PILETAS DE PISO Y DESAGUES', N'Sondeo de Tuberias', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (246, 1, N'C', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Llaves', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (247, 1, N'C', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Flexible ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (248, 1, N'C', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Sifón ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (249, 1, N'C', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Desagüe visible ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (250, 1, N'C', 2, N'WC, URINARIOS', N'Chequear Equipo ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (251, 1, N'C', 2, N'WC, URINARIOS', N'Chequear funcionamiento Descarga ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (252, 1, N'C', 2, N'WC, URINARIOS', N'Chequear funcionamiento llave de corte', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (253, 1, N'C', 2, N'WC, URINARIOS', N'Chequear Desagüe ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (254, 1, N'C', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear Equipos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (255, 1, N'C', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear sellos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (256, 1, N'C', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear Desagües ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (257, 1, N'C', 2, N'PILETAS DE PISO Y DESAGUES', N'Sondeo de Tuberias', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (258, 1, N'CP', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Llaves', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (259, 1, N'CP', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Flexible ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (260, 1, N'CP', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Sifón ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (261, 1, N'CP', 2, N'LAVATORIOS Y LAVAMANOS', N'Chequear Desagüe visible ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (262, 1, N'CP', 2, N'WC, URINARIOS', N'Chequear Equipo ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (263, 1, N'CP', 2, N'WC, URINARIOS', N'Chequear funcionamiento Descarga ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (264, 1, N'CP', 2, N'WC, URINARIOS', N'Chequear funcionamiento llave de corte', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (265, 1, N'CP', 2, N'WC, URINARIOS', N'Chequear Desagüe ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (266, 1, N'CP', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear Equipos', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (267, 1, N'CP', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear sellos ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (268, 1, N'CP', 2, N'PILETAS DE PISO Y DESAGUES', N'Chequear Desagües ', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (269, 1, N'CP', 2, N'PILETAS DE PISO Y DESAGUES', N'Sondeo de Tuberias', N'No Aplica', N'No Aplica', N'', NULL, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION], [ID_EMPRESA], [CLASE], [ID_AREA], [NIVEL_1], [NIVEL_2], [NIVEL_3], [NIVEL_4], [NIVEL_5], [INSISTENCIA], [ACTIVO], [AGENDAMIENTO], [DERIVA], [ID_USUARIO_ESC_N1], [ID_USUARIO_ESC_N2], [ID_USUARIO_ESC_N3], [ID_USUARIO_ESC_N4], [SLA_N1], [SLA_N2], [SLA_N3], [SLA_N4], [TIPO], [ID_TIPO_MOTIVO_CIERRE], [VISIBLE_CLI_INTERNO], [VISIBLE_CLI_EXTERNO], [FECHA_MODIFICACION], [DETENIDO], [IdIVR], [TIPIFICACION_IVR]) VALUES (270, 1, N'P', 1, N'GRUPO ELECTROGENO', N'CHEQUEO DE FUNCIONAMIENTO', N'NO APLICA', N'NO APLICA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GM_TIPIFICACION] OFF
/****** Object:  Table [dbo].[GM_ZONA_GM_USUARIO]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GM_ZONA_GM_USUARIO](
	[ID_ZONA] [int] NOT NULL,
	[ID_USUARIO] [int] NOT NULL,
 CONSTRAINT [PK_GM_ZONA_GM_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_ZONA] ASC,
	[ID_USUARIO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 1)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 7)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 9)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 14)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 30)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 31)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 32)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 33)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 34)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 35)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 36)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 37)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 38)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 39)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 40)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 41)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 42)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 43)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 44)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 45)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (17, 46)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 1)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 7)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 9)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 14)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 30)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 31)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 32)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 33)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 34)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 35)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 36)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 37)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 38)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 39)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 40)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 41)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 42)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 43)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 44)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 45)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (18, 46)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 1)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 7)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 9)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 14)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 30)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 31)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 32)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 33)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 34)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 35)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 36)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 37)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 38)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 39)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 40)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 41)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 42)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 43)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 44)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 45)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (19, 46)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 1)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 6)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 8)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 10)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 16)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 17)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 18)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 19)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 20)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 21)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 22)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 23)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 24)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 25)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 26)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 27)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 28)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (29, 29)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 1)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 6)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 8)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 10)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 16)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 17)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 18)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 19)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 20)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 21)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 22)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 23)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 24)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 25)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 26)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 27)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 28)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (30, 29)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 1)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 6)
GO
print 'Processed 100 total records'
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 8)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 10)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 16)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 17)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 18)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 19)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 20)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 21)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 22)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 23)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 24)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 25)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 26)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 27)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 28)
INSERT [dbo].[GM_ZONA_GM_USUARIO] ([ID_ZONA], [ID_USUARIO]) VALUES (31, 29)
/****** Object:  Table [dbo].[GM_LOCAL]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_LOCAL](
	[ID_LOCAL] [int] IDENTITY(1,1) NOT NULL,
	[COD_LOCAL] [varchar](50) NULL,
	[NOMBRE_LOCAL] [varchar](250) NULL,
	[DIRECCION] [varchar](500) NULL,
	[UNIDAD] [varchar](100) NULL,
	[REGION] [varchar](100) NULL,
	[PROVINCIA] [varchar](100) NULL,
	[COMUNA] [varchar](100) NULL,
	[M2] [varchar](100) NULL,
	[ZONA] [varchar](100) NULL,
	[NOMBRE_ZONA] [varchar](100) NULL,
	[DIVISION2] [varchar](100) NULL,
	[TELEFONO] [varchar](100) NULL,
	[ID_SUPERVISOR] [int] NULL,
	[ID_PLANIFICADOR] [int] NULL,
	[ID_ZONA] [int] NULL,
	[ID_UNIDAD] [int] NULL,
	[ACTIVO] [int] NULL,
	[PRIORIDAD] [int] NULL,
	[REFERENCIA] [varchar](250) NULL,
 CONSTRAINT [PK_GM_LOCAL] PRIMARY KEY CLUSTERED 
(
	[ID_LOCAL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GM_LOCAL] ON
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (78, N'X965', N'Mega Viña del Mar', N'', N'Johnson', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'5287', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (79, N'P572', N'Paris Viña', N'', N'Paris', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'10011', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (80, N'N808', N'Viña Del Mar-Ex Crav', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'1248', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (81, N'N674', N'Viña Del Mar-Quillota', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'1786', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (82, N'N662', N'Viña Del Mar-1 Poniente', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'1067', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (83, N'N572', N'Viña Del Mar-Marina Arauco', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'784', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (84, N'N548', N'Viña Del Mar-Rafael Sotomayor', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'1318', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (85, N'N545', N'Viña Del Mar-Villanelo', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'1231', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (86, N'N542', N'Viña Del Mar-Av.Valparaiso', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'1334', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (87, N'N541', N'Viña Del Mar-Arlegui', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'695', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (88, N'J508', N'J Viña Del Mar', N'', N'Jumbo', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'8514', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (89, N'E508', N'Viña', N'', N'Easy', N'Valparaíso', N'Valparaíso', N'Viña del Mar', N'14651', N'17', N'Viña', N'Quinta&Norte', NULL, 5, 3, 17, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (90, N'P520', N'Paris Valparaíso', N'', N'Paris', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'7642', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (91, N'J520', N'J Valparaiso', N'', N'Jumbo', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'6000', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (92, N'S520', N'Valparaiso', N'', N'Shopping', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'34952', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (93, N'E520', N'Valparaiso', N'', N'Easy', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'6689', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (94, N'N849', N'Casablanca-Nervi', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Casa Blanca', N'1115', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (95, N'X943', N'San Antonio I', N'', N'Johnson', N'Valparaíso', N'San Antonio', N'San Antonio', N'2258', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (96, N'P756', N'Paris San Antonio', N'', N'Paris', N'Valparaíso', N'San Antonio', N'San Antonio', N'3364', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (97, N'N756', N'San Antonio-Paseo Pacífico', N'', N'SISA', N'Valparaíso', N'San Antonio', N'San Antonio', N'2238', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (98, N'N993', N'Valparaiso Cerro Los Placeres', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'1077', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (99, N'N911', N'Barrio Ingles', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'1500', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (100, N'N840', N'Valparaiso-Playa Ancha', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'935', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (101, N'N805', N'Valparaiso Brasil', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'1173', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (102, N'N722', N'Valparaiso-Almirante Riveros', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'649', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (103, N'N561', N'Valparaiso-Curauma', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'1535', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (104, N'N552', N'Valparaiso-Pedro Montt', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'1779', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (105, N'N536', N'Valparaiso-Uruguay', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Valparaíso', N'1048', N'18', N'Valparaiso', N'Quinta&Norte', NULL, 5, 3, 18, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (106, N'N781', N'Quilpue-Portal El Belloto', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Quilpué', N'1164', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (107, N'P781', N'El Belloto', N'', N'Paris', N'Valparaíso', N'Marga Marga', N'Quilpué', N'7012,02', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (108, N'S781', N'Belloto', N'', N'Shopping', N'Valparaíso', N'Marga Marga', N'Quilpué', N'114196', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (109, N'J781', N'El Belloto', N'', N'Jumbo', N'Valparaíso', N'Marga Marga', N'Quilpué', N'7612,62', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (110, N'S735', N'Centro Belloto', N'', N'Shopping', N'Valparaíso', N'Marga Marga', N'Quilpué', N'1005', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (111, N'E781', N'Belloto', N'', N'Easy', N'Valparaíso', N'Marga Marga', N'Quilpué', N'10836', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (112, N'N694', N'Con Con-Av. Manantiales', N'', N'SISA', N'Valparaíso', N'Valparaíso', N'Concón', N'1114', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (113, N'J739', N'J Bosquemar', N'', N'Jumbo', N'Valparaíso', N'Valparaíso', N'Concón', N'4374', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (114, N'N638', N'Viila Alemana-Peñablanca', N'', N'SISA', N'Valparaíso', N'Petorca', N'Peñablanca', N'1285', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (115, N'N822', N'Quilpue-Los Pinos', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Quilpué', N'1780', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (116, N'N813', N'Quilpue-Casas De Valencia Ii', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Quilpué', N'1397', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (117, N'N693', N'Quilpue-Diego Portales', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Quilpué', N'1442', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (118, N'N543', N'Quilpue-Claudio Vicuña', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Quilpué', N'1140', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (119, N'N538', N'Quilpue-Freire El Belloto', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Quilpué', N'1269', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (120, N'N537', N'Quilpue-Carrera', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Quilpué', N'943', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (121, N'N842', N'Villa Alemana-Troncos Viejos', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Villa Alemana', N'787', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (122, N'N539', N'Villa Alemana-Valparaíso', N'', N'SISA', N'Valparaíso', N'Marga Marga', N'Villa Alemana', N'1563', N'19', N'Quilpue', N'Quinta&Norte', NULL, 5, 3, 19, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (123, N'J512', N'J La Reina', N'', N'Jumbo', N'Region Metropolitana', N'Santiago', N'Las Condes', N'9245', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (124, N'S512', N'Portal La Reina', N'', N'Shopping', N'Region Metropolitana', N'', N'Las Condes', N'65071', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (125, N'E512', N'La Reina', N'', N'Easy', N'Region Metropolitana', N'Santiago', N'Las Condes', N'11759', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (126, N'N914', N'Paine Centro', N'', N'SISA', N'Region Metropolitana', N'Maipo', N'Paine', N'1564', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (127, N'N700', N'Pac-Carlos Valdovinos', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'Pedro Aguirre Cerda', N'926', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (128, N'N643', N'Pac-Ochagavía', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'Pedro Aguirre Cerda', N'2380', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (129, N'E643', N'Ochagavía', N'', N'Easy', N'Region Metropolitana', N'Santiago', N'Pedro Aguirre Cerda', N'7548', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (130, N'X967', N'Mega San Bernardo', N'', N'Johnson', N'Region Metropolitana', N'Santiago', N'San Bernardo', N'4212', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (131, N'P627', N'Paris San Bernardo', N'', N'Paris', N'Region Metropolitana', N'Maipo', N'San Bernardo', N'7520', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (132, N'N926', N'Almirante Riveros', N'', N'SISA', N'Region Metropolitana', N'Maipo', N'San Bernardo', N'1540', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (133, N'N847', N'San Bernardo-Eucaliptus', N'', N'SISA', N'Region Metropolitana', N'Maipo', N'San Bernardo', N'1367', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (134, N'J843', N'J San Bernardo', N'', N'Jumbo', N'Region Metropolitana', N'Santiago', N'San Bernardo', N'6700', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (135, N'E843', N'San Bernardo', N'', N'Easy', N'Region Metropolitana', N'Maipo', N'San Bernardo', N'7784', N'29', N'San Bernardo', N'Metropolitana 2', NULL, 5, 3, 29, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (136, N'N702', N'El Bosque-Gran Avenida', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'El Bosque', N'1344', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (137, N'N601', N'La Cisterna-Intermodal', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Cisterna', N'1930', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (138, N'N765', N'La Cisterna-Gran Avenida', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Cisterna', N'2031', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (139, N'N764', N'La Florida-Av La Florida 9385', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Florida', N'2480', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (140, N'N668', N'La Florida-Vicuña Mackenna', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Florida', N'1927', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (141, N'N697', N'La Florida-Av.Walker Martínez', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Florida', N'1240', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (142, N'N834', N'La Florida -Trinidad', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Florida', N'1426', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (143, N'N766', N'La Florida-Av La Florida 10149', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Florida', N'2212', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (144, N'N699', N'La Granja-Los Pensamientos', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Granja', N'1283', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (145, N'N610', N'La Granja - Santa Rosa', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Granja', N'1114', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (146, N'N605', N'La Pintana-Av Santa Rosa', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Pintana', N'3436', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (147, N'N618', N'Pasteleria Centralizada Santiago', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'La Pintana', N'2000', N'30', N'La Florida', N'Metropolitana 2', NULL, 5, 3, 30, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (148, N'J659', N'J Concha Y Toro', N'', N'Jumbo', N'Region Metropolitana', N'Santiago', N'Puente Alto', N'5539', N'31', N'Puente Alto', N'Metropolitana 2', NULL, 5, 3, 31, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (149, N'J613', N'J Puente Alto', N'', N'Jumbo', N'Region Metropolitana', N'Santiago', N'Puente Alto', N'5571', N'31', N'Puente Alto', N'Metropolitana 2', NULL, 5, 3, 31, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (150, N'E659', N'Pte Alto', N'', N'Easy', N'Region Metropolitana', N'Santiago', N'Puente Alto', N'8220', N'31', N'Puente Alto', N'Metropolitana 2', NULL, 5, 3, 31, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (151, N'N672', N'Puente Alto-Av.Concha Y Toro', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'Puente Alto', N'4005', N'31', N'Puente Alto', N'Metropolitana 2', NULL, 5, 3, 31, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (152, N'P573', N'Paris Tobalaba', N'', N'Paris', N'Region Metropolitana', N'Santiago', N'Puente Alto', N'7018', N'31', N'Puente Alto', N'Metropolitana 2', NULL, 5, 3, 31, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (153, N'N918', N'Puente Alto - El Peñon', N'', N'SISA', N'Region Metropolitana', N'Santiago', N'Puente Alto', N'1541', N'31', N'Puente Alto', N'Metropolitana 2', NULL, 5, 3, 31, NULL, 1, NULL, NULL)
INSERT [dbo].[GM_LOCAL] ([ID_LOCAL], [COD_LOCAL], [NOMBRE_LOCAL], [DIRECCION], [UNIDAD], [REGION], [PROVINCIA], [COMUNA], [M2], [ZONA], [NOMBRE_ZONA], [DIVISION2], [TELEFONO], [ID_SUPERVISOR], [ID_PLANIFICADOR], [ID_ZONA], [ID_UNIDAD], [ACTIVO], [PRIORIDAD], [REFERENCIA]) VALUES (154, N'X966', N'Mega Puente Alto', N'', N'Johnson', N'Region Metropolitana', N'Santiago', N'Puente Alto', N'4130', N'31', N'Puente Alto', N'Metropolitana 2', NULL, 5, 3, 31, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GM_LOCAL] OFF
/****** Object:  StoredProcedure [dbo].[stp_BuscarMotivoCierrePorIdTipo]    Script Date: 07/23/2018 00:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarMotivoCierrePorIdTipo]
(@idTipoCierre varchar(10))
as begin

select *
from [dbo].[GM_MOTIVO_CIERRE]
where ID_TIPO_MOTIVO_CIERRE=@idTipoCierre

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuario]    Script Date: 07/23/2018 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarUsuario null,null
CREATE procedure [dbo].[stp_BuscarUsuario]
(@login varchar(15),@nombre varchar(50))
as begin

SELECT *,case when u.activo=1  then 'SI' else 'NO' end as ACTIVO2,

'' as ZONAS

FROM GM_USUARIO u
left join GM_PERFIL p on u.ID_PERFIL=p.ID_PERFIL
left join GM_EMPRESA e on u.ID_EMPRESA=e.ID_EMPRESA
left join gm_area a on u.id_area = a.id_area
left join GM_SUCURSAL s on s.ID_SUCURSAL=u.ID_SUCURSAL
WHERE 

 u.id_usuario > 0 and
((@nombre is null) or (NOMBRE LIKE @nombre))
  and ((@login is null) or (USUARIO LIKE @login))

ORDER BY USUARIO

end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarUsuarioPorIdPerfil]    Script Date: 07/23/2018 00:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarUsuarioPorIdPerfil]
(@idPerfil varchar(10))
as begin

select *
from GM_USUARIO u
left join GM_EMPRESA e on u.ID_EMPRESA=e.ID_EMPRESA
where ID_PERFIL=@idPerfil

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioPorIdLocalIdPerfil]    Script Date: 07/23/2018 00:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarUsuarioPorIdLocalIdPerfil '79','5'
CREATE procedure [dbo].[stp_BuscarUsuarioPorIdLocalIdPerfil]
(@idLocal varchar(10), @idPerfil varchar(10))
as begin

select *
from GM_USUARIO u 
inner join gm_local_usuario lu on  u.ID_USUARIO = lu.ID_USUARIO
where lu.ID_LOCAL=@idLocal and u.ID_PERFIL=@idPerfil
--where 
--((@idArea is null) or (ID_AREA = @idArea))



end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioPorIdArea]    Script Date: 07/23/2018 00:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioPorIdArea]
(@idArea varchar(10))
as begin

select *
from GM_USUARIO
where ID_PERFIL=2 or ID_PERFIL=3 or ID_PERFIL=5
--where 
and ((@idArea is null) or (ID_AREA = @idArea))



end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarUsuarioPorId]    Script Date: 07/23/2018 00:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarUsuarioPorId]
(@idUsuario varchar(10))
as begin

select * from gm_usuario
where id_usuario=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioLogin]    Script Date: 07/23/2018 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarUsuarioLogin 'desa_ejecutivo'
CREATE procedure [dbo].[stp_BuscarUsuarioLogin](@nombre varchar(50))
as begin 

SELECT *,case when u.activo=1  then 'SI' else 'NO' end as ACTIVO2
FROM GM_USUARIO u
left join GM_PERFIL p on u.ID_PERFIL=p.ID_PERFIL
left join GM_EMPRESA e on u.ID_EMPRESA=e.ID_EMPRESA
left join GM_AREA a on a.ID_AREA=u.ID_AREA
--left join PROVEEDOR_JUDICIAL pj on u.ID_PROVEEDOR_JUDICIAL = pj.ID_PROVEEDOR_JUDICIAL
WHERE 
((@nombre is null) or (USUARIO = @nombre))


end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioExporte]    Script Date: 07/23/2018 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioExporte]
as begin

select ID_USUARIO,USUARIO,CONTRASENA, EMAIL,NOMBRE,p.NOM_PERFIL,a.AREA,s.NOMBRE_SUCURSAL, 
CASE WHEN u.ACTIVO=1 then 'SI' ELSE 'NO' end as ACTIVO
from GM_USUARIO u
left join GM_PERFIL p on u.ID_PERFIL = p.ID_PERFIL
left join GM_AREA a on u.ID_AREA=a.ID_AREA
left join GM_SUCURSAL s on s.ID_SUCURSAL=u.ID_SUCURSAL
end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarUsuario15112016]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarUsuario15112016]
(@idUsuario varchar(10),@usuario varchar(100),@contrasena varchar(100),@email varchar(100),
@perfil varchar(50),@nombre varchar(200),@activo varchar(1),@idEmpresa varchar(10),
@idArea varchar(10))
as begin

update GM_USUARIO
set USUARIO=@usuario,CONTRASENA=@contrasena,EMAIL=@email,ID_PERFIL=@perfil,
NOMBRE=@nombre,ACTIVO=@activo,ID_EMPRESA=@idEmpresa,ID_AREA=@idArea
where ID_USUARIO=@idUsuario

end
--select * from GM_USUARIO
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarUsuario]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarUsuario]
(@idUsuario varchar(10),@usuario varchar(100),@contrasena varchar(100),@email varchar(100),
@perfil varchar(50),@nombre varchar(200),@activo varchar(1),@idEmpresa varchar(10),
@idArea varchar(10),@idSucursal varchar(10))
as begin

update GM_USUARIO
set USUARIO=@usuario,CONTRASENA=@contrasena,EMAIL=@email,ID_PERFIL=@perfil,
NOMBRE=@nombre,ACTIVO=@activo,ID_EMPRESA=@idEmpresa,ID_AREA=@idArea,ID_SUCURSAL=@idSucursal
where ID_USUARIO=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_eliminarUsuario]    Script Date: 07/23/2018 00:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_eliminarUsuario]
(@idUsuario varchar(20)) 

AS
BEGIN
	
	DELETE
	FROM GM_USUARIO
	WHERE ID_USUARIO = @idUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarRutaFotoUsuario]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT *FROM GM_GESTIONES
CREATE procedure [dbo].[stp_EditarRutaFotoUsuario]
(@idUsuario int, @ruta varchar(250))
as begin

if @ruta <> ''
	update GM_USUARIO
	set RUTA_FOTO = @ruta
	where ID_USUARIO=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarZona]    Script Date: 07/23/2018 00:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarZona]
(@idZona varchar(10),@nombreZona varchar(100))
as begin

select *, cast(id_zona as varchar(10)) + ' - '+ nombre_zona as ZONA
from GM_ZONA
where ((@idZona is null) or (ID_ZONA=@idZona))
and ((@nombreZona is null) or (NOMBRE_ZONA like '%' + @nombreZona + '%'))
and ACTIVO=1
end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarContrasena]    Script Date: 07/23/2018 00:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarContrasena]
(@idUsuario varchar(10),@contrasena varchar(100))
as begin

update GM_USUARIO
set CONTRASENA=@contrasena
where ID_USUARIO=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarUsuario]    Script Date: 07/23/2018 00:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarUsuario]
(@usuario varchar(100),@contrasena varchar(100),@email varchar(100),
@perfil varchar(50),@nombre varchar(200),@activo varchar(1),
@idEmpresa varchar(10),@idArea varchar(10),@idSucursal varchar(10))
as begin

DECLARE @IDUSUARIO AS VARCHAR(4)

IF NOT EXISTS(SELECT * FROM GM_USUARIO WHERE USUARIO = @usuario)
BEGIN

insert into GM_USUARIO(USUARIO,CONTRASENA,EMAIL,ID_PERFIL,NOMBRE,ACTIVO,ID_EMPRESA,ID_AREA,ID_SUCURSAL)
values(@usuario,@contrasena,@email,@perfil,@nombre,@activo,@idEmpresa,@idArea,@idSucursal)
	
	SET @IDUSUARIO = (SELECT MAX(ID_USUARIO) FROM GM_USUARIO)
	
	select @IDUSUARIO as existe
END
ELSE

	select '9999' as existe

END
GO
/****** Object:  StoredProcedure [dbo].[stp_ObtieneIdUsuarioAsig]    Script Date: 07/23/2018 00:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_ObtieneIdUsuarioAsig] (@nomUsuarioA varchar(100))
as begin

select ID_USUARIO from GM_USUARIO
where USUARIO = @nomUsuarioA

end
GO
/****** Object:  StoredProcedure [dbo].[stp_validaUsuario]    Script Date: 07/23/2018 00:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_validaUsuario]
(@usuario varchar(100), @contrasena varchar(100)) 

AS
BEGIN

	SELECT COUNT(*) AS CONTAR 
	--SELECT *
	FROM GM_USUARIO
	WHERE USUARIO=@usuario AND CONTRASENA=@contrasena
	
END
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarZonasPorUsuario]    Script Date: 07/23/2018 00:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_IngresarZonasPorUsuario](@idUsuario varchar(10),@idZona varchar(10))
as begin

insert 
into [dbo].[GM_ZONA_GM_USUARIO](ID_ZONA,ID_USUARIO)
values (@idZona,@idUsuario)

end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarTipificacion]    Script Date: 07/23/2018 00:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarTipificacion]
(@idUsuario1 varchar(10), @idUsuario2 varchar(10), @idUsuario3 varchar(10), @idUsuario4 varchar(10), 
@sla1  varchar(50), @sla2 varchar(50), @sla3 varchar(50),
@sla4  varchar(50), @tipo char(1),@idTipoMotivoCierre varchar(10),
@visibleAtento varchar(5),@visibleCliInterno varchar(5),@visibleCliExterno varchar(5),@detenido varchar(1),
@idEmpresa int, @nivel1 varchar(100),@nivel2 varchar(100),@nivel3 varchar(100),@nivel4 varchar(100),@clase varchar (15))
		   as begin


		   insert into GM_TIPIFICACION(ID_USUARIO_ESC_N1,ID_USUARIO_ESC_N2,ID_USUARIO_ESC_N3,ID_USUARIO_ESC_N4,SLA_N1,SLA_N2,SLA_N3,SLA_N4,
		   TIPO,ID_TIPO_MOTIVO_CIERRE,VISIBLE_CLI_INTERNO,VISIBLE_CLI_EXTERNO,DETENIDO,FECHA_MODIFICACION,ACTIVO,
		   NIVEL_1,NIVEL_2,NIVEL_3,NIVEL_4,ID_EMPRESA,CLASE)
		   values(@idUsuario1,@idUsuario2,@idUsuario3,@idUsuario4,replace(@sla1,',','.'),replace(@sla2,',','.'),replace(@sla3,',','.'),replace(@sla4,',','.'),
		   @tipo,@idTipoMotivoCierre,@visibleCliInterno,@visibleCliExterno,@detenido,getdate(),1,
		   @nivel1,@nivel2,@nivel3,@nivel4,@idEmpresa,@clase)

		   --select * from GM_TIPIFICACION

--ID_USUARIO_ESC_N1 = @idUsuario1, ID_USUARIO_ESC_N2 = @idUsuario2, 
--ID_USUARIO_ESC_N3 = @idUsuario3, ID_USUARIO_ESC_N4 = @idUsuario4,
--SLA_N1 = replace(@sla1,',','.'), SLA_N2 = replace(@sla2,',','.'),  
--SLA_N3 = replace(@sla3,',','.'), SLA_N4 = replace(@sla4,',','.'),
--TIPO = @tipo, ID_TIPO_MOTIVO_CIERRE=@idTipoMotivoCierre,
--VISIBLE_ATENTO=@visibleAtento,
--VISIBLE_CLI_INTERNO=@visibleCliInterno,
--VISIBLE_CLI_EXTERNO=@visibleCliExterno,
--FECHA_MODIFICACION=GETDATE(),
--DETENIDO=@detenido

end



--select * from GM_TIPIFICACION
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarConfiguracion]    Script Date: 07/23/2018 00:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarConfiguracion]

(@idTipificacion varchar(10),@clase varchar (5),@idArea varchar(5), @nivel1 varchar(100),@nivel2 varchar(100),@nivel3 varchar(100),@nivel4 varchar(100))
as begin

--select *from GM_TIPIFICACION
update GM_TIPIFICACION
set-- ID_USUARIO_ESC_N1 = @idUsuario1, ID_USUARIO_ESC_N2 = @idUsuario2, 
--ID_USUARIO_ESC_N3 = @idUsuario3, ID_USUARIO_ESC_N4 = @idUsuario4,
--SLA_N1 = replace(@sla1,',','.'), SLA_N2 = replace(@sla2,',','.'),  
--SLA_N3 = replace(@sla3,',','.'), SLA_N4 = replace(@sla4,',','.'),
--TIPO = @tipo, ID_TIPO_MOTIVO_CIERRE=@idTipoMotivoCierre,
--VISIBLE_ATENTO=@visibleAtento,
--VISIBLE_CLI_INTERNO=@visibleCliInterno,
--VISIBLE_CLI_EXTERNO=@visibleCliExterno,
FECHA_MODIFICACION=GETDATE(),
--DETENIDO=@detenido,
NIVEL_1=@nivel1,
NIVEL_2=@nivel2,
NIVEL_3=@nivel3,
NIVEL_4=@nivel4,
CLASE = @clase,
ID_AREA = @idArea
WHERE ID_TIPIFICACION = @idTipificacion

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioPorIdZonas]    Script Date: 07/23/2018 00:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioPorIdZonas](@idZonas varchar(200),@activo varchar(1))
as begin

select distinct(u.id_usuario),u.USUARIO,u.EMAIL,u.NOMBRE
from GM_USUARIO u
left join dbo.GM_ZONA_GM_USUARIO zu on zu.ID_USUARIO=u.ID_USUARIO 
where ((@idZonas is null) or (zu.ID_ZONA IN (SELECT value FROM dbo.f_params_to_list(@idZonas))))
and u.ACTIVO=@activo

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarZonaPorIdUsuario]    Script Date: 07/23/2018 00:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_BuscarZonaPorIdUsuario]
(@idUsuario varchar(10))
as begin

select *, cast(z.id_zona as varchar(10)) + ' - '+ nombre_zona as ZONA
from GM_ZONA z inner join GM_ZONA_GM_USUARIO zu on z.ID_ZONA=zu.id_zona
where ((@idUsuario is null) or (zu.ID_USUARIO=@idUsuario))
and ACTIVO=1

end
GO
/****** Object:  StoredProcedure [dbo].[stp_EliminarZonasPorUsuario]    Script Date: 07/23/2018 00:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_EliminarZonasPorUsuario](@idUsuario varchar(10))
as begin

delete from GM_ZONA_GM_USUARIO
where ID_USUARIO=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_EliminarTipificacion]    Script Date: 07/23/2018 00:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_EliminarTipificacion]
(@idTipificacion varchar(10))
as begin

delete from [dbo].[GM_TIPIFICACION]
where ID_TIPIFICACION=@idTipificacion

end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarMantencion]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarMantencion]
(@idEmpresa varchar(10),@nivel1 varchar(100),@nivel2 varchar(100),@nivel3 varchar(100),
@nivel4 varchar(100),@clase varchar(2),@idArea varchar(5))
as begin

insert into gm_tipificacion(ID_EMPRESA,NIVEL_1,NIVEL_2,NIVEL_3,NIVEL_4,CLASE,ID_AREA)
values (@idEmpresa,@nivel1,@nivel2,@nivel3,@nivel4,@clase,@idArea)

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarUsuarioAsignadoPorIdLocalIdPerfil]    Script Date: 07/23/2018 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarUsuarioAsignadoPorIdLocalIdPerfil]
(@IdLocal varchar(10),@idPerfil varchar(10),@idArea varchar(10))
as begin

select * 
from gm_usuario u inner join gm_zona_gm_usuario zu on u.ID_USUARIO = zu.ID_USUARIO
inner join gm_local l on l.ID_ZONA = zu.ID_ZONA
where l.id_local=@IdLocal
and u.ID_PERFIL=@idPerfil
and ((@idArea is null) or (u.id_area = @idArea)) 

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarSubEstatus]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarSubEstatus]
(@nivel1 varchar(30))
as begin

select DISTINCT(NIVEL_2) AS NIVEL_2 
from dbo.GM_TIPIFICACION
where NIVEL_1=@nivel1
ORDER BY NIVEL_2

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarTipificacionPorId]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarTipificacionPorId]
  (@idTipificacion varchar(10))
  as begin
  
  select *
  from gm_tipificacion
  where id_tipificacion=@idTipificacion
  
  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarTipo]    Script Date: 07/23/2018 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarTipo]
(@idEmpresa varchar(10))
as begin

select DISTINCT(NIVEL_1) AS NIVEL_1 from dbo.GM_TIPIFICACION
where ID_EMPRESA = @idEmpresa

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarTipificacionPorNivel1Nivel2Nivel3Nivel4]    Script Date: 07/23/2018 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarTipificacionPorNivel1Nivel2Nivel3Nivel4]
  (@nivel1 varchar(100),@nivel2 varchar(100),@nivel3 varchar(100),@nivel4 varchar(100))
  as begin
  
  select *
  from gm_tipificacion
  where NIVEL_1=@nivel1 and NIVEL_2=@nivel2 and NIVEL_3=@nivel3 AND NIVEL_4=@nivel4
  
  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarTipificacionPorIdIvr]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarTipificacionPorIdIvr '1-1'
  CREATE procedure [dbo].[stp_BuscarTipificacionPorIdIvr](@idIvr varchar(5))
  as begin

	select * from GM_TIPIFICACION
	where TIPIFICACION_IVR=@idIvr

  end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarNivel4]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarNivel4]
(@nivel3 varchar(100),@nivel2 varchar(100),@nivel1 varchar(100),@clase varchar(5),@idArea varchar(5))
as begin

select DISTINCT(NIVEL_4) 
from GM_TIPIFICACION
where 
 NIVEL_1 = @nivel1 and nivel_2=@nivel2 and nivel_3=@nivel3
 and clase=@clase and ID_AREA= @idArea
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarNivel3]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarNivel3 '1',null,null,'Continuidad Operacional', 'Reporte Incidencia','2'
CREATE procedure [dbo].[stp_BuscarNivel3]
(@nivel2 varchar(100),@nivel1 varchar(50),@clase varchar(5),@idArea varchar(5)
)
as begin

select DISTINCT(NIVEL_3),NIVEL_2,NIVEL_1
from GM_TIPIFICACION
where 
--((@clienteInterno is null) or (visible_cli_interno = @clienteInterno))
--and ((@clienteExterno is null) or (visible_cli_externo = @clienteExterno))
 NIVEL_2 = @nivel2 and NIVEL_1 = @nivel1 and clase=@clase and ID_AREA= @idArea
--ID_EMPRESA = @idEmpresa
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarNivel2]    Script Date: 07/23/2018 00:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarNivel2 '1','1',null,'Reclamo'

CREATE procedure [dbo].[stp_BuscarNivel2]
(@nivel1 varchar(50),@clase varchar(5),@idArea varchar(5))
as begin

select DISTINCT(NIVEL_2) 
from GM_TIPIFICACION
where 
NIVEL_1 = @nivel1
and clase=@clase
and ID_AREA= @idArea
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarNivel1]    Script Date: 07/23/2018 00:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarNivel1 '1','1',null

CREATE procedure [dbo].[stp_BuscarNivel1](@clase char(2),@idArea varchar(5))
as begin

select DISTINCT(NIVEL_1) 
--select *
from GM_TIPIFICACION
where CLASE=@clase and ID_AREA= @idArea
--where 
-- ((@clienteInterno is null) or (visible_cli_interno = @clienteInterno))
--and ((@clienteExterno is null) or (visible_cli_externo = @clienteExterno))

--and id_empresa = @idEmpresa

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarLocalPorZona]    Script Date: 07/23/2018 00:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarLocalPorZona](@idZona varchar(10))
as begin

select * , cod_local +' - '+ nombre_local as local
from gm_local
where ((@idZona is null)or(ID_ZONA = @idZona))
and activo = 1
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarLocalPorId]    Script Date: 07/23/2018 00:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarLocalPorId]
(@idLocal varchar(100))
as begin

select *, COD_LOCAL + ' - ' + NOMBRE_LOCAL as NOM_LOCAL 
from gm_local
where 
((@idLocal is null) or (Id_Local = @idLocal))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarLocalAsignadoPorIdUsuarioIdPerfil]    Script Date: 07/23/2018 00:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[stp_BuscarLocalAsignadoPorIdUsuarioIdPerfil]
(@idUsuario varchar(10),@idPerfil varchar(10))
as begin

select * from gm_local l inner join GM_ZONA z on l.ID_ZONA=z.ID_ZONA
inner join gm_zona_gm_usuario zu on z.id_zona = zu.ID_ZONA
where zu.id_usuario=@idUsuario

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarConfiguracionExporte]    Script Date: 07/23/2018 00:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- EXEC [dbo].[stp_BuscarConfiguracionExporte]
CREATE procedure [dbo].[stp_BuscarConfiguracionExporte]
as begin


SELECT A.ID_TIPIFICACION,
CASE WHEN A.CLASE='C' THEN 'CORRECTIVA'
WHEN A.CLASE='CP' THEN 'CORRECTIVA PLANIFICADA'
WHEN A.CLASE='P' THEN 'PREVENTIVA'
 end as TIPOOT, ar1.AREA,
A.NIVEL_1,A.NIVEL_2, A.NIVEL_3, A.NIVEL_4

FROM GM_TIPIFICACION A
inner JOIN GM_AREA ar1 on a.ID_AREA=ar1.ID_AREA


end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarConfiguracion]    Script Date: 07/23/2018 00:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarConfiguracion]
as begin

SELECT A.ID_TIPIFICACION,EMPRESA,
CASE WHEN A.CLASE='C' THEN 'CORRECTIVA'
WHEN A.CLASE='CP' THEN 'CORRECTIVA PLANIFICADA'
WHEN A.CLASE='P' THEN 'PREVENTIVA'
 end as TIPOOT,
 A.CLASE, 
a.id_area,ar.AREA,
A.NIVEL_1,A.NIVEL_2, A.NIVEL_3, A.NIVEL_4,
A.ID_USUARIO_ESC_N1,A.ID_USUARIO_ESC_N2,A.ID_USUARIO_ESC_N3,A.ID_USUARIO_ESC_N4,
U1.NOMBRE AS USUARIO1,A.SLA_N1,U2.NOMBRE AS USUARIO2,A.SLA_N2,U3.NOMBRE AS USUARIO3,A.SLA_N3,U4.NOMBRE AS USUARIO4,A.SLA_N4,
A.tipo

FROM GM_TIPIFICACION A
LEFT JOIN GM_USUARIO U1 ON U1.ID_USUARIO = A.ID_USUARIO_ESC_N1
LEFT JOIN GM_USUARIO U2 ON U2.ID_USUARIO = A.ID_USUARIO_ESC_N2
LEFT JOIN GM_USUARIO U3 ON U3.ID_USUARIO = A.ID_USUARIO_ESC_N3
LEFT JOIN GM_USUARIO U4 ON U4.ID_USUARIO = A.ID_USUARIO_ESC_N4
INNER JOIN GM_EMPRESA E ON E.ID_EMPRESA=A.ID_EMPRESA
INNER JOIN GM_AREA AR ON A.ID_AREA=AR.ID_AREA

WHERE A.ID_TIPIFICACION > 0


end


--select * from gm_empresa
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarEstatusSeguimiento]    Script Date: 07/23/2018 00:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarEstatusSeguimiento]
(@nivel1 varchar(100),@nivel2 varchar(100))
as begin

select DISTINCT(NIVEL_3) AS NIVEL_3
from GM_TIPIFICACION
where NIVEL_1=@nivel1 and NIVEL_2=@nivel2

end
GO
/****** Object:  Table [dbo].[GM_ATENCION]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_ATENCION](
	[ID_ATENCION] [int] IDENTITY(1,1) NOT NULL,
	[ID_EMPRESA] [int] NULL,
	[ID_TIPIFICACION] [int] NULL,
	[RUT_CLIENTE] [varchar](80) NOT NULL,
	[NOMBRE_CLIENTE] [varchar](250) NULL,
	[FECHA] [smalldatetime] NULL,
	[ID_USUARIO_CREACION] [int] NULL,
	[ID_USUARIO_ASIGNADO] [int] NULL,
	[ID_ESTADO_ATENCION] [tinyint] NULL,
	[OBSERVACION] [varchar](1000) NULL,
	[TIPO] [varchar](100) NULL,
	[NIVEL_1] [varchar](100) NULL,
	[FECHA_AGEND] [smalldatetime] NULL,
	[ID_USUARIO_CIERRE] [int] NULL,
	[FECHA_CIERRE] [smalldatetime] NULL,
	[INSISTENCIAS] [tinyint] NULL,
	[ID_MOTIVO_CIERRE] [int] NULL,
	[OBSERVACION_INTERNA] [varchar](1000) NULL,
	[OBSERVACION_CLIENTE] [varchar](1000) NULL,
	[ID_CANAL] [int] NULL,
	[TELEFONO_ASOCIADO] [varchar](20) NULL,
	[TIPO_CLIENTE] [char](1) NULL,
	[RUTA_ARCHIVO] [varchar](250) NULL,
	[RUTA_ARCHIVO2] [varchar](250) NULL,
	[LOCAL] [varchar](10) NULL,
	[ID_LLAMADA] [varchar](30) NULL,
	[ID_VENDEDOR] [int] NULL,
	[SOLICITADO_POR] [varchar](50) NULL,
	[CLASE] [varchar](2) NULL,
	[ID_ZONA] [int] NULL,
	[ID_AREA] [int] NULL,
	[ID_SUCURSAL] [int] NULL,
 CONSTRAINT [PK_ATENCION] PRIMARY KEY CLUSTERED 
(
	[ID_ATENCION] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GM_ATENCION] ON
INSERT [dbo].[GM_ATENCION] ([ID_ATENCION], [ID_EMPRESA], [ID_TIPIFICACION], [RUT_CLIENTE], [NOMBRE_CLIENTE], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [TIPO], [NIVEL_1], [FECHA_AGEND], [ID_USUARIO_CIERRE], [FECHA_CIERRE], [INSISTENCIAS], [ID_MOTIVO_CIERRE], [OBSERVACION_INTERNA], [OBSERVACION_CLIENTE], [ID_CANAL], [TELEFONO_ASOCIADO], [TIPO_CLIENTE], [RUTA_ARCHIVO], [RUTA_ARCHIVO2], [LOCAL], [ID_LLAMADA], [ID_VENDEDOR], [SOLICITADO_POR], [CLASE], [ID_ZONA], [ID_AREA], [ID_SUCURSAL]) VALUES (29, 1, 225, N'1-9', NULL, CAST(0xA9220397 AS SmallDateTime), 6, 8, 1, N'Mantencion quincenal', N'D', N'ALUMBRADO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'78077190', NULL, NULL, NULL, N'134', NULL, NULL, N'Guillermo Rodriguez', N'P', 29, 1, 2)
INSERT [dbo].[GM_ATENCION] ([ID_ATENCION], [ID_EMPRESA], [ID_TIPIFICACION], [RUT_CLIENTE], [NOMBRE_CLIENTE], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [TIPO], [NIVEL_1], [FECHA_AGEND], [ID_USUARIO_CIERRE], [FECHA_CIERRE], [INSISTENCIAS], [ID_MOTIVO_CIERRE], [OBSERVACION_INTERNA], [OBSERVACION_CLIENTE], [ID_CANAL], [TELEFONO_ASOCIADO], [TIPO_CLIENTE], [RUTA_ARCHIVO], [RUTA_ARCHIVO2], [LOCAL], [ID_LLAMADA], [ID_VENDEDOR], [SOLICITADO_POR], [CLASE], [ID_ZONA], [ID_AREA], [ID_SUCURSAL]) VALUES (30, 1, 225, N'1-9', NULL, CAST(0xA922039C AS SmallDateTime), 6, 8, 1, N'Realizar mantencion quincenal', N'D', N'ALUMBRADO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'78077190', NULL, NULL, NULL, N'135', NULL, NULL, N'Guillermo Rodriguez', N'P', 29, 1, 2)
INSERT [dbo].[GM_ATENCION] ([ID_ATENCION], [ID_EMPRESA], [ID_TIPIFICACION], [RUT_CLIENTE], [NOMBRE_CLIENTE], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [TIPO], [NIVEL_1], [FECHA_AGEND], [ID_USUARIO_CIERRE], [FECHA_CIERRE], [INSISTENCIAS], [ID_MOTIVO_CIERRE], [OBSERVACION_INTERNA], [OBSERVACION_CLIENTE], [ID_CANAL], [TELEFONO_ASOCIADO], [TIPO_CLIENTE], [RUTA_ARCHIVO], [RUTA_ARCHIVO2], [LOCAL], [ID_LLAMADA], [ID_VENDEDOR], [SOLICITADO_POR], [CLASE], [ID_ZONA], [ID_AREA], [ID_SUCURSAL]) VALUES (31, 1, 225, N'1-9', NULL, CAST(0xA92203A1 AS SmallDateTime), 6, 8, 1, N'Realizar  mantencion  quincenal', N'D', N'ALUMBRADO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'78077190', NULL, NULL, NULL, N'148', NULL, NULL, N'Guillermo Rodriguez', N'P', 31, 1, 2)
INSERT [dbo].[GM_ATENCION] ([ID_ATENCION], [ID_EMPRESA], [ID_TIPIFICACION], [RUT_CLIENTE], [NOMBRE_CLIENTE], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [TIPO], [NIVEL_1], [FECHA_AGEND], [ID_USUARIO_CIERRE], [FECHA_CIERRE], [INSISTENCIAS], [ID_MOTIVO_CIERRE], [OBSERVACION_INTERNA], [OBSERVACION_CLIENTE], [ID_CANAL], [TELEFONO_ASOCIADO], [TIPO_CLIENTE], [RUTA_ARCHIVO], [RUTA_ARCHIVO2], [LOCAL], [ID_LLAMADA], [ID_VENDEDOR], [SOLICITADO_POR], [CLASE], [ID_ZONA], [ID_AREA], [ID_SUCURSAL]) VALUES (32, 1, 228, N'1-9', NULL, CAST(0xA92203A5 AS SmallDateTime), 6, 8, 1, N'Realizar mantencion quincenal', N'D', N'ENCHUFES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, N'150', NULL, NULL, N'', N'P', 31, 1, 2)
INSERT [dbo].[GM_ATENCION] ([ID_ATENCION], [ID_EMPRESA], [ID_TIPIFICACION], [RUT_CLIENTE], [NOMBRE_CLIENTE], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [TIPO], [NIVEL_1], [FECHA_AGEND], [ID_USUARIO_CIERRE], [FECHA_CIERRE], [INSISTENCIAS], [ID_MOTIVO_CIERRE], [OBSERVACION_INTERNA], [OBSERVACION_CLIENTE], [ID_CANAL], [TELEFONO_ASOCIADO], [TIPO_CLIENTE], [RUTA_ARCHIVO], [RUTA_ARCHIVO2], [LOCAL], [ID_LLAMADA], [ID_VENDEDOR], [SOLICITADO_POR], [CLASE], [ID_ZONA], [ID_AREA], [ID_SUCURSAL]) VALUES (33, 1, 228, N'1-9', NULL, CAST(0xA92203B3 AS SmallDateTime), 6, 8, 1, N'Realizar mantencion quincenal', N'D', N'ENCHUFES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'78077190', NULL, NULL, NULL, N'149', NULL, NULL, N'Guillermo Rodriguez', N'P', 31, 1, 2)
INSERT [dbo].[GM_ATENCION] ([ID_ATENCION], [ID_EMPRESA], [ID_TIPIFICACION], [RUT_CLIENTE], [NOMBRE_CLIENTE], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [TIPO], [NIVEL_1], [FECHA_AGEND], [ID_USUARIO_CIERRE], [FECHA_CIERRE], [INSISTENCIAS], [ID_MOTIVO_CIERRE], [OBSERVACION_INTERNA], [OBSERVACION_CLIENTE], [ID_CANAL], [TELEFONO_ASOCIADO], [TIPO_CLIENTE], [RUTA_ARCHIVO], [RUTA_ARCHIVO2], [LOCAL], [ID_LLAMADA], [ID_VENDEDOR], [SOLICITADO_POR], [CLASE], [ID_ZONA], [ID_AREA], [ID_SUCURSAL]) VALUES (34, 1, 226, N'1-9', NULL, CAST(0xA92203C0 AS SmallDateTime), 6, 6, 1, N'Realizar mantencion quincenal', N'D', N'ENCHUFES', CAST(0xA9220000 AS SmallDateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'78077190', NULL, NULL, NULL, N'154', NULL, NULL, N'Guillermo Rodriguez', N'P', 31, 1, 2)
SET IDENTITY_INSERT [dbo].[GM_ATENCION] OFF
/****** Object:  Table [dbo].[GM_ATENCION_HISTORICO]    Script Date: 07/23/2018 00:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GM_ATENCION_HISTORICO](
	[ID_ATENCION] [int] NOT NULL,
	[CORRELATIVO] [int] NOT NULL,
	[FECHA] [smalldatetime] NULL,
	[ID_USUARIO_CREACION] [int] NULL,
	[ID_USUARIO_ASIGNADO] [int] NULL,
	[ID_ESTADO_ATENCION] [tinyint] NULL,
	[OBSERVACION] [varchar](1000) NULL,
	[FECHA_AGEND] [smalldatetime] NULL,
	[RUTA_ARCHIVO_1] [varchar](250) NULL,
	[RUTA_ARCHIVO_2] [varchar](250) NULL,
	[OBSERVACION_CLIENTE] [varchar](1000) NULL,
 CONSTRAINT [PK_GM_ATENCION_HISTORICO] PRIMARY KEY CLUSTERED 
(
	[ID_ATENCION] ASC,
	[CORRELATIVO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (29, 1, CAST(0xA9220397 AS SmallDateTime), 6, 6, 1, N'Mantencion quincenal ', CAST(0xA9220000 AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (29, 2, CAST(0xA9220398 AS SmallDateTime), 6, 8, 1, N'Asignar trabajo', NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (30, 1, CAST(0xA922039C AS SmallDateTime), 6, 6, 1, N'Realizar mantencion quincenal', CAST(0xA9220000 AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (30, 2, CAST(0xA922039D AS SmallDateTime), 6, 8, 1, N'Realizar mantencion programada', NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (31, 1, CAST(0xA92203A1 AS SmallDateTime), 6, 6, 1, N'Realizar  mantencion  quincenal', CAST(0xA9220000 AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (31, 2, CAST(0xA92203A3 AS SmallDateTime), 6, 8, 1, N'	Realizar mantencion quincenal', NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (32, 1, CAST(0xA92203A5 AS SmallDateTime), 6, 6, 1, N'Realizar mantencion quincenal', CAST(0xA9220000 AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (32, 2, CAST(0xA92203A6 AS SmallDateTime), 6, 8, 1, N'Realizar mantencion quincenal', NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (33, 1, CAST(0xA92203B3 AS SmallDateTime), 6, 6, 1, N'Realizar mantencion quincenal', CAST(0xA9220000 AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (33, 2, CAST(0xA92203B8 AS SmallDateTime), 6, 8, 1, N'Realizar mantencion quincenal', NULL, NULL, NULL, NULL)
INSERT [dbo].[GM_ATENCION_HISTORICO] ([ID_ATENCION], [CORRELATIVO], [FECHA], [ID_USUARIO_CREACION], [ID_USUARIO_ASIGNADO], [ID_ESTADO_ATENCION], [OBSERVACION], [FECHA_AGEND], [RUTA_ARCHIVO_1], [RUTA_ARCHIVO_2], [OBSERVACION_CLIENTE]) VALUES (34, 1, CAST(0xA92203C0 AS SmallDateTime), 6, 6, 1, N'Realizar mantencion quincenal', CAST(0xA9220000 AS SmallDateTime), NULL, NULL, NULL)
/****** Object:  StoredProcedure [dbo].[stp_BuscarGestiones]    Script Date: 07/23/2018 00:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarGestiones]
(@idGestion varchar(10),@rutCliente varchar(20),@nombreCliente varchar(100),
@fechaDesde varchar(10),@fechaHasta varchar(10),@idEmpresa varchar(10),@idCanal varchar(10))
as begin

select *,g.NOMBRE_CLIENTE,e.TIPO AS TIPO_TIP
from GM_ATENCION g
inner join GM_TIPIFICACION e on g.ID_TIPIFICACION = e.ID_TIPIFICACION
inner join GM_USUARIO u on g.ID_USUARIO_CREACION = u.ID_USUARIO

left join GM_EMPRESA emp on g.ID_EMPRESA = emp.ID_EMPRESA
left join GM_CANAL ca on g.ID_CANAL = ca.ID_CANAL

where 

((@idGestion is null) or (g.ID_ATENCION = @idGestion)) AND
((@rutCliente is null) or (g.RUT_CLIENTE = @rutCliente)) AND
((@nombreCliente is null) or (g.NOMBRE_CLIENTE LIKE @nombreCliente)) AND
((@idEmpresa is null) or (g.ID_EMPRESA = @idEmpresa)) AND
((@idCanal is null) or (g.ID_CANAL = @idCanal))
and ((@fechaDesde is null) or (CONVERT(datetime,g.FECHA,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,g.FECHA,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarFechaIngresoTicket]    Script Date: 07/23/2018 00:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarFechaIngresoTicket]
(@ticket varchar(40))
as begin

select * 
from GM_ATENCION
where ID_ATENCION=@ticket

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarGestionPorIdTicket]    Script Date: 07/23/2018 00:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarGestionPorIdTicket]
(@idTicket varchar(10))
as begin

select a.ID_ATENCION,a.TIPO_CLIENTE,TELEFONO_ASOCIADO
FROM GM_ATENCION a
where ID_ATENCION = @idTicket

end


--select * from gm_gestiones
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarGestionesUsuario]    Script Date: 07/23/2018 00:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarGestionesUsuario]
(@idUsuario varchar(10),@idGestion varchar(10),@rutCliente varchar(20),@nombreCliente varchar(100),
@fechaDesde varchar(10),@fechaHasta varchar(10),@idEmpresa varchar(10),@idCanal varchar(10))
as begin

select *,e.TIPO AS TIPO_TIP
from GM_ATENCION g
inner join GM_TIPIFICACION e on g.ID_TIPIFICACION = e.ID_TIPIFICACION
inner join GM_USUARIO u on g.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_EMPRESA emp on g.ID_EMPRESA = emp.ID_EMPRESA
left join GM_CANAL ca on g.ID_CANAL = ca.ID_CANAL


where 
((@idUsuario is null) or (g.ID_USUARIO_CREACION = @idUsuario)) AND
((@idGestion is null) or (g.ID_ATENCION = @idGestion)) AND
((@rutCliente is null) or (g.RUT_CLIENTE = @rutCliente)) AND
((@nombreCliente is null) or (g.NOMBRE_CLIENTE LIKE @nombreCliente)) AND
((@idEmpresa is null) or (g.ID_EMPRESA = @idEmpresa)) AND
((@idCanal is null) or (g.ID_CANAL = @idCanal))
and ((@fechaDesde is null) or (CONVERT(datetime,g.FECHA,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,g.FECHA,103)<=convert(datetime,@fechaHasta + ' 23:59',103))) 
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarGestionesPorRutCliente]    Script Date: 07/23/2018 00:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarGestionesPorRutCliente]
(@rutCliente varchar(20))
as begin

select *
from GM_ATENCION g
inner join GM_TIPIFICACION e on g.ID_TIPIFICACION = e.ID_TIPIFICACION
inner join GM_USUARIO u on g.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_EMPRESA emp on g.ID_EMPRESA = emp.ID_EMPRESA
left join GM_CANAL ca on g.ID_CANAL = ca.ID_CANAL

where 
((@rutCliente is null) or (g.RUT_CLIENTE = @rutCliente))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarGestionesPorIdTipificacion]    Script Date: 07/23/2018 00:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarGestionesPorIdTipificacion null,null,null
CREATE procedure [dbo].[stp_BuscarGestionesPorIdTipificacion]
(@idTipificacion varchar(20),@fechaDesde varchar(10),@fechaHasta varchar(10),
@idUsuario varchar(10),@tipo varchar(10),@idCanal varchar(10))
as begin


select TI.ID_ATENCION as TICKET, UPPER(u.USUARIO) AS USUARIO_INGRESO,
UPPER(u2.USUARIO) AS USUARIO_ASIGNADO,
EA.ESTADO_ATENCION,ti.fecha as FECHA_INGRESO,
CANAL,ti.OBSERVACION,t.NIVEL_1 as ESTATUS,t.nivel_2 as SUB_ESTATUS,t.nivel_3 as ESTATUS_SEGUIMIENTO,t.nivel_4
 
from GM_ATENCION TI
left join GM_ESTADO_ATENCION EA ON TI.ID_ESTADO_ATENCION = EA.ID_ESTADO_ATENCION
left join gm_tipificacion t on ti.ID_TIPIFICACION = t.id_tipificacion
left join GM_USUARIO u on u.ID_USUARIO=ti.ID_USUARIO_creacion
left join GM_USUARIO u2 on u2.ID_USUARIO=ti.ID_USUARIO_ASIGNADO
left join GM_CANAL c on ti.ID_CANAL=c.ID_CANAL

where

((@idTipificacion is null) or (ti.ID_TIPIFICACION = @idTipificacion))
and
((@idUsuario is null) or (TI.ID_USUARIO_ASIGNADO = @idUsuario))
and ((@fechaDesde is null) or (CONVERT(datetime,ti.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,ti.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
and ((@tipo is null)) or (ti.TIPO=@tipo)
and ((@idCanal is null)) or (ti.ID_CANAL=@idCanal)


end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorPorRut]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[stp_buscarTicketBuscadorPorRut] 'sac-dbustamante@sb.cl'
CREATE procedure [dbo].[stp_buscarTicketBuscadorPorRut](@rutCliente varchar(80))
 
as begin
 
select *,t.USUARIO AS USUARIO_ASIG,
(CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA,
case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION

from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
where
((@rutCliente is null) or (ah.RUT_CLIENTE = @rutCliente))
 order by ah.fecha desc
END
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorPorIdTicketIdUsuario]    Script Date: 07/23/2018 00:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- [dbo].[stp_buscarTicketBuscadorPorIdTicketIdUsuario] 129, 564
CREATE procedure [dbo].[stp_buscarTicketBuscadorPorIdTicketIdUsuario](@idAtencion varchar(10),@idUsuario varchar(10))
as begin
 
select *,t.USUARIO AS USUARIO_ASIG
,(CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA,
case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION
from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
where
(((@idUsuario is null) or (ah.ID_USUARIO_ASIGNADO = @idUsuario)) or ((@idUsuario is null) or (ah.ID_USUARIO_CREACION = @idUsuario)))
and ((@idAtencion is null) or (ah.ID_ATENCION = @idAtencion))
 order by ah.fecha desc
END
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorPorIdTicket]    Script Date: 07/23/2018 00:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicketBuscadorPorIdTicket](@idAtencion varchar(10))
 
as begin
 
select *,t.USUARIO AS USUARIO_ASIG,
 (CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA

from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION

where
((@idAtencion is null) or (ah.ID_ATENCION = @idAtencion))
order by ah.fecha desc
END
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorPorEmailCli]    Script Date: 07/23/2018 00:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_buscarTicketBuscador '%147%','%147%'
--stp_buscarTicketBuscadorPorEmailCli 'jrodriguez@interweb.cl'
--ALTER procedure [dbo].[stp_buscarTicketBuscadorPorEmailCli](@emailCliente varchar(50), @idEstado varchar (10))
 CREATE procedure [dbo].[stp_buscarTicketBuscadorPorEmailCli](@emailCliente varchar(50))
as begin
--if @idEstado = null
--begin
select *,t.USUARIO AS USUARIO_ASIG,
(CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA,
case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION

from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
where
((@emailCliente is null) or (ah.RUT_CLIENTE = @emailCliente))
 order by ah.fecha desc
-- end
-- else
-- begin
--select *,t.USUARIO AS USUARIO_ASIG,
--(CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA,
--case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION

--from GM_ATENCION ah
--left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
--left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
--left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
--where
--(((@emailCliente is null) or (ah.RUT_CLIENTE = @emailCliente)) and ah.ID_ESTADO_ATENCION=@idEstado)
-- order by ah.fecha desc
-- end
END
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorPorEmailCi]    Script Date: 07/23/2018 00:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_buscarTicketBuscador '%147%','%147%'
--stp_buscarTicketBuscadorPorEmailCli 'jrodriguez@interweb.cl'
--ALTER procedure [dbo].[stp_buscarTicketBuscadorPorEmailCli](@emailCliente varchar(50), @idEstado varchar (10)) 
CREATE procedure [dbo].[stp_buscarTicketBuscadorPorEmailCi](@EmailCI varchar(50))
as begin
--if @idEstado = null
--begin
select *,t.USUARIO AS USUARIO_ASIG,
(CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA,
case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION

from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
where
((@EmailCI is null) or (ah.RUT_CLIENTE = @EmailCI)) 
order by ah.fecha desc
-- end
-- else
-- begin
--select *,t.USUARIO AS USUARIO_ASIG,
--(CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA,
--case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION

--from GM_ATENCION ah
--left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
--left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
--left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
--where
--(((@emailCliente is null) or (ah.RUT_CLIENTE = @emailCliente)) and ah.ID_ESTADO_ATENCION=@idEstado)
-- order by ah.fecha desc
-- end
END
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorPorCliente]    Script Date: 07/23/2018 00:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicketBuscadorPorCliente](@nombre varchar(200))
 
as begin
 
select *,t.USUARIO AS USUARIO_ASIG,
(CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA
from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION

where
((@nombre is null) or (ah.NOMBRE_cliente LIKE @nombre))
 
END
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorParametrosExporte]    Script Date: 07/23/2018 00:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from gm_atencion
CREATE procedure [dbo].[stp_buscarTicketBuscadorParametrosExporte]
(@usuarioAsig varchar(10),@fechaDesde varchar(15),@fechaHasta varchar(15),@idEstado varchar(10))
as begin
 
select ah.ID_ATENCION,ah.RUT_CLIENTE,
u.USUARIO AS USUARIO_CREACION,
t.USUARIO AS USUARIO_ASIG,ea.ESTADO_ATENCION,ah.OBSERVACION,ah.OBSERVACION_CLIENTE,
 case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) 
 else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION,
 (select count(*) from gm_escalamiento e where e.id_ticket=ah.id_atencion) as ESCALADO
from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION

where
(ah.TIPO = 'D')
AND
((@usuarioAsig is null) or (ah.ID_USUARIO_ASIGNADO = @usuarioAsig))
and ((@idEstado is null) or (ah.ID_ESTADO_ATENCION = @idEstado))
and ((@fechaDesde is null) or (CONVERT(datetime,ah.FECHA,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,ah.FECHA,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
 
end


--select * from GM_ATENCION
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscadorParametros]    Script Date: 07/23/2018 00:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicketBuscadorParametros]
(@usuarioAsig varchar(10),@fechaDesde varchar(15),
@fechaHasta varchar(15),@idEstado varchar(10),
@tipo varchar(2),@idUsuarioCreacion varchar(10),@idArea varchar(10),@idSucursal varchar(10))
as begin

select *,t.USUARIO AS USUARIO_ASIG
,case when ESTADO_ATENCION='CERRADO' then datediff(Minute,ah.Fecha,ah.Fecha_Cierre) else datediff(Minute,ah.Fecha,getdate()) end as TIEMPO_RESOLUCION
,case when clase='C' then 'CORRECTIVO' when clase='CP' then 'CORRECTIVO PLANIFICADO' ELSE  'PREVENTIVO' end CLASE2
,CONVERT(varchar(10),FECHA_AGEND,103) as FECHA_AGENDAMIENTO, ah.ID_SUCURSAL,s.NOMBRE_SUCURSAL
from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
left join gm_LOCAL l on ah.LOCAL=l.ID_LOCAL
left join GM_SUCURSAL s on ah.ID_SUCURSAL=s.ID_SUCURSAL
where
((@idSucursal is null) or (ah.ID_SUCURSAL=@idSucursal)) and
((@idArea is null) or (ah.ID_AREA=@idArea)) and
((@usuarioAsig is null) or (ah.ID_USUARIO_ASIGNADO = @usuarioAsig))
and  ((@idUsuarioCreacion is null) or (ah.ID_USUARIO_CREACION = @idUsuarioCreacion))
AND ((@tipo is null) or (ah.CLASE = @tipo))
and ((@idEstado is null) or (ah.ID_ESTADO_ATENCION IN (SELECT value FROM dbo.f_params_to_list(@idEstado))))
and ((@fechaDesde is null) or (CONVERT(datetime,ah.FECHA,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,ah.FECHA,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))

order by ah.fecha desc
 
end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketBuscador]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicketBuscador](@idAtencion varchar(10),@nombre varchar(200),
@idUsuario varchar(10))
 
as begin
 
select *,t.USUARIO AS USUARIO_ASIG, (CAST(ID_ATENCION AS VARCHAR(10)) + ' - ' + CONVERT(VARCHAR(10),fecha,103)) AS TICKET_INSISTENCIA,
ah.TELEFONO_ASOCIADO
from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
where
(((@idAtencion is null) or (ah.ID_ATENCION LIKE @idAtencion))
OR ((@nombre is null) or (ah.RUT_CLIENTE LIKE @nombre))
OR ((@nombre is null) or (ah.NOMBRE_CLIENTE LIKE @nombre)))
 
 order by ah.fecha desc
END
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicket]    Script Date: 07/23/2018 00:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicket](@idAtencion varchar(10))
as begin


--SELECT *FROM GM_ATENCION
--SELECT *FROM GM_ESTADO_ATENCION
select *,U.USUARIO AS USUARIO_ASIGNADO,u.nombre as NOMBRE_ASIGNADO,
us.USUARIO as USUARIO_CREACION, us.NOMBRE as NOMBRE_CREACION, us.EMAIL as EMAIL_SOLICITANTE
from GM_ATENCION a
INNER JOIN GM_ESTADO_ATENCION EA on EA.ID_ESTADO_ATENCION = A.ID_ESTADO_ATENCION
inner join GM_USUARIO u on u.ID_USUARIO=a.ID_USUARIO_ASIGNADO
inner join GM_USUARIO us on us.ID_USUARIO=a.ID_USUARIO_CREACION
inner join GM_TIPIFICACION e on a.ID_TIPIFICACION=e.ID_TIPIFICACION
inner join gm_LOCAL l on a.LOCAL=l.ID_LOCAL
inner join gm_AREA ar on ar.ID_AREA = a.ID_AREA

where ID_ATENCION=@idAtencion

end


--select * from GM_GESTIONES
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarTipificacionPorIdEstatus]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_BuscarTipificacionPorIdEstatus]
(@nivel1 varchar(20),@idUsuario varchar(10))
as begin

	SELECT * ,t.TIPO AS TIPO_TIP
	FROM GM_ATENCION g
	inner join GM_TIPIFICACION t on g.ID_TIPIFICACION=t.ID_TIPIFICACION
	inner join GM_USUARIO u on g.ID_USUARIO_CREACION = u.ID_USUARIO
	--left join GM_ATENCION ah on g.ID_GESTION = ah.ID_GESTION
	--left join dbo.GM_CLIENTE c on g.RUT_CLIENTE = c.RUT_CLIENTE
	left join GM_EMPRESA emp on g.ID_EMPRESA = emp.ID_EMPRESA
	left join GM_CANAL ca on g.ID_CANAL = ca.ID_CANAL
	WHERE 
	--((@idEstatus is null) or (g.ID_ESTATUS IN (SELECT value FROM dbo.f_params_to_list(@idEstatus))))
	--((@nivel1 is null) or (t.nivel_1 = @nivel1))
	((@nivel1 is null) or (t.TIPO = @nivel1))
AND((@idUsuario is null) or (g.ID_USUARIO_ASIGNADO = @idUsuario))
end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketResumen]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicketResumen]
(@fechaDesde varchar(15),@fechaHasta varchar(15))
as begin
--select * from GM_ESTADO_ATENCION
select ea.ESTADO_ATENCION,ah.ID_ESTADO_ATENCION,count(ah.ID_ATENCION) as CANTIDAD
from GM_ATENCION ah
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION

where ((@fechaDesde is null) or (CONVERT(datetime,ah.FECHA,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,ah.FECHA,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
AND
(ah.TIPO = 'D')

group by ESTADO_ATENCION,ah.ID_ESTADO_ATENCION


end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarOT]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarOT]
(
@idTipificacion varchar(10),
@idUsuarioCreacion varchar(10),
@idUsuarioAsignado varchar(10),
@idEstadoAtencion varchar(10),
@observacion varchar(1000),@tipo varchar(100),
@nivel1 varchar(20),@idEmpresa varchar(10),
@clase varchar(2), @local varchar(10),
@telefonoAsociado varchar(20),@solicitadoPor varchar(50),@idZona varchar(5),
@idArea varchar(5),@fechaAgendamiento varchar(10),@idSucursal varchar(10)
)
as begin

insert into dbo.GM_ATENCION(ID_TIPIFICACION,FECHA,ID_USUARIO_CREACION,ID_USUARIO_ASIGNADO,ID_ESTADO_ATENCION,
OBSERVACION,TIPO,NIVEL_1,ID_EMPRESA,CLASE,LOCAL,TELEFONO_ASOCIADO,
SOLICITADO_POR,RUT_CLIENTE,ID_ZONA,ID_AREA,FECHA_AGEND,ID_SUCURSAL)
values(@idTipificacion,getdate(),@idUsuarioCreacion,@idUsuarioAsignado,@idEstadoAtencion,@observacion,
@tipo,@nivel1,@idEmpresa,@clase,@local,@telefonoAsociado,@solicitadoPor,'1-9',@idZona,
@idArea,@fechaAgendamiento,@idSucursal)


select MAX(ID_ATENCION) ID_ATENCION from GM_ATENCION WHERE ID_USUARIO_CREACION=@idUsuarioCreacion

end
GO
/****** Object:  StoredProcedure [dbo].[stp_GraficoContarGestiones]    Script Date: 07/23/2018 00:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_GraficoContarGestiones null,'01-04-2016','01-06-2016',null,null
CREATE procedure [dbo].[stp_GraficoContarGestiones]
(@idUsuario varchar(10),@fechaDesde varchar(10),@fechaHasta varchar(10),
@idEstado varchar(10),@idArea int)
as begin

--select * from gm_perfil
--select * from GM_TIPIFICACION
--select * from gm_atencion

select FECHA,SUM(Consulta) AS Consulta, SUM(Incidencia) Incidencia, SUM(Reclamo) Reclamo, SUM(Solicitud) Solicitud
from (

select CONVERT(varchar(10),a.FECHA,103) AS FECHA,
(select count(*) 
from GM_ATENCION at
inner join gm_usuario u on at.ID_USUARIO_ASIGNADO=u.ID_USUARIO
inner JOIN  GM_TIPIFICACION B ON at.ID_TIPIFICACION = B.ID_TIPIFICACION 
where B.nivel_1='Consulta' and B.nivel_1=P.nivel_1 and ((@idArea is null) or (u.ID_AREA=@idArea))
and ((@idUsuario is null) or (at.ID_USUARIO_ASIGNADO = @idUsuario))
and CONVERT(varchar(10),at.FECHA,103) = CONVERT(varchar(10),a.FECHA,103)) Consulta,
(select count(*) 
from GM_ATENCION at 
inner join gm_usuario u on at.ID_USUARIO_ASIGNADO=u.ID_USUARIO
inner JOIN  GM_TIPIFICACION B ON at.ID_TIPIFICACION = B.ID_TIPIFICACION 
where B.nivel_1='Reporte Incidencia' and B.nivel_1=P.nivel_1 and ((@idArea is null) or (u.ID_AREA=@idArea))
and ((@idUsuario is null) or (at.ID_USUARIO_ASIGNADO = @idUsuario))
and CONVERT(varchar(10),at.FECHA,103) = CONVERT(varchar(10),at.FECHA,103)) Incidencia,
(select count(*) 
from GM_ATENCION at
inner join gm_usuario u on at.ID_USUARIO_ASIGNADO=u.ID_USUARIO
inner JOIN  GM_TIPIFICACION B ON at.ID_TIPIFICACION = B.ID_TIPIFICACION 
where B.nivel_1='Reclamo' and B.nivel_1=P.nivel_1 and ((@idArea is null) or (u.ID_AREA=@idArea))
and ((@idUsuario is null) or (at.ID_USUARIO_ASIGNADO = @idUsuario))
and CONVERT(varchar(10),at.FECHA,103) = CONVERT(varchar(10),at.FECHA,103)) Reclamo,
(select count(*) 
from GM_ATENCION at
inner join gm_usuario u on at.ID_USUARIO_ASIGNADO=u.ID_USUARIO
inner JOIN  GM_TIPIFICACION B ON at.ID_TIPIFICACION = B.ID_TIPIFICACION 
where B.nivel_1='Solicitud' and B.nivel_1=P.nivel_1 and ((@idArea is null) or (u.ID_AREA=@idArea))
and ((@idUsuario is null) or (at.ID_USUARIO_ASIGNADO = @idUsuario))
and CONVERT(varchar(10),at.FECHA,103) = CONVERT(varchar(10),at.FECHA,103)) Solicitud

FROM GM_ATENCION a 
inner join gm_usuario u on a.ID_USUARIO_ASIGNADO=u.ID_USUARIO
inner JOIN  GM_TIPIFICACION P ON A.ID_TIPIFICACION = P.ID_TIPIFICACION

where ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
and ((@idEstado is null) or (a.ID_ESTADO_ATENCION = @idEstado))
and ((@idArea is null) or (u.ID_AREA=@idArea))


GROUP BY CONVERT(VARCHAR(10),a.FECHA,103),P.nivel_1

) as EEE


group by FECHA
order by cast(fecha as datetime)



end
GO
/****** Object:  StoredProcedure [dbo].[stp_GenerarDashboard]    Script Date: 07/23/2018 00:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- [dbo].[stp_GenerarDashboard] '1',NULL,'C','1'
CREATE procedure [dbo].[stp_GenerarDashboard]
(@idUsuario varchar(15), @idArea varchar(5), @tipo varchar(2),@idPerfil varchar(10),
@idSucursal varchar(10))

as begin
declare 
@total_cerrados varchar(10),
@total_abiertos varchar(10),
@total_detenidos varchar(10),
@total_usuarios varchar(10),
@promedioResolucion varchar(10),
@casoEscaladoPorDemora varchar(10),
@totalTicketDerivados varchar(10)

if (@idPerfil <> '4')
begin
	set @total_cerrados = (select count(*) as total from GM_ATENCION g 
							where ID_ESTADO_ATENCION=3 and ((@tipo is null) or (g.clase=@tipo))
							 and ((@idArea is null) or (g.ID_AREA=@idArea))
							  and ((@idSucursal is null) or (g.ID_SUCURSAL=@idSucursal))
							and ((@idUsuario is null) or ((g.ID_USUARIO_ASIGNADO = @idUsuario))))
	set @total_abiertos = (select  count(*) AS TOTAL_ABIERTOS from GM_ATENCION g 
							where ID_ESTADO_ATENCION=1 and ((@tipo is null) or (g.clase=@tipo))
							and ((@idArea is null) or (g.ID_AREA=@idArea))
							and ((@idSucursal is null) or (g.ID_SUCURSAL=@idSucursal))
							and ((@idUsuario is null) or ((g.ID_USUARIO_ASIGNADO = @idUsuario))))
	set @total_detenidos =(select count(*) AS TOTAL_DETENIDOS from GM_ATENCION g 
							where ID_ESTADO_ATENCION=2 and ((@tipo is null) or (g.clase=@tipo))
							and ((@idArea is null) or (g.ID_AREA=@idArea))
							and ((@idSucursal is null) or (g.ID_SUCURSAL=@idSucursal))
							and ((@idUsuario is null) or ((g.ID_USUARIO_ASIGNADO = @idUsuario))))
	set @total_usuarios = (select COUNT(*) from GM_USUARIO u 
							where ACTIVO=1 and ((@idArea is null) or (u.ID_AREA=@idArea))
							and ((@idSucursal is null) or (u.ID_SUCURSAL=@idSucursal)))
	set @promedioResolucion = (select AVG(DATEDIFF(minute,FECHA,FECHA_CIERRE)) AS PROMEDIO 
								from GM_ATENCION a inner join gm_usuario u on a.ID_USUARIO_ASIGNADO=u.ID_USUARIO 
								WHERE ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario)) 
								and ((@idArea is null) or (u.ID_AREA=@idArea))
								and ((@idSucursal is null) or (a.ID_SUCURSAL=@idSucursal)))
	set @casoEscaladoPorDemora = (select COUNT(*) from GM_ATENCION a inner join gm_usuario u on a.ID_USUARIO_ASIGNADO=u.ID_USUARIO 
									where ((@idArea is null) or (u.ID_AREA=@idArea))
									AND((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
									and ((@idSucursal is null) or (a.ID_SUCURSAL=@idSucursal)))
	set @totalTicketDerivados = (select COUNT(*) from GM_ATENCION a inner join gm_usuario u on a.ID_USUARIO_ASIGNADO=u.ID_USUARIO 
									where ((@idArea is null) or (u.ID_AREA=@idArea))
									AND((a.ID_USUARIO_ASIGNADO <> a.ID_USUARIO_CREACION))
									and ((@idSucursal is null) or (a.ID_SUCURSAL=@idSucursal)))
end
else begin
	set @total_cerrados = (select count(*) as total from GM_ATENCION g 
							where ID_ESTADO_ATENCION=3 and ((@tipo is null) or (g.clase=@tipo))
							 and ((@idArea is null) or (g.ID_AREA=@idArea))
							and ((@idUsuario is null) or ((g.ID_USUARIO_CREACION = @idUsuario))))
	set @total_abiertos = (select  count(*) AS TOTAL_ABIERTOS from GM_ATENCION g 
							where ID_ESTADO_ATENCION=1 and ((@tipo is null) or (g.clase=@tipo))
							and ((@idArea is null) or (g.ID_AREA=@idArea))
							and ((@idUsuario is null) or ((g.ID_USUARIO_CREACION = @idUsuario))))
	set @total_detenidos =(select count(*) AS TOTAL_DETENIDOS from GM_ATENCION g 
							where ID_ESTADO_ATENCION=2 and ((@tipo is null) or (g.clase=@tipo))
							and ((@idArea is null) or (g.ID_AREA=@idArea))
							and ((@idUsuario is null) or ((g.ID_USUARIO_CREACION = @idUsuario))))
	set @total_usuarios = (select COUNT(*) from GM_USUARIO u where ACTIVO=1 and ((@idArea is null) or (u.ID_AREA=@idArea)))
	set @promedioResolucion = (select AVG(DATEDIFF(minute,FECHA,FECHA_CIERRE)) AS PROMEDIO 
								from GM_ATENCION a inner join gm_usuario u on a.ID_USUARIO_CREACION=u.ID_USUARIO 
								WHERE ((@idUsuario is null) or (a.ID_USUARIO_CREACION = @idUsuario)) and ((@idArea is null) or (a.ID_AREA=@idArea))) 
	set @casoEscaladoPorDemora = (select COUNT(*) from GM_ATENCION a inner join gm_usuario u on a.ID_USUARIO_ASIGNADO=u.ID_USUARIO 
									where ((@idArea is null) or (u.ID_AREA=@idArea))
									AND((@idUsuario is null) or (a.ID_USUARIO_CREACION = @idUsuario)))
	set @totalTicketDerivados = (select COUNT(*) from GM_ATENCION a inner join gm_usuario u on a.ID_USUARIO_CREACION=u.ID_USUARIO 
									where ((@idArea is null) or (u.ID_AREA=@idArea))
									AND((a.ID_USUARIO_ASIGNADO <> a.ID_USUARIO_CREACION)))
end


create table #tmp (TOTAL_ABIERTOS varchar(10), TOTAL_CERRADOS varchar(10),
TOTAL_DETENIDOS varchar(10),TOTAL_USUARIOS varchar(10),
TOTAL_PROMEDIO_RESOLUCION varchar(10),TOTAL_DERIVADOS VARCHAR(10))

insert into #tmp(TOTAL_ABIERTOS,TOTAL_CERRADOS, TOTAL_DETENIDOS,TOTAL_USUARIOS,
TOTAL_PROMEDIO_RESOLUCION,TOTAL_DERIVADOS)
values (@total_abiertos,@total_cerrados,@total_detenidos,@total_usuarios,
@promedioResolucion,@totalTicketDerivados)

select * from #tmp

end
GO
/****** Object:  StoredProcedure [dbo].[stp_GeneraEscalamiento]    Script Date: 07/23/2018 00:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---stp_GeneraEscalamiento 1
CREATE procedure [dbo].[stp_GeneraEscalamiento]
		(@idUsuario varchar(10))
as begin

--- Truncate table GM_ESCALAMIENTO
--select * from GM_ESCALAMIENTO where id_ticket=2511
--select * from gm_atencion where ID_ATENCION=2511
/*
update GM_ESCALAMIENTO
set email = 'jrodriguez@interweb.cl'
where id_escalamiento in 
(
84,
85,
86,
87
)

SELECT * FROM GM_ESCALAMIENTO WHERE EMAIL IS NOT NULL AND FECHA_ENVIO_EMAIL IS NULL
SELECT * FROM GM_ESCALAMIENTO WHERE EMAIL IS NOT NULL AND FECHA_ENVIO_EMAIL IS NULL
 
	--select * from GM_GESTIONES
	--select * from gm_atencion where id_atencion = 2167
	--select * from GM_ATENCION_HISTORICO where id_atencion = 2167
	--select * from gm_escalamiento where id_ticket = 2167
	-- select * from GM_ESTATUS_SEGUIMIENTO
	*/

	/*
	--ESCALAMIENTO 1
	

	INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO, HORAS_SLA, FECHA_TICKET)
	select ID_ATENCION, C.ID_USUARIO_ESC_N2, D.EMAIL, 2 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,DATEDIFF(HOUR,A.FECHA,GETDATE()), A.FECHA
	--select *
	from GM_ATENCION A 
	left join GM_TIPIFICACION C ON A.ID_TIPIFICACION = C.ID_TIPIFICACION
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N2 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1 and C.SLA_N1 > 0 
	--and (dbo.diferenciaHoraLabFeb(A.FECHA, getdate()) >= C.SLA_N1)
	and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= C.SLA_N1
	and C.ID_USUARIO_ESC_N1 is not  null and C.SLA_N1 > 0
	--and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= C.SLA_N1
	--and ((dbo.fBusinessDays(A.FECHA,getdate())-1)*24) >= C.SLA_N1
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 1)

	*/
	/*
	--ESCALAMIENTO 2
	*/

	INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO, HORAS_SLA, FECHA_TICKET)
	select ID_ATENCION, C.ID_USUARIO_ESC_N2, D.EMAIL, 2 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,DATEDIFF(HOUR,A.FECHA,GETDATE()) horas, A.FECHA
	--select *
	from GM_ATENCION A 
	left join GM_TIPIFICACION C ON A.ID_TIPIFICACION = C.ID_TIPIFICACION
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N2 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1 and sla_n1 <> 0 and sla_n1 is not null 
	and C.ID_USUARIO_ESC_N2 is not  null
	and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= C.SLA_N1
	--and ((dbo.fBusinessDays(A.FECHA,getdate())-1)*24) >= C.SLA_N1
	----and (dbo.diferenciaHoraLabFeb(A.FECHA,getdate()) >= C.SLA_N1)
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 2)

	--and id_atencion = 2167
	--select * from GM_GESTIONES
	/*
	--ESCALAMIENTO 3
	*/

	INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO,HORAS_SLA,FECHA_TICKET)

	select ID_ATENCION, C.ID_USUARIO_ESC_N3, D.EMAIL, 3 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,DATEDIFF(HOUR,A.FECHA,GETDATE()),A.FECHA
	from GM_ATENCION A 
	left join GM_TIPIFICACION C ON A.ID_TIPIFICACION = C.ID_TIPIFICACION
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N3 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1
	and sla_n2 <> 0 and sla_n2 is not null
	and C.ID_USUARIO_ESC_N3 is not  null
	and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= (C.SLA_N2 + C.SLA_N1)
	--and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= C.SLA_N2
	--and ((dbo.fBusinessDays(A.FECHA,getdate())-1)*24) >= C.SLA_N2
	---and (dbo.diferenciaHoraLabFeb(A.FECHA, getdate()) >= C.SLA_N2)
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 3)
	and ID_ATENCION in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 2)


	/*
	--ESCALAMIENTO 4
	*/
	INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO,HORAS_SLA,FECHA_TICKET)

	select ID_ATENCION, C.ID_USUARIO_ESC_N3, D.EMAIL, 4 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,dbo.diferenciaHoraLabFeb(A.FECHA,getdate()),A.FECHA
	from GM_ATENCION A 
	left join GM_TIPIFICACION C ON A.ID_TIPIFICACION = C.ID_TIPIFICACION
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N3 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1 
	and sla_n3 <> 0 and sla_n3 is not null 
	and C.ID_USUARIO_ESC_N4 is not  null
	and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= (C.SLA_N3 + C.SLA_N2 + C.SLA_N1)
	---and (dbo.diferenciaHoraLabFeb(A.FECHA, getdate()) >=  (C.SLA_N3 + C.SLA_N2 + C.SLA_N1))
	--and ((dbo.fBusinessDays(A.FECHA,getdate())-1)*24) >= C.SLA_N3
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 4)
	and ID_ATENCION in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 3)


end

-----  update GM_ESCALAMIENTO set email = 'alvaro.lopez@legalrecovery.cl'



/*

select * from GM_TIPIFICACION where id_tipificacion=658

select * 
from GM_ESTATUS_SEGUIMIENTO
where sla_n1 is not null and sla_n1 <> 0

update GM_ESTATUS_SEGUIMIENTO
set sla_n2 = sla_n1 * 24
where sla_n1 is not null and sla_n1 <> 0


update GM_ESTATUS_SEGUIMIENTO
set sla_n4 = 0
where sla_n4 is null

select * 
from GM_ESTATUS_SEGUIMIENTO
where sla_n2 is null

select * from GM_ESCALAMIENTO



select * from GM_TIPIFICACION
select * from GM_TIPIFICACION_RESP
where SLA_N4 is null

update GM_TIPIFICACION
set SLA_N4 = SLA_N4*24


*/
GO
/****** Object:  StoredProcedure [dbo].[stp_Escalamiento]    Script Date: 07/23/2018 00:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_Escalamiento]
		(@idUsuario varchar(10))
as begin

--select * from GM_ESCALAMIENTO where id_ticket=2511
--select * from gm_atencion where ID_ATENCION=2511
/*
update GM_ESCALAMIENTO
set email = 'ldiaz@interweb.cl'
where id_escalamiento in 
(
84,
85,
86,
87
)

SELECT * FROM GM_ESCALAMIENTO WHERE EMAIL IS NOT NULL AND FECHA_ENVIO_EMAIL IS NULL
SELECT * FROM GM_ESCALAMIENTO WHERE EMAIL IS NOT NULL AND FECHA_ENVIO_EMAIL IS NULL

*/
	--- TRUNCATE TABLE dbo.GM_ESCALAMIENTO
	
	--INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO)
	/*
	select ID_ATENCION, C.ID_USUARIO_ESC_N1, D.EMAIL, 1 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,C.SLA_N1,DATEDIFF(DAY,A.FECHA,GETDATE()) as dias,a.fecha as fecha_ticket,B.FECHA_INGRESO as FECHA_INGRESO_GESTION
	---ID_ESTADO_ATENCION, A.FECHA, DATEADD(DAY,C.SLA_N1,A.FECHA) FEC_SLA_1,
	---DATEDIFF(DAY,A.FECHA,GETDATE()) SLA_1
	--select *
	from GM_ATENCION A
	inner join GM_GESTIONES B on A.ID_GESTION = B.ID_GESTION
	left join GM_ESTATUS_SEGUIMIENTO C ON B.ID_ESTATUS = C.ID_ESTATUS AND B.ID_SUB_ESTATUS = C.ID_SUB_ESTATUS AND B.ID_ESTATUS_SEGUIMIENTO = C.ID_ESTATUS_SEGUIMIENTO
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N1 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1 and DATEDIFF(DAY,A.FECHA,GETDATE()) >= C.SLA_N1
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 1)
	and id_atencion = 2167
	 
	--select * from GM_GESTIONES
	--select * from gm_atencion where id_atencion = 2167
	--select * from GM_ATENCION_HISTORICO where id_atencion = 2167
	--select * from gm_escalamiento where id_ticket = 2167
	-- select * from GM_ESTATUS_SEGUIMIENTO
	*/


	/*
	--ESCALAMIENTO 2
	*/

	INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO, HORAS_SLA, FECHA_TICKET)
	select ID_ATENCION, C.ID_USUARIO_ESC_N2, D.EMAIL, 2 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,dbo.diferenciaHoraLabFeb(A.FECHA,getdate()), A.FECHA
	--select *
	from GM_ATENCION A 
	left join GM_TIPIFICACION C ON A.ID_TIPIFICACION = C.ID_TIPIFICACION
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N2 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1 and sla_n1 <> 0 and sla_n1 is not null 
	and C.ID_USUARIO_ESC_N2 is not  null
	--and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= C.SLA_N1
	--and ((dbo.fBusinessDays(A.FECHA,getdate())-1)*24) >= C.SLA_N1
	and (dbo.diferenciaHoraLabFeb(A.FECHA,getdate()) >= C.SLA_N1)
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 2)

	--and id_atencion = 2167
	--select * from GM_GESTIONES
	/*
	--ESCALAMIENTO 3
	*/

	INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO,HORAS_SLA,FECHA_TICKET)

	select ID_ATENCION, C.ID_USUARIO_ESC_N3, D.EMAIL, 3 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,dbo.diferenciaHoraLabFeb(A.FECHA,getdate()),A.FECHA
	from GM_ATENCION A 
	left join GM_TIPIFICACION C ON A.ID_TIPIFICACION = C.ID_TIPIFICACION
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N3 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1
	and sla_n2 <> 0 and sla_n2 is not null
	and C.ID_USUARIO_ESC_N3 is not  null
	--and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= C.SLA_N2
	--and ((dbo.fBusinessDays(A.FECHA,getdate())-1)*24) >= C.SLA_N2
	and (dbo.diferenciaHoraLabFeb(A.FECHA, getdate()) >= C.SLA_N2)
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 3)
	and ID_ATENCION in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 2)


	/*
	--ESCALAMIENTO 4
	*/
	INSERT INTO dbo.GM_ESCALAMIENTO (ID_TICKET, ID_USUARIO, EMAIL,ESCALAMIENTO, FECHA_ENVIO_EMAIL,FECHA_INGRESO,HORAS_SLA,FECHA_TICKET)

	select ID_ATENCION, C.ID_USUARIO_ESC_N3, D.EMAIL, 4 AS ESCALAMIENTO , null AS FECHA_ENVIO_EMAIL,
	(getdate()) as fechaIngreso,dbo.diferenciaHoraLabFeb(A.FECHA,getdate()),A.FECHA
	from GM_ATENCION A 
	left join GM_TIPIFICACION C ON A.ID_TIPIFICACION = C.ID_TIPIFICACION
	left join GM_USUARIO D on C.ID_USUARIO_ESC_N3 = D.ID_USUARIO
	where ID_ESTADO_ATENCION = 1 
	and sla_n3 <> 0 and sla_n3 is not null 
	and C.ID_USUARIO_ESC_N4 is not  null
	--and DATEDIFF(HOUR,A.FECHA,GETDATE()) >= C.SLA_N3
	and (dbo.diferenciaHoraLabFeb(A.FECHA, getdate()) >= C.SLA_N3)
	--and ((dbo.fBusinessDays(A.FECHA,getdate())-1)*24) >= C.SLA_N3
	and ID_ATENCION not in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 4)
	and ID_ATENCION in (select ID_TICKET FROM GM_ESCALAMIENTO WHERE ESCALAMIENTO = 3)


end





/*

select * from GM_TIPIFICACION where id_tipificacion=658

select * 
from GM_ESTATUS_SEGUIMIENTO
where sla_n1 is not null and sla_n1 <> 0

update GM_ESTATUS_SEGUIMIENTO
set sla_n2 = sla_n1 * 24
where sla_n1 is not null and sla_n1 <> 0


update GM_ESTATUS_SEGUIMIENTO
set sla_n4 = 0
where sla_n4 is null

select * 
from GM_ESTATUS_SEGUIMIENTO
where sla_n2 is null

select * from GM_ESCALAMIENTO



select * from GM_TIPIFICACION
select * from GM_TIPIFICACION_RESP
where SLA_N4 is null

update GM_TIPIFICACION
set SLA_N4 = SLA_N4*24


*/
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarTicket]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarTicket](@idTicket varchar(10),@idEstado varchar(10),
@idEmpleado varchar(10),@fechaAgend varchar(15),@idMotivoCierre varchar(10))
as begin

update dbo.GM_ATENCION
set ID_ESTADO_ATENCION=@idEstado, ID_USUARIO_ASIGNADO=@idEmpleado,FECHA_AGEND=@fechaAgend,ID_MOTIVO_CIERRE=@idMotivoCierre
where ID_ATENCION=@idTicket

/*	if @idMotivoCierre <> null
	begin

		update GM_ATENCION
		set ID_MOTIVO_CIERRE=@idMotivoCierre
		where ID_ATENCION=@idTicket

	end
*/

end
GO
/****** Object:  StoredProcedure [dbo].[stp_CantidadTicketPorTipoYArea]    Script Date: 07/23/2018 00:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_CantidadTicketPorTipoYArea null,null,null,null,'29'
create procedure [dbo].[stp_CantidadTicketPorTipoYArea]
(@idArea varchar(2),@fechaDesde varchar(15),@fechaHasta varchar(15),@idEstado varchar(10),@idZonas varchar(50))
as begin

select distinct(NIVEL_1),
(select COUNT(*) 
from GM_ATENCION a inner join GM_TIPIFICACION e on a.ID_TIPIFICACION = e.ID_TIPIFICACION
where a.NIVEL_1=t.NIVEL_1
and ((@fechaDesde is null) or (CONVERT(datetime,a.FECHA,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,a.FECHA,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
and ((@idEstado is null) or (a.ID_ESTADO_ATENCION=@idEstado))
and ((@idZonas is null) or (a.ID_ZONA IN (SELECT value FROM dbo.f_params_to_list(@idZonas))))
) as CantidadTicket
from GM_TIPIFICACION t
where (@idArea is null) or (ID_AREA = @idArea)

end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarGestionPorId]    Script Date: 07/23/2018 00:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarGestionPorId]
(@id varchar(10),@observacion varchar(1000)
)
as begin

update gm_atencion
set OBSERVACION=@observacion
where ID_ATENCION=@id


end
GO
/****** Object:  StoredProcedure [dbo].[stp_ContarGestiones]    Script Date: 07/23/2018 00:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_ContarGestiones null,null,null,null,null,null,null,4

CREATE procedure [dbo].[stp_ContarGestiones]
(@idUsuario varchar(10),@fechaDesde varchar(10),@fechaHasta varchar(10),
@campo1 varchar(10),@idEstado varchar(10),@tipo varchar(10),@idCanal varchar(10),@idArea int)
as begin


select COUNT(a.id_atencion) AS GESTIONES,
e.NIVEL_1,
e.NIVEL_2,
e.NIVEL_3,
e.NIVEL_4, 
a.ID_TIPIFICACION,
emp.EMPRESA
from GM_ATENCION a
inner join gm_usuario u on a.ID_USUARIO_ASIGNADO=u.ID_USUARIO
inner join GM_TIPIFICACION e on e.ID_TIPIFICACION=a.ID_TIPIFICACION
inner join gm_empresa emp on a.Id_Empresa=emp.Id_Empresa

where
((@idArea is null) or (u.ID_AREA=@idArea))
and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
and ((@idEstado is null)) or (a.ID_ESTADO_ATENCION=@idEstado)
and ((@tipo is null)) or (a.TIPO=@tipo)
and ((@idCanal is null)) or (a.ID_CANAL=@idCanal)

group by e.NIVEL_1,e.NIVEL_2,e.NIVEL_3,e.NIVEL_4,a.ID_TIPIFICACION,emp.EMPRESA

order by emp.EMPRESA,e.NIVEL_1,e.NIVEL_2,e.NIVEL_3,e.NIVEL_4
end

--select * from GM_EMPRESA
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarRutaArchivoGestion3]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT *FROM GM_GESTIONES
CREATE procedure [dbo].[stp_EditarRutaArchivoGestion3]
(@idGestion int, @ruta varchar(250))
as begin

if @ruta <> ''
	update GM_ATENCION
	set RUTA_ARCHIVO2 = @ruta
	where ID_ATENCION=@idGestion

end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarRutaArchivoGestion2]    Script Date: 07/23/2018 00:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT *FROM GM_GESTIONES
CREATE procedure [dbo].[stp_EditarRutaArchivoGestion2]
(@idGestion int, @ruta varchar(250))
as begin

if @ruta <> ''
	update GM_ATENCION
	set RUTA_ARCHIVO2 = @ruta
	where ID_ATENCION=@idGestion

end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarRutaArchivoGestion]    Script Date: 07/23/2018 00:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT *FROM GM_GESTIONES
CREATE procedure [dbo].[stp_EditarRutaArchivoGestion]
(@idGestion int, @ruta varchar(250))
as begin

if @ruta <> ''
	update GM_ATENCION
	set RUTA_ARCHIVO = @ruta
	where ID_ATENCION=@idGestion

end
GO
/****** Object:  StoredProcedure [dbo].[stp_ReporteTickets21092017]    Script Date: 07/23/2018 00:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from GM_ATENCION where id_estado_atencion=3
--stp_ReporteTickets '592',null,null,null,null
--stp_ReporteTickets null,null,null,null,null
CREATE procedure [dbo].[stp_ReporteTickets21092017]
(@idUsuario varchar(10),@fechaDesde varchar(10),@fechaHasta varchar(10),@insistencia tinyint, @idArea int)
as begin

	---drop table ##TEMP_TICKETS
	select ORDEN,NIVEL_1,N_ESCALAMIENTO, 
	ESCALAMIENTO, SUM(PENDIENTE) AS PENDIENTE, 
	SUM(DETENIDO) AS DETENIDO, SUM(CERRADO) AS CERRADO, 
	SUM(CERRADO_CD) AS CERRADO_CD ,0 AS TOTAL
	into ##TEMP_TICKETS
	from (
		select 0 as ORDEN,'SIN ESCALAMIENTO' AS ESCALAMIENTO,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A1
		where A1.ID_ESTADO_ATENCION = 1 and 
		A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and 
        ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A1.NIVEL_1) AS PENDIENTE,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A2 
		where ID_ESTADO_ATENCION = 2 and 
		A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A3 
		where ID_ESTADO_ATENCION = 3 /*and*/ 
		--A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and 
	    /*((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) *//*AND
		A.NIVEL_1 = A3.NIVEL_1*/) AS CERRADO,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A4 
		where ID_ESTADO_ATENCION = 4 and 
		A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		0 AS N_ESCALAMIENTO,
		(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		FROM  GM_ATENCION A
		--
		left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		--
		INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		GROUP BY ID_TIPIFICACION, A.ID_ESTADO_ATENCION,NIVEL_1
  --UNION
		--select 1 as ORDEN,'ESCALAMIENTO NIVEL 1' AS ESCALAMIENTO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A1 
		--where A1.ID_ESTADO_ATENCION = 1 and 
		--A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and
  --      ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A1.NIVEL_1 ) AS PENDIENTE,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A2 
		--where ID_ESTADO_ATENCION = 2 and 
		--A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A3 
		--where ID_ESTADO_ATENCION = 3 and 
		--A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A3.NIVEL_1) AS CERRADO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A4 
		--where ID_ESTADO_ATENCION = 4 and 
		--A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		--1 AS N_ESCALAMIENTO,
		--(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		--FROM  GM_ATENCION A
		----
		--left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		----
		--INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		--WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		--and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		--and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		--and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		--and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		--GROUP BY NIVEL_1, A.ID_ESTADO_ATENCION,A.ID_TIPIFICACION
  --UNION
		--select 2 as ORDEN,'ESCALAMIENTO NIVEL 2' AS ESCALAMIENTO, 
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A1 
		--where A1.ID_ESTADO_ATENCION = 1 and 
		--A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A1.NIVEL_1) AS PENDIENTE,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A2 
		--where ID_ESTADO_ATENCION = 2 and 
		--A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A3 
		--where ID_ESTADO_ATENCION = 3 and 
		--A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and
		--	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) AND
	 --   A.NIVEL_1 = A3.NIVEL_1 ) AS CERRADO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A4 
		--where ID_ESTADO_ATENCION = 4 and 
		--A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		--2 AS N_ESCALAMIENTO,
		--(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		--FROM  GM_ATENCION A
		----
		--left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		----
		--INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		--WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		--and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		--and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		--and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		--and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		--GROUP BY NIVEL_1, A.ID_ESTADO_ATENCION, A.ID_TIPIFICACION
  --UNION
		--select 3 as ORDEN,'ESCALAMIENTO NIVEL 3' AS ESCALAMIENTO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A1 where A1.ID_ESTADO_ATENCION = 1 and 
		--A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A1.NIVEL_1 ) AS PENDIENTE,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A2 
		--where ID_ESTADO_ATENCION = 2 and 
		--A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A3 
		--where ID_ESTADO_ATENCION = 3 and 
		--A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and A.NIVEL_1 = A3.NIVEL_1 AND
		--	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) ) AS CERRADO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A4 
		--where ID_ESTADO_ATENCION = 4 and 
		--A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and
		--	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		--3 AS N_ESCALAMIENTO,
		--(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		--FROM  GM_ATENCION A
		----
		--left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		----
		--INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		--WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		--and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		--and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		--and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		--and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		--GROUP BY NIVEL_1, A.ID_ESTADO_ATENCION, A.ID_TIPIFICACION
  ) aa 
  GROUP BY NIVEL_1,N_ESCALAMIENTO,ESCALAMIENTO, ORDEN
  order by orden
  

  
  INSERT INTO ##TEMP_TICKETS
  select 5,'TOTAL','','',isnull(SUM(PENDIENTE),0), isnull(SUM(DETENIDO),0), isnull(SUM(CERRADO),0), isnull(SUM(CERRADO_CD),0) ,0 from ##TEMP_TICKETS
  
  UPDATE ##TEMP_TICKETS SET TOTAL = PENDIENTE + DETENIDO + CERRADO + CERRADO_CD
  
  select * from ##TEMP_TICKETS order by orden
  
  DROP TABLE ##TEMP_TICKETS
  
end
/*
SELECT ID_ESTADO_ATENCION, COUNT(*) FROM GM_ATENCION GROUP BY ID_ESTADO_ATENCION


SELECT * FROM GM_ATENCION WHERE ID_ESTADO_ATENCION <> 1

GROUP BY ID_ESTADO_ATENCION



select * from GM_ATENCION
delete from GM_ATENCION where id_tipificacion is null


select * from gm_atencion_historico
where id_atencion=71

delete from gm_atencion_historico
where id_atencion=71

*/
GO
/****** Object:  StoredProcedure [dbo].[stp_ReporteTickets_22092017]    Script Date: 07/23/2018 00:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_ReporteTickets '592',null,null,null,null
CREATE procedure [dbo].[stp_ReporteTickets_22092017]
(@idUsuario varchar(10),@fechaDesde varchar(10),@fechaHasta varchar(10),@insistencia tinyint, @idArea int)
as begin

	---drop table ##TEMP_TICKETS
	select ORDEN,NIVEL_1,N_ESCALAMIENTO, 
	ESCALAMIENTO, SUM(PENDIENTE) AS PENDIENTE, 
	SUM(DETENIDO) AS DETENIDO, SUM(CERRADO) AS CERRADO, 
	SUM(CERRADO_CD) AS CERRADO_CD ,0 AS TOTAL
	into ##TEMP_TICKETS
	from (
		select 0 as ORDEN,'SIN ESCALAMIENTO' AS ESCALAMIENTO,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A1
		where A1.ID_ESTADO_ATENCION = 1 and 
		A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and 
        ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A1.NIVEL_1) AS PENDIENTE,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A2 
		where ID_ESTADO_ATENCION = 2 and 
		A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A3 
		where ID_ESTADO_ATENCION = 3 and 
		A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A3.NIVEL_1) AS CERRADO,
		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A4 
		where ID_ESTADO_ATENCION = 4 and 
		A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		0 AS N_ESCALAMIENTO,
		(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		FROM  GM_ATENCION A
		--
		left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		--
		INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		GROUP BY ID_TIPIFICACION, A.ID_ESTADO_ATENCION,NIVEL_1
  --UNION
		--select 1 as ORDEN,'ESCALAMIENTO NIVEL 1' AS ESCALAMIENTO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A1 
		--where A1.ID_ESTADO_ATENCION = 1 and 
		--A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and
  --      ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A1.NIVEL_1 ) AS PENDIENTE,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A2 
		--where ID_ESTADO_ATENCION = 2 and 
		--A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A3 
		--where ID_ESTADO_ATENCION = 3 and 
		--A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A3.NIVEL_1) AS CERRADO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A4 
		--where ID_ESTADO_ATENCION = 4 and 
		--A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		--1 AS N_ESCALAMIENTO,
		--(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		--FROM  GM_ATENCION A
		----
		--left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		----
		--INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		--WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		--and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		--and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		--and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		--and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		--GROUP BY NIVEL_1, A.ID_ESTADO_ATENCION,A.ID_TIPIFICACION
  --UNION
		--select 2 as ORDEN,'ESCALAMIENTO NIVEL 2' AS ESCALAMIENTO, 
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A1 
		--where A1.ID_ESTADO_ATENCION = 1 and 
		--A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A1.NIVEL_1) AS PENDIENTE,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A2 
		--where ID_ESTADO_ATENCION = 2 and 
		--A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A3 
		--where ID_ESTADO_ATENCION = 3 and 
		--A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and
		--	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) AND
	 --   A.NIVEL_1 = A3.NIVEL_1 ) AS CERRADO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A4 
		--where ID_ESTADO_ATENCION = 4 and 
		--A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		--2 AS N_ESCALAMIENTO,
		--(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		--FROM  GM_ATENCION A
		----
		--left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		----
		--INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		--WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		--and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		--and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		--and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		--and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		--GROUP BY NIVEL_1, A.ID_ESTADO_ATENCION, A.ID_TIPIFICACION
  --UNION
		--select 3 as ORDEN,'ESCALAMIENTO NIVEL 3' AS ESCALAMIENTO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A1 where A1.ID_ESTADO_ATENCION = 1 and 
		--A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A1.NIVEL_1 ) AS PENDIENTE,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A2 
		--where ID_ESTADO_ATENCION = 2 and 
		--A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
		--	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A3 
		--where ID_ESTADO_ATENCION = 3 and 
		--A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and A.NIVEL_1 = A3.NIVEL_1 AND
		--	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) ) AS CERRADO,
		--(select isnull(COUNT(*),0) AS CANTIDAD 
		--from GM_ATENCION A4 
		--where ID_ESTADO_ATENCION = 4 and 
		--A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and
		--	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		--A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		--3 AS N_ESCALAMIENTO,
		--(select NIVEL_1 from dbo.GM_TIPIFICACION E where A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 
		--FROM  GM_ATENCION A
		----
		--left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		----
		--INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		--WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		--and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		--and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		--and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		--and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia))
		--GROUP BY NIVEL_1, A.ID_ESTADO_ATENCION, A.ID_TIPIFICACION
  ) aa 
  GROUP BY NIVEL_1,N_ESCALAMIENTO,ESCALAMIENTO, ORDEN
  order by orden
  

  
  INSERT INTO ##TEMP_TICKETS
  select 5,'TOTAL','','',isnull(SUM(PENDIENTE),0), isnull(SUM(DETENIDO),0), isnull(SUM(CERRADO),0), isnull(SUM(CERRADO_CD),0) ,0 from ##TEMP_TICKETS
  
  UPDATE ##TEMP_TICKETS SET TOTAL = PENDIENTE + DETENIDO + CERRADO + CERRADO_CD
  
  select * from ##TEMP_TICKETS order by orden
  
  DROP TABLE ##TEMP_TICKETS
  
end
/*
SELECT ID_ESTADO_ATENCION, COUNT(*) FROM GM_ATENCION GROUP BY ID_ESTADO_ATENCION


SELECT * FROM GM_ATENCION WHERE ID_ESTADO_ATENCION <> 1

GROUP BY ID_ESTADO_ATENCION



select * from GM_ATENCION
delete from GM_ATENCION where id_tipificacion is null


select * from gm_atencion_historico
where id_atencion=71

delete from gm_atencion_historico
where id_atencion=71

*/
GO
/****** Object:  StoredProcedure [dbo].[stp_ReporteTickets]    Script Date: 07/23/2018 00:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_ReporteTickets]
(@idUsuario varchar(10),@fechaDesde varchar(10),@fechaHasta varchar(10),@insistencia tinyint, @idArea int)
as begin

	---drop table ##TEMP_TICKETS
	select ORDEN,NIVEL_1,N_ESCALAMIENTO, 
	ESCALAMIENTO, SUM(PENDIENTE) AS PENDIENTE, 
	SUM(DETENIDO) AS DETENIDO, SUM(CERRADO) AS CERRADO, 
	SUM(CERRADO_CD) AS CERRADO_CD ,0 AS TOTAL
	into ##TEMP_TICKETS
	from (
		select distinct 0 as ORDEN,
		'SIN ESCALAMIENTO' AS ESCALAMIENTO,

		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A1
		where A1.ID_ESTADO_ATENCION = 1 and 
		A.ID_ESTADO_ATENCION = A1.ID_ESTADO_ATENCION and 
        ((@idUsuario is null) or (A1.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A1.NIVEL_1) AS PENDIENTE,

		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A2 
		where ID_ESTADO_ATENCION = 2 and 
		A.ID_ESTADO_ATENCION = A2.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A2.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A2.NIVEL_1) AS DETENIDO,

		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A3 
		where ID_ESTADO_ATENCION = 3 and 
		A.ID_ESTADO_ATENCION = A3.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A3.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A3.NIVEL_1) AS CERRADO,

		(select isnull(COUNT(*),0) AS CANTIDAD 
		from GM_ATENCION A4 
		where ID_ESTADO_ATENCION = 4 and 
		A.ID_ESTADO_ATENCION = A4.ID_ESTADO_ATENCION and 
	    ((@idUsuario is null) or (A4.ID_USUARIO_ASIGNADO = @idUsuario)) AND
		A.NIVEL_1 = A4.NIVEL_1) AS CERRADO_CD,
		0 AS N_ESCALAMIENTO,

		(select DISTINCT NIVEL_1 from dbo.GM_TIPIFICACION E where E.nivel_1 <> '' AND  E.nivel_1 IS NOT NULL AND A.ID_TIPIFICACION = E.ID_TIPIFICACION) as NIVEL_1 

		FROM  GM_ATENCION A
		left join GM_USUARIO u on u.ID_USUARIO=A.ID_USUARIO_ASIGNADO
		INNER JOIN dbo.GM_ESTADO_ATENCION B ON A.id_ESTADO_ATENCION = B.ID_ESTADO_ATENCION 
		WHERE ((@idArea is null) or (u.ID_AREA=@idArea))
		and ((@idUsuario is null) or (a.ID_USUARIO_ASIGNADO = @idUsuario))
		and ((@fechaDesde is null) or (CONVERT(datetime,a.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
		and ((@fechaHasta is null) or (CONVERT(datetime,a.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
		and ((@insistencia is null) or (a.INSISTENCIAS = @insistencia)
		
		)
		GROUP BY ID_TIPIFICACION, A.ID_ESTADO_ATENCION,NIVEL_1
  ) aa 
  GROUP BY NIVEL_1,N_ESCALAMIENTO,ESCALAMIENTO, ORDEN
  order by orden
  

  
  INSERT INTO ##TEMP_TICKETS
  select 5,'TOTAL','','',isnull(SUM(PENDIENTE),0), isnull(SUM(DETENIDO),0), isnull(SUM(CERRADO),0), isnull(SUM(CERRADO_CD),0) ,0 from ##TEMP_TICKETS WHERE NIVEL_1 IS NOT NULL
  
  UPDATE ##TEMP_TICKETS SET TOTAL = PENDIENTE + DETENIDO + CERRADO + CERRADO_CD
  
  select * from ##TEMP_TICKETS WHERE NIVEL_1 IS NOT NULL order by orden
  
  DROP TABLE ##TEMP_TICKETS

  
  
end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarTicketHistorico_13102016]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarTicketHistorico_13102016]
(@idAtencion varchar(15),@idUsuarioCreacion varchar(10),
@idUsuarioAsignado varchar(10),@idEstadoAtencion varchar(10),@observacion varchar(1000)
,@fechaAgend varchar(15),@obsCliente varchar(1000))
as begin


declare @correlativo int
select @correlativo = ISNULL(MAX(CORRELATIVO),0) + 1
from dbo.GM_ATENCION_HISTORICO
where ID_ATENCION=@idAtencion


insert into GM_ATENCION_HISTORICO(ID_ATENCION,CORRELATIVO,FECHA,ID_USUARIO_CREACION,ID_USUARIO_ASIGNADO,ID_ESTADO_ATENCION,OBSERVACION,
FECHA_AGEND,OBSERVACION_CLIENTE)
values(@idAtencion,@correlativo,getdate(),@idUsuarioCreacion,@idUsuarioAsignado,@idEstadoAtencion,@observacion,@fechaAgend,@obsCliente)

select @correlativo as CORRELATIVO


--select * from dbo.GM_ESTADO_ATENCION

if @idEstadoAtencion = '3' OR @idEstadoAtencion = '4'
begin

update GM_ATENCION
set ID_USUARIO_CIERRE = @idUsuarioCreacion, FECHA_CIERRE=GETDATE()
where ID_ATENCION=@idAtencion

end
--select * from GM_ATENCION

end
GO
/****** Object:  StoredProcedure [dbo].[stp_IngresarTicketHistorico]    Script Date: 07/23/2018 00:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_IngresarTicketHistorico]
(@idAtencion varchar(15),@idUsuarioCreacion varchar(10),
@idUsuarioAsignado varchar(10),@idEstadoAtencion varchar(10),@observacion varchar(1000)
,@fechaAgend varchar(15))
as begin


declare @correlativo int
select @correlativo = ISNULL(MAX(CORRELATIVO),0) + 1
from dbo.GM_ATENCION_HISTORICO
where ID_ATENCION=@idAtencion


insert into GM_ATENCION_HISTORICO(ID_ATENCION,CORRELATIVO,FECHA,ID_USUARIO_CREACION,ID_USUARIO_ASIGNADO,ID_ESTADO_ATENCION,OBSERVACION,FECHA_AGEND)
values(@idAtencion,@correlativo,getdate(),@idUsuarioCreacion,@idUsuarioAsignado,@idEstadoAtencion,@observacion,@fechaAgend)

select @correlativo as CORRELATIVO


--select * from dbo.GM_ESTADO_ATENCION

if @idEstadoAtencion = '3' OR @idEstadoAtencion = '4'
begin

update GM_ATENCION
set ID_USUARIO_CIERRE = @idUsuarioCreacion, FECHA_CIERRE=GETDATE()
where ID_ATENCION=@idAtencion

end
--select * from GM_ATENCION

end
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarRutaArchivoAtencionHistorico]    Script Date: 07/23/2018 00:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarRutaArchivoAtencionHistorico]
(@idAtencion int, @Correlativo int,@ruta1 varchar(250),@ruta2 varchar(250))
as begin

if @ruta1 <> ''
	update GM_ATENCION_HISTORICO
	set RUTA_ARCHIVO_1 = @ruta1
	where ID_ATENCION=@idAtencion and CORRELATIVO=@Correlativo 

if @ruta2 <> ''
	update GM_ATENCION_HISTORICO
	set RUTA_ARCHIVO_2 = @ruta2
	where ID_ATENCION=@idAtencion and CORRELATIVO=@Correlativo 


end
GO
/****** Object:  StoredProcedure [dbo].[stp_CierraTicketsMasivo]    Script Date: 07/23/2018 00:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from GM_ATENCION

--stp_CierraTicketsMasivo '4517,4519',1
--stp_CierraTicketsMasivo 
CREATE procedure [dbo].[stp_CierraTicketsMasivo]
(@tickets varchar(max),@idUsuarioCierre int)
as begin

--select * 
--from GM_ATENCION_HISTORICO
--select * 
--from GM_ATENCION

update GM_ATENCION
set ID_ESTADO_ATENCION=3, FECHA_CIERRE=GETDATE(), ID_USUARIO_CIERRE=@idUsuarioCierre
where ID_ATENCION in (SELECT value FROM dbo.f_params_to_list(@tickets))

INSERT INTO GM_ATENCION_HISTORICO(ID_ATENCION,CORRELATIVO,FECHA,ID_USUARIO_CREACION,ID_USUARIO_ASIGNADO,ID_ESTADO_ATENCION,OBSERVACION,OBSERVACION_CLIENTE)
SELECT ID_ATENCION,
	(select max(correlativo)+1
	from GM_ATENCION_HISTORICO ah 
	where ah.ID_ATENCION in (SELECT value FROM dbo.f_params_to_list(@tickets)))
,getdate(),@idUsuarioCierre,@idUsuarioCierre,3,'CIERRE MASIVO 27/03/2017',' CIERRE MASIVO 27/03/2017'
FROM GM_ATENCION a
WHERE ID_ATENCION in/*('4526,4527')*/ (SELECT value FROM dbo.f_params_to_list(@tickets));

end

/*
SELECT ID_ATENCION,(select max(correlativo)+1 from GM_ATENCION_HISTORICO ah where ah.ID_ATENCION in ('4526','4527')),getdate(),'','',3,'MASIVO','MASIVO'
FROM GM_ATENCION a
WHERE ID_ATENCION in('4526','4527')

select * from gm_estado_atencion

select * from GM_ATENCION_HISTORICO where ID_ATENCION in('4517','4519')
*/



--select * from gm_atencion
--where id_usuario_asignado=1222 and id_estado_atencion<>3
GO
/****** Object:  StoredProcedure [dbo].[stp_EditarAtencionHistoricoRutaArchivo]    Script Date: 07/23/2018 00:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_EditarAtencionHistoricoRutaArchivo]
(@idAtencion varchar(10),@correlativo varchar(10),
@ruta varchar(250),@ruta2 varchar(250))
as begin

--update GM_GESTIONES
--set RUTA_ARCHIVO=@ruta
--where id_gestion=@idGestion

--select * from dbo.GM_ATENCION_HISTORICO

if @ruta <> ''
begin

update GM_ATENCION_HISTORICO
set RUTA_ARCHIVO_1=@ruta
where ID_ATENCION=@idAtencion and CORRELATIVO=@correlativo

end


if @ruta2 <> ''
begin

update GM_ATENCION_HISTORICO
set RUTA_ARCHIVO_2=@ruta2
where ID_ATENCION=@idAtencion and CORRELATIVO=@correlativo

end

--if @ruta3 <> ''
--begin

--update GM_GESTIONES
--set RUTA3=@ruta3
--where id_gestion=@idGestion

--end

end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketHistoricoUltimo]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicketHistoricoUltimo]
(@idAtencion varchar(10))
as begin


select top (1) *,e.USUARIO AS USUARIO_ASIG,e.ID_USUARIO AS ID_USUARIO_ASIG
,(select mc.NOM_MOTIVO_CIERRE
from gm_atencion ate inner join GM_MOTIVO_CIERRE mc on ate.id_motivo_cierre=mc.id_motivo_cierre 
where ate.id_atencion = ah.id_atencion and ah.id_estado_atencion=3) as NOM_MOTIVO_CIERRE
from GM_ATENCION_HISTORICO ah
inner join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO e on ah.ID_USUARIO_ASIGNADO = e.ID_USUARIO
inner join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION

where ID_ATENCION=@idAtencion
ORDER BY CORRELATIVO desc
end
GO
/****** Object:  StoredProcedure [dbo].[stp_buscarTicketHistorico]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[stp_buscarTicketHistorico]
(@idAtencion varchar(10))
as begin


select *,e.USUARIO AS USUARIO_ASIG,e.ID_USUARIO AS ID_USUARIO_ASIG
,(select mc.NOM_MOTIVO_CIERRE
from gm_atencion ate inner join GM_MOTIVO_CIERRE mc on ate.id_motivo_cierre=mc.id_motivo_cierre 
where ate.id_atencion = ah.id_atencion and ah.id_estado_atencion=3) as NOM_MOTIVO_CIERRE
from GM_ATENCION_HISTORICO ah
inner join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO e on ah.ID_USUARIO_ASIGNADO = e.ID_USUARIO
inner join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION

where ID_ATENCION=@idAtencion
ORDER BY CORRELATIVO
end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarTicketExporte]    Script Date: 07/23/2018 00:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- exec [stp_BuscarTicketExporte] null,'01/01/2018','31/01/2018',null
CREATE procedure [dbo].[stp_BuscarTicketExporte]
(@idUsuario varchar(10),@fechaDesde varchar(10),@fechaHasta varchar(10),@insistencia tinyint)
as begin

select
ah.ID_ATENCION as ID_TICKET,CONVERT(varchar(10),ah.FECHA,103) AS FECHA_INGRESO,
CONVERT(varchar(10),ah.FECHA_CIERRE,103) AS FECHA_CIERRE,/*tip.SLA_N1 as SLA_1,
tip.SLA_N2 as SLA_2,*/DATEDIFF(HOUR,ah.FECHA,ah.FECHA_CIERRE) as TIEMPO_DE_RESOLUCION,
u.USUARIO as USUARIO_INGRESO,t.USUARIO AS USUARIO_ASIGNADO,ea.ESTADO_ATENCION,tip.CLASE,
tip.NIVEL_1,tip.NIVEL_2, tip.NIVEL_3, 
tip.NIVEL_4,REPLACE(REPLACE(REPLACE(ah.OBSERVACION,';',''),CHAR(10),''),CHAR(13),'') AS OBSERVACION, ah.LOCAL,
(SELECT TOP 1 REPLACE(REPLACE(REPLACE(OBSERVACION,';',''),CHAR(10),''),CHAR(13),'') FROM GM_ATENCION_HISTORICO gah where gah.ID_ATENCION = ah.ID_ATENCION order by fecha desc ) as ULTIMA_OBS

from GM_ATENCION ah
left join GM_USUARIO u on ah.ID_USUARIO_CREACION = u.ID_USUARIO
left join GM_USUARIO t on ah.ID_USUARIO_ASIGNADO = t.ID_USUARIO
left join dbo.GM_ESTADO_ATENCION ea on ah.ID_ESTADO_ATENCION=ea.ID_ESTADO_ATENCION
left join gm_tipificacion tip on tip.ID_TIPIFICACION=ah.ID_TIPIFICACION
left join gm_canal ca on ca.ID_CANAL=ah.ID_CANAL
WHERE 

((@idUsuario is null) or (ah.Id_Usuario_creacion = @idUsuario))
and ((@fechaDesde is null) or (CONVERT(datetime,ah.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,ah.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))

end
GO
/****** Object:  StoredProcedure [dbo].[stp_BuscarGestionesExporte]    Script Date: 07/23/2018 00:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stp_BuscarGestionesExporte null,null,null,null,null,null
CREATE procedure [dbo].[stp_BuscarGestionesExporte]
(@campo1 varchar(10), @idUsuario varchar(10),@fechaDesde varchar(10),@fechaHasta varchar(10),
@idEstado varchar(10),@idArea int)
as begin

select
ti.ID_ATENCION as ID_TICKET,Convert(varchar(10),ti.FECHA,103) AS FECHA_INGRESO,
Convert(varchar(10),ti.FECHA_CIERRE,103) AS FECHA_CIERRE,tip.SLA_N1 as SLA_1,tip.SLA_N2 as SLA_2,
DATEDIFF(HOUR,ti.FECHA,ti.FECHA_CIERRE) as TIEMPO_DE_RESOLUCION,u.USUARIO as USUARIO_INGRESO,
upper(u2.USUARIO) AS USUARIO_ASIGNADO,ea.ESTADO_ATENCION,tip.CLASE,tip.NIVEL_1 as TIPO_TICKET,
tip.NIVEL_2 as TIPO_GESTION, tip.NIVEL_3 as CATEGORIA_GESTION,tip.NIVEL_4 as DETALLE_GESTION,
c.CANAL,REPLACE(REPLACE(REPLACE(ti.OBSERVACION,';',''),CHAR(10),''),CHAR(13),'') AS OBSERVACION,
ti.NOMBRE_CLIENTE,ti.INSISTENCIAS,TI.ID_VENDEDOR as VENDEDOR, TI.LOCAL,
(SELECT TOP 1 REPLACE(REPLACE(REPLACE(OBSERVACION,';',''),CHAR(10),''),CHAR(13),'') FROM GM_ATENCION_HISTORICO gah where gah.ID_ATENCION = TI.ID_ATENCION order by fecha desc ) as ULTIMA_OBS

from GM_ATENCION TI 
left join GM_TIPIFICACION tip on tip.ID_TIPIFICACION = TI.ID_TIPIFICACION
left join GM_ESTADO_ATENCION EA ON TI.ID_ESTADO_ATENCION = EA.ID_ESTADO_ATENCION
left join GM_USUARIO u on u.ID_USUARIO=TI.ID_USUARIO_CREACION
left join GM_USUARIO u2 on u2.ID_USUARIO=ti.ID_USUARIO_ASIGNADO
left join GM_CANAL c on ti.ID_CANAL=c.ID_CANAL
where 
((@idArea is null) or (u2.ID_AREA=@idArea))
and ((@idUsuario is null) or (ti.id_usuario_creacion = @idUsuario))
and ((@fechaDesde is null) or (CONVERT(datetime,ti.Fecha,103)>=convert(datetime,@fechaDesde + ' 00:00',103)))
and ((@fechaHasta is null) or (CONVERT(datetime,ti.Fecha,103)<=convert(datetime,@fechaHasta + ' 23:59',103)))
and ((@idEstado is null) or (TI.ID_ESTADO_ATENCION=@idEstado))

end
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_GM_EMPRESA]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_GM_EMPRESA] FOREIGN KEY([ID_EMPRESA])
REFERENCES [dbo].[GM_EMPRESA] ([ID_EMPRESA])
GO
ALTER TABLE [dbo].[GM_ATENCION] CHECK CONSTRAINT [FK_GM_ATENCION_GM_EMPRESA]
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_GM_ESTADO_ATENCION]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_GM_ESTADO_ATENCION] FOREIGN KEY([ID_ESTADO_ATENCION])
REFERENCES [dbo].[GM_ESTADO_ATENCION] ([ID_ESTADO_ATENCION])
GO
ALTER TABLE [dbo].[GM_ATENCION] CHECK CONSTRAINT [FK_GM_ATENCION_GM_ESTADO_ATENCION]
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_GM_MOTIVO_CIERRE]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_GM_MOTIVO_CIERRE] FOREIGN KEY([ID_MOTIVO_CIERRE])
REFERENCES [dbo].[GM_MOTIVO_CIERRE] ([ID_MOTIVO_CIERRE])
GO
ALTER TABLE [dbo].[GM_ATENCION] CHECK CONSTRAINT [FK_GM_ATENCION_GM_MOTIVO_CIERRE]
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_GM_TIPIFICACION]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_GM_TIPIFICACION] FOREIGN KEY([ID_TIPIFICACION])
REFERENCES [dbo].[GM_TIPIFICACION] ([ID_TIPIFICACION])
GO
ALTER TABLE [dbo].[GM_ATENCION] CHECK CONSTRAINT [FK_GM_ATENCION_GM_TIPIFICACION]
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_GM_USUARIO]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_GM_USUARIO] FOREIGN KEY([ID_USUARIO_CREACION])
REFERENCES [dbo].[GM_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[GM_ATENCION] CHECK CONSTRAINT [FK_GM_ATENCION_GM_USUARIO]
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_GM_USUARIO1]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_GM_USUARIO1] FOREIGN KEY([ID_USUARIO_ASIGNADO])
REFERENCES [dbo].[GM_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[GM_ATENCION] CHECK CONSTRAINT [FK_GM_ATENCION_GM_USUARIO1]
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_HISTORICO_GM_ATENCION]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION_HISTORICO]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_HISTORICO_GM_ATENCION] FOREIGN KEY([ID_ATENCION])
REFERENCES [dbo].[GM_ATENCION] ([ID_ATENCION])
GO
ALTER TABLE [dbo].[GM_ATENCION_HISTORICO] CHECK CONSTRAINT [FK_GM_ATENCION_HISTORICO_GM_ATENCION]
GO
/****** Object:  ForeignKey [FK_GM_ATENCION_HISTORICO_GM_ESTADO_ATENCION]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ATENCION_HISTORICO]  WITH CHECK ADD  CONSTRAINT [FK_GM_ATENCION_HISTORICO_GM_ESTADO_ATENCION] FOREIGN KEY([ID_ESTADO_ATENCION])
REFERENCES [dbo].[GM_ESTADO_ATENCION] ([ID_ESTADO_ATENCION])
GO
ALTER TABLE [dbo].[GM_ATENCION_HISTORICO] CHECK CONSTRAINT [FK_GM_ATENCION_HISTORICO_GM_ESTADO_ATENCION]
GO
/****** Object:  ForeignKey [FK_GM_LOCAL_GM_UNIDAD]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_LOCAL]  WITH CHECK ADD  CONSTRAINT [FK_GM_LOCAL_GM_UNIDAD] FOREIGN KEY([ID_UNIDAD])
REFERENCES [dbo].[GM_UNIDAD] ([ID_UNIDAD])
GO
ALTER TABLE [dbo].[GM_LOCAL] CHECK CONSTRAINT [FK_GM_LOCAL_GM_UNIDAD]
GO
/****** Object:  ForeignKey [FK_GM_LOCAL_GM_ZONA]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_LOCAL]  WITH CHECK ADD  CONSTRAINT [FK_GM_LOCAL_GM_ZONA] FOREIGN KEY([ID_ZONA])
REFERENCES [dbo].[GM_ZONA] ([ID_ZONA])
GO
ALTER TABLE [dbo].[GM_LOCAL] CHECK CONSTRAINT [FK_GM_LOCAL_GM_ZONA]
GO
/****** Object:  ForeignKey [FK_GM_MOTIVO_CIERRE_GM_TIPO_MOTIVO_CIERRE]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_MOTIVO_CIERRE]  WITH CHECK ADD  CONSTRAINT [FK_GM_MOTIVO_CIERRE_GM_TIPO_MOTIVO_CIERRE] FOREIGN KEY([ID_TIPO_MOTIVO_CIERRE])
REFERENCES [dbo].[GM_TIPO_MOTIVO_CIERRE] ([ID_TIPO_MOTIVO_CIERRE])
GO
ALTER TABLE [dbo].[GM_MOTIVO_CIERRE] CHECK CONSTRAINT [FK_GM_MOTIVO_CIERRE_GM_TIPO_MOTIVO_CIERRE]
GO
/****** Object:  ForeignKey [FK_GM_TIPIFICACION_GM_AREA]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_TIPIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_GM_TIPIFICACION_GM_AREA] FOREIGN KEY([ID_AREA])
REFERENCES [dbo].[GM_AREA] ([ID_AREA])
GO
ALTER TABLE [dbo].[GM_TIPIFICACION] CHECK CONSTRAINT [FK_GM_TIPIFICACION_GM_AREA]
GO
/****** Object:  ForeignKey [FK_GM_TIPIFICACION_GM_TIPO_MOTIVO_CIERRE]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_TIPIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_GM_TIPIFICACION_GM_TIPO_MOTIVO_CIERRE] FOREIGN KEY([ID_TIPO_MOTIVO_CIERRE])
REFERENCES [dbo].[GM_TIPO_MOTIVO_CIERRE] ([ID_TIPO_MOTIVO_CIERRE])
GO
ALTER TABLE [dbo].[GM_TIPIFICACION] CHECK CONSTRAINT [FK_GM_TIPIFICACION_GM_TIPO_MOTIVO_CIERRE]
GO
/****** Object:  ForeignKey [FK_GM_TIPIFICACION_GM_USUARIO]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_TIPIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO] FOREIGN KEY([ID_USUARIO_ESC_N1])
REFERENCES [dbo].[GM_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[GM_TIPIFICACION] CHECK CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO]
GO
/****** Object:  ForeignKey [FK_GM_TIPIFICACION_GM_USUARIO1]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_TIPIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO1] FOREIGN KEY([ID_USUARIO_ESC_N2])
REFERENCES [dbo].[GM_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[GM_TIPIFICACION] CHECK CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO1]
GO
/****** Object:  ForeignKey [FK_GM_TIPIFICACION_GM_USUARIO2]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_TIPIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO2] FOREIGN KEY([ID_USUARIO_ESC_N3])
REFERENCES [dbo].[GM_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[GM_TIPIFICACION] CHECK CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO2]
GO
/****** Object:  ForeignKey [FK_GM_TIPIFICACION_GM_USUARIO3]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_TIPIFICACION]  WITH CHECK ADD  CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO3] FOREIGN KEY([ID_USUARIO_ESC_N4])
REFERENCES [dbo].[GM_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[GM_TIPIFICACION] CHECK CONSTRAINT [FK_GM_TIPIFICACION_GM_USUARIO3]
GO
/****** Object:  ForeignKey [FK_GM_USUARIO_GM_EMPRESA]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_GM_USUARIO_GM_EMPRESA] FOREIGN KEY([ID_EMPRESA])
REFERENCES [dbo].[GM_EMPRESA] ([ID_EMPRESA])
GO
ALTER TABLE [dbo].[GM_USUARIO] CHECK CONSTRAINT [FK_GM_USUARIO_GM_EMPRESA]
GO
/****** Object:  ForeignKey [FK_GM_USUARIO_GM_PERFIL]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_GM_USUARIO_GM_PERFIL] FOREIGN KEY([ID_PERFIL])
REFERENCES [dbo].[GM_PERFIL] ([ID_PERFIL])
GO
ALTER TABLE [dbo].[GM_USUARIO] CHECK CONSTRAINT [FK_GM_USUARIO_GM_PERFIL]
GO
/****** Object:  ForeignKey [FK_GM_ZONA_GM_COMUNA]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ZONA]  WITH CHECK ADD  CONSTRAINT [FK_GM_ZONA_GM_COMUNA] FOREIGN KEY([ID_COMUNA])
REFERENCES [dbo].[GM_COMUNA] ([ID_COMUNA])
GO
ALTER TABLE [dbo].[GM_ZONA] CHECK CONSTRAINT [FK_GM_ZONA_GM_COMUNA]
GO
/****** Object:  ForeignKey [FK_GM_ZONA_GM_USUARIO_GM_USUARIO]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ZONA_GM_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_GM_ZONA_GM_USUARIO_GM_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[GM_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[GM_ZONA_GM_USUARIO] CHECK CONSTRAINT [FK_GM_ZONA_GM_USUARIO_GM_USUARIO]
GO
/****** Object:  ForeignKey [FK_GM_ZONA_GM_USUARIO_GM_ZONA]    Script Date: 07/23/2018 00:49:34 ******/
ALTER TABLE [dbo].[GM_ZONA_GM_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_GM_ZONA_GM_USUARIO_GM_ZONA] FOREIGN KEY([ID_ZONA])
REFERENCES [dbo].[GM_ZONA] ([ID_ZONA])
GO
ALTER TABLE [dbo].[GM_ZONA_GM_USUARIO] CHECK CONSTRAINT [FK_GM_ZONA_GM_USUARIO_GM_ZONA]
GO
