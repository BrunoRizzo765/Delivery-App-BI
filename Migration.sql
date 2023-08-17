USE [GD1C2023]
GO

/****** Object:  Schema [LOS_CEBOLLITAS]    Script Date: 21/5/2023 10:55:32 ******/
CREATE SCHEMA [LOS_CEBOLLITAS]
GO

CREATE TABLE LOS_CEBOLLITAS.pedidos
(
	ID_PEDIDO DECIMAL(18,0) IDENTITY(1,1) NOT NULL,
	NRO_PEDIDO DECIMAL(18,0) NOT NULL,
	ID_MEDIO_PAGO INT,
	ID_LOCAL INT NOT NULL,
	ID_USUARIO INT,
	ID_ENVIO INT,
	TARIFA_SERVICIO DECIMAL(18,2),
	TOTAL_DESCUENTO DECIMAL(18,2),
	TOTAL_PEDIDO DECIMAL(18,2),
	PEDIDO_TOTAL_PRODUCTOS DECIMAL(18,2),
	OBSERVACIONES NVARCHAR(255),
	FECHA_HORA_PEDIDO DATETIME NOT NULL,
	FECHA_HORA_ENTREGA DATETIME,
	TIEMPO_ESTIMADO_ENTREGA DECIMAL(18,2),
	CALIFICACION DECIMAL(18,0),
	ESTADO_PEDIDO INT
);


CREATE TABLE LOS_CEBOLLITAS.medio_pago
(
	ID_MEDIO_PAGO INT IDENTITY(1,1),
	ID_USUARIO INT,
	ID_TIPO_PAGO INT,
	NRO_TARJETA NVARCHAR(50),
	MARCA_TARJETA NVARCHAR(100)
);

