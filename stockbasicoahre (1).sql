-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2021 a las 15:44:40
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `stockbasicoahre`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `precioCosto` decimal(10,2) NOT NULL,
  `PrecioVenta` decimal(10,2) NOT NULL,
  `stock_negativo` tinyint(4) NOT NULL,
  `minimo` decimal(10,3) NOT NULL,
  `tipo_articulo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `codigo`, `nombre`, `cantidad`, `precioCosto`, `PrecioVenta`, `stock_negativo`, `minimo`, `tipo_articulo_id`) VALUES
(1, '1', 'coca-cola', '12.000', '12.00', '18.00', 1, '1.000', 3),
(3, '2', 'Blem', '0.000', '2.00', '4.00', 0, '1.000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` tinyint(4) NOT NULL,
  `apeYnom` varchar(45) NOT NULL,
  `domicilio` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `localidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `apeYnom`, `domicilio`, `email`, `celular`, `estado`, `pais_id`, `provincia_id`, `departamento_id`, `localidad_id`) VALUES
(1, 'Herrera', 'Bolivar ', 'lauty@gmail.com', '3816644502', 0, 1, 1, 1, 1),
(2, 'Gonzalo', 'Belisario', 'gmail', '381', 1, 1, 9, 7, 6),
(3, 'Lobo', 'mate de luna', 'gmailDelLobo', '3881', 1, 1, 1, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `cliente_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`id`, `numero`, `fecha`, `estado`, `cliente_id`) VALUES
(1, 1, '2021-06-13 16:28:33', 0, 1),
(3, 2, '2021-06-23 17:33:31', 0, 1),
(4, 3, '2021-06-23 17:38:50', 1, 1),
(5, 4, '2021-06-23 17:40:53', 1, 1),
(6, 5, '2021-06-23 17:43:21', 1, 1),
(7, 6, '2021-06-23 17:46:06', 1, 1),
(8, 7, '2021-06-23 17:47:44', 1, 1),
(9, 8, '2021-06-23 17:48:59', 1, 1),
(10, 9, '2021-06-23 17:49:56', 1, 1),
(11, 10, '2021-06-23 17:53:09', 1, 1),
(12, 11, '2021-06-23 18:15:41', 1, 1),
(13, 12, '2021-06-23 18:22:00', 1, 1),
(14, 13, '2021-06-23 18:23:31', 1, 1),
(15, 14, '2021-06-23 18:25:31', 1, 1),
(16, 15, '2021-06-23 18:28:55', 0, 1),
(17, 16, '2021-06-23 18:34:03', 1, 1),
(18, 17, '2021-06-23 18:55:08', 1, 1),
(19, 18, '2021-06-24 12:14:27', 0, 2),
(20, 19, '2021-06-24 12:15:55', 1, 2),
(21, 20, '2021-06-24 12:17:33', 1, 2),
(22, 21, '2021-06-24 14:16:41', 0, 2),
(23, 22, '2021-06-29 13:13:55', 0, 2);

--
-- Disparadores `comprobantes`
--
DELIMITER $$
CREATE TRIGGER `ti_comprobantes` AFTER INSERT ON `comprobantes` FOR EACH ROW BEGIN
 UPDATE configuracion SET ultimo_nro_compr = new.numero;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_detalle`
--

CREATE TABLE `comprobante_detalle` (
  `id` int(11) NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `precio` decimal(10,3) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  `comprobante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprobante_detalle`
--

INSERT INTO `comprobante_detalle` (`id`, `cantidad`, `precio`, `estado`, `articulo_id`, `comprobante_id`) VALUES
(1, '1.000', '18.000', 0, 1, 18),
(2, '2.000', '36.000', 0, 1, 18),
(3, '2.000', '8.000', 0, 3, 18),
(4, '2.000', '36.000', 0, 1, 19),
(5, '2.000', '36.000', 1, 1, 21),
(6, '1.000', '4.000', 1, 3, 21),
(7, '2.000', '36.000', 0, 1, 22);

--
-- Disparadores `comprobante_detalle`
--
DELIMITER $$
CREATE TRIGGER `restar_stock` BEFORE INSERT ON `comprobante_detalle` FOR EACH ROW BEGIN
 UPDATE articulo SET articulo.cantidad = articulo.cantidad-NEW.cantidad WHERE id = NEW.articulo_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sumar_stock` BEFORE UPDATE ON `comprobante_detalle` FOR EACH ROW BEGIN
 UPDATE articulo SET articulo.cantidad = articulo.cantidad+NEW.cantidad WHERE id = NEW.articulo_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `nombre_empresa` varchar(20) NOT NULL,
  `demo` tinyint(4) NOT NULL,
  `ultimo_nro_compr` int(11) NOT NULL,
  `usa_decimal` tinyint(4) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `localidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`nombre_empresa`, `demo`, `ultimo_nro_compr`, `usa_decimal`, `pais_id`, `provincia_id`, `departamento_id`, `localidad_id`) VALUES
('Empresa Daud', 1, 22, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `provincia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `provincia_id`) VALUES
(1, 'S.M Tucuman', 1),
(2, 'Yerba Buena', 1),
(4, 'corrientes2', 1),
(5, 'corrientes3', 1),
(6, 'Buenos Aires Dep', 7),
(7, 'Santiago del Estero Dep', 9),
(8, 'Santiago de chile Dep', 10),
(9, 'Ciudad Mexico Dep', 14),
(10, 'Paraguay Dep', 15),
(11, 'C.Paraguay Dep', 15);

