-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2018 a las 15:57:59
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `youupemor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `clave` varchar(10) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `Grupo_idGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `matricula` varchar(10) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `Grupo_idGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL,
  `contenido` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL,
  `grado` int(11) DEFAULT NULL,
  `grupo` char(1) DEFAULT NULL,
  `carrera` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `idPost` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `Alumno_matricula` int(11) NOT NULL,
  `Alumno_Grupo_idGrupo` int(11) NOT NULL,
  `Administrador_clave` int(11) NOT NULL,
  `Administrador_Grupo_idGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post_has_comentario`
--

CREATE TABLE `post_has_comentario` (
  `Post_idPost` int(11) NOT NULL,
  `Alumno_matricula` int(11) NOT NULL,
  `Alumno_Grupo_idGrupo` int(11) NOT NULL,
  `Administrador_clave` int(11) NOT NULL,
  `Administrador_Grupo_idGrupo` int(11) NOT NULL,
  `Comentario_idComentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`clave`,`Grupo_idGrupo`),
  ADD KEY `fk_Administrador_Grupo1` (`Grupo_idGrupo`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`matricula`,`Grupo_idGrupo`),
  ADD KEY `fk_Alumno_Grupo` (`Grupo_idGrupo`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idComentario`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idPost`,`Alumno_matricula`,`Alumno_Grupo_idGrupo`,`Administrador_clave`,`Administrador_Grupo_idGrupo`),
  ADD KEY `fk_Post_Alumno1` (`Alumno_matricula`,`Alumno_Grupo_idGrupo`),
  ADD KEY `fk_Post_Administrador1` (`Administrador_clave`,`Administrador_Grupo_idGrupo`);

--
-- Indices de la tabla `post_has_comentario`
--
ALTER TABLE `post_has_comentario`
  ADD PRIMARY KEY (`Post_idPost`,`Alumno_matricula`,`Alumno_Grupo_idGrupo`,`Administrador_clave`,`Administrador_Grupo_idGrupo`,`Comentario_idComentario`),
  ADD KEY `fk_Post_has_Comentario_Post1` (`Post_idPost`,`Alumno_matricula`,`Alumno_Grupo_idGrupo`,`Administrador_clave`,`Administrador_Grupo_idGrupo`),
  ADD KEY `fk_Post_has_Comentario_Comentario1` (`Comentario_idComentario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idGrupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `idPost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `post_has_comentario`
--
ALTER TABLE `post_has_comentario`
  MODIFY `Post_idPost` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_Administrador_Grupo1` FOREIGN KEY (`Grupo_idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `fk_Alumno_Grupo` FOREIGN KEY (`Grupo_idGrupo`) REFERENCES `mydb`.`grupo` (`idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `post_has_comentario`
--
ALTER TABLE `post_has_comentario`
  ADD CONSTRAINT `fk_Post_has_Comentario_Comentario1` FOREIGN KEY (`Comentario_idComentario`) REFERENCES `comentario` (`idComentario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Post_has_Comentario_Post1` FOREIGN KEY (`Post_idPost`,`Alumno_matricula`,`Alumno_Grupo_idGrupo`,`Administrador_clave`,`Administrador_Grupo_idGrupo`) REFERENCES `post` (`idPost`, `Alumno_matricula`, `Alumno_Grupo_idGrupo`, `Administrador_clave`, `Administrador_Grupo_idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