CREATE TABLE LOS_CEBOLLITAS.tipo_pago
(
	ID_TIPO_PAGO INT IDENTITY(1,1),
	MEDIO_PAGO NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.local
(
	ID_LOCAL INT IDENTITY(1,1),
	ID_DIRECCION INT,
	DESCRIPCION NVARCHAR(255),
	ID_TIPO INT,
	NOMBRE NVARCHAR(100),
	CATEGORIA NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.horario_local
(
	ID_HORARIOS INT IDENTITY(1,1),
	ID_LOCAL INT,
	HORA_APERTURA DECIMAL(18,0),
	HORA_CIERRE DECIMAL(18,0),
	DIA NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.envio
(
	ID_ENVIO INT IDENTITY(1,1),
	ID_REPARTIDOR INT,
	PROPINA DECIMAL(18,2),
	PRECIO_ENVIO DECIMAL(18,2),
	DIRECCION_ENVIO INT
);

CREATE TABLE LOS_CEBOLLITAS.repartidor
(
	ID_REPARTIDOR INT IDENTITY(1,1),
	ID_DIRECCION INT,
	NOMBRE NVARCHAR(255),
	APELLIDO NVARCHAR(100),
	DNI DECIMAL(18,0),
	ID_TIPO_MOVILIDAD INT,
	TELEFONO DECIMAL(18,0),
	MAIL NVARCHAR(255),
	FECHA_NAC DATE,
	ID_LOCALIDAD_ACTIVA INT
);

CREATE TABLE LOS_CEBOLLITAS.direcciones
(
	ID_DIRECCION INT IDENTITY(1,1),
	ID_LOCALIDAD INT,
	DIRECCION NVARCHAR(255)
);

CREATE TABLE LOS_CEBOLLITAS.localidad
(
	ID_LOCALIDAD INT IDENTITY(1,1),
	NOMBRE NVARCHAR(255),
	PROVINCIA NVARCHAR(255)
);


CREATE TABLE LOS_CEBOLLITAS.usuario
(
	ID_USUARIO INT IDENTITY(1,1),
	NOMBRE NVARCHAR(255),
	APELLIDO NVARCHAR(255),
	DNI DECIMAL(18,0),
	FECHA_REGISTRO DATETIME2(3),
	TELEFONO DECIMAL(18,0),
	MAIL NVARCHAR(255),
	FECHA_NAC DATE
);

CREATE TABLE LOS_CEBOLLITAS.items
(
	NRO_PEDIDO DECIMAL(18,0),
	NRO_ITEM INT IDENTITY(1,1),
	ID_PRODUCTO INT,
	PRECIO_UNITARIO DECIMAL(18,2),
	CANTIDAD DECIMAL(18,0),
);

CREATE TABLE LOS_CEBOLLITAS.producto
(
	ID_PRODUCTO INT IDENTITY(1,1),
	CODIGO_PRODUCTO NVARCHAR(50),
	NOMBRE NVARCHAR(50),
	ID_LOCAL INT,
	DESCRIPCION NVARCHAR(255),
	PRECIO_UNITARIO DECIMAL(18,2),
);

CREATE TABLE LOS_CEBOLLITAS.mensajeria (
	ID_MENSAJERIA INT IDENTITY(1,1),
	NRO_MENSAJERIA DECIMAL(18,0),
	ID_MEDIO_PAGO INT,
	ID_USUARIO INT,
	ID_REPARTIDOR INT,
	TIPO_PAQUETE INT,
	DIR_ORIGEN NVARCHAR(255) NOT NULL,
	DIR_DEST NVARCHAR(255) NOT NULL,
	DISTANCIA_KMS DECIMAL(18,2),
	VALOR_ASEGURADO DECIMAL(18,2),
	PRECIO_ENVIO DECIMAL(18,2)  NOT NULL,
	PRECIO_SEGURO DECIMAL(18,2),
	PROPINA DECIMAL(18,2),
	TOTAL_MENSAJERIA FLOAT NOT NULL,
	OBSERVACIONES NVARCHAR(255),
	FECHA_HORA_MENSAJERIA DATETIME,
	FECHA_HORA_ENTREGA DATETIME,
	TIEMPO_ESTIMADO DECIMAL(18,2),
	CALIFICACION DECIMAL(18,0),
	ID_ESTADO INT
);

CREATE TABLE LOS_CEBOLLITAS.tipo_paquete (
	TIPO_PAQUETE INT IDENTITY(1,1),
	TIPO NVARCHAR(50),
	ALTO_MAX DECIMAL(18,2),
	LARGO_MAX DECIMAL(18,2),
	ANCHO_MAX DECIMAL(18,2),
	PESO_MAX DECIMAL(18,2),
	PRECIO_TIPO DECIMAL(18,2)
);

CREATE TABLE LOS_CEBOLLITAS.tipo_estado_mensajeria (
	ID_ESTADO_MENSAJERIA INT IDENTITY(1,1),
	ESTADO VARCHAR(200)
);

CREATE TABLE LOS_CEBOLLITAS.reclamo (
	ID_RECLAMO DECIMAL(18,0) IDENTITY(1,1),
	NRO_RECLAMO DECIMAL(18,0) NOT NULL,
	ID_USUARIO INT,
	NRO_PEDIDO DECIMAL(18,0),
	ID_OPERADOR INT NOT NULL,
	ID_TIPO_RECLAMO INT,
	DESCRIPCION NVARCHAR(255),
	FECHA_HORA_RECLAMO DATETIME,
	FECHA_HORA_SOLUCION DATETIME,
	SOLUCION NVARCHAR(255),
	CALIFICACION DECIMAL(18,0),
	ESTADO NVARCHAR(50),
);

CREATE TABLE LOS_CEBOLLITAS.tipo_reclamo (
	ID_TIPO_RECLAMO INT IDENTITY(1,1),
	DESCRIPCION NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.reclamo_cupon (
	ID_RECLAMO_CUPON DECIMAL(18,0) IDENTITY(1,1),
	NRO_RECLAMO DECIMAL(18,0) NOT NULL,
	NRO_CUPON_RECLAMO DECIMAL(18,0) NOT NULL
);

CREATE TABLE LOS_CEBOLLITAS.operador_reclamo (
	ID_OPERADOR INT IDENTITY(1,1),
	ID_DIRECCION INT,
	NOMBRE NVARCHAR(255),
	APELLIDO NVARCHAR(255),
	DNI DECIMAL(18,0),
	TELEFONO DECIMAL(18,0),
	MAIL NVARCHAR(255),
	FECHA_NAC DATE
);

CREATE TABLE LOS_CEBOLLITAS.direccion_usuario (
	ID_USUARIO INT NOT NULL,
	ID_DIRECCION INT NOT NULL,
	DIRECCION_TIPO NVARCHAR(50),
);

CREATE TABLE LOS_CEBOLLITAS.tipo_local (
	ID_TIPO INT IDENTITY(1,1),
	TIPO NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.tipo_movilidad (
	ID_TIPO_MOVILIDAD INT IDENTITY(1,1),
	MOVILIDAD NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.categoria (
	ID_CATEGORIA INT IDENTITY(1,1),
	CATEGORIA NVARCHAR(100)
);

CREATE TABLE LOS_CEBOLLITAS.tipo_estado_pedido (
	ID_ESTADO_PEDIDO INT IDENTITY(1,1),
	ESTADO_PEDIDO NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.cupon (
	NRO_CUPON DECIMAL(18,0) NOT NULL,
	ID_USUARIO INT,
	MONTO DECIMAL(18,2) CHECK(MONTO > 0),
	FECHA_ALTA DATETIME,
	FECHA_VENCIMIENTO DATETIME,
	ID_TIPO_CUPON INT
);

CREATE TABLE LOS_CEBOLLITAS.tipo_cupon (
	ID_TIPO_CUPON INT IDENTITY(1,1),
	TIPO NVARCHAR(50)
);

CREATE TABLE LOS_CEBOLLITAS.cupones_pedido (
	ID_CUPON_PEDIDO INT IDENTITY(1,1),
	NRO_PEDIDO DECIMAL(18,0),
	NRO_CUPON DECIMAL(18,0) NOT NULL,
);


ALTER TABLE LOS_CEBOLLITAS.tipo_local ADD CONSTRAINT pk_tipo_local PRIMARY KEY (ID_TIPO);
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT pk_pedidos PRIMARY KEY (ID_PEDIDO)
ALTER TABLE LOS_CEBOLLITAS.direcciones ADD CONSTRAINT PK_direcciones PRIMARY KEY (ID_DIRECCION);
ALTER TABLE LOS_CEBOLLITAS.tipo_movilidad ADD CONSTRAINT pk_tipo_movilidad PRIMARY KEY (ID_TIPO_MOVILIDAD);
ALTER TABLE LOS_CEBOLLITAS.usuario ADD CONSTRAINT PK_usuario PRIMARY KEY (ID_USUARIO);
ALTER TABLE LOS_CEBOLLITAS.medio_pago ADD CONSTRAINT pk_medio_pago PRIMARY KEY (ID_MEDIO_PAGO)
ALTER TABLE LOS_CEBOLLITAS.tipo_pago ADD CONSTRAINT pk_tipo_pago PRIMARY KEY (ID_TIPO_PAGO)
ALTER TABLE LOS_CEBOLLITAS.local ADD CONSTRAINT PK_local PRIMARY KEY (ID_LOCAL);
ALTER TABLE LOS_CEBOLLITAS.tipo_cupon ADD CONSTRAINT pk_tipo_cupon PRIMARY KEY (ID_TIPO_CUPON);
ALTER TABLE LOS_CEBOLLITAS.cupones_pedido ADD CONSTRAINT pk_cupon_pedido PRIMARY KEY (ID_CUPON_PEDIDO);
ALTER TABLE LOS_CEBOLLITAS.categoria ADD CONSTRAINT pk_categoria PRIMARY KEY (ID_CATEGORIA);
ALTER TABLE LOS_CEBOLLITAS.tipo_estado_pedido ADD CONSTRAINT pk_tipo_estado_pedido PRIMARY KEY (ID_ESTADO_PEDIDO);
ALTER TABLE LOS_CEBOLLITAS.cupon ADD CONSTRAINT pk_cupon PRIMARY KEY (NRO_CUPON);
ALTER TABLE LOS_CEBOLLITAS.direccion_usuario ADD CONSTRAINT pk_direccion_usuario PRIMARY KEY (ID_USUARIO, ID_DIRECCION);
ALTER TABLE LOS_CEBOLLITAS.reclamo_cupon ADD CONSTRAINT pk_reclamo_cupon PRIMARY KEY (ID_RECLAMO_CUPON);
ALTER TABLE LOS_CEBOLLITAS.operador_reclamo ADD CONSTRAINT pk_operador_reclamo PRIMARY KEY (ID_OPERADOR);
ALTER TABLE LOS_CEBOLLITAS.reclamo ADD CONSTRAINT pk_reclamo PRIMARY KEY (ID_RECLAMO);
ALTER TABLE LOS_CEBOLLITAS.tipo_reclamo ADD CONSTRAINT pk_tipo_reclamo PRIMARY KEY (ID_TIPO_RECLAMO);
ALTER TABLE LOS_CEBOLLITAS.tipo_estado_mensajeria ADD CONSTRAINT pk_tipo_estado_mensajeria PRIMARY KEY (ID_ESTADO_MENSAJERIA);
ALTER TABLE LOS_CEBOLLITAS.tipo_paquete ADD CONSTRAINT pk_tipo_paquete PRIMARY KEY (TIPO_PAQUETE);
ALTER TABLE LOS_CEBOLLITAS.mensajeria add constraint pk_mensajeria primary key (ID_MENSAJERIA);
ALTER TABLE LOS_CEBOLLITAS.items ADD CONSTRAINT PK_items PRIMARY KEY (NRO_ITEM);
ALTER TABLE LOS_CEBOLLITAS.producto ADD CONSTRAINT PK_producto PRIMARY KEY (ID_PRODUCTO);
ALTER TABLE LOS_CEBOLLITAS.localidad ADD CONSTRAINT PK_localidad PRIMARY KEY (ID_LOCALIDAD);
ALTER TABLE LOS_CEBOLLITAS.repartidor ADD CONSTRAINT PK_repartidor PRIMARY KEY (ID_REPARTIDOR);
ALTER TABLE LOS_CEBOLLITAS.envio ADD CONSTRAINT PK_envio PRIMARY KEY (ID_ENVIO);
ALTER TABLE LOS_CEBOLLITAS.horario_local ADD CONSTRAINT PK_horario_local PRIMARY KEY (ID_HORARIOS);

ALTER TABLE LOS_CEBOLLITAS.direcciones ADD CONSTRAINT FK_direcciones_localidad FOREIGN KEY (ID_LOCALIDAD) REFERENCES LOS_CEBOLLITAS.localidad(ID_LOCALIDAD);

ALTER TABLE LOS_CEBOLLITAS.medio_pago ADD CONSTRAINT fk_usuario_medio_pago FOREIGN KEY (ID_USUARIO) REFERENCES LOS_CEBOLLITAS.usuario(ID_USUARIO)
ALTER TABLE LOS_CEBOLLITAS.medio_pago ADD CONSTRAINT fk_tipo_pago_medio_pago FOREIGN KEY (ID_TIPO_PAGO) REFERENCES LOS_CEBOLLITAS.tipo_pago(ID_TIPO_PAGO)

ALTER TABLE LOS_CEBOLLITAS.local ADD CONSTRAINT FK_local_direcciones FOREIGN KEY (ID_DIRECCION) REFERENCES LOS_CEBOLLITAS.direcciones(ID_DIRECCION);
ALTER TABLE LOS_CEBOLLITAS.local ADD CONSTRAINT FK_local_tipo_local FOREIGN KEY (ID_TIPO) REFERENCES LOS_CEBOLLITAS.tipo_local(ID_TIPO);

ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT fk_medio_pago_pedidos FOREIGN KEY (ID_MEDIO_PAGO) REFERENCES LOS_CEBOLLITAS.medio_pago (ID_MEDIO_PAGO)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT fk_local_pedidos FOREIGN KEY (ID_LOCAL) REFERENCES LOS_CEBOLLITAS.local (ID_LOCAL)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT fk_usuario_pedidos FOREIGN KEY (ID_USUARIO) REFERENCES LOS_CEBOLLITAS.usuario (ID_USUARIO)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT fk_envio_pedidos FOREIGN KEY (ID_ENVIO) REFERENCES LOS_CEBOLLITAS.envio (ID_ENVIO)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT check_tarifa_servicio_pedidos CHECK (TARIFA_SERVICIO >= 0)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT check_total_descuento_pedidos CHECK (TOTAL_DESCUENTO >= 0)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT check_pedido_total_productos_pedidos CHECK (PEDIDO_TOTAL_PRODUCTOS >= 0)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT check_fecha_hora_entrega_pedidos CHECK (FECHA_HORA_ENTREGA >= FECHA_HORA_PEDIDO)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT check_tiempo_estimado_entrega_pedidos CHECK (TIEMPO_ESTIMADO_ENTREGA >= 0)
ALTER TABLE LOS_CEBOLLITAS.pedidos ADD CONSTRAINT check_calificacion_pedidos CHECK (CALIFICACION >= 0 AND CALIFICACION <= 5)

ALTER TABLE LOS_CEBOLLITAS.cupones_pedido ADD CONSTRAINT fk_cupones_pedido_pedido FOREIGN KEY (NRO_PEDIDO) REFERENCES LOS_CEBOLLITAS.pedidos (ID_PEDIDO);
ALTER TABLE LOS_CEBOLLITAS.cupones_pedido ADD CONSTRAINT fk_cupones_pedido_cupon FOREIGN KEY (NRO_CUPON) REFERENCES LOS_CEBOLLITAS.cupon (NRO_CUPON);

ALTER TABLE LOS_CEBOLLITAS.cupon ADD CONSTRAINT fk_cupon_usuario FOREIGN KEY (ID_USUARIO) REFERENCES LOS_CEBOLLITAS.usuario (ID_USUARIO);
ALTER TABLE LOS_CEBOLLITAS.cupon ADD CONSTRAINT fk_cupon_tipo_cupon FOREIGN KEY (ID_TIPO_CUPON) REFERENCES LOS_CEBOLLITAS.tipo_cupon (ID_TIPO_CUPON);

ALTER TABLE LOS_CEBOLLITAS.direccion_usuario ADD CONSTRAINT fk_direccion_usuario_usuario FOREIGN KEY (ID_USUARIO) REFERENCES LOS_CEBOLLITAS.usuario (ID_USUARIO);
ALTER TABLE LOS_CEBOLLITAS.direccion_usuario ADD CONSTRAINT fk_direccion_usuario_direcciones FOREIGN KEY (ID_DIRECCION) REFERENCES LOS_CEBOLLITAS.direcciones (ID_DIRECCION);


ALTER TABLE LOS_CEBOLLITAS.reclamo_cupon ADD CONSTRAINT fk_reclamo_cupon_reclamo FOREIGN KEY (NRO_RECLAMO) REFERENCES LOS_CEBOLLITAS.reclamo (ID_RECLAMO);
ALTER TABLE LOS_CEBOLLITAS.reclamo_cupon ADD CONSTRAINT fk_reclamo_cupon_cupon FOREIGN KEY (NRO_CUPON_RECLAMO) REFERENCES LOS_CEBOLLITAS.cupon (NRO_CUPON);
ALTER TABLE LOS_CEBOLLITAS.operador_reclamo ADD CONSTRAINT fk_direccion_operador FOREIGN KEY (ID_DIRECCION) REFERENCES LOS_CEBOLLITAS.direcciones (ID_DIRECCION);


ALTER TABLE LOS_CEBOLLITAS.reclamo ADD CONSTRAINT fk_usuario_reclamo FOREIGN KEY (ID_USUARIO) REFERENCES LOS_CEBOLLITAS.usuario (ID_USUARIO);
ALTER TABLE LOS_CEBOLLITAS.reclamo ADD CONSTRAINT fk_pedido_reclamo FOREIGN KEY (NRO_PEDIDO) REFERENCES LOS_CEBOLLITAS.pedidos (ID_PEDIDO);
ALTER TABLE LOS_CEBOLLITAS.reclamo ADD CONSTRAINT fk_operador_reclamo FOREIGN KEY (ID_OPERADOR) REFERENCES LOS_CEBOLLITAS.operador_reclamo (ID_OPERADOR);
ALTER TABLE LOS_CEBOLLITAS.reclamo ADD CONSTRAINT fk_tipo_reclamo FOREIGN KEY (ID_TIPO_RECLAMO) REFERENCES LOS_CEBOLLITAS.tipo_reclamo (ID_TIPO_RECLAMO);
ALTER TABLE LOS_CEBOLLITAS.reclamo ADD CONSTRAINT ck_calificacion_reclamo CHECK (CALIFICACION IN (1, 2, 3, 4, 5));

ALTER TABLE LOS_CEBOLLITAS.tipo_paquete ADD CONSTRAINT ck_alto_max_tipo_paquete CHECK (ALTO_MAX > 0);
ALTER TABLE LOS_CEBOLLITAS.tipo_paquete ADD CONSTRAINT ck_largo_max_tipo_paquete CHECK (LARGO_MAX > 0);
ALTER TABLE LOS_CEBOLLITAS.tipo_paquete ADD CONSTRAINT ck_ancho_max_tipo_paquete CHECK (ANCHO_MAX > 0);
ALTER TABLE LOS_CEBOLLITAS.tipo_paquete ADD CONSTRAINT ck_peso_max_tipo_paquete CHECK (PESO_MAX > 0);
ALTER TABLE LOS_CEBOLLITAS.tipo_paquete ADD CONSTRAINT ck_precio_tipo_tipo_paquete CHECK (PRECIO_TIPO > 0);

ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT fk_medio_pago FOREIGN KEY (ID_MEDIO_PAGO) REFERENCES LOS_CEBOLLITAS.medio_pago(ID_MEDIO_PAGO)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT fk_usuario FOREIGN KEY (ID_USUARIO) REFERENCES LOS_CEBOLLITAS.usuario(ID_USUARIO)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT fk_repartidor FOREIGN KEY (ID_REPARTIDOR) REFERENCES LOS_CEBOLLITAS.repartidor(ID_REPARTIDOR)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT fk_paquete FOREIGN KEY (TIPO_PAQUETE) REFERENCES LOS_CEBOLLITAS.tipo_paquete(TIPO_PAQUETE)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT fk_mensajeria_estado FOREIGN KEY (ID_ESTADO) REFERENCES LOS_CEBOLLITAS.tipo_estado_mensajeria(ID_ESTADO_MENSAJERIA)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT check_valor CHECK (VALOR_ASEGURADO > 0)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT check_precio_envio CHECK(PRECIO_ENVIO > 0)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT check_precio_seguro CHECK (PRECIO_SEGURO > 0)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT check_propina CHECK (PROPINA > 0)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT check_tiempo CHECK (TIEMPO_ESTIMADO > 0)
ALTER TABLE LOS_CEBOLLITAS.mensajeria ADD CONSTRAINT check_calificacion CHECK (CALIFICACION IN (1, 2, 3, 4, 5))

ALTER TABLE LOS_CEBOLLITAS.items ADD CONSTRAINT FK_items_pedido FOREIGN KEY (NRO_PEDIDO) REFERENCES LOS_CEBOLLITAS.pedidos(ID_PEDIDO);
ALTER TABLE LOS_CEBOLLITAS.items ADD CONSTRAINT FK_items_producto FOREIGN KEY (ID_PRODUCTO) REFERENCES LOS_CEBOLLITAS.producto(ID_PRODUCTO);

ALTER TABLE LOS_CEBOLLITAS.producto ADD CONSTRAINT FK_producto_local FOREIGN KEY (ID_LOCAL) REFERENCES LOS_CEBOLLITAS.local(ID_LOCAL);

ALTER TABLE LOS_CEBOLLITAS.items ADD CONSTRAINT CHK_items_precio_unitario CHECK (PRECIO_UNITARIO > 0);
ALTER TABLE LOS_CEBOLLITAS.items ADD CONSTRAINT CHK_items_cantidad CHECK (CANTIDAD > 0);

ALTER TABLE LOS_CEBOLLITAS.producto ADD CONSTRAINT CHK_producto_precio_unitario CHECK (PRECIO_UNITARIO > 0);

ALTER TABLE LOS_CEBOLLITAS.repartidor ADD CONSTRAINT FK_repartidor_direcciones FOREIGN KEY (ID_DIRECCION) REFERENCES LOS_CEBOLLITAS.direcciones(ID_DIRECCION);
ALTER TABLE LOS_CEBOLLITAS.repartidor ADD CONSTRAINT FK_repartidor_localidad FOREIGN KEY (ID_LOCALIDAD_ACTIVA) REFERENCES LOS_CEBOLLITAS.localidad(ID_LOCALIDAD);
ALTER TABLE LOS_CEBOLLITAS.repartidor ADD CONSTRAINT FK_repartidor_tipo_movilidad FOREIGN KEY (ID_TIPO_MOVILIDAD) REFERENCES LOS_CEBOLLITAS.tipo_movilidad(ID_TIPO_MOVILIDAD);

ALTER TABLE LOS_CEBOLLITAS.envio ADD CONSTRAINT FK_envio_repartidor FOREIGN KEY (ID_REPARTIDOR) REFERENCES LOS_CEBOLLITAS.repartidor(ID_REPARTIDOR);
ALTER TABLE LOS_CEBOLLITAS.envio ADD CONSTRAINT FK_envio_direcciones FOREIGN KEY (DIRECCION_ENVIO) REFERENCES LOS_CEBOLLITAS.direcciones(ID_DIRECCION);

ALTER TABLE LOS_CEBOLLITAS.envio ADD CONSTRAINT CHK_envio_PRECIO_ENVIO CHECK (PRECIO_ENVIO > 0);

ALTER TABLE LOS_CEBOLLITAS.horario_local ADD CONSTRAINT FK_horario_local_local FOREIGN KEY (ID_LOCAL) REFERENCES LOS_CEBOLLITAS.local(ID_LOCAL);
GO

CREATE PROCEDURE LOS_CEBOLLITAS.MigrarDatosTablaMaestra
AS
BEGIN

	-- Insertar datos en la tabla "tipo_cupon"
	INSERT INTO LOS_CEBOLLITAS.tipo_cupon (TIPO)
	SELECT DISTINCT CUPON_TIPO FROM gd_esquema.Maestra	

	-- Insertar datos en la tabla "tipo_local"
    INSERT INTO LOS_CEBOLLITAS.tipo_local (TIPO)
    SELECT DISTINCT LOCAL_TIPO
    FROM gd_esquema.Maestra;

    -- Insertar datos en la tabla "tipo_movilidad"
    INSERT INTO LOS_CEBOLLITAS.tipo_movilidad (MOVILIDAD)
    SELECT DISTINCT REPARTIDOR_TIPO_MOVILIDAD
    FROM gd_esquema.Maestra;

	-- Insertar datos en la tabla "tipo_reclamo"
	INSERT INTO LOS_CEBOLLITAS.tipo_reclamo (DESCRIPCION)
	SELECT DISTINCT RECLAMO_TIPO
	FROM gd_esquema.Maestra;

	-- Insertar datos en la tabla "tipo_estado_mensajeria"
	INSERT INTO LOS_CEBOLLITAS.tipo_estado_mensajeria (ESTADO)
	SELECT DISTINCT ENVIO_MENSAJERIA_ESTADO FROM gd_esquema.Maestra

	-- Insertar datos en la tabla "tipo_paquete"
	INSERT INTO LOS_CEBOLLITAS.tipo_paquete (TIPO, ALTO_MAX, LARGO_MAX,ANCHO_MAX,PESO_MAX,PRECIO_TIPO)
	SELECT  DISTINCT (PAQUETE_TIPO), PAQUETE_ALTO_MAX,PAQUETE_LARGO_MAX,PAQUETE_ANCHO_MAX,PAQUETE_PESO_MAX,PAQUETE_TIPO_PRECIO 
	FROM gd_esquema.Maestra

	-- Insertar datos en la tabla "tipo_pago"
	INSERT INTO LOS_CEBOLLITAS.tipo_pago (MEDIO_PAGO)
	SELECT DISTINCT MEDIO_PAGO_TIPO FROM gd_esquema.Maestra

	-- Insertar datos en la tabla "tipo_estado_pedido"
	INSERT INTO LOS_CEBOLLITAS.tipo_estado_pedido (ESTADO_PEDIDO)
	SELECT DISTINCT PEDIDO_ESTADO
	FROM gd_esquema.Maestra

	-- Insertar datos en la tabla "localidad"
	INSERT INTO LOS_CEBOLLITAS.localidad (NOMBRE, PROVINCIA)
	(SELECT DISTINCT DIRECCION_USUARIO_LOCALIDAD,DIRECCION_USUARIO_PROVINCIA FROM gd_esquema.Maestra
	UNION
	SELECT DISTINCT LOCAL_LOCALIDAD,LOCAL_PROVINCIA FROM gd_esquema.Maestra
	UNION
	SELECT DISTINCT ENVIO_MENSAJERIA_LOCALIDAD,ENVIO_MENSAJERIA_PROVINCIA FROM gd_esquema.Maestra)

	-- Insertar datos en la tabla "direcciones"
	INSERT INTO LOS_CEBOLLITAS.direcciones (ID_LOCALIDAD, DIRECCION)
	(SELECT DISTINCT l.ID_LOCALIDAD,DIRECCION_USUARIO_DIRECCION FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.localidad l ON (m.DIRECCION_USUARIO_LOCALIDAD = l.NOMBRE)
	UNION
	SELECT DISTINCT l.ID_LOCALIDAD,LOCAL_DIRECCION FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.localidad l ON (m.LOCAL_LOCALIDAD = l.NOMBRE)
	UNION
	SELECT DISTINCT NULL,OPERADOR_RECLAMO_DIRECCION FROM gd_esquema.Maestra m
	UNION
	SELECT DISTINCT NULL,REPARTIDOR_DIRECION FROM gd_esquema.Maestra m)

    -- Insertar datos en la tabla "usuario"
	INSERT INTO LOS_CEBOLLITAS.usuario (NOMBRE, APELLIDO, DNI, FECHA_REGISTRO, TELEFONO, MAIL, FECHA_NAC)
	SELECT DISTINCT USUARIO_NOMBRE, USUARIO_APELLIDO, USUARIO_DNI, USUARIO_FECHA_REGISTRO, USUARIO_TELEFONO, USUARIO_MAIL, USUARIO_FECHA_NAC
	FROM gd_esquema.Maestra;

	--Insertar datos en la tabla "local"
	INSERT INTO LOS_CEBOLLITAS.local (ID_DIRECCION, DESCRIPCION, ID_TIPO, NOMBRE, CATEGORIA)
	SELECT  DISTINCT d.ID_DIRECCION, LOCAL_DESCRIPCION, t.ID_TIPO, LOCAL_NOMBRE, NULL FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.localidad l ON m.LOCAL_LOCALIDAD = l.NOMBRE AND m.LOCAL_PROVINCIA = l.PROVINCIA
	JOIN LOS_CEBOLLITAS.direcciones d ON m.LOCAL_DIRECCION = d.DIRECCION AND d.ID_LOCALIDAD = l.ID_LOCALIDAD
	JOIN LOS_CEBOLLITAS.tipo_local t ON m.LOCAL_TIPO = t.Tipo

	--Insertar datos en la tabla "medio_pago"
	INSERT INTO LOS_CEBOLLITAS.medio_pago (ID_USUARIO,ID_TIPO_PAGO,NRO_TARJETA,MARCA_TARJETA)
	SELECT DISTINCT u.ID_USUARIO, t.ID_TIPO_PAGO, MEDIO_PAGO_NRO_TARJETA, MARCA_TARJETA FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.usuario u ON m.USUARIO_DNI = u.DNI AND m.USUARIO_APELLIDO = u.APELLIDO
	JOIN LOS_CEBOLLITAS.tipo_pago t ON m.MEDIO_PAGO_TIPO = t.MEDIO_PAGO

	--Insertar datos en la tabla "repartidor"
	INSERT INTO LOS_CEBOLLITAS.repartidor (ID_DIRECCION, NOMBRE, APELLIDO, DNI, TELEFONO, ID_TIPO_MOVILIDAD, MAIL, FECHA_NAC, ID_LOCALIDAD_ACTIVA)
	SELECT DISTINCT d.ID_DIRECCION, m.REPARTIDOR_NOMBRE, m.REPARTIDOR_APELLIDO, m.REPARTIDOR_DNI, m.REPARTIDOR_TELEFONO, t.ID_TIPO_MOVILIDAD, m.REPARTIDOR_EMAIL, m.REPARTIDOR_FECHA_NAC, l.ID_LOCALIDAD
	FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.direcciones d ON m.REPARTIDOR_DIRECION = d.DIRECCION
	JOIN LOS_CEBOLLITAS.localidad l ON l.NOMBRE IN (m.LOCAL_LOCALIDAD, m.ENVIO_MENSAJERIA_LOCALIDAD)
	JOIN LOS_CEBOLLITAS.tipo_movilidad t ON m.REPARTIDOR_TIPO_MOVILIDAD = t.MOVILIDAD
	WHERE m.ENVIO_MENSAJERIA_FECHA_ENTREGA = (SELECT MAX(t.maximo) FROM ((SELECT MAX(ENVIO_MENSAJERIA_FECHA_ENTREGA) as maximo
												FROM gd_esquema.Maestra
												WHERE REPARTIDOR_NOMBRE = m.REPARTIDOR_NOMBRE AND ENVIO_MENSAJERIA_FECHA_ENTREGA IS NOT NULL)
							UNION
							(SELECT MAX(PEDIDO_FECHA_ENTREGA) as maximo
										FROM gd_esquema.Maestra
										WHERE REPARTIDOR_NOMBRE = m.REPARTIDOR_NOMBRE AND PEDIDO_FECHA_ENTREGA IS NOT NULL)) t) 
		OR m.PEDIDO_FECHA_ENTREGA =  (SELECT MAX(t.maximo) FROM ((SELECT MAX(ENVIO_MENSAJERIA_FECHA_ENTREGA) as maximo
												FROM gd_esquema.Maestra
												WHERE REPARTIDOR_NOMBRE = m.REPARTIDOR_NOMBRE AND ENVIO_MENSAJERIA_FECHA_ENTREGA IS NOT NULL)
							UNION
							(SELECT MAX(PEDIDO_FECHA_ENTREGA) as maximo
										FROM gd_esquema.Maestra
										WHERE REPARTIDOR_NOMBRE = m.REPARTIDOR_NOMBRE AND PEDIDO_FECHA_ENTREGA IS NOT NULL)) t)

	--Insertar datos en la tabla "envio"
	INSERT INTO LOS_CEBOLLITAS.envio (ID_REPARTIDOR,PROPINA,PRECIO_ENVIO,DIRECCION_ENVIO)
	SELECT DISTINCT r.ID_REPARTIDOR, PEDIDO_PROPINA, PEDIDO_PRECIO_ENVIO, d.ID_DIRECCION FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.repartidor r ON m.REPARTIDOR_DNI = r.DNI
	JOIN LOS_CEBOLLITAS.direcciones d ON m.DIRECCION_USUARIO_DIRECCION = d.DIRECCION

	--Insertar datos en la tabla "pedidos"
	INSERT INTO LOS_CEBOLLITAS.pedidos (NRO_PEDIDO,ID_USUARIO,ID_LOCAL,ID_MEDIO_PAGO,ID_ENVIO,TARIFA_SERVICIO,TOTAL_DESCUENTO,TOTAL_PEDIDO,PEDIDO_TOTAL_PRODUCTOS,OBSERVACIONES,FECHA_HORA_PEDIDO,FECHA_HORA_ENTREGA,TIEMPO_ESTIMADO_ENTREGA,CALIFICACION,ESTADO_PEDIDO)
	SELECT DISTINCT
		PEDIDO_NRO,
		u.ID_USUARIO,
		l.ID_LOCAL,
		(SELECT ID_MEDIO_PAGO FROM LOS_CEBOLLITAS.medio_pago WHERE ID_TIPO_PAGO = (SELECT ID_TIPO_PAGO FROM LOS_CEBOLLITAS.tipo_pago ti WHERE ti.MEDIO_PAGO = MEDIO_PAGO_TIPO) and
			ID_USUARIO = (SELECT ID_USUARIO FROM LOS_CEBOLLITAS.usuario WHERE DNI = USUARIO_DNI) and NRO_TARJETA = MEDIO_PAGO_NRO_TARJETA and 
			MARCA_TARJETA = MARCA_TARJETA),
		(SELECT TOP 1 ID_ENVIO FROM LOS_CEBOLLITAS.envio WHERE DIRECCION_ENVIO = (SELECT TOP 1 ID_DIRECCION FROM LOS_CEBOLLITAS.direcciones WHERE DIRECCION = DIRECCION_USUARIO_DIRECCION)),
		PEDIDO_TARIFA_SERVICIO,
		PEDIDO_TOTAL_CUPONES,
		PEDIDO_TOTAL_SERVICIO,
		PEDIDO_TOTAL_PRODUCTOS,
		PEDIDO_OBSERV,
		PEDIDO_FECHA,
		PEDIDO_FECHA_ENTREGA,
		PEDIDO_TIEMPO_ESTIMADO_ENTREGA,
		PEDIDO_CALIFICACION,
		te.ID_ESTADO_PEDIDO
	FROM gd_esquema.Maestra
	JOIN LOS_CEBOLLITAS.usuario u ON USUARIO_DNI = u.DNI AND USUARIO_APELLIDO = u.APELLIDO
	JOIN LOS_CEBOLLITAS.local l ON l.NOMBRE = LOCAL_NOMBRE
	JOIN LOS_CEBOLLITAS.tipo_estado_pedido te ON te.ESTADO_PEDIDO = PEDIDO_ESTADO 
	WHERE PEDIDO_NRO is not null

	--Insertar datos en la tabla "direcciones_usuario"
	INSERT INTO LOS_CEBOLLITAS.direccion_usuario (ID_USUARIO, ID_DIRECCION,DIRECCION_TIPO)
	SELECT DISTINCT u.ID_USUARIO, d.ID_DIRECCION,m.DIRECCION_USUARIO_NOMBRE
	FROM gd_esquema.Maestra m
	INNER JOIN LOS_CEBOLLITAS.usuario u ON m.USUARIO_NOMBRE = u.NOMBRE AND m.USUARIO_APELLIDO = u.APELLIDO AND u.DNI = m.USUARIO_DNI
	INNER JOIN LOS_CEBOLLITAS.direcciones d ON m.DIRECCION_USUARIO_DIRECCION = d.DIRECCION

	--Insertar datos en la tabla "cupon"
	INSERT INTO LOS_CEBOLLITAS.cupon (NRO_CUPON, ID_USUARIO, MONTO, FECHA_ALTA, FECHA_VENCIMIENTO, ID_TIPO_CUPON)
	(SELECT DISTINCT CUPON_NRO, u.ID_USUARIO, CUPON_MONTO, CUPON_FECHA_ALTA, CUPON_FECHA_VENCIMIENTO, c.ID_TIPO_CUPON  
	FROM gd_esquema.Maestra m
	JOIN usuario u ON u.DNI = m.USUARIO_DNI
	JOIN tipo_cupon c ON m.CUPON_TIPO = c.TIPO
	where CUPON_NRO IS NOT NULL
	UNION
	SELECT DISTINCT CUPON_RECLAMO_NRO, u.ID_USUARIO, CUPON_RECLAMO_MONTO, CUPON_RECLAMO_FECHA_ALTA, CUPON_RECLAMO_FECHA_VENCIMIENTO, c.ID_TIPO_CUPON  
	FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.usuario u ON u.DNI = m.USUARIO_DNI
	JOIN LOS_CEBOLLITAS.tipo_cupon c ON m.CUPON_TIPO = c.TIPO
	where CUPON_RECLAMO_NRO IS NOT NULL
	)

	--Insertar datos en la tabla "operador_reclamo"
	INSERT INTO LOS_CEBOLLITAS.operador_reclamo (ID_DIRECCION, NOMBRE, APELLIDO, DNI, TELEFONO, MAIL, FECHA_NAC)
	SELECT DISTINCT d.ID_DIRECCION, OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC 
	FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.direcciones d ON m.OPERADOR_RECLAMO_DIRECCION = d.DIRECCION

	--Insertar datos en la tabla "producto"
	INSERT INTO LOS_CEBOLLITAS.producto (CODIGO_PRODUCTO, NOMBRE, ID_LOCAL, DESCRIPCION, PRECIO_UNITARIO)
	SELECT DISTINCT PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, l.ID_LOCAL, PRODUCTO_LOCAL_DESCRIPCION, PRODUCTO_LOCAL_PRECIO
	FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.localidad loc ON loc.NOMBRE = DIRECCION_USUARIO_LOCALIDAD
	JOIN LOS_CEBOLLITAS.direcciones d ON d.ID_LOCALIDAD = loc.ID_LOCALIDAD
	JOIN LOS_CEBOLLITAS.local l ON l.NOMBRE = m.LOCAL_NOMBRE AND l.ID_DIRECCION = d.ID_DIRECCION
	WHERE PRODUCTO_LOCAL_CODIGO IS NOT NULL

	--Insertar datos en la tabla "horario_local"
	INSERT INTO LOS_CEBOLLITAS.horario_local (ID_LOCAL, HORA_APERTURA, HORA_CIERRE, DIA)
	SELECT DISTINCT l.ID_LOCAL, HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE, HORARIO_LOCAL_DIA FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.local l ON l.NOMBRE = m.LOCAL_NOMBRE

	--Insertar datos en la tabla "mensajeria"
	INSERT INTO LOS_CEBOLLITAS.mensajeria (NRO_MENSAJERIA,ID_MEDIO_PAGO,ID_USUARIO,ID_REPARTIDOR,TIPO_PAQUETE,DIR_ORIGEN,DIR_DEST,DISTANCIA_KMS,VALOR_ASEGURADO,PRECIO_ENVIO,PRECIO_SEGURO,PROPINA,TOTAL_MENSAJERIA,OBSERVACIONES,FECHA_HORA_MENSAJERIA,FECHA_HORA_ENTREGA,TIEMPO_ESTIMADO,CALIFICACION,ID_ESTADO)
	SELECT DISTINCT ENVIO_MENSAJERIA_NRO, m.ID_MEDIO_PAGO, u.ID_USUARIO, r.ID_REPARTIDOR, t.TIPO_PAQUETE, ENVIO_MENSAJERIA_DIR_ORIG, ENVIO_MENSAJERIA_DIR_DEST, ENVIO_MENSAJERIA_KM, ENVIO_MENSAJERIA_VALOR_ASEGURADO, ENVIO_MENSAJERIA_PRECIO_ENVIO,ENVIO_MENSAJERIA_PRECIO_SEGURO,ENVIO_MENSAJERIA_PROPINA, ENVIO_MENSAJERIA_TOTAL,ENVIO_MENSAJERIA_OBSERV, ENVIO_MENSAJERIA_FECHA,ENVIO_MENSAJERIA_FECHA_ENTREGA,ENVIO_MENSAJERIA_TIEMPO_ESTIMADO,ENVIO_MENSAJERIA_CALIFICACION,e.ID_ESTADO_MENSAJERIA
	FROM gd_esquema.Maestra ma
	JOIN LOS_CEBOLLITAS.usuario u ON u.DNI = ma.USUARIO_DNI
	JOIN LOS_CEBOLLITAS.medio_pago m ON m.ID_USUARIO = u.ID_USUARIO
	JOIN LOS_CEBOLLITAS.repartidor r ON r.DNI = ma.REPARTIDOR_DNI
	JOIN LOS_CEBOLLITAS.tipo_estado_mensajeria e ON ma.ENVIO_MENSAJERIA_ESTADO = e.ESTADO
	JOIN LOS_CEBOLLITAS.tipo_paquete t ON ma.PAQUETE_TIPO = t.TIPO
	WHERE ENVIO_MENSAJERIA_NRO IS NOT NULL

	--Insertar datos en la tabla "items"
	INSERT INTO LOS_CEBOLLITAS.items (NRO_PEDIDO,ID_PRODUCTO,PRECIO_UNITARIO,CANTIDAD)
	SELECT DISTINCT p.ID_PEDIDO, (SELECT TOP 1 ID_PRODUCTO FROM LOS_CEBOLLITAS.producto WHERE CODIGO_PRODUCTO = m.PRODUCTO_LOCAL_CODIGO),
		   m.PRODUCTO_LOCAL_PRECIO,
		   SUM(m.PRODUCTO_CANTIDAD)
	FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.pedidos p ON NRO_PEDIDO = m.PEDIDO_NRO
	WHERE PRODUCTO_LOCAL_CODIGO IS NOT NULL AND NRO_PEDIDO IS NOT NULL
	GROUP BY p.ID_PEDIDO, PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_PRECIO
							
	--Insertar datos en la tabla "cupones_pedido"
	INSERT INTO LOS_CEBOLLITAS.cupones_pedido (NRO_PEDIDO,NRO_CUPON)
	SELECT DISTINCT p.ID_PEDIDO, CUPON_NRO FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.pedidos p ON NRO_PEDIDO = m.PEDIDO_NRO
	WHERE PEDIDO_NRO IS NOT NULL AND CUPON_NRO IS NOT NULL

	--Insertar datos en la tabla "reclamo"
	INSERT INTO LOS_CEBOLLITAS.reclamo (NRO_RECLAMO,ID_USUARIO,NRO_PEDIDO,ID_OPERADOR,ID_TIPO_RECLAMO,DESCRIPCION,FECHA_HORA_RECLAMO,FECHA_HORA_SOLUCION,SOLUCION,CALIFICACION,ESTADO)
	SELECT DISTINCT RECLAMO_NRO, u.ID_USUARIO, p.ID_PEDIDO, o.ID_OPERADOR, t.ID_TIPO_RECLAMO, RECLAMO_DESCRIPCION,RECLAMO_FECHA,RECLAMO_FECHA_SOLUCION,RECLAMO_SOLUCION,RECLAMO_CALIFICACION,RECLAMO_ESTADO
	FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.usuario u ON m.USUARIO_DNI = u.DNI AND m.USUARIO_APELLIDO = u.APELLIDO
	JOIN LOS_CEBOLLITAS.operador_reclamo o ON m.OPERADOR_RECLAMO_DNI = o.DNI
	JOIN LOS_CEBOLLITAS.tipo_reclamo t ON m.RECLAMO_TIPO = t.DESCRIPCION
	JOIN LOS_CEBOLLITAS.pedidos p ON NRO_PEDIDO = m.PEDIDO_NRO

	--Insertar datos en la tabla "reclamo_cupon"
	INSERT INTO LOS_CEBOLLITAS.reclamo_cupon (NRO_RECLAMO,NRO_CUPON_RECLAMO)
	SELECT DISTINCT r.ID_RECLAMO,c.NRO_CUPON 
	FROM gd_esquema.Maestra m
	JOIN LOS_CEBOLLITAS.reclamo r ON m.RECLAMO_NRO = r.NRO_RECLAMO
	JOIN LOS_CEBOLLITAS.cupon c ON c.NRO_CUPON = CUPON_RECLAMO_NRO
	where CUPON_RECLAMO_NRO IS NOT NULL

END;
GO

EXEC LOS_CEBOLLITAS.MigrarDatosTablaMaestra
GO
