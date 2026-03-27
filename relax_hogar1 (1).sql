-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2026 a las 23:40:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `relax_hogar1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='carrito de compras';

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_usuario`, `id_producto`, `cantidad`, `fecha_agregado`) VALUES
(1, 1, 1, 2, '2026-03-23 16:09:36'),
(2, 1, 3, 1, '2026-03-23 16:09:36'),
(3, 2, 2, 1, '2026-03-23 16:09:36'),
(4, 2, 4, 3, '2026-03-23 16:09:36'),
(5, 3, 5, 1, '2026-03-23 16:09:36'),
(6, 3, 6, 2, '2026-03-23 16:09:36'),
(7, 4, 7, 1, '2026-03-23 16:09:36'),
(8, 4, 8, 2, '2026-03-23 16:09:36'),
(9, 5, 9, 1, '2026-03-23 16:09:36'),
(10, 5, 10, 1, '2026-03-23 16:09:36'),
(11, 6, 11, 2, '2026-03-23 16:09:36'),
(12, 6, 12, 1, '2026-03-23 16:09:36'),
(13, 7, 13, 1, '2026-03-23 16:09:36'),
(14, 7, 14, 2, '2026-03-23 16:09:36'),
(15, 8, 15, 1, '2026-03-23 16:09:36'),
(16, 8, 16, 3, '2026-03-23 16:09:36'),
(17, 9, 17, 1, '2026-03-23 16:09:36'),
(18, 9, 18, 2, '2026-03-23 16:09:36'),
(19, 10, 19, 1, '2026-03-23 16:09:36'),
(20, 10, 20, 1, '2026-03-23 16:09:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='detalle de productos por pedido';

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 4, 120000.00),
(2, 1, 3, 4, 90000.00),
(3, 1, 2, 7, 85000.00),
(4, 1, 8, 8, 110000.00),
(5, 1, 1, 1, 120000.00),
(6, 2, 2, 1, 80000.00),
(7, 3, 1, 2, 75000.00),
(8, 4, 3, 1, 90000.00),
(9, 5, 2, 2, 100000.00),
(10, 6, 1, 1, 110000.00),
(11, 7, 3, 1, 130000.00),
(12, 8, 2, 3, 57000.00),
(13, 9, 1, 1, 95000.00),
(14, 10, 3, 2, 105000.00),
(15, 11, 2, 1, 60000.00),
(16, 12, 1, 2, 70000.00),
(17, 13, 3, 1, 180000.00),
(18, 14, 2, 2, 110000.00),
(19, 15, 1, 1, 100000.00),
(20, 17, 10, 3, 95000.00),
(21, 17, 11, 4, 90000.00),
(22, 18, 2, 4, 85000.00),
(23, 18, 3, 3, 90000.00),
(24, 19, 2, 2, 85000.00),
(25, 20, 2, 2, 95000.00),
(26, 21, 2, 3, 85000.00),
(27, 21, 3, 2, 90000.00),
(28, 22, 2, 3, 85000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id_devolucion` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `motivo` varchar(200) DEFAULT NULL,
  `comprobante` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='registro de devoluciones';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id_favorito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='productos favoritos de los usuarios';

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id_favorito`, `id_usuario`, `id_producto`, `fecha_agregado`) VALUES
(1, 1, 1, '2026-03-23 16:09:36'),
(2, 1, 2, '2026-03-23 16:09:36'),
(3, 2, 3, '2026-03-23 16:09:36'),
(4, 2, 4, '2026-03-23 16:09:36'),
(5, 3, 5, '2026-03-23 16:09:36'),
(6, 3, 6, '2026-03-23 16:09:36'),
(7, 4, 7, '2026-03-23 16:09:36'),
(8, 4, 8, '2026-03-23 16:09:36'),
(9, 5, 9, '2026-03-23 16:09:36'),
(10, 5, 10, '2026-03-23 16:09:36'),
(11, 6, 11, '2026-03-23 16:09:36'),
(12, 6, 12, '2026-03-23 16:09:36'),
(13, 7, 13, '2026-03-23 16:09:36'),
(14, 7, 14, '2026-03-23 16:09:36'),
(15, 8, 15, '2026-03-23 16:09:36'),
(16, 8, 16, '2026-03-23 16:09:36'),
(17, 9, 17, '2026-03-23 16:09:36'),
(18, 9, 18, '2026-03-23 16:09:36'),
(19, 10, 19, '2026-03-23 16:09:36'),
(20, 10, 20, '2026-03-23 16:09:36'),
(21, 11, 1, '2026-03-23 16:09:36'),
(22, 11, 2, '2026-03-23 16:09:36'),
(23, 12, 3, '2026-03-23 16:09:36'),
(24, 12, 4, '2026-03-23 16:09:36'),
(25, 13, 5, '2026-03-23 16:09:36'),
(26, 13, 6, '2026-03-23 16:09:36'),
(27, 14, 7, '2026-03-23 16:09:36'),
(28, 14, 8, '2026-03-23 16:09:36'),
(29, 15, 9, '2026-03-23 16:09:36'),
(30, 15, 10, '2026-03-23 16:09:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `id_kardex` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `entrada_cantidad` int(11) DEFAULT 0,
  `entrada_costo` decimal(10,2) DEFAULT 0.00,
  `entrada_total` decimal(10,2) DEFAULT 0.00,
  `salida_cantidad` int(11) DEFAULT 0,
  `salida_costo` decimal(10,2) DEFAULT 0.00,
  `salida_total` decimal(10,2) DEFAULT 0.00,
  `saldo_cantidad` int(11) DEFAULT 0,
  `saldo_costo` decimal(10,2) DEFAULT 0.00,
  `saldo_total` decimal(10,2) DEFAULT 0.00,
  `cliente` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`id_kardex`, `id_producto`, `producto`, `referencia`, `entrada_cantidad`, `entrada_costo`, `entrada_total`, `salida_cantidad`, `salida_costo`, `salida_total`, `saldo_cantidad`, `saldo_costo`, `saldo_total`, `cliente`, `fecha`) VALUES
