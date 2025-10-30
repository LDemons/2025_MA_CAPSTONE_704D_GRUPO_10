SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets_asignacionticket](
	[asignacion_id] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha_asignacion] [date] NOT NULL,
	[comentarios] [nvarchar](255) NOT NULL,
	[ticket_id] [bigint] NOT NULL,
	[usuario_asignado_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_asignacionticket] ADD PRIMARY KEY CLUSTERED 
(
	[asignacion_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_asignacionticket_ticket_id_3704c396] ON [dbo].[tickets_asignacionticket]
(
	[ticket_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_asignacionticket_usuario_asignado_id_007f63e7] ON [dbo].[tickets_asignacionticket]
(
	[usuario_asignado_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_asignacionticket]  WITH CHECK ADD  CONSTRAINT [tickets_asignacionticket_ticket_id_3704c396_fk_tickets_ticket_ticket_id] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[tickets_ticket] ([ticket_id])
GO
ALTER TABLE [dbo].[tickets_asignacionticket] CHECK CONSTRAINT [tickets_asignacionticket_ticket_id_3704c396_fk_tickets_ticket_ticket_id]
GO
ALTER TABLE [dbo].[tickets_asignacionticket]  WITH CHECK ADD  CONSTRAINT [tickets_asignacionticket_usuario_asignado_id_007f63e7_fk_tickets_usuario_rut] FOREIGN KEY([usuario_asignado_id])
REFERENCES [dbo].[tickets_usuario] ([rut])
GO
ALTER TABLE [dbo].[tickets_asignacionticket] CHECK CONSTRAINT [tickets_asignacionticket_usuario_asignado_id_007f63e7_fk_tickets_usuario_rut]
GO

CREATE TABLE [dbo].[tickets_categoria](
	[categoria_id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](80) NOT NULL,
	[descripcion] [nvarchar](120) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_categoria] ADD PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tickets_comentario](
	[comentario_id] [bigint] IDENTITY(1,1) NOT NULL,
	[contenido] [nvarchar](max) NOT NULL,
	[fecha_creacion] [date] NOT NULL,
	[autor_id] [int] NOT NULL,
	[ticket_id] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_comentario] ADD PRIMARY KEY CLUSTERED 
(
	[comentario_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_comentario_autor_id_dd6efc46] ON [dbo].[tickets_comentario]
(
	[autor_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_comentario_ticket_id_d6de9811] ON [dbo].[tickets_comentario]
(
	[ticket_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_comentario]  WITH CHECK ADD  CONSTRAINT [tickets_comentario_autor_id_dd6efc46_fk_tickets_usuario_rut] FOREIGN KEY([autor_id])
REFERENCES [dbo].[tickets_usuario] ([rut])
GO
ALTER TABLE [dbo].[tickets_comentario] CHECK CONSTRAINT [tickets_comentario_autor_id_dd6efc46_fk_tickets_usuario_rut]
GO
ALTER TABLE [dbo].[tickets_comentario]  WITH CHECK ADD  CONSTRAINT [tickets_comentario_ticket_id_d6de9811_fk_tickets_ticket_ticket_id] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[tickets_ticket] ([ticket_id])
GO
ALTER TABLE [dbo].[tickets_comentario] CHECK CONSTRAINT [tickets_comentario_ticket_id_d6de9811_fk_tickets_ticket_ticket_id]
GO

CREATE TABLE [dbo].[tickets_notificacion](
	[notificacion_id] [bigint] IDENTITY(1,1) NOT NULL,
	[mensaje] [nvarchar](255) NOT NULL,
	[leido] [bit] NOT NULL,
	[fecha_creacion] [datetimeoffset](7) NOT NULL,
	[ticket_id] [bigint] NOT NULL,
	[usuario_destino_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_notificacion] ADD PRIMARY KEY CLUSTERED 
(
	[notificacion_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_notificacion_ticket_id_cc82fb37] ON [dbo].[tickets_notificacion]
(
	[ticket_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_notificacion_usuario_destino_id_34d8178e] ON [dbo].[tickets_notificacion]
(
	[usuario_destino_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_notificacion]  WITH CHECK ADD  CONSTRAINT [tickets_notificacion_ticket_id_cc82fb37_fk_tickets_ticket_ticket_id] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[tickets_ticket] ([ticket_id])
GO
ALTER TABLE [dbo].[tickets_notificacion] CHECK CONSTRAINT [tickets_notificacion_ticket_id_cc82fb37_fk_tickets_ticket_ticket_id]
GO
ALTER TABLE [dbo].[tickets_notificacion]  WITH CHECK ADD  CONSTRAINT [tickets_notificacion_usuario_destino_id_34d8178e_fk_tickets_usuario_rut] FOREIGN KEY([usuario_destino_id])
REFERENCES [dbo].[tickets_usuario] ([rut])
GO
ALTER TABLE [dbo].[tickets_notificacion] CHECK CONSTRAINT [tickets_notificacion_usuario_destino_id_34d8178e_fk_tickets_usuario_rut]
GO

CREATE TABLE [dbo].[tickets_prioridad](
	[prioridad_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sla_horas] [int] NOT NULL,
	[Tipo_Nivel] [nvarchar](12) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_prioridad] ADD PRIMARY KEY CLUSTERED 
(
	[prioridad_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tickets_rol](
	[rol_id] [smallint] NOT NULL,
	[nombre] [nvarchar](120) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_rol] ADD PRIMARY KEY CLUSTERED 
(
	[rol_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[tickets_rol] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tickets_ticket](
	[ticket_id] [bigint] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](200) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
	[fecha_creacion] [date] NOT NULL,
	[cerrado_en] [date] NULL,
	[categoria_id] [bigint] NOT NULL,
	[prioridad_id] [bigint] NOT NULL,
	[usuario_creador_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_ticket] ADD PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_ticket_categoria_id_0a1509bc] ON [dbo].[tickets_ticket]
(
	[categoria_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_ticket_prioridad_id_7052ab00] ON [dbo].[tickets_ticket]
(
	[prioridad_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_ticket_usuario_creador_id_f07d4b5d] ON [dbo].[tickets_ticket]
(
	[usuario_creador_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_ticket]  WITH CHECK ADD  CONSTRAINT [tickets_ticket_categoria_id_0a1509bc_fk_tickets_categoria_categoria_id] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[tickets_categoria] ([categoria_id])
GO
ALTER TABLE [dbo].[tickets_ticket] CHECK CONSTRAINT [tickets_ticket_categoria_id_0a1509bc_fk_tickets_categoria_categoria_id]
GO
ALTER TABLE [dbo].[tickets_ticket]  WITH CHECK ADD  CONSTRAINT [tickets_ticket_prioridad_id_7052ab00_fk_tickets_prioridad_prioridad_id] FOREIGN KEY([prioridad_id])
REFERENCES [dbo].[tickets_prioridad] ([prioridad_id])
GO
ALTER TABLE [dbo].[tickets_ticket] CHECK CONSTRAINT [tickets_ticket_prioridad_id_7052ab00_fk_tickets_prioridad_prioridad_id]
GO
ALTER TABLE [dbo].[tickets_ticket]  WITH CHECK ADD  CONSTRAINT [tickets_ticket_usuario_creador_id_f07d4b5d_fk_tickets_usuario_rut] FOREIGN KEY([usuario_creador_id])
REFERENCES [dbo].[tickets_usuario] ([rut])
GO
ALTER TABLE [dbo].[tickets_ticket] CHECK CONSTRAINT [tickets_ticket_usuario_creador_id_f07d4b5d_fk_tickets_usuario_rut]
GO

CREATE TABLE [dbo].[tickets_usuario](
	[rut] [int] NOT NULL,
	[dv] [nvarchar](1) NOT NULL,
	[nombre] [nvarchar](120) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[contrasenia_hash] [nvarchar](255) NOT NULL,
	[fecha_creacion] [date] NOT NULL,
	[activo] [bit] NOT NULL,
	[rol_id] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_usuario] ADD PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [dbo].[tickets_usuario] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tickets_usuario_rol_id_bc411f34] ON [dbo].[tickets_usuario]
(
	[rol_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tickets_usuario]  WITH CHECK ADD  CONSTRAINT [tickets_usuario_rol_id_bc411f34_fk_tickets_rol_rol_id] FOREIGN KEY([rol_id])
REFERENCES [dbo].[tickets_rol] ([rol_id])
GO
ALTER TABLE [dbo].[tickets_usuario] CHECK CONSTRAINT [tickets_usuario_rol_id_bc411f34_fk_tickets_rol_rol_id]
GO