--
-- Disparadores `departamento`
--
DELIMITER $$
CREATE TRIGGER `ti_departamento` BEFORE DELETE ON `departamento` FOR EACH ROW BEGIN
 DELETE FROM localidad WHERE provincia_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `departamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `nombre`, `departamento_id`) VALUES
(1, 'Barrio Ciudad Parque', 1),
(3, 'hola', 1),
(4, 'barrioCorrientes2', 4),
(5, 'Buenos Aires Loc', 6),
(6, 'santiago del Estero ', 7),
(7, 'santiago de chile Lo', 8),
(8, 'ciudad de mex Loc', 9),
(10, 'paraguay Loc', 10),
(11, 'C.Paraguay Loc', 11);

--
-- Disparadores `localidad`
--
DELIMITER $$
CREATE TRIGGER `configuracion_localidad` BEFORE UPDATE ON `localidad` FOR EACH ROW BEGIN
 UPDATE configuracion SET localidad_id = 0 WHERE localidad_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`) VALUES
(1, 'Argentina'),
(2, 'Chile'),
(5, 'Mexico'),
(6, 'Paraguay');

--
-- Disparadores `pais`
--
DELIMITER $$
CREATE TRIGGER `ti_paises` BEFORE DELETE ON `pais` FOR EACH ROW BEGIN
 DELETE FROM provincia WHERE pais_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `pais_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`, `pais_id`) VALUES
(1, 'Tucuman', 1),
(7, 'Buenos Aires', 1),
(9, 'Santiago del Estero', 1),
(10, 'Santiago de Chile', 2),
(14, 'Ciudad de Mexico', 5),
(15, 'Ciudad de Paraguay', 6),
(17, 'Jujuy', 1);

--
-- Disparadores `provincia`
--
DELIMITER $$
CREATE TRIGGER `ti_provincia` BEFORE DELETE ON `provincia` FOR EACH ROW BEGIN
 DELETE FROM departamento WHERE provincia_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_articulo`
--

CREATE TABLE `tipo_articulo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_articulo`
--

INSERT INTO `tipo_articulo` (`id`, `nombre`) VALUES
(1, 'Limpieza'),
(3, 'Enlatados');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pais_prov`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pais_prov` (
`nombPais` varchar(20)
,`nombProv` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pais_prov`
--
DROP TABLE IF EXISTS `vista_pais_prov`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pais_prov`  AS  select `pa`.`nombre` AS `nombPais`,`pr`.`nombre` AS `nombProv` from (`pais` `pa` join `provincia` `pr`) where `pa`.`id` = `pr`.`pais_id` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_103` (`tipo_articulo_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_56` (`pais_id`),
  ADD KEY `fkIdx_59` (`provincia_id`),
  ADD KEY `fkIdx_62` (`departamento_id`),
  ADD KEY `fkIdx_69` (`localidad_id`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_78` (`cliente_id`);

--
-- Indices de la tabla `comprobante_detalle`
--
ALTER TABLE `comprobante_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_106` (`articulo_id`),
  ADD KEY `fkIdx_109` (`comprobante_id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`nombre_empresa`),
  ADD KEY `fkIdx_36` (`pais_id`),
  ADD KEY `fkIdx_39` (`provincia_id`),
  ADD KEY `fkIdx_42` (`departamento_id`),
  ADD KEY `fkIdx_45` (`localidad_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_21` (`provincia_id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_24` (`departamento_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_18` (`pais_id`);

--
-- Indices de la tabla `tipo_articulo`
--
ALTER TABLE `tipo_articulo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `comprobante_detalle`
--
ALTER TABLE `comprobante_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipo_articulo`
--
ALTER TABLE `tipo_articulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `FK_102` FOREIGN KEY (`tipo_articulo_id`) REFERENCES `tipo_articulo` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_55` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  ADD CONSTRAINT `FK_58` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`),
  ADD CONSTRAINT `FK_61` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`),
  ADD CONSTRAINT `FK_68` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `FK_77` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `comprobante_detalle`
--
ALTER TABLE `comprobante_detalle`
  ADD CONSTRAINT `FK_105` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`),
  ADD CONSTRAINT `FK_108` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`);

--
-- Filtros para la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD CONSTRAINT `FK_35` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  ADD CONSTRAINT `FK_38` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`),
  ADD CONSTRAINT `FK_41` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`),
  ADD CONSTRAINT `FK_44` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `FK_20` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `FK_23` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `FK_17` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
