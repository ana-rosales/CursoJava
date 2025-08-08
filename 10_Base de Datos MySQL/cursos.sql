-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-01-2018 a las 09:32:16
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cursos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `puntuacion` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `calificacion` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idcurso`, `nombre`, `calificacion`) VALUES
(1, 'Calculos', NULL),
(2, 'Sistemas', NULL),
(3, 'programacion', NULL),
(4, 'Diseño', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `primer_ap` varchar(45) DEFAULT NULL,
  `segundo_ap` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombres`, `primer_ap`, `segundo_ap`, `nickname`, `clave`) VALUES
(1, 'analilia', 'avila', 'arechi', 'ananick', 'ana123'),
(2, 'brenda', 'benitez', 'brito', 'brendanick', 'brenda123'),
(10, 'Carla', 'Cabrera', 'Castañeda', 'carlanick', 'carla123'),
(11, 'Daniela', 'Duval', 'Duarte', 'danielanick', 'dianiela123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_cursos`
--

CREATE TABLE `usuarios_cursos` (
  `idusuarios_cursos` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idcurso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idcomentario`),
  ADD KEY `usuario_idx` (`usuario`),
  ADD KEY `curso_idx` (`curso`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idcurso`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `usuarios_cursos`
--
ALTER TABLE `usuarios_cursos`
  ADD PRIMARY KEY (`idusuarios_cursos`),
  ADD KEY `idusuario_idx` (`idusuario`),
  ADD KEY `idcurso_idx` (`idcurso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `usuarios_cursos`
--
ALTER TABLE `usuarios_cursos`
  MODIFY `idusuarios_cursos` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `curso` FOREIGN KEY (`curso`) REFERENCES `cursos` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_cursos`
--
ALTER TABLE `usuarios_cursos`
  ADD CONSTRAINT `idcurso` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
