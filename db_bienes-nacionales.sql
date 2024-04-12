-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2024 a las 23:31:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel_bienes_nacionales`
--
CREATE DATABASE IF NOT EXISTS `laravel_bienes_nacionales` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel_bienes_nacionales`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biens`
--

CREATE TABLE `biens` (
  `id` int(10) UNSIGNED NOT NULL,
  `denominacion_id` int(10) UNSIGNED NOT NULL,
  `marca_id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `serial` varchar(20) NOT NULL,
  `monto` double(10,2) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `biens`
--

INSERT INTO `biens` (`id`, `denominacion_id`, `marca_id`, `codigo`, `serial`, `monto`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ABC-001', 'ABC-001', 999999.99, NULL, '2023-08-19 01:44:16', '2023-10-29 22:30:18'),
(2, 86, 13, 'ABC-002', 'ABC-002', 2000000.00, 'PARA LA CAPILLA Y EVENTOS DE LA CORAL', '2023-10-29 22:26:04', '2023-10-29 22:30:25'),
(3, 111, 12, 'ABC-003', 'ABC-003', 250000.00, NULL, '2023-10-29 22:28:36', '2023-10-29 22:28:36'),
(4, 111, 12, 'ABC-004', 'ABC-004', 250000.00, 'OTRO AIRE ACONDICIONADO', '2023-10-29 22:29:03', '2023-10-29 22:29:03'),
(5, 128, 15, 'ABC-005', 'ABC-005', 20000.00, 'inteligente', '2023-10-29 22:30:08', '2023-10-29 22:30:08'),
(6, 112, 1, 'acb-009', 'acb-009', 100.00, NULL, '2023-10-30 17:39:52', '2023-10-30 17:39:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biens_movimientos`
--

CREATE TABLE `biens_movimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `bien_id` int(10) UNSIGNED NOT NULL,
  `movimiento_id` int(10) UNSIGNED NOT NULL,
  `dependencia_usuaria_id` int(10) UNSIGNED NOT NULL,
  `dependencia_usuaria_origen_id` int(10) UNSIGNED DEFAULT NULL,
  `actual` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `biens_movimientos`
--

INSERT INTO `biens_movimientos` (`id`, `bien_id`, `movimiento_id`, `dependencia_usuaria_id`, `dependencia_usuaria_origen_id`, `actual`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, NULL, 2, '2023-08-19 01:44:16', '2023-08-19 01:44:16'),
(2, 2, 2, 5, NULL, 2, '2023-10-29 22:26:04', '2023-10-29 22:26:04'),
(3, 3, 3, 5, NULL, 2, '2023-10-29 22:28:36', '2023-10-29 22:28:36'),
(4, 4, 3, 5, NULL, 2, '2023-10-29 22:29:03', '2023-10-29 22:29:03'),
(5, 5, 3, 5, NULL, 2, '2023-10-29 22:30:08', '2023-10-29 22:30:08'),
(6, 6, 4, 5, NULL, 2, '2023-10-30 17:39:52', '2023-10-30 17:39:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '16010', 'Equipos de telecomunicaciones', NULL, NULL),
(2, '18020', 'Equipos de enseñanza, deporte y recreación', NULL, NULL),
(3, '18060', 'Instrumentos musicales', NULL, NULL),
(4, '20010', 'Mobiliario y equipos de oficina', NULL, NULL),
(5, '20020', 'Equipos de procesamiento de datos ', NULL, NULL),
(6, '20090', 'Mobiliario y equipos de alojamiento', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinacions`
--

CREATE TABLE `coordinacions` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `coordinacions`
--

INSERT INTO `coordinacions` (`id`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'DESINCORPORACION', NULL, NULL, NULL),
(2, 'TACHIRA', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denominacions`
--

CREATE TABLE `denominacions` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `denominacions`
--

INSERT INTO `denominacions` (`id`, `categoria_id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 1, '16010-0001', 'Amplificadores ', NULL, NULL),
(2, 1, '16010-0002', 'Analizadoras ', NULL, NULL),
(3, 1, '16010-0003', 'Antenas facilmente desmontables ', NULL, NULL),
(4, 1, '16010-0004', 'Centrales telefónicas manuales conmutadores telefónicos ', NULL, NULL),
(5, 1, '16010-0005', 'Concentradores ', NULL, NULL),
(6, 1, '16010-0006', 'Conmutadores telefónicos ', NULL, NULL),
(7, 1, '16010-0007', 'Conmutadores telegráficos ', NULL, NULL),
(8, 1, '16010-0008', 'Equipos de control remoto ', NULL, NULL),
(9, 1, '16010-0009', 'Equipos de sloran ', NULL, NULL),
(10, 1, '16010-0010', 'Equipos de luces de señales para torres de antena ', NULL, NULL),
(11, 1, '16010-0011', 'Equipos de radar ', NULL, NULL),
(12, 1, '16010-0012', 'Equipos de radiocomunicación portátiles ', NULL, NULL),
(13, 1, '16010-0013', 'Equipos de comunicación interna intercomunicadores ', NULL, NULL),
(14, 1, '16010-0014', 'Generadores de señales ', NULL, NULL),
(15, 1, '16010-0015', 'Jacks panels ', NULL, NULL),
(16, 1, '16010-0016', 'Manipuladores ', NULL, NULL),
(17, 1, '16010-0017', 'Mesas para teleimpresoras ', NULL, NULL),
(18, 1, '16010-0018', 'Micrófonos ', NULL, NULL),
(19, 1, '16010-0019', 'Multicanales para telefonía ', NULL, NULL),
(20, 1, '16010-0020', 'Multicanales para telegrafía ', NULL, NULL),
(21, 1, '16010-0021', 'Pilas húmedas o de gravedad ', NULL, NULL),
(22, 1, '16010-0022', 'Plantas eléctricas ', NULL, NULL),
(23, 1, '16010-0023', 'Probadores de tubos electrónicos ', NULL, NULL),
(24, 1, '16010-0024', 'Racks ', NULL, NULL),
(25, 1, '16010-0025', 'Radioreceptores receptores radioeléctricos ', NULL, NULL),
(26, 1, '16010-0026', 'Radiotransmisores transmisores radioeléctricos ', NULL, NULL),
(27, 1, '16010-0027', 'Receptores radioeléctricos ', NULL, NULL),
(28, 1, '16010-0028', 'Rectificadores ', NULL, NULL),
(29, 1, '16010-0029', 'Teléfonos ', NULL, NULL),
(30, 1, '16010-0030', 'Teleimpresoras ', NULL, NULL),
(31, 1, '16010-0031', 'Teletipos ', NULL, NULL),
(32, 1, '16010-0032', 'Transmisores radioeléctricos ', NULL, NULL),
(33, 1, '16010-0033', 'Trazadores de señales ', NULL, NULL),
(34, 1, '16010-0034', 'Voltímetros ', NULL, NULL),
(35, 2, '18020-0001', 'Billares ', NULL, NULL),
(36, 2, '18020-0002', 'Carteleras ', NULL, NULL),
(37, 2, '18020-0003', 'Cátedras ', NULL, NULL),
(38, 2, '18020-0004', 'Colecciones de animales disecados para la enseñanza ', NULL, NULL),
(39, 2, '18020-0005', 'Colecciones de preparaciones microscópicas en estuche ', NULL, NULL),
(40, 2, '18020-0006', 'Colecciones de minerales para la enseñanza ', NULL, NULL),
(41, 2, '18020-0007', 'Cuadros murales ', NULL, NULL),
(42, 2, '18020-0008', 'Discos educativos ', NULL, NULL),
(43, 2, '18020-0009', 'Episcopios ', NULL, NULL),
(44, 2, '18020-0010', 'Equipos instructivos ', NULL, NULL),
(45, 2, '18020-0011', 'Equipos para deportes ', NULL, NULL),
(46, 2, '18020-0012', 'Equipos para gimnasia y parques recreativos ', NULL, NULL),
(47, 2, '18020-0013', 'Esferas celestes ', NULL, NULL),
(48, 2, '18020-0014', 'Esferas terrestres ', NULL, NULL),
(49, 2, '18020-0015', 'Herbarios ', NULL, NULL),
(50, 2, '18020-0016', 'Juegos de sólidos geométricos ', NULL, NULL),
(51, 2, '18020-0017', 'Juegos recreativos ', NULL, NULL),
(52, 2, '18020-0018', 'Mapas murales ', NULL, NULL),
(53, 2, '18020-0019', 'Máquinas disparadoras de skeet ', NULL, NULL),
(54, 2, '18020-0020', 'Modelos didácticos ', NULL, NULL),
(55, 2, '18020-0021', 'Pantallas de proyección ', NULL, NULL),
(56, 2, '18020-0022', 'Películas educativas ', NULL, NULL),
(57, 2, '18020-0023', 'Pizarrones ', NULL, NULL),
(58, 2, '18020-0024', 'Proyectores de películas ', NULL, NULL),
(59, 2, '18020-0025', 'Pupitres ', NULL, NULL),
(60, 2, '18020-0026', 'Radio-receptores ', NULL, NULL),
(61, 2, '18020-0027', 'Sillas pupitre ', NULL, NULL),
(62, 2, '18020-0028', 'Televisores ', NULL, NULL),
(63, 2, '18020-0029', 'Tocadiscos ', NULL, NULL),
(64, 2, '18020-0030', 'Video grabador ', NULL, NULL),
(65, 3, '18060-0001', 'Acordeones ', NULL, NULL),
(66, 3, '18060-0002', 'Armonios ', NULL, NULL),
(67, 3, '18060-0003', 'Arpas ', NULL, NULL),
(68, 3, '18060-0004', 'Atriles ', NULL, NULL),
(69, 3, '18060-0005', 'Bandola ', NULL, NULL),
(70, 3, '18060-0006', 'Banjos ', NULL, NULL),
(71, 3, '18060-0007', 'Baterías ', NULL, NULL),
(72, 3, '18060-0008', 'Bugles ', NULL, NULL),
(73, 3, '18060-0009', 'Bustos excepto los situados en plazas públicas ', NULL, NULL),
(74, 3, '18060-0010', 'Celestes ', NULL, NULL),
(75, 3, '18060-0011', 'Clarinetes ', NULL, NULL),
(76, 3, '18060-0012', 'Clarines ', NULL, NULL),
(77, 3, '18060-0013', 'Contrabajos ', NULL, NULL),
(78, 3, '18060-0014', 'Cornetas ', NULL, NULL),
(79, 3, '18060-0015', 'Cornetines ', NULL, NULL),
(80, 3, '18060-0016', 'Cornos ingleses ', NULL, NULL),
(81, 3, '18060-0017', 'Cuadros artísticos ', NULL, NULL),
(82, 3, '18060-0018', 'Discos musicales ', NULL, NULL),
(83, 3, '18060-0019', 'Estatuas excepto las situadas en plazas públicas ', NULL, NULL),
(84, 3, '18060-0020', 'Flautas ', NULL, NULL),
(85, 3, '18060-0021', 'Flautines ', NULL, NULL),
(86, 3, '18060-0022', 'Guitarras ', NULL, NULL),
(87, 3, '18060-0023', 'Joyas ', NULL, NULL),
(88, 3, '18060-0024', 'Laúdes ', NULL, NULL),
(89, 3, '18060-0025', 'Liras ', NULL, NULL),
(90, 3, '18060-0026', 'Mandolas ', NULL, NULL),
(91, 3, '18060-0027', 'Mandolinas ', NULL, NULL),
(92, 3, '18060-0028', 'Metrónomos ', NULL, NULL),
(93, 3, '18060-0029', 'Objetos ornamentales ', NULL, NULL),
(94, 3, '18060-0030', 'Oboes ', NULL, NULL),
(95, 3, '18060-0031', 'Órganos ', NULL, NULL),
(96, 3, '18060-0032', 'Pianos ', NULL, NULL),
(97, 3, '18060-0033', 'Platillos ', NULL, NULL),
(98, 3, '18060-0034', 'Tambores ', NULL, NULL),
(99, 3, '18060-0035', 'Timbales ', NULL, NULL),
(100, 3, '18060-0036', 'Triángulos ', NULL, NULL),
(101, 3, '18060-0037', 'Trombones ', NULL, NULL),
(102, 3, '18060-0038', 'Trompas ', NULL, NULL),
(103, 3, '18060-0039', 'Trompetas ', NULL, NULL),
(104, 3, '18060-0040', 'Tubas ', NULL, NULL),
(105, 3, '18060-0041', 'Redoblantes ', NULL, NULL),
(106, 3, '18060-0042', 'Saxofones ', NULL, NULL),
(107, 3, '18060-0043', 'Violas ', NULL, NULL),
(108, 3, '18060-0044', 'Violines ', NULL, NULL),
(109, 3, '18060-0045', 'Violoncelos ', NULL, NULL),
(110, 3, '18060-0046', 'Xilófonos ', NULL, NULL),
(111, 4, '20010-0001', 'Acondicionadores de aire ', NULL, NULL),
(112, 4, '20010-0002', 'Alfombras ', NULL, NULL),
(113, 4, '20010-0003', 'Anaqueles  estantes ', NULL, NULL),
(114, 4, '20010-0004', 'Archivadores de gavetas ', NULL, NULL),
(115, 4, '20010-0005', 'Archivadores de puertas ', NULL, NULL),
(116, 4, '20010-0006', 'Aspiradoras ', NULL, NULL),
(117, 4, '20010-0007', 'Balanzas ', NULL, NULL),
(118, 4, '20010-0008', 'Bancos asientos ', NULL, NULL),
(119, 4, '20010-0009', 'Bancos mesas ', NULL, NULL),
(120, 4, '20010-0010', 'Banderas nacionales ', NULL, NULL),
(121, 4, '20010-0011', 'Bibliotecas ', NULL, NULL),
(122, 4, '20010-0012', 'Borradores eléctricos ', NULL, NULL),
(123, 4, '20010-0013', 'Burros  caballetes ', NULL, NULL),
(124, 4, '20010-0014', 'Caballetes ', NULL, NULL),
(125, 4, '20010-0015', 'Cafeteras ', NULL, NULL),
(126, 4, '20010-0016', 'Cajas fuertes ', NULL, NULL),
(127, 4, '20010-0017', 'Cajas registradoras ', NULL, NULL),
(128, 4, '20010-0018', 'Calculadoras ', NULL, NULL),
(129, 4, '20010-0019', 'Carteleras ', NULL, NULL),
(130, 4, '20010-0020', 'Carteleras ', NULL, NULL),
(131, 4, '20010-0021', 'Ceniceros de pie ', NULL, NULL),
(132, 4, '20010-0022', 'Cestas para botar papeles ', NULL, NULL),
(133, 4, '20010-0023', 'Cestas para escritorios ', NULL, NULL),
(134, 4, '20010-0024', 'Circuladores de aire ', NULL, NULL),
(135, 4, '20010-0025', 'Compases ', NULL, NULL),
(136, 4, '20010-0026', 'Comptómetros ', NULL, NULL),
(137, 4, '20010-0027', 'Cortinas ', NULL, NULL),
(138, 4, '20010-0028', 'Cortineros ', NULL, NULL),
(139, 4, '20010-0029', 'Curvígrafos ', NULL, NULL),
(140, 4, '20010-0030', 'Dictáfonos ', NULL, NULL),
(141, 4, '20010-0031', 'Díngrafos ', NULL, NULL),
(142, 4, '20010-0032', 'Dispensadores de cinta engomada ', NULL, NULL),
(143, 4, '20010-0033', 'Enfriadores de agua ', NULL, NULL),
(144, 4, '20010-0034', 'Engrapadoras ', NULL, NULL),
(145, 4, '20010-0035', 'Escalímetros ', NULL, NULL),
(146, 4, '20010-0036', 'Escaparates ', NULL, NULL),
(147, 4, '20010-0037', 'Escritorios ', NULL, NULL),
(148, 4, '20010-0038', 'Escuadras ', NULL, NULL),
(149, 4, '20010-0039', 'Escudos nacionales ', NULL, NULL),
(150, 4, '20010-0040', 'Espaciadores para máquinas de escribir ', NULL, NULL),
(151, 4, '20010-0041', 'Estantes ', NULL, NULL),
(152, 4, '20010-0042', 'Estenógrafos máquinas ', NULL, NULL),
(153, 4, '20010-0043', 'Estuches de matemáticas ', NULL, NULL),
(154, 4, '20010-0044', 'Estuches de plantillas ', NULL, NULL),
(155, 4, '20010-0045', 'Ficheros tarjeteros ', NULL, NULL),
(156, 4, '20010-0046', 'Fotocopiadoras ', NULL, NULL),
(157, 4, '20010-0047', 'Gabinetes ', NULL, NULL),
(158, 4, '20010-0048', 'Guillotinas para papel, manuales ', NULL, NULL),
(159, 4, '20010-0049', 'Grabadores de sonido ', NULL, NULL),
(160, 4, '20010-0050', 'Impresoras de rótulos ', NULL, NULL),
(161, 4, '20010-0051', 'Juegos de instrumentos para dibujo ', NULL, NULL),
(162, 4, '20010-0052', 'Juegos de muebles para recibo ', NULL, NULL),
(163, 4, '20010-0053', 'Kardex ', NULL, NULL),
(164, 4, '20010-0054', 'Lámparas móviles ', NULL, NULL),
(165, 4, '20010-0055', 'Litografías montadas en marcos cuadros ', NULL, NULL),
(166, 4, '20010-0056', 'Lockers escaparates ', NULL, NULL),
(167, 4, '20010-0057', 'Maletines ', NULL, NULL),
(168, 4, '20010-0058', 'Mapas montados en marcos cuadros ', NULL, NULL),
(169, 4, '20010-0059', 'Mapotecas planotecas ', NULL, NULL),
(170, 4, '20010-0060', 'Máquinas de contabilidad ', NULL, NULL),
(171, 4, '20010-0061', 'Máquinas de escribir ', NULL, NULL),
(172, 4, '20010-0062', 'Máquinas eléctricas y electrónicas de contabilidad ', NULL, NULL),
(173, 4, '20010-0063', 'Máquinas foliadoras ver numeradoras ', NULL, NULL),
(174, 4, '20010-0064', 'Máquinas franqueadoras de correspondencia ', NULL, NULL),
(175, 4, '20010-0065', 'Mesas ', NULL, NULL),
(176, 4, '20010-0066', 'Microfilmadoras ', NULL, NULL),
(177, 4, '20010-0067', 'Mimeógrafos ', NULL, NULL),
(178, 4, '20010-0068', 'Multígrafos ', NULL, NULL),
(179, 4, '20010-0069', 'Neveras ', NULL, NULL),
(180, 4, '20010-0070', 'Normógrafos ', NULL, NULL),
(181, 4, '20010-0071', 'Numeradoras ', NULL, NULL),
(182, 4, '20010-0072', 'Organigramas montados cuadros ', NULL, NULL),
(183, 4, '20010-0073', 'Pantógrafos ', NULL, NULL),
(184, 4, '20010-0074', 'Percheros ', NULL, NULL),
(185, 4, '20010-0075', 'Perforadoras para mas de 2 ojetes ', NULL, NULL),
(186, 4, '20010-0076', 'Pesa-cartas ', NULL, NULL),
(187, 4, '20010-0077', 'Pizarrones ', NULL, NULL),
(188, 4, '20010-0078', 'Planímetros ', NULL, NULL),
(189, 4, '20010-0079', 'Planotecas ', NULL, NULL),
(190, 4, '20010-0080', 'Plantillas de dibujo ', NULL, NULL),
(191, 4, '20010-0081', 'Poltronas ', NULL, NULL),
(192, 4, '20010-0082', 'Porta-copias ', NULL, NULL),
(193, 4, '20010-0083', 'Prensas para copias ', NULL, NULL),
(194, 4, '20010-0084', 'Protectoras de cheques ', NULL, NULL),
(195, 4, '20010-0085', 'Proyectores para dibujo ', NULL, NULL),
(196, 4, '20010-0086', 'Reglas ', NULL, NULL),
(197, 4, '20010-0087', 'Relojes ', NULL, NULL),
(198, 4, '20010-0088', 'Relojes de control ', NULL, NULL),
(199, 4, '20010-0089', 'Relojes fechadores ', NULL, NULL),
(200, 4, '20010-0090', 'Roperos ', NULL, NULL),
(201, 4, '20010-0091', 'Saca-puntas ', NULL, NULL),
(202, 4, '20010-0092', 'Sellos-prensa metálicos ', NULL, NULL),
(203, 4, '20010-0093', 'Sillas para escritorios ', NULL, NULL),
(204, 4, '20010-0094', 'Sofás ', NULL, NULL),
(205, 4, '20010-0095', 'Soportes para sellos ', NULL, NULL),
(206, 4, '20010-0096', 'Sumadoras ', NULL, NULL),
(207, 4, '20010-0097', 'Tableros ni pizarrones, ni carteleras ', NULL, NULL),
(208, 4, '20010-0098', 'Taburetes ', NULL, NULL),
(209, 4, '20010-0099', 'Teléfonos internos ', NULL, NULL),
(210, 4, '20010-0100', 'Transportadores ', NULL, NULL),
(211, 4, '20010-0101', 'Televisores ', NULL, NULL),
(212, 4, '20010-0102', 'Ventiladores ', NULL, NULL),
(213, 4, '20010-0103', 'Vitrinas ', NULL, NULL),
(214, 5, '20020-0001', 'Adaptador de bienes múltiples ', NULL, NULL),
(215, 5, '20020-0002', 'Cadena de impresora intercambiable ', NULL, NULL),
(216, 5, '20020-0003', 'Discos ', NULL, NULL),
(217, 5, '20020-0004', 'Lectora óptica ', NULL, NULL),
(218, 5, '20020-0005', 'Lectora de tarjeta ', NULL, NULL),
(219, 5, '20020-0006', 'Lectora de cintas de papel ', NULL, NULL),
(220, 5, '20020-0007', 'Microcomputador ', NULL, NULL),
(221, 5, '20020-0008', 'Modulador y desmodulador modem ', NULL, NULL),
(222, 5, '20020-0009', 'Perforadora de tarjeta ', NULL, NULL),
(223, 5, '20020-0010', 'Perforadora de cinta de papel ', NULL, NULL),
(224, 5, '20020-0011', 'Terminal con teclado ', NULL, NULL),
(225, 5, '20020-0012', 'Unidad central de proceso CPU ', NULL, NULL),
(226, 5, '20020-0013', 'Unidad de control de líneas remotas ', NULL, NULL),
(227, 5, '20020-0014', 'Unidad de control local de terminales ', NULL, NULL),
(228, 5, '20020-0015', 'Unidad de control remoto de terminales ', NULL, NULL),
(229, 5, '20020-0016', 'Unidad de control de cinta ', NULL, NULL),
(230, 5, '20020-0017', 'Unidad de control de impresora ', NULL, NULL),
(231, 5, '20020-0018', 'Unidad de cinta magnética ', NULL, NULL),
(232, 5, '20020-0019', 'Unidad de acceso directo discos ', NULL, NULL),
(233, 5, '20020-0020', 'Unidad de diskettes ', NULL, NULL),
(234, 5, '20020-0021', 'Unidad impresora ', NULL, NULL),
(235, 5, '20020-0022', 'Visores de microfichas ', NULL, NULL),
(236, 6, '20090-0001', 'Acondicionadores de aire ', NULL, NULL),
(237, 6, '20090-0002', 'Acuarios ', NULL, NULL),
(238, 6, '20090-0003', 'Alfombras ', NULL, NULL),
(239, 6, '20090-0004', 'Anaqueles ver estantes ', NULL, NULL),
(240, 6, '20090-0006', 'Aparadores ', NULL, NULL),
(241, 6, '20090-0007', 'Aparatos desmanchadores para lavanderas ', NULL, NULL),
(242, 6, '20090-0008', 'Armarios escaparates ', NULL, NULL),
(243, 6, '20090-0010', 'Atomizadores ', NULL, NULL),
(244, 6, '20090-0011', 'Azafates ', NULL, NULL),
(245, 6, '20090-0012', 'Balanzas ', NULL, NULL),
(246, 6, '20090-0013', 'Bancas y banquetas bancos ', NULL, NULL),
(247, 6, '20090-0014', 'Bancos asientos ', NULL, NULL),
(248, 6, '20090-0015', 'Bancos mesas ', NULL, NULL),
(249, 6, '20090-0016', 'Banderas nacionales ', NULL, NULL),
(250, 6, '20090-0017', 'Bañeras móviles ', NULL, NULL),
(251, 6, '20090-0018', 'Bares ', NULL, NULL),
(252, 6, '20090-0019', 'Barqueos ', NULL, NULL),
(253, 6, '20090-0020', 'Bases para alfombras ', NULL, NULL),
(254, 6, '20090-0021', 'Batidoras ', NULL, NULL),
(255, 6, '20090-0022', 'Bibelots objetos decorativos ', NULL, NULL),
(256, 6, '20090-0023', 'Biombos ', NULL, NULL),
(257, 6, '20090-0024', 'Botiquines ', NULL, NULL),
(258, 6, '20090-0025', 'Butacas poltronas ', NULL, NULL),
(259, 6, '20090-0026', 'Burros caballetes ', NULL, NULL),
(260, 6, '20090-0027', 'Caballetes ', NULL, NULL),
(261, 6, '20090-0028', 'Cafeteras ', NULL, NULL),
(262, 6, '20090-0029', 'Calderos ', NULL, NULL),
(263, 6, '20090-0030', 'Calentadores ', NULL, NULL),
(264, 6, '20090-0031', 'Camas ', NULL, NULL),
(265, 6, '20090-0032', 'Canapés ver sofás ', NULL, NULL),
(266, 6, '20090-0033', 'Cantaras ', NULL, NULL),
(267, 6, '20090-0034', 'Carros de comida ', NULL, NULL),
(268, 6, '20090-0035', 'Cocinas móviles ', NULL, NULL),
(269, 6, '20090-0036', 'Cocinillas portátiles ', NULL, NULL),
(270, 6, '20090-0037', 'Cofres ', NULL, NULL),
(271, 6, '20090-0038', 'Cómodas ', NULL, NULL),
(272, 6, '20090-0039', 'Congeladoras ', NULL, NULL),
(273, 6, '20090-0040', 'Conservadoras ', NULL, NULL),
(274, 6, '20090-0041', 'Consolas ', NULL, NULL),
(275, 6, '20090-0042', 'Cortadoras de césped ', NULL, NULL),
(276, 6, '20090-0043', 'Cortinas ', NULL, NULL),
(277, 6, '20090-0044', 'Cortineros ', NULL, NULL),
(278, 6, '20090-0045', 'Cunas ', NULL, NULL),
(279, 6, '20090-0046', 'Chiffonieres  cómodas ', NULL, NULL),
(280, 6, '20090-0047', 'Chinchorros ', NULL, NULL),
(281, 6, '20090-0048', 'Divanes sofás ', NULL, NULL),
(282, 6, '20090-0049', 'Enfriadores de agua ', NULL, NULL),
(283, 6, '20090-0050', 'Equipos para desperdicios ', NULL, NULL),
(284, 6, '20090-0051', 'Escabeles ', NULL, NULL),
(285, 6, '20090-0052', 'Escaparates ', NULL, NULL),
(286, 6, '20090-0053', 'Escudos nacionales ', NULL, NULL),
(287, 6, '20090-0054', 'Estantes ', NULL, NULL),
(288, 6, '20090-0055', 'Espejos ', NULL, NULL),
(289, 6, '20090-0056', 'Estufas móviles ', NULL, NULL),
(290, 6, '20090-0057', 'Exprimidoras ', NULL, NULL),
(291, 6, '20090-0058', 'Exprimidoras de lavandera ', NULL, NULL),
(292, 6, '20090-0059', 'Filtros de agua ', NULL, NULL),
(293, 6, '20090-0060', 'Floreros ', NULL, NULL),
(294, 6, '20090-0061', 'Freidores ', NULL, NULL),
(295, 6, '20090-0062', 'Gabinetes ', NULL, NULL),
(296, 6, '20090-0063', 'Gaveteros  cómodas ', NULL, NULL),
(297, 6, '20090-0064', 'Grecas para el café ', NULL, NULL),
(298, 6, '20090-0065', 'Hamacas ', NULL, NULL),
(299, 6, '20090-0066', 'Jardineras móviles ', NULL, NULL),
(300, 6, '20090-0067', 'Jarrones ', NULL, NULL),
(301, 6, '20090-0068', 'Juegos de cristal ', NULL, NULL),
(302, 6, '20090-0069', 'Juegos de dormitorio ', NULL, NULL),
(303, 6, '20090-0070', 'Juegos de muebles de comedor ', NULL, NULL),
(304, 6, '20090-0071', 'Juegos de muebles de recibo ', NULL, NULL),
(305, 6, '20090-0072', 'Juegos de pesas para balanzas ', NULL, NULL),
(306, 6, '20090-0073', 'Juego de porcelana ', NULL, NULL),
(307, 6, '20090-0074', 'Lámparas móviles ', NULL, NULL),
(308, 6, '20090-0075', 'Lavabos móviles ', NULL, NULL),
(309, 6, '20090-0076', 'Lavacopas y vasos ', NULL, NULL),
(310, 6, '20090-0077', 'Lavadoras de ropa ', NULL, NULL),
(311, 6, '20090-0078', 'Lavaplatos móviles ', NULL, NULL),
(312, 6, '20090-0079', 'Licuadoras ', NULL, NULL),
(313, 6, '20090-0080', 'Máquinas ayudante de cocina ', NULL, NULL),
(314, 6, '20090-0081', 'Máquinas amasadoras ', NULL, NULL),
(315, 6, '20090-0082', 'Máquinas de afeitar ', NULL, NULL),
(316, 6, '20090-0083', 'Máquinas de almidonar ', NULL, NULL),
(317, 6, '20090-0084', 'Máquinas de coser ', NULL, NULL),
(318, 6, '20090-0085', 'Máquinas de planchar ', NULL, NULL),
(319, 6, '20090-0086', 'Máquinas para cortar carne ', NULL, NULL),
(320, 6, '20090-0087', 'Máquinas para cortar jamón ', NULL, NULL),
(321, 6, '20090-0088', 'Máquinas para fabricar cubos de hielo ', NULL, NULL),
(322, 6, '20090-0089', 'Máquinas para hacer helados ', NULL, NULL),
(323, 6, '20090-0090', 'Máquinas para lavar alfombras ', NULL, NULL),
(324, 6, '20090-0091', 'Máquinas ralladoras ', NULL, NULL),
(325, 6, '20090-0092', 'Máquinas secadoras de ropa ', NULL, NULL),
(326, 6, '20090-0093', 'Marcadoras de ropa ', NULL, NULL),
(327, 6, '20090-0094', 'Marmitas ', NULL, NULL),
(328, 6, '20090-0095', 'Materos ', NULL, NULL),
(329, 6, '20090-0096', 'Macedores ', NULL, NULL),
(330, 6, '20090-0097', 'Mesas ', NULL, NULL),
(331, 6, '20090-0098', 'Mesones ', NULL, NULL),
(332, 6, '20090-0099', 'Molinos para carne ', NULL, NULL),
(333, 6, '20090-0100', 'Molinos para granos ', NULL, NULL),
(334, 6, '20090-0101', 'Mostradores ', NULL, NULL),
(335, 6, '20090-0102', 'Neveras ', NULL, NULL),
(336, 6, '20090-0103', 'Neveras-mostrador ', NULL, NULL),
(337, 6, '20090-0104', 'Objetos decorativos ', NULL, NULL),
(338, 6, '20090-0105', 'Ollas grandes ', NULL, NULL),
(339, 6, '20090-0106', 'Paravanes ver biombos ', NULL, NULL),
(340, 6, '20090-0107', 'Parrillas móviles ', NULL, NULL),
(341, 6, '20090-0108', 'Peinadoras ver tocadores ', NULL, NULL),
(342, 6, '20090-0109', 'Peladoras de papas ', NULL, NULL),
(343, 6, '20090-0110', 'Percheros ', NULL, NULL),
(344, 6, '20090-0111', 'Persianas ', NULL, NULL),
(345, 6, '20090-0112', 'Planchas eléctricas ', NULL, NULL),
(346, 6, '20090-0113', 'Platones ', NULL, NULL),
(347, 6, '20090-0114', 'Poltronas ', NULL, NULL),
(348, 6, '20090-0115', 'Pulidoras de pisos ', NULL, NULL),
(349, 6, '20090-0116', 'Purificadores de agua ', NULL, NULL),
(350, 6, '20090-0117', 'Radio-receptores ', NULL, NULL),
(351, 6, '20090-0118', 'Rebanadas de fiambres ', NULL, NULL),
(352, 6, '20090-0119', 'Recipientes ', NULL, NULL),
(353, 6, '20090-0120', 'Repisas ', NULL, NULL),
(354, 6, '20090-0121', 'Revisteros ', NULL, NULL),
(355, 6, '20090-0122', 'Roperos ', NULL, NULL),
(356, 6, '20090-0123', 'Sartenes ', NULL, NULL),
(357, 6, '20090-0124', 'Secadores de ropa ', NULL, NULL),
(358, 6, '20090-0125', 'Sillas ', NULL, NULL),
(359, 6, '20090-0126', 'Sillones  poltronas ', NULL, NULL),
(360, 6, '20090-0127', 'Sillones de barbera ', NULL, NULL),
(361, 6, '20090-0128', 'Sofás ', NULL, NULL),
(362, 6, '20090-0129', 'Taburetes ', NULL, NULL),
(363, 6, '20090-0130', 'Tapetes (ver alfombras] ', NULL, NULL),
(364, 6, '20090-0131', 'Tarimas ', NULL, NULL),
(365, 6, '20090-0132', 'Televisores ', NULL, NULL),
(366, 6, '20090-0133', 'Tiendas de campaña ', NULL, NULL),
(367, 6, '20090-0134', 'Tinajeros ', NULL, NULL),
(368, 6, '20090-0135', 'Tocadores ', NULL, NULL),
(369, 6, '20090-0136', 'Tostadoras ', NULL, NULL),
(370, 6, '20090-0137', 'Vajillas de lujo ', NULL, NULL),
(371, 6, '20090-0138', 'Video grabadores ', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencia_usuarias`
--

CREATE TABLE `dependencia_usuarias` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_dependencia_usuaria_id` int(10) UNSIGNED NOT NULL,
  `unidad_administrativa_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dependencia_usuarias`
--

INSERT INTO `dependencia_usuarias` (`id`, `tipo_dependencia_usuaria_id`, `unidad_administrativa_id`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'DESINCORPORACION', NULL, NULL, NULL),
(2, 2, 2, 'SOPORTE TECNICO', NULL, '2023-08-19 01:36:56', '2023-08-19 01:36:56'),
(3, 2, 2, 'DESARROLLO DE SOFTWARE', NULL, '2023-08-19 01:37:16', '2023-08-19 01:37:16'),
(4, 2, 4, 'AGROPECUARIA', NULL, '2023-08-19 01:37:53', '2023-08-19 01:37:53'),
(5, 1, 6, 'ALMACEN', NULL, '2023-08-19 01:38:22', '2023-08-19 01:38:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_tipo_movimientos`
--

CREATE TABLE `detalle_tipo_movimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_movimiento_id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_tipo_movimientos`
--

INSERT INTO `detalle_tipo_movimientos` (`id`, `tipo_movimiento_id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 1, '01', 'Compras', NULL, NULL),
(2, 1, '02', 'Inventario', NULL, NULL),
(3, 1, '03', 'Fabricación o producción de materiales bienes', NULL, NULL),
(4, 1, '04', 'Omisión en inventario inicial', NULL, NULL),
(5, 1, '05', 'Ingreso provisional de bienes materiales proveniente de programas especiales', NULL, NULL),
(6, 1, '06', 'Ingreso definitivo de bienes y materiales proveniente de programas especiales', NULL, NULL),
(7, 1, '07', 'Devolución y materiales robados, hurtados o perdidos', NULL, NULL),
(8, 1, '08', 'Aparición de bienes y materiales desincorporados por causas imputables a funcionarios o empleados', NULL, NULL),
(9, 1, '11', 'Donaciones', NULL, NULL),
(10, 1, '12', 'Permuta', NULL, NULL),
(11, 1, '13', 'Ingreso provisional de bienes dados en comodato', NULL, NULL),
(12, 1, '14', 'Ingreso definitivo de bienes dados en comodato', NULL, NULL),
(13, 1, '15', 'Herencia vacantes', NULL, NULL),
(14, 1, '16', 'Decomiso de bienes y materiales', NULL, NULL),
(15, 1, '17', 'Ingreso provisional de bienes y materiales bajo guarda judicial', NULL, NULL),
(16, 1, '18', 'Ingreso definitivo de bienes y materiales que habían sido registrados provisionalmente bajo guarda judicial', NULL, NULL),
(17, 1, '19', 'Incorporación por otros conceptos ', NULL, NULL),
(18, 2, '20', 'Recepción de bienes o materiales procedentes de almacén de la administración central', NULL, NULL),
(19, 2, '21', 'Recepción de bienes o materiales de otras dependencias del organismo ordenador de compromisos y pagos ', NULL, NULL),
(20, 2, '22', 'Recepción de bienes o materiales de otros organismos ordenadores de compromisos y pagos', NULL, NULL),
(21, 2, '23', 'Recepción de bienes o materiales procedentes de otros organismos de las administración publica', NULL, NULL),
(22, 2, '24', 'Devolución de bienes prestados a contratistas', NULL, NULL),
(23, 2, '25', 'Incorporación por cambio de grupo,cuentay subcuenta', NULL, NULL),
(24, 2, '26', 'Correcciones de desincorporaciones ', NULL, NULL),
(25, 2, '27', 'Otros cargos por resignaciones', NULL, NULL),
(26, 2, '30', 'Entrega de bienes o materiales por parte de almacén', NULL, NULL),
(27, 2, '31', 'Entrega de bienes o materiales a otras dependencias del organismo ordenador de compromisos y pagos', NULL, NULL),
(28, 2, '32', 'Entrega de bienes o materiales a otros organismos ordenadores de compromisos y pagos', NULL, NULL),
(29, 2, '33', 'Entrega de bienes o materiales a otros organismos ordenadores de la Administración Publica Nacional', NULL, NULL),
(30, 2, '34', 'Préstamo de bienes contratistas', NULL, NULL),
(31, 2, '35', 'Desincorporacion por cambio de grupo, cuenta o subcuenta', NULL, NULL),
(32, 2, '36', 'Correcciones de incorporaciones', NULL, NULL),
(33, 2, '37', 'Ajustes por cambio del método de depreciación', NULL, NULL),
(34, 2, '39', 'Otros descargos por reasignaciones ', NULL, NULL),
(35, 3, '40', 'Error de incorporación de bienes o materiales', NULL, NULL),
(36, 3, '41', 'Pase a situación de desuso para reasignacion, venta o disposición final', NULL, NULL),
(37, 3, '42', 'Bienes o materiales en custodia en el almacén ', NULL, NULL),
(38, 3, '43', 'Venta', NULL, NULL),
(39, 3, '44', 'Cesiones sin cargos a organismos del sector privado.', NULL, NULL),
(40, 3, '45', 'Cesiones sin cargos a los entes descentralizados territorialmente ', NULL, NULL),
(41, 3, '46', 'Perdida de bienes con formulación de cargos', NULL, NULL),
(42, 3, '47', 'Robo o hurto de bienes o materiales', NULL, NULL),
(43, 3, '48', 'Otras perdidas de bienes o materiales no culposas ', NULL, NULL),
(44, 3, '49', 'Destrucción o incineración de bienes o materiales', NULL, NULL),
(45, 3, '50', 'Desarme o desmantelamiento de bienes', NULL, NULL),
(46, 3, '51', 'Inservibilidad ', NULL, NULL),
(47, 3, '52', 'Deterioro', NULL, NULL),
(48, 3, '53', 'Demolición', NULL, NULL),
(49, 3, '57', 'Desincorporacion por permuta ', NULL, NULL),
(50, 3, '58', 'Desincorporacion por por donación ', NULL, NULL),
(51, 3, '59', 'Desincorporacion por otros conceptos ', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SONY', NULL, '2023-08-19 01:38:34', '2023-10-30 17:37:28'),
(2, 'LOGITECH', NULL, '2023-08-19 01:38:55', '2023-08-19 01:38:55'),
(3, 'ASUS', NULL, '2023-08-19 01:39:03', '2023-08-19 01:39:03'),
(8, 'SAMSUNG', NULL, '2023-10-29 20:08:05', '2023-10-29 20:08:05'),
(9, 'DELL TECHNOLOGIES', NULL, '2023-10-29 20:09:34', '2023-10-29 20:09:34'),
(10, 'INTEL', NULL, '2023-10-29 20:09:46', '2023-10-29 20:09:46'),
(11, 'LENOVO', NULL, '2023-10-29 20:09:57', '2023-10-29 20:09:57'),
(12, 'LG ELECTRONICS', NULL, '2023-10-29 20:10:06', '2023-10-29 20:10:06'),
(13, 'FENDER', NULL, '2023-10-29 20:11:08', '2023-10-29 20:11:08'),
(14, 'YAMAHA', NULL, '2023-10-29 20:11:20', '2023-10-29 20:11:20'),
(15, 'CASIO', NULL, '2023-10-29 20:12:00', '2023-10-29 20:12:00'),
(16, 'AMD', NULL, '2023-10-29 20:13:04', '2023-10-29 20:13:04'),
(17, 'PANASONIC', NULL, '2023-10-29 20:13:49', '2023-10-29 20:13:49'),
(18, 'APPLE', NULL, '2023-10-29 20:14:04', '2023-10-29 20:14:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_02_23_121047_create_marcas_table', 1),
(9, '2019_02_26_170155_create_coordinacions_table', 1),
(10, '2019_02_26_172328_create_subcoordinacions_table', 1),
(11, '2019_02_28_101032_create_tipo_dependencia_usuarias_table', 1),
(12, '2019_02_28_111632_create_unidad_administrativas_table', 1),
(13, '2019_03_03_095336_create_dependencia_usuarias_table', 1),
(14, '2019_03_04_190538_create_categorias_table', 1),
(15, '2019_03_05_070320_create_denominacions_table', 1),
(16, '2019_03_05_075343_create_tipo_movimientos_table', 1),
(17, '2019_03_05_083955_create_detalle_tipo_movimientos_table', 1),
(18, '2019_03_05_090729_create_movimientos_table', 1),
(19, '2019_03_06_164521_create_biens_table', 1),
(20, '2019_03_06_171350_create_biens_movimientos_table', 1),
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(23, '2023_08_02_201231_create_personas_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `detalle_tipo_movimiento_id` int(10) UNSIGNED NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `detalle_tipo_movimiento_id`, `fecha`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-18 13:08:16', '2023-08-19 01:44:16', '2023-08-19 01:44:16'),
(2, 1, '2023-10-29 10:10:04', '2023-10-29 22:26:04', '2023-10-29 22:26:04'),
(3, 9, '2023-10-29 10:10:36', '2023-10-29 22:28:36', '2023-10-29 22:28:36'),
(4, 3, '2023-10-30 05:10:52', '2023-10-30 17:39:52', '2023-10-30 17:39:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcoordinacions`
--

CREATE TABLE `subcoordinacions` (
  `id` int(10) UNSIGNED NOT NULL,
  `coordinacion_id` int(10) UNSIGNED NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcoordinacions`
--

INSERT INTO `subcoordinacions` (`id`, `coordinacion_id`, `ciudad`, `nombre`, `direccion`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DESINCORPORACION', 'DESINCORPORACION', 'DESINCORPORACION', NULL, NULL, NULL),
(2, 2, 'SAN CRISTOBAL', 'IUT SAN CRISTOBAL', 'DIAGONAL A LA 21 BRIGADA', NULL, '2023-08-19 01:34:28', '2023-08-19 01:34:28'),
(3, 2, 'PREGONERO', 'IUT URIBANTE', 'POR EL CEMENTERIO NUEVO', NULL, '2023-08-19 01:34:50', '2023-08-19 01:34:50'),
(4, 2, 'SAN JUAN DE COLON', 'IUT COLON', 'CENTRO', NULL, '2023-08-19 01:35:12', '2023-08-19 01:35:12'),
(5, 2, 'UREÑA', 'IUT UREÑA', 'FRONTERA', NULL, '2023-10-02 23:05:01', '2023-10-02 23:05:01'),
(6, 2, 'EL PIÑAL', 'IUT EL PIÑAL', 'VIA EL LLANO', NULL, '2023-10-29 19:37:00', '2023-10-29 19:37:00'),
(7, 2, 'MICHELENA', 'IUT MICHENA', 'SDFDSF', NULL, '2023-10-30 17:35:47', '2023-10-30 17:35:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_dependencia_usuarias`
--

CREATE TABLE `tipo_dependencia_usuarias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_dependencia_usuarias`
--

INSERT INTO `tipo_dependencia_usuarias` (`id`, `nombre`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ALMACEN', NULL, NULL, NULL),
(2, 'DEPARTAMENTO', NULL, NULL, NULL),
(3, 'DESINCORPORACION', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimientos`
--

CREATE TABLE `tipo_movimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_movimientos`
--

INSERT INTO `tipo_movimientos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'INCORPORACION', NULL, NULL),
(2, 'REASIGNACION', NULL, NULL),
(3, 'DESINCORPORACION', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_administrativas`
--

CREATE TABLE `unidad_administrativas` (
  `id` int(10) UNSIGNED NOT NULL,
  `subcoordinacion_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidad_administrativas`
--

INSERT INTO `unidad_administrativas` (`id`, `subcoordinacion_id`, `nombre`, `telefono`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DESINCORPORACION', '0000-0000000', NULL, NULL, NULL),
(2, 2, 'SISTEMAS', '0416-9104418', NULL, '2023-08-19 01:35:36', '2023-08-19 01:35:36'),
(3, 2, 'RECURSOS HUMANOS', '0416-9104418', NULL, '2023-08-19 01:35:51', '2023-08-19 01:35:51'),
(4, 3, 'AGROPECURIO', '0416-9104418', NULL, '2023-08-19 01:36:12', '2023-08-19 01:36:12'),
(5, 4, 'ELECTRICIDAD', '0416-9104418', NULL, '2023-08-19 01:36:33', '2023-08-19 01:36:33'),
(6, 2, 'ALMACEN', '0416-9104418', NULL, '2023-08-19 01:38:08', '2023-10-29 19:37:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `biens`
--
ALTER TABLE `biens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `biens_codigo_unique` (`codigo`),
  ADD UNIQUE KEY `biens_serial_unique` (`serial`),
  ADD KEY `biens_denominacion_id_foreign` (`denominacion_id`),
  ADD KEY `biens_marca_id_foreign` (`marca_id`);

--
-- Indices de la tabla `biens_movimientos`
--
ALTER TABLE `biens_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `biens_movimientos_bien_id_foreign` (`bien_id`),
  ADD KEY `biens_movimientos_movimiento_id_foreign` (`movimiento_id`),
  ADD KEY `biens_movimientos_dependencia_usuaria_id_foreign` (`dependencia_usuaria_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorias_codigo_unique` (`codigo`);

--
-- Indices de la tabla `coordinacions`
--
ALTER TABLE `coordinacions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coordinacions_nombre_unique` (`nombre`);

--
-- Indices de la tabla `denominacions`
--
ALTER TABLE `denominacions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `denominacions_codigo_unique` (`codigo`),
  ADD KEY `denominacions_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `dependencia_usuarias`
--
ALTER TABLE `dependencia_usuarias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dependencia_usuarias_tipo_dependencia_usuaria_id_foreign` (`tipo_dependencia_usuaria_id`),
  ADD KEY `dependencia_usuarias_unidad_administrativa_id_foreign` (`unidad_administrativa_id`);

--
-- Indices de la tabla `detalle_tipo_movimientos`
--
ALTER TABLE `detalle_tipo_movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marcas_nombre_unique` (`nombre`),
  ADD UNIQUE KEY `UK_f9j5vnky0egidx9qqqa4gbf85` (`nombre`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimientos_detalle_tipo_movimiento_id_foreign` (`detalle_tipo_movimiento_id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_cedula_unique` (`cedula`);

--
-- Indices de la tabla `subcoordinacions`
--
ALTER TABLE `subcoordinacions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcoordinacions_nombre_unique` (`nombre`),
  ADD KEY `subcoordinacions_coordinacion_id_foreign` (`coordinacion_id`);

--
-- Indices de la tabla `tipo_dependencia_usuarias`
--
ALTER TABLE `tipo_dependencia_usuarias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo_dependencia_usuarias_nombre_unique` (`nombre`);

--
-- Indices de la tabla `tipo_movimientos`
--
ALTER TABLE `tipo_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo_movimientos_nombre_unique` (`nombre`);

--
-- Indices de la tabla `unidad_administrativas`
--
ALTER TABLE `unidad_administrativas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unidad_administrativas_subcoordinacion_id_foreign` (`subcoordinacion_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `biens`
--
ALTER TABLE `biens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `biens_movimientos`
--
ALTER TABLE `biens_movimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `coordinacions`
--
ALTER TABLE `coordinacions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `denominacions`
--
ALTER TABLE `denominacions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT de la tabla `dependencia_usuarias`
--
ALTER TABLE `dependencia_usuarias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_tipo_movimientos`
--
ALTER TABLE `detalle_tipo_movimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcoordinacions`
--
ALTER TABLE `subcoordinacions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_dependencia_usuarias`
--
ALTER TABLE `tipo_dependencia_usuarias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_movimientos`
--
ALTER TABLE `tipo_movimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `unidad_administrativas`
--
ALTER TABLE `unidad_administrativas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `biens`
--
ALTER TABLE `biens`
  ADD CONSTRAINT `biens_denominacion_id_foreign` FOREIGN KEY (`denominacion_id`) REFERENCES `denominacions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `biens_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `biens_movimientos`
--
ALTER TABLE `biens_movimientos`
  ADD CONSTRAINT `biens_movimientos_bien_id_foreign` FOREIGN KEY (`bien_id`) REFERENCES `biens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `biens_movimientos_dependencia_usuaria_id_foreign` FOREIGN KEY (`dependencia_usuaria_id`) REFERENCES `dependencia_usuarias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `biens_movimientos_movimiento_id_foreign` FOREIGN KEY (`movimiento_id`) REFERENCES `movimientos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `denominacions`
--
ALTER TABLE `denominacions`
  ADD CONSTRAINT `denominacions_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `dependencia_usuarias`
--
ALTER TABLE `dependencia_usuarias`
  ADD CONSTRAINT `dependencia_usuarias_tipo_dependencia_usuaria_id_foreign` FOREIGN KEY (`tipo_dependencia_usuaria_id`) REFERENCES `tipo_dependencia_usuarias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dependencia_usuarias_unidad_administrativa_id_foreign` FOREIGN KEY (`unidad_administrativa_id`) REFERENCES `unidad_administrativas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_detalle_tipo_movimiento_id_foreign` FOREIGN KEY (`detalle_tipo_movimiento_id`) REFERENCES `detalle_tipo_movimientos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subcoordinacions`
--
ALTER TABLE `subcoordinacions`
  ADD CONSTRAINT `subcoordinacions_coordinacion_id_foreign` FOREIGN KEY (`coordinacion_id`) REFERENCES `coordinacions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `unidad_administrativas`
--
ALTER TABLE `unidad_administrativas`
  ADD CONSTRAINT `unidad_administrativas_subcoordinacion_id_foreign` FOREIGN KEY (`subcoordinacion_id`) REFERENCES `subcoordinacions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