(1, 2, 'Almohada Memory Foam', 'REF2', 0, 0.00, 0.00, 3, 85000.00, 255000.00, 27, 85000.00, 2295000.00, 'Ronald Camilo ', '2026-03-25 00:00:00'),
(2, 3, 'Cobija Ligera', 'REF3', 0, 0.00, 0.00, 2, 90000.00, 180000.00, 38, 90000.00, 3420000.00, 'Ronald Camilo ', '2026-03-25 00:00:00'),
(3, 31, 'Cobija', 'Entrada inicial', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 10, 10000.00, 100000.00, 'ADMIN', '2026-03-26 15:29:52'),
(4, 31, 'Cobija', 'Compra proveedor', 10, 0.00, 0.00, 0, 0.00, 0.00, 20, 5000.00, 100000.00, 'ADMIN', '2026-03-26 00:00:00'),
(5, 32, 'cobija1', 'Entrada inicial', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 10, 10000.00, 100000.00, 'ADMIN', '2026-03-26 15:46:21'),
(6, 32, 'cobija1', 'Compra proveedor', 10, 20000.00, 200000.00, 0, 0.00, 0.00, 20, 15000.00, 300000.00, 'ADMIN', '2026-03-26 00:00:00'),
(7, 19, 'Cobija Polar Infantil', 'Compra proveedor', 5, 85000.00, 425000.00, 0, 0.00, 0.00, 5, 85000.00, 425000.00, 'ADMIN', '2026-03-26 00:00:00'),
(8, 19, 'Cobija Polar Infantil', 'Ajuste salida', 0, 0.00, 0.00, 2, 85000.00, 170000.00, 3, 85000.00, 255000.00, 'ADMIN', '2026-03-26 16:14:52'),
(9, 2, 'Almohada Memory Foam', 'VENTA', 0, 0.00, 0.00, 3, 85000.00, 255000.00, 24, 85000.00, 2040000.00, 'Ronald Camilo ', '2026-03-26 00:00:00'),
(10, 0, 'Cobija', 'Entrada inicial', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 10, 10000.00, 100000.00, 'ADMIN', '2026-03-26 16:16:49'),
(11, 0, 'Ronald ', 'Entrada inicial', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 10, 10000.00, 100000.00, 'ADMIN', '2026-03-26 16:17:27'),
(12, 33, 'Ronald', 'Entrada inicial', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 10, 10000.00, 100000.00, 'ADMIN', '2026-03-26 16:24:03'),
(13, 34, 'Cobija2', 'Entrada inicial', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 10, 10000.00, 100000.00, 'ADMIN', '2026-03-26 17:29:24'),
(14, 34, 'Cobija2', 'Compra proveedor', 10, 0.00, 0.00, 0, 0.00, 0.00, 20, 5000.00, 100000.00, 'ADMIN', '2026-03-26 00:00:00'),
(15, 35, 'prueba', 'Entrada inicial', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 10, 10000.00, 100000.00, 'ADMIN', '2026-03-26 17:37:30'),
(16, 35, 'prueba', 'Compra proveedor', 10, 10000.00, 100000.00, 0, 0.00, 0.00, 20, 10000.00, 200000.00, 'ADMIN', '2026-03-26 00:00:00'),
(17, 35, 'prueba', 'Compra proveedor', 10, 20000.00, 200000.00, 0, 0.00, 0.00, 30, 13333.33, 400000.00, 'ADMIN', '2026-03-26 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `leida` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='notificaciones del sistema';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','enviado','entregado','cancelado') DEFAULT 'pendiente',
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='pedidos del sistema';

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `fecha_pedido`, `estado`, `total`) VALUES
(1, 47, '2026-03-23 18:20:23', 'enviado', 2315000.00),
(2, 1, '2026-03-01 05:00:00', 'entregado', 120000.00),
(3, 1, '2026-03-02 05:00:00', 'entregado', 80000.00),
(4, 2, '2026-03-03 05:00:00', 'entregado', 150000.00),
(5, 3, '2026-03-04 05:00:00', 'enviado', 90000.00),
(6, 2, '2026-03-05 05:00:00', 'entregado', 200000.00),
(7, 1, '2026-03-06 05:00:00', 'pendiente', 110000.00),
(8, 3, '2026-03-07 05:00:00', 'entregado', 130000.00),
(9, 2, '2026-03-08 05:00:00', 'enviado', 170000.00),
(10, 1, '2026-03-09 05:00:00', 'entregado', 95000.00),
(11, 3, '2026-03-10 05:00:00', 'entregado', 210000.00),
(12, 2, '2026-03-11 05:00:00', 'enviado', 60000.00),
(13, 1, '2026-03-12 05:00:00', 'entregado', 140000.00),
(14, 3, '2026-03-13 05:00:00', 'enviado', 180000.00),
(15, 2, '2026-03-14 05:00:00', 'entregado', 220000.00),
(16, 1, '2026-03-15 05:00:00', 'entregado', 100000.00),
(17, 47, '2026-03-24 12:05:25', 'enviado', 645000.00),
(18, 47, '2026-03-24 13:48:35', 'enviado', 610000.00),
(19, 47, '2026-03-24 13:56:36', 'enviado', 170000.00),
(20, 47, '2026-03-24 14:15:57', 'pendiente', 190000.00),
(21, 47, '2026-03-25 05:00:00', 'pendiente', 435000.00),
(22, 47, '2026-03-26 05:00:00', 'pendiente', 255000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria` enum('Cobija','Almohada','Otro') NOT NULL,
  `material` varchar(60) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_creado` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='inventario de productos';

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `categoria`, `material`, `precio`, `stock`, `imagen`, `fecha_creado`, `estado`, `activo`) VALUES
(1, 'Cobija Polar', 'Cobija suave de polar, ideal para invierno', 'Cobija', 'Polar', 120000.00, 50, 'cobija_polar.jpg', '2026-03-23 16:09:36', 'activo', 1),
(2, 'Almohada Memory Foam', 'Almohada ergonómica de memory foam', 'Almohada', 'Memory Foam', 85000.00, 24, 'almohada_memory.jpg', '2026-03-23 16:09:36', 'activo', 1),
(3, 'Cobija Ligera', 'Cobija liviana para verano', 'Cobija', 'Algodón', 90000.00, 38, 'cobija_ligera.jpg', '2026-03-23 16:09:36', 'activo', 1),
(4, 'Almohada Plumas', 'Almohada rellena de plumas naturales', 'Almohada', 'Plumas', 95000.00, 25, 'almohada_plumas.jpg', '2026-03-23 16:09:36', 'activo', 1),
(5, 'Manta Decorativa', 'Manta decorativa para sala', 'Otro', 'Acrílico', 70000.00, 60, 'manta_decorativa.jpg', '2026-03-23 16:09:36', 'activo', 1),
(6, 'Cobija de Lana', 'Cobija cálida de lana merino', 'Cobija', 'Lana', 150000.00, 20, 'cobija_lana.jpg', '2026-03-23 16:09:36', 'activo', 1),
(7, 'Almohada Gel', 'Almohada con gel refrescante', 'Almohada', 'Gel', 88000.00, 35, 'almohada_gel.jpg', '2026-03-23 16:09:36', 'activo', 1),
(8, 'Cobija Reversible', 'Cobija reversible de algodón y polar', 'Cobija', 'Algodón/Polar', 110000.00, 45, 'cobija_reversible.jpg', '2026-03-23 16:09:36', 'activo', 1),
(9, 'Almohada Infantil', 'Almohada pequeña para niños', 'Almohada', 'Algodón', 50000.00, 50, 'almohada_infantil.jpg', '2026-03-23 16:09:36', 'activo', 1),
(10, 'Cobija Estampada', 'Cobija con estampados modernos', 'Cobija', 'Poliéster', 95000.00, 40, 'cobija_estampada.jpg', '2026-03-23 16:09:36', 'activo', 1),
(11, 'Almohada Ortopédica', 'Almohada para soporte cervical', 'Almohada', 'Espuma', 90000.00, 30, 'almohada_ortopedica.jpg', '2026-03-23 16:09:36', 'activo', 1),
(12, 'Manta Sherpa', 'Manta suave con forro sherpa', 'Otro', 'Sherpa', 130000.00, 25, 'manta_sherpa.jpg', '2026-03-23 16:09:36', 'activo', 1),
(13, 'Cobija Termica', 'Cobija térmica eléctrica', 'Cobija', 'Sintético', 200000.00, 15, 'cobija_termica.jpg', '2026-03-23 16:09:36', 'activo', 1),
(14, 'Almohada Microfibra', 'Almohada suave de microfibra', 'Almohada', 'Microfibra', 75000.00, 50, 'almohada_microfibra.jpg', '2026-03-23 16:09:36', 'activo', 1),
(15, 'Cobija de Algodón', 'Cobija 100% algodón orgánico', 'Cobija', 'Algodón', 105000.00, 40, 'cobija_algodon.jpg', '2026-03-23 16:09:36', 'activo', 1),
(16, 'Almohada Viscoelástica', 'Almohada viscoelástica para descanso', 'Almohada', 'Viscoelástica', 98000.00, 35, 'almohada_visco.jpg', '2026-03-23 16:09:36', 'activo', 1),
(17, 'Cobija Fleece', 'Cobija de fleece ligera', 'Cobija', 'Fleece', 80000.00, 60, 'cobija_fleece.jpg', '2026-03-23 16:09:36', 'activo', 1),
(18, 'Almohada de Plumas Hipoalergénica', 'Almohada hipoalergénica de plumas', 'Almohada', 'Plumas', 99000.00, 30, 'almohada_plumas_hipo.jpg', '2026-03-23 16:09:36', 'activo', 1),
(19, 'Cobija Polar Infantil', 'Cobija polar para niños', 'Cobija', 'Polar', 85000.00, 3, 'cobija_polar_infantil.jpg', '2026-03-23 16:09:36', 'activo', 1),
(20, 'Almohada de Gel Refrigerante', 'Almohada con gel refrescante', 'Almohada', 'Gel', 88000.00, 25, 'almohada_gel2.jpg', '2026-03-23 16:09:36', 'activo', 1),
(33, 'Ronald', NULL, 'Cobija', NULL, 10000.00, 10, '', '2026-03-26 21:24:03', 'activo', 0),
(34, 'Cobija2', NULL, 'Cobija', NULL, 10000.00, 20, '', '2026-03-26 22:29:24', 'activo', 0),
(35, 'prueba', NULL, 'Cobija', NULL, 10000.00, 30, '', '2026-03-26 22:37:30', 'activo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas`
--

CREATE TABLE `resenas` (
  `id_resena` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `calificacion` int(11) DEFAULT NULL CHECK (`calificacion` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='resenas de productos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL COMMENT 'identificador del rol',
  `nombre` varchar(30) NOT NULL COMMENT 'nombre del rol (admin, cliente)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='roles del sistema';

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`) VALUES
(2, 'administrador'),
(1, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL COMMENT 'identificador unico del usuario',
  `nombre` varchar(60) NOT NULL COMMENT 'nombre completo del usuario',
  `correo` varchar(120) NOT NULL COMMENT 'correo electronico',
  `usuario` varchar(40) DEFAULT NULL COMMENT 'username para login (admins)',
  `telefono` varchar(20) DEFAULT NULL COMMENT 'telefono de contacto',
  `direccion` varchar(150) DEFAULT NULL COMMENT 'direccion del usuario',
  `contrasena` varchar(225) NOT NULL COMMENT 'contrasena cifrada',
  `id_rol` int(11) NOT NULL COMMENT 'rol asignado al usuario',
  `fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'fecha de registro',
  `foto` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='usuarios del sistema (clientes y administradores)';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `correo`, `usuario`, `telefono`, `direccion`, `contrasena`, `id_rol`, `fecha_ingreso`, `foto`, `estado`, `activo`) VALUES
(1, 'Juan Perez', 'juan.perez1@email.com', NULL, '3001234561', 'Calle 1 #11-22', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(2, 'Maria Lopez', 'maria.lopez2@email.com', NULL, '3001234562', 'Calle 2 #22-33', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(3, 'Carlos Gomez', 'carlos.gomez3@email.com', NULL, '3001234563', 'Calle 3 #33-44', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(4, 'Ana Torres', 'ana.torres4@email.com', NULL, '3001234564', 'Calle 4 #44-55', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(5, 'Luis Ramirez', 'luis.ramirez5@email.com', NULL, '3001234565', 'Calle 5 #55-66', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(6, 'Sofia Martinez', 'sofia.martinez6@email.com', NULL, '3001234566', 'Calle 6 #66-77', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(7, 'Jorge Fernandez', 'jorge.fernandez7@email.com', NULL, '3001234567', 'Calle 7 #77-88', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(8, 'Laura Sanchez', 'laura.sanchez8@email.com', NULL, '3001234568', 'Calle 8 #88-99', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(9, 'Diego Castillo', 'diego.castillo9@email.com', NULL, '3001234569', 'Calle 9 #99-10', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(10, 'Carolina Ruiz', 'carolina.ruiz10@email.com', NULL, '3001234570', 'Calle 10 #10-11', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(11, 'Admin1', 'admin1@email.com', 'admin1', '3001234571', 'Oficina 1', 'adminpass', 1, '2026-03-23 16:09:36', '1774289912_İstiyenler içun.jpg', 'activo', 1),
(12, 'Admin2', 'admin2@email.com', 'admin2', '3001234572', 'Oficina 2', 'adminpass', 1, '2026-03-23 16:09:36', NULL, 'activo', 1),
(13, 'Admin3', 'admin3@email.com', 'admin3', '3001234573', 'Oficina 3', 'adminpass', 1, '2026-03-23 16:09:36', NULL, 'activo', 1),
(14, 'Admin4', 'admin4@email.com', 'admin4', '3001234574', 'Oficina 4', 'adminpass', 1, '2026-03-23 16:09:36', NULL, 'activo', 1),
(15, 'Admin5', 'admin5@email.com', 'admin5', '3001234575', 'Oficina 5', 'adminpass', 1, '2026-03-23 16:09:36', NULL, 'activo', 1),
(16, 'Miguel Torres', 'miguel.torres11@email.com', NULL, '3001234576', 'Calle 11 #11-12', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(17, 'Valentina Diaz', 'valentina.diaz12@email.com', NULL, '3001234577', 'Calle 12 #12-13', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(18, 'Andres Molina', 'andres.molina13@email.com', NULL, '3001234578', 'Calle 13 #13-14', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(19, 'Camila Vargas', 'camila.vargas14@email.com', NULL, '3001234579', 'Calle 14 #14-15', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(20, 'Fernando Herrera', 'fernando.herrera15@email.com', NULL, '3001234580', 'Calle 15 #15-16', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(21, 'Isabella Jimenez', 'isabella.jimenez16@email.com', NULL, '3001234581', 'Calle 16 #16-17', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(22, 'Ricardo Moreno', 'ricardo.moreno17@email.com', NULL, '3001234582', 'Calle 17 #17-18', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(23, 'Natalia Rojas', 'natalia.rojas18@email.com', NULL, '3001234583', 'Calle 18 #18-19', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(24, 'Sebastian Castro', 'sebastian.castro19@email.com', NULL, '3001234584', 'Calle 19 #19-20', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(25, 'Paula Peña', 'paula.pena20@email.com', 'paula', '3001234585', 'Calle 20 #20-21', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 0),
(26, 'Javier Medina', 'javier.medina21@email.com', NULL, '3001234586', 'Calle 21 #21-22', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(27, 'Daniela Ortiz', 'daniela.ortiz22@email.com', NULL, '3001234587', 'Calle 22 #22-23', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(28, 'Nicolas Aguirre', 'nicolas.aguirre23@email.com', NULL, '3001234588', 'Calle 23 #23-24', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(29, 'Andrea Vega', 'andrea.vega24@email.com', NULL, '3001234589', 'Calle 24 #24-25', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(30, 'Esteban Paredes', 'esteban.paredes25@email.com', NULL, '3001234590', 'Calle 25 #25-26', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(31, 'Gabriela Soto', 'gabriela.soto26@email.com', NULL, '3001234591', 'Calle 26 #26-27', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(32, 'Ricardo Salazar', 'ricardo.salazar27@email.com', NULL, '3001234592', 'Calle 27 #27-28', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(33, 'Camila Cardenas', 'camila.cardenas28@email.com', NULL, '3001234593', 'Calle 28 #28-29', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(34, 'Felipe Guerrero', 'felipe.guerrero29@email.com', NULL, '3001234594', 'Calle 29 #29-30', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(35, 'Diana Rincón', 'diana.rincon30@email.com', NULL, '3001234595', 'Calle 30 #30-31', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(36, 'Andres Figueroa', 'andres.figueroa31@email.com', NULL, '3001234596', 'Calle 31 #31-32', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(37, 'Karen Torres', 'karen.torres32@email.com', NULL, '3001234597', 'Calle 32 #32-33', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(38, 'Alejandro Suarez', 'alejandro.suarez33@email.com', NULL, '3001234598', 'Calle 33 #33-34', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(39, 'Monica Cabrera', 'monica.cabrera34@email.com', NULL, '3001234599', 'Calle 34 #34-35', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(40, 'Jorge Peña', 'jorge.pena35@email.com', NULL, '3001234600', 'Calle 35 #35-36', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(41, 'Paola Rojas', 'paola.rojas36@email.com', NULL, '3001234601', 'Calle 36 #36-37', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(42, 'Andres Moreno', 'andres.moreno37@email.com', NULL, '3001234602', 'Calle 37 #37-38', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(43, 'Laura Torres', 'laura.torres38@email.com', NULL, '3001234603', 'Calle 38 #38-39', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(44, 'Diego Vargas', 'diego.vargas39@email.com', NULL, '3001234604', 'Calle 39 #39-40', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(45, 'Sofia Herrera', 'sofia.herrera40@email.com', NULL, '3001234605', 'Calle 40 #40-41', 'pass123', 2, '2026-03-23 16:09:36', NULL, 'activo', 1),
(47, 'Camilo', 'ronaldculma46@gmail.com', 'ronald', '3212408333', 'Avenida Carrera 14 #22-73', '123aja31', 2, '2026-03-23 17:25:55', '1774559474_WhatsApp Image 2026-03-14 at 10.04.19 PM (2).png', 'activo', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`id_kardex`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id_resena`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `id_kardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id_resena` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del rol', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico del usuario', AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `resenas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
