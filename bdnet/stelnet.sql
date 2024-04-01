-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2024 a las 20:03:31
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `stelnet`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Editar` (`Id` INT, `Asunto_novedades` VARCHAR(100), `Desc_novedades` VARCHAR(100), `Est_novedades` VARCHAR(100), `Fec_novedades` DATETIME, `Rem_novedades` VARCHAR(100), `Res_novedades` VARCHAR(100), `Tipo_novedad` VARCHAR(100))   BEGIN
   	 update tbl_novedades set asunto_novedades = Asunto_novedades, desc_novedades = Des_novedades, est_novedades = Est_novedades, fec_novedades = 				Fec_novedades, rem_novedades = Rem_novedades, res_novedades = Res_novedades, tipo_novedad = Tipo_novedad where id = Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Eliminar` (IN `id` INT)   BEGIN
    DELETE FROM tbl_novedades WHERE id = Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Guardar` (IN `asunto_novedades` VARCHAR(65), IN `desc_novedades` VARCHAR(65), IN `est_novedades` VARCHAR(25), IN `fec_novedades` DATETIME, IN `rem_novedades` VARCHAR(30), IN `res_novedades` VARCHAR(30), IN `tipo_novedad` VARCHAR(45))   BEGIN
    INSERT INTO tbl_novedades(asunto_novedades,desc_novedades,est_novedades,fec_novedades,rem_novedades,res_novedades,tipo_novedad) VALUES (asunto_novedades,desc_novedades,est_novedades,fec_novedades,rem_novedades,res_novedades,tipo_novedad);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar` ()   BEGIN
    SELECT * FROM tbl_novedades;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Obtener` (IN `id` INT)   BEGIN
    SELECT * FROM tbl_novedades WHERE id = Id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `property_correspondence`
--

CREATE TABLE `property_correspondence` (
  `fkid_inmueble` int(11) NOT NULL,
  `fkid_correspondencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `property_correspondence`
--

INSERT INTO `property_correspondence` (`fkid_inmueble`, `fkid_correspondencia`) VALUES
(1, 1),
(2, 2),
(1, 1),
(2, 2),
(1, 1),
(2, 2),
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_correspondencia`
--

CREATE TABLE `tbl_correspondencia` (
  `id` int(11) NOT NULL,
  `tipo_correspondencia` varchar(30) DEFAULT NULL,
  `frec_correspodencia` datetime DEFAULT NULL,
  `est_correspondencia` varchar(20) DEFAULT NULL,
  `fentr_correspondencia` datetime DEFAULT NULL,
  `fkid_trabajador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_correspondencia`
--

INSERT INTO `tbl_correspondencia` (`id`, `tipo_correspondencia`, `frec_correspodencia`, `est_correspondencia`, `fentr_correspondencia`, `fkid_trabajador`) VALUES
(1, 'Convocatoria reunion', '2023-09-07 13:11:00', 'Entregado', '2023-09-07 15:30:00', 3),
(2, 'Paquete', '2023-12-12 13:30:00', 'Entregado', '2023-12-13 08:20:00', 3),
(3, 'Recibo', '2024-01-12 13:30:00', 'Entregado', '2024-01-03 08:20:00', 3),
(4, 'Recibo Luz', '2024-03-15 09:30:00', 'Entregado', '2024-03-15 13:20:00', 3),
(5, 'Recibo Gas', '2024-03-15 09:30:00', 'Entregado', '2024-03-15 13:20:00', 3),
(6, 'Recibo Gas', '2024-03-15 09:30:00', 'Entregado', '2024-03-15 13:20:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estcartera`
--

