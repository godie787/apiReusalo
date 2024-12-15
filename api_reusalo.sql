-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2024 a las 13:45:05
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
-- Base de datos: `api_reusalo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'Todos', 'todos los productos', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(8, 'Ropa y accesorios', NULL, '2024-11-22 16:50:15', NULL, NULL),
(9, 'Muebles y decoración', NULL, '2024-11-22 16:50:15', NULL, NULL),
(10, 'Libros', NULL, '2024-11-22 16:51:55', NULL, NULL),
(11, 'Electrónica y gadgets', NULL, '2024-11-22 16:52:11', NULL, NULL),
(12, 'Herramientas y equipos', NULL, '2024-11-22 16:52:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_termino` date DEFAULT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `id_tipo` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `estado` enum('activo','cancelado','finalizado','pendiente') NOT NULL DEFAULT 'pendiente',
  `id_usuario` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `nombre`, `descripcion`, `fecha_inicio`, `fecha_termino`, `ubicacion`, `id_tipo`, `created_at`, `updated_at`, `deleted_at`, `estado`, `id_usuario`) VALUES
(11, 'Feria de las pulgas', '', '2024-11-28', '2024-11-30', 'Valparaíso', 2, NULL, NULL, NULL, 'activo', 1),
(12, 'Feria del trueke', 'Trueques varios', '2024-11-30', NULL, 'Quilpué', 3, NULL, NULL, NULL, 'activo', 1),
(15, 'Testing', 'testing', '2024-11-29', '2024-11-30', 'USM', 6, '2024-11-27 15:10:04', '2024-11-27 15:10:04', NULL, 'pendiente', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2024_11_07_142609_create_categorias_table', 1),
(3, '2024_11_07_142519_create_productos_table', 2),
(4, '2024_11_07_151433_create_sessions_table', 3),
(5, '2024_11_07_203644_create_tipos_evento_table', 4),
(6, '2024_11_07_201452_create_eventos_table', 5),
(7, '2024_11_07_215149_modify_id_categoria_in_productos_table', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_categoria` bigint(20) UNSIGNED NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('disponible','vendido','pendiente') NOT NULL DEFAULT 'disponible',
  `imagenes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`imagenes`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `id_categoria`, `precio`, `descripcion`, `estado`, `imagenes`, `created_at`, `updated_at`, `deleted_at`, `id_usuario`) VALUES
(5, 'Chaqueta nike', 8, 15500, '', 'disponible', '[\"https://i.postimg.cc/3rS1ckJd/Screen-Shot-2024-10-12-23-45-57.png\"]', '2024-11-08 18:37:50', '2024-11-08 18:37:50', NULL, 1),
(19, 'Camiseta básica', 8, 5000, 'Camiseta de algodón unisex', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-27 08:25:05', '2024-11-27 08:25:05', 3),
(20, 'Pantalón jeans', 8, 15000, 'Jeans azul de corte regular', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 09:09:12', NULL, 1),
(21, 'Chaqueta casual', 8, 25000, 'Chaqueta de estilo moderno', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 09:11:06', NULL, 1),
(22, 'Zapatillas deportivas', 8, 30000, 'Zapatillas cómodas para uso diario', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 09:11:06', NULL, 1),
(23, 'Bolso de mano', 8, 10000, 'Bolso pequeño para uso casual', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 09:16:52', NULL, 1),
(24, 'Sombrero de verano', 8, 8000, 'Sombrero ligero para protección solar', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 09:17:08', NULL, 1),
(25, 'Bufanda de lana', 8, 12000, 'Bufanda cálida para invierno', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 09:20:34', NULL, 1),
(26, 'Mesa de madera', 9, 50000, 'Mesa rectangular de madera de roble', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 15:09:20', NULL, 1),
(27, 'Silla ergonómica', 9, 20000, 'Silla cómoda para escritorio', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(28, 'Lámpara de escritorio', 9, 15000, 'Lámpara con luz ajustable', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(29, 'Estantería moderna', 9, 40000, 'Estantería de diseño minimalista', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(30, 'Cojines decorativos', 9, 8000, 'Juego de cojines coloridos', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-27 09:07:40', NULL, 1),
(31, 'Cuadro artístico', 9, 10000, 'Cuadro abstracto para decoración', 'vendido', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(32, 'Alfombra persa', 9, 35000, 'Alfombra de estilo clásico', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(33, 'Novela de misterio', 10, 15000, 'Libro de suspenso y misterio', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(34, 'Guía de cocina', 10, 12000, 'Recetas fáciles y rápidas', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(35, 'Enciclopedia infantil', 10, 20000, 'Enciclopedia educativa para niños', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(36, 'Libro de poesía', 10, 8000, 'Colección de poemas modernos', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(37, 'Manual de programación', 10, 25000, 'Guía completa sobre desarrollo web', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(38, 'Biografía famosa', 10, 18000, 'Historia inspiradora de una celebridad', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(39, 'Cuentos clásicos', 10, 10000, 'Selección de cuentos tradicionales', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(40, 'Teléfono inteligente', 11, 250000, 'Smartphone de última generación', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(41, 'Auriculares inalámbricos', 11, 50000, 'Auriculares Bluetooth con cancelación de ruido', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(42, 'Reloj inteligente', 11, 100000, 'Reloj con monitor de actividad física', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(43, 'Cámara digital', 11, 150000, 'Cámara compacta de alta resolución', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(44, 'Teclado mecánico', 11, 30000, 'Teclado para gamers', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(45, 'Altavoz Bluetooth', 11, 45000, 'Altavoz portátil con buen sonido', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(46, 'Cargador portátil', 11, 20000, 'Power bank de alta capacidad', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(47, 'Taladro eléctrico', 12, 60000, 'Taladro con múltiples velocidades', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(48, 'Juego de destornilladores', 12, 20000, 'Set completo de herramientas', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(49, 'Sierra circular', 12, 80000, 'Sierra para cortes precisos', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(50, 'Llave inglesa', 12, 15000, 'Llave ajustable de acero', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(51, 'Cinta métrica', 12, 5000, 'Cinta métrica de 5 metros', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(52, 'Martillo de carpintero', 12, 10000, 'Martillo resistente para construcción', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(53, 'Caja de herramientas', 12, 35000, 'Caja con organizadores internos', 'disponible', NULL, '2024-11-22 20:22:34', '2024-11-22 20:22:34', NULL, 1),
(55, 'testing', 8, 10000, 'test descr', 'disponible', '[]', '2024-11-27 07:08:09', '2024-11-27 08:18:28', '2024-11-27 08:18:28', 3),
(56, 'test2', 12, 123, 'testtttttt', 'disponible', '[]', '2024-11-27 07:29:33', '2024-11-27 08:20:42', '2024-11-27 08:20:42', 3),
(57, 'a', 12, 234, 'asd', 'pendiente', '[]', '2024-11-27 07:32:29', '2024-11-27 08:23:07', '2024-11-27 08:23:07', 3),
(58, 'PRODUCTO TEST2', 10, 8000, 'sin descripcion', 'disponible', '[]', '2024-11-27 15:10:52', '2024-11-27 15:12:06', '2024-11-27 15:12:06', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0geSGLOCt220rfHgaXTVWb80MPZIApitNXD1wC0E', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlJ5MU1mYVNEQlFHZkNxNXdDZXk4YjV4NEp4WjdWUER5cFBuRWtrRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732661736),
('44PRpX3Tzt799gg3HXB1vywdo8grD0S5TEC3fuRo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN29JVTl4a3ZCQW9FZVp0RzFFek1ybEJJbERaSjNXUGdLTHFmejREcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730992483),
('AWOXSoUbCxa0ERd2tzmdoYWsTu4jyiqR3NGflsXc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEVSR0d0dUFWbHNiNURUcE51VFJ3RXRtZzBkN2J2cVpXVGN0ZXZRRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732280231),
('D1s6EgDYBG4DZcvI2FoVelvmJtdmMSPYH3q3PmU9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVlQZ25qUnBPcXc3WWRkTXBlTlBVVmFUQ2JlbjNxNWNaeGFMUEFZOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732548755),
('f6fyMlM1Xoo7l0kwnhSzNnPSpAZtsgc6eynQIM9X', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibENiTndTY2o2YVI0UzYxalpCMEpqQWVoWmR4elVGbWI1ZXRYU0dYdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732239488),
('GtOI1100Di0Vx8QlygLGNn6BXOTXqInJgu5iitZO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRm1Vdm5XOHZCdXJyaVV0UVBtVHI0QTNwZlZMR3NqQk5jTHFQS2p2UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732653730),
('XlP2OKTzRsyGLl0luC5sB9SOdflmfU1lm1dIsKvJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTUzU2NaSXlWYWR5YVVtc1I1YXJEYlhSVmNYeU5DaEpYM2FwMmszNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732625819);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_evento`
--

CREATE TABLE `tipos_evento` (
  `id_tipo` bigint(20) UNSIGNED NOT NULL,
  `nombre_tipo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_evento`
--

INSERT INTO `tipos_evento` (`id_tipo`, `nombre_tipo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Venta de garage', NULL, NULL, NULL),
(2, 'Feria de las pulgas', NULL, NULL, NULL),
(3, 'Feria del trueque', NULL, NULL, NULL),
(6, 'TESTING', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `uid` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `telefono`, `password`, `fecha_creacion`, `uid`) VALUES
(1, 'Usuario de ejemplo', 'usuario@ejemplo.com', NULL, 'contraseña_segura', '2024-11-26 21:46:19', '6c7a83bb-ac41-11ef-ab51-d03957c061fe'),
(3, 'Diego testing', 'ejemplo2@gmail.com', NULL, 'contraseña_segura', '2024-11-26 21:50:17', '6c7a8ffb-ac41-11ef-ab51-d03957c061fe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `total_venta` decimal(10,2) NOT NULL,
  `forma_pago` enum('transferencia','debito','credito','a_convenir') NOT NULL,
  `carro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`carro`)),
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_usuario`, `total_venta`, `forma_pago`, `carro`, `fecha_venta`) VALUES
(14, 3, 12000.00, 'debito', '[{\"id_producto\":25,\"nombre\":\"Bufanda de lana\",\"precio\":12000,\"id_categoria\":8,\"estado\":\"disponible\",\"imagenes\":null}]', '2024-11-27 06:20:34'),
(15, 3, 50000.00, 'a_convenir', '[{\"id_producto\":26,\"nombre\":\"Mesa de madera\",\"precio\":50000,\"id_categoria\":9,\"estado\":\"disponible\",\"imagenes\":null}]', '2024-11-27 12:09:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `eventos_id_tipo_foreign` (`id_tipo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `productos_id_categoria_foreign` (`id_categoria`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tipos_evento`
--
ALTER TABLE `tipos_evento`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `tipos_evento`
--
ALTER TABLE `tipos_evento`
  MODIFY `id_tipo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `eventos_id_tipo_foreign` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_evento` (`id_tipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