CREATE TABLE `tbl_estcartera` (
  `id` int(11) NOT NULL,
  `docest_cartera` varchar(50) DEFAULT NULL,
  `est_cartera` varchar(30) DEFAULT NULL,
  `tacc_estcartera` varchar(20) DEFAULT NULL,
  `noti_estcartera` varchar(35) DEFAULT NULL,
  `fkid_inmueble` int(11) DEFAULT NULL,
  `fkid_trabajador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_estcartera`
--

INSERT INTO `tbl_estcartera` (`id`, `docest_cartera`, `est_cartera`, `tacc_estcartera`, `noti_estcartera`, `fkid_inmueble`, `fkid_trabajador`) VALUES
(1, 'paz y salvo.pdf', 'Paz y salvo', 'Permitido', 'Enviar certificado', 1, 1),
(2, 'pazysalvo.pdf', 'Paz y Salvo', 'Permitido', 'enviar certificado', 2, 1),
(4, 'paz y salvo.pdf', 'Mora', 'Bloqueado', 'Notificar Residente', NULL, 1),
(5, 'paz y salvo.pdf', 'Mora', 'Bloqueado', 'Notificar Residente', NULL, 1),
(6, 'paz y salvo.pdf', 'Mora', 'Bloqueado', 'Notificar Residente', NULL, 1),
(7, 'mora.pdf', 'Mora', 'Bloqueado', 'Notificar Residente', NULL, 1),
(8, 'mora.pdf', 'Mora', 'Bloqueado', 'Notificar', NULL, 1),
(9, 'mora.pdf', 'Mora', 'Bloqueado', 'Notificar', NULL, 1),
(10, 'mora.pdf', 'Mora', 'Bloqueado', 'Notificar', NULL, 1),
(11, 'mora.pdf', 'Acuerdo de pago', 'Bloqueado', 'Notificar residente', NULL, 1),
(12, 'mora.pdf', 'Acuerdo de pago', 'Bloqueado', 'Notificar residente', NULL, 1),
(13, 'acuerdopago.pdf', 'Acuerdo de pago', 'Bloqueado', 'Notificar residente', NULL, 1),
(14, 'acuerdopago.pdf', 'Acuerdo de pago', 'Bloqueado', 'Notificar residente', 1, 1),
(15, 'pazysalvo.pdf', 'pazysalvo', 'Permitido', 'Notificar residente', 1, 1),
(16, 'pazysalvo.pdf', 'pazysalvo', 'Permitido', 'Notificar residente', 1, 1),
(17, 'pazysalvo.pdf', 'pazysalvo', 'Permitido', 'Notificar residente', 5, 1),
(18, 'paz y salvo.pdf', 'Paz y salvo', 'Permitido', 'Enviar certificado', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inmueble`
--

CREATE TABLE `tbl_inmueble` (
  `id` int(11) NOT NULL,
  `and_inmueble` int(11) DEFAULT NULL,
  `num_inmueble` int(11) DEFAULT NULL,
  `fkid_residente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_inmueble`
--

INSERT INTO `tbl_inmueble` (`id`, `and_inmueble`, `num_inmueble`, `fkid_residente`) VALUES
(1, 1, 1, 1),
(2, 1, 2, NULL),
(3, 1, 3, NULL),
(4, 1, 5, NULL),
(5, 1, 8, NULL),
(6, 1, 4, 4),
(7, 1, 6, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_multa`
--

CREATE TABLE `tbl_multa` (
  `id` int(11) NOT NULL,
  `tipo_multa` varchar(30) DEFAULT NULL,
  `fec_multa` datetime DEFAULT NULL,
  `evid_multa` varchar(35) DEFAULT NULL,
  `val_multa` int(11) NOT NULL,
  `fpag_multa` datetime DEFAULT NULL,
  `fkid_inmueble` int(11) DEFAULT NULL,
  `fkid_trabajador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_multa`
--

INSERT INTO `tbl_multa` (`id`, `tipo_multa`, `fec_multa`, `evid_multa`, `val_multa`, `fpag_multa`, `fkid_inmueble`, `fkid_trabajador`) VALUES
(1, 'Estacionamiento indebido', '2023-01-10 22:00:00', 'Multa.pdf', 250000, '2023-02-10 10:15:00', 3, 3),
(2, 'Ruido excesivo', '2023-11-11 00:15:00', 'Multa.pdf', 100000, '2024-02-10 13:18:00', 4, 3),
(3, 'Mascota sin correa', '2023-12-11 00:15:00', 'Multa.pdf', 100000, '2024-02-10 13:18:00', 1, 3),
(4, 'Ruido excesivo', '2023-12-11 00:15:00', 'Multa.pdf', 100000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_novedades`
--

CREATE TABLE `tbl_novedades` (
  `id` int(11) NOT NULL,
  `asunto_novedades` varchar(65) DEFAULT NULL,
  `desc_novedades` varchar(65) DEFAULT NULL,
  `est_novedades` varchar(25) DEFAULT NULL,
  `fec_novedades` datetime DEFAULT NULL,
  `rem_novedades` varchar(30) DEFAULT NULL,
  `res_novedades` varchar(30) DEFAULT NULL,
  `tipo_novedad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_novedades`
--

INSERT INTO `tbl_novedades` (`id`, `asunto_novedades`, `desc_novedades`, `est_novedades`, `fec_novedades`, `rem_novedades`, `res_novedades`, `tipo_novedad`) VALUES
(10, 'solicitud revision camaras', 'carro rayado', 'espera', '2024-03-27 00:00:00', 'Pablo Lopez', 'programar revision', 'Residente'),
(11, 'zonas comunes', 'problemas en las zonas verdes', 'Activo', '2024-03-30 00:00:00', 'Carlos Meza', 'programar revision', 'Residente'),
(12, 'solicitud revision camaras', 'Vidrio Roto', 'Activo', '2024-03-08 00:00:00', 'Lorenzo Lozano', 'programar revision', 'Vigilante'),
(13, 'Solicitud Camara Seguridad', 'Revisión cámaras de seguridad', 'Activo', '2024-03-14 00:00:00', 'Miguel Silva', 'programar revision', 'Residente'),
(14, 'zonas comunes', 'problemas en el anden 3', 'Activo', '2024-03-27 00:00:00', 'Emilio Rios', 'programar revision', 'Residente'),
(15, 'Solicitud Reunión', 'Quejas documentos', 'activo', '2024-03-15 00:00:00', 'Pablo Lopez', 'Programar reunión', 'Residente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parqueadero`
--

CREATE TABLE `tbl_parqueadero` (
  `id` int(11) NOT NULL,
  `tipo_parqueadero` varchar(30) DEFAULT NULL,
  `estado_parqueadero` varchar(30) DEFAULT NULL,
  `fec_parqueadero` datetime DEFAULT NULL,
  `dvte_parqueadero` varchar(45) DEFAULT NULL,
  `cup_parqueadero` int(11) DEFAULT NULL,
  `hora_salida` datetime DEFAULT NULL,
  `tar_parqueadero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_parqueadero`
--

INSERT INTO `tbl_parqueadero` (`id`, `tipo_parqueadero`, `estado_parqueadero`, `fec_parqueadero`, `dvte_parqueadero`, `cup_parqueadero`, `hora_salida`, `tar_parqueadero`) VALUES
(1, 'Carro-propietario', 'inhabilitado', '2023-06-15 11:00:00', 'bmw-662 bmw negro', 1, NULL, 45000),
(2, 'Carro-propietario', 'inhabilitado', '2023-09-20 05:38:00', 'ABC123 kwai rojo', 18, NULL, 40000),
(3, 'Carro-Visitante', 'Habilitado', '2023-12-11 15:30:05', 'XSW-487 Sail blanco', 30, '2023-12-11 16:21:57', 5000),
(4, 'Carro-Visitante', 'Habilitado', '2023-12-13 10:50:09', 'HFR-631 Logan negro', 55, '2023-12-13 12:31:57', 5000),
(5, 'Carro-propietario', 'inhabilitado', '2023-09-20 05:38:00', 'XSG456 Sail rojo', 22, NULL, 40000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_residente`
--

CREATE TABLE `tbl_residente` (
  `id` int(11) NOT NULL,
  `nom_residente` varchar(35) DEFAULT NULL,
  `ced_residente` int(11) DEFAULT NULL,
  `ema_residente` varchar(40) DEFAULT NULL,
  `cel_residente` bigint(11) DEFAULT NULL,
  `num_integrantes` int(11) DEFAULT NULL,
  `fkid_parqueadero` int(11) DEFAULT NULL,
  `fkid_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_residente`
--

INSERT INTO `tbl_residente` (`id`, `nom_residente`, `ced_residente`, `ema_residente`, `cel_residente`, `num_integrantes`, `fkid_parqueadero`, `fkid_rol`) VALUES
(1, 'Orlando Diaz', 110143564, 'orlandodiazdelgado@hotmail.com', 3102458753, 4, 1, 1),
(2, 'Ben Rodriguez', 1114228584, 'benrodriguez@gmail.com', 3134521687, 3, 2, 1),
(3, 'Carlos Olivares', 1034587951, 'carlosol@gmail.com', 3107543210, 2, 2, 1),
(4, 'Lorenzo Lozano', 1048216548, 'londilo@gmail.com', 3138754221, 3, 2, 1),
(5, 'Pablo Diaz', 1114210354, 'padi@gmail.com', 3107543210, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

CREATE TABLE `tbl_rol` (
  `id` int(11) NOT NULL,
  `nombre_rol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`id`, `nombre_rol`) VALUES
(1, 'Residente'),
(2, 'Administrador'),
(3, 'Vigilante'),
(4, 'Todero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_trabajador`
--

CREATE TABLE `tbl_trabajador` (
  `id` int(11) NOT NULL,
  `nom_trabajador` varchar(35) DEFAULT NULL,
  `cc_trabajador` int(11) NOT NULL,
  `cel_trabajador` bigint(11) NOT NULL,
  `ema_trabajador` varchar(40) DEFAULT NULL,
  `tpco_trabajador` varchar(40) DEFAULT NULL,
  `cont_trabajador` varchar(50) DEFAULT NULL,
  `carg_trabajador` varchar(30) DEFAULT NULL,
  `emp_trabajador` varchar(30) DEFAULT NULL,
  `fkid_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_trabajador`
--

INSERT INTO `tbl_trabajador` (`id`, `nom_trabajador`, `cc_trabajador`, `cel_trabajador`, `ema_trabajador`, `tpco_trabajador`, `cont_trabajador`, `carg_trabajador`, `emp_trabajador`, `fkid_rol`) VALUES
(1, 'Alba Amaya', 1015487412, 3118754210, 'albaamaya@gmail.com', 'Indefinido', 'Contrato.pdf', 'Administrador', 'administradores', 2),
(2, 'Juan Gonzales', 1032798025, 3114521358, 'Juan1971@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(3, 'Celso Olaya', 1032798026, 3102123548, 'Celso1971@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 3),
(4, 'Ruben Noel', 1045785421, 3114587998, 'rubenno@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Vigias Colombia', 3),
(5, 'Jorge Torres', 1011874213, 3102245876, 'jorgetorres@gmail.com', 'Indefinido', 'Contrato.pdf', 'Vigilante', 'Prevenir', 3),
(6, 'Bruce Torres', 1010154875, 3114521879, 'brucetor@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Vigilancia Colombia', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `contrasena` varchar(15) DEFAULT NULL,
  `fkid_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id`, `usuario`, `contrasena`, `fkid_rol`) VALUES
(1, 'pabloguzman@gmail.com', 'P@-Gu7m4n.3!', 1),
(2, 'danmartinez@gmail.com', 'D4n.!123', 2),
(3, 'bentedder27@gmail.com', 'T3d-de!37*8/', 3),
(4, 'borjavilaseca@gmail.com', 'B0!r2!/1$-3a', 4),
(5, 'jaimero@gmail.com', 'J4im3ro', 1),
(6, 'bencasas@gmail.com', 'b3nc4s!', 1),
(7, 'laural@gmail.com', 'l4ural@', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_visitantes`
--

CREATE TABLE `tbl_visitantes` (
  `id` int(11) NOT NULL,
  `nom_visitante` varchar(35) DEFAULT NULL,
  `ced_visitante` int(11) DEFAULT NULL,
  `nom_residente` varchar(35) DEFAULT NULL,
  `car_visitante` bit(1) DEFAULT NULL,
  `ingr_visitante` bit(1) DEFAULT NULL,
  `fec_visitante` datetime DEFAULT NULL,
  `fkid_trabajador` int(11) DEFAULT NULL,
  `fkid_parqueadero` int(11) DEFAULT NULL,
  `fkid_inmueble` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_visitantes`
--

INSERT INTO `tbl_visitantes` (`id`, `nom_visitante`, `ced_visitante`, `nom_residente`, `car_visitante`, `ingr_visitante`, `fec_visitante`, `fkid_trabajador`, `fkid_parqueadero`, `fkid_inmueble`) VALUES
(1, 'Guido Alvarez', 14245168, 'Alvaro Alvarez', b'1', b'1', '2024-01-17 06:40:08', 3, 4, 4),
(2, 'Clare Lopez', 1154632485, 'Damian Alvarez', b'1', b'1', '2023-11-17 08:35:08', 3, 3, 3),
(3, 'Juan Carlos Arauzo', 1015487950, 'Orlando Diaz', b'1', b'1', '2023-11-17 08:35:08', 3, 1, 1),
(4, 'Carlos Guarnizo', 1018745120, 'Carlos Olivares', b'0', b'1', '2024-01-17 06:40:08', 3, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `property_correspondence`
--
ALTER TABLE `property_correspondence`
  ADD KEY `FKasrj8e1cihlowrcsiu6hw5tmi` (`fkid_correspondencia`),
  ADD KEY `FK2wa7hha45yviy2rpto6y4c0ba` (`fkid_inmueble`);

--
-- Indices de la tabla `tbl_correspondencia`
--
ALTER TABLE `tbl_correspondencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd08be0l3jmxjjbr9rnlj8sjmp` (`fkid_trabajador`);

--
-- Indices de la tabla `tbl_estcartera`
--
ALTER TABLE `tbl_estcartera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkpdnn5uwpax8x487ub81heg5b` (`fkid_inmueble`),
  ADD KEY `FKmojd19qbf7p50pypiasun622v` (`fkid_trabajador`);

--
-- Indices de la tabla `tbl_inmueble`
--
ALTER TABLE `tbl_inmueble`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjn4gusrj56crrnxcnpdlpgquq` (`fkid_residente`);

--
-- Indices de la tabla `tbl_multa`
--
ALTER TABLE `tbl_multa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh6e6h051h51r229y3ku265515` (`fkid_inmueble`),
  ADD KEY `FKkji958iwl6u52ftmyhu5jlyht` (`fkid_trabajador`);

--
-- Indices de la tabla `tbl_novedades`
--
ALTER TABLE `tbl_novedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_parqueadero`
--
ALTER TABLE `tbl_parqueadero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_residente`
--
ALTER TABLE `tbl_residente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8w3gesmftw8g8cug3qn74jxqk` (`fkid_parqueadero`),
  ADD KEY `FK4tcet6lof1y7vu5qismynlmws` (`fkid_rol`);

--
-- Indices de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_trabajador`
--
ALTER TABLE `tbl_trabajador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt1lrnp3fumykv007ohxu3hrql` (`fkid_rol`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8kmbvss9j8iiea0v84tt41wpx` (`fkid_rol`);

--
-- Indices de la tabla `tbl_visitantes`
--
ALTER TABLE `tbl_visitantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsim7hyw3kbcv4y92jfq73g5r3` (`fkid_parqueadero`),
  ADD KEY `FKlfa3n6kyqjlb7su6hpblg65rk` (`fkid_inmueble`),
  ADD KEY `FK84s7bxw8llyx2if0jj8kddxp5` (`fkid_trabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_correspondencia`
--
ALTER TABLE `tbl_correspondencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_estcartera`
--
ALTER TABLE `tbl_estcartera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tbl_inmueble`
--
ALTER TABLE `tbl_inmueble`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_multa`
--
ALTER TABLE `tbl_multa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_novedades`
--
ALTER TABLE `tbl_novedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_parqueadero`
--
ALTER TABLE `tbl_parqueadero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_residente`
--
ALTER TABLE `tbl_residente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_trabajador`
--
ALTER TABLE `tbl_trabajador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_visitantes`
--
ALTER TABLE `tbl_visitantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `property_correspondence`
--
ALTER TABLE `property_correspondence`
  ADD CONSTRAINT `FK2wa7hha45yviy2rpto6y4c0ba` FOREIGN KEY (`fkid_inmueble`) REFERENCES `tbl_inmueble` (`id`),
  ADD CONSTRAINT `FKasrj8e1cihlowrcsiu6hw5tmi` FOREIGN KEY (`fkid_correspondencia`) REFERENCES `tbl_correspondencia` (`id`);

--
-- Filtros para la tabla `tbl_correspondencia`
--
ALTER TABLE `tbl_correspondencia`
  ADD CONSTRAINT `FKd08be0l3jmxjjbr9rnlj8sjmp` FOREIGN KEY (`fkid_trabajador`) REFERENCES `tbl_trabajador` (`id`);

--
-- Filtros para la tabla `tbl_estcartera`
--
ALTER TABLE `tbl_estcartera`
  ADD CONSTRAINT `FKkpdnn5uwpax8x487ub81heg5b` FOREIGN KEY (`fkid_inmueble`) REFERENCES `tbl_inmueble` (`id`),
  ADD CONSTRAINT `FKmojd19qbf7p50pypiasun622v` FOREIGN KEY (`fkid_trabajador`) REFERENCES `tbl_trabajador` (`id`);

--
-- Filtros para la tabla `tbl_inmueble`
--
ALTER TABLE `tbl_inmueble`
  ADD CONSTRAINT `FKjn4gusrj56crrnxcnpdlpgquq` FOREIGN KEY (`fkid_residente`) REFERENCES `tbl_residente` (`id`);

--
-- Filtros para la tabla `tbl_multa`
--
ALTER TABLE `tbl_multa`
  ADD CONSTRAINT `FKh6e6h051h51r229y3ku265515` FOREIGN KEY (`fkid_inmueble`) REFERENCES `tbl_inmueble` (`id`),
  ADD CONSTRAINT `FKkji958iwl6u52ftmyhu5jlyht` FOREIGN KEY (`fkid_trabajador`) REFERENCES `tbl_trabajador` (`id`);

--
-- Filtros para la tabla `tbl_residente`
--
ALTER TABLE `tbl_residente`
  ADD CONSTRAINT `FK4tcet6lof1y7vu5qismynlmws` FOREIGN KEY (`fkid_rol`) REFERENCES `tbl_rol` (`id`),
  ADD CONSTRAINT `FK8w3gesmftw8g8cug3qn74jxqk` FOREIGN KEY (`fkid_parqueadero`) REFERENCES `tbl_parqueadero` (`id`);

--
-- Filtros para la tabla `tbl_trabajador`
--
ALTER TABLE `tbl_trabajador`
  ADD CONSTRAINT `FKt1lrnp3fumykv007ohxu3hrql` FOREIGN KEY (`fkid_rol`) REFERENCES `tbl_rol` (`id`);

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `FK8kmbvss9j8iiea0v84tt41wpx` FOREIGN KEY (`fkid_rol`) REFERENCES `tbl_rol` (`id`);

--
-- Filtros para la tabla `tbl_visitantes`
--
ALTER TABLE `tbl_visitantes`
  ADD CONSTRAINT `FK84s7bxw8llyx2if0jj8kddxp5` FOREIGN KEY (`fkid_trabajador`) REFERENCES `tbl_trabajador` (`id`),
  ADD CONSTRAINT `FKlfa3n6kyqjlb7su6hpblg65rk` FOREIGN KEY (`fkid_inmueble`) REFERENCES `tbl_inmueble` (`id`),
  ADD CONSTRAINT `FKsim7hyw3kbcv4y92jfq73g5r3` FOREIGN KEY (`fkid_parqueadero`) REFERENCES `tbl_parqueadero` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
