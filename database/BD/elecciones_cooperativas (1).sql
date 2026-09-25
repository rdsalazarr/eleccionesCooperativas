-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2026 a las 23:59:46
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
-- Base de datos: `elecciones_cooperativas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acta`
--

CREATE TABLE `acta` (
  `actaid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla acta',
  `actatitulo` varchar(200) NOT NULL COMMENT 'Título del acta',
  `actacontenido` varchar(4000) NOT NULL COMMENT 'Contendido del acta',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `acta`
--

INSERT INTO `acta` (`actaid`, `actatitulo`, `actacontenido`, `created_at`, `updated_at`) VALUES
(1, 'ACTA  DE APERTURA DE ELECCIONES DE DELEGADOS A LA XXXVI ASAMBLEA GENERAL EN MARZO DE 2027', 'Siendo las 8:00 de la mañana del día ocho (8) de noviembre del año dos mil veintiseis (2026) en el auditorio de la cooperativa en el Municipio de González Cesar se da  inicio a las elecciones de delegados, proceso de inscripción realizado del 3 al 14 de octubre de 2022  en las oficinas de Coopigon obteniendo un numero  en la lista  de aspirantes a delegados, el proceso se realizara de manera virtual de forma presencial y no presencial con acceso a pantalla del equipo de computo para que sufragan los asociados por el aspirante de su preferencia. \r\n\r\nLos Jurados están conformado por 2 asociados hábiles y el jefe de riesgos de la cooperativa los cuales no están aspirando como delegados, dando cumplimiento al reglamento de elecciones, para el debido proceso de elecciones reciben lo siguiente:\r\n\r\nListado de sufragantes, asociados hábiles a corte del siete (7) de noviembre de 2026.\r\nReglamento de elecciones de delegados para el periodo 2027-2030.\r\nPapelería requerida para impresión de actas de apertura y cierre de elecciones.\r\nEquipo de computo.\r\n \r\nPara mayor constancia firman los Jurados', '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(2, 'ACTA  DE APERTURA DE ELECCIONES DE DELEGADOS A LA XXXVI ASAMBLEA GENERAL EN MARZO DE 2027', 'Siendo las 8:00 de la mañana del día ocho (8) de noviembre del año dos mil veintiseis (2026) en las oficinas de agencia de la cooperativa en el Municipio de Villa Caro se da inicio a las  elecciones de delegados, proceso  de inscripción realizado del 3 al 14 de octubre de 2026 en las oficinas de Coopigon obteniendo un numero en la lista  de aspirantes a delegados, el proceso  se realizara de manera virtual de forma presencial y no presencial con acceso a pantalla del equipo de computo para que sufragan los asociados por el aspirante de su preferencia. \r\n\r\nLos Jurados están conformado por un asociado hábil y Supernumerario de la agencia de Coopigon en el Municipio de Villa Caro, los cuales no están aspirando como delegados, dando cumplimiento al reglamento de elecciones, para el debido proceso de elecciones reciben lo siguiente:\r\n\r\nListado de sufragantes, asociados hábiles a corte del siete (7) de noviembre de 2026.\r\nReglamento de elecciones de delegados para el periodo 2027-2030.\r\nPapelería requerida para impresión de actas de apertura y cierre de elecciones.\r\nEquipo de computo.\r\n \r\nPara mayor constancia firman los Jurados', '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(3, 'RESULTADOS ELECCION DE DELEGADOS PARA LA ASAMBLEA GENERAL DEL PERIODO 2027-2030', 'Siendo las 16:00 horas del día 08 de noviembre de 2026 en Auditorio de COOPIGON los abajo firmantes fueron nombrados como jurados y testigos para el proceso de elecciones y certifican que los miembros de la Asamblea General fueron elegidos por los asociados hábiles de la Cooperativa Por el sistema uninominal de forma electrónica, como se puede observar a continuación:', '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(4, 'RESULTADOS ELECCION DE DELEGADOS PARA LA ASAMBLEA GENERAL DEL PERIODO 2027-2030', 'Siendo las 16:00 horas del día 08 de noviembre de 2026 en la oficina Agencia COOPIGON VILLA CARO los abajo firmantes fueron nombrados como jurados y testigos para el proceso de elecciones y certifican que los miembros de la Asamblea General fueron elegidos por los asociados hábiles de la Cooperativa por el sistema uninominal de forma electrónica, como se puede observar a continuación:', '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(5, 'ACTA APERTURA DE ELECCIONES PARA EL anio', 'Siendo las horaInicio en lugarEvento se da inicio Al proceso de elecciones para elegir miembros del tipoEleccion de siglaEmpresa en la tituloEleccion, los Jurados: nombreJurados y testigo nombreTestigos quienes verifican que el procedimiento de apertura de elecciones.', '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(6, 'ACTA RESULTADOS DE ESCRUTINIO tituloEleccion anio', 'Siendo las horaCierre en lugarEvento donde se llevó  a cabo la tipoEleccion y donde  se  eligen  los miembros para el tituloEleccion, los Jurados: nombreJurados y testigo nombreTestigos quienes  conocen  el proceso  de elección electrónica.', '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(7, 'RESULTADOS DE ELECCIONES MIEMBROS DEL tituloEleccion anio', 'Siendo las horaCierre en lugarEvento los abajo firmantes fueron nombrados como jurados y testigo para el proceso de elecciones y certifican que los miembros de tipoEleccion fueron elegidos por los delegados hábiles de la tituloEleccion por el sistema uninominal de forma electrónica.', '2026-09-21 14:14:39', '2026-09-21 14:14:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencia`
--

CREATE TABLE `agencia` (
  `agenid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla agencia',
  `agennombre` varchar(50) NOT NULL COMMENT 'Nombre de la agencia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `agencia`
--

INSERT INTO `agencia` (`agenid`, `agennombre`) VALUES
(1, 'Gonzalez'),
(2, 'Villa caro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociado`
--

CREATE TABLE `asociado` (
  `asocid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla asociado',
  `tipideid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador del tipo de identificación',
  `agenid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la agencia',
  `asocnumerodocumento` varchar(20) NOT NULL COMMENT 'Número de documento del asociado',
  `asocnombrecompleto` varchar(100) NOT NULL COMMENT 'Nombre completo del asociado',
  `asocfechaingreso` date DEFAULT NULL COMMENT 'Fecha de ingreso del asociado a la cooperativa',
  `asocgenero` varchar(1) DEFAULT NULL COMMENT 'Genero al que pertenece el asociado',
  `asocfechanacimiento` date NOT NULL COMMENT 'Fecha de nacimiento del asociado',
  `asoctelefono` varchar(20) DEFAULT NULL COMMENT 'Teléfono del asociado',
  `asocemail` varchar(80) DEFAULT NULL COMMENT 'Email del asociado',
  `asocdescripcion` varchar(500) DEFAULT NULL COMMENT 'Descripción del asociado',
  `asoccelular` varchar(20) DEFAULT NULL COMMENT 'Celular del asociado',
  `asocfechaexpedicion` date NOT NULL COMMENT 'Fecha expedición del asociado',
  `asocactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el asociado esta activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asociado`
--

INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(16874, 2, 1, '13379047', 'ABEL  QUINTERO PALLARES', NULL, NULL, '1978-02-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1075199725', '1996-07-30', 1, NULL, NULL),
(16875, 2, 1, '5091133', 'ABEL  RANGEL BACCA', NULL, NULL, '1939-08-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1179362829', '1961-03-17', 1, NULL, NULL),
(16876, 2, 1, '6792911', 'ABELARDO  GUTIERREZ MONTEJO', NULL, NULL, '1957-10-20', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1977-03-08', 1, NULL, NULL),
(16877, 2, 1, '18903639', 'ABELARDO  RUEDAS PAEZ', NULL, NULL, '1977-05-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1162729032', '1996-07-22', 1, NULL, NULL),
(16878, 2, 1, '37328887', 'ADDY CECILIA MONTAÃ‘EZ SOLANO', NULL, NULL, '1975-12-27', '0', 'addyce07@hotmail.com', NULL, '-1107400796', '1994-01-28', 1, NULL, NULL),
(16879, 2, 1, '37370916', 'ADELA  TORRADO PE?ARANDA', NULL, NULL, '1980-04-21', NULL, 'adelantetorrado@gmail.com', NULL, '-1146549938', '1998-05-12', 1, NULL, NULL),
(16880, 2, 1, '26774787', 'ADELINA  NAVARRO BOHORQUEZ', NULL, NULL, '1966-05-21', '0', 'adenabo21@gmail.com', NULL, '-1182431298', '1985-08-29', 1, NULL, NULL),
(16881, 2, 1, '1066062121', 'ADELITA  RIVERA VARGAS', NULL, NULL, '1987-04-20', '0', 'sincorreo@sincorreo.com', NULL, '-1066410989', '2005-07-11', 1, NULL, NULL),
(16882, 2, 1, '37318376', 'ADIELA  ORTIZ ROPERO', NULL, NULL, '1965-05-17', '5612586', 'adioro1@hotmail.com', NULL, '-1186941398', '1984-07-27', 1, NULL, NULL),
(16883, 2, 1, '88284144', 'ADOLFO  VEGA PADILLA', NULL, NULL, '1977-11-05', '0', 'sincorreo@sincorreo.com', NULL, '-1179679056', '1996-03-29', 1, NULL, NULL),
(16884, 2, 1, '1976232', 'ADOLFO ANTONIO VEGA PEREZ', NULL, NULL, '1935-05-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1092741075', '1959-03-14', 1, NULL, NULL),
(16885, 2, 1, '88135893', 'ADOLFO ANTONIO VEGA SANJUAN', NULL, NULL, '1962-08-07', '0', 'sincorreo@sincorreo.com', NULL, '-1156681043', '1981-03-09', 1, NULL, NULL),
(16886, 2, 1, '26774588', 'ADOLIA  MOLINA DUARTE', NULL, NULL, '1955-06-10', '0', 'sincorreo@sincorreo.com', NULL, '-1080707448', '1977-07-12', 1, NULL, NULL),
(16887, 2, 1, '1090987957', 'ADRIAN CAMILO CASTRO MANDON', NULL, NULL, '1993-10-01', '0', 'sincorreo@sincorreo.com', NULL, '-1091011089', '2011-11-17', 1, NULL, NULL),
(16888, 2, 1, '1066062741', 'ADRIAN CAMILO ROPERO DUARTE', NULL, NULL, '1992-03-19', NULL, 'rodoto92@hotmail.com', NULL, '-1179396274', '2010-04-29', 1, NULL, NULL),
(16889, 2, 1, '1091680959', 'ADRIAN CAMILO SANCHEZ ARIAS', NULL, NULL, '1998-10-10', NULL, 'adriansanchezarias98@hotmail.com', NULL, '-1136782621', '2016-10-18', 1, NULL, NULL),
(16890, 2, 1, '5035699', 'ADRIAN FELIPE HORLANDY RIOS', NULL, NULL, '1977-05-14', '0', 'adrianhorlandy1977@hotmail.com', NULL, '-1127145254', '1995-08-29', 1, NULL, NULL),
(16891, 2, 1, '1090982971', 'ADRIAN FERNANDO VERA SANTIAGO', NULL, NULL, '1985-02-06', '0', 'sincorreo@sincorreo.com', NULL, '-1170861695', '2004-11-12', 1, NULL, NULL),
(16892, 2, 1, '13379517', 'ADRIAN GREGORIO PALLARES MENESES', NULL, NULL, '1979-07-21', '0', 'sincorreo@sincorreo.com', NULL, '-1162318818', '1997-08-04', 1, NULL, NULL),
(16893, 2, 1, '1066063487', 'ADRIANA  MANOSALVA GRANADOS', NULL, NULL, '1997-10-16', '0', 'adrianamanosalva2010@hotmail.com', NULL, '-1061004407', '2016-02-16', 1, NULL, NULL),
(16894, 2, 1, '1193536629', 'ADRIANA CAMILA RIOS TRIGOS', NULL, NULL, '2001-01-13', '0', 'camilariost1301@gmail.com', NULL, '-1168362491', '2019-03-21', 1, NULL, NULL),
(16895, 2, 1, '1007949622', 'ADRIANA LUCIA HORLANDY OSORIO', NULL, NULL, '2000-10-25', NULL, 'horlandyosorio@gmail.com', NULL, '-1121967356', '2018-12-13', 1, NULL, NULL),
(16896, 2, 1, '1003257743', 'ADRIANA LUCIA JACOME JACOME', NULL, NULL, '2000-07-10', '0', 'adrianaluciajacome11@gmail.com', NULL, '-1150489559', '2018-10-22', 1, NULL, NULL),
(16897, 2, 1, '1003121923', 'ADRIANA LUCIA MOLINA CHINCHILLA', NULL, NULL, '2002-04-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1179656542', '2020-10-02', 1, NULL, NULL),
(16898, 2, 1, '1091665772', 'ADRIANA MARCELA GARAY PALACIO', NULL, NULL, '1991-02-24', NULL, 'adrianapalacio32@gimail.com', NULL, '-1131662428', '2009-06-26', 1, NULL, NULL),
(16899, 2, 1, '1066063261', 'ADRIANA MARCELA HORLANDY QUINTERO', NULL, NULL, '1996-04-30', '0', 'adrimarce9@gmail.com', NULL, '-1186929582', '2014-05-12', 1, NULL, NULL),
(16900, 2, 1, '1091673888', 'ADRIANA MARCELA SUAREZ MANZANO', NULL, NULL, '1995-02-17', NULL, 'adrianasuaeil24@gmail.com', NULL, '-1180920254', '2013-07-15', 1, NULL, NULL),
(16901, 2, 1, '5035165', 'ADRIANO  DUARTE DUARTE', NULL, NULL, '1961-08-08', '0', 'sincorreo@sincorreo.com', NULL, '-1067310159', '1981-01-15', 1, NULL, NULL),
(16902, 2, 1, '5035022', 'ADRIANO  LEMUS GALLARDO', NULL, NULL, '1956-01-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1137844206', '1976-06-11', 1, NULL, NULL),
(16903, 2, 1, '1733883', 'ADRIANO  LOZANO LEMUS', NULL, NULL, '1946-02-20', '0', 'sicorreo@sincorreo.com', NULL, '-1119691635', '1967-05-18', 1, NULL, NULL),
(16904, 2, 1, '13496292', 'ADRIANO ALFONSO LEMUS QUINTERO', NULL, NULL, '1969-03-16', '0', 'lemusq_16@hotmail.com', NULL, '-1121131317', '1987-06-08', 1, NULL, NULL),
(16905, 2, 1, '37328995', 'ADY CECILIA PEREZ', NULL, NULL, '1973-03-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1071911006', '1994-02-17', 1, NULL, NULL),
(16906, 2, 1, '37317436', 'ADY TERESA LANZZIANO LEMUS', NULL, NULL, '1964-03-27', '0', 'ady.teresalan@gmail.com', NULL, '-1188093469', '1983-09-16', 1, NULL, NULL),
(16907, 2, 1, '88148108', 'AGUSTIN  PEÃ‘ARANDA VARGAS', NULL, NULL, '1962-03-25', '0', 'sincorreo@sincorreo.com', NULL, '-1092666602', '1983-07-07', 1, NULL, NULL),
(16908, 2, 1, '42482103', 'AHIDE  PICON GARZON', NULL, NULL, '1962-01-11', '0', 'sincorreo@sincorreo.com', NULL, '-1086876193', '1988-10-04', 1, NULL, NULL),
(16909, 2, 1, '26777217', 'AHIDE  RIVERA NAVARRO', NULL, NULL, '1976-12-10', '0', 'sincorreo@sincorreo.com', NULL, '-1086169340', '1997-06-11', 1, NULL, NULL),
(16910, 2, 1, '26774669', 'AIDA  PABA NAVARRO', NULL, NULL, '1962-12-13', '0', 'sincorreo@sincorreo.com', NULL, '-1137915964', '1981-09-10', 1, NULL, NULL),
(16911, 2, 1, '1091805083', 'AIDDE  CABARICO CARDENAS', NULL, NULL, '1989-09-20', '0', 'fredysanchez79@hotmail.com', NULL, '-1086111789', '2008-03-03', 1, NULL, NULL),
(16912, 2, 1, '1065872447', 'AIDE  LOPEZ CARDENAS', NULL, NULL, '1985-07-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1080512988', '2006-04-04', 1, NULL, NULL),
(16913, 2, 1, '37328261', 'AIDE DEL CARMEN MOLINA MORA', NULL, NULL, '1964-06-07', '0', 'sincorreo@sincorreo.com', NULL, '-1168182526', '1993-08-30', 1, NULL, NULL),
(16914, 2, 1, '60358992', 'AIDELY  QUINTERO GARCIA', NULL, NULL, '1971-06-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1292544811', '1992-05-06', 1, NULL, NULL),
(16915, 2, 1, '1003257441', 'AIMAR ADAENA CHINCHILLA CHINCHILLA', NULL, NULL, '2001-03-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1192411909', '2019-04-04', 1, NULL, NULL),
(16916, 2, 1, '26774678', 'ALBA EDITH TRIGOS DE MOLINA', NULL, NULL, '1954-04-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1138737161', '1981-10-16', 1, NULL, NULL),
(16917, 2, 1, '26860871', 'ALBA ESTHER CASADIEGOS DE GARCIA', NULL, NULL, '1948-03-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1971-04-28', 1, NULL, NULL),
(16918, 2, 1, '27770657', 'ALBA LUZ MENESES PINEDA', NULL, NULL, '1959-09-08', '0', 'sincorreo@sincorreo.com', NULL, '-1127492295', '1977-12-22', 1, NULL, NULL),
(16919, 2, 1, '37327910', 'ALBA MARINA GAONA LOPEZ', NULL, NULL, '1975-02-07', '0', 'marinagaona2019@gmail.com', NULL, '-1160140525', '1993-05-25', 1, NULL, NULL),
(16920, 2, 1, '37329733', 'ALBA NERY QUINTERO QUINTERO', NULL, NULL, '1971-06-23', '0', 'sincorreo@sincorreo.com', NULL, '-1160240712', '1994-10-31', 1, NULL, NULL),
(16921, 2, 1, '88026704', 'ALBEIRO  MANOSALVA DUARTE', NULL, NULL, '1981-04-08', '0', 'sincorreo@sincorreo.com', NULL, '-1151673577', '1999-06-08', 1, NULL, NULL),
(16922, 2, 1, '1090983932', 'ALBEIRO  MOLINA GALVAN', NULL, NULL, '1987-06-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1188791451', '2006-01-18', 1, NULL, NULL),
(16923, 2, 1, '1007367614', 'ALBEIRO  QUINTERO CASTRO', NULL, NULL, '1987-10-26', '0', 'sincorreo@sincorreo.com', NULL, '-1112854631', '2008-03-13', 1, NULL, NULL),
(16924, 2, 1, '13176241', 'ALBEIRO  QUINTERO GAONA', NULL, NULL, '1984-01-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1066023472', '2002-03-18', 1, NULL, NULL),
(16925, 2, 1, '5036280', 'ALBEIRO  REYES QUINTERO', NULL, NULL, '1982-10-04', '0', 'pulla1982@hotmail.com', NULL, '-1159685120', '2000-12-13', 1, NULL, NULL),
(16926, 1, 1, '1003257580', 'ALBER MAURICIO QUINTERO MENESES', NULL, NULL, '2002-02-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1166911055', '2009-04-24', 1, NULL, NULL),
(16927, 2, 1, '6676580', 'ALBERTO  MARTINEZ ALVAREZ', NULL, NULL, '1963-06-05', '0', 'sincorreo@sincorreo.com', NULL, '-1171066961', '1985-11-20', 1, NULL, NULL),
(16928, 2, 1, '5468745', 'ALBERTO  REYES GUERRERO', NULL, NULL, '1978-06-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1131382295', '1998-12-11', 1, NULL, NULL),
(16929, 2, 1, '88141012', 'ALBERTO  RINCON', NULL, NULL, '1966-06-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1067338436', '1985-10-24', 1, NULL, NULL),
(16930, 2, 1, '13361824', 'ALCIDES  BOHORQUEZ PORTILLO', NULL, NULL, '1956-11-23', '0', 'sincorreo@sincorreo.com', NULL, '-1120097470', '1977-05-17', 1, NULL, NULL),
(16931, 2, 1, '1733866', 'ALCIDES  MANZANO RUEDAS', NULL, NULL, '1945-01-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1150554232', '1966-09-15', 1, NULL, NULL),
(16932, 2, 1, '13371989', 'ALCIDES  VILLALBA LOPEZ', NULL, NULL, '1957-08-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1081231914', '1977-05-13', 1, NULL, NULL),
(16933, 2, 1, '26780583', 'ALCIRA  CASTRO DUARTE', NULL, NULL, '1953-11-30', '0', 'sincorreo@sincorreo.com', NULL, '-1090852782', '1975-02-19', 1, NULL, NULL),
(16934, 2, 1, '26777149', 'ALCIRA ELENA MENDOZA DE QUINTERO', NULL, NULL, '1952-06-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1108735455', '1974-01-17', 1, NULL, NULL),
(16935, 2, 1, '49737491', 'ALCIRA ISABEL SAUMETH MAESTRE', NULL, NULL, '1959-09-22', '5836096', 'sincorreo@sincorreo.com', NULL, '-1110226267', '1984-10-24', 1, NULL, NULL),
(16936, 2, 1, '1064840892', 'ALDER  MEJIA SANCHEZ', NULL, NULL, '1995-02-04', '0', 'alme0725@gmail.com', NULL, '-1130983227', '2013-04-15', 1, NULL, NULL),
(16937, 2, 1, '37332638', 'ALEIDA  BAYONA AMAYA', NULL, NULL, '1978-05-29', '0', 'aleidabayonamaya@hotmail.com', NULL, '-1121509978', '1997-02-13', 1, NULL, NULL),
(16938, 2, 1, '1090985417', 'ALEIDA  SOLANO SUAREZ', NULL, NULL, '1985-04-05', '0', 'ksolano379@gmail.com', NULL, '-1066708347', '2008-02-11', 1, NULL, NULL),
(16939, 2, 1, '1066062219', 'ALEJANDRA  MOLINA QUINTERO', NULL, NULL, '1988-01-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1075202268', '2006-03-22', 1, NULL, NULL),
(16940, 2, 1, '88276731', 'ALEJANDRINO  DUARTE GALVIZ', NULL, NULL, '1969-10-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1159836501', '1989-12-11', 1, NULL, NULL),
(16941, 2, 1, '88136259', 'ALEJANDRINO  GALVAN ROBLES', NULL, NULL, '1963-05-23', '0', 'sincorreo@sincorreo.com', NULL, '-1151427702', '1981-07-13', 1, NULL, NULL),
(16942, 2, 1, '12435754', 'ALEJANDRO  CARRASCAL GARCIA', NULL, NULL, '1982-06-19', '0', 'alejocarrascal@gmail.com', NULL, '-1119057166', '2000-06-27', 1, NULL, NULL),
(16943, 1, 1, '1003257593', 'ALEJANDRO  MONCADA VACA', NULL, NULL, '2002-05-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1080717295', '2012-08-15', 1, NULL, NULL),
(16944, 2, 1, '1004981401', 'ALEJANDRO  PEREZ TORRADO', NULL, NULL, '1996-05-13', '-1085093536', 'sincorreo@sincorreo.com', NULL, NULL, '2015-01-27', 1, NULL, NULL),
(16945, 2, 1, '5465122', 'ALEJANDRO  SALAZAR CONTRERAS', NULL, NULL, '1940-04-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1112839196', '1962-09-06', 1, NULL, NULL),
(16946, 2, 1, '1066062166', 'ALEJO ANTONIO SANTIAGO BOHORQUEZ', NULL, NULL, '1986-10-19', '0', 'sincorreo@sincorreo.com', NULL, '-1109812630', '2005-11-10', 1, NULL, NULL),
(16947, 2, 1, '26777340', 'ALETH PATRICIA ORTIZ ANGARITA', NULL, NULL, '1981-12-09', NULL, 'arlecilla81@hotmail.com', NULL, '-1151679494', '2000-05-05', 1, NULL, NULL),
(16948, 1, 1, '1092174925', 'ALEX DAVID GAONA QUINTERO', NULL, NULL, '2004-07-09', '0', 'alexgaona099@gmail.com', NULL, '-1067275733', '2018-08-02', 1, NULL, NULL),
(16949, 1, 1, '1066062147', 'ALEX MIGUEL GARCIA DUARTE', NULL, NULL, '2005-08-24', '0', 'alexgarciaduarte7@gmail.com', NULL, '-1091871871', '2019-08-29', 1, NULL, NULL),
(16950, 2, 1, '1977837', 'ALEXANDER  BAYONA AMAYA', NULL, NULL, '1976-02-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1179482338', '1997-11-13', 1, NULL, NULL),
(16951, 2, 1, '1090987679', 'ALEXANDER  DURAN ANGARITA', NULL, NULL, '1992-07-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1151728540', '2011-04-28', 1, NULL, NULL),
(16952, 2, 1, '5036256', 'ALEXANDER  LOBO QUINTERO', NULL, NULL, '1981-09-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1192792161', '2000-03-15', 1, NULL, NULL),
(16953, 2, 1, '5036367', 'ALEXANDER  LOZANO MENESES', NULL, NULL, '1985-04-30', '0', 'sincorreo@sincorreo.com', NULL, '-1116066139', '2003-10-14', 1, NULL, NULL),
(16954, 2, 1, '5472083', 'ALEXANDER  MANOSALVA MORA', NULL, NULL, '1982-11-20', '0', 'alexmanosalva9@gmail.com', NULL, '-1156657397', '2001-02-05', 1, NULL, NULL),
(16955, 2, 1, '11220092', 'ALEXANDER  NARANJO DIAZ', NULL, NULL, '1976-10-11', NULL, 'alexandernar1976@gmail.com', NULL, '-1127730539', '1994-10-31', 1, NULL, NULL),
(16956, 2, 1, '88142752', 'ALEXANDER  REYES MENDOZA', NULL, NULL, '1969-04-15', NULL, 'alereme@gmail.com', NULL, '-1111068941', '1987-08-06', 1, NULL, NULL),
(16957, 2, 1, '88280688', 'ALEXANDER  RUEDAS ACOSTA', NULL, NULL, '1975-05-30', '0', 'sincorreo@sincorreo.com', NULL, '-1187588485', '1993-07-28', 1, NULL, NULL),
(16958, 2, 1, '1124009874', 'ALEXANDER  SOLANO RODRIGUEZ', NULL, NULL, '1983-04-02', '0', 'sincorreo@sincorreo.com', NULL, '-1067208443', '2006-08-25', 1, NULL, NULL),
(16959, 2, 1, '1090986406', 'ALEXY  GALVAN AREVALO', NULL, NULL, '1991-05-10', NULL, 'alexy2020galvan@gmail.com', NULL, '-1085991022', '2009-05-26', 1, NULL, NULL),
(16960, 2, 1, '13178319', 'ALEYSY  BARBOSA NORIEGA', NULL, NULL, '1985-02-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1160315018', '2003-08-14', 1, NULL, NULL),
(16961, 2, 1, '5035437', 'ALFREDO  ARCINIEGAS SANTIAGO', NULL, NULL, '1970-08-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1150586739', '1988-11-16', 1, NULL, NULL),
(16962, 2, 1, '1733944', 'ALFREDO  ARIAS DUARTE', NULL, NULL, '1949-05-24', '0', 'sincorreo@sincorreo.com', NULL, '-1151998479', '1971-01-25', 1, NULL, NULL),
(16963, 2, 1, '5035004', 'ALFREDO  GALVIS PACHECO', NULL, NULL, '1957-03-05', '0', 'sincorreo@sincorreo.com', NULL, '-1086643164', '1976-01-17', 1, NULL, NULL),
(16964, 2, 1, '1733983', 'ALFREDO  QUINTERO RINCON', NULL, NULL, '1951-10-02', '0', 'sincorreo@sincorreo.com', NULL, '-1189466014', '1973-11-23', 1, NULL, NULL),
(16965, 2, 1, '1066062535', 'ALFREDO  RUEDAS IBARRA', NULL, NULL, '1989-02-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1088150846', '2008-10-06', 1, NULL, NULL),
(16966, 2, 1, '1066062343', 'ALFREDO ANTONIO DUARTE GALVIZ', NULL, NULL, '1988-07-13', NULL, 'alexalduga@hotmail.com', NULL, '-1186133113', '2007-02-06', 1, NULL, NULL),
(16967, 2, 1, '5035059', 'ALFREDO ANTONIO MENDOZA SANTIAGO', NULL, NULL, '1958-06-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1137051327', '1977-07-11', 1, NULL, NULL),
(16968, 2, 1, '37370940', 'ALICIA  PALACIO ANGARITA', NULL, NULL, '1979-05-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1152676652', '1998-06-12', 1, NULL, NULL),
(16969, 2, 1, '27658976', 'ALICIA  QUINTERO DE CARRASCAL', NULL, NULL, '1947-04-20', '0', 'sincorreo@sincorreo.com', NULL, '-1167815431', '1970-10-15', 1, NULL, NULL),
(16970, 2, 1, '88139160', 'ALIRIO  CHAVEZ LOPEZ', NULL, NULL, '1965-05-17', '0', 'sincorreo@gmail.com', NULL, '-1062740086', '1983-12-12', 1, NULL, NULL),
(16971, 2, 1, '5468119', 'ALIRIO  PAREDES GAMBOA', NULL, NULL, '1954-10-05', '0', 'sincorreo@sincorreo.com', NULL, '-1192679680', '1968-11-19', 1, NULL, NULL),
(16972, 2, 1, '18914145', 'ALIRIO ANTONIO BALLESTEROS SANTIAGO', NULL, NULL, '1958-09-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1162499614', '1977-03-07', 1, NULL, NULL),
(16973, 2, 1, '13358867', 'ALIRIO ANTONIO GAONA MANZANO', NULL, NULL, '1953-05-27', '0', 'sincorreo@sincorreo.com', NULL, '-1182947161', '1974-10-08', 1, NULL, NULL),
(16974, 2, 1, '5038020', 'ALIRIO ANTONIO JACOME MORA', NULL, NULL, '1964-04-29', '0', 'sincorreo@sincorreo.com', NULL, '-1171102003', '1982-11-08', 1, NULL, NULL),
(16975, 2, 1, '1733910', 'ALIRIO ANTONIO LOZANO MENDOZA', NULL, NULL, '1947-03-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1127610770', '1968-11-08', 1, NULL, NULL),
(16976, 2, 1, '5035603', 'ALIRIO ANTONIO NORIEGA MANZANO', NULL, NULL, '1974-04-11', '0', 'sincorreo@gmail.com', NULL, '-1062009818', '1992-05-27', 1, NULL, NULL),
(16977, 2, 1, '5459431', 'ALIRIO ANTONIO ORTIZ TARAZONA', NULL, NULL, '1969-08-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1179259726', '1987-09-25', 1, NULL, NULL),
(16978, 2, 1, '1066062728', 'ALIRIO ANTONIO VILLEGAS CERVANTES', NULL, NULL, '1991-05-09', '0', 'sincorreo@sincorreo.com', NULL, '-1087577934', '2010-02-03', 1, NULL, NULL),
(16979, 2, 1, '13175377', 'ALIRO  BOHORQUEZ VEGA', NULL, NULL, '1983-07-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1090529460', '2001-08-03', 1, NULL, NULL),
(16980, 2, 1, '88277419', 'ALIRO  RUEDAS BAYONA', NULL, NULL, '1971-02-16', '0', 'sincorreo@sincorreo.com', NULL, '-1170658233', '1990-09-13', 1, NULL, NULL),
(16981, 2, 1, '27770648', 'ALIX  SERRANO DE BOHORQUEZ', NULL, NULL, '1952-09-07', '0', 'sincorreo@sincorreo.com', NULL, '-1187999095', '1976-12-06', 1, NULL, NULL),
(16982, 2, 1, '26780598', 'ALIX MARIA AMAYA DE BAYONA', NULL, NULL, '1957-03-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1127058770', '1981-11-25', 1, NULL, NULL),
(16983, 2, 1, '26774584', 'ALIX MARIA BOHORQUEZ', NULL, NULL, '1955-08-06', '0', 'sincorreo@sincorreo.com', NULL, '-1151048677', '1977-07-12', 1, NULL, NULL),
(16984, 2, 1, '27774182', 'ALIX MARIA DURAN DE QUINTANA', NULL, NULL, '1957-03-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1188565707', '1977-08-11', 1, NULL, NULL),
(16985, 2, 1, '26861016', 'ALIX MARIA QUINTERO JACOME', NULL, NULL, '1951-12-15', '0', 'sincorreo@sincorreo.com', NULL, '-1099882636', '1973-07-19', 1, NULL, NULL),
(16986, 2, 1, '27665175', 'ALIX MARIA QUINTERO SUAREZ', NULL, NULL, '1947-09-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1152294352', '1973-08-30', 1, NULL, NULL),
(16987, 2, 1, '37372681', 'ALIX MARIA TORRES MANZANO', NULL, NULL, '1984-02-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1167331864', '2002-12-13', 1, NULL, NULL),
(16988, 2, 1, '26775016', 'ALMEIDA  BARROSO RAMIREZ', NULL, NULL, '1971-06-15', NULL, 'almeidapatricia@gmail.com', NULL, '-1090833079', '1993-05-06', 1, NULL, NULL),
(16989, 2, 1, '5035380', 'ALONSO  DURAN PORTILLO', NULL, NULL, '1968-03-26', '0', 'sincorreo@sincorreo.com', NULL, '-1091957247', '1987-09-02', 1, NULL, NULL),
(16990, 2, 2, '1091182698', 'ALONSO  NUÃ±EZ MORA', NULL, NULL, '1992-11-06', '0', 'diomaralonsonunezmora@gmail.com', NULL, '-1071846145', '2010-11-10', 1, NULL, NULL),
(16991, 2, 1, '77130869', 'ALONSO  PRADO GOMEZ', NULL, NULL, '1968-05-21', '0', 'sincorreo@sincorreo.com', NULL, '-1070564762', '1988-11-03', 1, NULL, NULL),
(16992, 2, 1, '88276309', 'ALONSO ANTONIO GAONA MANZANO', NULL, NULL, '1970-03-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1192612370', '1989-08-09', 1, NULL, NULL),
(16993, 2, 1, '5425966', 'ALPIDIO  TORO CARVAJALINO', NULL, NULL, '1944-06-20', '0', 'sincorreo@sincorreo.com', NULL, '-1117409387', '1971-03-12', 1, NULL, NULL),
(16994, 2, 1, '5035377', 'ALVARO  ARIAS MADARIAGA', NULL, NULL, '1969-05-19', '0', 'sincorreo@sincorreo.com', NULL, '-1159486366', '1987-08-12', 1, NULL, NULL),
(16995, 2, 1, '13374975', 'ALVARO  CHINCHILLA CHINCHILLA', NULL, NULL, '1965-05-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1159532579', '1985-07-19', 1, NULL, NULL),
(16996, 2, 1, '13378109', 'ALVARO  DURAN SANJUAN', NULL, NULL, '1974-11-16', '0', 'sincorreo@sincorreo.com', NULL, '-1152020883', '1993-04-14', 1, NULL, NULL),
(16997, 2, 1, '88224558', 'ALVARO  GUTIERREZ CASTRO', NULL, NULL, '1976-10-24', '0', 'ag584934@gmail.com', NULL, '-1066012801', '1995-05-05', 1, NULL, NULL),
(16998, 2, 1, '12566690', 'ALVARO  MARTINEZ GUARGUATI', NULL, NULL, '1970-08-20', '0', 'sincorreo@sincorreo.com', NULL, '-1080465672', '1989-12-11', 1, NULL, NULL),
(16999, 2, 1, '5035615', 'ALVARO  MOLINA BALLESTEROS', NULL, NULL, '1973-06-18', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1992-09-30', 1, NULL, NULL),
(17000, 2, 2, '5528994', 'ALVARO  ORTIZ ORTIZ', NULL, NULL, '1965-10-19', '0', '', NULL, '-1079036665', '1984-05-30', 1, NULL, NULL),
(17001, 2, 1, '5036159', 'ALVARO  RIVERA NAVARRO', NULL, NULL, '1979-06-05', '0', 'sincorreo@sincorreo.com', NULL, '-1076267835', '1997-06-05', 1, NULL, NULL),
(17002, 2, 1, '5035605', 'ALVARO  RODRIGUEZ TORRES', NULL, NULL, '1974-04-18', '0', 'sincorreo@sincorreo.com', NULL, '-1162788861', '1992-06-25', 1, NULL, NULL),
(17003, 2, 1, '1733976', 'ALVARO  RUEDAS ANGARITA', NULL, NULL, '1948-07-15', '0', 'sincorreo@sincorreo.com', NULL, '-1081274797', '1973-02-27', 1, NULL, NULL),
(17004, 2, 1, '5035136', 'ALVARO ANTONIO NAVARRO MENDOZA', NULL, NULL, '1958-12-03', '0', 'sincorreo@sincorreo.com', NULL, '-1078183022', '1979-12-09', 1, NULL, NULL),
(17005, 2, 1, '5488035', 'ALVARO DE JESUS GONZALEZ GONZALEZ', NULL, NULL, '1955-05-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1149764292', '1979-12-09', 1, NULL, NULL),
(17006, 2, 1, '1065866098', 'ALVEIRO  GUTIERREZ FUENTES', NULL, NULL, '1986-06-04', '0', 'alveirogutierrez0486@gmail.com', NULL, '-1132733507', '2004-11-08', 1, NULL, NULL),
(17007, 2, 1, '1090417080', 'ALVEIRO  LOPEZ PEREZ', NULL, NULL, '1990-04-16', '0', 'alveirolopezperez16@gmail.com', NULL, '-1092339092', '2008-04-22', 1, NULL, NULL),
(17008, 2, 1, '1091662296', 'ALVEIRO  PRADO CARRASCAL', NULL, NULL, '1989-07-09', '0', 'sincorreo@sincorreo.com', NULL, '-1188791451', '2007-11-09', 1, NULL, NULL),
(17009, 2, 1, '5036349', 'ALVEIRO ANTONIO ARIAS DUARTE', NULL, NULL, '1984-06-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1179976746', '2003-02-20', 1, NULL, NULL),
(17010, 2, 1, '5036320', 'ALVEIRO ANTONIO NAVARRO MANOSALVA', NULL, NULL, '1984-05-08', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2002-05-14', 1, NULL, NULL),
(17011, 2, 1, '88276332', 'AMADO  CARRASCAL LEON', NULL, NULL, '1971-06-16', '-1082711565', 'sincorreo@sincorreo.com', NULL, NULL, '1989-09-01', 1, NULL, NULL),
(17012, 2, 1, '88139114', 'AMADO  QUINTERO ECHAVEZ', NULL, NULL, '1965-08-13', '0', 'sincorreo@sincorreo.com', NULL, '-1192660220', '1983-12-12', 1, NULL, NULL),
(17013, 2, 1, '1066062763', 'AMADO  RUEDAS PEREA', NULL, NULL, '1991-09-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1075481269', '2010-11-05', 1, NULL, NULL),
(17014, 2, 1, '5468709', 'AMADO JULIO TORO QUINTERO', NULL, NULL, '1980-08-22', NULL, 'amajutoqui@hotmail.com', NULL, '-1072779795', '1998-12-01', 1, NULL, NULL),
(17015, 2, 1, '26774271', 'AMALIA  DUARTE SOLANO', NULL, NULL, '1940-07-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1089256645', '1961-12-18', 1, NULL, NULL),
(17016, 2, 1, '26778137', 'AMALIA  MANDON DE HERNANDEZ', NULL, NULL, '1940-05-26', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1973-01-15', 1, NULL, NULL),
(17017, 2, 1, '37332526', 'AMANDA  VEGA SANJUAN', NULL, NULL, '1978-06-26', '0', 'vegaamanda236@gmail.com', NULL, '-1152457694', '1997-01-23', 1, NULL, NULL),
(17018, 2, 1, '37310805', 'AMANDA MARIA MALDONADO CORONEL', NULL, NULL, '1958-09-30', '5623202', 'amandaritmica@hotmail.es', NULL, '-1161273771', '1977-05-16', 1, NULL, NULL),
(17019, 2, 1, '27661075', 'AMELIA ROSA QUINTERO DE DUARTE', NULL, NULL, '1944-01-04', '0', 'sincorreo@sincorreo.com', NULL, '-1156206473', '1967-10-13', 1, NULL, NULL),
(17020, 2, 1, '26861225', 'AMPARO  RAMOS DE SANCHEZ', NULL, NULL, '1954-04-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1189202357', '1976-01-17', 1, NULL, NULL),
(17021, 2, 1, '26774393', 'ANA AMINTA BARBOSA DE QUINTERO', NULL, NULL, '1946-08-18', NULL, 'mintabarbosa670@gmail.com', NULL, '-1128772045', '1969-10-23', 1, NULL, NULL),
(17022, 2, 1, '26774241', 'ANA AMINTA OSORIO DE OSORIO', NULL, NULL, '1939-11-03', '0', 'sincorreo@sincorreo.com', NULL, '-1122796182', '1961-12-18', 1, NULL, NULL),
(17023, 2, 1, '37328430', 'ANA BELSY LOBO CARRASCAL', NULL, NULL, '1973-12-09', '0', 'sincorreo@sincorreo.com', NULL, '-1162126018', '1993-09-29', 1, NULL, NULL),
(17024, 2, 1, '1066063587', 'ANA CAMILA VERA LEBOLO', NULL, NULL, '1998-10-08', '0', 'anacamilaveralebolo@gmail.com', NULL, '-1122727723', '2016-10-28', 1, NULL, NULL),
(17025, 2, 1, '1102833196', 'ANA CANDELARIA CUELLO MEJIA', NULL, NULL, '1990-05-22', '0', 'anacuellom@hotmail.com', NULL, '-1129977770', '2008-07-17', 1, NULL, NULL),
(17026, 2, 1, '1134849113', 'ANA CECILIA ANDRADE CHONA', NULL, NULL, '1975-11-26', '0', 'sincorreo@sincorreo.com', NULL, '-1132211500', '2005-08-18', 1, NULL, NULL),
(17027, 2, 1, '26774737', 'ANA CECILIA GAONA PEÃ‘ARANDA', NULL, NULL, '1964-03-06', '0', 'sincorreo@sincorreo.com', NULL, '-1131930862', '1983-08-23', 1, NULL, NULL),
(17028, 2, 1, '26774837', 'ANA CECILIA LOBO ARCINIEGAS', NULL, NULL, '1969-02-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1092365004', '1987-09-02', 1, NULL, NULL),
(17029, 2, 1, '26774805', 'ANA CECILIA MENDOZA SANTIAGO', NULL, NULL, '1965-08-09', NULL, 'ancemesa@hotmail.com', NULL, '-1111006286', '1985-02-09', 1, NULL, NULL),
(17030, 2, 1, '60291370', 'ANA CECILIA SANTIAGO MOLINA', NULL, NULL, '1961-08-09', '0', 'sincorreo@sincorreo.com', NULL, '-1117320116', '1980-11-19', 1, NULL, NULL),
(17031, 2, 1, '27741299', 'ANA CECILIA VACA VEGA', NULL, NULL, '1967-05-04', '0', 'sincorreo@sincorreo.com', NULL, '-1091405552', '1987-12-14', 1, NULL, NULL),
(17032, 1, 1, '1003257428', 'ANA CRISTINA VEGA PRADO', NULL, NULL, '2002-07-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1072710511', '2017-06-14', 1, NULL, NULL),
(17033, 2, 1, '37319226', 'ANA DEL CARMEN CARRASCAL AMAYA', NULL, NULL, '1956-04-12', '0', 'sincorreo@sincorreo.com', NULL, '-1126089787', '1985-05-06', 1, NULL, NULL),
(17034, 2, 1, '37325244', 'ANA DEL CARMEN GARCIA TORRES', NULL, NULL, '1972-07-31', '0', 'car_enzagarcia@hotmail.com', NULL, '-1108925834', '1991-01-16', 1, NULL, NULL),
(17035, 2, 1, '37367781', 'ANA DEL CARMEN JACOME JACOME', NULL, NULL, '1963-10-15', '0', 'sincorreo@sincorreo.com', NULL, '-1161208486', '1987-12-14', 1, NULL, NULL),
(17036, 2, 1, '37369961', 'ANA DEL CARMEN LOBO PEREZ', NULL, NULL, '1962-09-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1176934999', '1995-05-05', 1, NULL, NULL),
(17037, 2, 1, '1066062554', 'ANA DEL CARMEN RODRIGUEZ QUINTANA', NULL, NULL, '1990-07-26', '0', 'sincorreo@sincorreo.com', NULL, '-1162604455', '2008-11-25', 1, NULL, NULL),
(17038, 2, 1, '27659957', 'ANA DEL CARMEN VEGA DE VACA', NULL, NULL, '1950-01-15', '0', 'sincorreo@sincorreo.com', NULL, '-1110636400', '1976-01-16', 1, NULL, NULL),
(17039, 2, 1, '26774777', 'ANA DIVA RUEDA IBARRA', NULL, NULL, '1966-06-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1168739987', '1985-01-11', 1, NULL, NULL),
(17040, 2, 1, '26774937', 'ANA DOLORES BOHORQUEZ GALLARDO', NULL, NULL, '1972-03-17', '0', 'sincorreo@sincorreo.com', NULL, '-1137166047', '1991-02-13', 1, NULL, NULL),
(17041, 2, 1, '26774267', 'ANA DOLORES CHINCHILLA DE LOZANO', NULL, NULL, '1939-04-08', '0', 'sincorreo@sincorreo.com', NULL, '-1187162924', '1961-12-18', 1, NULL, NULL),
(17042, 2, 1, '49738461', 'ANA DOLORES OSORIO LOZANO', NULL, NULL, '1965-10-27', '5880084', 'loly.osorio@hotmail.com', NULL, '-1187579417', '2004-01-14', 1, NULL, NULL),
(17043, 2, 1, '26775058', 'ANA DORIS PORTILLO MOLINA', NULL, NULL, '1976-02-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1192579598', '1994-06-20', 1, NULL, NULL),
(17044, 2, 1, '26774970', 'ANA EDILIA GRANADOS GARCIA', NULL, NULL, '1965-10-01', '0', 'sincorreo@sincorreo.com', NULL, '-1079142432', '1991-11-08', 1, NULL, NULL),
(17045, 2, 1, '37330588', 'ANA EDILSA ANGARITA SALAZAR', NULL, NULL, '1971-12-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1079387615', '1995-06-13', 1, NULL, NULL),
(17046, 2, 1, '26774482', 'ANA ELCIDA BOHORQUEZ DE PORTILLO', NULL, NULL, '1952-02-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1075122264', '1974-01-21', 1, NULL, NULL),
(17047, 2, 1, '37312475', 'ANA ELVIRA CASTRILLON VEGA', NULL, NULL, '1947-02-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1092155686', '1979-01-09', 1, NULL, NULL),
(17048, 2, 1, '1066063649', 'ANA ELVIRA CLARO ANGARITA', NULL, NULL, '1999-06-23', NULL, 'aeclaroa@ufpso.edu.co', NULL, '-1116467363', '2017-07-05', 1, NULL, NULL),
(17049, 2, 1, '26774459', 'ANA ELVIRA RINCON DE MOLINA', NULL, NULL, '1949-10-29', '0', 'sincorreo@sincorreo.com', NULL, '-1138618984', '1974-01-21', 1, NULL, NULL),
(17050, 2, 1, '1193087683', 'ANA GABRIELA OSPINO SANTIAGO', NULL, NULL, '2003-05-14', '0', 'anagabrielaos14@gmail.com', NULL, '-1141039662', '2021-08-25', 1, NULL, NULL),
(17051, 2, 1, '26774995', 'ANA GRACIELA ARCINIEGAS SUAREZ', NULL, NULL, '1945-10-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1170485669', '1992-08-20', 1, NULL, NULL),
(17052, 2, 1, '26774499', 'ANA GRACIELA DUARTE SANTIAGO', NULL, NULL, '1952-08-10', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1974-12-11', 1, NULL, NULL),
(17053, 2, 1, '26777123', 'ANA GRACIELA MANTILLA DE PICON', NULL, NULL, '1942-05-01', '0', 'sincorreo@sincorreo.com', NULL, '-1168005551', '1966-10-21', 1, NULL, NULL),
(17054, 2, 1, '26777254', 'ANA GRACIELA NAVARRO SANTIAGO', NULL, NULL, '1966-05-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1170658598', '1997-05-30', 1, NULL, NULL),
(17055, 2, 1, '26777194', 'ANA GRACIELA PAREDES TRUJILLO', NULL, NULL, '1937-09-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1158421406', '1996-07-05', 1, NULL, NULL),
(17056, 2, 1, '26775074', 'ANA ILSE ANGARITA ANGARITA', NULL, NULL, '1973-02-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1085989980', '1994-10-31', 1, NULL, NULL),
(17057, 2, 1, '37368317', 'ANA ILSE MADARIAGA PORTILLO', NULL, NULL, '1968-06-29', '0', 'sincorreo@sincorreo.com', NULL, '-1169142339', '1989-09-20', 1, NULL, NULL),
(17058, 2, 1, '27727641', 'ANA ISABEL ACOSTA MELO', NULL, NULL, '1962-10-04', '0', 'sincorreo@sincorreo.com', NULL, '-1187829251', '1984-11-27', 1, NULL, NULL),
(17059, 2, 1, '26774779', 'ANA ISABEL VACCA SANCHEZ', NULL, NULL, '1961-03-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1078443905', '1985-01-21', 1, NULL, NULL),
(17060, 2, 1, '26774461', 'ANA JULIA GUTIERREZ DE DUARTE', NULL, NULL, '1943-04-27', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1974-01-21', 1, NULL, NULL),
(17061, 2, 1, '1003121965', 'ANA KARINA CAÃ±IZAREZ ORTIZ', NULL, NULL, '2003-02-14', '0', 'anakarinacaortiz14@gmail.com', NULL, '-1167368450', '2021-02-16', 1, NULL, NULL),
(17062, 2, 1, '1066063476', 'ANA MARIA CORTES OSORIO', NULL, NULL, '1998-01-02', NULL, 'ana.maria029815@gmail.com', NULL, '-1141105167', '2016-01-15', 1, NULL, NULL),
(17063, 2, 1, '1094265045', 'ANA MARIA PE?ARANDA TORRADO', NULL, NULL, '1990-07-29', '0', 'peÃ±arandatorradoanamaria@gmail.com', NULL, '-1138989117', '2008-09-04', 1, NULL, NULL),
(17064, 2, 1, '26774698', 'ANA MARIA PORTILLO DE DURAN', NULL, NULL, '1944-10-22', '0', 'sincorreo@sincorreo.com', NULL, '-1066773020', '1981-12-14', 1, NULL, NULL),
(17065, 2, 1, '37369729', 'ANA MATILDE ESPINEL TRUJILLO', NULL, NULL, '1974-08-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1182398403', '1994-10-31', 1, NULL, NULL),
(17066, 2, 1, '27704458', 'ANA MERCEDES DURAN DE ARENAS', NULL, NULL, '1958-12-24', NULL, 'anaduran2018m@gmail.com', NULL, '-1067626275', '1977-08-03', 1, NULL, NULL),
(17067, 2, 1, '27659563', 'ANA MERCEDES GARCIA BONETT', NULL, NULL, '1952-08-10', '0', 'sincorreo@sincorreo.com', NULL, '-1126969161', '1973-11-18', 1, NULL, NULL),
(17068, 2, 1, '26774479', 'ANA MERCEDES MANZANO DE MADARIAGA', NULL, NULL, '1951-09-24', '0', 'sincorreo@sincorreo.com', NULL, '-1116946387', '1974-01-21', 1, NULL, NULL),
(17069, 2, 1, '37332360', 'ANA MILENA LEBOLO LOZANO', NULL, NULL, '1978-09-22', '0', 'anamilenalebolo@hotmail.com', NULL, '-1128236930', '1996-10-30', 1, NULL, NULL),
(17070, 2, 1, '1091653890', 'ANA MILENA NEIRA CASTRILLON', NULL, NULL, '1985-12-02', '0', 'sincorreo@sincorreo.com', NULL, '-1187759162', '2004-08-18', 1, NULL, NULL),
(17071, 1, 1, '1092731503', 'ANA MILENA PINEDA TORREZ', NULL, NULL, '2005-11-25', '0', 'sincorreo@sincorreo.com', NULL, '-1140144823', '2013-02-01', 1, NULL, NULL),
(17072, 2, 1, '37330766', 'ANA MYRIAM SALAZAR ARGOTA', NULL, NULL, '1970-11-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1079719506', '1995-08-20', 1, NULL, NULL),
(17073, 2, 1, '26774876', 'ANA ROSA MANDON QUINTERO', NULL, NULL, '1957-03-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1158690255', '1989-08-25', 1, NULL, NULL),
(17074, 2, 1, '60414246', 'ANA ROSA PEREZ PEREZ', NULL, NULL, '1970-01-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1075110278', '1989-06-07', 1, NULL, NULL),
(17075, 2, 1, '37345438', 'ANA SULAY RINCON SALCEDO', NULL, NULL, '1979-12-13', NULL, 'sulayrincon13@gmail.com', NULL, '-1170115539', '1998-09-04', 1, NULL, NULL),
(17076, 2, 1, '37125455', 'ANA YIVE BACCA QUINTERO', NULL, NULL, '1952-06-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1182735609', '1987-09-28', 1, NULL, NULL),
(17077, 2, 1, '26777327', 'ANA YIVE GAONA MANOSALVA', NULL, NULL, '1981-02-26', '0', 'anbjh@gmail.com', NULL, '-1188317378', '2000-01-11', 1, NULL, NULL),
(17078, 2, 1, '26774955', 'ANACELLY  PEREIRA RUEDAS', NULL, NULL, '1971-02-23', '0', 'sincorreo@sincorreo.com', NULL, '-1076375478', '1991-07-03', 1, NULL, NULL),
(17079, 2, 1, '26774899', 'ANADIVA  GALVIZ QUINTERO', NULL, NULL, '1969-10-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1152498180', '1989-05-12', 1, NULL, NULL),
(17080, 2, 1, '37290406', 'ANAIDES  GUERRERO SANCHEZ', NULL, NULL, '1981-04-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1152962556', '2001-07-23', 1, NULL, NULL),
(17081, 2, 1, '26861301', 'ANAIS  QUINTERO HERNANDEZ', NULL, NULL, '1954-09-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1977-03-09', 1, NULL, NULL),
(17082, 2, 1, '13377472', 'ANANIAS  CONTRERAS SANCHEZ', NULL, NULL, '1971-11-17', '0', 'sincorreo@sincorreo.com', NULL, '-1149304178', '1991-05-27', 1, NULL, NULL),
(17083, 2, 1, '37327095', 'ANASEBIGNE  TORO QUINTERO', NULL, NULL, '1973-09-14', NULL, 'anatoqui@hotmail.es', NULL, '-1086438138', '1992-10-06', 1, NULL, NULL),
(17084, 2, 1, '26774810', 'ANAYIBE  DURAN JACOME', NULL, NULL, '1965-05-09', '0', 'sincorreo@sincorreo.com', NULL, '-1086657023', '1985-12-09', 1, NULL, NULL),
(17085, 2, 1, '26775029', 'ANAYIBE  PORTILLO SANTIAGO', NULL, NULL, '1970-01-27', '0', 'sincorreo@sincorreo.com', NULL, '-1069137488', '1993-08-19', 1, NULL, NULL),
(17086, 2, 2, '27886754', 'ANAYIBE  REMOLINA ORTIZ', NULL, NULL, '1957-09-01', '0', 'sincorreo@sincorreo.com', NULL, '-1091600057', '1976-12-15', 1, NULL, NULL),
(17087, 2, 1, '37331693', 'ANAYIVE  GUERRERO SANCHEZ', NULL, NULL, '1976-08-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1191831771', '1996-05-13', 1, NULL, NULL),
(17088, 2, 2, '5529486', 'ANDELFO  JIMENEZ SANCHEZ', NULL, NULL, '1972-10-05', '0', 'sincorreo@sincorreo.com', NULL, '-1179287919', '1992-03-19', 1, NULL, NULL),
(17089, 2, 1, '1065576534', 'ANDREA  CARREÃ‘O BASSA', NULL, NULL, '1985-11-26', '0', 'andreabassa_26@hotmail.com', NULL, '-1147767698', '2004-11-17', 1, NULL, NULL),
(17090, 2, 1, '1066063345', 'ANDREA  GONZALES GUTIERREZ', NULL, NULL, '1997-01-15', '0', 'gonzalesgutierreza@gmail.com', NULL, '-1071344397', '2015-01-26', 1, NULL, NULL),
(17091, 2, 1, '1003257688', 'ANDREA CAROLINA ASCANIO NAVARRO', NULL, NULL, '2000-10-02', '0', 'carolinaascanio72@gmail.com', NULL, '-1070697790', '2018-10-08', 1, NULL, NULL),
(17092, 2, 1, '1095955451', 'ANDREA DEL PILAR VARGAS RODRIGUEZ', NULL, NULL, '1999-03-15', '0', 'andreadelpilarvargasrodriguez@gmail.com', NULL, '-1141141329', '2017-04-10', 1, NULL, NULL),
(17093, 2, 1, '1066062338', 'ANDREA JHOANA BAYONA RUEDAS', NULL, NULL, '1988-09-18', '0', 'andreajohana18@hotmail.com', NULL, '-1117513829', '2007-01-24', 1, NULL, NULL),
(17094, 2, 1, '1066063651', 'ANDREA JOHANA VANEGAS QUINTERO', NULL, NULL, '1999-07-02', '0', 'andreajohana.ajv@gmail.com', NULL, '-1082635286', '2017-07-24', 1, NULL, NULL),
(17095, 2, 1, '1004862478', 'ANDREA KARINA ARENAS SALAZAR', NULL, NULL, '1998-05-19', '0', 'karinaarenas9287@gmail.com.com', NULL, '-1112208009', '2016-08-30', 1, NULL, NULL),
(17096, 2, 1, '1066063218', 'ANDREA LUCIA BAYONA RINCON', NULL, NULL, '1995-12-12', '0', 'andreabayona1295@gmail.com', NULL, '-1122240243', '2013-12-16', 1, NULL, NULL),
(17097, 2, 1, '1066062270', 'ANDREA PAHOLA RUEDAS SUAREZ', NULL, NULL, '1987-12-18', '0', 'pahola0410@hotmail.com', NULL, '-1121971935', '2006-07-14', 1, NULL, NULL),
(17098, 2, 1, '26777319', 'ANDREA TORCOROMA BARBOSA RIOS', NULL, NULL, '1981-03-24', '0', 'barbosaandrea337@gmail.com', NULL, '-1048236005', '1999-08-26', 1, NULL, NULL),
(17099, 2, 1, '5428601', 'ANDRES  SANTIAGO BECERRA', NULL, NULL, '1982-12-27', '0', 'sincorreo@sincorreo.com', NULL, '-1130108492', '2003-03-11', 1, NULL, NULL),
(17100, 2, 1, '1066063194', 'ANDRES CAMILO LOZANO SALAZAR', NULL, NULL, '1995-09-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1068831141', '2013-10-15', 1, NULL, NULL),
(17101, 1, 1, '1003257462', 'ANDRES FELIPE ASCANIO NAVARRO', NULL, NULL, '2002-10-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1107891562', '2017-06-22', 1, NULL, NULL),
(17102, 2, 1, '1066062823', 'ANDRES FELIPE OSORIO CONTRERAS', NULL, NULL, '1993-02-01', NULL, 'pipeosorio123@hotmail.com', NULL, '-1111101781', '2011-02-07', 1, NULL, NULL),
(17103, 2, 1, '1066062778', 'ANDRES FELIPE QUINTERO REYES', NULL, NULL, '1992-08-31', NULL, 'felipequ_23@hotmail.com', NULL, '-1129618909', '2010-09-06', 1, NULL, NULL),
(17104, 1, 1, '1066062504', 'ANDRES JOSE CONTRERAS MENDOZA', NULL, NULL, '2008-07-07', '0', 'sincorreo@gmail.com', NULL, '-1127105827', '2015-09-25', 1, NULL, NULL),
(17105, 2, 1, '1066062175', 'ANDRES MAURICIO TORRES CHINCHILLA', NULL, NULL, '1987-05-31', '0', 'sincorreo@sincorreo.com', NULL, '-1067941079', '2005-11-29', 1, NULL, NULL),
(17106, 2, 1, '1004898221', 'ANDRES OSWALDO PINO GAONA', NULL, NULL, '2003-07-06', '0', 'ap8154011@gmail.com', NULL, '-1191497582', '2021-07-15', 1, NULL, NULL),
(17107, 2, 1, '1091671497', 'ANDREY FERNANDO SANTIAGO MANOSALVA', NULL, NULL, '1993-08-18', NULL, 'santiagoandrey@outlook.es', NULL, '-1126922267', '2012-05-23', 1, NULL, NULL),
(17108, 2, 1, '1064841070', 'ANGEL ALEXANDER MELO SEPULVEDA', NULL, NULL, '1995-06-10', '0', 'canda95@hotmail.com', NULL, '-1176087418', '2013-08-15', 1, NULL, NULL),
(17109, 2, 1, '9715554', 'ANGEL ALIRIO CA?IZARES TRIGOS', NULL, NULL, '1968-03-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1182293669', '1986-08-04', 1, NULL, NULL),
(17110, 2, 1, '5467743', 'ANGEL MARIA BECERRA ARENAS', NULL, NULL, '1946-03-01', '0', 'sincorreo@sincorreo.com', NULL, '-1142585092', '1968-06-24', 1, NULL, NULL),
(17111, 2, 1, '5458765', 'ANGEL MARIA GARCIA GARCIA', NULL, NULL, '1955-03-01', '0', 'sincorreo@sincorreo.com', NULL, '-1141072267', '1978-03-03', 1, NULL, NULL),
(17112, 2, 1, '5035033', 'ANGEL MARIA LOZANO MENDOZA', NULL, NULL, '1955-06-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1138208417', '1976-12-21', 1, NULL, NULL),
(17113, 2, 1, '79374013', 'ANGEL MARIA OSORIO DUARTE', NULL, NULL, '1965-09-04', '0', 'soluequipos8@gmail.com', NULL, '-1137017532', '1984-06-04', 1, NULL, NULL),
(17114, 2, 1, '5408422', 'ANGEL MARIA PE?ARANDA BAYONA', NULL, NULL, '1960-01-27', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1980-07-01', 1, NULL, NULL),
(17115, 2, 1, '5035470', 'ANGEL MARIA RIVERA NAVARRO', NULL, NULL, '1970-10-20', '0', 'sincorreo@sincorreo.com', NULL, '-1080587971', '1989-01-18', 1, NULL, NULL),
(17116, 2, 1, '1066063663', 'ANGEL RICARDO MADARIAGA AMAYA', NULL, NULL, '1999-05-24', NULL, 'rmadariaga36@gmail.com', NULL, '-1160318804', '2017-08-24', 1, NULL, NULL),
(17117, 2, 1, '1978646', 'ANGEL TRINIDAD SALAZAR CONDE', NULL, NULL, '1961-01-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1070275623', '1980-10-02', 1, NULL, NULL),
(17118, 2, 1, '1065820152', 'ANGELA CRISTINA BERMUDEZ ANGARITA', NULL, NULL, '1995-09-15', '0', 'angela.bermudezangarita15@gmail.com', NULL, '-1287836400', '2013-11-20', 1, NULL, NULL),
(17119, 2, 1, '1003257670', 'ANGELA XIOMARA RUEDAS CARRASCAL', NULL, NULL, '2003-07-24', '0', 'rangelcarrascalxiomy24@gmail.com', NULL, '-1072495874', '2021-07-26', 1, NULL, NULL),
(17120, 2, 1, '63527669', 'ANGELICA MARIA LEMUS SOLANO', NULL, NULL, '1982-03-17', NULL, 'angelicalemuss@hotmail.com', NULL, '-1192026157', '2000-05-08', 1, NULL, NULL),
(17121, 2, 1, '1193235595', 'ANGELLO ALFREDO MU?OZ PALLAREZ', NULL, NULL, '1999-02-12', NULL, 'angellopallarez433@gmail.com', NULL, '-1087558687', '2017-02-23', 1, NULL, NULL),
(17122, 2, 1, '49640004', 'ANGELMIRA  DUARTE', NULL, NULL, '1956-05-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1148370252', '1976-01-17', 1, NULL, NULL),
(17123, 2, 1, '1066063132', 'ANGGIE ALEJANDRA MOLINA ARIAS', NULL, NULL, '1995-03-18', '0', 'molinaariasangie@gmail.com', NULL, '-1130583018', '2013-04-29', 1, NULL, NULL),
(17124, 2, 1, '1066062301', 'ANGIE CLEMENCIA MENDOZA GALVIZ', NULL, NULL, '1988-04-30', '0', 'acmendozag@hotmail.com', NULL, '-1086671924', '2007-02-08', 1, NULL, NULL),
(17125, 2, 1, '1091680706', 'ANGIE PAOLA GARCIA PORTILLO', NULL, NULL, '1998-08-21', '0', 'pao21gapoan@hotmail.com', NULL, '-1190686768', '2016-08-29', 1, NULL, NULL),
(17126, 2, 1, '1032440435', 'ANGUIE CAROLINA QUINTERO REYES', NULL, NULL, '1990-10-31', NULL, 'carolina.quintero.reyes@outlook.com', NULL, '-1090383293', '2008-12-03', 1, NULL, NULL),
(17127, 2, 1, '9715388', 'ANIBAL  LOPEZ TRIGOS', NULL, NULL, '1965-11-15', '0', 'sincorreo@sincorreo.com', NULL, '-1170389963', '1985-01-03', 1, NULL, NULL),
(17128, 2, 1, '1090386215', 'ANIBAL  VERA BARRERA', NULL, NULL, '1986-12-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1091760071', '2005-10-08', 1, NULL, NULL),
(17129, 2, 1, '1090988111', 'ANIBAL FERNANDO RODRIGUEZ AGUILAR', NULL, NULL, '1994-01-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1170179859', '2012-02-13', 1, NULL, NULL),
(17130, 2, 1, '26777267', 'ANNY DEL ROSARIO GALVIZ SANCHEZ', NULL, NULL, '1975-08-13', '0', 'sincorreo@sincorreo.com', NULL, '-1120851851', '1997-11-25', 1, NULL, NULL),
(17131, 2, 1, '26774642', 'ANNY ELVIRA OSORIO LOZANO', NULL, NULL, '1961-09-16', '0', 'annyoso@hotmail.com', NULL, '-1126716605', '1980-05-23', 1, NULL, NULL),
(17132, 2, 1, '5443804', 'ANTONIO  DURAN JAIME', NULL, NULL, '1950-06-13', '0', 'sincorreo@sincorreo.com', NULL, '-1161811918', '1972-01-16', 1, NULL, NULL),
(17133, 2, 1, '5087988', 'ANTONIO  MORA ASCANIO', NULL, NULL, '1952-12-19', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1974-01-21', 1, NULL, NULL),
(17134, 2, 1, '5036271', 'ANTONIO  MORA ROSADO', NULL, NULL, '1982-01-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1112697399', '2000-06-29', 1, NULL, NULL),
(17135, 2, 1, '5036161', 'ANTONIO MARIA SANTIAGO RODRIGUEZ', NULL, NULL, '1979-05-29', '0', 'sincorreo@sincorreo.com', NULL, '-1162604455', '1997-05-29', 1, NULL, NULL),
(17136, 1, 1, '1092178334', 'ANYELA YURANY VEGA MANZANO', NULL, NULL, '2007-04-04', '0', 'sincorreo@sincorreo.com', NULL, '-1152450824', '2016-04-06', 1, NULL, NULL),
(17137, 2, 1, '1003315945', 'ANYI CAROLINA VILLEGAS MADARIAGA', NULL, NULL, '2001-02-08', '0', 'angievillegas24@gmail.com', NULL, '-1079490918', '2019-03-13', 1, NULL, NULL),
(17138, 2, 1, '1066063111', 'ANYI FERNANDA VEGA MANZANO', NULL, NULL, '1995-02-05', '0', 'anyivega7@gmail.com', NULL, '-1138455300', '2013-02-12', 1, NULL, NULL),
(17139, 2, 1, '1066063029', 'ANYI TATIANA ALVAREZ GRANADOS', NULL, NULL, '1994-07-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1160701373', '2012-07-31', 1, NULL, NULL),
(17140, 1, 1, '1572225780', 'ANYI TATIANA ASCANIO BACA', NULL, NULL, '1996-06-15', NULL, 'ANTASB@HOTMAYL.ES', NULL, NULL, '2007-01-12', 1, NULL, NULL),
(17141, 2, 1, '1003122001', 'ANYI VANESSA RUEDAS RIVERA', NULL, NULL, '2001-10-08', '0', 'sincorreo@sincorreo.com', NULL, '-1128817879', '2019-11-15', 1, NULL, NULL),
(17142, 2, 1, '26779523', 'ARACELY  LOZANO DE OSORIO', NULL, NULL, '1936-06-13', '0', 'sincorreo@sincorreo.com', NULL, '-1118494809', '1961-12-18', 1, NULL, NULL),
(17143, 2, 1, '49640010', 'ARAMINTA  LOZANO RIOS', NULL, NULL, '1958-06-26', '0', 'sincorreo@sincorreo.com', NULL, '-1139847293', '1977-07-12', 1, NULL, NULL),
(17144, 2, 2, '27887843', 'ARGEMIRA  PAEZ', NULL, NULL, '1977-08-29', '0', 'sincorreo@sincorreo.com', NULL, '-1082768574', '1996-08-07', 1, NULL, NULL),
(17145, 2, 1, '26774480', 'ARGEMIRA  QUINTERO DE MENDOZA', NULL, NULL, '1948-10-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1071084773', '1974-01-21', 1, NULL, NULL),
(17146, 2, 1, '1066062698', 'ARGEMIRO  ANGARITA RIOS', NULL, NULL, '1991-10-18', '0', 'argemiroangarita0001@gmail.com', NULL, '-1110956284', '2009-10-19', 1, NULL, NULL),
(17147, 2, 1, '5035060', 'ARGEMIRO  PICON RIOS', NULL, NULL, '1959-05-13', '0', 'sincorreo@sincorreo.com', NULL, '-1141799923', '1977-09-08', 1, NULL, NULL),
(17148, 2, 1, '26774520', 'ARGENIDA  BOHORQUEZ MANOSALVA', NULL, NULL, '1954-10-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1079501749', '1975-12-17', 1, NULL, NULL),
(17149, 2, 1, '37241102', 'ARGENIDA  CHINCHILLA MADARIAGA', NULL, NULL, '1954-05-06', '0', 'sincorreo@sincorreo.com', NULL, '-1062444861', '1975-08-04', 1, NULL, NULL),
(17150, 2, 1, '26777184', 'ARGENIDA  CLAVIJO CAÃ‘IZARES', NULL, NULL, '1969-09-16', '0', 'sebasero816@gmail.com', NULL, '-1179067363', '1996-07-05', 1, NULL, NULL),
(17151, 2, 1, '37369255', 'ARGENIDA  JACOME MENESES', NULL, NULL, '1970-04-11', '0', 'ejerjil1993@hotmail.com', NULL, '-1182610831', '1993-01-26', 1, NULL, NULL),
(17152, 2, 1, '27770672', 'ARGENIDA  RINCON AMAYA', NULL, NULL, '1961-11-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1171327615', '1980-10-01', 1, NULL, NULL),
(17153, 2, 1, '13374603', 'ARIDES ANTONIO DURAN MONTEJO', NULL, NULL, '1964-05-21', '0', 'sincorreo@sincorreo.com', NULL, '-1192654782', '1983-12-12', 1, NULL, NULL),
(17154, 2, 1, '5471896', 'ARLEISY HELY GAONA MANOSALVA', NULL, NULL, '1983-01-09', '0', 'sincorreo@sincorreo.com', NULL, '-1170161570', '2001-01-09', 1, NULL, NULL),
(17155, 2, 1, '5035342', 'ARMANDO  DURAN JACOME', NULL, NULL, '1966-10-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1192054266', '1985-12-09', 1, NULL, NULL),
(17156, 2, 1, '1733990', 'ARMENIO  LOZANO MENDOZA', NULL, NULL, '1950-11-28', '0', 'sincorreo@sincorreo.com', NULL, '-1118242223', '1974-01-16', 1, NULL, NULL),
(17157, 2, 1, '5035086', 'ARMENIO  QUINTERO GARCIA', NULL, NULL, '1960-01-28', '0', 'sincorreo@sincorreo.com', NULL, '-1082893216', '1979-03-15', 1, NULL, NULL),
(17158, 2, 1, '77037282', 'ARNULFO  LOPEZ TRIGOS', NULL, NULL, '1969-10-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1160422756', '1988-08-17', 1, NULL, NULL),
(17159, 2, 1, '5407352', 'ARNULFO  PE?ARANDA BAYONA', NULL, NULL, '1953-11-24', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1976-09-20', 1, NULL, NULL),
(17160, 2, 1, '37371532', 'ASTRID  ACOSTA NAVARRO', NULL, NULL, '1978-12-24', '0', 'sincorreo@sincorreo.com', NULL, '-1090966093', '2000-05-02', 1, NULL, NULL),
(17161, 2, 1, '1094321446', 'ASTRID  CA?IZARES CASTILLA', NULL, NULL, '1989-06-04', NULL, 'soydigitalastrid@gmail.com', NULL, '-1188964532', '2008-03-13', 1, NULL, NULL),
(17162, 2, 1, '37320088', 'ASTRID  CARRASCAL QUINTERO', NULL, NULL, '1965-11-15', '0', 'sincorreo@sincorreo.com', NULL, '-1130477631', '1985-12-09', 1, NULL, NULL),
(17163, 2, 1, '26774903', 'ASTRID DEL CARMEN RODRIGUEZ GUTIERREZ', NULL, NULL, '1971-01-26', '0', 'sincorreo@sincorreo.com', NULL, '-1182541924', '1989-06-16', 1, NULL, NULL),
(17164, 2, 1, '26774450', 'AURA  RINCON DE MENDOZA', NULL, NULL, '1946-12-20', '0', 'sincorreo@sincorreo.com', NULL, '-1158475670', '1974-01-07', 1, NULL, NULL),
(17165, 2, 1, '26774492', 'AURA CAYETANA GALVIS BOHORQUEZ', NULL, NULL, '1950-08-07', '0', 'aura195036@gmail.com', NULL, '-1130302375', '1974-01-21', 1, NULL, NULL),
(17166, 2, 1, '27740877', 'AURA CELINA BECERRA', NULL, NULL, '1957-05-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1136321311', '1980-05-23', 1, NULL, NULL),
(17167, 2, 1, '27744136', 'AURA EMILCE RUEDAS', NULL, NULL, '1951-08-08', '0', 'sincorreo@sincorreo.com', NULL, '-1121862301', '1976-12-13', 1, NULL, NULL),
(17168, 2, 1, '27763917', 'AURA ESTELA ARAUJO JIMENEZ', NULL, NULL, '1952-04-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1136450835', '1973-06-28', 1, NULL, NULL),
(17169, 2, 1, '27763956', 'AURA ROSA PICON PICON', NULL, NULL, '1947-06-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1150370153', '1973-07-25', 1, NULL, NULL),
(17170, 2, 1, '26777354', 'AURIESNITH  DUARTE PORTILLO', NULL, NULL, '1980-10-14', '0', 'sincorreo@sincorreo.com', NULL, '-1150353410', '2000-06-24', 1, NULL, NULL),
(17171, 2, 1, '26774692', 'AURIS MARIA JACOME LOZANO', NULL, NULL, '1960-10-03', '5895888', 'sincorreo@sincorreo.com', NULL, '-1287062310', '1981-12-14', 1, NULL, NULL),
(17172, 2, 1, '26775049', 'AURY STELLA TRILLOS MOLINA', NULL, NULL, '1974-08-05', '0', 'sincorreo@sincorreo.com', NULL, '-1077262458', '1993-11-30', 1, NULL, NULL),
(17173, 2, 1, '37325665', 'AYDA  AMAYA LEON', NULL, NULL, '1968-10-08', '0', 'sincorreo@sincorreo.com', NULL, '-1170359897', '1991-04-02', 1, NULL, NULL),
(17174, 2, 1, '37367237', 'AYDA ROSA DUARTE RIOS', NULL, NULL, '1966-03-13', NULL, 'yaya662010@hotmail.com', NULL, '-1126656740', '1985-12-09', 1, NULL, NULL),
(17175, 2, 1, '37318423', 'AYDALY  MOLINA DUARTE', NULL, NULL, '1958-10-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1109403543', '1984-09-07', 1, NULL, NULL),
(17176, 2, 1, '1003174644', 'B J MACKEY SUAREZ GAONA', NULL, NULL, '2002-12-19', NULL, 'bjmackeysuarezgaona@gmail.com', NULL, '-1167990513', '2021-01-05', 1, NULL, NULL),
(17177, 2, 1, '37322205', 'BEATRIZ  ECHAVEZ SANTANA', NULL, NULL, '1963-11-19', '0', 'sincorreo@sincorreo.com', NULL, '-1152658758', '1988-06-07', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(17178, 2, 1, '88285159', 'BELSAID DEL CARMEN AMAYA URQUIJO', NULL, NULL, '1977-02-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1168872279', '1997-04-24', 1, NULL, NULL),
(17179, 2, 1, '5036287', 'BENITO ANTONIO CHINCHILLA TORRES', NULL, NULL, '1982-12-18', '0', 'sincorreo@sincorreo.com', NULL, '-1081307846', '2001-07-27', 1, NULL, NULL),
(17180, 2, 1, '12663011', 'BENJAMIN  MANOSALVA MOLINA', NULL, NULL, '1951-12-18', '0', 'sincorreo@sincorreo.com', NULL, '-1127160727', '1975-04-23', 1, NULL, NULL),
(17181, 2, 1, '5035318', 'BENJAMIN  NAVARRO', NULL, NULL, '1963-10-06', '0', 'sincorreo@sincorreo.com', NULL, '-1075826033', '1985-08-30', 1, NULL, NULL),
(17182, 2, 1, '88138904', 'BENJAMIN  PRADO MONTAGUTH', NULL, NULL, '1965-09-08', '0', 'sincorreo@sincorreo.com', NULL, '-788840071', '1983-10-24', 1, NULL, NULL),
(17183, 2, 1, '5035162', 'BERCELIO JOSE JACOME CARRASCAL', NULL, NULL, '1962-09-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1082342454', '1980-11-28', 1, NULL, NULL),
(17184, 1, 1, '1066062220', 'BERNARDO GABRIEL QUINTERO PACHECO', NULL, NULL, '2006-03-19', '0', 'madeyberny@gmail.com', NULL, '-1108706092', '2013-04-03', 1, NULL, NULL),
(17185, 2, 2, '27887249', 'BERTILDE  REMOLINA ORTIZ', NULL, NULL, '1963-06-26', '0', '', NULL, '-1170230610', '1985-08-05', 1, NULL, NULL),
(17186, 2, 1, '1066062459', 'BIANCY TORCOROMA BAYONA MONTAGUT', NULL, NULL, '1989-09-06', '0', 'nataliacogua20@gmail.com', NULL, '-1081575796', '2008-02-26', 1, NULL, NULL),
(17187, 2, 1, '26774688', 'BLANCA ESTELA QUINTERO QUINTERO', NULL, NULL, '1958-12-30', '5610913', 'eduardtoqui@hotmail.com', NULL, '-1141703383', '1981-12-14', 1, NULL, NULL),
(17188, 2, 1, '37368663', 'BLANCA MERY OJEDA RINCON', NULL, NULL, '1971-12-10', NULL, 'chktk@hotmail.com', NULL, '-1149710316', '1991-01-11', 1, NULL, NULL),
(17189, 2, 1, '37324051', 'BLANCA NUBIA CARRASCAL PRADO', NULL, NULL, '1966-07-02', '0', 'sincorreo@sincorreo.com', NULL, '-1091387770', '1989-12-11', 1, NULL, NULL),
(17190, 2, 1, '37325976', 'BLANCA OLIVA LOBO SALAZAR', NULL, NULL, '1966-03-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1172188845', '1991-07-26', 1, NULL, NULL),
(17191, 2, 1, '26774944', 'BLANCA OLIVA MANZANO BARBOSA', NULL, NULL, '1971-09-04', '0', 'blancamanzano430@gmail.com', NULL, '-1240513871', '1991-03-14', 1, NULL, NULL),
(17192, 2, 1, '37325715', 'BLANCA OLIVA ORTEGA ORTIZ', NULL, NULL, '1963-08-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1081813948', '1991-04-08', 1, NULL, NULL),
(17193, 2, 1, '37367391', 'BLANCA OLIVA ROJAS GUERRERO', NULL, NULL, '1961-10-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1188951219', '1987-02-13', 1, NULL, NULL),
(17194, 2, 1, '26861063', 'BLANCA OLIVA SANTIAGO SANTIAGO', NULL, NULL, '1941-07-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1117236136', '1973-12-27', 1, NULL, NULL),
(17195, 2, 1, '26774521', 'BLANCA ROSA BARBOSA NAVARRO', NULL, NULL, '1954-03-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1135683927', '1975-12-17', 1, NULL, NULL),
(17196, 2, 1, '26774968', 'BLANCA ROSA DUARTE GALVIZ', NULL, NULL, '1964-09-09', '0', 'sincorreo@sincorreo.com', NULL, '-1189319713', '1991-08-13', 1, NULL, NULL),
(17197, 2, 1, '37331096', 'BLANCA ROSA RUEDAS BAYONA', NULL, NULL, '1975-09-15', '0', 'blancaruedas75@gmail.com', NULL, '-1138666414', '1995-11-20', 1, NULL, NULL),
(17198, 2, 2, '1004817294', 'BRAIDER JESUS CHACON DURAN', NULL, NULL, '2002-09-07', '0', 'bjchacon2002@gmail.com', NULL, '-1079176637', '2020-10-05', 1, NULL, NULL),
(17199, 1, 1, '1092731246', 'BRANDON STIVEN MANOSALVA ASCANIO', NULL, NULL, '2005-10-18', '-1078221204', 'sincorreo@sincorreo.com', NULL, NULL, '2012-10-22', 1, NULL, NULL),
(17200, 2, 1, '1003122007', 'BRAYAN  RUEDAS RINCON', NULL, NULL, '2000-11-08', '0', 'urregojimenezlaura@gmail.com', NULL, '-1149755929', '2019-02-14', 1, NULL, NULL),
(17201, 2, 1, '1066063575', 'BRAYAN ALEJANDRO GOMEZ PACHECO', NULL, NULL, '1998-09-27', '0', 'alejandrogomespacheco@gmail.com', NULL, '-1092819813', '2016-10-04', 1, NULL, NULL),
(17202, 1, 1, '1066062353', 'BRAYAN CAMILO JACOME ANGARITA', NULL, NULL, '2006-10-14', '0', 'sincorreo@sincorreo.com', NULL, '-1178185666', '2013-10-15', 1, NULL, NULL),
(17203, 1, 1, '1067595561', 'BRAYAN CAMILO VASQUEZ RANGEL', NULL, NULL, '2005-04-05', '0', 'rangelbrayan248@gmail.com', NULL, '-1116232615', '2017-08-09', 1, NULL, NULL),
(17204, 2, 1, '1007539552', 'BRAYAN DANILO CONTRERAS NAVARRO', NULL, NULL, '2001-08-20', '0', 'sincorreo@sincorreo.com', NULL, '-1087007925', '2019-09-06', 1, NULL, NULL),
(17205, 2, 1, '1066063452', 'BRAYAN STIVEN BELTRAN NAVARRO', NULL, NULL, '1997-09-30', '0', 'brayanelmono1@gmail.com', NULL, '-1070289155', '2015-11-06', 1, NULL, NULL),
(17206, 2, 1, '1066062257', 'CAMILA ALEJANDRA FLORES MOLINA', NULL, NULL, '1988-01-14', NULL, 'cajot25@hotmail.com', NULL, '-1182544970', '2007-02-08', 1, NULL, NULL),
(17207, 2, 1, '1066062708', 'CAMILA TORCOROMA TRILLOS GALVIZ', NULL, NULL, '1991-07-10', '0', 'ca.mi13@hotmail.com', NULL, '-1072755676', '2009-11-09', 1, NULL, NULL),
(17208, 2, 1, '26774699', 'CANDELARIA  MANOSALVA DE BARBOSA', NULL, NULL, '1963-02-02', '0', 'manosalvacandelaria02@gmail.com', NULL, '-1092369399', '1981-12-14', 1, NULL, NULL),
(17209, 2, 1, '26774192', 'CANDIDA ROSA PORTILLO DE BOHORQUEZ', NULL, NULL, '1936-11-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1118462885', '1960-03-02', 1, NULL, NULL),
(17210, 1, 1, '1091658727', 'CARLA DAYERLY RANGEL CARRASCAL', NULL, NULL, '2006-06-24', '0', 'rangelcarrascalcarladayerly@gmail.com', NULL, '-1082959624', '2013-09-20', 1, NULL, NULL),
(17211, 2, 1, '1066062891', 'CARLOS ALFREDO ANGARITA MARTINEZ', NULL, NULL, '1993-06-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1137920650', '2011-09-14', 1, NULL, NULL),
(17212, 2, 1, '1066062906', 'CARLOS ALFREDO DELGADO BOHORQUEZ', NULL, NULL, '1993-10-12', '0', 'carlosalfredodb12@gmail.com', NULL, '-1190715049', '2011-10-12', 1, NULL, NULL),
(17213, 2, 1, '1091675488', 'CARLOS ALFREDO PALLARES BAYONA', NULL, NULL, '1996-01-21', '0', 'karlpalla2013@gmail.com', NULL, '-1082393721', '2014-02-27', 1, NULL, NULL),
(17214, 2, 1, '5035652', 'CARLOS ANDRES GUTIERREZ QUINTERO', NULL, NULL, '1974-01-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1179021773', '1993-11-30', 1, NULL, NULL),
(17215, 2, 1, '5036338', 'CARLOS ANDRES OSORIO MENDOZA', NULL, NULL, '1984-09-09', NULL, 'kaliche10@hotmail.com', NULL, '-1138261839', '2002-09-18', 1, NULL, NULL),
(17216, 2, 1, '1066062859', 'CARLOS ANDRES PEÃ‘ARANDA PEÃ‘ARANDA', NULL, NULL, '1993-05-06', '0', 'candy.2010.13@hotmail.com', NULL, '-1168602462', '2011-06-07', 1, NULL, NULL),
(17217, 2, 1, '1065851777', 'CARLOS ANDRES SANCHEZ CAÃ‘IZAREZ', NULL, NULL, '1999-08-03', '0', 'carlossanchezcanizarez@gmail.com', NULL, '-1279341421', '2017-08-08', 1, NULL, NULL),
(17218, 2, 1, '88287787', 'CARLOS ARTURO RANGEL DURAN', NULL, NULL, '1977-02-08', '0', 'sincorreo@sincorreo.com', NULL, '-1121695028', '1995-04-04', 1, NULL, NULL),
(17219, 2, 1, '1032363301', 'CARLOS AUGUSTO OSORIO ROSADO', NULL, NULL, '1986-03-15', '0', 'tuto0315@hotmail.com', NULL, '-1136988750', '2004-06-08', 1, NULL, NULL),
(17220, 2, 1, '1004819624', 'CARLOS DANIEL GARAY RODRIGUEZ', NULL, NULL, '1995-07-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1080291336', '2013-10-10', 1, NULL, NULL),
(17221, 2, 1, '1734032', 'CARLOS DANIEL LOZANO LEMUS', NULL, NULL, '1952-04-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1120152777', '1974-01-21', 1, NULL, NULL),
(17222, 2, 1, '5035171', 'CARLOS DANIEL QUINTERO MANDON', NULL, NULL, '1962-12-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1176538959', '1981-03-12', 1, NULL, NULL),
(17223, 2, 1, '1004858168', 'CARLOS DAVID MELO YARURO', NULL, NULL, '2001-12-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1161105598', '2020-02-03', 1, NULL, NULL),
(17224, 2, 1, '13376077', 'CARLOS ELI SANTIAGO AREVALO', NULL, NULL, '1968-03-01', NULL, 'carlossantiago1225@gmail.com', NULL, '-1182667182', '1987-10-22', 1, NULL, NULL),
(17225, 2, 1, '5470311', 'CARLOS GUILLERMO CONTRERAS NAVARRO', NULL, NULL, '1981-12-24', '0', 'sincorreo@sincorreo.com', NULL, '-1188710581', '2000-01-11', 1, NULL, NULL),
(17226, 2, 1, '1066063008', 'CARLOS GUSTAVO MOLINA NAVARRO', NULL, NULL, '1993-10-05', '0', 'sincorreo@sincorreo.com', NULL, '-1131137394', '2012-05-29', 1, NULL, NULL),
(17227, 2, 1, '1066062086', 'CARLOS JORGE SANTIAGO BOHORQUEZ', NULL, NULL, '1985-07-14', '0', 'cajosanbo@hotmail.com', NULL, '-1162322318', '2005-03-29', 1, NULL, NULL),
(17228, 1, 1, '1066062481', 'CARLOS MARIO PAVA GARCIA', NULL, NULL, '2008-04-26', '0', 'carlosmariopava41@gmail.com', NULL, '-1182619000', '2015-05-06', 1, NULL, NULL),
(17229, 2, 1, '13378427', 'CARLOS OMAR BARBOSA RIOS', NULL, NULL, '1976-02-19', '0', 'damake22@hotmail.com', NULL, '-1136013544', '1994-06-20', 1, NULL, NULL),
(17230, 2, 1, '1066062467', 'CARMELA  CHINCHILLA AGUILAR', NULL, NULL, '1990-01-26', '0', 'carmela26012510@gmail.com', NULL, '-1108225167', '2008-03-25', 1, NULL, NULL),
(17231, 2, 1, '26774407', 'CARMELA  PACHECO QUINTERO', NULL, NULL, '1949-02-03', '0', 'sincorreo@sincorreo.com', NULL, '-1130116119', '1971-01-25', 1, NULL, NULL),
(17232, 2, 1, '26778103', 'CARMELINA  CARREÃ‘O', NULL, NULL, '1940-05-22', '0', 'sincorreo@sincorreo.com', NULL, '-1159354017', '1963-01-16', 1, NULL, NULL),
(17233, 2, 1, '26774439', 'CARMELINA  PORTILLO GOMEZ', NULL, NULL, '1951-07-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1156575197', '1974-01-17', 1, NULL, NULL),
(17234, 2, 1, '49640006', 'CARMELITA  BOHORQUEZ MANOSALVA', NULL, NULL, '1956-10-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1152376040', '1976-01-17', 1, NULL, NULL),
(17235, 2, 1, '37310882', 'CARMELITA  GOMEZ GALVIS', NULL, NULL, '1955-12-31', '5690952', 'sincorreo@sincorreo.com', NULL, '-1151227505', '1977-05-14', 1, NULL, NULL),
(17236, 2, 1, '13360685', 'CARMELO  AMAYA SERRANO', NULL, NULL, '1955-05-19', '0', 'sincorreo@sincorreo.com', NULL, '-1180136499', '1976-07-27', 1, NULL, NULL),
(17237, 2, 1, '9715274', 'CARMEN ABEL ACOSTA MELO', NULL, NULL, '1964-04-15', '0', 'sincorreo@sincorreo.com', NULL, '-1168370596', '1983-12-12', 1, NULL, NULL),
(17238, 2, 1, '1733931', 'CARMEN ALONSO TRILLOS SANCHEZ', NULL, NULL, '1947-01-28', '0', 'sincorreo@sincorreo.com', NULL, '-1187037800', '1969-06-20', 1, NULL, NULL),
(17239, 2, 1, '77175658', 'CARMEN ANGEL MADARIAGA MANZANO', NULL, NULL, '1973-10-24', '0', 'caanmama@yahoo.es', NULL, '-1127716576', '1992-07-15', 1, NULL, NULL),
(17240, 2, 1, '13376207', 'CARMEN ANIBAL RODRIGUEZ', NULL, NULL, '1962-12-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1086520601', '1988-04-21', 1, NULL, NULL),
(17241, 2, 1, '5036076', 'CARMEN ANTONIO BONILLA GARZON', NULL, NULL, '1960-06-14', '0', 'sincorreo@sincorreo.com', NULL, '-1156983499', '1979-05-14', 1, NULL, NULL),
(17242, 2, 1, '12556246', 'CARMEN ANTONIO MANDON', NULL, NULL, '1961-08-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1150682555', '1981-02-25', 1, NULL, NULL),
(17243, 2, 1, '26774746', 'CARMEN EIDA PABA NAVARRO', NULL, NULL, '1964-08-31', '0', 'carmenpaba@hotmail.com', NULL, '-1126640064', '1983-11-07', 1, NULL, NULL),
(17244, 2, 1, '26777112', 'CARMEN ELENA PICON DE CARRILLO', NULL, NULL, '1940-05-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1086303434', '1963-01-16', 1, NULL, NULL),
(17245, 2, 1, '5036160', 'CARMEN ELIAS NAVARRO CASTRO', NULL, NULL, '1975-04-27', '0', 'sincorreo@sincorreo.com', NULL, '-1176641936', '1997-05-27', 1, NULL, NULL),
(17246, 2, 1, '5035039', 'CARMEN EMIGDIO QUINTERO', NULL, NULL, '1955-04-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1162780065', '1977-03-09', 1, NULL, NULL),
(17247, 2, 1, '27703907', 'CARMEN EMILCE GARCIA JULIO', NULL, NULL, '1950-06-30', '0', 'sincorreo@sincorreo.com', NULL, '-1160125635', '1973-01-10', 1, NULL, NULL),
(17248, 2, 1, '13358917', 'CARMEN EMIRO CASTRO', NULL, NULL, '1953-02-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1169189211', '1974-11-12', 1, NULL, NULL),
(17249, 2, 1, '5458975', 'CARMEN EMIRO CLARO DURAN', NULL, NULL, '1962-04-17', '0', 'sincorreo@sincorreo.com', NULL, '-1180488430', '1981-12-14', 1, NULL, NULL),
(17250, 2, 1, '5035217', 'CARMEN EMIRO DURAN PORTILLO', NULL, NULL, '1963-06-08', '0', 'sincorreo@sincorreo.com', NULL, '-1169103533', '1981-12-14', 1, NULL, NULL),
(17251, 2, 1, '1091662153', 'CARMEN EVELIO MONTAGUTH AMAYA', NULL, NULL, '1988-12-27', NULL, 'eveliomontaguthamaya@gmail.com', NULL, '-1069542086', '2007-10-09', 1, NULL, NULL),
(17252, 2, 1, '26774437', 'CARMEN FELISA PACHECO RUEDAS', NULL, NULL, '1945-03-02', '0', 'sincorreo@sincorreo.com', NULL, '-1169986071', '1974-01-17', 1, NULL, NULL),
(17253, 2, 1, '26778087', 'CARMEN FELISA SANCHEZ DE GARCIA', NULL, NULL, '1930-11-20', '0', 'sincorreo@sincorreo.com', NULL, '-1161445482', '1956-08-06', 1, NULL, NULL),
(17254, 2, 1, '26774739', 'CARMEN ISABEL FLOREZ SANTIAGO', NULL, NULL, '1963-12-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1187295498', '1983-08-23', 1, NULL, NULL),
(17255, 2, 1, '1091670260', 'CARMEN LORENA GUERRERO QUINTERO', NULL, NULL, '1992-12-03', '0', 'loregq1992@hotmail.com', NULL, '-1076290925', '2011-09-02', 1, NULL, NULL),
(17256, 2, 1, '1066062709', 'CARMEN MAIRENA TRILLOS GALVIZ', NULL, NULL, '1991-07-10', NULL, 'neil.j.m@hotmail.com', NULL, '-1074982693', '2009-11-09', 1, NULL, NULL),
(17257, 2, 1, '37318657', 'CARMEN MARIA CARRASCAL', NULL, NULL, '1955-01-14', '0', 'sincorreo@sincorreo.com', NULL, '-1168826810', '1984-11-19', 1, NULL, NULL),
(17258, 2, 1, '26775024', 'CARMEN MARIA CARRASCAL NORIEGA', NULL, NULL, '1974-07-16', '0', 'sincorreo@sincorreo.com', NULL, '-1081419926', '1993-06-08', 1, NULL, NULL),
(17259, 2, 1, '26774405', 'CARMEN MARIA DUARTE BOHORQUEZ', NULL, NULL, '1948-02-02', '0', 'sincorreo@sincorreo.com', NULL, '-1120067136', '1971-01-25', 1, NULL, NULL),
(17260, 2, 1, '37367016', 'CARMEN MARIA MANDON AGUILAR', NULL, NULL, '1966-02-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1120498609', '1985-08-26', 1, NULL, NULL),
(17261, 2, 1, '26774401', 'CARMEN MARIA PEREZ', NULL, NULL, '1946-10-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1090978271', '1971-01-25', 1, NULL, NULL),
(17262, 2, 1, '26778115', 'CARMEN MARIA SOLANO ANGARITA', NULL, NULL, '1943-08-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1092269062', '1966-10-21', 1, NULL, NULL),
(17263, 2, 1, '26774629', 'CARMEN MARINA GALVIS SANCHEZ', NULL, NULL, '1960-01-01', '0', 'sincorreo@sincorreo.com', NULL, '-1076173305', '1979-11-29', 1, NULL, NULL),
(17264, 2, 1, '13362871', 'CARMEN RAMON RUEDAS BALLESTEROS', NULL, NULL, '1952-11-09', '0', 'sincorreo@sincorreo.com', NULL, '-1107078884', '1978-03-03', 1, NULL, NULL),
(17265, 2, 1, '26774314', 'CARMEN RAMONA PACHECO QUINTERO', NULL, NULL, '1943-01-19', '0', 'sincorreo@sincorreo.com', NULL, '-1129495549', '1985-05-28', 1, NULL, NULL),
(17266, 2, 1, '49640012', 'CARMEN ROSA GOMEZ DE DUARTE', NULL, NULL, '1955-05-19', '0', 'sincorreo@sincorreo.com', NULL, '-1086678851', '1977-07-12', 1, NULL, NULL),
(17267, 2, 1, '49640016', 'CARMEN ROSA MANOSALVA PORTILLO', NULL, NULL, '1958-11-19', '0', 'sincorreo@sincorreo.com', NULL, '-1188015083', '1977-07-12', 1, NULL, NULL),
(17268, 2, 1, '37319600', 'CARMEN ROSA QUINTERO CORONEL', NULL, NULL, '1965-05-15', '0', 'sincorreo@sincorreo.com', NULL, '-1066393438', '1985-09-17', 1, NULL, NULL),
(17269, 2, 1, '26774502', 'CARMEN ROSA RODRIGUEZ PICON', NULL, NULL, '1953-01-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1141881074', '1974-10-15', 1, NULL, NULL),
(17270, 2, 1, '37367984', 'CARMEN ROSA SANGUINO', NULL, NULL, '1967-05-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1089558232', '1988-12-02', 1, NULL, NULL),
(17271, 2, 1, '60414846', 'CARMEN SENAIDA CASTILLA TARAZONA', NULL, NULL, '1969-06-07', '0', 'sincorreo@sincorreo.com', NULL, '-1162788461', '1990-09-18', 1, NULL, NULL),
(17272, 2, 1, '37339286', 'CARMEN YALIXE BAYONA AMAYA', NULL, NULL, '1981-09-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1129184046', '2001-03-26', 1, NULL, NULL),
(17273, 2, 1, '36605018', 'CARMEN YOLANDA QUINTERO DE LOBO', NULL, NULL, '1946-11-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1176892535', '1973-02-27', 1, NULL, NULL),
(17274, 2, 1, '49716134', 'CARMENZA  CARRILLO AVENDAÃ‘O', NULL, NULL, '1981-07-18', '0', 'carmenzacarrillo18@gmail.com', NULL, '-1168732129', '2000-12-14', 1, NULL, NULL),
(17275, 2, 1, '37321760', 'CARMENZA  GALAN GARCIA', NULL, NULL, '1968-12-05', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1987-12-14', 1, NULL, NULL),
(17276, 2, 1, '26774865', 'CARMENZA  NAVARRO PICON', NULL, NULL, '1969-12-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1150682555', '1988-08-01', 1, NULL, NULL),
(17277, 2, 1, '37181743', 'CARMENZA  TRIGOS QUINTERO', NULL, NULL, '1984-10-18', '0', 'sincorreo@sincorreo.com', NULL, '-1192688619', '2002-11-08', 1, NULL, NULL),
(17278, 2, 1, '1003257534', 'CAROLINA  GONZALES GUTIERREZ', NULL, NULL, '1999-09-13', '0', 'carogogu09@hotmail.com', NULL, '-1169893526', '2017-10-11', 1, NULL, NULL),
(17279, 2, 1, '1003257461', 'CAROLINA  VACCA PORTILLO', NULL, NULL, '2002-02-19', '0', 'carolinavacaportillo@hotmail.com', NULL, '-1172187308', '2020-06-08', 1, NULL, NULL),
(17280, 2, 1, '85166346', 'CAYETANO  ALCENDRA GARCIA', NULL, NULL, '1978-07-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1082056293', '1997-02-01', 1, NULL, NULL),
(17281, 2, 1, '37326391', 'CECILIA  BARBOSA MORA', NULL, NULL, '1972-07-20', '0', 'sincorreo@sincorreo.com', NULL, '-1109433385', '1992-03-09', 1, NULL, NULL),
(17282, 2, 1, '37317248', 'CECILIA  LOZANO SANCHEZ', NULL, NULL, '1965-04-05', NULL, 'directorfc@crediservir.com', NULL, '-1141391508', '1983-08-23', 1, NULL, NULL),
(17283, 2, 1, '37321590', 'CECILIA  SANTIAGO CASTRO', NULL, NULL, '1965-01-10', '0', 'sincorreo@sincorreo.com', NULL, '-1162953388', '1987-10-27', 1, NULL, NULL),
(17284, 2, 1, '26774947', 'CECILIA  VERA SANTIAGO', NULL, NULL, '1971-04-09', '0', 'ceciliavera71@hotmail.com', NULL, '-1081790250', '1991-04-18', 1, NULL, NULL),
(17285, 2, 1, '5035543', 'CELEDON  GALVIZ PACHECO', NULL, NULL, '1970-05-12', '0', 'sincorreo@sincorreo.com', NULL, '-1156575220', '1991-12-30', 1, NULL, NULL),
(17286, 2, 1, '1734066', 'CELIAR  PORTILLO JACOME', NULL, NULL, '1954-04-18', '813348', 'sincorreo@sincorreo.com', NULL, NULL, '1976-01-15', 1, NULL, NULL),
(17287, 2, 1, '5036029', 'CELIAR JOSE PABA BARBOSA', NULL, NULL, '1939-05-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1126841751', '1960-09-19', 1, NULL, NULL),
(17288, 2, 1, '37365636', 'CELINA  CONTRERAS DE LOPEZ', NULL, NULL, '1951-12-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1180602217', '1979-08-21', 1, NULL, NULL),
(17289, 2, 1, '26774095', 'CELINA  NAVARRO DE PAVA', NULL, NULL, '1934-05-15', '0', 'sincorreo@sincorreo.com', NULL, '-1121366542', '1957-04-08', 1, NULL, NULL),
(17290, 2, 1, '26778119', 'CELITA MARIA BARBOSA DE RIVERA', NULL, NULL, '1942-02-27', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1966-10-21', 1, NULL, NULL),
(17291, 2, 1, '26774657', 'CELITA MARIA MANOSALVA DE LOZANO', NULL, NULL, '1948-01-03', '0', 'sincorreo@sincorreo.com', NULL, '-1111935850', '1981-03-11', 1, NULL, NULL),
(17292, 2, 1, '26774625', 'CELSA MARIA PABA NAVARRO', NULL, NULL, '1960-05-27', '0', 'celpana@hotmail.com', NULL, '-1129647582', '1979-11-29', 1, NULL, NULL),
(17293, 2, 1, '26777467', 'CENAIDA  LOZANO BACCA', NULL, NULL, '1985-06-29', NULL, 'cenaidalozano3007@outlook.com', NULL, '-1150444788', '2003-08-20', 1, NULL, NULL),
(17294, 2, 1, '5425806', 'CENON  QUINTERO SANTIAGO', NULL, NULL, '1947-04-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1170787845', '1970-10-15', 1, NULL, NULL),
(17295, 2, 1, '1734958', 'CENON JOSE MENDOZA RAMOS', NULL, NULL, '1930-02-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1187058460', '1956-05-18', 1, NULL, NULL),
(17296, 2, 1, '5425649', 'CESAR  CARVAJAL ANGARITA', NULL, NULL, '1947-05-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1092733979', '1969-11-10', 1, NULL, NULL),
(17297, 2, 1, '5036138', 'CESAR ANTONIO PALLAREZ', NULL, NULL, '1977-06-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1182142542', '1997-04-30', 1, NULL, NULL),
(17298, 2, 1, '5035697', 'CESAR AUGUSTO ARIAS MADARIAGA', NULL, NULL, '1976-12-31', '0', 'sincorreo@sincorreo.com', NULL, '-1161329772', '1995-07-17', 1, NULL, NULL),
(17299, 2, 1, '5035663', 'CESAR AUGUSTO ASCANIO GARCIA', NULL, NULL, '1976-02-13', NULL, 'cesar899a@gmail.com', NULL, '-1130658358', '1994-06-20', 1, NULL, NULL),
(17300, 2, 1, '5035073', 'CESAR AUGUSTO OSORIO LOZANO', NULL, NULL, '1959-09-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1106897822', '1977-11-26', 1, NULL, NULL),
(17301, 2, 1, '1066062872', 'CESAR EDUARDO GUTIERREZ NAVARRO', NULL, NULL, '1993-06-14', NULL, 'cegutierrez27@misena.edu.co', NULL, '-1109099532', '2011-07-11', 1, NULL, NULL),
(17302, 2, 1, '5035130', 'CESAR EMIRO LOZANO CHINCHILLA', NULL, NULL, '1960-09-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1192167700', '1979-12-09', 1, NULL, NULL),
(17303, 2, 1, '13875701', 'CESAR JULIO ROJAS HOYOS', NULL, NULL, '1948-10-26', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1969-11-19', 1, NULL, NULL),
(17304, 2, 1, '88283325', 'CESAR ROLANDO VERA OSORIO', NULL, NULL, '1977-07-07', '0', 'crvoss77@hotmail.com', NULL, '-1141248292', '1995-11-21', 1, NULL, NULL),
(17305, 2, 1, '1756942', 'CESAR TULIO SANCHEZ QUINTERO', NULL, NULL, '1944-01-09', '5619099', 'sincorreo@sincorreo.com', NULL, '-1169532553', '1965-07-21', 1, NULL, NULL),
(17306, 2, 1, '1032371970', 'CHRISTIAN FERNANDO QUINTERO REYES', NULL, NULL, '1986-07-30', '0', 'cristianquinteror2@hotmail.com', NULL, '-1118737291', '2004-10-14', 1, NULL, NULL),
(17307, 2, 1, '26777240', 'CIELO  DUARTE SOLANO', NULL, NULL, '1974-07-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1087491590', '1997-05-29', 1, NULL, NULL),
(17308, 2, 1, '1091653318', 'CINDY PAOLA MOLINA ROMERO', NULL, NULL, '1986-03-14', '0', 'cindypaolamolinaromero@gmail.com', NULL, '-1170444577', '2004-05-18', 1, NULL, NULL),
(17309, 2, 1, '1066062401', 'CINDY PAOLA RUEDAS JAIMES', NULL, NULL, '1989-04-18', NULL, 'cindypao1310@hotmail.com', NULL, '-1107081277', '2007-07-04', 1, NULL, NULL),
(17310, 2, 1, '2845010', 'CIPRIANO  BELTRAN MALDONADO', NULL, NULL, '1940-09-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1176025445', '1961-10-17', 1, NULL, NULL),
(17311, 2, 1, '1003257432', 'CIPRIANO ANTONIO BELTRAN SANCHEZ', NULL, NULL, '1993-01-01', '0', 'ciprianito.beltran@gmail.com', NULL, '-1177225140', '2014-11-19', 1, NULL, NULL),
(17312, 2, 1, '88136906', 'CIRO ALFONSO AMAYA PARRA', NULL, NULL, '1961-02-04', '0', 'sincorreo@sincorreo.com', NULL, '-1141712257', '1981-12-14', 1, NULL, NULL),
(17313, 2, 1, '88277564', 'CIRO ALFONSO CARRILLO BARBOSA', NULL, NULL, '1972-06-17', '0', 'cirocarrillo1972@gmail.com', NULL, '-1121388848', '1990-10-15', 1, NULL, NULL),
(17314, 2, 1, '5035495', 'CIRO ALFONSO CASTRO RODRIGUEZ', NULL, NULL, '1971-01-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1150792234', '1989-07-27', 1, NULL, NULL),
(17315, 2, 1, '12717676', 'CIRO ALFONSO CONTRERAS CARREÃ‘O', NULL, NULL, '1952-05-05', '0', 'sincorreo@sincorreo.com', NULL, '-1187042357', '1973-07-10', 1, NULL, NULL),
(17316, 2, 1, '18922742', 'CIRO ALFONSO CONTRERAS CONTRERAS', NULL, NULL, '1970-07-12', '0', 'sincorreo@sincorreo.com', NULL, '-1169775926', '1988-09-09', 1, NULL, NULL),
(17317, 2, 1, '5453676', 'CIRO ALFONSO GUERRERO', NULL, NULL, '1959-02-28', '0', 'sincorreo@sincorreo.com', NULL, '-1179019322', '1977-12-22', 1, NULL, NULL),
(17318, 2, 1, '5035588', 'CIRO ALFONSO LOBO ARCINIEGAS', NULL, NULL, '1973-12-15', '0', 'transporteslobo15@gmail.com', NULL, '-1092353892', '1992-03-09', 1, NULL, NULL),
(17319, 2, 1, '5453440', 'CIRO ALFONSO QUINTERO PEÃ‘ARANDA', NULL, NULL, '1958-01-21', '0', 'sincorreo@sincorreo.com', NULL, '-1069059518', '1976-01-17', 1, NULL, NULL),
(17320, 2, 1, '1091658181', 'CIRO ALFONSO TORO RUEDA', NULL, NULL, '1987-10-04', NULL, 'ciroto_871004@hotmail.com', NULL, '-1086232100', '2006-03-02', 1, NULL, NULL),
(17321, 2, 1, '5459657', 'CIRO ANTONIO ORTIZ LEON', NULL, NULL, '1950-01-28', '0', 'sincorreo@sincorreo.com', NULL, '-1127867221', '1971-12-02', 1, NULL, NULL),
(17322, 2, 1, '1003257733', 'CIRO FERNANDO MELO OSORIO', NULL, NULL, '2001-01-22', NULL, 'fernandomelo2201@gmail.com', NULL, '-1130321847', '2019-02-01', 1, NULL, NULL),
(17323, 2, 1, '1090982848', 'CLAIDE LORENA PEREZ ROJAS', NULL, NULL, '1986-05-14', NULL, 'claide26@hotmail.com', NULL, '-787766052', '2004-10-05', 1, NULL, NULL),
(17324, 2, 1, '26774486', 'CLARA  GERARDINO SANCHEZ', NULL, NULL, '1944-04-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1157368801', '1974-01-21', 1, NULL, NULL),
(17325, 2, 1, '26774396', 'CLARA ELENA DUARTE DE CHINCHILLA', NULL, NULL, '1942-05-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1168896608', '1969-10-23', 1, NULL, NULL),
(17326, 2, 1, '26774172', 'CLARA ELENA QUINTERO DE MENDOZA', NULL, NULL, '1935-07-06', '0', 'sincorreo@sincorreo.com', NULL, '-1171169014', '1959-09-09', 1, NULL, NULL),
(17327, 2, 1, '26774233', 'CLARA ROSA MANZANO DE MANZANO', NULL, NULL, '1931-06-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1180278961', '1961-06-19', 1, NULL, NULL),
(17328, 2, 1, '37337463', 'CLARIBEL  QUINTANA CONTRERAS', NULL, NULL, '1975-08-05', '0', 'sincorreo@sincorreo.com', NULL, '-1072769759', '2000-03-16', 1, NULL, NULL),
(17329, 2, 1, '1004862978', 'CLARISER  PEREZ SANTANA', NULL, NULL, '2001-05-30', '0', 'clarisantanaperez30@gmail.com', NULL, '-1129473802', '2019-07-30', 1, NULL, NULL),
(17330, 2, 1, '1098789643', 'CLAUDIA  DUARTE PINEDA', NULL, NULL, '1996-06-06', '0', 'sincorreo@sincorreo.com', NULL, '-1167443164', '2014-10-14', 1, NULL, NULL),
(17331, 2, 1, '1091654226', 'CLAUDIA  PAREDES SANCHEZ', NULL, NULL, '1983-07-16', '0', 'mariaclaudia.ps@hotmail.com', NULL, '-1236799304', '2004-09-23', 1, NULL, NULL),
(17332, 2, 1, '26777181', 'CLAUDIA BERNARDINA OSORIO', NULL, NULL, '1973-08-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1996-08-10', 1, NULL, NULL),
(17333, 2, 1, '37338360', 'CLAUDIA JUDIT CARVAJALINO CHACON', NULL, NULL, '1980-11-03', NULL, 'claudiacarcha@hotmail.com', NULL, '-1127431033', '2000-08-31', 1, NULL, NULL),
(17334, 2, 1, '1066062388', 'CLAUDIA MARCELA VEGA', NULL, NULL, '1988-11-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1170637477', '2007-05-29', 1, NULL, NULL),
(17335, 2, 1, '37329311', 'CLAUDIA MARIA ASCANIO PEREZ', NULL, NULL, '1974-05-19', '0', 'clamaspe@hotmail.com', NULL, '-1111856107', '1994-06-20', 1, NULL, NULL),
(17336, 2, 1, '37183001', 'CLAUDIA MILENA QUINTERO PALLARES', NULL, NULL, '1985-08-23', '0', 'claudiaquinteropallares@gmail.com', NULL, '-1191671486', '2003-09-02', 1, NULL, NULL),
(17337, 2, 1, '49658362', 'CLAUDIA PATRICIA QUINTERO LOZANO', NULL, NULL, '1971-01-30', NULL, 'c..pquintero@hotmail.com', NULL, '-1116841047', '1989-10-04', 1, NULL, NULL),
(17338, 2, 1, '1066062465', 'CLAUDIA XIMENA MENDOZA DUARTE', NULL, NULL, '1988-01-12', NULL, 'claximedu@hotmail.com', NULL, '-1142096499', '2008-03-17', 1, NULL, NULL),
(17339, 2, 1, '37330120', 'CLAUDIA YARINE GARCIA CASADIEGO', NULL, NULL, '1974-01-28', '0', 'clayagaga@gmail.com', NULL, '-1109158709', '1995-02-18', 1, NULL, NULL),
(17340, 2, 1, '37334446', 'CLAUDIA YASMIN MOLINA RINCON', NULL, NULL, '1979-12-05', '0', 'claudiayasmorry@hotmail.com', NULL, '-1112784933', '2002-07-30', 1, NULL, NULL),
(17341, 2, 1, '26774687', 'CONCEPCION  NAVARRO BOHORQUEZ', NULL, NULL, '1962-12-24', '0', 'sincorreo@sincorreo.com', NULL, '-1122213221', '1981-12-14', 1, NULL, NULL),
(17342, 4, 1, '800090676', 'COOPERATIVA DE TRABAJADORES Y PENSIONADOS DE LA SALUD COOTRASUD', NULL, NULL, '1989-10-01', '1780669519', 'cootrasaludoca@hotmail.com', NULL, '-1119188001', '2022-06-08', 1, NULL, NULL),
(17343, 2, 1, '37370794', 'COROMOTO  JACOME MENESES', NULL, NULL, '1979-08-31', '0', 'jacome3108meneses@gmail.com', NULL, '-1152509629', '1998-01-15', 1, NULL, NULL),
(17344, 2, 1, '88136362', 'CRISANTO  CA?IZARES CUBIDES', NULL, NULL, '1962-11-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1159056820', '1981-10-01', 1, NULL, NULL),
(17345, 2, 1, '1066063415', 'CRISTIAN ALBERTO SANCHEZ QUINTERO', NULL, NULL, '1997-04-19', '0', 'sincorreo@sincorreo.com', NULL, '-1156011877', '2015-06-30', 1, NULL, NULL),
(17346, 2, 1, '1090990740', 'CRISTIAN CAMILO CARO QUINTERO', NULL, NULL, '1998-12-07', NULL, 'caroquinterocristiancamilo821@gmail.com', NULL, '-1118002502', '2017-01-03', 1, NULL, NULL),
(17347, 1, 1, '1066062352', 'CRISTIAN CAMILO JACOME ANGARITA', NULL, NULL, '2006-10-14', '0', 'sincorreo@sincorreo.com', NULL, '-1178185666', '2013-10-15', 1, NULL, NULL),
(17348, 2, 1, '1020797640', 'CRISTIAN CAMILO PEREZ CORONEL', NULL, NULL, '1993-05-01', '0', 'cperez.ipk41999@gmail.com', NULL, '-1092367988', '2012-10-08', 1, NULL, NULL),
(17349, 2, 1, '1003257512', 'CRISTIAN DANIEL MADARIAGA AMAYA', NULL, NULL, '2000-09-23', '0', 'madariagaamaya23@gmail.com', NULL, '-1169491759', '2018-10-08', 1, NULL, NULL),
(17350, 2, 1, '1004819256', 'CRISTIAN DANILO RODRIGUEZ PABON', NULL, NULL, '2003-06-30', '0', 'cristiandanilorodriguezpabon@gmail.com', NULL, '-1066378788', '2021-07-12', 1, NULL, NULL),
(17351, 2, 1, '1066063613', 'CRISTIAN DAVID QUINTERO LOPEZ', NULL, NULL, '1999-01-22', '0', 'sincorreo@sincorreo.com', NULL, '-1070610615', '2017-03-15', 1, NULL, NULL),
(17352, 2, 1, '1091665842', 'CRISTIAN FERNANDO AREVALO CASTRO', NULL, NULL, '1991-07-06', '0', 'arevalo.c.f0691@gmail.com', NULL, '-1072651289', '2009-07-10', 1, NULL, NULL),
(17353, 2, 1, '1066063173', 'CRISTIAN JOSE PALLARES GALVIS', NULL, NULL, '1995-07-28', '0', 'cristian1995-28@hotmail.com', NULL, '-1130203646', '2013-08-13', 1, NULL, NULL),
(17354, 2, 1, '1003257523', 'CRISTIAN MIGUEL PAVA GARCIA', NULL, NULL, '2001-12-03', '0', 'cristianpava2001@gmail.com', NULL, '-1140970029', '2019-12-13', 1, NULL, NULL),
(17355, 2, 1, '1003257427', 'CRISTIAN ORLANDO DUARTE PORTILLO', NULL, NULL, '2002-05-13', '0', 'coduarte12@gmail.com', NULL, '-1192570501', '2020-08-10', 1, NULL, NULL),
(17356, 2, 1, '5035356', 'CRISTO VED PABA NAVARRO', NULL, NULL, '1968-06-06', '0', 'sincorreo@sincorreo.com', NULL, '-1117166393', '1986-11-11', 1, NULL, NULL),
(17357, 2, 1, '13178036', 'CRISTOBAL  MANDON QUINTERO', NULL, NULL, '1984-11-16', '0', 'sincorreo@sincorreo.com', NULL, '-1192518336', '2003-05-30', 1, NULL, NULL),
(17358, 2, 1, '12673014', 'CRISTOBAL  NAVARRO SANTIAGO', NULL, NULL, '1951-06-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1187933400', '2008-03-12', 1, NULL, NULL),
(17359, 2, 1, '85166356', 'CRISTOBAL  PEDROZO SANCHEZ', NULL, NULL, '1978-07-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1090357832', '1997-01-29', 1, NULL, NULL),
(17360, 2, 1, '1733994', 'CRISTOBAL  QUINTERO PAVA', NULL, NULL, '1948-05-26', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1974-01-16', 1, NULL, NULL),
(17361, 2, 1, '1733840', 'CUPERTINO  PEREA RAMIREZ', NULL, NULL, '1942-10-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1089761983', '1965-05-28', 1, NULL, NULL),
(17362, 2, 1, '19596513', 'DAGOBERTO  PABA CASADIEGO', NULL, NULL, '1977-10-23', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1996-02-19', 1, NULL, NULL),
(17363, 2, 1, '1066062964', 'DAINER EMEL ANGARITA QUINTERO', NULL, NULL, '1994-03-06', '0', 'sincorreo@sincorreo.com', NULL, '-1188330216', '2012-03-12', 1, NULL, NULL),
(17364, 2, 1, '1066063353', 'DAINER MAURICIO PABA MOLINA', NULL, NULL, '1997-01-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1082286199', '2015-02-06', 1, NULL, NULL),
(17365, 2, 1, '5035602', 'DAIRO  QUINTERO DUARTE', NULL, NULL, '1973-09-20', '0', 'sincorreo@sincorreo.com', NULL, '-1118132942', '1992-05-27', 1, NULL, NULL),
(17366, 2, 1, '1066062212', 'DAIRO ALONSO GALVIZ DUARTE', NULL, NULL, '1986-01-28', '0', 'sincorreo@sincorreo.com', NULL, '-1159082809', '2006-03-01', 1, NULL, NULL),
(17367, 2, 1, '5036224', 'DAIRO ANTONIO PINEDA DUARTE', NULL, NULL, '1980-05-30', NULL, 'sincorreo@sincorreo.com', NULL, '-789643147', '1999-09-13', 1, NULL, NULL),
(17368, 2, 1, '1066063494', 'DAIXON FERNANDO SIERRA ORTIZ', NULL, NULL, '1997-12-16', NULL, 'dafersior15@gmail.com', NULL, '-1080321968', '2016-03-07', 1, NULL, NULL),
(17369, 2, 1, '26774748', 'DALIDA MARIA SALAZAR', NULL, NULL, '1954-07-27', '0', 'sincorreo@sincorreo.com', NULL, '-1148150206', '1983-12-12', 1, NULL, NULL),
(17370, 2, 1, '13375819', 'DALIN  MANDON MANDON', NULL, NULL, '1969-01-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1169670381', '1987-05-27', 1, NULL, NULL),
(17371, 2, 1, '1066062948', 'DANIA  PORTILLO GOMEZ', NULL, NULL, '1994-02-12', '0', 'danieduest12@gmail.com', NULL, '-1087643824', '2012-02-16', 1, NULL, NULL),
(17372, 2, 1, '1064836422', 'DANIEL  ANGARITA DUARTE', NULL, NULL, '1985-11-28', '0', 'sincorreo@sincorreo.com', NULL, '-1186549068', '2004-08-17', 1, NULL, NULL),
(17373, 2, 1, '1094933116', 'DANIEL  CELIS SEPULVEDA', NULL, NULL, '1993-02-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1072302866', '2011-02-11', 1, NULL, NULL),
(17374, 2, 1, '13376621', 'DANIEL ANGEL GARCIA TORRES', NULL, NULL, '1970-05-25', '0', 'sincorreo@sincorreo.com', NULL, '-1180013012', '1989-02-15', 1, NULL, NULL),
(17375, 2, 1, '12551200', 'DANIEL ANTONIO FELICIANO CASTILLA', NULL, NULL, '1960-12-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1149927704', '1979-05-17', 1, NULL, NULL),
(17376, 2, 1, '5035493', 'DANIEL DAVID PABA CHINCHILLA', NULL, NULL, '1969-06-16', '0', 'sincorreo@sincorreo.com', NULL, '-1158286492', '1989-06-14', 1, NULL, NULL),
(17377, 2, 1, '1007283563', 'DANIELA  BOHORQUEZ MENESES', NULL, NULL, '2000-02-28', '0', 'bohorquezd480@gmail.com', NULL, '-1156759780', '2018-03-01', 1, NULL, NULL),
(17378, 2, 1, '1003257624', 'DANIELA  CARRILLO DUARTE', NULL, NULL, '2000-06-22', NULL, 'danielacarrilloduarte@gmail.com', NULL, '-1177941321', '2018-08-28', 1, NULL, NULL),
(17379, 2, 1, '1233506931', 'DANIELA  GALVIZ GAONA', NULL, NULL, '1999-05-21', NULL, 'danielagalviz21@hotmail.com', NULL, '-1119849942', '2017-06-05', 1, NULL, NULL),
(17380, 2, 1, '1003257696', 'DANIELA  OSORIO CASADIEGOS', NULL, NULL, '2000-05-16', '0', 'dani16osorio@gmail.com', NULL, '-1138508633', '2018-07-13', 1, NULL, NULL),
(17381, 2, 1, '1003121984', 'DANIELA SANDRID RUEDAS BARBOSA', NULL, NULL, '2002-01-21', '0', 'danielasandridruedas@gmail.com', NULL, '-1136108242', '2020-01-27', 1, NULL, NULL),
(17382, 2, 1, '1066063573', 'DANILO  MANDON QUINTERO', NULL, NULL, '1997-11-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1148536836', '2016-09-26', 1, NULL, NULL),
(17383, 2, 1, '1066063339', 'DANILO  PACHECO PAREDES', NULL, NULL, '1996-07-01', '0', 'dpachecop@ufpso.edu.co', NULL, '-788149082', '2014-12-18', 1, NULL, NULL),
(17384, 2, 1, '1193400824', 'DANILO ALFONSO MANOSALVA ANGARITA', NULL, NULL, '2000-08-02', '0', 'daniloalma02@gmail.com', NULL, '-1086333001', '2018-12-27', 1, NULL, NULL),
(17385, 1, 1, '1064086170', 'DANILO ANTONIO GALVIZ PALLARES', NULL, NULL, '2006-04-26', '0', 'danilogalvisgalvispallares@gmail.com', NULL, '-1171489407', '2013-06-13', 1, NULL, NULL),
(17386, 2, 1, '1091653183', 'DANILSON  MOLINA CHOGO', NULL, NULL, '1986-04-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1182479896', '2004-05-05', 1, NULL, NULL),
(17387, 2, 1, '1003257529', 'DANITZA  RUEDAS RUEDAS', NULL, NULL, '1988-01-27', '0', 'danitzaruedas3@gmail.com', NULL, '-1119700374', '2008-03-19', 1, NULL, NULL),
(17388, 2, 1, '1003257590', 'DANNA IRENE URIBE GALVIS', NULL, NULL, '2002-06-12', '0', 'duribegalvis@hotmail.com', NULL, '-1119160383', '2020-08-31', 1, NULL, NULL),
(17389, 2, 1, '1003257576', 'DANNA ISABELLA PABA ARIAS', NULL, NULL, '2000-12-22', '0', 'npabaarias@gmail.com', NULL, '-1160792452', '2018-12-27', 1, NULL, NULL),
(17390, 2, 1, '1003257476', 'DANNA PAULINA PABA RINCON', NULL, NULL, '2003-01-20', '0', 'paulinapaba1707@hotmail.com', NULL, '-1129798559', '2010-04-15', 1, NULL, NULL),
(17391, 2, 1, '1066062919', 'DANNILO  QUINTERO VERA', NULL, NULL, '1993-12-04', NULL, 'danniloquinterovera34@gmail.com', NULL, '-1081757281', '2011-12-12', 1, NULL, NULL),
(17392, 2, 1, '1066063754', 'DANUIL  MANZANO BOHORQUEZ', NULL, NULL, '1999-06-08', '0', 'sincorreo@sincorreo.com', NULL, '-1081669211', '2018-08-13', 1, NULL, NULL),
(17393, 2, 1, '1979748', 'DANULFO  CARVAJALINO PEREZ', NULL, NULL, '1950-08-15', '0', 'sincorreo@sincorreo.com', NULL, '-1170956333', '1979-09-25', 1, NULL, NULL),
(17394, 2, 1, '26774895', 'DARIA ELENA ANGARITA BOHORQUEZ', NULL, NULL, '1964-06-03', '0', 'sincorreo@sincorreo.com', NULL, '-1139268632', '1989-05-04', 1, NULL, NULL),
(17395, 2, 1, '1066062515', 'DARIEL ISNARDO DUARTE MANOSALVA', NULL, NULL, '1990-08-07', '0', 'darielisnardoduarte@gmail.com', NULL, '-1069090909', '2008-09-02', 1, NULL, NULL),
(17396, 2, 1, '5036342', 'DARIELSSONN  GOMEZ GARCIA', NULL, NULL, '1984-07-27', '0', 'sincorreo@sincorreo.com', NULL, '-1080186809', '2002-10-03', 1, NULL, NULL),
(17397, 2, 1, '1007367615', 'DARINEL  QUINTERO CASTRO', NULL, NULL, '1992-07-13', '0', 'sincorreo@sincorreo.com', NULL, '-1108051042', '2010-07-19', 1, NULL, NULL),
(17398, 2, 1, '1090989459', 'DARIO  MANOSALVA AGUILAR', NULL, NULL, '1996-06-12', NULL, 'dario.manozalva.152@omail.com', NULL, '-1186113409', '2014-07-09', 1, NULL, NULL),
(17399, 2, 1, '18917092', 'DARIO ANTONIO OJEDA CASTRO', NULL, NULL, '1961-01-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1180252451', '1981-03-18', 1, NULL, NULL),
(17400, 2, 1, '1066063349', 'DARITZA NAILUTH DUARTE PINEDA', NULL, NULL, '1996-10-29', '0', 'daritzaduarte893@gmail.com', NULL, '-1187330721', '2015-01-26', 1, NULL, NULL),
(17401, 1, 1, '1003121957', 'DARLY MARCELA PABA MOLINA', NULL, NULL, '2002-11-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1156801726', '2016-12-13', 1, NULL, NULL),
(17402, 2, 1, '1003122009', 'DARLY TATIANA ORTIZ CASTILLA', NULL, NULL, '2001-09-09', '0', 'darly0901@gmail.com', NULL, '-1061667265', '2019-09-23', 1, NULL, NULL),
(17403, 1, 1, '521032636', 'DARVIN EDUARDO PACHECO SUAREZ', NULL, NULL, '1995-01-03', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2002-09-30', 1, NULL, NULL),
(17404, 2, 1, '1066063143', 'DARWIN  NAVARRO CLAVIJO', NULL, NULL, '1995-05-04', '0', 'darwinnavarro2011@hotmail.com', NULL, '-1112652561', '2013-06-05', 1, NULL, NULL),
(17405, 2, 1, '88142033', 'DARWIN ABEIVE OSORIO DUARTE', NULL, NULL, '1968-11-04', '0', 'daod1968@gmail.com', NULL, '-1141236731', '1987-02-02', 1, NULL, NULL),
(17406, 2, 1, '1064842996', 'DARWIN ALEJANDRO AMAYA PALACIO', NULL, NULL, '1999-01-12', '0', 'darwin1999amayapalacio@gmail.com', NULL, '-1278413190', '2017-06-15', 1, NULL, NULL),
(17407, 2, 1, '1091676585', 'DARWIN ANDRES PRADO CASTRO', NULL, NULL, '1996-08-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1050119423', '2014-08-25', 1, NULL, NULL),
(17408, 2, 1, '1090987961', 'DARWIN ARLEY ANGARITA ANGARITA', NULL, NULL, '1993-10-19', '0', 'darwinangarita2017@gmail.com', NULL, '-1110728370', '2011-11-21', 1, NULL, NULL),
(17409, 2, 1, '1003257417', 'DARWIN EVELIO GALVIZ AYALA', NULL, NULL, '1994-01-28', NULL, 'darwingt500@hotmail.com', NULL, '-1080415015', '2012-05-07', 1, NULL, NULL),
(17410, 1, 1, '1003257644', 'DARWIN JESID PINEDA DUARTE', NULL, NULL, '2003-10-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1171359747', '2012-03-15', 1, NULL, NULL),
(17411, 2, 1, '37393367', 'DARY JIMENA QUINTERO MENESES', NULL, NULL, '1984-07-13', NULL, 'daryji777@hotmail.com', NULL, '-1156476854', '2002-08-05', 1, NULL, NULL),
(17412, 2, 1, '77093704', 'DAVID  DONADO MONTEJO', NULL, NULL, '1984-10-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1178943016', '2002-10-30', 1, NULL, NULL),
(17413, 2, 1, '5035644', 'DAVID  JACOME PAVA', NULL, NULL, '1972-02-05', '0', 'sincorreo@sincorreo.com', NULL, '-1281243383', '1993-09-01', 1, NULL, NULL),
(17414, 2, 1, '5466936', 'DAVID  RINCON SALAZAR', NULL, NULL, '1945-01-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1189326860', '1967-02-09', 1, NULL, NULL),
(17415, 2, 1, '88285409', 'DAVID OBED GUTIERREZ LINDARTE', NULL, NULL, '1979-03-05', '0', 'sincorreo@sincorreo.com', NULL, '-1088742425', '1997-04-29', 1, NULL, NULL),
(17416, 2, 1, '1093779060', 'DAVIDSON  MARTINEZ TAPIAS', NULL, NULL, '1995-06-18', '0', '08davidsonmartinez@gmail.com', NULL, '-1190302665', '2013-06-20', 1, NULL, NULL),
(17417, 2, 1, '1004863657', 'DAYANA  ALVAREZ RINCON', NULL, NULL, '2000-11-17', '0', 'alvarezrincondayana337@gmail.com', NULL, '-1092890947', '2018-12-26', 1, NULL, NULL),
(17418, 2, 1, '1066063201', 'DAYRO  PORTILLO ANGARITA', NULL, NULL, '1995-01-29', '0', 'sincorreo@sincorreo.com', NULL, '-1061711853', '2013-10-28', 1, NULL, NULL),
(17419, 2, 1, '37182777', 'DECCY MILENA CARRASCAL CARRASCAL', NULL, NULL, '1981-10-14', NULL, 'demica81@hotmail.com', NULL, '-1091200848', '2003-07-08', 1, NULL, NULL),
(17420, 2, 1, '5036227', 'DEIBER  DUARTE DUARTE', NULL, NULL, '1980-12-03', '0', 'sincorreo@sincorreo.com', NULL, '-1071798126', '1999-09-24', 1, NULL, NULL),
(17421, 1, 1, '1066062070', 'DEIMER ANDRES MARTINEZ GARCIA', NULL, NULL, '2004-04-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1150356994', '2019-01-18', 1, NULL, NULL),
(17422, 2, 1, '1091663682', 'DEIMER LIXANDRO ORTIZ SANCHEZ', NULL, NULL, '1988-12-12', '0', 'deimerlizandrosanchez@gmail.com', NULL, '-1061029369', '2008-05-15', 1, NULL, NULL),
(17423, 2, 1, '5036272', 'DEIMMAR  DURAN PORTILLO', NULL, NULL, '1982-07-29', '0', 'sincorreo@sincorreo.com', NULL, '-1187930315', '2000-07-29', 1, NULL, NULL),
(17424, 2, 1, '1095820025', 'DEINY MELISA QUINTERO PRADA', NULL, NULL, '1994-06-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1075319065', '2012-07-16', 1, NULL, NULL),
(17425, 2, 1, '26774799', 'DEISE  MANOSALVA PORTILLO', NULL, NULL, '1967-08-25', '0', 'sincorreo@sincorreo.com', NULL, '-1161955673', '1985-11-15', 1, NULL, NULL),
(17426, 2, 1, '26774683', 'DEISI MARIA SANTIAGO MOLINA', NULL, NULL, '1963-07-29', '0', 'sincorreo@sincorreo.com', NULL, '-1106042170', '1981-11-25', 1, NULL, NULL),
(17427, 2, 1, '1004899184', 'DEIVER  SANCHEZ ASCANIO', NULL, NULL, '1998-09-23', NULL, 'nacho.net@outlook.es', NULL, '-1178576744', '2017-02-06', 1, NULL, NULL),
(17428, 2, 1, '5428677', 'DEIVER  ZAPARDIEL MANOSALVA', NULL, NULL, '1985-07-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1169503161', '2003-07-29', 1, NULL, NULL),
(17429, 2, 1, '5469368', 'DEIVY JOSE ARIAS CANDANOSA', NULL, NULL, '1981-01-13', '0', 'darias1381@gmail.com', NULL, '-1182333103', '1999-05-19', 1, NULL, NULL),
(17430, 2, 1, '1004858402', 'DEIXI  VANEGAS GONZALEZ', NULL, NULL, '1988-04-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1187415134', '2006-06-21', 1, NULL, NULL),
(17431, 2, 1, '1090988100', 'DEIXON ANDRES CHINCHILLA SANGUINO', NULL, NULL, '1994-01-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1075268874', '2012-02-06', 1, NULL, NULL),
(17432, 2, 1, '37327751', 'DELIA  SANTANA RIOS', NULL, NULL, '1971-10-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1127835370', '1993-05-07', 1, NULL, NULL),
(17433, 2, 1, '26850672', 'DELIA MARIA MADARIAGA DE SANCHEZ', NULL, NULL, '1927-11-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1110833769', '1957-07-08', 1, NULL, NULL),
(17434, 2, 1, '43895794', 'DELIS MARGOT PEREZ BAQUERO', NULL, NULL, '1979-09-09', '0', 'perezdeli174@hotmail.com', NULL, '-1110941095', '1998-09-21', 1, NULL, NULL),
(17435, 2, 1, '37319206', 'DELLY MARIA PRADA MORA', NULL, NULL, '1965-02-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1091766729', '1985-05-06', 1, NULL, NULL),
(17436, 2, 1, '37369048', 'DELMIRA  OJEDA GONZALEZ', NULL, NULL, '1970-03-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1992-03-27', 1, NULL, NULL),
(17437, 2, 1, '88135807', 'DENIS ANTONIO JULIO RUEDAS', NULL, NULL, '1962-10-09', NULL, 'julio.rueda62@hotmail.com', NULL, '-1130796264', '1981-03-10', 1, NULL, NULL),
(17438, 2, 1, '13376953', 'DENIS DEL CARMEN GARCIA TORRES', NULL, NULL, '1971-07-19', '0', 'sincorreo@sincorreo.com', NULL, '-1071101871', '1989-09-25', 1, NULL, NULL),
(17439, 2, 1, '26774801', 'DENIS DEL CARMEN PABA JACOME', NULL, NULL, '1966-12-17', '0', 'sincorreo@sincorreo.com', NULL, '-1086861048', '1985-12-05', 1, NULL, NULL),
(17440, 2, 1, '26780600', 'DENIS MARIA RUEDAS GARCIA', NULL, NULL, '1961-08-20', '0', 'sincorreo@sincorreo.com', NULL, '-1129934295', '1982-12-02', 1, NULL, NULL),
(17441, 2, 1, '26774712', 'DENYS DEL CARMEN ALCINA TRIGOS', NULL, NULL, '1964-05-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1111322956', '1983-01-07', 1, NULL, NULL),
(17442, 2, 1, '37182482', 'DERLY YASMIN PORTILLO BACCA', NULL, NULL, '1985-02-12', '0', 'derly_1217@hotmail.com', NULL, '-1091837257', '2003-04-15', 1, NULL, NULL),
(17443, 2, 1, '1066063151', 'DEYBER JESUS BARBOSA RIVERA', NULL, NULL, '1995-06-18', NULL, 'monodejevari@hotmail.com', NULL, '-1179559095', '2013-06-19', 1, NULL, NULL),
(17444, 2, 1, '1091663761', 'DEYBI JANER MEZA VELASQUEZ', NULL, NULL, '1990-05-30', NULL, 'deibi3005@gmail.com', NULL, '-1141137890', '2008-06-04', 1, NULL, NULL),
(17445, 2, 1, '1091665263', 'DEYGNY YARLEY MOLINA PRADA', NULL, NULL, '1990-05-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1170960088', '2009-03-17', 1, NULL, NULL),
(17446, 2, 1, '5036192', 'DEYVID OSWALDO OSORIO MENDOZA', NULL, NULL, '1980-03-28', NULL, 'ingoswosme@yahoo.com', NULL, '-788981460', '1998-04-28', 1, NULL, NULL),
(17447, 2, 1, '37337646', 'DIANA  NORIEGA CASTRO', NULL, NULL, '1981-11-14', '0', 'dinoca2011@hotmail.com', NULL, '-1151590650', '2000-05-08', 1, NULL, NULL),
(17448, 2, 1, '26777309', 'DIANA LISED CHINCHILLA MOLINA', NULL, NULL, '1981-02-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1152119436', '1999-03-09', 1, NULL, NULL),
(17449, 2, 1, '1091659944', 'DIANA LISETH BALLESTEROS PEREZ', NULL, NULL, '1988-11-13', NULL, 'dlballesterosp@ufpso.edu.co', NULL, '-787949048', '2006-12-01', 1, NULL, NULL),
(17450, 2, 1, '26777352', 'DIANA MARCELA GARCIA DUARTE', NULL, NULL, '1981-12-23', '0', 'marcelagarciaduarte22@gmail.com', NULL, '-1138279341', '2000-07-13', 1, NULL, NULL),
(17451, 2, 1, '1004898307', 'DIANA MARCELA GARCIA PORTILLO', NULL, NULL, '2003-08-27', '0', 'dianagapo27@gmail.com', NULL, '-1148124784', '2021-08-31', 1, NULL, NULL),
(17452, 2, 1, '39461399', 'DIANA MARCELLA OSORIO VELEZ', NULL, NULL, '1984-12-04', '0', 'dianamov.9@gmail.com', NULL, '-1176309434', '2003-02-19', 1, NULL, NULL),
(17453, 2, 1, '1091664913', 'DIANA PAOLA DUARTE TRIGOS', NULL, NULL, '1990-10-25', NULL, 'dianaduartet@outlook.com', NULL, '-1171246613', '2009-01-14', 1, NULL, NULL),
(17454, 2, 1, '26777419', 'DIANA PATRICIA PINZON GRANADOS', NULL, NULL, '1982-12-16', '0', 'pinzondiana133@gmail.com', NULL, '-1122386040', '2002-04-04', 1, NULL, NULL),
(17455, 2, 1, '26774770', 'DIANID MARIA PICON MANTILLA', NULL, NULL, '1965-04-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1156859938', '1984-07-24', 1, NULL, NULL),
(17456, 2, 1, '1090986798', 'DIEGO  JACOME CARRASCAL', NULL, NULL, '1990-09-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1157889094', '2009-12-07', 1, NULL, NULL),
(17457, 2, 1, '1090990113', 'DIEGO  MADARRIAGA QUINTERO', NULL, NULL, '1997-09-07', '0', 'sincorreo@sincorreo.com', NULL, '-1142025628', '2015-09-09', 1, NULL, NULL),
(17458, 2, 1, '1066063499', 'DIEGO ALBERTO PICON ARTEAGA', NULL, NULL, '1997-06-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1128435646', '2016-03-14', 1, NULL, NULL),
(17459, 2, 1, '1066062181', 'DIEGO ALFREDO MENDOZA JACOME', NULL, NULL, '1987-11-18', NULL, 'damj87@hotmail.com', NULL, '-1108546031', '2006-01-10', 1, NULL, NULL),
(17460, 1, 1, '1066062457', 'DIEGO ANDRES ASCANIO SANTANA', NULL, NULL, '2008-01-25', '0', 'ascanio0125@gmail.com', NULL, NULL, '2015-01-28', 1, NULL, NULL),
(17461, 2, 1, '1007961906', 'DIEGO ARMANDO ALVAREZ SANTIAGO', NULL, NULL, '1997-11-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1161273663', '2016-05-13', 1, NULL, NULL),
(17462, 1, 1, '1064086046', 'DIEGO ARMANDO DURAN ESPINEL', NULL, NULL, '2004-08-03', '0', 'sincorreo@sincorreo.com', NULL, '-1070249759', '2018-09-11', 1, NULL, NULL),
(17463, 2, 1, '1091654558', 'DIEGO ARMANDO LOBO ARCINIEGAS', NULL, NULL, '1986-10-17', '0', 'sincorreo@sincorreo.com', NULL, '-1072250356', '2004-10-29', 1, NULL, NULL),
(17464, 2, 1, '1091655746', 'DIEGO ARMANDO MANOSALVA MANZANO', NULL, NULL, '1986-12-31', '0', 'diarmando57@hotmail.com', NULL, '-1134561903', '2005-03-16', 1, NULL, NULL),
(17465, 2, 1, '1066062057', 'DIEGO ARMANDO MANZANO NAVARRO', NULL, NULL, '1985-11-17', '0', 'rickyguarty@gmail.com', NULL, '-1191823361', '2004-04-21', 1, NULL, NULL),
(17466, 2, 1, '1004818652', 'DIEGO ARMANDO VERA CHINCHILLA', NULL, NULL, '1996-10-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1117130892', '2015-04-23', 1, NULL, NULL),
(17467, 2, 1, '1007283257', 'DIEGO FERNANDO SALAZAR PRADO', NULL, NULL, '1994-03-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1152085696', '2012-04-10', 1, NULL, NULL),
(17468, 2, 1, '88243097', 'DIGNAEL  HERNANDEZ MANDON', NULL, NULL, '1978-11-08', NULL, 'sincorreo@sincorreo.com', NULL, '-792479905', '1998-04-24', 1, NULL, NULL),
(17469, 2, 1, '1090435179', 'DIGNE ZULAY BECERRA LEON', NULL, NULL, '1991-05-31', '0', 'dignezulaybecerra@gmail.com', NULL, '-1087660922', '2009-06-08', 1, NULL, NULL),
(17470, 2, 1, '26774986', 'DIGNORA DEL CARMEN JOYA MOLINA', NULL, NULL, '1972-06-04', NULL, 'dignoradelc.2018@gmail.com', NULL, '-1176337511', '1992-05-28', 1, NULL, NULL),
(17471, 2, 1, '60299929', 'DILIA MARIA ANGARITA PALACIO', NULL, NULL, '1961-12-22', '0', 'sincorreo@sincorreo.com', NULL, '-1140254827', '1981-12-07', 1, NULL, NULL),
(17472, 2, 1, '37371935', 'DILIA MARIA GALVIZ VERGEL', NULL, NULL, '1976-05-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1062508434', '2001-02-16', 1, NULL, NULL),
(17473, 2, 1, '26774286', 'DILIA MARIA MOLINA NAVARRO', NULL, NULL, '1941-07-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1142072808', '1963-08-22', 1, NULL, NULL),
(17474, 2, 1, '1091664579', 'DILY ASTRID RUEDAS SERRANO', NULL, NULL, '1990-10-03', NULL, 'sincorreo@sincorreo.com', NULL, '-787722974', '2008-10-14', 1, NULL, NULL),
(17475, 2, 1, '1066062771', 'DINA MARCELA GALVIS PALLARES', NULL, NULL, '1992-03-05', '0', 'sincorreo@sincorreo.com', NULL, '-1152632165', '2010-08-03', 1, NULL, NULL),
(17476, 2, 1, '37367092', 'DIOCELINA  ASCANIO MARTINEZ', NULL, NULL, '1950-06-22', '0', 'sincorreo@sincorreo.com', NULL, '-1188895451', '1985-09-18', 1, NULL, NULL),
(17477, 2, 1, '37324679', 'DIOCELINA  CARRASCAL SALAZAR', NULL, NULL, '1971-11-13', '0', 'sincorreo@sincorreo.com', NULL, '-1189670381', '1990-08-30', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(17478, 2, 1, '26774721', 'DIOCELINA  DUARTE PORTILLO', NULL, NULL, '1959-11-15', '0', 'sincorreo@sincorreo.com', NULL, '-1091762149', '1983-02-28', 1, NULL, NULL),
(17479, 2, 1, '36605014', 'DIOCELINA  LOZANO SANTIAGO', NULL, NULL, '1947-01-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1156466930', '1970-01-05', 1, NULL, NULL),
(17480, 2, 1, '13377563', 'DIOFANER  CONTRERAS BECERRA', NULL, NULL, '1973-06-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1084972904', '1991-08-13', 1, NULL, NULL),
(17481, 2, 1, '88142567', 'DIOFANOR  AMAYA GARZON', NULL, NULL, '1967-07-30', '0', 'sincorreo@sincorreo.com', NULL, '-1186568343', '1987-06-09', 1, NULL, NULL),
(17482, 2, 1, '5426827', 'DIOFANOR  PEREZ JACOME', NULL, NULL, '1981-04-07', '0', 'sincorreo@sincorreo.com', NULL, '-1169967952', '1999-08-06', 1, NULL, NULL),
(17483, 2, 1, '88278302', 'DIOFANOR  RINCON LEON', NULL, NULL, '1974-01-19', NULL, 'diofanorrl@hotmail.com', NULL, '-1192570737', '1993-03-05', 1, NULL, NULL),
(17484, 2, 1, '5036252', 'DIOGENES  DUARTE SOLANO', NULL, NULL, '1974-11-15', '0', 'sincorreo@sincorreo.com', NULL, '-1171496743', '2010-07-30', 1, NULL, NULL),
(17485, 2, 1, '5459432', 'DIOMAR  GARCIA', NULL, NULL, '1969-10-18', '0', 'sincorreo@sincorreo.com', NULL, '-1136777523', '1987-10-19', 1, NULL, NULL),
(17486, 2, 1, '5035669', 'DIOMAR  MOLINA QUINTERO', NULL, NULL, '1976-03-25', '0', 'sincorreo@sincorreo.com', NULL, '-1070262895', '1994-06-30', 1, NULL, NULL),
(17487, 2, 1, '5035544', 'DIOMAR  ORTEGA LOZANO', NULL, NULL, '1972-11-06', '0', 'diceyuni@hotmail.com', NULL, '-1130152916', '1991-02-05', 1, NULL, NULL),
(17488, 2, 1, '1091661131', 'DIOMAR ALEXIS ROJAS JAIME', NULL, NULL, '1989-05-01', '0', 'alexisjaime01@gmail.com', NULL, '-1189122785', '2007-05-15', 1, NULL, NULL),
(17489, 2, 1, '1979988', 'DIOMAR ANTONIO ASCANIO SANGUINO', NULL, NULL, '1977-11-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1160842490', '1998-10-05', 1, NULL, NULL),
(17490, 2, 1, '88139043', 'DIOMAR ANTONIO DUARTE QUINTERO', NULL, NULL, '1965-01-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1152642119', '1983-12-12', 1, NULL, NULL),
(17491, 2, 1, '5035648', 'DIOMAR ANTONIO LOBO ARCINIEGAS', NULL, NULL, '1975-07-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1189010387', '1993-09-30', 1, NULL, NULL),
(17492, 2, 1, '5035673', 'DIOMAR ANTONIO MANOSALVA FELIZZOLA', NULL, NULL, '1976-05-17', '0', 'sincorreo@sincorreo.com', NULL, '-1169535399', '1994-06-30', 1, NULL, NULL),
(17493, 2, 1, '1946549', 'DIOMAR DE JESUS REYES PEREZ', NULL, NULL, '1961-03-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1107045403', '1981-10-20', 1, NULL, NULL),
(17494, 1, 1, '1007961891', 'DIOMAR SEBASTIAN REYES ANGARITA', NULL, NULL, '2003-06-11', NULL, 'sebasrey755@gmail.com', NULL, '-1170093714', '2017-07-24', 1, NULL, NULL),
(17495, 2, 1, '88283236', 'DIOMEDES  BAYONA AMAYA', NULL, NULL, '1977-07-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1119179836', '1995-09-17', 1, NULL, NULL),
(17496, 2, 1, '1977438', 'DIOMEDES  GARCIA GRANADOS', NULL, NULL, '1977-03-11', '0', 'sincorreo@sincorreo.com', NULL, '-1170177618', '1997-09-23', 1, NULL, NULL),
(17497, 2, 1, '1066062187', 'DIOMEDES DE JESUS VERA SANTIAGO', NULL, NULL, '1987-11-19', NULL, 'diomedesvera1@hotmail.com', NULL, '-1127196388', '2006-02-02', 1, NULL, NULL),
(17498, 2, 1, '1090473437', 'DIOMEISE  PE?ARANDA GARNICA', NULL, NULL, '1993-10-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1171773377', '2012-02-21', 1, NULL, NULL),
(17499, 2, 1, '5426870', 'DIONEL  CASTILLA CHINCHILLA', NULL, NULL, '1979-12-21', '0', 'sincorreo@sincorreo.com', NULL, '-1161167392', '1999-09-16', 1, NULL, NULL),
(17500, 2, 1, '5036113', 'DIONEL  CONTRERAS PORTILLO', NULL, NULL, '1977-10-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1088691002', '1996-07-12', 1, NULL, NULL),
(17501, 2, 1, '1066062010', 'DIONEL  PABA LOBO', NULL, NULL, '1985-01-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1178707711', '2004-02-19', 1, NULL, NULL),
(17502, 2, 1, '1007245188', 'DIONEL  PAEZ CASTILLA', NULL, NULL, '1986-08-13', '0', 'leonelpaez956@gmail.com', NULL, '-1072029773', '2005-08-12', 1, NULL, NULL),
(17503, 2, 1, '13169199', 'DIONEL  RUEDAS URQUIJO', NULL, NULL, '1980-12-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1080441149', '1999-04-15', 1, NULL, NULL),
(17504, 2, 1, '1004858867', 'DIONEL  SOLANO YARURO', NULL, NULL, '1985-04-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1272162974', '2005-04-22', 1, NULL, NULL),
(17505, 2, 1, '1065853379', 'DIONEL DAVID SUAREZ URBINA', NULL, NULL, '1998-08-28', '0', 'sincorreo@sincorreo.com', NULL, '-1181506344', '2017-12-07', 1, NULL, NULL),
(17506, 2, 1, '1090989406', 'DIONERGY  GARCIA DURAN', NULL, NULL, '1996-05-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1176126060', '2014-05-20', 1, NULL, NULL),
(17507, 1, 1, '1064086193', 'DIONICIO  GUTIERREZ CHINCHILLA', NULL, NULL, '2007-02-18', '0', 'duartefabio984@gmail.com', NULL, '-1152462513', '2014-02-24', 1, NULL, NULL),
(17508, 2, 1, '77186341', 'DIORGEN  QUINTERO BARBOSA', NULL, NULL, '1975-12-30', NULL, 'sileniquintero.sq@gmail.com', NULL, '-1272093342', '1994-10-31', 1, NULL, NULL),
(17509, 2, 1, '1007406900', 'DIOS EBEL SOLANO YARURO', NULL, NULL, '1989-12-18', '0', 'solanoyeison734@gmail.com', NULL, '-1137977349', '2008-02-18', 1, NULL, NULL),
(17510, 2, 1, '13375676', 'DIOS EMEL CONTRERAS LOPEZ', NULL, NULL, '1967-12-25', '0', 'sincorreo@sincorreo.com', NULL, '-1190441415', '1987-02-20', 1, NULL, NULL),
(17511, 2, 1, '26780592', 'DIOSA  NORIEGA DE CARRASCAL', NULL, NULL, '1954-10-28', '0', 'sincorreo@sincorreo.com', NULL, '-1128480027', '1977-07-12', 1, NULL, NULL),
(17512, 2, 1, '26774896', 'DIOSA  RIVERA NAVARRO', NULL, NULL, '1970-02-01', NULL, 'sincorreo@sincorreo.com', NULL, '-786891734', '1989-05-04', 1, NULL, NULL),
(17513, 2, 1, '26767831', 'DIOSA EMIRA MALDONADO DIAZ', NULL, NULL, '1983-06-26', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2002-04-01', 1, NULL, NULL),
(17514, 2, 1, '26774338', 'DIOSA MARIA CHINCHILLA DE DUARTE', NULL, NULL, '1940-12-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1129812080', '1966-09-15', 1, NULL, NULL),
(17515, 2, 1, '88150367', 'DIOSELIN  AMAYA SALAZAR', NULL, NULL, '1973-02-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1151402850', '1992-08-19', 1, NULL, NULL),
(17516, 2, 1, '26779717', 'DIOSELINA  ALVAREZ DE QUINTERO', NULL, NULL, '1952-12-29', '0', 'sincorreo@sincorreo.com', NULL, '-1136516494', '1974-01-21', 1, NULL, NULL),
(17517, 2, 1, '37311072', 'DIOSELINA  GRANADOS GRANADOS', NULL, NULL, '1956-01-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1079031211', '1977-08-04', 1, NULL, NULL),
(17518, 2, 1, '26775087', 'DIOSELINA  MENDOZA QUINTERO', NULL, NULL, '1976-11-17', '0', 'dioselina1711@hotmail.com', NULL, '-1176946129', '1995-08-29', 1, NULL, NULL),
(17519, 2, 1, '26778147', 'DIOSELINA  PEÃ‘ARANDA DE VARGAS', NULL, NULL, '1953-12-06', '0', 'sincorreo@sincorreo.com', NULL, '-1167568017', '1976-12-22', 1, NULL, NULL),
(17520, 2, 1, '26777164', 'DIOSELINA  QUINTERO', NULL, NULL, '1965-09-24', '0', 'sincorreo@sincorreo.com', NULL, '-1160209871', '1985-08-29', 1, NULL, NULL),
(17521, 2, 1, '5035416', 'DIOSEMEL  CARRASCAL GARCIA', NULL, NULL, '1965-08-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1191847251', '1987-12-14', 1, NULL, NULL),
(17522, 2, 1, '5036217', 'DIOSEMEL  GOMEZ DUARTE', NULL, NULL, '1978-04-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1082019368', '1999-07-26', 1, NULL, NULL),
(17523, 2, 1, '5035604', 'DIOSEMEL  MOLINA QUINTERO', NULL, NULL, '1974-02-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1176366239', '1992-05-27', 1, NULL, NULL),
(17524, 2, 1, '5036128', 'DIOSEMEL  SOLANO DUARTE', NULL, NULL, '1972-04-12', '0', 'sincorreo@sincorreo.com', NULL, '-1066691139', '1996-12-14', 1, NULL, NULL),
(17525, 2, 1, '5036147', 'DIOSEMIRO  DURAN ASCANIO', NULL, NULL, '1977-11-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1156479708', '1997-03-25', 1, NULL, NULL),
(17526, 2, 1, '37181591', 'DIOSIRA  TRILLOS MOLINA', NULL, NULL, '1984-04-22', NULL, 'diosiratrillos2208@gmail.com', NULL, '-1119293493', '2002-10-10', 1, NULL, NULL),
(17527, 2, 1, '5036222', 'DIOSITH  PEREZ JACOME', NULL, NULL, '1981-05-05', '0', 'sincorreo@sincorreo.com', NULL, '-1171555460', '1999-08-30', 1, NULL, NULL),
(17528, 2, 1, '26777249', 'DIVA ESTHER CASADIEGOS GARZON', NULL, NULL, '1975-12-02', '0', 'divacasadiegos231@gmail.com', NULL, '-1150641974', '1997-05-30', 1, NULL, NULL),
(17529, 2, 1, '26676504', 'DOLLY TERESA TRUJILLO QUINTERO', NULL, NULL, '1955-10-19', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1976-01-17', 1, NULL, NULL),
(17530, 2, 1, '5035682', 'DONALDO JAVIER MANOSALVA DUARTE', NULL, NULL, '1976-08-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1090389254', '1994-10-31', 1, NULL, NULL),
(17531, 2, 1, '26774574', 'DORA  IBARRA DE RUEDAS', NULL, NULL, '1940-09-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1150608301', '1977-03-09', 1, NULL, NULL),
(17532, 2, 1, '26774524', 'DORA  QUINTERO VDA DE MOLINA', NULL, NULL, '1953-11-10', '0', 'sincorreo@sincorreo.com', NULL, '-1107598878', '1976-01-17', 1, NULL, NULL),
(17533, 2, 1, '49640007', 'DORA CECILIA SANCHEZ DUARTE', NULL, NULL, '1957-06-30', '0', 'sincorreo@sincorreo.com', NULL, '-1156009593', '1976-01-17', 1, NULL, NULL),
(17534, 2, 1, '26774291', 'DORA MARIA SANTIAGO DE SANCHEZ', NULL, NULL, '1938-05-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1963-10-02', 1, NULL, NULL),
(17535, 2, 1, '36500441', 'DORA ZENAIDA SANTANA TORRES', NULL, NULL, '1955-04-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1119916204', '1974-01-15', 1, NULL, NULL),
(17536, 2, 1, '37334187', 'DORAIS  NAVARRO CASTRO', NULL, NULL, '1979-02-12', '0', 'sincorreo@sincorreo.com', NULL, '-1168015542', '1998-01-20', 1, NULL, NULL),
(17537, 2, 1, '26774659', 'DORALBA  MENDOZA SANTIAGO', NULL, NULL, '1959-09-16', '0', 'doralbamendoza16@gmail.com', NULL, '-1119245584', '1981-03-11', 1, NULL, NULL),
(17538, 2, 1, '37329675', 'DORIS  QUINTERO LOZANO', NULL, NULL, '1974-05-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1070746423', '1994-10-31', 1, NULL, NULL),
(17539, 2, 1, '37322918', 'DORIS  TRIGOS QUINTERO', NULL, NULL, '1965-01-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1152642119', '1989-02-09', 1, NULL, NULL),
(17540, 2, 1, '37325619', 'DORIS ELENA PICON LOPEZ', NULL, NULL, '1969-05-15', '0', 'dorispicon7@hotmail.com', NULL, '-1162937380', '1991-04-02', 1, NULL, NULL),
(17541, 2, 1, '26774664', 'DORIS MARIA ANGARITA RIOS', NULL, NULL, '1960-04-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1187666897', '1981-05-08', 1, NULL, NULL),
(17542, 2, 1, '26775056', 'DORIS MARIA JAIME BONETH', NULL, NULL, '1975-11-22', '0', 'dorisjaimeboneth@gmail.com', NULL, '-1106101581', '1994-06-20', 1, NULL, NULL),
(17543, 2, 1, '26777211', 'DORIS MARIA SANTIAGO QUINTERO', NULL, NULL, '1979-01-20', '0', 'sincorreo@sincorreo.com', NULL, '-1151026710', '1997-04-30', 1, NULL, NULL),
(17544, 2, 1, '37367519', 'DORIS MARIA TRUJILLO PAEZ', NULL, NULL, '1969-03-09', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1987-05-14', 1, NULL, NULL),
(17545, 2, 1, '26774836', 'DORQUIS  GUTIERREZ PALLAREZ', NULL, NULL, '1967-02-19', '0', 'sincorreo@sincorreo.com', NULL, '-1188464615', '1987-09-02', 1, NULL, NULL),
(17546, 2, 1, '26774918', 'DORYS LAUDDIT OSORIO RIOS', NULL, NULL, '1971-02-23', '0', 'dorislauddit@hotmail.com', NULL, '-1121560566', '1989-12-11', 1, NULL, NULL),
(17547, 2, 1, '6318408', 'DOUGLAS  MERCHANCANO SANCHEZ', NULL, NULL, '1967-07-11', NULL, 'alvarin2312@hotmail.com', NULL, '-1120777437', '1985-12-02', 1, NULL, NULL),
(17548, 2, 1, '26767326', 'DUPERLY  AREVALO CARRASCAL', NULL, NULL, '1980-07-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1149460119', '1998-08-13', 1, NULL, NULL),
(17549, 2, 1, '1007957874', 'DUVAN  JACOME CARRASCAL', NULL, NULL, '1998-04-06', '0', 'duvancarrascal20@hotmail.com', NULL, '-1147914769', '2016-12-07', 1, NULL, NULL),
(17550, 2, 1, '1066063372', 'DUVAN  LOBO LOBO', NULL, NULL, '1997-02-15', '0', 'sincorreo@sincorreo.com', NULL, '-1085022601', '2015-03-10', 1, NULL, NULL),
(17551, 2, 1, '1066063262', 'DUVAN  QUINTERO JACOME', NULL, NULL, '1996-05-15', '0', 'quinteroduvan19@gmail.com', NULL, '-1075541033', '2014-05-19', 1, NULL, NULL),
(17552, 2, 1, '1094278708', 'DUVAN FERNANDO SANCHEZ RUEDAS', NULL, NULL, '1996-12-30', NULL, 'dufer9612@gmail.com', NULL, '-1162054955', '2015-03-12', 1, NULL, NULL),
(17553, 2, 1, '1091660533', 'DUVAN JESUS BAYONA SANTIAGO', NULL, NULL, '1989-02-19', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2007-02-22', 1, NULL, NULL),
(17554, 2, 1, '88284601', 'DUVER  SANCHEZ LOZANO', NULL, NULL, '1978-08-10', '0', 'duversan_@hotmail.com', NULL, '-1119139852', '1996-10-01', 1, NULL, NULL),
(17555, 2, 1, '1003257563', 'DUVER FABIAN GOMEZ DUARTE', NULL, NULL, '1999-02-06', '0', 'duvergomez65@gmail.com', NULL, '-1161714064', '2017-03-24', 1, NULL, NULL),
(17556, 2, 1, '1192920478', 'DUVIS YURAINER RODRIQUEZ SIERRA', NULL, NULL, '1995-07-19', NULL, 'duvisrosi@gmail.com', NULL, '-1080345246', '2014-03-31', 1, NULL, NULL),
(17557, 2, 1, '1064836748', 'EDDY JOHANA CA?IZARES VARGAS', NULL, NULL, '1986-05-02', '0', 'sincorreo@sincorreo.com', NULL, '-1146840983', '2005-03-08', 1, NULL, NULL),
(17558, 2, 1, '1066062399', 'EDDY JOHANA CONTRERAS NAVARRO', NULL, NULL, '1989-01-27', '0', 'sincorreo@sincorreo.com', NULL, '-1150330162', '2007-07-03', 1, NULL, NULL),
(17559, 2, 1, '5035531', 'EDEL  RUEDAS IBARRA', NULL, NULL, '1972-04-15', '0', 'sincorreo@sincorreo.com', NULL, '-1141936421', '1990-09-05', 1, NULL, NULL),
(17560, 2, 1, '5036264', 'EDELSO JOSE AVENDA?O LUNA', NULL, NULL, '1982-04-27', NULL, 'chorrito0427@hotmail.com', NULL, '-1080398909', '2000-07-07', 1, NULL, NULL),
(17561, 2, 1, '5035339', 'EDGAR  ASCANIO PEREZ', NULL, NULL, '1969-09-19', '0', 'edgarascinio@gmail.com', NULL, '-1108848403', '1985-12-09', 1, NULL, NULL),
(17562, 2, 1, '5036326', 'EDGAR  MANZANO BOHORQUEZ', NULL, NULL, '1984-06-19', '0', 'sincorreo@sincorreo.com', NULL, '-1189485204', '2002-07-17', 1, NULL, NULL),
(17563, 2, 1, '88143763', 'EDGAR  MANZANO MANZANO', NULL, NULL, '1970-03-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1192020220', '1988-07-25', 1, NULL, NULL),
(17564, 2, 1, '88278771', 'EDGAR  PAVA JACOME', NULL, NULL, '1973-05-31', '0', 'sincorreo@sincorreo.com', NULL, '-1169300279', '1991-11-07', 1, NULL, NULL),
(17565, 2, 1, '5035646', 'EDGAR  RUEDA RINCON', NULL, NULL, '1975-08-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1082074055', '1993-09-09', 1, NULL, NULL),
(17566, 2, 1, '13378070', 'EDGAR  TORRES VERA', NULL, NULL, '1975-01-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1172823061', '1993-03-08', 1, NULL, NULL),
(17567, 2, 1, '5036276', 'EDGAR ANTONIO PACHECO MOLINA', NULL, NULL, '1982-07-19', '0', 'edgarantoniopacheco5molina@gmail.com', NULL, '-1150897979', '2000-07-28', 1, NULL, NULL),
(17568, 2, 1, '5035524', 'EDGAR CELIAR HERNANDEZ MANDON', NULL, NULL, '1971-03-01', '0', 'sincorreo@sincorreo.com', NULL, '-1082435015', '1990-06-28', 1, NULL, NULL),
(17569, 2, 1, '5035499', 'EDIGNAEL  CARRILLO CASADIEGOS', NULL, NULL, '1970-10-31', '0', 'sincorreo@sincorreo.com', NULL, '-1091250717', '1989-07-27', 1, NULL, NULL),
(17570, 2, 1, '26774887', 'EDILIA  GALVIZ PACHECO', NULL, NULL, '1965-08-26', '0', 'sincorreo@sincorreo.com', NULL, '-1079839078', '1989-02-24', 1, NULL, NULL),
(17571, 2, 1, '49640015', 'EDILIA  PORTILLO DUARTE', NULL, NULL, '1958-12-16', '0', 'sincorreo@sincorreo.com', NULL, '-1175976790', '1977-07-12', 1, NULL, NULL),
(17572, 2, 1, '36600014', 'EDILIA EMMA BAYONA DE CASADIEGOS', NULL, NULL, '1953-12-06', '0', 'sincorreo@sincorreo.com', NULL, '-1106498177', '1977-09-07', 1, NULL, NULL),
(17573, 2, 1, '26774885', 'EDILIA ROSA MOLINA DUARTE', NULL, NULL, '1967-05-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1117278353', '1989-02-24', 1, NULL, NULL),
(17574, 2, 1, '37366180', 'EDILMA  MADARIAGA PORTILLO', NULL, NULL, '1962-07-02', '0', 'sincorreo@sincorreo.com', NULL, '-1169323664', '1981-11-19', 1, NULL, NULL),
(17575, 2, 1, '26775033', 'EDILMA  MANZANO DURAN', NULL, NULL, '1974-12-31', '0', 'manzanoduranedilma@gmail.com', NULL, '-1160845589', '1993-09-13', 1, NULL, NULL),
(17576, 2, 1, '37369333', 'EDILMA  QUINTERO GUERRERO', NULL, NULL, '1972-10-19', '0', 'sincorreo@sincorreo.com', NULL, '-1092645283', '1993-04-15', 1, NULL, NULL),
(17577, 2, 1, '37316748', 'EDILMA DEL CARMEN SALAZAR LOBO', NULL, NULL, '1964-01-10', '0', 'sincorreo@sincorreo.com', NULL, '-1129498046', '1983-02-07', 1, NULL, NULL),
(17578, 2, 1, '5035104', 'EDILMO ANTONIO RUEDAS MANOSALVA', NULL, NULL, '1959-12-23', '0', 'sincorreo@sincorreo.com', NULL, '-1162487721', '1979-09-28', 1, NULL, NULL),
(17579, 2, 1, '49672077', 'EDILSA  CLAVIJO FRANCO', NULL, NULL, '1981-12-31', '0', 'sincorreo@sincorreo.com', NULL, '-1148351392', '2002-04-26', 1, NULL, NULL),
(17580, 2, 1, '26777341', 'EDILSA  GUERRERO', NULL, NULL, '1976-07-17', '0', 'sincorreo@sincorreo.com', NULL, '-1119745906', '2000-05-17', 1, NULL, NULL),
(17581, 2, 1, '1066062547', 'EDILSA  MANZANO BOHORQUEZ', NULL, NULL, '1990-10-27', '0', 'manzanobohorqueze@gmail.com', NULL, '-1112101018', '2008-11-10', 1, NULL, NULL),
(17582, 2, 1, '1007348667', 'EDILSA  SOLANO YARURO', NULL, NULL, '1988-01-19', '0', 'sincorreo@sincorreo.com', NULL, '-1150490778', '2007-07-19', 1, NULL, NULL),
(17583, 2, 1, '26774771', 'EDILSA MARIA GARZON CASADIEGOS', NULL, NULL, '1965-05-11', '0', 'sincorreo@sincorreo.com', NULL, '-1148090411', '1984-10-04', 1, NULL, NULL),
(17584, 2, 1, '42435050', 'EDILSE  CARRILLO CARDENAS', NULL, NULL, '1963-02-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1150995018', '1981-12-14', 1, NULL, NULL),
(17585, 2, 1, '1090983581', 'EDILSON  GARZON DURAN', NULL, NULL, '1987-07-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1168835855', '2005-07-21', 1, NULL, NULL),
(17586, 2, 1, '1090986412', 'EDIMER  MONROY QUINTERO', NULL, NULL, '1990-11-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1171496543', '2009-05-28', 1, NULL, NULL),
(17587, 2, 1, '5036350', 'EDINSON JAIR OSORIO LOZANO', NULL, NULL, '1985-02-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1085041600', '2003-02-28', 1, NULL, NULL),
(17588, 2, 1, '1003121959', 'EDINSON MARIANO ROPERO JOYA', NULL, NULL, '2000-08-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1176337511', '2018-08-13', 1, NULL, NULL),
(17589, 2, 1, '49662651', 'EDIS  ANGARITA DUARTE', NULL, NULL, '1975-04-15', '0', 'sincorreo@sincorreo.com', NULL, '-1176616827', '1983-09-03', 1, NULL, NULL),
(17590, 2, 1, '37325094', 'EDITH  CA?IZARES QUINTERO', NULL, NULL, '1972-04-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1131423665', '1990-10-25', 1, NULL, NULL),
(17591, 2, 1, '1066062262', 'EDITH  LOPEZ CARDENAS', NULL, NULL, '1987-12-26', '0', 'sincorreo@sincorreo.com', NULL, '-1067691923', '2011-03-09', 1, NULL, NULL),
(17592, 2, 1, '26777406', 'EDITH JOHANA SANCHEZ BOHORQUEZ', NULL, NULL, '1983-10-03', '0', 'edithbohorquez543@gmail.com', NULL, '-1170604096', '2001-12-26', 1, NULL, NULL),
(17593, 2, 1, '26774546', 'EDITH MARIA MARTINEZ RINCON', NULL, NULL, '1956-12-04', '0', 'sincorreo@sincorreo.com', NULL, '-1179059377', '1976-01-17', 1, NULL, NULL),
(17594, 2, 1, '26777386', 'EDITH TORCOROMA CARDENAS SERRANO', NULL, NULL, '1982-02-17', '0', 'sincorreo@sincorreo.com', NULL, '-1072932486', '2001-07-05', 1, NULL, NULL),
(17595, 2, 1, '1066062145', 'EDITH YOHANA FRANCO CASADIEGOS', NULL, NULL, '1983-12-20', '0', 'edithyohanaf@gmail.com', NULL, '-1180076539', '2005-09-16', 1, NULL, NULL),
(17596, 2, 1, '26777437', 'EDITH YOJANA PABA PABA', NULL, NULL, '1983-01-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1085536583', '2002-08-01', 1, NULL, NULL),
(17597, 2, 1, '1091593896', 'EDIXON  PEÃ‘ARANDA RUEDAS', NULL, NULL, '1989-09-07', '0', 'penarandaedixon@gmail.com', NULL, '-1192300436', '2008-03-17', 1, NULL, NULL),
(17598, 2, 1, '5036213', 'EDIXON  TRILLOS MOLINA', NULL, NULL, '1980-06-12', '0', 'sincorreo@sincorreo.com', NULL, '-1078826520', '1999-10-19', 1, NULL, NULL),
(17599, 2, 1, '1066062204', 'EDNA JUDYTH CASTILLA MOLINA', NULL, NULL, '1986-08-14', '0', 'patico2786@hotmail.com', NULL, '-1080985066', '2006-02-27', 1, NULL, NULL),
(17600, 2, 1, '5426668', 'EDUAN JESUS GARZON MENESES', NULL, NULL, '1980-06-18', NULL, 'eduanjg@gmail.com', NULL, '-1071423250', '1999-02-18', 1, NULL, NULL),
(17601, 2, 1, '1066062169', 'EDUAR  GUTIERREZ QUINTERO', NULL, NULL, '1987-08-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1066181706', '2005-11-16', 1, NULL, NULL),
(17602, 2, 1, '1066062042', 'EDUAR  PORTILLO MENDOZA', NULL, NULL, '1986-01-01', '0', 'sincorreo@sincorreo.com', NULL, '-1091226766', '2004-03-23', 1, NULL, NULL),
(17603, 2, 1, '1193513986', 'EDUAR  RUEDA CARRASCAL', NULL, NULL, '2001-05-09', NULL, 'eruedac@ufpso.edu.co', NULL, '-1089036477', '2019-06-14', 1, NULL, NULL),
(17604, 2, 1, '1066062483', 'EDUAR JULIAN MOLINA ROMERO', NULL, NULL, '1990-01-01', '0', 'eduarmare31@hotmail.com', NULL, '-1161627922', '2008-05-19', 1, NULL, NULL),
(17605, 2, 1, '1091664922', 'EDUARD ALONSO GAONA MANOSALVA', NULL, NULL, '1990-08-22', '0', 'sincorreo@sincorreo.com', NULL, '-1192439733', '2009-01-15', 1, NULL, NULL),
(17606, 2, 1, '1066062702', 'EDUARDO  DUARTE DUARTE', NULL, NULL, '1991-09-20', '0', 'eduardoduarteduarte194@gmail.com', NULL, '-1170643845', '2009-10-26', 1, NULL, NULL),
(17607, 2, 1, '1733907', 'EDUARDO  MOLINA BALLESTERO', NULL, NULL, '1946-10-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1086613854', '1968-11-08', 1, NULL, NULL),
(17608, 2, 1, '1110173921', 'EDUARDO  VILLARRAGA YATE', NULL, NULL, '1987-10-24', '0', 'eduardovillarraga7@gmail.com', NULL, '-1187182702', '2005-12-19', 1, NULL, NULL),
(17609, 2, 1, '1091665692', 'EDUARDO ALFONSO DUARTE GALVIZ', NULL, NULL, '1991-04-29', '0', 'sincorreo@sincorreo.com', NULL, '-1160708388', '2009-06-10', 1, NULL, NULL),
(17610, 2, 1, '88140476', 'EDUARDO HELI URQUIJO PALLAREZ', NULL, NULL, '1962-01-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1150518252', '1985-05-09', 1, NULL, NULL),
(17611, 2, 1, '1102821858', 'EDUARDO LUIS CUELLO SANTOS', NULL, NULL, '1988-11-14', NULL, 'cuellosantoseduardoluis@gmail.com', NULL, '-1171943191', '2007-02-07', 1, NULL, NULL),
(17612, 2, 1, '5035111', 'EDUBIN  GALVIS PACHECO', NULL, NULL, '1960-12-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1169173685', '1979-11-28', 1, NULL, NULL),
(17613, 2, 1, '1066062988', 'EDUWIN  PAREDES SANCHEZ', NULL, NULL, '1994-03-11', '0', 'eduwinparedessanchez9@gmail.com', NULL, '-1167371449', '2012-04-16', 1, NULL, NULL),
(17614, 2, 1, '1066062118', 'EDWARD ARMANDO RIOS CARRILLO', NULL, NULL, '1987-06-21', NULL, 'earmandorios@gmail.com', NULL, '-1152785208', '2005-07-07', 1, NULL, NULL),
(17615, 2, 1, '5036260', 'EDWIN  CASADIEGOS MANDON', NULL, NULL, '1981-11-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1127842586', '2000-04-18', 1, NULL, NULL),
(17616, 2, 1, '13177227', 'EDWIN  DUARTE DUARTE', NULL, NULL, '1984-10-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1158971134', '2002-11-18', 1, NULL, NULL),
(17617, 2, 1, '13177963', 'EDWIN  GARCIA', NULL, NULL, '1985-02-18', '0', 'navarrogwed@gmail.com', NULL, '-1128109541', '2003-05-12', 1, NULL, NULL),
(17618, 2, 1, '1090984527', 'EDWIN  MANOSALVA AGUILAR', NULL, NULL, '1988-02-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1089737640', '2006-10-23', 1, NULL, NULL),
(17619, 2, 1, '5036212', 'EDWIN  QUINTERO DUARTE', NULL, NULL, '1979-12-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1080419752', '1999-04-28', 1, NULL, NULL),
(17620, 2, 1, '5035622', 'EDWIN ARMANDO GARCIA OSORIO', NULL, NULL, '1974-07-31', NULL, 'antama74@hotmail.com', NULL, '-1156806456', '1992-11-30', 1, NULL, NULL),
(17621, 2, 1, '5036117', 'EDWIN JAVIER QUINTERO ANGARITA', NULL, NULL, '1978-04-15', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1996-10-31', 1, NULL, NULL),
(17622, 2, 1, '1064836641', 'EDWIN JHOAN SANTIAGO LOZANO', NULL, NULL, '1986-03-29', '0', '30633.ipk@gmail.com', NULL, '-1066406256', '2005-01-12', 1, NULL, NULL),
(17623, 2, 1, '13176814', 'EDWUIN  DUARTE PINEDA', NULL, NULL, '1984-07-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1160976320', '2002-08-29', 1, NULL, NULL),
(17624, 2, 1, '5036093', 'EDWUIN EMIRO GALVIZ GERARDINO', NULL, NULL, '1976-06-07', '5650564', 'edwinga79@hotmail.com', NULL, NULL, '1997-03-14', 1, NULL, NULL),
(17625, 2, 1, '1066063042', 'EDY YOJANA PEÃ‘ARANDA TORRADO', NULL, NULL, '1994-04-16', '0', 'sincorreo@sincorreo.com', NULL, '-1182894224', '2012-08-27', 1, NULL, NULL),
(17626, 2, 1, '13373012', 'EFRAIN  PABA JACOME', NULL, NULL, '1960-12-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1177291224', '1979-05-17', 1, NULL, NULL),
(17627, 2, 1, '88279708', 'EFRAIN  QUINTERO SANTIAGO', NULL, NULL, '1974-08-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1149465453', '1992-10-28', 1, NULL, NULL),
(17628, 2, 2, '88289913', 'EFRAIN  SERRANO CASTELLANOS', NULL, NULL, '1980-10-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1160935174', '2000-06-28', 1, NULL, NULL),
(17629, 2, 1, '5084848', 'EFRAIN ANTONIO QUINTERO LOZANO', NULL, NULL, '1973-10-05', NULL, 'rio.de.oro@hotmail.com', NULL, NULL, '1991-11-08', 1, NULL, NULL),
(17630, 2, 2, '1091183401', 'EHYLEN DALIANA PEREZ SANTOS', NULL, NULL, '1998-03-28', '0', 'dalianasantos980328@gmail.com', NULL, '-1156179147', '2016-05-04', 1, NULL, NULL),
(17631, 2, 1, '5036293', 'EIDER  LOZANO MANOSALVA', NULL, NULL, '1980-12-13', NULL, 'hlozanomanosalva@gmail.com', NULL, '-1192549571', '2001-11-20', 1, NULL, NULL),
(17632, 2, 1, '1066063125', 'EIDER ANTONIO BAYONA DURAN', NULL, NULL, '1995-03-10', '0', 'sincorreo@sincorreo.com', NULL, '-1112292309', '2013-04-09', 1, NULL, NULL),
(17633, 2, 1, '88210703', 'EIDER FABIAN QUINTERO MONTAGUT', NULL, NULL, '1974-10-12', '0', 'eider.quintero@gmail.com', NULL, '-1141046174', '1992-12-28', 1, NULL, NULL),
(17634, 2, 1, '1007959718', 'EIDER JOHAN CARRILLO CACERES', NULL, NULL, '2000-08-01', '0', 'carrillo26eider@gmail.com', NULL, '-1116285714', '2018-08-06', 1, NULL, NULL),
(17635, 2, 1, '13177157', 'EIDER OSCAR PAREDES SANCHEZ', NULL, NULL, '1984-11-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1091930913', '2002-11-07', 1, NULL, NULL),
(17636, 2, 1, '1003257494', 'EILEN MILDRETH TRIGOS VERGEL', NULL, NULL, '1989-02-24', '0', 'eimil89@hotmail.com', NULL, '-1109580758', '2007-03-07', 1, NULL, NULL),
(17637, 2, 1, '5036363', 'EILER ANTONIO FRANCO CASADIEGOS', NULL, NULL, '1985-06-14', NULL, 'francocasadiegoseilerantonio@gmail.com', NULL, '-1150906314', '2003-09-09', 1, NULL, NULL),
(17638, 2, 1, '26777145', 'ELBA ELENA ARIAS CARRASCAL', NULL, NULL, '1951-03-03', '0', 'sincorreo@sincorreo.com', NULL, '-1176452064', '1973-07-13', 1, NULL, NULL),
(17639, 2, 1, '26774630', 'ELBA LUZ GARCIA DUARTE', NULL, NULL, '1961-04-15', '0', 'sincorreo@sincorreo.com', NULL, '-1160809436', '1979-11-29', 1, NULL, NULL),
(17640, 2, 1, '26774564', 'ELBA LUZ NAVARRO DE CONTRERAS', NULL, NULL, '1949-01-19', '0', 'sincorreo@sincorreo.com', NULL, '-1186201040', '1976-09-09', 1, NULL, NULL),
(17641, 2, 1, '37332535', 'ELBA ROSA CONTRERAS NAVARRO', NULL, NULL, '1978-06-09', '0', 'sincorreo@sincorreo.com', NULL, '-1120005190', '1997-01-23', 1, NULL, NULL),
(17642, 2, 1, '26774568', 'ELBA ROSA PICON RIOS', NULL, NULL, '1955-10-01', '0', 'elbapiconr@hotmail.com', NULL, '-1128002744', '1976-12-22', 1, NULL, NULL),
(17643, 2, 1, '49640011', 'ELDA MARIA MANOSALVA MORA', NULL, NULL, '1958-09-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1179196299', '1977-07-12', 1, NULL, NULL),
(17644, 2, 1, '49650225', 'ELENA  SERENO MARTINEZ', NULL, NULL, '1954-08-18', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1977-07-12', 1, NULL, NULL),
(17645, 2, 1, '1066062323', 'ELENA ROCIO RIOS CARRILLO', NULL, NULL, '1988-10-18', '0', 'elenarociorios@hotmail.com', NULL, '-1146473911', '2007-01-09', 1, NULL, NULL),
(17646, 2, 1, '26862926', 'ELEONORA LORAINE QUINTERO GUZMAN', NULL, NULL, '1976-02-16', NULL, 'distribuidorasatamarta@hotmail.com', NULL, '-1119680416', '1994-06-20', 1, NULL, NULL),
(17647, 2, 1, '1066063643', 'ELFAR  QUINTERO VANEGAS', NULL, NULL, '1999-06-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1181827948', '2017-06-12', 1, NULL, NULL),
(17648, 2, 1, '5083055', 'ELFIDO  GARCIA SANCHEZ', NULL, NULL, '1950-11-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1179083939', '1973-07-19', 1, NULL, NULL),
(17649, 2, 1, '5035403', 'ELFIDO  MANZANO BARBOSA', NULL, NULL, '1965-12-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1987-11-10', 1, NULL, NULL),
(17650, 2, 1, '13374105', 'ELIADES  GARZON CASADIEGOS', NULL, NULL, '1963-03-29', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1982-09-27', 1, NULL, NULL),
(17651, 2, 1, '1066062277', 'ELIANA  CASTILLA CASTRO', NULL, NULL, '1988-03-27', '0', 'nanita1527@hotmail.com', NULL, '-1116683179', '2007-03-13', 1, NULL, NULL),
(17652, 2, 1, '1090462653', 'ELIANA  DUARTE QUINTERO', NULL, NULL, '1993-03-19', '0', 'duartequinteroeliana@gmail.com', NULL, '-1065969943', '2011-05-05', 1, NULL, NULL),
(17653, 2, 1, '1003257562', 'ELIANA  PACHECO VEGA', NULL, NULL, '2000-02-18', NULL, 'pachecovegaeliana@gmail.com', NULL, '-1128454382', '2018-02-21', 1, NULL, NULL),
(17654, 1, 1, '1007282989', 'ELIANA DEL MAR REYES ANGARITA', NULL, NULL, '2001-12-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1179993623', '2016-04-22', 1, NULL, NULL),
(17655, 2, 1, '13475541', 'ELIAS ANTONIO AMAYA PRADO', NULL, NULL, '1963-11-16', '0', 'sincorreo@sincorreo.com', NULL, '-1152426101', '1983-07-07', 1, NULL, NULL),
(17656, 2, 1, '5426449', 'ELIBARDO  DUARTE PORTILLO', NULL, NULL, '1960-01-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1188357150', '1979-12-09', 1, NULL, NULL),
(17657, 2, 1, '5035696', 'ELICEO  ANGARITA DUARTE', NULL, NULL, '1975-06-14', '0', 'sincorreo@sincorreo.com', NULL, '-1179345367', '1995-05-19', 1, NULL, NULL),
(17658, 2, 1, '37367907', 'ELIDA  GUEVARA GALVIS', NULL, NULL, '1970-03-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1186032348', '1988-09-13', 1, NULL, NULL),
(17659, 2, 1, '26774577', 'ELIDA  LOZANO MENDOZA', NULL, NULL, '1953-04-21', '0', 'sincorreo@sincorreo.com', NULL, '-1131048247', '1977-07-13', 1, NULL, NULL),
(17660, 2, 1, '5036072', 'ELIECER  REYES ARIAS', NULL, NULL, '1959-07-28', '0', 'eliecerreyesarias28@hotmail.com', NULL, '-1109183645', '1977-11-26', 1, NULL, NULL),
(17661, 2, 1, '1090984498', 'ELIECER  VARGAS PEÃ‘ARANDA', NULL, NULL, '1988-08-26', '0', 'elieservargas45@gmail.com', NULL, '-1080326292', '2006-10-09', 1, NULL, NULL),
(17662, 2, 1, '5035117', 'ELIO  GOMEZ GARCIA', NULL, NULL, '1961-02-02', '-1128761501', 'sincorreo@sincorreo.com', NULL, '-1152870330', '1979-12-09', 1, NULL, NULL),
(17663, 2, 1, '26777374', 'ELISABETH  LOBO QUINTERO', NULL, NULL, '1977-12-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1162362414', '2001-03-02', 1, NULL, NULL),
(17664, 2, 1, '1102716251', 'ELISABETH  NORIEGA SANTIAGO', NULL, NULL, '1987-01-04', '0', 'sincorreo@sincorreo.com', NULL, '-1182536073', '2005-10-20', 1, NULL, NULL),
(17665, 2, 1, '1091656044', 'ELISABETH  SANCHEZ PRADO', NULL, NULL, '1987-03-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1151957803', '2005-04-28', 1, NULL, NULL),
(17666, 2, 1, '5036283', 'ELISARDO ALFONSO NAVARRO AMAYA', NULL, NULL, '1983-02-12', '0', 'sanluisxp2@hotmail.com', NULL, '-1141655554', '2001-07-09', 1, NULL, NULL),
(17667, 2, 1, '5035095', 'ELISARDO ANTONIO NAVARRO DUARTE', NULL, NULL, '1960-04-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1092151833', '1979-07-03', 1, NULL, NULL),
(17668, 2, 1, '27851426', 'ELISENIA  NORIEGA PACAVITA', NULL, NULL, '1951-04-14', '0', 'sincorreo@sincorreo.com', NULL, '-1147852678', '1972-12-07', 1, NULL, NULL),
(17669, 2, 1, '13177633', 'ELISEO  ORTIZ CA?IZARES', NULL, NULL, '1984-09-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2003-02-13', 1, NULL, NULL),
(17670, 2, 1, '27765955', 'ELIZABETH  CHINCHILLA CARRASCAL', NULL, NULL, '1954-09-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1137804258', '1975-11-27', 1, NULL, NULL),
(17671, 2, 1, '1064837607', 'ELIZABETH  CRIADO MENA', NULL, NULL, '1988-07-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1066012801', '2006-12-01', 1, NULL, NULL),
(17672, 2, 1, '1066062546', 'ELIZABETH  GUERRERO BARBOSA', NULL, NULL, '1985-05-09', '0', 'elizabethguerrero591@gmail.com', NULL, '-1171071157', '2008-11-10', 1, NULL, NULL),
(17673, 2, 1, '37323129', 'ELIZABETH  MANOSALVA PORTILLO', NULL, NULL, '1970-04-24', '0', 'sincorreo@sincorreo.com', NULL, '-1161123640', '1989-04-12', 1, NULL, NULL),
(17674, 2, 1, '26777111', 'ELIZABETH  MENDOZA DE REYES', NULL, NULL, '1940-12-11', '0', 'sincorreo@sincorreo.com', NULL, '-1141481480', '1963-01-16', 1, NULL, NULL),
(17675, 2, 1, '1062805337', 'ELKIN FABIAN RANGEL AVENDA?O', NULL, NULL, '1987-08-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2005-09-26', 1, NULL, NULL),
(17676, 2, 1, '1090988833', 'ELKIN SAID DE LEON VARGAS', NULL, NULL, '1995-04-03', '0', 'elkinsaid1@hotmail.com', NULL, '-1151485187', '2013-05-07', 1, NULL, NULL),
(17677, 2, 1, '12647802', 'ELOY EDGARDO ANGARITA BARBOSA', NULL, NULL, '1980-11-28', NULL, 'notiene@notiene.com', NULL, '-1138012230', '1998-12-04', 1, NULL, NULL),
(17678, 2, 1, '30208904', 'ELSOMINA  QUI?ONEZ DELGADO', NULL, NULL, '1968-09-24', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1987-04-08', 1, NULL, NULL),
(17679, 2, 1, '1064842464', 'ELSY TRINIDAD ANGARITA RODRIGUEZ', NULL, NULL, '1998-02-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1121781968', '2016-04-15', 1, NULL, NULL),
(17680, 2, 1, '26778120', 'ELVA LUZ BARBOSA DE MANZANO', NULL, NULL, '1945-05-16', '0', 'sincorreo@sincorreo.com', NULL, '-1107768228', '1966-10-21', 1, NULL, NULL),
(17681, 2, 1, '26774423', 'ELVA MARIA RINCON QUINTERO', NULL, NULL, '1951-07-07', '0', 'sincorreo@sincorreo.com', NULL, '-1167381154', '1973-02-27', 1, NULL, NULL),
(17682, 2, 1, '1066062978', 'ELVA ROSA DURAN CHINCHILLA', NULL, NULL, '1992-03-23', '0', 'duranelva5@htomail.com', NULL, '-1179044198', '2012-03-27', 1, NULL, NULL),
(17683, 2, 1, '36600007', 'ELVA ROSA TRILLOS SANCHEZ', NULL, NULL, '1950-06-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1142317101', '1974-01-07', 1, NULL, NULL),
(17684, 2, 1, '1066063187', 'ELVER YAIR RODRIGUEZ VARGAS', NULL, NULL, '1995-09-08', '0', 'elveryair08@gmail.com', NULL, '-1166867608', '2013-09-23', 1, NULL, NULL),
(17685, 2, 1, '26774874', 'ELVIA  GOMEZ GARCIA', NULL, NULL, '1969-09-14', '0', 'sincorreo@sincorreo.com', NULL, '-1067370061', '1989-08-25', 1, NULL, NULL),
(17686, 2, 1, '26777174', 'ELVIA  QUINTERO DUARTE', NULL, NULL, '1974-11-15', '0', 'sincorreo@sincorreo.com', NULL, '-1120845779', '1996-07-05', 1, NULL, NULL),
(17687, 2, 1, '26777402', 'ELVIRA  GARCIA ALVARES', NULL, NULL, '1935-01-19', '0', 'sincorreo@sincorreo.com', NULL, '-1107717807', '2001-11-08', 1, NULL, NULL),
(17688, 2, 1, '26777204', 'ELVIRA  PINEDA DUARTE', NULL, NULL, '1978-03-23', '0', 'sincorreo@sincorreo.com', NULL, '-1139509240', '1996-10-31', 1, NULL, NULL),
(17689, 2, 1, '37310098', 'EMELINA  CARRASCAL PRADO', NULL, NULL, '1956-06-25', '0', 'sincorreo@sincorreo.com', NULL, '-1188621179', '1976-09-02', 1, NULL, NULL),
(17690, 2, 1, '22527036', 'EMELINA  NAVARRO BOHORQUEZ', NULL, NULL, '1957-10-21', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1979-06-04', 1, NULL, NULL),
(17691, 2, 1, '27659016', 'EMILIANA DEL SOCORRO AVENDA?O NU?EZ', NULL, NULL, '1946-03-11', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1971-02-11', 1, NULL, NULL),
(17692, 2, 1, '88144216', 'EMILIO  AMAYA CASTRO', NULL, NULL, '1968-03-02', '0', 'sincorreo@sincorreo.com', NULL, '-1192286496', '1988-09-28', 1, NULL, NULL),
(17693, 2, 1, '37335268', 'EMILSE  SERRANO BASTOS', NULL, NULL, '1980-05-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1080727077', '1998-11-09', 1, NULL, NULL),
(17694, 2, 1, '13377810', 'EMIRO ALFONSO JACOME HERNANDEZ', NULL, NULL, '1974-02-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1168362982', '1992-05-04', 1, NULL, NULL),
(17695, 2, 1, '1733975', 'EMIRO ANTONIO RINCON QUINTERO', NULL, NULL, '1950-10-30', '0', 'sincorreo@sincorreo.com', NULL, '-1167381154', '1973-02-27', 1, NULL, NULL),
(17696, 2, 1, '26775032', 'ENA BEATRIZ MADARIAGA MANZANO', NULL, NULL, '1974-12-19', NULL, 'enabeatrizm@yahoo.es', NULL, '-1109846364', '1993-09-11', 1, NULL, NULL),
(17697, 2, 1, '26774359', 'ENA DEL CARMEN GALVIZ CASTRO', NULL, NULL, '1968-11-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1987-10-12', 1, NULL, NULL),
(17698, 2, 1, '5036094', 'ENCARNACION  MOLINA BALLESTEROS', NULL, NULL, '1975-02-26', '0', 'sincorreo@sincorreo.com', NULL, '-1092276824', '1996-06-19', 1, NULL, NULL),
(17699, 2, 1, '1065815153', 'ENNA SANDRID PALLARES GALVIZ', NULL, NULL, '1995-04-07', '0', 'esandrid.pallares@gmail.com', NULL, '-1062040281', '2013-05-21', 1, NULL, NULL),
(17700, 2, 1, '77170670', 'EPIFANIO  ANGARITA BOHORQUEZ', NULL, NULL, '1972-05-03', NULL, 'epianga1972@outlook.com', NULL, '-1166071715', '1990-11-09', 1, NULL, NULL),
(17701, 2, 1, '1733928', 'ERASMO  DUARTE', NULL, NULL, '1947-09-30', '0', 'sincorreo@sincorreo.com', NULL, '-1186821756', '1969-03-26', 1, NULL, NULL),
(17702, 2, 1, '1066062646', 'ERICA LIZETH NAVARRO CLAVIJO', NULL, NULL, '1991-05-03', NULL, 'mado15_na@hotmail.com', NULL, '-1181263664', '2009-06-16', 1, NULL, NULL),
(17703, 2, 1, '1090988951', 'ERIKA  BAYONA ANGARITA', NULL, NULL, '1995-05-28', '0', 'sincorreo@sincorreo.com', NULL, '-1157576412', '2013-07-26', 1, NULL, NULL),
(17704, 2, 1, '1091671906', 'ERIKA  SARABIA GAONA', NULL, NULL, '1994-05-24', '0', 'esarabia7@misena.edu.co', NULL, '-1179390853', '2012-08-02', 1, NULL, NULL),
(17705, 2, 1, '37332108', 'ERIKA GEOVANA PICON CHINCHILLA', NULL, NULL, '1978-06-27', NULL, 'lagata34783@live.com', NULL, '-1279858434', '1996-08-15', 1, NULL, NULL),
(17706, 2, 1, '1091653814', 'ERIKA LORENA MOLINA RINCON', NULL, NULL, '1986-05-23', '0', 'eriklorenaml@hotmail.com', NULL, '-1106339867', '2004-08-10', 1, NULL, NULL),
(17707, 2, 1, '1066062351', 'ERIKA PATRICIA BELTRAN SANCHEZ', NULL, NULL, '1988-04-24', '0', 'sincorreo@sincorreo.com', NULL, '-1182913138', '2007-02-20', 1, NULL, NULL),
(17708, 2, 1, '1003121943', 'ERIKSSON  ROMERO LOZANO', NULL, NULL, '2002-05-21', '0', 'eromerol300@gmail.com', NULL, '-1172772807', '2020-10-29', 1, NULL, NULL),
(17709, 2, 1, '26774958', 'ERISOLINA  SARABIA PAEZ', NULL, NULL, '1952-08-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1188933199', '1991-07-27', 1, NULL, NULL),
(17710, 2, 1, '1066063579', 'ERITZON ESTIVEN CARRILLO PICON', NULL, NULL, '1998-08-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1150351966', '2016-10-12', 1, NULL, NULL),
(17711, 2, 1, '26862692', 'ERLINDA  ASCANIO ROCHEL', NULL, NULL, '1966-10-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1168075063', '1991-09-16', 1, NULL, NULL),
(17712, 2, 1, '5444302', 'ERMIDES  QUINTANA HERNANDEZ', NULL, NULL, '1952-12-15', '0', 'sicorreo@sincorreo.com', NULL, '-1091598293', '1975-10-29', 1, NULL, NULL),
(17713, 1, 1, '1003257475', 'ERWIN  SOLANO LOZANO', NULL, NULL, '2003-01-11', NULL, 'erwinsolano4@gmail.com', NULL, '-1086157624', '2010-02-08', 1, NULL, NULL),
(17714, 2, 1, '1091667048', 'ERWIN ANTONIO ASCANIO CASTRO', NULL, NULL, '1991-11-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1141749544', '2010-03-02', 1, NULL, NULL),
(17715, 1, 1, '1064086007', 'ERWIN DAMIAN CARRILLO NAVARRO', NULL, NULL, '2003-12-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1179024692', '2019-02-15', 1, NULL, NULL),
(17716, 2, 1, '1091679575', 'ERWING  VELASQUEZ GALVIZ', NULL, NULL, '1998-02-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1080668663', '2016-02-11', 1, NULL, NULL),
(17717, 2, 1, '26774604', 'ESNEDA ISABEL LOZANO LEMUS', NULL, NULL, '1957-07-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1121830654', '1977-12-22', 1, NULL, NULL),
(17718, 2, 1, '1090985204', 'ESNEYDI  CHINCHILLA MANDON', NULL, NULL, '1989-09-08', '0', 'sincorreo@sincorreo.com', NULL, '-1186555748', '2007-09-25', 1, NULL, NULL),
(17719, 2, 1, '5035183', 'ESTEBAN  GARCIA DUARTE', NULL, NULL, '1963-03-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1159603763', '1981-10-19', 1, NULL, NULL),
(17720, 2, 1, '73180545', 'ESTEBAN  ROMERO PE?A', NULL, NULL, '1981-05-24', NULL, 'devan.54@hotmail.com', NULL, '-1127925017', '1999-06-02', 1, NULL, NULL),
(17721, 2, 1, '26774891', 'ESTEHER MARIA ANGARITA BOHORQUEZ', NULL, NULL, '1970-02-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1148768706', '1989-03-27', 1, NULL, NULL),
(17722, 2, 1, '27665187', 'ESTHER MARIA PEREIDA DE VANEGAS', NULL, NULL, '1944-04-20', '0', 'sincorreo@sincorreo.com', NULL, '-1182520615', '1974-10-10', 1, NULL, NULL),
(17723, 2, 1, '27741257', 'EUCARIS  BAYONA RINCON', NULL, NULL, '1968-08-08', '0', 'sincorreo@sincorreo.com', NULL, '-1162193678', '1987-04-07', 1, NULL, NULL),
(17724, 2, 1, '1066062677', 'EUDER  SOLANO RUEDAS', NULL, NULL, '1991-08-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1188671440', '2009-08-25', 1, NULL, NULL),
(17725, 2, 1, '26777138', 'EULALIA  CONDE', NULL, NULL, '1945-02-13', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1969-06-20', 1, NULL, NULL),
(17726, 2, 1, '5471079', 'EULISES  VEGA PADILLA', NULL, NULL, '1980-07-04', '0', 'sincorreo@sincorreo.com', NULL, '-1066082283', '2000-06-12', 1, NULL, NULL),
(17727, 2, 1, '26780512', 'EUMELIA  ANGARITA', NULL, NULL, '1932-12-13', '0', 'sincorreo@sincorreo.com', NULL, '-1128079244', '1956-08-27', 1, NULL, NULL),
(17728, 2, 1, '88282028', 'EVAN  GUTIERREZ QUINTERO', NULL, NULL, '1969-08-04', '0', 'sincorreo@sincorreo.com', NULL, '-1171492051', '1994-08-16', 1, NULL, NULL),
(17729, 2, 2, '5529228', 'EVARISTO  ORTIZ ORTIZ', NULL, NULL, '1969-11-10', '0', 'sincorreo@sincorreo.com', NULL, '-1081396055', '1987-12-14', 1, NULL, NULL),
(17730, 2, 1, '5036104', 'EVELIO  CHINCHILLA ARO', NULL, NULL, '1977-09-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1180323786', '1996-06-19', 1, NULL, NULL),
(17731, 2, 1, '1946346', 'EVER  CHINCHILLA VERA', NULL, NULL, '1982-02-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1187362366', '2000-06-02', 1, NULL, NULL),
(17732, 2, 1, '1003257479', 'EVIN YOHAN DURAN PEREZ', NULL, NULL, '2003-01-30', NULL, 'evinduran30@gmail.com', NULL, '-1181133921', '2021-02-03', 1, NULL, NULL),
(17733, 2, 1, '1734048', 'EXCEL ORLANDO SANTIAGO CARRANZA', NULL, NULL, '1953-12-29', '0', 'sincorreo@sincorreo.com', NULL, '-1161413980', '1975-03-21', 1, NULL, NULL),
(17734, 2, 1, '5036313', 'EYXINUVERT  GUTIERREZ QUINTERO', NULL, NULL, '1982-10-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1070931712', '2002-03-15', 1, NULL, NULL),
(17735, 2, 1, '1066063531', 'FABIAN  QUINTERO PORTILLO', NULL, NULL, '1997-10-21', '0', 'sincorreo@sincorreo.com', NULL, '-1080930836', '2016-06-17', 1, NULL, NULL),
(17736, 2, 1, '1066062100', 'FABIAN  RAMIREZ JACOME', NULL, NULL, '1986-10-04', '0', 'sincorreo@sincorreo.com', NULL, '-1072772232', '2005-05-23', 1, NULL, NULL),
(17737, 2, 1, '1091675185', 'FABIAN  SANCHEZ ASCANIO', NULL, NULL, '1996-01-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1139808729', '2014-01-18', 1, NULL, NULL),
(17738, 2, 1, '1066062683', 'FABIAN ALBERTO MANZANO NAVARRO', NULL, NULL, '1991-08-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1171500765', '2009-08-31', 1, NULL, NULL),
(17739, 2, 1, '1098741935', 'FABIAN ALBERTO SUAREZ CARRILLO', NULL, NULL, '1993-07-25', NULL, 'fabianalbertosuarezcarrillo@gmail.com', NULL, '-1288588149', '2011-08-17', 1, NULL, NULL),
(17740, 2, 1, '1064838995', 'FABIAN ANDRES GUERRERO GUERRERO', NULL, NULL, '1991-04-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1157456797', '2010-02-16', 1, NULL, NULL),
(17741, 2, 1, '1066063268', 'FABIAN ORLANDO ALVAREZ GRANADOS', NULL, NULL, '1996-05-09', NULL, 'foalvarezg@ufpso.edu.co', NULL, '-1121345625', '2014-06-04', 1, NULL, NULL),
(17742, 2, 1, '1003122010', 'FABIAN RICARDO QUINTERO MENESES', NULL, NULL, '1995-03-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1076799018', '2013-04-22', 1, NULL, NULL),
(17743, 2, 1, '70419343', 'FABIO ALBEIRO ALCARAZ AMARILES', NULL, NULL, '1976-03-07', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1994-10-31', 1, NULL, NULL),
(17744, 2, 1, '1091654661', 'FABIO ALFONSO PEREZ QUINTERO', NULL, NULL, '1986-11-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1085315208', '2004-11-11', 1, NULL, NULL),
(17745, 2, 1, '1734012', 'FABIO ELY OSORIO PATIÃ‘O', NULL, NULL, '1952-09-16', '0', 'sincorreo@sincorreo.com', NULL, '-1142478676', '1974-01-21', 1, NULL, NULL),
(17746, 2, 1, '1066062534', 'FABIO HUMBERTO OSORIO GALVIZ', NULL, NULL, '1990-09-11', NULL, 'fabio.osorio@hotmail.com', NULL, '-1070723802', '2008-09-30', 1, NULL, NULL),
(17747, 2, 1, '1004862752', 'FABIOLA  BAYONA SANTIAGO', NULL, NULL, '1992-06-08', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2010-06-10', 1, NULL, NULL),
(17748, 2, 1, '37325718', 'FABIOLA  NAVARRO CONTRERAS', NULL, NULL, '1972-07-09', '0', 'sincorreo@sincorreo.com', NULL, '-1192150764', '1991-04-08', 1, NULL, NULL),
(17749, 2, 1, '1066083454', 'FABIOLA  PORTILLO MENDOZA', NULL, NULL, '1986-09-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1180635859', '2005-03-07', 1, NULL, NULL),
(17750, 2, 1, '1066062829', 'FABIOLA DEL ROSSIO NAVARRO PEREZ', NULL, NULL, '1992-07-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1067295405', '2011-03-01', 1, NULL, NULL),
(17751, 2, 1, '37369558', 'FAISULE  PEREZ CARVAJALINO', NULL, NULL, '1975-09-01', NULL, 'fay1607perez@gmail.com', NULL, '-1161697849', '1993-12-13', 1, NULL, NULL),
(17752, 2, 1, '1064842173', 'FANDRIDT  MONTEJO TORRES', NULL, NULL, '1997-09-14', '0', 'fanbritmontejo@hotmail.com', NULL, '-1182339616', '2015-10-06', 1, NULL, NULL),
(17753, 2, 1, '26774493', 'FANNY  CASADIEGOS QUINTERO', NULL, NULL, '1950-01-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1141595436', '1974-01-21', 1, NULL, NULL),
(17754, 2, 1, '26774991', 'FANNY  LOZANO CHINCHILLA', NULL, NULL, '1971-01-19', '0', 'sincorreo@sincorreo.com', NULL, '-1192392955', '1992-07-15', 1, NULL, NULL),
(17755, 2, 1, '26774735', 'FANNY MARIA SANTIAGO MOLINA', NULL, NULL, '1959-10-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1121025067', '1983-08-10', 1, NULL, NULL),
(17756, 2, 1, '37319593', 'FANY DEL CARMEN ANGARITA ANGARITA', NULL, NULL, '1967-02-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1089793710', '1985-09-17', 1, NULL, NULL),
(17757, 2, 1, '26777243', 'FARIDE  RIVERA SANTIAGO', NULL, NULL, '1974-06-16', '0', 'sincorreo@sincorreo.com', NULL, '-1171042202', '1997-05-29', 1, NULL, NULL),
(17758, 2, 1, '26774920', 'FARIDE MARIA JACOME', NULL, NULL, '1969-12-15', '0', 'sincorreo@sincorreo.com', NULL, '-1179021983', '1989-12-11', 1, NULL, NULL),
(17759, 2, 1, '26774906', 'FARIDE MARIA MANZANO BARBOSA', NULL, NULL, '1969-04-15', '0', 'faridemaria69@gmail.com', NULL, '-1122114291', '1989-07-26', 1, NULL, NULL),
(17760, 2, 1, '37317103', 'FARIDE ROSA GUERRERO JIMENEZ', NULL, NULL, '1951-05-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1141011209', '1983-05-09', 1, NULL, NULL),
(17761, 2, 1, '13375167', 'FARUD ANTONIO ARCINIEGAS SUAREZ', NULL, NULL, '1966-10-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1167769070', '1985-10-03', 1, NULL, NULL),
(17762, 2, 1, '13371829', 'FARUD ANTONIO BARBOSA OREJUELA', NULL, NULL, '1957-09-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1170690193', '1977-05-13', 1, NULL, NULL),
(17763, 2, 1, '26777228', 'FATIMA  NAVARRO BONILLA', NULL, NULL, '1979-05-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1136668700', '1997-05-27', 1, NULL, NULL),
(17764, 2, 1, '37320504', 'FATIMA DEL ROSARIO ASCANIO GALVAN', NULL, NULL, '1965-04-27', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1986-10-17', 1, NULL, NULL),
(17765, 2, 1, '1094320658', 'FAVIO  LOPEZ LOPEZ', NULL, NULL, '1987-10-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2006-01-31', 1, NULL, NULL),
(17766, 2, 1, '1066062259', 'FAYZULE  DURAN DURAN', NULL, NULL, '1985-09-30', '0', 'sincorreo@sincorreo.com', NULL, '-1126897860', '2008-12-03', 1, NULL, NULL),
(17767, 2, 1, '26774652', 'FELIPA  QUINTERO ANGARITA', NULL, NULL, '1959-11-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1119185763', '1980-11-27', 1, NULL, NULL),
(17768, 2, 1, '42475119', 'FELISA  AVENDA O PINEDA', NULL, NULL, '1952-05-10', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1977-03-09', 1, NULL, NULL),
(17769, 2, 1, '91264825', 'FELIX JAVIER RIOS VARGAS', NULL, NULL, '1969-09-24', NULL, 'fejari@outlook.com', NULL, '-1249669250', '1987-09-28', 1, NULL, NULL),
(17770, 2, 1, '13360299', 'FILEMON  TORRADO ASCANIO', NULL, NULL, '1953-07-01', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1976-01-17', 1, NULL, NULL),
(17771, 2, 1, '5036253', 'FIRIO ANTONIO SANTIAGO GALLARDO', NULL, NULL, '1982-03-18', '0', 'sincorreo@sincorreo.com', NULL, '-1156466500', '2000-03-18', 1, NULL, NULL),
(17772, 2, 1, '13362719', 'FLAMINIO  RUEDAS RUEDAS', NULL, NULL, '1952-08-12', '0', 'sincorreo@sincorreo.com', NULL, '-1189670381', '1977-12-22', 1, NULL, NULL),
(17773, 2, 1, '5465109', 'FLORENTINO  CARRASCAL LEON', NULL, NULL, '1938-03-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1150691132', '1962-09-06', 1, NULL, NULL),
(17774, 2, 1, '26774875', 'FRANCIA  MANOSALVA DUARTE', NULL, NULL, '1969-11-28', '0', 'sincorreo@sincorreo.com', NULL, '-1141775379', '1989-08-25', 1, NULL, NULL),
(17775, 2, 1, '26774654', 'FRANCIA ELENA MANOSALVA DE PALLARES', NULL, NULL, '1960-11-19', '0', 'sincorreo@sincorreo.com', NULL, '-1171831073', '1980-11-27', 1, NULL, NULL),
(17776, 2, 1, '26774696', 'FRANCIA ELENA PALLARES DE RIOS', NULL, NULL, '1954-07-19', '0', 'sincorreo@sincorreo.com', NULL, '-1090848447', '1981-12-14', 1, NULL, NULL),
(17777, 2, 1, '5035418', 'FRANCISCO  CONTRERAS TORRES', NULL, NULL, '1968-12-02', '0', 'sincorreo@sincorreo.com', NULL, '-1122158153', '1987-12-14', 1, NULL, NULL),
(17778, 2, 2, '5529359', 'FRANCISCO  SILVA RAMIREZ', NULL, NULL, '1972-03-02', '0', 'ciscosilva1972@gmail.com', NULL, '-1180493449', '1990-08-02', 1, NULL, NULL),
(17779, 2, 1, '1734418', 'FRANCISCO  TORRES RIOS', NULL, NULL, '1963-11-08', '0', 'sincorreo@sincorreo.com', NULL, '-1076822593', '1983-08-19', 1, NULL, NULL),
(17780, 2, 1, '5467108', 'FRANCISCO  VARGAS PE?ARANDA', NULL, NULL, '1937-01-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1178398609', '1967-05-12', 1, NULL, NULL),
(17781, 2, 1, '88136794', 'FRANCISCO ANTONIO BAYONA CARRASCAL', NULL, NULL, '1958-09-09', '0', 'sincorreo@sincorreo.com', NULL, '-1152903742', '1981-11-28', 1, NULL, NULL),
(17782, 2, 1, '1974909', 'FRANCISCO ANTONIO CANIZARES CAVIEDES', NULL, NULL, '1932-06-04', '-1166942310', 'sincorreo@sincorreo.com', NULL, NULL, '1957-03-07', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(17783, 2, 1, '1733421', 'FRANCISCO ANTONIO GUTIERREZ DURAN', NULL, NULL, '1933-05-11', '0', 'sincorreo@sincorreo.com', NULL, '-1149497141', '1956-03-28', 1, NULL, NULL),
(17784, 2, 1, '5045223', 'FRANCISCO JAVIER PE?A GONZALEZ', NULL, NULL, '1965-05-07', NULL, 'franciscojp07@gimail.com', NULL, '-1182391441', '1983-12-12', 1, NULL, NULL),
(17785, 2, 2, '1090454108', 'FRANCISCO JOSE SILVA FLOREZ', NULL, NULL, '1992-09-17', '0', 'franjose192@gmail.com', NULL, '-1151553171', '2010-09-21', 1, NULL, NULL),
(17786, 2, 1, '37320087', 'FRANCY  CARRASCAL QUINTERO', NULL, NULL, '1967-05-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1092897360', '1985-12-09', 1, NULL, NULL),
(17787, 2, 1, '37370552', 'FRANCY ELENA QUINTERO DELGADO', NULL, NULL, '1978-07-05', '0', 'sincorreo@sincorreo.com', NULL, '-1070274054', '1997-05-21', 1, NULL, NULL),
(17788, 2, 1, '1003121924', 'FRANKLI CAMILO TORRES CHINCHILLA', NULL, NULL, '1999-06-06', '0', 'frankli.torres06@gmail.com', NULL, '-1189774374', '2017-06-09', 1, NULL, NULL),
(17789, 1, 1, '1064086153', 'FRANKLIN YAIR GOMEZ DUARTE', NULL, NULL, '2005-01-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1131557817', '2019-09-10', 1, NULL, NULL),
(17790, 2, 1, '88283228', 'FREDDY  AMAYA GARZON', NULL, NULL, '1977-06-20', '0', 'sincorreo@sincorreo.com', NULL, '-1065928015', '1995-09-17', 1, NULL, NULL),
(17791, 2, 1, '5471735', 'FREDDY  MANOSALVA PORTILLO', NULL, NULL, '1982-05-31', NULL, 'manosalvafreddy71@gmail.com', NULL, '-1087408382', '2000-11-24', 1, NULL, NULL),
(17792, 2, 1, '5035582', 'FREDDY  RODRIGUEZ GUTIERREZ', NULL, NULL, '1973-06-07', '0', 'sincorreo@sincorreo.com', NULL, '-1167508339', '1991-11-08', 1, NULL, NULL),
(17793, 2, 1, '13506715', 'FREDDY ANTONIO PINEDA REMOLINA', NULL, NULL, '1970-10-07', '0', 'sincorreo@sincorreo.com', NULL, '-1066057982', '1989-06-27', 1, NULL, NULL),
(17794, 2, 1, '88281355', 'FREDDY JESUS GARCIA DUARTE', NULL, NULL, '1975-11-26', '0', 'sincorreo@sincorreo.com', NULL, '-1080661915', '1994-02-07', 1, NULL, NULL),
(17795, 2, 1, '5035460', 'FREDY  BOHORQUEZ VILLALBA', NULL, NULL, '1970-09-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1111613299', '2016-06-29', 1, NULL, NULL),
(17796, 2, 1, '5036136', 'FREDY  CHINCHILLA GOMEZ', NULL, NULL, '1977-06-20', '0', 'sincorreo@sincorreo.com', NULL, '-1075899318', '1997-04-30', 1, NULL, NULL),
(17797, 2, 1, '5035591', 'FREDY  MOLINA', NULL, NULL, '1971-05-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1182196633', '1992-03-18', 1, NULL, NULL),
(17798, 2, 1, '88281609', 'FREDY  MOLINA MORA', NULL, NULL, '1975-12-19', NULL, 'fredymolina21fresa@gmail.com', NULL, '-1127691733', '1994-06-20', 1, NULL, NULL),
(17799, 2, 1, '1090986200', 'FREDY  RAMIREZ DURAN', NULL, NULL, '1990-07-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1131943087', '2009-03-17', 1, NULL, NULL),
(17800, 2, 1, '5035683', 'FREDY  ROMERO DUQUE', NULL, NULL, '1970-12-11', '0', 'sincorreo@sincorreo.com', NULL, '-1148087877', '1994-10-31', 1, NULL, NULL),
(17801, 2, 1, '1003257439', 'FREDY  SOLANO RUEDAS', NULL, NULL, '1994-02-11', NULL, 'sincorreo@sincorreo.com', NULL, '-787755885', '2012-02-16', 1, NULL, NULL),
(17802, 2, 1, '13379906', 'FREDY  TARAZONA CARVAJALINO', NULL, NULL, '1979-10-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1160124330', '1998-11-03', 1, NULL, NULL),
(17803, 2, 1, '88276055', 'FREDY  VANEGAS JACOME', NULL, NULL, '1971-03-21', NULL, 'fredyvane213@hotmail.com', NULL, '-1168398932', '1989-05-25', 1, NULL, NULL),
(17804, 2, 1, '7574012', 'FREDY ALEJANDRO OSORIO SOLANO', NULL, NULL, '1983-09-12', '4774081', 'faos83@hotmail.com', NULL, '-1136831839', '2001-09-24', 1, NULL, NULL),
(17805, 2, 1, '13378609', 'FREDY ONEL ANGARITA GARCIA', NULL, NULL, '1976-09-07', '0', 'fredyonel_@hotmail.com', NULL, '-1112654543', '1994-10-31', 1, NULL, NULL),
(17806, 2, 1, '1134849125', 'FREIDE  CONTRERAS ANDRADE', NULL, NULL, '2001-09-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1131469146', '2019-10-21', 1, NULL, NULL),
(17807, 2, 1, '1004818886', 'FREIDY  RODRIGUEZ PEREZ', NULL, NULL, '1991-10-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1150369657', '2009-10-30', 1, NULL, NULL),
(17808, 2, 1, '1007959742', 'FREYDER YERSEY SANTANA DUARTE', NULL, NULL, '2003-03-10', '0', 'freydersantana77@gmail.com', NULL, '-1089604005', '2021-03-10', 1, NULL, NULL),
(17809, 2, 1, '4986065', 'GABRIEL ALEJO SOLANO OJEDA', NULL, NULL, '1969-08-31', '0', 'gabrielalejoelprofe@hotmail.com', NULL, '-1137745310', '1987-09-24', 1, NULL, NULL),
(17810, 2, 1, '1066062926', 'GABRIEL ANGEL DUARTE GALVIZ', NULL, NULL, '1993-10-24', '0', 'gabrielangelduarte2020@gmail.com', NULL, '-1152731044', '2011-12-19', 1, NULL, NULL),
(17811, 2, 1, '5472372', 'GABRIEL ANGEL JAIME BONETH', NULL, NULL, '1983-03-03', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2001-03-23', 1, NULL, NULL),
(17812, 2, 1, '5035639', 'GABRIEL ANGEL LOBO QUINTERO', NULL, NULL, '1974-10-23', '0', 'sincorreo@sincorreo.com', NULL, '-1178385806', '1993-06-10', 1, NULL, NULL),
(17813, 2, 1, '19591036', 'GABRIEL ANGEL PABA CASADIEGOS', NULL, NULL, '1970-08-20', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1990-08-10', 1, NULL, NULL),
(17814, 2, 1, '1734002', 'GABRIEL ANGEL PACHECO QUINTERO', NULL, NULL, '1951-03-08', '0', 'sincorreo@sincorreo.com', NULL, '-1160741779', '1974-01-07', 1, NULL, NULL),
(17815, 2, 1, '88279918', 'GABRIEL ANGEL VEGA SANJUAN', NULL, NULL, '1974-10-08', '0', 'sincorreo@gmail.com', NULL, '-1128683103', '1993-01-25', 1, NULL, NULL),
(17816, 2, 1, '88277945', 'GABRIEL ANTONIO NAVARRO SANTIAGO', NULL, NULL, '1971-03-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1156731534', '1900-12-30', 1, NULL, NULL),
(17817, 1, 1, '1092174169', 'GABRIELA  VEGA JAIMES', NULL, NULL, '2004-01-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1067093271', '2018-03-26', 1, NULL, NULL),
(17818, 2, 1, '1004864089', 'GAIDER  REMOLINA DUARTE', NULL, NULL, '1996-06-27', NULL, 'gaider19@gmail.com', NULL, '-1146652047', '2014-07-23', 1, NULL, NULL),
(17819, 2, 1, '5036154', 'GAIRDON  CHINCHILLA GALVIZ', NULL, NULL, '1979-04-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1085682179', '1997-05-27', 1, NULL, NULL),
(17820, 2, 1, '1090982277', 'GAMALIEL  PEINADO LAGUADO', NULL, NULL, '1985-08-23', '0', 'sincorreo@sincorreo.com', NULL, '-1186927222', '2004-06-01', 1, NULL, NULL),
(17821, 1, 1, '1003257489', 'GEIMER ANDRES GUTIERREZ CHINCHILLA', NULL, NULL, '2003-03-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1160531385', '2017-04-19', 1, NULL, NULL),
(17822, 2, 1, '26777381', 'GEMIMA  PE?UELA ECHAVEZ', NULL, NULL, '1983-05-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1179499396', '2001-05-31', 1, NULL, NULL),
(17823, 2, 1, '37180446', 'GENIS MARIA CARRASCAL BECERRA', NULL, NULL, '1983-11-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1151609795', '2001-12-06', 1, NULL, NULL),
(17824, 2, 1, '1066063058', 'GENNY KATERINE TORRADO PACHECO', NULL, NULL, '1994-09-29', NULL, 'yek2909@hotmail.com', NULL, '-1070516433', '2012-10-03', 1, NULL, NULL),
(17825, 2, 1, '37368241', 'GENY YUDIT ROPERO ROPERO', NULL, NULL, '1971-01-28', '0', 'genyudith10@hotmail.es', NULL, '-1112951364', '1989-07-24', 1, NULL, NULL),
(17826, 2, 1, '5035688', 'GEOBANY  ARCINIEGAS SANTIAGO', NULL, NULL, '1975-09-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1090467959', '1994-11-29', 1, NULL, NULL),
(17827, 2, 1, '26774270', 'GEORGINA  LOZANO DE QUINTERO', NULL, NULL, '1936-03-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1179026763', '1961-12-18', 1, NULL, NULL),
(17828, 2, 1, '5035600', 'GEOVANI  MORA PICON', NULL, NULL, '1973-10-19', '0', 'sincorreo@sincorreo.com', NULL, '-1107944921', '1992-05-27', 1, NULL, NULL),
(17829, 2, 1, '1091667252', 'GEOVANNY  JACOME RODRIGUEZ', NULL, NULL, '1992-03-10', NULL, 'estefaniaangarita595@gmail.com', NULL, '-1070347711', '2010-04-13', 1, NULL, NULL),
(17830, 2, 1, '9690551', 'GEOVANNY  URIBE CHINCHILLA', NULL, NULL, '1979-09-08', '0', 'sincorreo@sincorreo.com', NULL, '-1162157306', '1999-03-05', 1, NULL, NULL),
(17831, 2, 1, '1003257527', 'GEOVANNY ANDREY LOBO JACOME', NULL, NULL, '2001-05-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1176044808', '2019-06-04', 1, NULL, NULL),
(17832, 2, 1, '13176548', 'GERARDO  DUARTE PORTILLO', NULL, NULL, '1984-05-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1066388946', '2020-08-31', 1, NULL, NULL),
(17833, 2, 1, '1091677527', 'GERBIN ALONSO BARBOSA SANCHEZ', NULL, NULL, '1997-01-11', '0', 'gerbin111@hotmail.com', NULL, '-1136601729', '2015-01-20', 1, NULL, NULL),
(17834, 2, 1, '88282027', 'GEREMIAS  GUTIERREZ QUINTERO', NULL, NULL, '1966-03-12', '0', 'sincorreo@sincorreo.com', NULL, '-1065845578', '1994-10-31', 1, NULL, NULL),
(17835, 2, 1, '1091658008', 'GERMAN  QUINTERO ECHAVEZ', NULL, NULL, '1987-02-07', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2006-01-11', 1, NULL, NULL),
(17836, 2, 1, '1003121922', 'GERMAN ANDRES OSORIO LOZANO', NULL, NULL, '2002-04-03', '0', 'germanchoosorioo@gmail.com', NULL, '-1139375981', '2020-12-21', 1, NULL, NULL),
(17837, 2, 1, '5036155', 'GERSON  CASTILLA MOLINA', NULL, NULL, '1979-02-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1159858579', '1997-05-27', 1, NULL, NULL),
(17838, 2, 1, '1091670169', 'GILBERTO OSNEIDER RANGEL REMOLINA', NULL, NULL, '1993-05-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1141433909', '2011-08-09', 1, NULL, NULL),
(17839, 2, 1, '1003257620', 'GINA PAOLA RODRIGUEZ VERA', NULL, NULL, '2001-04-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1170044144', '2019-04-30', 1, NULL, NULL),
(17840, 2, 1, '37182172', 'GINETH  BAYONA RUEDAS', NULL, NULL, '1984-09-01', NULL, 'yinibayona@hotmail.com', NULL, '-1105995757', '2003-02-05', 1, NULL, NULL),
(17841, 2, 1, '37323469', 'GIOMARA  CASTRO AMAYA', NULL, NULL, '1970-12-01', '0', 'sincorreo@sincorreo.com', NULL, '-1089280342', '1989-08-01', 1, NULL, NULL),
(17842, 2, 1, '26777372', 'GISELA IRINA ORTIZ ANGARITA', NULL, NULL, '1982-09-28', '0', 'giortiz2@misena.edu.co', NULL, '-1127158465', '2001-02-15', 1, NULL, NULL),
(17843, 2, 1, '1066062865', 'GISELLA  LOZANO ANGARITA', NULL, NULL, '1993-03-12', '0', 'lozanoangaritagisellq@gmail.com', NULL, '-1119184546', '2011-06-13', 1, NULL, NULL),
(17844, 2, 1, '26774797', 'GLADIS MARIA DUARTE CHINCHILLA', NULL, NULL, '1966-12-20', '0', 'gladismaria6620@hotmail.com', NULL, '-1156650283', '1985-09-26', 1, NULL, NULL),
(17845, 2, 1, '30503965', 'GLADIS MARIA RIVERA ROJAS', NULL, NULL, '1966-02-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1192461492', '1985-09-19', 1, NULL, NULL),
(17846, 2, 1, '37170362', 'GLADYS  CHOGO CARVAJALINO', NULL, NULL, '1971-04-11', '0', 'sincorreo@sincorreo.com', NULL, '-1070252856', '1997-06-07', 1, NULL, NULL),
(17847, 2, 1, '26774617', 'GLADYS ESTELLA REYES MENDOZA', NULL, NULL, '1959-01-03', '0', 'glafedo1@hotmail.com', NULL, '-1142653765', '1979-06-07', 1, NULL, NULL),
(17848, 2, 1, '37367838', 'GLADYS MARIA REYES PEDROZA', NULL, NULL, '1966-11-01', NULL, 'gladysreyesp@hotmail.com', NULL, '-1072790124', '1988-06-08', 1, NULL, NULL),
(17849, 2, 1, '37312278', 'GLADYS MARIA RODRIGUEZ DE RUEDA', NULL, NULL, '1954-10-24', '0', 'sincorreo@sincorreo.com', NULL, '-1150743909', '1978-09-12', 1, NULL, NULL),
(17850, 2, 2, '27887929', 'GLADYS MARIA RODRIGUEZ SEPULVEDA', NULL, NULL, '1972-06-10', '0', 'sincorreo@sincorreo.com', NULL, '-1075052269', '1999-03-04', 1, NULL, NULL),
(17851, 2, 1, '63332043', 'GLORIA  BARRERO BRI?EZ', NULL, NULL, '1957-12-18', '5653031', 'sincorreo@sincorreo.com', NULL, NULL, '1985-06-13', 1, NULL, NULL),
(17852, 2, 1, '26795670', 'GLORIA CECILIA MENDOZA PE?A', NULL, NULL, '1982-02-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1168317051', '2000-03-30', 1, NULL, NULL),
(17853, 2, 1, '26774792', 'GLORIA ELENA VELEZ PINZON', NULL, NULL, '1967-08-28', '0', 'sincorreo@sincorreo.com', NULL, '-1142396444', '1985-08-29', 1, NULL, NULL),
(17854, 2, 1, '26861938', 'GLORIA ESTELLA RINCON SALAZAR', NULL, NULL, '1963-06-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1151992499', '1983-09-19', 1, NULL, NULL),
(17855, 2, 1, '26775015', 'GLORIA INES ANGARITA DUARTE', NULL, NULL, '1972-08-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1169429181', '1993-05-06', 1, NULL, NULL),
(17856, 2, 2, '1007635747', 'GLORIA JASMIN SERRANO RAMIREZ', NULL, NULL, '1987-07-03', '0', 'sincorreo@sincorreo.com', NULL, '-1092509811', '2010-07-07', 1, NULL, NULL),
(17857, 2, 1, '60364704', 'GLORIA MARIA MENDOZA QUINTERO', NULL, NULL, '1974-09-08', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1993-03-12', 1, NULL, NULL),
(17858, 2, 1, '26774886', 'GLORIA MARIA VERA QUINTERO', NULL, NULL, '1970-01-24', '0', 'sincorreo@sincorreo.com', NULL, '-1128951763', '1989-02-24', 1, NULL, NULL),
(17859, 2, 1, '49640026', 'GRACIELA  GOMEZ GARCIA', NULL, NULL, '1965-05-14', '0', 'sincorreo@sincorreo.com', NULL, '-1092751957', '1985-11-28', 1, NULL, NULL),
(17860, 2, 1, '26862372', 'GRACIELA  SANTIAGO CASTILLA', NULL, NULL, '1964-09-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1112400242', '1987-12-14', 1, NULL, NULL),
(17861, 2, 1, '37371438', 'GRICELDINA  QUINTERO SANTIAGO', NULL, NULL, '1981-10-01', '0', 'griquisa@hotmail.com', NULL, '-1091197517', '2000-02-11', 1, NULL, NULL),
(17862, 2, 1, '5035517', 'GUIDO IGNACIO GALVIZ SANCHEZ', NULL, NULL, '1971-10-23', '0', 'sincorreo@sincorreo.com', NULL, '-1128783864', '1989-12-11', 1, NULL, NULL),
(17863, 2, 1, '5036091', 'GUILLERMO  PACHECO ORTEGA', NULL, NULL, '1977-08-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1187165208', '1996-06-19', 1, NULL, NULL),
(17864, 2, 1, '26774892', 'GUILMAR SORINA ARIAS CARRASCAL', NULL, NULL, '1970-12-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1171820620', '1989-03-27', 1, NULL, NULL),
(17865, 2, 1, '88284788', 'GUSTAVO  AMAYA PRADO', NULL, NULL, '1978-10-24', '0', 'sincorreo@sincorreo.com', NULL, '-1152426101', '1996-12-02', 1, NULL, NULL),
(17866, 2, 1, '13379178', 'GUSTAVO  ECHAVEZ PE?A', NULL, NULL, '1977-05-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1186747288', '1996-08-28', 1, NULL, NULL),
(17867, 2, 1, '5035222', 'GUSTAVO  MENDOZA SANTIAGO', NULL, NULL, '1960-12-12', '0', 'sincorreo@sincorreo.com', NULL, '-1066619009', '1982-08-18', 1, NULL, NULL),
(17868, 2, 1, '5035367', 'GUSTAVO  MOLINA BALLESTEROS', NULL, NULL, '1966-07-22', '0', 'sincorreo@sincorreo.com', NULL, '-1172194604', '1987-03-27', 1, NULL, NULL),
(17869, 2, 1, '5035151', 'GUSTAVO  PORTILLO ANGARITA', NULL, NULL, '1958-06-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1091643290', '1980-10-02', 1, NULL, NULL),
(17870, 2, 1, '5035268', 'GUSTAVO  RUEDAS CONTRERAS', NULL, NULL, '1957-06-21', '0', 'sincorreo@sincorreo.com', NULL, '-1070198215', '1983-11-07', 1, NULL, NULL),
(17871, 2, 1, '1733896', 'GUSTAVO  SANTIAGO CASTILLO', NULL, NULL, '1944-11-17', '0', 'sincorreo@sincorreo.com', NULL, '-1109030684', '1967-12-17', 1, NULL, NULL),
(17872, 2, 1, '5035489', 'GUSTAVO  VANEGAS PEREA', NULL, NULL, '1968-09-10', '0', 'sincorreo@sincorreo.com', NULL, '-1160676008', '1989-04-26', 1, NULL, NULL),
(17873, 2, 1, '1064836515', 'GUSTAVO ADOLFO DUARTE PINEDA', NULL, NULL, '1986-10-21', '0', 'sincorreo@sincorreo.com', NULL, '-1162492429', '2004-10-22', 1, NULL, NULL),
(17874, 2, 1, '1091666577', 'GUSTAVO ADOLFO PABA NAVARRO', NULL, NULL, '1991-11-22', '0', 'paba_1122@hotmail.com', NULL, '-1106392643', '2009-12-04', 1, NULL, NULL),
(17875, 2, 1, '1066063648', 'GUSTAVO ALONSO MOLINA DUARTE', NULL, NULL, '1999-06-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1151035707', '2017-07-04', 1, NULL, NULL),
(17876, 2, 1, '1020751191', 'GUSTAVO EDUARDO GARCIA OSORIO', NULL, NULL, '1990-03-17', NULL, 'geg0806@gmail.com', NULL, '-1161005874', '2008-04-10', 1, NULL, NULL),
(17877, 2, 1, '1049613986', 'GUSTAVO ELIECER REYES LANZIANO', NULL, NULL, '1988-10-21', '0', 'tavotereyes@hotmail.com', NULL, '-1131237033', '2006-10-26', 1, NULL, NULL),
(17878, 2, 1, '13376227', 'GUZMAN  QUINTERO LOZANO', NULL, NULL, '1970-01-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1186068530', '1988-04-27', 1, NULL, NULL),
(17879, 2, 1, '5459633', 'GUZMAN  RUEDAS CARRASCAL', NULL, NULL, '1946-07-03', '0', 'sincorreo@sincorreo.com', NULL, '-1159316655', '1968-12-27', 1, NULL, NULL),
(17880, 2, 1, '1091678624', 'GUZMAN EDUARDO QUINTERO PALACIO', NULL, NULL, '1997-07-19', NULL, 'geduardo07@gmail.com', NULL, '-1090722511', '2015-07-24', 1, NULL, NULL),
(17881, 2, 1, '1007282761', 'HAIDER  CORONEL CARRASCAL', NULL, NULL, '1994-06-21', '0', 'jaidercc21@gmail.com', NULL, '-1151653792', '2012-09-11', 1, NULL, NULL),
(17882, 2, 1, '1066062497', 'HANS YEISON AVENDAÃ‘O PABA', NULL, NULL, '1990-04-30', '0', 'hansyeison@hotmail.com', NULL, '-1111909170', '2008-06-25', 1, NULL, NULL),
(17883, 2, 1, '1066062009', 'HAROLD DAVID HORLANDY CASTILLA', NULL, NULL, '2004-01-01', '0', 'haroldh2004@gmail.com', NULL, '-1179021997', '2022-01-03', 1, NULL, NULL),
(17884, 2, 1, '1091670598', 'HAROLD MAURICIO CASTRO LEON', NULL, NULL, '1993-11-10', '0', 'haroldcastro931@gmail.com', NULL, '-1160880597', '2011-12-12', 1, NULL, NULL),
(17885, 2, 1, '49652550', 'HAYDEE  DE LA PE?A ALSINA', NULL, NULL, '1957-09-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1110018295', '1981-06-25', 1, NULL, NULL),
(17886, 2, 1, '1066063119', 'HAYDER  ANGARITA RANGEL', NULL, NULL, '1995-01-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1170485543', '2013-03-26', 1, NULL, NULL),
(17887, 2, 1, '5035363', 'HEBERT  MOLINA MORA', NULL, NULL, '1967-12-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1189462705', '1987-02-27', 1, NULL, NULL),
(17888, 2, 1, '5036151', 'HEBERTH CIFRETH VERA QUINTERO', NULL, NULL, '1978-10-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1160291152', '1997-05-27', 1, NULL, NULL),
(17889, 2, 1, '5035672', 'HECTOR  CASADIEGO BAYONA', NULL, NULL, '1974-05-19', NULL, 'casadiegohector3126@gmail.com', NULL, '-1191730834', '1994-06-30', 1, NULL, NULL),
(17890, 2, 1, '1007317327', 'HECTOR  CONTRERAS CONTRERAS', NULL, NULL, '1987-11-30', '0', 'sincorreo@sincorreo.com', NULL, '-1088218571', '2007-04-23', 1, NULL, NULL),
(17891, 2, 1, '5035576', 'HECTOR  MOLINA QUINTERO', NULL, NULL, '1972-09-20', '0', 'hmqhector1972@gmail.com', NULL, '-786987332', '1991-09-30', 1, NULL, NULL),
(17892, 2, 1, '88281389', 'HECTOR  MOLINA QUINTERO', NULL, NULL, '1976-01-19', '0', 'sincorreo@sincorreo.com', NULL, '-1138175488', '1994-02-07', 1, NULL, NULL),
(17893, 2, 1, '1096538148', 'HECTOR DAVID MOLINA RIVERA', NULL, NULL, '2004-04-01', '0', 'hectorriveramolina15@gmail.com', NULL, '-1121075965', '2022-05-10', 1, NULL, NULL),
(17894, 2, 1, '88138279', 'HECTOR EDUARDO CASADIEGOS AMAYA', NULL, NULL, '1965-02-18', NULL, 'hectorcasadiego@hotmail.es', NULL, '-1129600778', '1983-07-28', 1, NULL, NULL),
(17895, 2, 1, '88280649', 'HECTOR JULIO CONTRERAS NAVARRO', NULL, NULL, '1975-05-08', '0', 'sincorreo@sincorreo.com', NULL, '-1161173699', '1993-06-15', 1, NULL, NULL),
(17896, 2, 1, '5035196', 'HECTOR JULIO QUINTERO BOHORQUEZ', NULL, NULL, '1963-03-13', '0', 'sincorreo@sincorreo.com', NULL, '-1138445565', '1981-12-14', 1, NULL, NULL),
(17897, 2, 1, '5035210', 'HECTOR JULIO RUEDAS IBARRA', NULL, NULL, '1963-11-02', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1981-12-14', 1, NULL, NULL),
(17898, 1, 1, '1066062106', 'HECTOR MANUEL CAMPO QUINTERO', NULL, NULL, '2005-06-08', '0', 'hectorcampoquintero@gmail.com', NULL, '-1161461279', '2018-01-12', 1, NULL, NULL),
(17899, 2, 1, '1066062762', 'HECTOR MANUEL SANTIAGO RUEDAS', NULL, NULL, '1992-06-17', '0', 'hmanuelsantiago@gmail.com', NULL, '-1110720110', '2010-06-24', 1, NULL, NULL),
(17900, 2, 1, '1066062171', 'HEDUVEN  RIVERA NAVARRO', NULL, NULL, '1986-11-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1179819943', '2005-11-24', 1, NULL, NULL),
(17901, 2, 1, '1066062421', 'HEIBER JESUS MANOSALVA GRANADOS', NULL, NULL, '1989-09-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1162141641', '2010-08-19', 1, NULL, NULL),
(17902, 2, 1, '88278604', 'HEIDER  PAREDES GUERRERO', NULL, NULL, '1973-07-02', '0', 'sincorreo@sincorreo.com', NULL, '-1110598214', '1991-07-27', 1, NULL, NULL),
(17903, 2, 1, '1003121971', 'HEIDER ALBERTO GARCIA PEREIRA', NULL, NULL, '2003-09-05', '0', 'heidergarcia2395@gmail.com', NULL, '-1150425333', '2021-09-07', 1, NULL, NULL),
(17904, 2, 1, '1004858301', 'HEIDER FABIAN AMAYA QUINTERO', NULL, NULL, '1991-12-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1148909724', '2010-01-13', 1, NULL, NULL),
(17905, 2, 1, '1066063543', 'HEIDER MANUEL RUEDA CARRASCAL', NULL, NULL, '1998-03-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1082074055', '2016-07-05', 1, NULL, NULL),
(17906, 1, 1, '1092177649', 'HEIDI YISNETH GALVIZ DUARTE', NULL, NULL, '2006-06-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1085778204', '2013-07-18', 1, NULL, NULL),
(17907, 1, 1, '1091653471', 'HEILER FERNANDO PEREZ RUEDAS', NULL, NULL, '2004-06-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1168452745', '2019-09-11', 1, NULL, NULL),
(17908, 2, 1, '37311382', 'HELGA MARIA TORRES TORRES', NULL, NULL, '1954-05-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1111062124', '1977-09-22', 1, NULL, NULL),
(17909, 2, 1, '88148379', 'HELIODORO  PEREZ GALVIS', NULL, NULL, '1962-01-02', '0', 'sincorreo@sincorreo.com', NULL, '-1085093536', '1984-07-04', 1, NULL, NULL),
(17910, 2, 1, '13176806', 'HELVER  MOLINA PRADO', NULL, NULL, '1984-07-01', '0', 'sincorreo@sincorreo.com', NULL, '-1171031866', '2002-08-27', 1, NULL, NULL),
(17911, 2, 1, '13373783', 'HEMEL ANTONIO CHINCHILLA CHINCHILLA', NULL, NULL, '1963-01-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1082643375', '1981-05-15', 1, NULL, NULL),
(17912, 2, 1, '1066062506', 'HENRRY  MANDON RABELO', NULL, NULL, '1990-01-01', '0', 'sincorreo@sincorreo.com', NULL, '-1091655448', '2008-08-05', 1, NULL, NULL),
(17913, 2, 1, '13168693', 'HENRY  CHONA PALLARES', NULL, NULL, '1976-05-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1077436617', '1996-08-01', 1, NULL, NULL),
(17914, 2, 1, '88217007', 'HENRY  PEREZ TORRADO', NULL, NULL, '1975-12-20', '0', 'henrypt27@gmail.com', NULL, '-1128953406', '1994-02-07', 1, NULL, NULL),
(17915, 2, 1, '88285807', 'HENRY  RINCON LEON', NULL, NULL, '1979-04-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1151994040', '1997-07-22', 1, NULL, NULL),
(17916, 2, 1, '5035662', 'HENRY  SANTIAGO TRILLOS', NULL, NULL, '1976-02-07', '0', 'santiagotrilloshenry1070@gmail.com', NULL, '-1108931436', '1994-06-20', 1, NULL, NULL),
(17917, 2, 1, '5035193', 'HENRY DOLORES OSORIO OSORIO', NULL, NULL, '1963-02-22', '0', 'jerymayo@hotmail.com', NULL, '-1119802804', '1981-11-23', 1, NULL, NULL),
(17918, 2, 1, '5035153', 'HERIBERTO  GALVIZ VANEGAS', NULL, NULL, '1962-04-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1188964373', '1980-10-21', 1, NULL, NULL),
(17919, 2, 1, '1003121911', 'HERICK JESUS GARCIA DUARTE', NULL, NULL, '2000-01-14', '0', 'hjesusgd@gmail.com', NULL, '-1168613135', '2018-01-17', 1, NULL, NULL),
(17920, 2, 1, '80409770', 'HERMAN DARIO BLANCO RINCON', NULL, NULL, '1965-08-25', NULL, 'hermanblanco11@hotmail.com', NULL, '-1130799999', '1984-05-30', 1, NULL, NULL),
(17921, 2, 1, '19745012', 'HERMENIO  DUARTE GARCIA', NULL, NULL, '1957-09-10', '0', 'sincorreo@sincorreo.com', NULL, '-1090321162', '1976-01-17', 1, NULL, NULL),
(17922, 2, 1, '88144221', 'HERMES  GONZALES ANGARITA', NULL, NULL, '1968-05-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1176043522', '1988-09-28', 1, NULL, NULL),
(17923, 2, 1, '5035346', 'HERMES ANTONIO LOBO MOLINA', NULL, NULL, '1968-04-27', '0', 'hermes2768@hotmail.com', NULL, '-1127896905', '1986-08-15', 1, NULL, NULL),
(17924, 2, 1, '13374959', 'HERMES DE DIOS PABA', NULL, NULL, '1964-05-17', '0', 'sincorreo@sincorreo.com', NULL, '-1166095996', '1985-07-19', 1, NULL, NULL),
(17925, 2, 1, '13359057', 'HERMIDES  CASTILLA PACHECO', NULL, NULL, '1953-04-17', '0', 'sincorreo@sincorreo.com', NULL, '-1090852782', '1975-01-15', 1, NULL, NULL),
(17926, 2, 1, '1090985208', 'HERMIDES  RODRIGUEZ', NULL, NULL, '1989-05-15', '0', 'sincorreo@sincorreo.com', NULL, '-1160385467', '2007-09-26', 1, NULL, NULL),
(17927, 2, 1, '88142246', 'HERNAN  MANOSALVA MORA', NULL, NULL, '1968-12-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1146006105', '1987-03-04', 1, NULL, NULL),
(17928, 2, 1, '5035568', 'HERNAN  VARGAS SERRANO', NULL, NULL, '1973-04-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1161070992', '1991-07-27', 1, NULL, NULL),
(17929, 1, 1, '1066062150', 'HERNAN CAMILO VARGAS MANDON', NULL, NULL, '2005-08-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1191532488', '2012-10-08', 1, NULL, NULL),
(17930, 2, 1, '5428518', 'HERNAN DARIO DELGADO DUARTE', NULL, NULL, '1984-11-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1061596695', '2003-01-10', 1, NULL, NULL),
(17931, 2, 1, '12673003', 'HERNANDO  PORTILLO SUAREZ', NULL, NULL, '1942-05-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1171838884', '1965-05-05', 1, NULL, NULL),
(17932, 2, 1, '1066062810', 'HERNEY  MANDON NAVARRO', NULL, NULL, '1992-12-30', '0', 'hmandon92@gmail.com', NULL, '-1187254136', '2011-01-03', 1, NULL, NULL),
(17933, 2, 1, '1066063077', 'HEYDER  DUARTE GALVIZ', NULL, NULL, '1994-11-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1150089069', '2012-11-09', 1, NULL, NULL),
(17934, 2, 1, '1064836401', 'HIRGEN  SANTIAGO PALLARES', NULL, NULL, '1982-12-05', '0', 'sincorreo@sincorreo.com', NULL, '-1150196903', '2004-07-29', 1, NULL, NULL),
(17935, 2, 1, '26777275', 'HIRIS IBETH GALVIZ SANCHEZ', NULL, NULL, '1979-05-01', '0', 'hirgasa0105@gmail.com', NULL, '-1127145232', '1998-01-27', 1, NULL, NULL),
(17936, 2, 1, '5426939', 'HOLGER  QUINTERO MENESES', NULL, NULL, '1980-05-14', NULL, 'sincorreo@sincorreo.com', NULL, '-788661121', '1999-11-22', 1, NULL, NULL),
(17937, 2, 1, '1090988513', 'HOLGER OMAR CAMPO ARO', NULL, NULL, '1994-08-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1176895473', '2012-09-18', 1, NULL, NULL),
(17938, 2, 1, '1066062839', 'HOLMER PATRICIO CHINCHILLA GOMEZ', NULL, NULL, '1993-03-12', NULL, 'hpchinchillag@ufpso.edu.co', NULL, '-1186980005', '2011-03-28', 1, NULL, NULL),
(17939, 2, 1, '88278944', 'HOOVER  AVENDANO GUERRERO', NULL, NULL, '1974-01-01', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1992-03-09', 1, NULL, NULL),
(17940, 2, 1, '5036150', 'HUBER  BARBOSA CASTRO', NULL, NULL, '1979-02-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1116280919', '1997-05-26', 1, NULL, NULL),
(17941, 2, 1, '1007321252', 'HUBER  CASTILLA SANTIAGO', NULL, NULL, '1997-08-23', '0', 'sincorreo@sincorreo.com', NULL, '-1081770859', '2016-03-14', 1, NULL, NULL),
(17942, 2, 1, '1091657992', 'HUBER  TRIGOS VERJEL', NULL, NULL, '1986-02-25', '0', 'hubertrigos2018@gmail.com', NULL, '-1117266731', '2006-01-10', 1, NULL, NULL),
(17943, 2, 1, '5035102', 'HUBER DE JESUS RUEDA IBARRA', NULL, NULL, '1960-08-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1127692504', '1979-09-10', 1, NULL, NULL),
(17944, 2, 1, '5036361', 'HUBERNEL  GOMEZ GARCIA', NULL, NULL, '1985-07-05', '0', 'sincorreo@sincorreo.com', NULL, '-1116713716', '2003-07-24', 1, NULL, NULL),
(17945, 2, 1, '88279205', 'HUBERTH  MOLINA MORA', NULL, NULL, '1973-11-01', '0', 'sincorreo@sincorreo.com', NULL, '-1176671984', '1992-05-27', 1, NULL, NULL),
(17946, 2, 1, '1091682147', 'HUBERTH ANDREY MOLINA CHINCHILLA', NULL, NULL, '1999-04-02', '-1067093271', 'huberthandreym@gmail.com', NULL, NULL, '2017-05-23', 1, NULL, NULL),
(17947, 2, 1, '1066062094', 'HUGER HERLEY CARRILLO PICON', NULL, NULL, '1986-05-15', NULL, 'huger59@hotmail.com', NULL, '-1162164876', '2005-04-27', 1, NULL, NULL),
(17948, 2, 1, '1090986641', 'HUGO FERNEL MANDON GONZALEZ', NULL, NULL, '1991-08-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1169986701', '2009-09-30', 1, NULL, NULL),
(17949, 2, 1, '5035038', 'HUGO ORLANDO ASCANIO ROPERO', NULL, NULL, '1958-07-26', '0', 'sincorreo@sincorreo.com', NULL, '-787183304', '1997-03-09', 1, NULL, NULL),
(17950, 2, 1, '1063562282', 'HUMBERTO  MONSALVE', NULL, NULL, '1970-03-27', NULL, 'humbertomonsalve52@gmail.com', NULL, '-1192359028', '2009-07-21', 1, NULL, NULL),
(17951, 2, 1, '5083583', 'HUMBERTO  RAMIREZ HERRERA', NULL, NULL, '1958-05-16', NULL, 'hurahe@gmail.com', NULL, '-1176741179', '1977-12-22', 1, NULL, NULL),
(17952, 2, 1, '13377963', 'HUMBERTO  ROJAS SOLANO', NULL, NULL, '1974-09-12', NULL, 'hurs1309@hotmail.com', NULL, '-1156306956', '1992-10-28', 1, NULL, NULL),
(17953, 2, 1, '1066062248', 'HYRJENN MARIA SOLANO SOLANO', NULL, NULL, '1985-01-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1156783889', '2007-02-08', 1, NULL, NULL),
(17954, 2, 1, '13178413', 'IBER DEL CARMEN DUARTE PINEDA', NULL, NULL, '1985-07-16', '0', 'sincorreo@sincorreo.com', NULL, '-1151984809', '2003-08-08', 1, NULL, NULL),
(17955, 2, 1, '1066063492', 'IBETH KARINA DIAZ PEREA', NULL, NULL, '1998-02-24', NULL, 'ibethdiaz2498@gmail.com', NULL, '-1116820931', '2016-03-02', 1, NULL, NULL),
(17956, 2, 1, '13175011', 'IDAEL  GALVIZ MANOSALVA', NULL, NULL, '1982-08-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1170838768', '2001-04-26', 1, NULL, NULL),
(17957, 2, 1, '5036205', 'IDDAEL  LOZANO BACCA', NULL, NULL, '1981-01-16', '0', 'sincorreo@sincorreo.com', NULL, '-1147766010', '1999-02-16', 1, NULL, NULL),
(17958, 2, 1, '1066062757', 'IGNACIO  NAVARRO CLAVIJO', NULL, NULL, '1992-06-01', '0', 'ignacionavaro@gmail.com', NULL, '-1128703829', '2010-06-15', 1, NULL, NULL),
(17959, 2, 1, '1064838954', 'ILCELIS  OSORIO CHINCHILLA', NULL, NULL, '1992-01-20', NULL, 'iosorioc@ufpso.edu.co', NULL, '-1281469308', '2010-01-25', 1, NULL, NULL),
(17960, 2, 1, '26777125', 'ILGIA ROSA CASADIEGOS DE GARZON', NULL, NULL, '1944-02-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1182597420', '1966-10-21', 1, NULL, NULL),
(17961, 2, 1, '26774501', 'ILSE  MANOSALVA DE QUINTERO', NULL, NULL, '1945-05-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1150806287', '1974-10-15', 1, NULL, NULL),
(17962, 2, 1, '52694674', 'ILVA  JACOME DURAN', NULL, NULL, '1976-10-09', '0', 'sincorreo@sincorreo.com', NULL, '-1160485117', '1998-01-19', 1, NULL, NULL),
(17963, 2, 1, '26775064', 'ILVA  QUINTERO LOZANO', NULL, NULL, '1975-05-01', '0', 'sincorreo@sincorreo.com', NULL, '-1167372667', '1994-10-31', 1, NULL, NULL),
(17964, 2, 1, '26774421', 'ILVA ROSA RUEDAS DE PEREIRA', NULL, NULL, '1950-01-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1178458532', '1973-02-27', 1, NULL, NULL),
(17965, 2, 1, '88135179', 'INAEL  MOLINA MORA', NULL, NULL, '1962-04-04', '0', 'sincorreo@sincorreo.com', NULL, '-1169758557', '1980-07-21', 1, NULL, NULL),
(17966, 2, 1, '26775048', 'INDIRA  GUTIERREZ QUINTERO', NULL, NULL, '1972-07-04', '0', 'sincorreo@sincorreo.com', NULL, '-1159977908', '1993-11-30', 1, NULL, NULL),
(17967, 2, 1, '1090988372', 'INDIRA YURANY FUENTES JACOME', NULL, NULL, '1994-05-08', '0', 'sincorreo@gmail.com', NULL, '-1085537545', '2012-06-14', 1, NULL, NULL),
(17968, 2, 1, '22409947', 'INES  BLANCO DE OSORIO', NULL, NULL, '1952-10-01', NULL, 'inesblancodeo@hotmail.com', NULL, NULL, '1974-10-07', 1, NULL, NULL),
(17969, 2, 1, '1091679273', 'INGRITH XIOMARA MOLINA SANTIAGO', NULL, NULL, '1997-09-14', '0', 'ingrithmolina@hotmail.com', NULL, '-1156193230', '2015-12-09', 1, NULL, NULL),
(17970, 2, 1, '37327261', 'IRENE  GALVIZ PACHECO', NULL, NULL, '1974-02-04', '0', 'irenegalvizp@gmail.com', NULL, '-1091799120', '1992-12-03', 1, NULL, NULL),
(17971, 2, 1, '1066062761', 'IRMA DEL CONSUELO RIVERA NAVARRO', NULL, NULL, '1992-05-17', '0', 'irivera.ipk30642@gmail.com', NULL, '-1191535469', '2010-06-22', 1, NULL, NULL),
(17972, 2, 1, '26860901', 'IRMA DEL SOCORRO CASADIEGO DE GARCIA', NULL, NULL, '1947-07-21', '0', 'icaki58@hotmail.com', NULL, '-1141144438', '1971-08-19', 1, NULL, NULL),
(17973, 2, 1, '5036216', 'ISAAC  PENUELA ECHAVEZ', NULL, NULL, '1981-06-21', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1999-07-22', 1, NULL, NULL),
(17974, 2, 1, '26774794', 'ISABEL  MANOSALVA DUARTE', NULL, NULL, '1961-05-19', '0', 'sincorreo@sincorreo.com', NULL, '-1121438798', '1985-08-06', 1, NULL, NULL),
(17975, 2, 1, '49655486', 'ISABEL  SOLANO LERISIT', NULL, NULL, '1967-04-14', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1985-12-09', 1, NULL, NULL),
(17976, 2, 1, '37370310', 'ISABEL  VARGAS PEÃ‘ARANDA', NULL, NULL, '1978-06-18', '0', 'sincorreo@sincorreo.com', NULL, '-1188094503', '1996-08-01', 1, NULL, NULL),
(17977, 2, 1, '27659699', 'ISABEL MARIA TORRES GARCIA', NULL, NULL, '1942-06-26', '5612809', 'sincorreo@sincorreo.com', NULL, '-1161602177', '1974-01-21', 1, NULL, NULL),
(17978, 2, 1, '37317817', 'ISABEL MARIA VEGA SANJUAN', NULL, NULL, '1963-11-28', '0', 'sincorreo@sincorreo.com', NULL, '-1129995204', '1983-12-12', 1, NULL, NULL),
(17979, 1, 1, '1064086087', 'ISABELLA  SANGUINO OSORIO', NULL, NULL, '2004-10-24', '0', 'sanguinoosorioisabella@gmail.com', NULL, '-1161316415', '2018-01-18', 1, NULL, NULL),
(17980, 2, 1, '5035438', 'ISAIAS  DURAN PORTILLO', NULL, NULL, '1970-04-17', '0', 'sincorreo@sincorreo.com', NULL, '-1176572142', '1988-09-08', 1, NULL, NULL),
(17981, 2, 1, '1091533905', 'ISAID  QUINTERO LOZANO', NULL, NULL, '1991-11-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1166295226', '2010-04-07', 1, NULL, NULL),
(17982, 2, 1, '1066062206', 'ISAIDD  ANGARITA DUARTE', NULL, NULL, '1988-02-05', NULL, 'isaidangarita1@gmail.com', NULL, '-1089681072', '2006-02-27', 1, NULL, NULL),
(17983, 2, 1, '5035558', 'ISIDRO  ANGARITA PACHECO', NULL, NULL, '1973-04-02', '0', 'isidroangarita2019@gmail.com', NULL, '-1127388101', '1991-07-27', 1, NULL, NULL),
(17984, 2, 1, '5035214', 'ISIDRO  DUARTE GUTIERREZ', NULL, NULL, '1962-05-21', '0', 'sincorreo@sincorreo.com', NULL, '-1169965922', '1981-12-14', 1, NULL, NULL),
(17985, 2, 1, '1092174374', 'ISLEY CAMILA CARREÃ‘O CACERES', NULL, NULL, '2004-02-28', '0', 'camila.caceres001@gmail.com', NULL, '-1156042440', '2022-03-18', 1, NULL, NULL),
(17986, 2, 1, '88138620', 'ISMAEL  LOPEZ', NULL, NULL, '1964-09-10', '0', 'mariajohanamolinalemus@gmail.com', NULL, '-1168645898', '1983-09-01', 1, NULL, NULL),
(17987, 2, 1, '1003257778', 'ISMAEL ALBERTO LOPEZ MOLINA', NULL, NULL, '2000-05-12', '0', 'isyo.12@hotmail.com', NULL, '-1106942418', '2018-05-15', 1, NULL, NULL),
(17988, 2, 1, '5035092', 'ISNARDO  QUINTERO ANGARITA', NULL, NULL, '1960-05-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1106042170', '1979-05-14', 1, NULL, NULL),
(17989, 2, 1, '1066063604', 'ISNARDO ANDRES CORTES OSORIO', NULL, NULL, '1998-12-18', NULL, 'andres.cortes1898@hotmail.com', NULL, '-1127997703', '2017-01-20', 1, NULL, NULL),
(17990, 2, 1, '1091683125', 'ISNARDO ANDREY GALVIZ GARCIA', NULL, NULL, '1999-10-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1150365015', '2017-12-04', 1, NULL, NULL),
(17991, 2, 1, '13371298', 'ISRAEL  CORONEL VILLAMIZAR', NULL, NULL, '1956-09-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1151647567', '1976-01-17', 1, NULL, NULL),
(17992, 2, 1, '5035298', 'ISRAEL  GOMEZ GARCIA', NULL, NULL, '1966-10-04', '0', 'sincorreo@sincorreo.com', NULL, '-1142355258', '1985-01-10', 1, NULL, NULL),
(17993, 2, 1, '19745007', 'ISRAEL  GOMEZ ROPERO', NULL, NULL, '1956-10-01', '0', 'sincorreo@sincorreo.com', NULL, '-1117254433', '1976-01-17', 1, NULL, NULL),
(17994, 2, 1, '1066062060', 'ISVENNY YULIETH RUEDAS SUAREZ', NULL, NULL, '1985-04-23', '0', 'Yuliethruedas57@gmail.Com', NULL, '-1110727158', '2004-04-28', 1, NULL, NULL),
(17995, 2, 1, '13379960', 'IVAN  BAENE RINCON', NULL, NULL, '1980-06-26', '0', 'andres2025leon@gmail.com', NULL, '-1160447730', '1998-12-15', 1, NULL, NULL),
(17996, 2, 1, '13372467', 'IVAN  DUARTE OREJUELA', NULL, NULL, '1954-07-15', '0', 'sincorreo@sincorreo.com', NULL, '-1077229385', '1977-10-11', 1, NULL, NULL),
(17997, 2, 1, '13377124', 'IVAN  MANDON HARO', NULL, NULL, '1971-01-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1091279789', '1990-07-31', 1, NULL, NULL),
(17998, 2, 1, '13376540', 'IVAN  MANDON MANDON', NULL, NULL, '1970-10-17', '0', 'sincorreo@sincorreo.com', NULL, '-1085188314', '1988-11-23', 1, NULL, NULL),
(17999, 2, 1, '5036153', 'IVAN  MANZANO DURAN', NULL, NULL, '1976-09-15', '0', 'sincorreo@sincorreo.com', NULL, '-1161940862', '1997-05-27', 1, NULL, NULL),
(18000, 2, 1, '13378856', 'IVAN  ROJAS TORRES', NULL, NULL, '1976-07-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1085220168', '1995-08-17', 1, NULL, NULL),
(18001, 2, 1, '5035304', 'IVAN  SOLANO GUERRERO', NULL, NULL, '1962-06-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1091804336', '1985-04-18', 1, NULL, NULL),
(18002, 2, 1, '1091652364', 'IVAN  TORRES SANCHEZ', NULL, NULL, '1985-12-23', '0', 'it5883973@gmail.com', NULL, '-1182352333', '2004-02-06', 1, NULL, NULL),
(18003, 2, 1, '1091662690', 'IVAN DARIO ARIAS JACOME', NULL, NULL, '1989-12-15', NULL, 'nifono_02@hotmail.com', NULL, '-1081051041', '2008-01-16', 1, NULL, NULL),
(18004, 2, 1, '26774828', 'IXORY DEL SOCORRO GALVIS SANCHEZ', NULL, NULL, '1962-04-07', '5813348', 'sincorreo@sincorreo.com', NULL, '-1081232504', '1987-09-09', 1, NULL, NULL),
(18005, 2, 1, '57464696', 'JACQUELINE KARINA BRAVO VIDES', NULL, NULL, '1984-07-22', NULL, 'jackelinebravo385@gmail.com', NULL, '-1139343902', '2003-07-18', 1, NULL, NULL),
(18006, 2, 1, '37327277', 'JADIVI  SANTIAGO AMAYA', NULL, NULL, '1974-06-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1107282659', '1992-12-03', 1, NULL, NULL),
(18007, 1, 1, '1092731747', 'JAICELA  GUERRERO AVENDA?O', NULL, NULL, '2005-08-09', '0', 'guerrerojjaicela3@gmail.com', NULL, '-1070617245', '2019-09-03', 1, NULL, NULL),
(18008, 1, 1, '1193140141', 'JAIDER  PABA LOBO', NULL, NULL, '2002-12-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1176934369', '2010-02-25', 1, NULL, NULL),
(18009, 1, 1, '1091472024', 'JAIDER  PEÃ‘ARANDA TORRADO', NULL, NULL, '2005-05-10', '0', 'jaiderpenarandatorrado19@gmail.com', NULL, '-1091769640', '2020-01-15', 1, NULL, NULL),
(18010, 2, 1, '1066062748', 'JAIDER ALBERTO PEREZ GALVIZ', NULL, NULL, '1991-12-28', '0', 'kjaider28@hotmail.es', NULL, '-1079006527', '2010-05-19', 1, NULL, NULL),
(18011, 2, 1, '19665415', 'JAIME  MARTINEZ GUARGUATI', NULL, NULL, '1967-04-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1110501039', '1988-09-08', 1, NULL, NULL),
(18012, 2, 1, '13377780', 'JAIME ALONSO PAEZ ACOSTA', NULL, NULL, '1974-01-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1151209972', '1992-03-19', 1, NULL, NULL),
(18013, 2, 1, '18904084', 'JAIME ELIECER MIRANDA TORRES', NULL, NULL, '1982-05-01', NULL, 'jaimemiranda1_5@hotmail.com', NULL, '-1119916199', '2000-05-09', 1, NULL, NULL),
(18014, 2, 1, '1066063441', 'JAIME LUIS PALLARES MANOSALVA', NULL, NULL, '1997-08-29', '0', 'sincorreo@sincorreo.com', NULL, '-1192672996', '2015-09-16', 1, NULL, NULL),
(18015, 2, 1, '5036261', 'JAIME LUIS PEREZ JACOME', NULL, NULL, '1982-04-04', '0', 'sincorreo@sincorreo.com', NULL, '-1160417705', '2000-05-04', 1, NULL, NULL),
(18016, 2, 1, '5035468', 'JAIME RENE GARCIA CASADIEGOS', NULL, NULL, '1970-04-24', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1988-12-07', 1, NULL, NULL),
(18017, 2, 1, '88282885', 'JAIME YAIR SALAZAR PRADO', NULL, NULL, '1975-12-10', '0', 'sincorreo@sincorreo.com', NULL, '-1170354359', '1995-05-23', 1, NULL, NULL),
(18018, 2, 1, '1003257705', 'JAIMER ALFONSO CUETO TRILLOS', NULL, NULL, '1991-01-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1159862704', '2009-03-05', 1, NULL, NULL),
(18019, 2, 1, '1066062470', 'JAIR EDUARDO NAVARRO MOLINA', NULL, NULL, '1990-01-11', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2008-04-01', 1, NULL, NULL),
(18020, 2, 1, '5035629', 'JAIRO  GOMEZ ROPERO', NULL, NULL, '1974-07-14', '0', 'sincorreo@sincorreo.com', NULL, '-1192440268', '1993-02-12', 1, NULL, NULL),
(18021, 2, 1, '13377226', 'JAIRO  JACOME CUBIDES', NULL, NULL, '1971-09-02', '0', 'sincorreo@sincorreo.com', NULL, '-1149321126', '1990-09-06', 1, NULL, NULL),
(18022, 2, 1, '5035277', 'JAIRO  MOLINA BALLESTEROS', NULL, NULL, '1961-09-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1172194604', '1983-12-12', 1, NULL, NULL),
(18023, 2, 1, '5035498', 'JAIRO  PALLARES GARCIA', NULL, NULL, '1971-04-16', '0', 'sincorreo@sincorreo.com', NULL, '-1120851851', '1989-07-27', 1, NULL, NULL),
(18024, 2, 1, '13175099', 'JAIRO  QUINTERO ECHAVEZ', NULL, NULL, '1982-08-04', NULL, 'notiene@notiene.com', NULL, NULL, '2001-05-24', 1, NULL, NULL),
(18025, 2, 1, '88276119', 'JAIRO  RUEDAS RINCON', NULL, NULL, '1971-04-30', '0', 'sincorreo@sincorreo.com', NULL, '-1162854335', '1989-07-24', 1, NULL, NULL),
(18026, 2, 1, '1090984687', 'JAIRO ANTONIO PICON NORIEGA', NULL, NULL, '1988-11-25', '0', 'sincorreo@sincorreo.com', NULL, '-1081861822', '2007-01-19', 1, NULL, NULL),
(18027, 2, 1, '18916309', 'JAIRO ANTONIO SOLANO DURAN', NULL, NULL, '1959-06-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1090328084', '1979-12-09', 1, NULL, NULL),
(18028, 2, 1, '88141335', 'JAIRO DE JESUS URIBE HERRERA', NULL, NULL, '1967-10-07', '0', 'sincorreo@sincorreo.com', NULL, '-1121341910', '1985-12-09', 1, NULL, NULL),
(18029, 2, 1, '12611923', 'JAIRO MANUEL BARRERA MANGA', NULL, NULL, '1952-10-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1127377396', '1974-01-21', 1, NULL, NULL),
(18030, 2, 1, '13177467', 'JAMES  MARTINEZ CARDENAS', NULL, NULL, '1984-10-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1182049006', '2003-01-15', 1, NULL, NULL),
(18031, 2, 1, '1092174812', 'JANIS SOFIA FRANCO LEBOLO', NULL, NULL, '2004-06-18', '0', 'janissofiafrancolebolo@gmail.com', NULL, '-1109122822', '2022-07-18', 1, NULL, NULL),
(18032, 2, 1, '13371649', 'JAVIER  BALLESTEROS JACOME', NULL, NULL, '1958-06-15', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1976-09-21', 1, NULL, NULL),
(18033, 2, 1, '19745008', 'JAVIER  GOMEZ GARCIA', NULL, NULL, '1957-07-15', '0', 'sincorreo@sincorreo.com', NULL, '-1175976790', '1976-01-17', 1, NULL, NULL),
(18034, 2, 1, '12566796', 'JAVIER  LINDARTE JULIO', NULL, NULL, '1970-12-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1111188118', '1989-12-11', 1, NULL, NULL),
(18035, 2, 1, '5035128', 'JAVIER  LOZAN0 RIOS', NULL, NULL, '1960-08-17', '0', 'sincorreo@sincorreo.com', NULL, '-1150711910', '1979-12-09', 1, NULL, NULL),
(18036, 2, 1, '1005038585', 'JAVIER ALBERTO RANGEL GUERRERO', NULL, NULL, '1987-05-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1182429535', '2005-09-09', 1, NULL, NULL),
(18037, 2, 1, '5035552', 'JAVIER DE JESUS GUTIERREZ', NULL, NULL, '1968-08-09', '0', 'sincorreo@sincorreo.com', NULL, '-1177976877', '1991-03-13', 1, NULL, NULL),
(18038, 1, 1, '1065583730', 'JAVIER ELIAS SIERRA PABA', NULL, NULL, '2005-06-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1139526066', '2012-06-22', 1, NULL, NULL),
(18039, 2, 1, '1090985553', 'JAVIER MAURICIO REYES QUINTERO', NULL, NULL, '1989-11-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1160312373', '2008-04-30', 1, NULL, NULL),
(18040, 2, 1, '1066063560', 'JEAN CARLOS VACCA PORTILLO', NULL, NULL, '1998-03-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1067310164', '2016-09-06', 1, NULL, NULL),
(18041, 1, 1, '1193091124', 'JEFFER ANDREY QUINTERO GARCIA', NULL, NULL, '2001-11-15', NULL, 'jefferquintero44@gmail.com', NULL, '-1108268945', '2015-12-04', 1, NULL, NULL),
(18042, 2, 1, '5036201', 'JEHISON ADAN MORA PICON', NULL, NULL, '1980-08-11', '0', 'sincorreo@sincorreo.com', NULL, '-1129766179', '1998-10-30', 1, NULL, NULL),
(18043, 2, 1, '1003257553', 'JEISON FABIAN MENDOZA MENDOZA', NULL, NULL, '1997-01-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1180397761', '2015-01-23', 1, NULL, NULL),
(18044, 2, 1, '1098701762', 'JEISON JULIAN MEJIA OJEDA', NULL, NULL, '1991-03-12', NULL, 'jeisonjul@hotmail.com', NULL, '-1086571962', '2009-03-17', 1, NULL, NULL),
(18045, 2, 1, '1065571332', 'JENIFERTH ASTRID DAZA DUARTE', NULL, NULL, '1986-06-24', '0', 'jeniferth24@hotmail.com', NULL, '-1116187805', '2004-06-29', 1, NULL, NULL),
(18046, 1, 1, '1064086141', 'JENNIFER  LOPEZ MOLINA', NULL, NULL, '2005-09-22', '0', 'jenniferlopezmolina371@gmail.com', NULL, '-1117849635', '2016-09-19', 1, NULL, NULL),
(18047, 2, 1, '37293226', 'JENNY ALEXANDRA PORTILLO PABA', NULL, NULL, '1983-09-29', '1760665928', 'jeal2006@hotmail.com', NULL, '-1129186929', '2001-11-09', 1, NULL, NULL),
(18048, 2, 1, '1066063307', 'JENNY PAHOLA MANOSALVA CA?IZARES', NULL, NULL, '1996-09-16', NULL, 'paholita1996@gmail.com', NULL, '-1126009279', '2014-10-09', 1, NULL, NULL),
(18049, 2, 1, '88281199', 'JEONIER  BOHORQUEZ PORTILLO', NULL, NULL, '1975-10-21', '0', 'jeobohorquez2401@gmail.com', NULL, '-1129214155', '1993-12-13', 1, NULL, NULL),
(18050, 2, 1, '1066062000', 'JEOVANI  RANGEL AVENDA?O', NULL, NULL, '1980-05-24', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2004-02-26', 1, NULL, NULL),
(18051, 2, 1, '1064837803', 'JEREMIAS  VERGEL TRILLOS', NULL, NULL, '1988-05-28', '0', 'jeremitriver@gmail.com', NULL, '-1140739964', '2007-03-14', 1, NULL, NULL),
(18052, 2, 1, '1066062734', 'JERSON CAMILO DUARTE GUTIERREZ', NULL, NULL, '1992-01-17', NULL, 'y.jerson14@hotmail.com.', NULL, NULL, '2010-04-22', 1, NULL, NULL),
(18053, 2, 1, '79913028', 'JERZY JOHNSTON MENDOZA GALVIZ', NULL, NULL, '1978-04-22', '0', 'jerzyjohnston@yahoo.com', NULL, '-1109680166', '1996-08-26', 1, NULL, NULL),
(18054, 2, 1, '1066062365', 'JESSICA  GONZALEZ LOBO', NULL, NULL, '1989-03-09', '0', 'jessicagonzalezlobo@gmail.com', NULL, '-1142072808', '2007-04-10', 1, NULL, NULL),
(18055, 1, 1, '-1693440376', 'JESSYCA PAOLA PACHECO SUAREZ', NULL, NULL, '1997-09-08', NULL, 'YEKA.97.HOTMAIL.CO.@GMAIL.COM', NULL, NULL, '2007-11-15', 1, NULL, NULL),
(18056, 2, 1, '5036137', 'JESUS  ANGARITA DUARTE', NULL, NULL, '1978-06-24', '0', 'sincorreo@sincorreo.com', NULL, '-1079005313', '1997-04-30', 1, NULL, NULL),
(18057, 2, 1, '5428568', 'JESUS  TORRES VERA', NULL, NULL, '1984-12-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1176006975', '2003-02-14', 1, NULL, NULL),
(18058, 2, 1, '5035505', 'JESUS ABEL CARRE?O RUEDAS', NULL, NULL, '1970-04-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1182873592', '1989-09-08', 1, NULL, NULL),
(18059, 2, 1, '88277018', 'JESUS ABEL SANTIAGO NAVARRO', NULL, NULL, '1972-02-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1088296699', '1990-07-30', 1, NULL, NULL),
(18060, 2, 1, '5036190', 'JESUS ALBEIRO LOZANO SALAZAR', NULL, NULL, '1980-03-25', '0', 'sincorreo@sincorreo.com', NULL, '-1079873565', '1998-04-28', 1, NULL, NULL),
(18061, 2, 1, '1066063054', 'JESUS ALBERTO NAVARRO PINEDA', NULL, NULL, '1994-09-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1182063938', '2012-09-27', 1, NULL, NULL),
(18062, 2, 1, '1064841018', 'JESUS ALBERTO SANTANA GALVIZ', NULL, NULL, '1995-06-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1152434646', '2013-07-10', 1, NULL, NULL),
(18063, 2, 1, '1065599925', 'JESUS ALEJANDRO QUINTERO ARIAS', NULL, NULL, '1988-11-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1123824169', '2006-12-04', 1, NULL, NULL),
(18064, 2, 1, '1064841486', 'JESUS ALEXANDER BACCA CACERES', NULL, NULL, '1995-07-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1161194880', '2014-07-11', 1, NULL, NULL),
(18065, 2, 1, '1066062544', 'JESUS ALFONSO MANOSALVA', NULL, NULL, '1990-01-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1142930849', '2008-11-05', 1, NULL, NULL),
(18066, 2, 1, '88144744', 'JESUS ALFREDO MANZANO ZUTA', NULL, NULL, '1969-05-17', '0', 'sincorreo@sincorreo.com', NULL, '-1181518111', '1989-02-27', 1, NULL, NULL),
(18067, 2, 1, '1066062931', 'JESUS ALFREDO SOLANO CASTRO', NULL, NULL, '1993-12-25', '0', 'jeal_soca@hotmail.com', NULL, '-1082768078', '2012-01-03', 1, NULL, NULL),
(18068, 2, 1, '13176868', 'JESUS ALONSO CARVAJALINO GUILLIN', NULL, NULL, '1983-05-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1176648736', '2002-09-09', 1, NULL, NULL),
(18069, 2, 2, '13479975', 'JESUS AMADO FLOREZ ORDO?EZ', NULL, NULL, '1966-03-13', NULL, 'jesamado1366@hotmail.com', NULL, '-1176879319', '1984-05-31', 1, NULL, NULL),
(18070, 2, 1, '1091665184', 'JESUS ANDRES VALBUENA VALDERRAMA', NULL, NULL, '1991-01-13', '0', 'avalbuenaavendano@gmail.com', NULL, '-1180858156', '2009-03-03', 1, NULL, NULL),
(18071, 2, 1, '1065892548', 'JESUS ANDRES VERA CHINCHILLA', NULL, NULL, '1992-06-03', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2010-09-27', 1, NULL, NULL),
(18072, 2, 1, '5453887', 'JESUS ANGEL ROPERO TORRADO', NULL, NULL, '1961-08-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1140991127', '1979-11-13', 1, NULL, NULL),
(18073, 2, 1, '1066062781', 'JESUS ANIBAL BARBOSA RIVERA', NULL, NULL, '1992-08-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1161937640', '2010-09-13', 1, NULL, NULL),
(18074, 2, 1, '5035221', 'JESUS ANTONIO BAYONA MANZANO', NULL, NULL, '1962-09-20', '0', 'sincorreo@sincorreo.com', NULL, '-1171161121', '1982-08-18', 1, NULL, NULL),
(18075, 2, 1, '88278554', 'JESUS ANTONIO MU?OZ GUILLIN', NULL, NULL, '1970-06-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1188025902', '1991-07-27', 1, NULL, NULL),
(18076, 2, 1, '1091655971', 'JESUS ARIEL AMAYA AMAYA', NULL, NULL, '1987-04-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1191806953', '2005-04-20', 1, NULL, NULL),
(18077, 2, 1, '1003257406', 'JESUS ARMANDO SANCHEZ LOZANO', NULL, NULL, '2001-12-26', '0', 'jesusarmandopo207@gmail.com', NULL, '-1062159937', '2021-01-05', 1, NULL, NULL),
(18078, 2, 1, '1003257537', 'JESUS DAVID MOLINA DUARTE', NULL, NULL, '2000-12-24', '0', 'jdnolina@gmail.com', NULL, '-1182383334', '2018-12-24', 1, NULL, NULL),
(18079, 2, 1, '1066063122', 'JESUS DAVID TORRES RIOS', NULL, NULL, '1994-11-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1087591088', '2013-04-08', 1, NULL, NULL),
(18080, 2, 1, '13168879', 'JESUS DAVID TRIGOS ORTIZ', NULL, NULL, '1973-09-23', '0', 'sincorreo@sincorreo.com', NULL, '-1160297888', '1997-06-18', 1, NULL, NULL),
(18081, 2, 1, '5035295', 'JESUS EDGARDO NAVARRO DUARTE', NULL, NULL, '1966-03-31', NULL, 'jeednadu@hotmail.com', NULL, '-1117213544', '1985-01-10', 1, NULL, NULL),
(18082, 2, 1, '1066063203', 'JESUS EDUARDO CASTRO DUARTE', NULL, NULL, '1995-10-14', '0', 'jesuscastroc05@gmail.com', NULL, '-1128497875', '2013-10-29', 1, NULL, NULL),
(18083, 2, 1, '1066062097', 'JESUS EDUARDO GUTIERREZ QUINTERO', NULL, NULL, '1986-10-06', '0', 'sincorreo@sincorreo.com', NULL, '-1150430046', '2005-05-17', 1, NULL, NULL),
(18084, 2, 1, '5035656', 'JESUS ELIGIO GALVIZ QUINTERO', NULL, NULL, '1973-04-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1156607509', '1994-02-07', 1, NULL, NULL),
(18085, 2, 1, '1977492', 'JESUS EMEL AMAYA CASTRO', NULL, NULL, '1979-09-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1192166431', '1997-10-14', 1, NULL, NULL),
(18086, 2, 1, '12668035', 'JESUS EMEL LOZANO CHINCHILLA', NULL, NULL, '1969-09-04', '0', 'sincorreo@sincorreo.com', NULL, '-1170944978', '1987-09-07', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(18087, 2, 1, '13373588', 'JESUS EMEL MANDON AGUILAR', NULL, NULL, '1960-06-17', '0', 'sincorreo@sincorreo.com', NULL, '-1088920650', '1980-10-31', 1, NULL, NULL),
(18088, 2, 1, '1734075', 'JESUS EMEL MANOSALVA MOLINA', NULL, NULL, '1956-08-03', '0', 'sincorreo@sincorreo.com', NULL, '-1138516515', '1976-01-17', 1, NULL, NULL),
(18089, 2, 1, '88282699', 'JESUS EMILIO BECERRA PEREZ', NULL, NULL, '1976-02-13', '0', 'sincorreo@sincorreo.com', NULL, '-1192654475', '1995-02-15', 1, NULL, NULL),
(18090, 2, 1, '5453380', 'JESUS EMILIO GUERRERO CASTILLA', NULL, NULL, '1954-03-03', '0', 'sincorreo@sincorreo.com', NULL, '-1179248193', '1975-06-24', 1, NULL, NULL),
(18091, 2, 1, '5035480', 'JESUS EMILIO SANTIAGO QUINTERO', NULL, NULL, '1970-12-13', '0', 'sincorreo@sincorreo.com', NULL, '-1090403243', '1989-02-23', 1, NULL, NULL),
(18092, 2, 1, '13167452', 'JESUS EMIRO BELTRAN SANCHEZ', NULL, NULL, '1969-11-14', '0', 'sincorreo@sincorreo.com', NULL, '-1067310160', '1989-03-15', 1, NULL, NULL),
(18093, 2, 1, '1090988470', 'JESUS EMIRO CORONEL ESTRADA', NULL, NULL, '1994-08-15', '0', 'civilcoronel1694@gmail.com', NULL, '-1189533864', '2012-08-23', 1, NULL, NULL),
(18094, 2, 1, '13377800', 'JESUS EMIRO ESPINEL TRUJILLO', NULL, NULL, '1970-11-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1178220881', '1992-05-04', 1, NULL, NULL),
(18095, 2, 1, '5035123', 'JESUS EMIRO GAONA MANZANO', NULL, NULL, '1960-12-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1170651867', '1979-12-09', 1, NULL, NULL),
(18096, 2, 1, '5035035', 'JESUS EMIRO MENDOZA SANTIAGO', NULL, NULL, '1957-04-27', '0', 'sincorreo@sincorreo.com', NULL, '-1108106352', '1977-03-09', 1, NULL, NULL),
(18097, 2, 1, '88139815', 'JESUS EMIRO RODRIGUEZ CLARO', NULL, NULL, '1965-12-07', '0', 'sicorreo@sincorreo.com', NULL, '-1182320338', '1984-10-04', 1, NULL, NULL),
(18098, 2, 1, '5035463', 'JESUS EVELIO PEREIRA RUEDAS', NULL, NULL, '1969-12-22', '0', 'sincorreo@sincorreo.com', NULL, '-1090444759', '1988-11-09', 1, NULL, NULL),
(18099, 2, 1, '5468650', 'JESUS EVELIO SANTIAGO TORO', NULL, NULL, '1980-09-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1179445922', '1998-11-20', 1, NULL, NULL),
(18100, 2, 1, '5035643', 'JESUS HUMBERTO LOZANO MANOSALVA', NULL, NULL, '1974-09-22', '0', 'sincorreo@sincorreo.com', NULL, '-1082372268', '1993-09-01', 1, NULL, NULL),
(18101, 2, 1, '5035174', 'JESUS HUMBERTO OSORIO LEMUS', NULL, NULL, '1962-07-04', NULL, 'osoriolemusjesushumberto@yahoo.com', NULL, '-1109818336', '1981-05-13', 1, NULL, NULL),
(18102, 2, 1, '1090986129', 'JESUS JAVIER ORTEGA BAYONA', NULL, NULL, '1990-12-02', '0', 'jjortegabayona@gmail.com', NULL, '-1152171941', '2009-02-02', 1, NULL, NULL),
(18103, 2, 1, '13178123', 'JESUS JHONEISON AMAYA AMAYA', NULL, NULL, '1985-04-25', '0', 'amayaamayajhoneison@gmail.com', NULL, '-1149204936', '2003-06-20', 1, NULL, NULL),
(18104, 2, 1, '1066063225', 'JESUS LEONARDO TORRES TORRES', NULL, NULL, '1995-12-24', NULL, 'jlt122495@gmail.com', NULL, '-1190265316', '2014-01-13', 1, NULL, NULL),
(18105, 2, 1, '88280985', 'JESUS MARIA CARRASCAL PRADO', NULL, NULL, '1973-05-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1082282213', '1993-09-30', 1, NULL, NULL),
(18106, 2, 1, '5035135', 'JESUS MARIA NAVARRO MENDOZA', NULL, NULL, '1961-03-03', '0', 'sincorreo@sincorreo.com', NULL, '-1091635191', '1979-12-09', 1, NULL, NULL),
(18107, 2, 1, '5407628', 'JESUS MARIA PENARANDA BAYONA', NULL, NULL, '1958-01-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1079343783', '1977-05-17', 1, NULL, NULL),
(18108, 2, 1, '1064836638', 'JESUS MARIA PINZON PACHECO', NULL, NULL, '1986-12-31', '0', 'teloimploro@gmail.com', NULL, '-1090558623', '2005-01-12', 1, NULL, NULL),
(18109, 2, 1, '13379889', 'JESUS NAIN DELGADO DUARTE', NULL, NULL, '1980-06-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1161399331', '1998-10-13', 1, NULL, NULL),
(18110, 2, 1, '5083595', 'JESUS SALVADOR MENESES PICON', NULL, NULL, '1958-05-20', '0', 'sincorreo@sincorreo.com', NULL, '-1090123673', '1978-03-03', 1, NULL, NULL),
(18111, 2, 1, '5035357', 'JESUS SALVADOR PEREZ GALVIZ', NULL, NULL, '1962-01-27', '0', 'sincorreo@sincorreo.com', NULL, '-1179335192', '1986-11-11', 1, NULL, NULL),
(18112, 2, 1, '88142785', 'JESUS SALVADOR RODRIGUEZ PICON', NULL, NULL, '1968-05-20', '0', 'esperanza123456com@gmail.com', NULL, '-1186127871', '1987-08-06', 1, NULL, NULL),
(18113, 2, 1, '13175340', 'JESUS YAIR SALAZAR ARGOTA', NULL, NULL, '1983-06-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1075332409', '2001-07-25', 1, NULL, NULL),
(18114, 2, 1, '5036119', 'JESUS YAMID VELASQUEZ CASTRO', NULL, NULL, '1978-07-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1087355468', '1996-10-31', 1, NULL, NULL),
(18115, 2, 1, '60278430', 'JESUSITA  CARRASCAL', NULL, NULL, '1956-10-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1192206269', '1979-02-28', 1, NULL, NULL),
(18116, 2, 1, '26774375', 'JESUSITA  PACHECO QUINTERO', NULL, NULL, '1946-03-07', '0', 'sincorreo@sincorreo.com', NULL, '-1126599177', '1969-03-26', 1, NULL, NULL),
(18117, 2, 1, '1979355', 'JHAN CARLO MARTINEZ LANZZIANO', NULL, NULL, '1980-04-30', NULL, 'ingjhnancarlo@hotmail.com', NULL, '-1182101907', '1998-06-12', 1, NULL, NULL),
(18118, 1, 1, '1092175270', 'JHAN CARLOS DUARTE GALVIZ', NULL, NULL, '2004-10-01', '0', 'duartegalvizjhancarlos@gmail.com', NULL, '-1160630845', '2019-11-26', 1, NULL, NULL),
(18119, 2, 1, '1066063196', 'JHAN CARLOS RODRIGUEZ TORRES', NULL, NULL, '1995-10-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1182894224', '2013-10-21', 1, NULL, NULL),
(18120, 2, 1, '1066063034', 'JHAN REIVEN RUEDAS GARZON', NULL, NULL, '1994-07-12', NULL, 'maychel.05@hotmail.com', NULL, '-1136134418', '2012-08-14', 1, NULL, NULL),
(18121, 2, 1, '1066063386', 'JHANN CARLOS NORIEGA BAYONA', NULL, NULL, '1996-05-14', '0', 'jhanknoriega86@gmail.com', NULL, '-1067731097', '2015-04-15', 1, NULL, NULL),
(18122, 2, 1, '1098799842', 'JHARLY ALFONSO RIOS RUEDAS', NULL, NULL, '1997-08-17', NULL, 'jarlymanda@gmail.com', NULL, '-1171536844', '2015-09-04', 1, NULL, NULL),
(18123, 1, 1, '-683485388', 'JHOAN DARIO MOLINA RAMIREZ', NULL, NULL, '1998-10-07', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2012-11-14', 1, NULL, NULL),
(18124, 2, 1, '13176383', 'JHOL FRANI BECERRA PEREZ', NULL, NULL, '1982-11-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1081316227', '2002-04-18', 1, NULL, NULL),
(18125, 2, 1, '5036278', 'JHON ALEJANDRO MENDOZA SANTIAGO', NULL, NULL, '1982-04-28', '0', 'sincorreo@sincorreo.com', NULL, '-1107087626', '2000-08-04', 1, NULL, NULL),
(18126, 2, 1, '1091654687', 'JHON ALEXANDER ARIAS GUTIERREZ', NULL, NULL, '1986-11-15', '0', 'jhonalexag71@gmail.com', NULL, '-1187240825', '2004-11-16', 1, NULL, NULL),
(18127, 2, 1, '5036099', 'JHON ALEXANDER PACHECO', NULL, NULL, '1977-11-01', '0', 'sincorreo@sincorreo.com', NULL, '-1117362520', '1996-06-19', 1, NULL, NULL),
(18128, 2, 1, '1004819792', 'JHON ALEXANDER SANTIAGO', NULL, NULL, '1995-03-24', '0', 'jhasantiago@ufpso.edu.co', NULL, '-1168828499', '2013-04-10', 1, NULL, NULL),
(18129, 1, 1, '1065866546', 'JHON ANDERSON MANZANO GUTIERREZ', NULL, NULL, '2004-10-04', NULL, 'macocachepa@gmail.com', NULL, '-1082776948', '2018-11-02', 1, NULL, NULL),
(18130, 1, 1, '1067595470', 'JHON ANDRES PORTILLO CARRE?O', NULL, NULL, '2004-10-23', '0', 'jhonandresportillocarreno@gmail.com', NULL, '-1187308548', '2011-12-20', 1, NULL, NULL),
(18131, 1, 1, '1004945234', 'JHON ANDREY CONTRERAS ROMERO', NULL, NULL, '2002-05-01', NULL, 'jhonzcaminar@hotmail.com', NULL, '-1172320527', '2017-01-06', 1, NULL, NULL),
(18132, 2, 1, '1091679828', 'JHON DAIRO TORRES TORRES', NULL, NULL, '1998-03-07', '0', 'jtas0916@gmail.com', NULL, '-1111659700', '2016-03-30', 1, NULL, NULL),
(18133, 2, 1, '1003121944', 'JHON DEIVID SANTIAGO ORTIZ', NULL, NULL, '2002-05-24', '0', 'jhon.desaor@gmail.com', NULL, '-1180569854', '2020-10-16', 1, NULL, NULL),
(18134, 2, 1, '1066062164', 'JHON EDER MANDON MANDON', NULL, NULL, '1987-07-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1081619111', '2005-11-09', 1, NULL, NULL),
(18135, 2, 1, '18972594', 'JHON EDWIN CAMARGO FORERO', NULL, NULL, '1976-03-22', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1994-10-31', 1, NULL, NULL),
(18136, 2, 1, '1004817617', 'JHON EIDER DELGADO DUARTE', NULL, NULL, '1995-10-11', '0', 'sincorreo@sincorreo.com', NULL, '-1077220070', '2013-11-22', 1, NULL, NULL),
(18137, 2, 1, '1065857772', 'JHON EMILIO BECERRA JIMENEZ', NULL, NULL, '1994-12-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1160003721', '2018-05-24', 1, NULL, NULL),
(18138, 2, 1, '18904240', 'JHON ESNEIDER DURAN OSORIO', NULL, NULL, '1983-09-13', NULL, 'jhonjodo@hotmail.com', NULL, '-1279302683', '2001-10-12', 1, NULL, NULL),
(18139, 1, 1, '1004897711', 'JHON FREDDY ARENAS BAYONA', NULL, NULL, '2001-12-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1182941020', '2016-03-09', 1, NULL, NULL),
(18140, 2, 1, '1091653006', 'JHON FREY DURAN LOPEZ', NULL, NULL, '1986-04-15', '0', 'sincorreo@sincorreo.com', NULL, '-1152272863', '2004-04-20', 1, NULL, NULL),
(18141, 2, 1, '1091655970', 'JHON FREY PEREZ TELLES', NULL, NULL, '1987-04-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1169520795', '2005-04-20', 1, NULL, NULL),
(18142, 1, 1, '1192729841', 'JHON HAYDER CONTRERAS ANGARITA', NULL, NULL, '2002-06-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1088691002', '2016-08-22', 1, NULL, NULL),
(18143, 2, 1, '1066062770', 'JHON HEIDER RUEDAS CARRASCAL', NULL, NULL, '1992-01-11', '0', 'jhruedas1101@gmail.com', NULL, '-1192520658', '2010-07-31', 1, NULL, NULL),
(18144, 2, 1, '1064836614', 'JHON JAIDER DUARTE MANOSALVA', NULL, NULL, '1986-06-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1151835859', '2004-12-17', 1, NULL, NULL),
(18145, 2, 1, '13175035', 'JHON JAIRO BARBOSA MOGOLLON', NULL, NULL, '1982-10-27', '0', 'jhonbarbosa215@gmail.com', NULL, '-1118091944', '2001-05-09', 1, NULL, NULL),
(18146, 2, 1, '5036352', 'JHON JAIRO GUERRERO BARBOSA', NULL, NULL, '1984-03-16', NULL, 'jhon_k7@yahoo.es', NULL, '-1082409260', '2003-07-17', 1, NULL, NULL),
(18147, 2, 1, '5036127', 'JHON JAIRO LOZANO SALAZAR', NULL, NULL, '1978-09-19', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1996-12-14', 1, NULL, NULL),
(18148, 2, 1, '1007282794', 'JHON JAIRO MENESES SUAREZ', NULL, NULL, '1989-11-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1081906237', '2008-03-27', 1, NULL, NULL),
(18149, 2, 1, '1066063640', 'JHON JAIRO MOLINA PABA', NULL, NULL, '1999-04-24', NULL, 'jmolinapaba@gmail.com', NULL, '-1152626415', '2017-06-05', 1, NULL, NULL),
(18150, 2, 1, '1091655287', 'JHON JAIRO RIOS PARADA', NULL, NULL, '1986-05-28', '0', 'sincorreo@sincorreo.com', NULL, '-1157147846', '2005-02-02', 1, NULL, NULL),
(18151, 2, 1, '88227036', 'JHON JAIRO RIVERA VERA', NULL, NULL, '1977-06-08', NULL, 'jhojarve@gmail.com', NULL, '-1132650022', '1995-10-08', 1, NULL, NULL),
(18152, 2, 1, '1004899170', 'JHON JAIRO TORRES GUEVARA', NULL, NULL, '1993-01-31', NULL, 'jhojatogue1993@hotmail.com', NULL, NULL, '2011-02-24', 1, NULL, NULL),
(18153, 1, 1, '1004898718', 'JHON JANER RUEDAS CARRASCAL', NULL, NULL, '2002-03-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1179920915', '2009-04-20', 1, NULL, NULL),
(18154, 2, 1, '1066062115', 'JHON JEIDER TORRES RODRIGUEZ', NULL, NULL, '1987-02-24', '0', 'sincorreo@sincorreo.com', NULL, '-1180420614', '2005-06-28', 1, NULL, NULL),
(18155, 2, 1, '1004819381', 'JHON KENER FUENTES JACOME', NULL, NULL, '2002-03-10', '0', 'sincorreo@gmail.com', NULL, '-1180438163', '2020-06-08', 1, NULL, NULL),
(18156, 2, 1, '13177121', 'JHON RICHAR ARDILA LINDARTE', NULL, NULL, '1983-03-07', NULL, 'richarardilalindarte@gmail.com', NULL, '-1085289203', '2002-10-29', 1, NULL, NULL),
(18157, 2, 1, '1066063568', 'JHONATAN  CHINCHILLA VARGAS', NULL, NULL, '1998-09-10', '0', 'chimchillajhonatan0@gmail.com', NULL, '-1110507912', '2016-09-19', 1, NULL, NULL),
(18158, 2, 1, '1066063400', 'JHONATAN CAMILO DUARTE CARRASCAL', NULL, NULL, '1997-04-14', NULL, 'jhocaduca@gmail.com', NULL, '-1071811387', '2015-05-14', 1, NULL, NULL),
(18159, 1, 1, '631930514', 'JHONATAN CAMILO SANTIAGO REYES', NULL, NULL, '1995-12-12', NULL, 'ca.misan.95@hotmail.com', NULL, NULL, '2008-11-10', 1, NULL, NULL),
(18160, 2, 1, '1003257654', 'JHORMAN ALONSO DUARTE CARRASCAL', NULL, NULL, '2003-09-19', '0', 'yormansex19@gmail.com', NULL, '-1160927578', '2021-10-27', 1, NULL, NULL),
(18161, 2, 1, '1003121915', 'JIMMY EDUARDO TORRES', NULL, NULL, '1998-07-08', '0', 'sincorreo@sincorreo.com', NULL, '-1072772238', '2017-01-23', 1, NULL, NULL),
(18162, 2, 1, '1977953', 'JOEL  SANTIAGO RINCON', NULL, NULL, '1979-12-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1066108496', '1997-12-23', 1, NULL, NULL),
(18163, 2, 1, '1094280164', 'JOHAN ALEXANDER NAVARRO PLATA', NULL, NULL, '1997-09-21', NULL, 'jhojan199727@gmail.com', NULL, '-1156232785', '2015-10-06', 1, NULL, NULL),
(18164, 2, 1, '1066063028', 'JOHAN ANDRES PORTILLO ANGARITA', NULL, NULL, '1993-06-22', NULL, 'johanportillo@hotmail.com', NULL, '-1179747772', '2012-07-31', 1, NULL, NULL),
(18165, 2, 1, '1003121942', 'JOHAN ANDREY ARCINIEGAS BARBOSA', NULL, NULL, '2002-05-09', '0', 'johanandreyarciniegas05@hotmail.com', NULL, '-1139776378', '2016-06-03', 1, NULL, NULL),
(18166, 2, 1, '1066063070', 'JOHAN ANDREY HERNANDEZ RODRIGUEZ', NULL, NULL, '1994-10-05', NULL, 'johanandrey1994.05@gmail.com', NULL, '-1082435015', '2012-10-22', 1, NULL, NULL),
(18167, 2, 1, '1065638835', 'JOHAN ANTONIO MOLINA SANTIAGO', NULL, NULL, '1992-02-28', NULL, 'johan.2802@hotmail.es', NULL, '-1076181537', '2010-03-23', 1, NULL, NULL),
(18168, 1, 1, '1064086126', 'JOHAN DANIEL DUARTE ARENAS', NULL, NULL, '2005-04-01', NULL, 'johanduartear@gmail.com', NULL, '-1082132738', '2012-07-27', 1, NULL, NULL),
(18169, 2, 1, '1003257585', 'JOHAN LIBARDO RIOS SILVA', NULL, NULL, '1992-11-17', NULL, 'johanrios853@gmail.com', NULL, '-1152777813', '2010-11-18', 1, NULL, NULL),
(18170, 2, 1, '1003257692', 'JOHAN MAURICIO SANCHEZ CA?IZAREZ', NULL, NULL, '2000-10-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1180220125', '2019-02-13', 1, NULL, NULL),
(18171, 2, 1, '1066063336', 'JOHAN OMAR VERA PALLARES', NULL, NULL, '1996-08-20', '0', 'johanverap@hotmail.com', NULL, '-1107250661', '2014-12-16', 1, NULL, NULL),
(18172, 1, 1, '1064086013', 'JOHAN SEBASTIAN ANGARITA DUARTE', NULL, NULL, '2003-12-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1192568379', '2018-12-17', 1, NULL, NULL),
(18173, 1, 1, '1066062081', 'JOHAN SEBASTIAN QUINTERO JACOME', NULL, NULL, '2004-12-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1170032389', '2019-01-18', 1, NULL, NULL),
(18174, 2, 1, '1004819123', 'JOHANA TORCOROMA DURAN', NULL, NULL, '1993-03-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2013-12-20', 1, NULL, NULL),
(18175, 2, 1, '1003257803', 'JOHANATAN DAVID BARBOSA RIVERA', NULL, NULL, '2001-03-25', '0', 'sincorreo@sincorreo.com', NULL, '-1168371169', '2019-04-03', 1, NULL, NULL),
(18176, 2, 1, '1066063096', 'JOHN FREDDY ANGARITA DURAN', NULL, NULL, '1994-10-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1162847836', '2012-12-06', 1, NULL, NULL),
(18177, 2, 1, '1091669758', 'JOHN FREDY BAYONA DOMIMGUEZ', NULL, NULL, '1993-04-29', '0', 'sincorreo@sincorreo.com', NULL, '-1086266652', '2011-06-10', 1, NULL, NULL),
(18178, 2, 1, '1091668811', 'JOHN JAIRO CARRASCAL SALAZAR', NULL, NULL, '1992-03-30', '0', 'sincorreo@sincorreo.com', NULL, '-1161130382', '2010-12-15', 1, NULL, NULL),
(18179, 2, 1, '1090986882', 'JOHN JAIRO CHINCHILLA SANGUINO', NULL, NULL, '1991-12-23', '0', 'jchinchillasanguino@gmail.com', NULL, '-1119910227', '2010-01-29', 1, NULL, NULL),
(18180, 2, 1, '1090983236', 'JOHN JAIRO GONZALEZ GUERRERO', NULL, NULL, '1987-01-06', '0', 'jhonjairogonzales0601@gmail.com', NULL, '-1072772160', '2005-02-19', 1, NULL, NULL),
(18181, 1, 1, '1003257410', 'JONATHAN DAVID GALVIZ DUARTE', NULL, NULL, '2002-01-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1170199725', '2016-03-30', 1, NULL, NULL),
(18182, 2, 1, '1064086001', 'JONATHAN DAVID MANOSALVA CONTRERAS', NULL, NULL, '2003-11-11', '0', 'yonatanmanosalva@gmail.com', NULL, '-1067090785', '2021-12-27', 1, NULL, NULL),
(18183, 1, 1, '1003257545', 'JORDAN JULIAN NAVARRO RAMIREZ', NULL, NULL, '2000-11-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1082270570', '2015-01-06', 1, NULL, NULL),
(18184, 1, 1, '1093297804', 'JORDAN STIWARD SILVA QUINTERO', NULL, NULL, '2006-06-08', '0', 'jordan06silva@gmail.com', NULL, '-1070831011', '2015-01-28', 1, NULL, NULL),
(18185, 1, 1, '1521334671', 'JORDY ADRIAN LEMUS CASTELLANOS', NULL, NULL, '1996-01-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2004-12-22', 1, NULL, NULL),
(18186, 2, 1, '5035426', 'JORGE  CARVAJALINO VELASQUEZ', NULL, NULL, '1970-02-14', '0', 'sincorreo@sincorreo.com', NULL, '-1082736984', '1988-04-21', 1, NULL, NULL),
(18187, 2, 1, '88149667', 'JORGE  CASTILLA CASTILLA', NULL, NULL, '1966-10-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1077428247', '1985-12-05', 1, NULL, NULL),
(18188, 2, 1, '1734043', 'JORGE  MOLINA MANOSALVA', NULL, NULL, '1953-11-22', '0', 'sincorreo@sincorreo.com', NULL, '-1060156644', '1975-03-17', 1, NULL, NULL),
(18189, 2, 1, '1091672336', 'JORGE ADRIAN AMAYA RINCON', NULL, NULL, '1994-10-13', NULL, 'joradrian03@gmail.com', NULL, '-1178932519', '2012-10-18', 1, NULL, NULL),
(18190, 2, 1, '13379753', 'JORGE ALONSO OJEDA JACOME', NULL, NULL, '1980-04-13', '0', 'jorgeojedajacome@gmail.com', NULL, '-1156501614', '1998-04-23', 1, NULL, NULL),
(18191, 2, 1, '1079186110', 'JORGE ANDRES CRUZ USAQUILLO', NULL, NULL, '1998-07-31', '0', 'angelandrescruz29@gmail.com', NULL, '-1150223398', '2016-08-02', 1, NULL, NULL),
(18192, 2, 1, '1066063459', 'JORGE ANDREY SANTIAGO RUEDA', NULL, NULL, '1997-11-09', NULL, 'jsantiagoruedas@gmail.com', NULL, '-1127837104', '2015-11-24', 1, NULL, NULL),
(18193, 2, 1, '88144941', 'JORGE DAVID GARCIA TORRES', NULL, NULL, '1970-12-13', '0', 'sincorreo@sincorreo.com', NULL, '-1137986611', '1989-05-04', 1, NULL, NULL),
(18194, 2, 1, '1066062980', 'JORGE EDUARDO SANTIAGO BOHORQUEZ', NULL, NULL, '1993-09-28', NULL, 'jorge222eduardo@gmail.com', NULL, '-1129411410', '2012-04-02', 1, NULL, NULL),
(18195, 2, 1, '88183129', 'JORGE EDUARDO TORO SALAZAR', NULL, NULL, '1971-07-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1160028689', '1989-10-09', 1, NULL, NULL),
(18196, 2, 1, '12713767', 'JORGE ELI RANGEL VACA', NULL, NULL, '1949-07-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1970-12-18', 1, NULL, NULL),
(18197, 2, 1, '5594066', 'JORGE ELIECER ACOSTA BARBOSA', NULL, NULL, '1979-01-20', NULL, 'eliacostaba@hotmail.com', NULL, '-1135683927', '1997-02-20', 1, NULL, NULL),
(18198, 2, 1, '77192429', 'JORGE ELIECER REYES RODRIGUEZ', NULL, NULL, '1978-01-11', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1996-10-01', 1, NULL, NULL),
(18199, 2, 1, '13374339', 'JORGE ELIECER SEPULVEDA ROPERO', NULL, NULL, '1960-11-27', '0', 'sincorreo@sincorreo.com', NULL, '-1062856212', '1983-08-24', 1, NULL, NULL),
(18200, 2, 1, '5035229', 'JORGE EMILIO MOLINA TORRES', NULL, NULL, '1964-04-19', '0', 'jmillotor19@hotmail.com', NULL, '-1126174706', '1982-11-08', 1, NULL, NULL),
(18201, 1, 1, '1003257612', 'JORGE EMILIO OSORIO MARTINEZ', NULL, NULL, '2002-10-13', NULL, 'jorgeemilio9osorio@gmail.com', NULL, '-1108546436', '2017-05-31', 1, NULL, NULL),
(18202, 2, 1, '5428576', 'JORGE EMIRO PAVA MENESES', NULL, NULL, '1984-04-13', '0', 'sincorreo@sincorreo.com', NULL, '-1176950217', '2003-02-18', 1, NULL, NULL),
(18203, 2, 1, '5407564', 'JORGE HELI JIMENEZ BAYONA', NULL, NULL, '1900-12-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1900-12-30', 1, NULL, NULL),
(18204, 2, 1, '1065601750', 'JORGE LEONARDO CORREA PLATA', NULL, NULL, '1989-01-10', NULL, 'jorleocp@gmail.com', NULL, '-1086118579', '2007-01-25', 1, NULL, NULL),
(18205, 2, 1, '1066063102', 'JORGE LUIS DUARTE GALVIS', NULL, NULL, '1994-12-30', '0', 'sincorreo@sincorreo.com', NULL, '-1061672071', '2013-01-10', 1, NULL, NULL),
(18206, 2, 1, '1066062900', 'JORGE LUIS MONCADA VACCA', NULL, NULL, '1993-06-28', NULL, 'jorgeluismoncada@hotmail.es', NULL, '-1129579100', '2011-09-23', 1, NULL, NULL),
(18207, 2, 1, '1066062444', 'JORGE LUIS ORTEGA LOZANO', NULL, NULL, '1989-09-23', '0', 'jorluorlo8923@gmail.com', NULL, '-1116092622', '2008-01-30', 1, NULL, NULL),
(18208, 2, 1, '13374322', 'JORGE NONEL SANTIAGO BENITEZ', NULL, NULL, '1964-11-08', '0', 'sincorreo@sincorreo.com', NULL, '-1162796760', '1983-03-02', 1, NULL, NULL),
(18209, 2, 1, '5036288', 'JORGEN  SOLANO ANGARITA', NULL, NULL, '1983-07-04', '0', 'sincorreo@sincorreo.com', NULL, '-1090387916', '2001-08-10', 1, NULL, NULL),
(18210, 2, 1, '13360193', 'JOSE  ALVAREZ VERGEL', NULL, NULL, '1955-03-24', '0', 'sincorreo@sincorreo.com', NULL, '-1152888164', '1976-01-17', 1, NULL, NULL),
(18211, 2, 1, '5036220', 'JOSE  MANDON BARRERA', NULL, NULL, '1980-10-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1081684761', '1999-08-05', 1, NULL, NULL),
(18212, 2, 1, '88282616', 'JOSE  REYES GUERRERO', NULL, NULL, '1976-12-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1248464353', '1995-03-17', 1, NULL, NULL),
(18213, 2, 1, '79781687', 'JOSE  RUEDA IBARRA', NULL, NULL, '1975-04-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1147118751', '1993-05-20', 1, NULL, NULL),
(18214, 2, 1, '7134588', 'JOSE  SANTIAGO DUARTE', NULL, NULL, '1946-09-02', '0', 'sincorreo@sincorreo.com', NULL, '-1108504323', '1968-12-10', 1, NULL, NULL),
(18215, 2, 1, '1090989895', 'JOSE ADOLFO CONTRERAS BAYONA', NULL, NULL, '1996-12-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1171218013', '2015-05-04', 1, NULL, NULL),
(18216, 2, 1, '1066062603', 'JOSE ALBEIRO VARGAS RODRIGUEZ', NULL, NULL, '1990-08-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2009-03-27', 1, NULL, NULL),
(18217, 2, 1, '5428401', 'JOSE ALIRIO AMAYA RINCON', NULL, NULL, '1983-04-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1170403978', '2002-06-07', 1, NULL, NULL),
(18218, 2, 1, '1193095623', 'JOSE AMADO QUINTERO CASTRO', NULL, NULL, '2000-09-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1106003629', '2018-11-26', 1, NULL, NULL),
(18219, 2, 1, '1066063318', 'JOSE ANDRES CAÃ‘IZARES OSORIO', NULL, NULL, '1996-06-10', '0', 'acanizaresosorio@gmail.com', NULL, '-1131006432', '2014-10-30', 1, NULL, NULL),
(18220, 1, 1, '247166595', 'JOSE ANDRES SANTIAGO RINCON', NULL, NULL, '1999-03-14', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2013-08-28', 1, NULL, NULL),
(18221, 2, 1, '13373409', 'JOSE ANGEL FRANCO RAMIREZ', NULL, NULL, '1956-07-10', '0', 'sincorreo@sincorreo.com', NULL, '-1068036295', '1980-04-25', 1, NULL, NULL),
(18222, 2, 1, '1091658417', 'JOSE ANTONIO ALVAREZ ASCANIO', NULL, NULL, '1987-07-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1081724660', '2006-04-20', 1, NULL, NULL),
(18223, 2, 1, '5035429', 'JOSE ANTONIO NAVARRO MENDOZA', NULL, NULL, '1967-12-30', '0', 'sincorreo@sincorreo.com', NULL, '-1129799992', '1988-07-25', 1, NULL, NULL),
(18224, 2, 1, '1003121902', 'JOSE ARBEY PEÃ‘ARANDA TORRADO', NULL, NULL, '1999-05-29', '0', 'josearbeype@gmail.com', NULL, '-1072039112', '2017-06-09', 1, NULL, NULL),
(18225, 2, 1, '1090984401', 'JOSE ARIDES BECERRA CARVAJALINO', NULL, NULL, '1987-05-20', '0', 'sincorreo@sincorreo.com', NULL, '-1082814649', '2006-08-28', 1, NULL, NULL),
(18226, 2, 1, '88144025', 'JOSE ARISTIDES PEREZ CARRILLO', NULL, NULL, '1969-10-27', '0', 'sincorreo@sincorreo.com', NULL, '-1171926604', '1988-08-05', 1, NULL, NULL),
(18227, 2, 1, '1066063457', 'JOSE ARMANDO OSORIO SANTIAGO', NULL, NULL, '1997-10-27', '0', 'josearmando27@gmail.com', NULL, '-1137571340', '2015-11-18', 1, NULL, NULL),
(18228, 2, 1, '1003257693', 'JOSE ARMANDO SANCHEZ CA?IZAREZ', NULL, NULL, '2000-10-30', '0', 'jarmandosanchez08@gmail.com', NULL, '-1066167789', '2018-11-02', 1, NULL, NULL),
(18229, 2, 1, '13176272', 'JOSE DAVID AREVALO SALCEDO', NULL, NULL, '1983-08-22', '0', 'emiroarevalo83@hotmail.com', NULL, '-1089596396', '2002-03-21', 1, NULL, NULL),
(18230, 2, 1, '1063593948', 'JOSE DAVID QUINTERO PAVAJEAU', NULL, NULL, '1990-11-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1092718662', '2009-04-01', 1, NULL, NULL),
(18231, 2, 1, '5035572', 'JOSE DE DIOS DUARTE GALVIZ', NULL, NULL, '1966-03-19', '0', 'sincorreo@sincorreo.com', NULL, '-1156087629', '1991-08-13', 1, NULL, NULL),
(18232, 2, 1, '1944944', 'JOSE DE DIOS GARCIA CLARO', NULL, NULL, '1962-12-26', '0', 'josedediosgarciaclaro@gmail.com', NULL, '-1157966951', '1982-09-27', 1, NULL, NULL),
(18233, 2, 1, '13378293', 'JOSE DE DIOS PEREZ ANGARITA', NULL, NULL, '1975-07-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1178734152', '1993-09-30', 1, NULL, NULL),
(18234, 2, 1, '12668014', 'JOSE DE DIOS PEREZ JACOME', NULL, NULL, '1942-06-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1177432262', '1969-12-31', 1, NULL, NULL),
(18235, 2, 1, '5035354', 'JOSE DE DIOS QUINTERO LOPEZ', NULL, NULL, '1968-02-17', '0', 'sincorreo@sincorreo.com', NULL, '-1162739180', '1986-10-07', 1, NULL, NULL),
(18236, 2, 1, '5035677', 'JOSE DE JESUS NAVARRO SANTIAGO', NULL, NULL, '1972-08-09', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1994-10-31', 1, NULL, NULL),
(18237, 2, 1, '5471377', 'JOSE DE JESUS TRILLOS PALLARES', NULL, NULL, '1982-07-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1152888778', '2000-08-14', 1, NULL, NULL),
(18238, 2, 1, '88283287', 'JOSE DE LA CRUZ BALLESTEROS MOLINA', NULL, NULL, '1977-05-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1091849079', '1995-09-30', 1, NULL, NULL),
(18239, 2, 1, '5035255', 'JOSE DEL CARMEN MANOSALVA DUARTE', NULL, NULL, '1960-05-29', '0', 'sincorreo@sincorreo.com', NULL, '-1136481899', '1983-05-02', 1, NULL, NULL),
(18240, 2, 1, '88142497', 'JOSE DEL CARMEN MENESES CHINCHILLA', NULL, NULL, '1968-01-20', '0', 'sincorreo@sincorreo.com', NULL, '-1161107151', '1987-05-21', 1, NULL, NULL),
(18241, 2, 1, '1733932', 'JOSE DEL CARMEN MOLINA SANTIAGO', NULL, NULL, '1945-10-20', '0', 'sincorreo@sincorreo.com', NULL, '-1080407470', '1969-06-20', 1, NULL, NULL),
(18242, 2, 1, '88283667', 'JOSE DEL CARMEN NAVARRO SANTIAGO', NULL, NULL, '1976-12-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1179368575', '1996-09-21', 1, NULL, NULL),
(18243, 2, 1, '18913668', 'JOSE DEL CARMEN PAREDES CARRILLO', NULL, NULL, '1955-12-28', '0', 'sincorreo@sincorreo.com', NULL, '-1160099889', '1976-12-21', 1, NULL, NULL),
(18244, 2, 1, '1734386', 'JOSE DEL CARMEN RODRIGUEZ MANDON', NULL, NULL, '1946-11-20', '0', 'sincorreo@sincorreo.com', NULL, '-1182541924', '1970-01-05', 1, NULL, NULL),
(18245, 2, 1, '1733897', 'JOSE DEL CARMEN SANTIAGO CASTILLO', NULL, NULL, '1946-07-06', '0', 'sincorreo@sincorreo.com', NULL, '-1151141465', '1967-12-17', 1, NULL, NULL),
(18246, 2, 1, '8826517', 'JOSE EDELSO AVENDAÃ±O CASTRO', NULL, NULL, '1958-08-27', '0', 'sincorreo@sincorreo.com', NULL, '-1131914999', '1977-07-21', 1, NULL, NULL),
(18247, 2, 1, '1066062382', 'JOSE EDUARDO LOZANO MANOSALVA', NULL, NULL, '1989-05-15', NULL, 'yilome@gmail.com', NULL, '-1106936670', '2007-05-18', 1, NULL, NULL),
(18248, 2, 1, '1066063220', 'JOSE EDUARDO NAVARRO ANGARITA', NULL, NULL, '1995-12-12', NULL, 'jncolombiajose205@gimail.com', NULL, '-1159445480', '2007-04-25', 1, NULL, NULL),
(18249, 2, 1, '1091659938', 'JOSE EDUARDO NAVARRO PLATA', NULL, NULL, '1988-05-11', NULL, 'tjnavarro11@hotmail.com', NULL, '-1140315605', '2006-12-01', 1, NULL, NULL),
(18250, 2, 1, '1091660902', 'JOSE EDUARDO TORO RUEDA', NULL, NULL, '1989-03-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1082956453', '2007-04-17', 1, NULL, NULL),
(18251, 2, 1, '5035596', 'JOSE EDWIN SANTIAGO CASTILLA', NULL, NULL, '1973-07-10', '0', 'josesantiagocastilla@hotmail.com', NULL, '-1169604206', '1992-04-28', 1, NULL, NULL),
(18252, 2, 1, '1091679057', 'JOSE ELIAS CONTRERAS AMAYA', NULL, NULL, '1997-10-13', NULL, 'jc5180972@gmail.com', NULL, '-1087274683', '2015-11-10', 1, NULL, NULL),
(18253, 2, 1, '5035439', 'JOSE ENCARNACION DUARTE PORTILLO', NULL, NULL, '1970-04-30', '0', 'joseeduarteportillo@gmail.com', NULL, '-1070399448', '1988-09-08', 1, NULL, NULL),
(18254, 1, 1, '-1731127381', 'JOSE ESNEIDER BALLESTEROS CONTRERAS', NULL, NULL, '1997-05-31', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2011-12-14', 1, NULL, NULL),
(18255, 2, 1, '1064840042', 'JOSE FERNANDO VERGEL SEPULVEDA', NULL, NULL, '1993-12-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1156211402', '2011-12-09', 1, NULL, NULL),
(18256, 2, 1, '12724377', 'JOSE FRANCISCO DE AVILA MOSCOTE', NULL, NULL, '1952-04-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1178048256', '2008-02-27', 1, NULL, NULL),
(18257, 2, 1, '5035313', 'JOSE FRANCISCO LEBOLO LOZANO', NULL, NULL, '1967-07-24', '0', 'franciscolebolo@gmail.com', NULL, '-1120411679', '1985-07-25', 1, NULL, NULL),
(18258, 2, 1, '13198843', 'JOSE GREGORIO MENDOZA PINZON', NULL, NULL, '1978-06-16', '0', 'jomenpin1978@hotmail.com', NULL, '-1160433456', '1997-06-03', 1, NULL, NULL),
(18259, 2, 1, '1004898137', 'JOSE ISAIAS GALVIZ SANCHEZ', NULL, NULL, '2002-10-10', NULL, 'deseadopormama@gmail.com', NULL, '-1137636502', '2020-10-26', 1, NULL, NULL),
(18260, 2, 1, '5035044', 'JOSE ISRAEL BAYONA MANZANO', NULL, NULL, '1958-10-08', '0', 'sincorreo@sincorreo.com', NULL, '-1090383298', '1977-03-09', 1, NULL, NULL),
(18261, 2, 1, '13371741', 'JOSE IVAN RIZO SUAREZ', NULL, NULL, '1958-09-01', NULL, 'joser_06@yahoo.es', NULL, '-1187220704', '1977-05-16', 1, NULL, NULL),
(18262, 2, 1, '1066063195', 'JOSE JAIME CONTRERAS MANZANO', NULL, NULL, '1995-09-03', '0', 'contrerasmanzanojosejaime@gmail.com', NULL, '-1086621140', '2013-10-15', 1, NULL, NULL),
(18263, 2, 1, '1004864094', 'JOSE JAIR REMOLINA DUARTE', NULL, NULL, '1991-12-28', NULL, 'josejair289112@gmail.com', NULL, '-1289977353', '2010-01-08', 1, NULL, NULL),
(18264, 2, 1, '1084732455', 'JOSE JANEIDER PICON PINEDA', NULL, NULL, '1993-01-28', NULL, 'jos.pic.28@hotmail.com', NULL, '-1141101328', '2011-02-01', 1, NULL, NULL),
(18265, 2, 2, '1091182388', 'JOSE LEON RONDERO OVALLOS', NULL, NULL, '1989-01-09', '0', 'cheorondero1989@gmail.com', NULL, '-1062452381', '2007-03-14', 1, NULL, NULL),
(18266, 2, 1, '5426299', 'JOSE LEOPOLDO LOPEZ', NULL, NULL, '1943-11-08', '0', 'sincorreo@sincorreo.com', NULL, '-1152476996', '1969-10-16', 1, NULL, NULL),
(18267, 2, 1, '88141130', 'JOSE LUIS AMAYA PEREZ', NULL, NULL, '1967-10-24', NULL, 'jlap25@yahoo.com', NULL, '-1116797269', '1985-11-21', 1, NULL, NULL),
(18268, 2, 1, '1091679502', 'JOSE LUIS ARENAS MADARIAGA', NULL, NULL, '1998-01-23', '0', 'joseare98@gmail.com', NULL, '-1110579258', '2016-01-29', 1, NULL, NULL),
(18269, 2, 1, '1090982781', 'JOSE LUIS BAYONA BALLESTEROS', NULL, NULL, '1986-01-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1180640608', '2004-09-15', 1, NULL, NULL),
(18270, 2, 1, '5036366', 'JOSE LUIS DUARTE GALVIZ', NULL, NULL, '1985-07-07', '0', 'sincorreo@sincorreo.com', NULL, '-1176666736', '2003-09-11', 1, NULL, NULL),
(18271, 2, 1, '1094552043', 'JOSE LUIS DUARTE ISCALA', NULL, NULL, '1985-07-09', '0', 'josegranjagrabielmariafn@gmail.com', NULL, '-1150453690', '2004-03-18', 1, NULL, NULL),
(18272, 2, 1, '1091658523', 'JOSE LUIS GARCIA BAYONA', NULL, NULL, '1987-07-26', NULL, 'joseluisgarciabayona@gmail.com', NULL, '-1132610063', '2006-05-04', 1, NULL, NULL),
(18273, 2, 1, '5036238', 'JOSE LUIS MANDON GUTIERREZ', NULL, NULL, '1981-11-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1170962344', '1999-12-02', 1, NULL, NULL),
(18274, 2, 1, '77010210', 'JOSE LUIS MANDON MANDON', NULL, NULL, '1957-04-29', '0', 'sincorreo@sincorreo.com', NULL, '-1126045513', '1979-02-15', 1, NULL, NULL),
(18275, 2, 1, '1066062907', 'JOSE LUIS MANOSALVA MANZANO', NULL, NULL, '1993-09-28', '0', 'ingjose28luis@gmail.com', NULL, '-1110316741', '2011-10-18', 1, NULL, NULL),
(18276, 2, 1, '1090989839', 'JOSE LUIS PEREZ JACOME', NULL, NULL, '1997-01-26', '0', 'josaxi15@gmail.com', NULL, '-1072031051', '2015-03-13', 1, NULL, NULL),
(18277, 2, 1, '1090988956', 'JOSE LUIS PEREZ TORRADO', NULL, NULL, '1994-08-22', '0', 'sincorreo@sincorreo.com', NULL, '-1182651045', '2013-07-29', 1, NULL, NULL),
(18278, 2, 1, '1091669858', 'JOSE LUIS SANCHEZ QUINTERO', NULL, NULL, '1993-06-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1186725145', '2011-07-23', 1, NULL, NULL),
(18279, 2, 1, '1066062241', 'JOSE LUIS SANTIAGO BOHORQUEZ', NULL, NULL, '1988-02-04', '0', 'joseluissantiagobohorquez1988@gmail.com', NULL, '-1119233172', '2007-11-26', 1, NULL, NULL),
(18280, 1, 1, '1003257579', 'JOSE LUIS SANTIAGO CONTRERAS', NULL, NULL, '2002-04-02', NULL, 'santiagojoseluis@autlook.com', NULL, '-1180458454', '2016-04-08', 1, NULL, NULL),
(18281, 2, 1, '1091679268', 'JOSE LUIS SOLANO BELTRAN', NULL, NULL, '1997-12-02', '0', 'sincorreo@sincorreo.com', NULL, '-1071732910', '2015-12-07', 1, NULL, NULL),
(18282, 2, 1, '13374475', 'JOSE MANUEL PABA JACOME', NULL, NULL, '1957-07-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1186263702', '1983-09-21', 1, NULL, NULL),
(18283, 2, 1, '5035103', 'JOSE MANUEL SANTANA', NULL, NULL, '1953-11-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1121699010', '1979-09-28', 1, NULL, NULL),
(18284, 2, 1, '1066062874', 'JOSE MARIA GALVIS SANCHEZ', NULL, NULL, '1993-07-10', '0', 'jomagasa2010@gmail.com', NULL, '-1106365166', '2011-07-15', 1, NULL, NULL),
(18285, 2, 1, '1003257435', 'JOSE MAURICIO CAÃ‘IZARES OSORIO', NULL, NULL, '2002-08-02', '0', 'joma.02.agost@gmail.com', NULL, '-1080531806', '2020-08-28', 1, NULL, NULL),
(18286, 2, 1, '1066062237', 'JOSE MIGUEL BARBOSA MANOSALVA', NULL, NULL, '1988-03-02', '0', 'jomibam1988@gmail.com', NULL, '-1138344944', '2006-04-11', 1, NULL, NULL),
(18287, 2, 1, '1091681993', 'JOSE MIGUEL LAZARO AREVALO', NULL, NULL, '1999-02-18', '0', 'jmlazaroa@ufpso.edu.co', NULL, '-1167326967', '2017-04-24', 1, NULL, NULL),
(18288, 2, 1, '1066062884', 'JOSE MIGUEL MENDOZA RINCON', NULL, NULL, '1993-06-30', '0', 'sincorreo@sincorreo.com', NULL, '-1066393450', '2011-08-19', 1, NULL, NULL),
(18289, 2, 1, '88144222', 'JOSE ORIELSO GAONA MANZANO', NULL, NULL, '1968-02-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1187481289', '1988-09-28', 1, NULL, NULL),
(18290, 2, 1, '1119818011', 'JOSE RICARDO LACOUTURE ORTIZ', NULL, NULL, '1999-12-27', NULL, 'laor.jori@hotmail.com', NULL, '-1111780667', '2018-01-23', 1, NULL, NULL),
(18291, 2, 1, '88258107', 'JOSE RUPERTO PALLARES GARAY', NULL, NULL, '1981-11-18', NULL, 'jjj.payares@gmail.com', NULL, '-1131679223', '2000-06-27', 1, NULL, NULL),
(18292, 2, 1, '1117458562', 'JOSE SAVAD NIEVES ALVARADO', NULL, NULL, '1989-01-06', NULL, 'josesavadparedes@gmail.com', NULL, '-1086038113', '2007-01-31', 1, NULL, NULL),
(18293, 2, 1, '5035595', 'JOSE SIFRED SANTIAGO LEMUS', NULL, NULL, '1974-02-15', '0', 'sifredsantiago@gmail.com', NULL, '-1128740512', '1992-03-18', 1, NULL, NULL),
(18294, 2, 1, '13362413', 'JOSE TRINIDAD AMAYA AMAYA', NULL, NULL, '1957-11-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1169551560', '1977-11-08', 1, NULL, NULL),
(18295, 2, 1, '1007445556', 'JOSE TRINIDAD CONTRERAS CONTRERAS', NULL, NULL, '1989-02-02', '0', 'sincorreo@sincorreo.com', NULL, '-1192055913', '2008-04-09', 1, NULL, NULL),
(18296, 2, 1, '5088662', 'JOSE TRINIDAD OVALLE CARRASCAL', NULL, NULL, '1900-12-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1900-12-30', 1, NULL, NULL),
(18297, 2, 1, '13374512', 'JOSE TRINIDAD ROJAS AREVALO', NULL, NULL, '1965-07-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1092782761', '1983-11-02', 1, NULL, NULL),
(18298, 2, 1, '77149413', 'JOSE TRINIDAD SOLANO CONTRERAS', NULL, NULL, '1963-12-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1092142016', '1983-04-26', 1, NULL, NULL),
(18299, 2, 1, '5459931', 'JOSE VICENTE ALVAREZ RUEDAS', NULL, NULL, '1965-05-18', '0', 'sincorreo@sincorreo.com', NULL, '-1162193678', '1985-09-19', 1, NULL, NULL),
(18300, 2, 1, '5035432', 'JOSE VICENTE CONTRERAS NAVARRO', NULL, NULL, '1970-03-19', '0', 'sincorreo@sincorreo.com', NULL, '-1127105827', '1988-07-25', 1, NULL, NULL),
(18301, 2, 1, '5468995', 'JOSE WILTON VACCA DURAN', NULL, NULL, '1980-12-07', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1999-02-11', 1, NULL, NULL),
(18302, 2, 1, '1007320978', 'JOSUE  GALVAN AMAYA', NULL, NULL, '1996-07-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1187148340', '2014-07-16', 1, NULL, NULL),
(18303, 2, 1, '26777345', 'JOTA EMILIA JACOME MOLINA', NULL, NULL, '1982-02-19', '0', 'sincorreo@sincorreo.com', NULL, '-1109651272', '2000-06-22', 1, NULL, NULL),
(18304, 2, 1, '88203727', 'JOVANNI MARTIN SILVA CARREÃ‘O', NULL, NULL, '1973-03-23', '0', 'sincorreo@sincorreo.com', NULL, '-1070907315', '1991-06-20', 1, NULL, NULL),
(18305, 2, 1, '5035306', 'JUAN  ASCANIO ROPERO', NULL, NULL, '1966-10-06', '0', 'sincorreo@sincorreo.com', NULL, '-1160051630', '1985-04-18', 1, NULL, NULL),
(18306, 1, 1, '1064086114', 'JUAN ANDRES OSORIO MARTINEZ', NULL, NULL, '2004-05-05', NULL, 'juanandresosoriomartinez2@gmail.com', NULL, '-1106936129', '2018-07-19', 1, NULL, NULL),
(18307, 2, 1, '18970590', 'JUAN BAUTISTA GARCIA DUARTE', NULL, NULL, '1971-06-24', '0', 'sincorreo@sincorreo.com', NULL, '-1059594988', '1989-08-31', 1, NULL, NULL),
(18308, 2, 1, '1007949614', 'JUAN CAMILO ASCANIO CASTILLA', NULL, NULL, '2003-10-17', '0', 'jascaniocastilla@gmail.com', NULL, '-1116489210', '2021-11-04', 1, NULL, NULL),
(18309, 2, 1, '1066062560', 'JUAN CAMILO GARCIA SANCHEZ', NULL, NULL, '1990-12-19', '0', 'camilocgarcia@hotmail.com', NULL, '-1111193810', '2008-12-24', 1, NULL, NULL),
(18310, 1, 1, '1003257426', 'JUAN CAMILO VEGA JAIME', NULL, NULL, '2002-06-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1081694791', '2017-03-27', 1, NULL, NULL),
(18311, 1, 1, '1066062140', 'JUAN CARLOS BALLESTEROS LOBO', NULL, NULL, '2005-07-04', '0', 'ballesteroslobojuancarlos123@gmail.com', NULL, '-1075870792', '2019-08-02', 1, NULL, NULL),
(18312, 2, 1, '15205713', 'JUAN CARLOS CARO PRENTT', NULL, NULL, '1983-07-18', '0', 'juan.caro5713@correo.policia.gov.co', NULL, '-1185972977', '2001-08-21', 1, NULL, NULL),
(18313, 2, 1, '1064836322', 'JUAN CARLOS CASTRO PAREDES', NULL, NULL, '1985-11-30', '0', 'juank.1985@hotmail.com', NULL, '-1092038094', '2004-06-16', 1, NULL, NULL),
(18314, 2, 1, '1064838386', 'JUAN CARLOS CONTRERAS GONZALEZ', NULL, NULL, '1990-12-16', '0', 'sincorreo@sincorreo.com', NULL, '-1079930411', '2009-01-27', 1, NULL, NULL),
(18315, 2, 1, '1003257557', 'JUAN CARLOS CONTRERAS MENDOZA', NULL, NULL, '2003-08-25', '0', 'sincorreo@sincorreo.com', NULL, '-1187293104', '2021-08-30', 1, NULL, NULL),
(18316, 2, 1, '13176426', 'JUAN CARLOS GARCIA GRANADOS', NULL, NULL, '1983-08-21', '0', 'sincorreo@sincorreo.com', NULL, '-1072770967', '2002-04-30', 1, NULL, NULL),
(18317, 2, 1, '5036303', 'JUAN CARLOS HORLANDY RIOS', NULL, NULL, '1984-01-27', '0', 'juancarloshorlandy@gmail.com', NULL, '-1182885256', '2002-04-06', 1, NULL, NULL),
(18318, 2, 1, '1066063159', 'JUAN CARLOS JACOME', NULL, NULL, '1995-02-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1167649622', '2013-07-11', 1, NULL, NULL),
(18319, 2, 1, '1090986879', 'JUAN CARLOS PEÃ‘ARANDA GARNICA', NULL, NULL, '1991-09-29', '0', 'juankpg29@hotmail.com', NULL, '-1107358896', '2010-01-28', 1, NULL, NULL),
(18320, 2, 1, '1003257711', 'JUAN DAVID ANGARITA DUARTE', NULL, NULL, '1993-10-18', '0', 'sincorreo@sincorreo.com', NULL, '-1161165550', '2011-12-12', 1, NULL, NULL),
(18321, 2, 1, '1066062744', 'JUAN DAVID MENDOZA QUINTERO', NULL, NULL, '1989-04-30', '0', 'juandamendoza22@gmail.com', NULL, '-1086642602', '2010-04-29', 1, NULL, NULL),
(18322, 2, 1, '1066062666', 'JUAN DAVID MOLINA SANTIAGO', NULL, NULL, '1991-07-12', NULL, 'juan.david91@live.com', NULL, '-1127422067', '2009-07-30', 1, NULL, NULL),
(18323, 1, 1, '1092174800', 'JUAN DAVID PRADO CASTRO', NULL, NULL, '2004-04-08', '0', 'sincorreo@sincorreo.com', NULL, '-1152497004', '2011-08-04', 1, NULL, NULL),
(18324, 2, 1, '2001568', 'JUAN DE DIOS CONTRERAS CASTRO', NULL, NULL, '1900-12-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1919-12-30', 1, NULL, NULL),
(18325, 2, 1, '2090401', 'JUAN DE DIOS CONTRERAS RUEDA', NULL, NULL, '1952-06-05', '0', 'sincorreo@sincorreo.com', NULL, '-1162723718', '1975-01-23', 1, NULL, NULL),
(18326, 2, 1, '1733831', 'JUAN DE DIOS GALVIS DUARTE', NULL, NULL, '1940-03-08', '0', 'sincorreo@sincorreo.com', NULL, '-787005302', '1965-05-05', 1, NULL, NULL),
(18327, 2, 1, '13377670', 'JUAN DE DIOS GARCIA TORRES', NULL, NULL, '1973-10-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1107714791', '1991-11-08', 1, NULL, NULL),
(18328, 2, 1, '77183171', 'JUAN DE JESUS GALVIZ MOLINA', NULL, NULL, '1975-09-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1072770954', '1993-10-12', 1, NULL, NULL),
(18329, 2, 1, '1066063658', 'JUAN DIEGO CONTRERAS LOBO', NULL, NULL, '1999-05-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1179971081', '2017-08-14', 1, NULL, NULL),
(18330, 1, 1, '1064086120', 'JUAN DIEGO MADARIAGA AMAYA', NULL, NULL, '2005-02-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1121443312', '2019-07-31', 1, NULL, NULL),
(18331, 2, 1, '5084550', 'JUAN ELKIM PICON MENDOZA', NULL, NULL, '1900-12-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1900-12-30', 1, NULL, NULL),
(18332, 1, 1, '1064086021', 'JUAN ESTEBAN OSORIO MOLINA', NULL, NULL, '2004-03-07', '0', 'osoriomolinajuanesteban@gmail.com', NULL, '-1109519320', '2018-03-26', 1, NULL, NULL),
(18333, 1, 1, '1066062163', 'JUAN FELIPE HERNANDEZ CONTRERAS', NULL, NULL, '2005-10-06', NULL, 'juanfecontreras06@gmail.com', NULL, '-1072175372', '2017-06-20', 1, NULL, NULL),
(18334, 2, 1, '1064086030', 'JUAN FRANCISCO CONTRERAS JAIME', NULL, NULL, '2004-04-29', '0', 'juanfrancisco25@gmail.com', NULL, '-1188390637', '2022-05-02', 1, NULL, NULL),
(18335, 2, 1, '1007283572', 'JUAN GABRIEL JULIO VEGA', NULL, NULL, '1991-09-10', NULL, 'jgabrielvega@hotmail.com', NULL, '-1129625115', '2009-11-26', 1, NULL, NULL),
(18336, 2, 1, '1192770186', 'JUAN JOSE ACOSTA BARBOSA', NULL, NULL, '2003-02-10', '0', 'juanjoseacosta253@gmail.com', NULL, '-1142754562', '2021-02-18', 1, NULL, NULL),
(18337, 2, 1, '1066063570', 'JUAN JOSE CAÃ±IZARES OSORIO', NULL, NULL, '1998-03-23', '0', 'jujo.1998.23@gmail.com', NULL, '-1186829533', '2016-09-21', 1, NULL, NULL),
(18338, 2, 1, '1073524477', 'JUAN JOSE CARRASCAL MARTINEZ', NULL, NULL, '1998-04-16', '0', 'jjuan16jjose98@gmail.com', NULL, '-1156111485', '2016-04-18', 1, NULL, NULL),
(18339, 2, 1, '1066063627', 'JUAN JOSE CONTRERAS MAESTRE', NULL, NULL, '1999-03-11', '0', '3225378722j@gmail.com', NULL, '-1067315463', '2017-04-25', 1, NULL, NULL),
(18340, 1, 1, '1003257645', 'JUAN MANUEL MOLINA ARIAS', NULL, NULL, '2003-10-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1131465845', '2012-05-16', 1, NULL, NULL),
(18341, 2, 1, '1090988478', 'JUAN MIGUEL BALLESTEROS TARAZONA', NULL, NULL, '1994-08-01', NULL, 'juancho0194@gmail.com', NULL, '-787158298', '2012-08-27', 1, NULL, NULL),
(18342, 2, 1, '1091675553', 'JUAN PABLO BARBOSA CARDENAS', NULL, NULL, '1996-01-12', '5611190', 'sincorreo@sincorreo.com', NULL, '-1135685264', '2014-03-19', 1, NULL, NULL),
(18343, 2, 1, '1975606', 'JUAN RAMON ASCANIO ARENAS', NULL, NULL, '1936-06-23', '0', 'sincorreo@sincorreo.com', NULL, '-1108848403', '1958-09-17', 1, NULL, NULL),
(18344, 2, 1, '1066062974', 'JUAN SEBASTIAN NAVARRO CLAVIJO', NULL, NULL, '1994-03-17', NULL, 'juanse1248@hotmail.com', NULL, '-1166760388', '2012-03-23', 1, NULL, NULL),
(18345, 2, 1, '1977970', 'JUAN YIMY RINCON RINCON', NULL, NULL, '1978-02-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1997-12-30', 1, NULL, NULL),
(18346, 2, 1, '5036315', 'JUAQUIN DEIBI ORTIZ JOYA', NULL, NULL, '1984-04-10', '0', 'sincorreo@sincorreo.com', NULL, '-1082471326', '2002-04-30', 1, NULL, NULL),
(18347, 2, 1, '1093795734', 'JUDITH DEL CARMEN TORRADO SANJUAN', NULL, NULL, '1979-10-19', '0', 'judithtorrado12@gmail.com', NULL, '-1117345760', '2016-08-09', 1, NULL, NULL),
(18348, 2, 1, '49694636', 'JULIA JANETH ORTIZ SANCHEZ', NULL, NULL, '1971-06-05', '0', 'janeth.ortiz6950@gmail.com', NULL, '-1158371670', '1994-10-31', 1, NULL, NULL),
(18349, 2, 1, '26774685', 'JULIA MARIA PICON DE MORA', NULL, NULL, '1949-06-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1122100936', '1981-12-09', 1, NULL, NULL),
(18350, 1, 1, '1064086182', 'JULIAN ALBERTO RUEDAS BARBOSA', NULL, NULL, '2006-12-06', '0', 'sincorreo@sincorreo.com', NULL, '-1160156950', '2013-12-09', 1, NULL, NULL),
(18351, 2, 1, '1192776931', 'JULIAN ANDRES OSORIO SANTIAGO', NULL, NULL, '2001-06-14', '0', 'jaos1427@gmail.com', NULL, '-1186295648', '2019-06-21', 1, NULL, NULL),
(18352, 2, 1, '1096212905', 'JULIAN ANDRES REYES LANZZIANO', NULL, NULL, '1991-10-24', NULL, 'juanrela_24@hotmail.es', NULL, '-1151407619', '2009-10-28', 1, NULL, NULL),
(18353, 2, 1, '1066062240', 'JULIAN EDUARDO OSORIO MANZANO', NULL, NULL, '1988-04-12', NULL, 'julius.jys@hotmail.com', NULL, '-1127287180', '2007-01-17', 1, NULL, NULL),
(18354, 2, 1, '1003257536', 'JULIAN NORVEY QUINTERO MENESES', NULL, NULL, '1999-09-25', NULL, 'jnquintero19@gmail.com', NULL, '-1180263744', '2017-10-19', 1, NULL, NULL),
(18355, 2, 1, '1193067096', 'JULIANY ALEXANDRA BAYONA JOYA', NULL, NULL, '2001-10-12', '0', 'yulianialexandrabayonajoya@hotmail.com', NULL, '-1169418610', '2020-07-28', 1, NULL, NULL),
(18356, 2, 1, '26777234', 'JULIETH  BARBOSA PABA', NULL, NULL, '1977-05-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1115983469', '1997-05-28', 1, NULL, NULL),
(18357, 2, 1, '26774804', 'JULIETH AMANDA PEREZ CARRASCAL', NULL, NULL, '1967-01-23', '-1150638178', 'juliethperes2013@outlook.es', NULL, NULL, '1985-12-09', 1, NULL, NULL),
(18358, 2, 1, '77191558', 'JULIO ALBEIRO JACOME LOZANO', NULL, NULL, '1978-02-27', NULL, 'julioalbeirojacome@gmail.com', NULL, '-1286595927', '1996-06-15', 1, NULL, NULL),
(18359, 1, 1, '1066062107', 'JULIO ALBERTO CAMPO QUINTERO', NULL, NULL, '2005-06-08', NULL, 'juliocampoquintero@gmail.com', NULL, '-1080640793', '2018-01-12', 1, NULL, NULL),
(18360, 2, 1, '1066062673', 'JULIO CESAR ARENAS PRADO', NULL, NULL, '1991-01-17', '0', 'arenaspradocesar@gmail.com', NULL, '-1121000289', '2009-08-12', 1, NULL, NULL),
(18361, 2, 1, '1066062846', 'JULIO CESAR CONTRERAS MENDOZA', NULL, NULL, '1993-04-01', NULL, 'juliochechacontreras@hotmail.com', NULL, '-1071523665', '2011-05-05', 1, NULL, NULL),
(18362, 2, 1, '5035523', 'JULIO CESAR MADARIAGA MANZANO', NULL, NULL, '1972-02-12', NULL, 'madariagajulio@gmail.com', NULL, '-1129665411', '1990-06-28', 1, NULL, NULL),
(18363, 2, 1, '5036162', 'JULIO CESAR PABA GUEVARA', NULL, NULL, '1978-05-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1190713840', '1997-05-28', 1, NULL, NULL),
(18364, 2, 1, '13357343', 'JULIO ELIECER GAONA PE?ARANDA', NULL, NULL, '1948-07-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1130112840', '1972-12-20', 1, NULL, NULL),
(18365, 2, 1, '13362393', 'JULIO HELI GAONA MANZANO', NULL, NULL, '1956-12-13', '0', 'sincorreo@sincorreo.com', NULL, '-1159567349', '1977-11-08', 1, NULL, NULL),
(18366, 2, 1, '1003257552', 'JURGEN ELIAM ASCANIO BACCA', NULL, NULL, '2000-06-27', NULL, 'elian27ascanio@gmail.com', NULL, '-1122298262', '2018-07-05', 1, NULL, NULL),
(18367, 2, 1, '1066062949', 'KAREN BIBIANA RIVERA VERA', NULL, NULL, '1993-10-23', '0', 'karenrv0802@gmail.com', NULL, '-1109396863', '2012-02-17', 1, NULL, NULL),
(18368, 2, 1, '1090375508', 'KAREN CRISTINA DUARTE SANCHEZ', NULL, NULL, '1986-10-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1180165899', '2005-01-17', 1, NULL, NULL),
(18369, 2, 1, '1066062045', 'KAREN DALLANA MONTAÃ‘O GALVIS', NULL, NULL, '2003-09-20', '0', 'kdm2725@gmail.com', NULL, '-1116643312', '2021-09-21', 1, NULL, NULL),
(18370, 2, 1, '1066062578', 'KAREN DEL ROSSIO GARCIA DUARTE', NULL, NULL, '1991-01-19', NULL, 'karen_gadu@hotmail.com', NULL, '-1182015116', '2009-01-30', 1, NULL, NULL),
(18371, 2, 1, '1091665935', 'KAREN LICETH PLATA ASCANIO', NULL, NULL, '1991-06-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1088616341', '2009-07-24', 1, NULL, NULL),
(18372, 2, 1, '1066063271', 'KAREN LILIANA QUINTERO GARCIA', NULL, NULL, '1996-03-17', '5625145', 'knlili17@hotmail.com', NULL, '-1118153734', '2014-06-19', 1, NULL, NULL),
(18373, 2, 1, '1091676583', 'KAREN LINETH MOLINA CHINCHILLA', NULL, NULL, '1996-08-02', '0', 'karenlineth960802@gmail.com', NULL, '-1179636316', '2014-08-25', 1, NULL, NULL),
(18374, 2, 1, '1066062314', 'KAREN LORENA GALVIZ SANCHEZ', NULL, NULL, '1988-10-12', '0', 'kalojaal1312@gmail.com', NULL, '-1138422461', '2006-12-19', 1, NULL, NULL),
(18375, 2, 1, '1066063016', 'KAREN LORENA MANOSALVA QUINTANA', NULL, NULL, '1994-05-16', NULL, 'klmanosalvaq@ufpso.edu.co', NULL, '-1122596447', '2012-06-19', 1, NULL, NULL),
(18376, 2, 1, '1096646433', 'KAREN YELINE QUINTERO MANZANO', NULL, NULL, '1995-05-15', '0', 'yeline@hotmail.es', NULL, '-1111743881', '2013-08-15', 1, NULL, NULL),
(18377, 1, 1, '1003257405', 'KARIME  BARBOSA PABA', NULL, NULL, '2001-12-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1158133272', '2016-01-08', 1, NULL, NULL),
(18378, 2, 1, '1064086111', 'KARINA  PABA PABA', NULL, NULL, '1995-03-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1152593323', '2013-04-17', 1, NULL, NULL),
(18379, 2, 1, '1066063688', 'KARINA ALEJANDRA DIAZ MANZANO', NULL, NULL, '1999-06-30', '0', 'aaleejaadiiaaz@gmail.com', NULL, '-1170324379', '2017-11-23', 1, NULL, NULL),
(18380, 2, 1, '1066062613', 'KARINA LICETH RUEDAS JAIMES', NULL, NULL, '1990-10-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1141898251', '2009-04-07', 1, NULL, NULL),
(18381, 2, 1, '1091654839', 'KARINA ROCIO BARBOSA CASTRO', NULL, NULL, '1986-10-25', '0', 'karinarocca25@gmail.com', NULL, '-1126305184', '2004-12-03', 1, NULL, NULL),
(18382, 2, 1, '1066062830', 'KARINN LOREDNA LOBO LOBO', NULL, NULL, '1993-01-05', '0', 'sincorreo@sincorreo.com', NULL, '-1161342740', '2011-03-01', 1, NULL, NULL),
(18383, 1, 1, '1064086031', 'KARLA LUCIA BARBOSA JACOME', NULL, NULL, '2004-05-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1129118648', '2018-11-23', 1, NULL, NULL),
(18384, 2, 1, '1091665543', 'KARLEINZ  DURAN ROSO', NULL, NULL, '1991-01-06', '0', 'karleinz0106@gmail.com', NULL, '-1090722766', '2009-05-11', 1, NULL, NULL),
(18385, 2, 1, '1066062796', 'KAROL  MORA ROSADO', NULL, NULL, '1992-09-10', NULL, 'karolrosado10@outlook.com', NULL, '-1082453372', '2010-10-15', 1, NULL, NULL),
(18386, 2, 1, '1090431085', 'KAROL ANDREA PE?ARANDA BEJARANO', NULL, NULL, '1991-03-06', NULL, 'karol.0306@hotmail.com', NULL, '-1147046180', '2009-03-09', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(18387, 2, 1, '1007899448', 'KAROL DAYANA SERRANO GUERRERO', NULL, NULL, '2000-07-13', NULL, 'karoldayanaserrano2020@gmail.com', NULL, '-1170619232', '2018-10-10', 1, NULL, NULL),
(18388, 1, 1, '1066062132', 'KAROL GISELL GARCIA ALVAREZ', NULL, NULL, '2004-08-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1121055533', '2018-02-02', 1, NULL, NULL),
(18389, 2, 1, '1003257434', 'KAROL YISELA PACHECO VEGA', NULL, NULL, '2002-07-29', '0', 'karolpacheco058@gmail.com', NULL, '-1137279433', '2020-11-13', 1, NULL, NULL),
(18390, 1, 1, '1064086100', 'KAROL YULITZA VEGA PRADO', NULL, NULL, '2004-11-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1072710511', '2018-12-20', 1, NULL, NULL),
(18391, 2, 1, '1091672921', 'KATERINE  RIOS PARADA', NULL, NULL, '1994-08-25', '0', 'riosparadakaterine@gmail.com', NULL, '-1161243270', '2013-01-29', 1, NULL, NULL),
(18392, 2, 1, '1003257558', 'KATERINE  RUEDAS RUEDAS', NULL, NULL, '1991-08-07', '0', 'katerineruedasdea@gmail.com', NULL, '-1111389840', '2010-08-12', 1, NULL, NULL),
(18393, 2, 1, '1082838190', 'KATERINE JUDITH OROZCO CARO', NULL, NULL, '1985-11-16', '0', 'yarsonibarguen@gmail.com', NULL, '-1068988865', '2004-04-15', 1, NULL, NULL),
(18394, 2, 1, '1003376342', 'KATHERIN YURANNIS GUERRA NAVARRO', NULL, NULL, '2000-01-07', NULL, 'katherineguerra2000@hotmail.com', NULL, '-1059077511', '2018-01-25', 1, NULL, NULL),
(18395, 2, 1, '1066063601', 'KATHERINE  DUARTE PINEDA', NULL, NULL, '1999-01-01', '0', 'katydupi@gmail.com', NULL, '-1186977495', '2017-01-17', 1, NULL, NULL),
(18396, 2, 1, '39464393', 'KATHERINE  MORA ROSADO', NULL, NULL, '1985-07-19', NULL, 'katherinemrosado_24@hotmail.com', NULL, '-1080700960', '2003-09-29', 1, NULL, NULL),
(18397, 2, 1, '1091665393', 'KEBIN DANILO PACHECO CHINCHILLA', NULL, NULL, '1991-02-24', NULL, 'kedapach@hotmail.com', NULL, '-1128108238', '2009-04-08', 1, NULL, NULL),
(18398, 1, 1, '1091073323', 'KEIDY JISSELA QUINTERO PEREZ', NULL, NULL, '2005-03-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1182735609', '2019-05-06', 1, NULL, NULL),
(18399, 1, 1, '1092175121', 'KEILA ANDREA JACOME RINCON', NULL, NULL, '2004-08-17', '0', 'andreaonjacomerinc@gmail.com', NULL, '-1148386756', '2018-10-11', 1, NULL, NULL),
(18400, 1, 1, '1092175059', 'KEILY FERNANDA CAAMA?O VERA', NULL, NULL, '2004-07-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1066800083', '2019-01-15', 1, NULL, NULL),
(18401, 1, 1, '1091655470', 'KEILY XIMENA GARCIA PORTILLO', NULL, NULL, '2005-02-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1160055715', '2019-02-19', 1, NULL, NULL),
(18402, 2, 1, '1090990752', 'KEILY YISETH ROPERO QUINTERO', NULL, NULL, '1999-01-23', '0', 'ke-yiseth0123@hotmail.com', NULL, '-1187136405', '2017-01-30', 1, NULL, NULL),
(18403, 1, 1, '-437155078', 'KELI YOANA RINCON BELTRAN', NULL, NULL, '1994-05-21', NULL, 'keli.1234@hotmail.es', NULL, NULL, '2009-04-06', 1, NULL, NULL),
(18404, 2, 1, '1003257735', 'KELIM YESMITH DUARTE ANGARITA', NULL, NULL, '2001-01-02', NULL, 'duarteangaritak@gmail.com', NULL, '-1187834343', '2019-06-21', 1, NULL, NULL),
(18405, 2, 1, '1004862704', 'KELLY GISELLA GARCIA PEREIRA', NULL, NULL, '2000-01-28', NULL, 'kellygisellapereira@gmail.com', NULL, '-1172388005', '2018-02-06', 1, NULL, NULL),
(18406, 2, 1, '1091679272', 'KELLY JOHANA NAVARRO ACOSTA', NULL, NULL, '1997-12-06', '0', 'navarrojohana061297@gmail.com', NULL, '-1187305402', '2015-12-09', 1, NULL, NULL),
(18407, 2, 1, '1066063502', 'KELLY TATIANA CARVAJALINO GALVIZ', NULL, NULL, '1997-06-21', NULL, 'kellycarvajalino21@gmail.com', NULL, '-1182695196', '2016-03-16', 1, NULL, NULL),
(18408, 2, 1, '1064842592', 'KELLY YURITH CUETO CARDENAS', NULL, NULL, '1998-07-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1089278040', '2016-07-18', 1, NULL, NULL),
(18409, 1, 1, '1066062139', 'KELVIN EMIRO JACOME ANGARITA', NULL, NULL, '2005-07-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1151545318', '2012-09-20', 1, NULL, NULL),
(18410, 2, 1, '1066063160', 'KELY L LOGENIA RIVERA RIVERA', NULL, NULL, '1995-02-04', '0', 'riverakely789@gmail.com', NULL, '-1156245391', '2013-07-11', 1, NULL, NULL),
(18411, 2, 1, '1066062871', 'KENDRY  PORTILLO BOHORQUEZ', NULL, NULL, '1993-05-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1146078438', '2011-06-30', 1, NULL, NULL),
(18412, 1, 1, '1092174170', 'KEVIN ALFONSO VEGA JAIMES', NULL, NULL, '2004-01-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1186639671', '2018-03-26', 1, NULL, NULL),
(18413, 2, 1, '1007885070', 'KEVIN ANDRES ORTEGA GOMEZ', NULL, NULL, '2002-12-16', '0', 'kevinandresortegag@gmail.com', NULL, '-1072815311', '2021-01-06', 1, NULL, NULL),
(18414, 2, 1, '1066063309', 'KEVIN ANDRES QUINTERO GARCIA', NULL, NULL, '1996-09-27', '0', 'kevinaq27@hotmail.com', NULL, '-1088750575', '2014-10-10', 1, NULL, NULL),
(18415, 1, 1, '1092175165', 'KEVIN ANDRES RUEDAS DUARTE', NULL, NULL, '2004-08-19', '0', 'kevinrueda1982@gmail.com', NULL, '-1106657788', '2018-09-19', 1, NULL, NULL),
(18416, 2, 1, '1090524422', 'KEVIN DAYAN QUINTERO RODRIGUEZ', NULL, NULL, '1999-02-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1190172355', '2017-02-27', 1, NULL, NULL),
(18417, 1, 1, '1066062133', 'KEVIN HUMBERTO LOZANO JACOME', NULL, NULL, '2005-05-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1188318729', '2012-12-03', 1, NULL, NULL),
(18418, 2, 1, '1091681393', 'KEVIN YACID ESTRADA REYES', NULL, NULL, '1998-12-05', NULL, 'kevinyacide@gmail.com', NULL, '-1075817193', '2017-01-10', 1, NULL, NULL),
(18419, 2, 1, '1193597859', 'KIMBER DAYANA SOLANO RAMIREZ', NULL, NULL, '1996-09-28', '0', 'sincorreo@sincorreo.com', NULL, '-1082391256', '2014-10-27', 1, NULL, NULL),
(18420, 2, 1, '1066062264', 'KRISTIAN CAMILO OSORIO GALVIS', NULL, NULL, '1988-05-02', '-1109600700', 'kristianooo1988@gmail.com', NULL, NULL, '2006-06-01', 1, NULL, NULL),
(18421, 2, 1, '1066062842', 'LAUDID  MANZANO BOHORQUEZ', NULL, NULL, '1992-12-07', NULL, 'laudidmanza@gmail.com', NULL, '-1090825369', '2011-04-06', 1, NULL, NULL),
(18422, 2, 1, '1066062191', 'LAUDITH  PALLARES MANOSALVA', NULL, NULL, '1988-01-16', NULL, 'lau_pallares2004@hotmail.com', NULL, '-1066820996', '2006-02-09', 1, NULL, NULL),
(18423, 2, 1, '1003247905', 'LAURA DANIELA PABON BELTRAN', NULL, NULL, '2002-12-02', '0', 'pabonbeltranl@gmail.com', NULL, '-1291500464', '2020-12-21', 1, NULL, NULL),
(18424, 2, 1, '1066098064', 'LAURA NATALY RAMIREZ DUARTE', NULL, NULL, '1998-12-25', '0', 'lauriitad981225@gmail.com', NULL, '-1151880565', '2017-01-04', 1, NULL, NULL),
(18425, 2, 1, '1066062875', 'LAURA VANESSA MOLINA ARIAS', NULL, NULL, '1993-07-14', '0', 'lvmolinaa@ufpso.edu.co', NULL, '-1141600054', '2011-07-15', 1, NULL, NULL),
(18426, 2, 1, '1003121987', 'LAURA VANESSA RIOS RUEDAS', NULL, NULL, '2002-02-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1170112717', '2020-03-02', 1, NULL, NULL),
(18427, 1, 1, '1064086074', 'LAUREN STEFANY DUARTE CARRASCAL', NULL, NULL, '2004-10-01', '0', 'duartelauren920@gmail.com', NULL, '-1072495884', '2017-09-18', 1, NULL, NULL),
(18428, 2, 1, '37339202', 'LAURITH  BAYONA GUERRERO', NULL, NULL, '1980-12-20', '0', 'sincorreo@sincorreo.com', NULL, '-1092610805', '2001-03-09', 1, NULL, NULL),
(18429, 2, 1, '1066062428', 'LEANDRO  BAYONA RINCON', NULL, NULL, '1989-11-04', '0', 'leorincon0411@hotmal.com', NULL, '-1159420594', '2007-11-09', 1, NULL, NULL),
(18430, 2, 1, '1003257698', 'LEANDRO  CHINCHILLA SANGUINO', NULL, NULL, '1997-08-13', '0', 'sincorreo@sincorreo.com', NULL, '-1142839967', '2015-08-27', 1, NULL, NULL),
(18431, 2, 1, '5036351', 'LEBER  LOPEZ CARDENAS', NULL, NULL, '1983-03-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1149619334', '2003-03-12', 1, NULL, NULL),
(18432, 2, 1, '37337202', 'LEDY  CASTRO CARRASCAL', NULL, NULL, '1979-10-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1090379407', '2000-02-28', 1, NULL, NULL),
(18433, 2, 1, '26774963', 'LEDY MARIA SANTIAGO MOLINA', NULL, NULL, '1973-03-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1280318028', '1991-11-08', 1, NULL, NULL),
(18434, 2, 1, '1090386920', 'LEDY YASMIN RINCON VASQUEZ', NULL, NULL, '1986-08-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1138534225', '2005-10-25', 1, NULL, NULL),
(18435, 2, 1, '1091672215', 'LEDY YONEISA PRADA GOMEZ', NULL, NULL, '1994-09-08', NULL, 'leddy_94@hotmail.es', NULL, '-1072796136', '2012-09-24', 1, NULL, NULL),
(18436, 2, 1, '26774371', 'LEDYS  LOZANO LEMUS', NULL, NULL, '1946-12-12', '0', 'sincorreo@sincorreo.com', NULL, '-1139213765', '1969-03-26', 1, NULL, NULL),
(18437, 2, 1, '1066062697', 'LEIDDY PATRICIA PACHECO QUINTERO', NULL, NULL, '1991-09-18', '0', 'sincorreo@sincorreo.com', NULL, '-1131597579', '2009-10-15', 1, NULL, NULL),
(18438, 2, 1, '1066062082', 'LEIDE JOHANA BELTRAN SANCHEZ', NULL, NULL, '1986-04-27', '0', 'sincorreo@sincorreo.com', NULL, '-1160297888', '2020-08-28', 1, NULL, NULL),
(18439, 2, 2, '1091183323', 'LEIDI VANESA RODRIGUEZ SANCHEZ', NULL, NULL, '1997-10-04', '0', 'leivane97@outlook.com', NULL, '-1182247513', '2015-11-11', 1, NULL, NULL),
(18440, 2, 1, '26777412', 'LEIDY  DUARTE DUARTE', NULL, NULL, '1982-06-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1075834535', '2002-02-20', 1, NULL, NULL),
(18441, 2, 1, '26777324', 'LEIDY  VERA SANTIAGO', NULL, NULL, '1981-07-27', '0', 'sincorreo@sincorreo.com', NULL, '-1066706406', '1999-11-06', 1, NULL, NULL),
(18442, 2, 1, '37336694', 'LEIDY DAYANI IBAÃ‘EZ MEJIA', NULL, NULL, '1981-10-27', '0', 'ldibanez29@gmail.com', NULL, '-1131255119', '1999-12-02', 1, NULL, NULL),
(18443, 2, 1, '1004823705', 'LEIDY JOHANA PABON PABON', NULL, NULL, '1996-07-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1072750509', '2014-12-09', 1, NULL, NULL),
(18444, 2, 1, '1090398631', 'LEIDY JOHANA PAEZ QUINTERO', NULL, NULL, '1988-05-13', '0', 'sincorreo@sincorreo.com', NULL, '-1071900102', '2006-12-27', 1, NULL, NULL),
(18445, 1, 1, '593446745', 'LEIDY KARINA URQUIJO RINCON', NULL, NULL, '1995-08-27', NULL, 'leka88@hotmail.es', NULL, NULL, '2009-11-20', 1, NULL, NULL),
(18446, 2, 1, '26777397', 'LEIDY MARIA RAMIREZ JACOME', NULL, NULL, '1983-01-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1111228970', '2001-10-09', 1, NULL, NULL),
(18447, 2, 1, '1020731881', 'LEIDY YOHANA CARVAJALINO GALVIZ', NULL, NULL, '1988-03-04', '0', 'cgleidy1@misena.edu.co', NULL, '-1091025645', '2006-04-27', 1, NULL, NULL),
(18448, 2, 1, '1090988516', 'LEIDY YOHANA MEJIA VILLALBA', NULL, NULL, '1994-09-10', NULL, 'leime0910@gmail.com', NULL, '-1080273515', '2012-09-18', 1, NULL, NULL),
(18449, 2, 1, '1007320792', 'LEIDYS MARIA PEINADO BARBOSA', NULL, NULL, '1992-02-14', '0', 'leidypeinado14@gmail.com', NULL, '-1075107470', '2010-03-26', 1, NULL, NULL),
(18450, 2, 1, '5427375', 'LEINER DE JESUS MANDON GUTIERREZ', NULL, NULL, '1983-01-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1067089531', '2001-08-10', 1, NULL, NULL),
(18451, 1, 1, '1091655171', 'LEINY VANESA ANGARITA RUEDAS', NULL, NULL, '2004-09-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1151150759', '2018-05-10', 1, NULL, NULL),
(18452, 2, 1, '37505737', 'LENIS CAROLINA ORTIZ TORRES', NULL, NULL, '1982-11-26', NULL, 'carolinatorres2227@hotmail.com', NULL, '-1085283244', '2001-07-11', 1, NULL, NULL),
(18453, 2, 1, '13175203', 'LEONARDO  CASTILLA CASTRO', NULL, NULL, '1983-04-03', NULL, 'leokastilla@hotmail.com', NULL, '-1108545647', '2001-06-20', 1, NULL, NULL),
(18454, 2, 1, '1193127765', 'LEONARDO  MONTAÃ‘O GALVIS', NULL, NULL, '1998-02-23', '0', 'leonardogalvis1998@gmail.com', NULL, '-1176260422', '2016-02-25', 1, NULL, NULL),
(18455, 2, 1, '1091662328', 'LEONARDO  QUINTERO GAONA', NULL, NULL, '1989-10-19', NULL, 'leonquinga@gmail.com', NULL, '-1138006034', '2007-11-14', 1, NULL, NULL),
(18456, 2, 1, '5036143', 'LEONARDO  TRILLOS MOLINA', NULL, NULL, '1978-08-12', '0', 'sincorreo@sincorreo.com', NULL, '-1117370025', '1997-02-24', 1, NULL, NULL),
(18457, 2, 1, '13266503', 'LEONARDO ALIRIO BASTOS ABREO', NULL, NULL, '1959-11-12', NULL, 'alirioabreo.88@hotmail.com', NULL, '-1129986581', '1978-03-03', 1, NULL, NULL),
(18458, 2, 1, '1066063252', 'LEONARDO JOSE HERNANDEZ CONTRERAS', NULL, NULL, '1996-03-19', '0', 'hernandezcontrerasjoseleonardo@gmail.com', NULL, '-1188093955', '2014-03-28', 1, NULL, NULL),
(18459, 2, 1, '5427490', 'LEONEL  DURAN ANGARITA', NULL, NULL, '1983-11-28', '0', 'sincorreo@sincorreo.com', NULL, '-1066691119', '2001-12-07', 1, NULL, NULL),
(18460, 2, 1, '5036106', 'LEONEL  PAVA CHINCHILLA', NULL, NULL, '1973-09-10', '0', 'sincorreo@sincorreo.com', NULL, '-1156574113', '1996-06-19', 1, NULL, NULL),
(18461, 2, 1, '1090988110', 'LEONEL ALCIDES AGUILAR CHINCHILLA', NULL, NULL, '1993-12-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1089911888', '2012-02-13', 1, NULL, NULL),
(18462, 2, 1, '1047434214', 'LEONELA  QUINTERO MANOSALVA', NULL, NULL, '1987-01-14', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2009-04-27', 1, NULL, NULL),
(18463, 2, 1, '1066063237', 'LESLY JENYZZA JACOME MANZANO', NULL, NULL, '1995-10-13', '0', 'leslyjacome13@gmail.com', NULL, '-1106318631', '2014-02-06', 1, NULL, NULL),
(18464, 2, 1, '1091681229', 'LETICIA  TORRES GONZALEZ', NULL, NULL, '1998-11-26', NULL, 'letitorres1998@hotmail.com', NULL, '-1290470345', '2016-12-05', 1, NULL, NULL),
(18465, 2, 1, '1003244587', 'LEWIS DANIEL MARTINEZ CHINCHILLA', NULL, NULL, '2001-01-04', NULL, 'lewismartinezgt1779@gmail.com', NULL, '-1147293546', '2019-03-12', 1, NULL, NULL),
(18466, 2, 1, '60383362', 'LEYDA TORCOROMA LEON PALLARES', NULL, NULL, '1976-05-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1091857271', '1996-10-05', 1, NULL, NULL),
(18467, 2, 1, '26777328', 'LEYDDY JOHANA MADARIAGA MANZANO', NULL, NULL, '1981-07-27', '0', 'sincorreo@sincorreo.com', NULL, '-1116946387', '2000-01-17', 1, NULL, NULL),
(18468, 2, 1, '37182758', 'LEYDI JOHANA QUINTERO ALVAREZ', NULL, NULL, '1985-06-01', '0', 'leyjoh@gmail.com', NULL, '-1126769768', '2003-07-04', 1, NULL, NULL),
(18469, 2, 1, '13177320', 'LIBAR  BAYONA SANCHEZ', NULL, NULL, '1984-10-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1171408154', '2002-12-03', 1, NULL, NULL),
(18470, 2, 1, '9692655', 'LIBAR ALFONSO CALA CORDERO', NULL, NULL, '1983-01-31', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2005-03-29', 1, NULL, NULL),
(18471, 2, 1, '5035042', 'LIBARDO  BALLESTEROS', NULL, NULL, '1958-03-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1176797417', '1977-03-09', 1, NULL, NULL),
(18472, 2, 1, '13372127', 'LIBARDO  GALVIS GALVIS', NULL, NULL, '1958-01-22', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1977-08-03', 1, NULL, NULL),
(18473, 2, 1, '12663015', 'LIBARDO  MENESES CHINCHILLA', NULL, NULL, '1953-08-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1169596110', '1975-06-26', 1, NULL, NULL),
(18474, 2, 1, '88149189', 'LIBARDO  PRADA AREVALO', NULL, NULL, '1970-01-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1160918717', '1988-08-03', 1, NULL, NULL),
(18475, 2, 1, '13376114', 'LIBARDO  RINCON TORRADO', NULL, NULL, '1968-11-14', '0', 'sincorreo@sincorreo.com', NULL, '-1079559672', '1987-12-03', 1, NULL, NULL),
(18476, 2, 1, '1734016', 'LIBARDO  RIVERA SANTIAGO', NULL, NULL, '1952-11-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1082866124', '1974-01-21', 1, NULL, NULL),
(18477, 2, 1, '13377856', 'LIBARDO  TAMAYO BECERRA', NULL, NULL, '1974-04-05', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1992-07-06', 1, NULL, NULL),
(18478, 2, 1, '5036328', 'LIBARDO ALONSO GALVIS SANCHEZ', NULL, NULL, '1984-05-13', '0', 'libardogalviz12@gmail.com', NULL, '-1122319368', '2002-08-01', 1, NULL, NULL),
(18479, 2, 1, '1066062857', 'LIBETH  BARBOSA PAVA', NULL, NULL, '1992-11-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1146151511', '2011-06-07', 1, NULL, NULL),
(18480, 2, 1, '26774545', 'LIBIA ESTHER PAVA NAVARRO', NULL, NULL, '1955-06-19', '0', 'liespana2012ck@hotmail.com', NULL, '-1136019558', '1976-01-17', 1, NULL, NULL),
(18481, 2, 1, '1091661512', 'LICETH  CARRASCAL ACOSTA', NULL, NULL, '1989-05-23', '0', 'licmi02@hotmail.com', NULL, '-1187243697', '2007-07-12', 1, NULL, NULL),
(18482, 2, 1, '37331145', 'LICETH  DUARTE ORTEGA', NULL, NULL, '1977-10-25', '0', 'liduor@hotmail.com', NULL, '-1176175589', '1996-02-05', 1, NULL, NULL),
(18483, 2, 1, '26777395', 'LICETH  PALLARES MANOSALVA', NULL, NULL, '1983-03-17', '0', 'paliceth@gmail.com', NULL, '-1177986665', '2001-10-04', 1, NULL, NULL),
(18484, 1, 1, '1066062083', 'LICETH FERNANDA CONTRERAS CONTRERAS', NULL, NULL, '2005-03-01', '0', '', NULL, '-1188710581', '2017-12-11', 1, NULL, NULL),
(18485, 1, 1, '1007842904', 'LICETH KARINA CHINCHILLA VARGAS', NULL, NULL, '2001-12-19', NULL, 'mamiteamo19@gmail.com', NULL, '-1161525369', '2009-02-04', 1, NULL, NULL),
(18486, 2, 1, '37330896', 'LICETH PAOLA ASCANIO CLARO', NULL, NULL, '1977-08-11', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1995-09-17', 1, NULL, NULL),
(18487, 2, 1, '1007842832', 'LICETH PAOLA RIVERA TORRADO', NULL, NULL, '2000-02-04', NULL, 'licethriverara@hotmail.com', NULL, '-1162718158', '2018-02-08', 1, NULL, NULL),
(18488, 2, 1, '26774933', 'LIDA TORCOROMA GALVIZ SANCHEZ', NULL, NULL, '1970-04-18', '0', 'sincorreo@sincorreo.com', NULL, '-1161463470', '1991-02-27', 1, NULL, NULL),
(18489, 2, 1, '37336885', 'LIDYA  QUINTERO RAMIREZ', NULL, NULL, '1981-07-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1066956642', '2000-01-26', 1, NULL, NULL),
(18490, 2, 1, '49640025', 'LIGIA  DUARTE PORTILLO', NULL, NULL, '1967-10-04', '0', 'sincorreo@sincorreo.com', NULL, '-1170346763', '1985-11-28', 1, NULL, NULL),
(18491, 2, 1, '26774750', 'LIGIA DEL CARMEN AMAYA PARRA', NULL, NULL, '1962-11-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1152252452', '1996-08-13', 1, NULL, NULL),
(18492, 2, 1, '26777442', 'LIGIA KARINA JACOME DUARTE', NULL, NULL, '1984-05-18', '0', 'kjacom175@gmail.com', NULL, '-1128099264', '2002-08-16', 1, NULL, NULL),
(18493, 2, 1, '26774510', 'LIGIA MARIA NAVARRO NAVARRO', NULL, NULL, '1952-02-02', '0', 'sincorreo@sincorreo.com', NULL, '-1141521275', '1975-06-26', 1, NULL, NULL),
(18494, 2, 1, '37430002', 'LILIA ISABEL VERGEL PAEZ', NULL, NULL, '1958-08-19', '0', 'sincorreo@sincorreo.com', NULL, '-1156936704', '1979-07-17', 1, NULL, NULL),
(18495, 2, 1, '26777360', 'LILIAM  MOLINA QUINTERO', NULL, NULL, '1982-09-03', '0', 'liliammolina_@hotmail.com', NULL, '-1137482303', '2000-09-10', 1, NULL, NULL),
(18496, 2, 1, '26777335', 'LILIANA  BARBOSA MANOSALVA', NULL, NULL, '1982-01-17', '1780722790', 'lilianabarbosamanosalva@gmail.com', NULL, '-1156745283', '2000-03-23', 1, NULL, NULL),
(18497, 2, 1, '26777447', 'LILIANA  FLORES MOLINA', NULL, NULL, '1984-05-13', NULL, 'uribealexander976@gmail.com', NULL, '-1168494862', '2002-09-12', 1, NULL, NULL),
(18498, 2, 1, '1066063519', 'LILIANA  GONZALES GUTIERREZ', NULL, NULL, '1998-04-28', '0', 'lgonzalezg@ufpso.edu.co', NULL, '-1191778209', '2016-05-13', 1, NULL, NULL),
(18499, 2, 1, '1091660590', 'LILIANA  LOZADA ARENGAS', NULL, NULL, '1989-02-20', '0', 'liliana_lozar7@hotmail.com', NULL, '-1085012469', '2007-02-28', 1, NULL, NULL),
(18500, 2, 1, '37332943', 'LILIANA  SANTIAGO REYES', NULL, NULL, '1975-11-13', '0', 'sincorreo@sincorreo.com', NULL, '-1167461676', '1997-04-09', 1, NULL, NULL),
(18501, 2, 1, '49782615', 'LILIANA DE JESUS SANTANA SAUMETH', NULL, NULL, '1977-06-06', '0', 'lilianasantanasaumeth1977@hotmail.com', NULL, '-1132520816', '1995-08-28', 1, NULL, NULL),
(18502, 2, 1, '37319099', 'LILIANA ESTELLA LLANEZ DURAN', NULL, NULL, '1965-09-14', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1985-03-18', 1, NULL, NULL),
(18503, 2, 1, '1090516180', 'LILIBETH  AREVALO BENCARDINO', NULL, NULL, '1998-05-15', '0', 'lilibetha186@gmail.com', NULL, '-1166468825', '2016-05-23', 1, NULL, NULL),
(18504, 2, 1, '37182022', 'LILIBETH  CLARO DUARTE', NULL, NULL, '1984-09-20', '5690943', 'LICLADU@HOTMAIL.COM', NULL, NULL, '2003-01-15', 1, NULL, NULL),
(18505, 2, 1, '1004943151', 'LINA JOHANA ACOSTA GUERRERO', NULL, NULL, '2000-08-01', '0', 'linajohana12345@gmail.com', NULL, '-1128484181', '2018-08-24', 1, NULL, NULL),
(18506, 2, 1, '1066063642', 'LINA MAGRETH RUEDAS CONTRERAS', NULL, NULL, '1999-06-04', '0', 'linaruedas9@gmail.com', NULL, '-1168417938', '2017-06-09', 1, NULL, NULL),
(18507, 2, 1, '1091665447', 'LINA MARCELA MOLINA CONTRERAS', NULL, NULL, '1991-02-04', '0', 'lina_mm_c@hotmail.com', NULL, '-1111270263', '2009-04-21', 1, NULL, NULL),
(18508, 2, 1, '1066062616', 'LINA MARCELA NAVARRO MANOSALVA', NULL, NULL, '1990-12-02', '0', 'sincorreo@sincorreo.com', NULL, '-1169211069', '2009-04-13', 1, NULL, NULL),
(18509, 2, 1, '1066062814', 'LINA MARIA MENDOZA JACOME', NULL, NULL, '1992-07-10', NULL, 'linitamendoza10@hotmail.com', NULL, '-1090125988', '2011-01-17', 1, NULL, NULL),
(18510, 2, 1, '37317602', 'LINA RAQUEL SANTIAGO JACOME', NULL, NULL, '1964-11-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1136201191', '1990-05-17', 1, NULL, NULL),
(18511, 2, 1, '1066062684', 'LINA ROCIO SANTIAGO SANTIAGO', NULL, NULL, '1991-08-28', NULL, 'linasantiago24@gmail.com', NULL, '-1139257951', '2009-09-02', 1, NULL, NULL),
(18512, 1, 1, '-1711442132', 'LINA TORCOROMA ASCANIO BACCA', NULL, NULL, '1997-07-28', NULL, 'linaascanio@hortmail.com', NULL, NULL, '2007-01-12', 1, NULL, NULL),
(18513, 2, 1, '1066062703', 'LINETH  ORTIZ BAYONA', NULL, NULL, '1991-10-03', NULL, 'lortiz714@unab.edu.com', NULL, '-1082164179', '2009-11-27', 1, NULL, NULL),
(18514, 2, 1, '26777429', 'LINEY ANDREA MOLINA TRIGOS', NULL, NULL, '1984-05-09', NULL, 'lineyandreamolina9@gmail.com', NULL, '-1126320569', '2002-05-16', 1, NULL, NULL),
(18515, 2, 1, '13379263', 'LISANDRO  SANTIAGO QUINTERO', NULL, NULL, '1978-10-12', '0', 'sincorreo@sincorreo.com', NULL, '-1169788197', '1996-11-30', 1, NULL, NULL),
(18516, 2, 1, '1004897977', 'LISBETH DAYANA MANOSALVA VEGA', NULL, NULL, '2003-01-12', NULL, 'lisbethdayanamanosalva@gmail.com', NULL, '-1128592193', '2021-01-20', 1, NULL, NULL),
(18517, 2, 1, '37331883', 'LISETTE PATRICIA MARTINEZ LANZZIANO', NULL, NULL, '1978-03-15', '0', 'palisette@hotmail.com', NULL, '-1076934733', '1996-06-13', 1, NULL, NULL),
(18518, 2, 1, '1004862794', 'LITZY SANED NAVARRO MOLINA', NULL, NULL, '2000-01-25', '0', 'litzys_nm@outlook.com', NULL, '-1140723662', '2018-01-26', 1, NULL, NULL),
(18519, 2, 1, '26775020', 'LIZETH  OSORIO CASTRO', NULL, NULL, '1974-10-14', NULL, 'lizos74@hotmail.com', NULL, '-1086663026', '1993-05-18', 1, NULL, NULL),
(18520, 2, 1, '37619667', 'LLEYDY JOHANA PAREDES VEGA', NULL, NULL, '1984-10-08', '6293249', 'lleydyjohana1@gmail.com', NULL, '-1107279600', '2007-03-29', 1, NULL, NULL),
(18521, 2, 1, '1066062498', 'LLUBELY  DUARTE GUTIERREZ', NULL, NULL, '1989-08-09', '0', 'sincorreo@sincorreo.com', NULL, '-1192326674', '2008-06-25', 1, NULL, NULL),
(18522, 1, 1, '1066062019', 'LLULY KATERINE CONTRERAS MAESTRE', NULL, NULL, '2004-02-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1150339943', '2011-08-12', 1, NULL, NULL),
(18523, 2, 1, '1066062815', 'LORAINE TORCOROMA LOBO CASTILLA', NULL, NULL, '1992-12-28', '0', 'loraineperiodista@gmail.com', NULL, '-1131129465', '2011-01-18', 1, NULL, NULL),
(18524, 2, 1, '1066063644', 'LORENA  GARCIA PEREIRA', NULL, NULL, '1999-05-05', '0', 'lorenagp0599@gmail.com', NULL, '-1077518783', '2017-06-23', 1, NULL, NULL),
(18525, 2, 1, '1066062490', 'LORENIS PAOLA MOLINA NAVARRO', NULL, NULL, '1990-03-16', '0', 'sincorreo@sincorreo.com', NULL, '-1168912352', '2008-06-09', 1, NULL, NULL),
(18526, 2, 1, '26777371', 'LOURDES VIVIANA BOHORQUEZ NAVARRO', NULL, NULL, '1982-11-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1176766005', '2001-02-07', 1, NULL, NULL),
(18527, 2, 1, '1007282791', 'LUBIN  CUETO CARDENAS', NULL, NULL, '1992-10-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1071017696', '2010-11-11', 1, NULL, NULL),
(18528, 2, 1, '26774992', 'LUCELIA  PORTILLO ANGARITA', NULL, NULL, '1972-10-24', '0', 'luciportillo671@gmail.com', NULL, '-1170040444', '1992-07-15', 1, NULL, NULL),
(18529, 2, 1, '37333066', 'LUCELIA  RODRIGUEZ PICON', NULL, NULL, '1978-07-08', '0', 'jesusylucelia@gmail.com', NULL, '-1119457510', '1997-04-18', 1, NULL, NULL),
(18530, 2, 1, '26777165', 'LUCELIA  SANCHEZ CARRASCAL', NULL, NULL, '1962-09-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1109986376', '1985-08-29', 1, NULL, NULL),
(18531, 2, 1, '37324435', 'LUCENILDA  RINCON PAREDES', NULL, NULL, '1970-10-12', '0', 'sincorreo@sincorreo.com', NULL, '-1159533192', '1989-12-11', 1, NULL, NULL),
(18532, 2, 1, '37328233', 'LUCENIT  LAZARO CARVAJAL', NULL, NULL, '1973-02-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1081064395', '1993-08-31', 1, NULL, NULL),
(18533, 2, 1, '26774387', 'LUCENITH  DUARTE', NULL, NULL, '1947-05-10', '0', 'sincorreo@sincorreo.com', NULL, '-1121010496', '1969-06-20', 1, NULL, NULL),
(18534, 2, 1, '1066062462', 'LUCENITH  HORLANDY RIOS', NULL, NULL, '1990-01-25', '0', 'lucenithorlandyr@gmail.com', NULL, '-1156002469', '2008-03-10', 1, NULL, NULL),
(18535, 2, 1, '37182347', 'LUCENITH  SUAREZ SANTANA', NULL, NULL, '1982-12-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2003-03-13', 1, NULL, NULL),
(18536, 2, 1, '37329114', 'LUCIA  CHINCHILLA CHINCHILLA', NULL, NULL, '1971-11-14', '0', 'sincorreo@sincorreo.com', NULL, '-1179656590', '1994-04-04', 1, NULL, NULL),
(18537, 2, 1, '37333805', 'LUCIA JIMENA NAVARRO AREVALO', NULL, NULL, '1979-09-14', NULL, 'najilu@hotmail.com', NULL, '-1087245239', '1997-09-29', 1, NULL, NULL),
(18538, 2, 2, '27887603', 'LUCINDA  REMOLINA ORTIZ', NULL, NULL, '1972-08-16', '0', 'lurihe_re@hotmail.com', NULL, '-1180352442', '1991-11-08', 1, NULL, NULL),
(18539, 2, 1, '37367398', 'LUCY  GARCIA TORRES', NULL, NULL, '1968-06-12', NULL, 'garcia.lucy@gimail.com', NULL, '-1086437910', '1987-02-13', 1, NULL, NULL),
(18540, 2, 1, '26777434', 'LUDDY  DUARTE BOHORQUEZ', NULL, NULL, '1983-07-29', '0', 'luddyduarteb@gmail.com', NULL, '-1178138812', '2002-06-27', 1, NULL, NULL),
(18541, 2, 1, '26774911', 'LUDTH MARGARITA OSORIO LEMUS', NULL, NULL, '1971-07-26', '0', 'margaritaosorio584@gmail.com', NULL, '-1072300054', '1989-10-30', 1, NULL, NULL),
(18542, 2, 1, '1066062863', 'LUDY  VARGAS PEÃ‘ARANDA', NULL, NULL, '1993-04-22', '0', 'sincorreo@sincorreo.com', NULL, '-1168649075', '2011-06-10', 1, NULL, NULL),
(18543, 2, 1, '26775086', 'LUDY AMPARO LOZANO MANOSALVA', NULL, NULL, '1973-07-25', '0', 'ludyamparo1973@hotmail.com', NULL, '-1141285284', '1995-08-29', 1, NULL, NULL),
(18544, 2, 1, '37312222', 'LUDY CECILIA CARRASCAL DE RIOS', NULL, NULL, '1954-08-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1152167197', '1978-09-12', 1, NULL, NULL),
(18545, 2, 1, '37336805', 'LUDY MARIA CONTRERAS BECERRA', NULL, NULL, '1980-09-24', '0', 'ludycontreras@hotmail.com', NULL, '-1070371665', '2000-01-17', 1, NULL, NULL),
(18546, 2, 1, '26774830', 'LUDY MARIA LOZANO CABRALES', NULL, NULL, '1968-03-04', NULL, 'ludyloza@hotmail.com', NULL, '-1150399615', '1987-05-28', 1, NULL, NULL),
(18547, 2, 1, '37371249', 'LUDY PAOLA PABON RODRIGUEZ', NULL, NULL, '1981-01-07', '0', 'sincorreo@sincorreo.com', NULL, '-1177599238', '1999-08-24', 1, NULL, NULL),
(18548, 2, 1, '26777343', 'LUDYS  CARRASCAL BECERRA', NULL, NULL, '1977-01-05', '0', 'sincorreo@sincorreo.com', NULL, '-1118337909', '2000-05-30', 1, NULL, NULL),
(18549, 1, 1, '1092176689', 'LUGDY  RODRIGUEZ CARDENAS', NULL, NULL, '2005-10-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1162604455', '2019-10-10', 1, NULL, NULL),
(18550, 2, 1, '1066063320', 'LUIS ADRIAN LOZANO GUTIERREZ', NULL, NULL, '1996-11-05', '0', 'lalozanog@ufpso.edu.co', NULL, '-1060173747', '2014-11-10', 1, NULL, NULL),
(18551, 2, 1, '1091669330', 'LUIS ALBEIRO GALVAN DURAN', NULL, NULL, '1992-02-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1071847658', '2011-03-25', 1, NULL, NULL),
(18552, 2, 1, '1091652259', 'LUIS ALBERTO BECERRA PEREZ', NULL, NULL, '1985-07-22', '0', 'abalbertofox@hotmail.com', NULL, '-1159437592', '2004-01-29', 1, NULL, NULL),
(18553, 2, 1, '85272105', 'LUIS ALBERTO GOMEZ MU?OZ', NULL, NULL, '1984-05-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1156001076', '2002-08-23', 1, NULL, NULL),
(18554, 2, 1, '5035666', 'LUIS ALBERTO PICON RIOS', NULL, NULL, '1966-01-10', '0', 'sincorreo@sincorreo.com', NULL, '-1126087995', '1994-06-20', 1, NULL, NULL),
(18555, 2, 1, '88284408', 'LUIS ALCIDES FLOREZ BERMUDEZ', NULL, NULL, '1977-08-28', '0', 'sincorreo@sincorreo.com', NULL, '-1182063157', '1996-08-01', 1, NULL, NULL),
(18556, 2, 1, '5035567', 'LUIS ALDEMAR LOZANO SALAZAR', NULL, NULL, '1973-04-02', '0', 'sincorreo@sincorreo.com', NULL, '-1269824309', '1991-07-27', 1, NULL, NULL),
(18557, 2, 2, '5529350', 'LUIS ALFEGO MELO RODRIGUEZ', NULL, NULL, '1971-06-09', '0', 'sincorreo@sincorreo.com', NULL, '-1171457722', '1971-12-11', 1, NULL, NULL),
(18558, 2, 1, '5459700', 'LUIS ALFONSO BAYONA RUEDAS', NULL, NULL, '1950-06-19', '0', 'sincorreo@sincorreo.com', NULL, '-1116875466', '1973-09-06', 1, NULL, NULL),
(18559, 2, 1, '1735059', 'LUIS ALFONSO MOLINA MORA', NULL, NULL, '1942-04-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1182805023', '1963-08-21', 1, NULL, NULL),
(18560, 2, 1, '5035045', 'LUIS ALFONSO NAVARRO DUARTE', NULL, NULL, '1958-08-25', '0', 'sincorreo@sincorreo.com', NULL, '-1117213544', '1977-03-09', 1, NULL, NULL),
(18561, 2, 1, '5035435', 'LUIS ALFONSO RIOS RIOS', NULL, NULL, '1968-06-18', '0', 'sincorreo@sincorreo.com', NULL, '-1126778754', '1988-07-25', 1, NULL, NULL),
(18562, 2, 1, '18904524', 'LUIS ALFONSO RIZO PEREZ', NULL, NULL, '1985-06-24', '0', 'luisalfonsorizo@hotmail.com', NULL, '-1126254624', '2003-08-05', 1, NULL, NULL),
(18563, 2, 1, '5035336', 'LUIS ALFREDO CHINCHILLA DUARTE', NULL, NULL, '1966-03-24', '0', 'sincorreo@sincorreo.com', NULL, '-1091173589', '1985-12-09', 1, NULL, NULL),
(18564, 2, 1, '1733952', 'LUIS ALFREDO DUARTE TORRES', NULL, NULL, '1948-08-16', '0', 'sincorreo@sincorreo.com', NULL, '-1168554527', '1971-01-25', 1, NULL, NULL),
(18565, 2, 1, '18904133', 'LUIS ALFREDO GALVIZ SANCHEZ', NULL, NULL, '1982-02-08', NULL, 'alfredogalvis1988@gmail.com', NULL, '-1120711725', '2000-08-28', 1, NULL, NULL),
(18566, 2, 1, '1066062832', 'LUIS ALFREDO GRANADOS GRANADOS', NULL, NULL, '1990-12-26', '0', 'sincorreo@sincorreo.com', NULL, '-1090908861', '2011-03-10', 1, NULL, NULL),
(18567, 2, 1, '1734027', 'LUIS ALFREDO MENESES CHINCHILLA', NULL, NULL, '1950-01-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1176093513', '1974-01-21', 1, NULL, NULL),
(18568, 2, 1, '12712816', 'LUIS ALFREDO MORA QUINTERO', NULL, NULL, '1949-12-14', '0', 'sincorreo@sincorreo.com', NULL, '-1162780065', '1970-01-19', 1, NULL, NULL),
(18569, 2, 1, '88282064', 'LUIS ALFREDO PABA GARZON', NULL, NULL, '1974-08-17', '0', 'sincorreo@sincorreo.com', NULL, '-1171507625', '1994-10-31', 1, NULL, NULL),
(18570, 2, 1, '19745020', 'LUIS ALFREDO QUINTERO GARCIA', NULL, NULL, '1962-12-17', '0', 'sincorreo@sincorreo.com', NULL, '-1151411687', '1981-05-13', 1, NULL, NULL),
(18571, 2, 1, '1735096', 'LUIS ALFREDO RINCON', NULL, NULL, '1957-05-09', '0', 'sincorreo@sincorreo.com', NULL, '-1147024403', '1976-01-17', 1, NULL, NULL),
(18572, 2, 1, '1003121916', 'LUIS ALFREDO RODRIGUEZ QUINTANA', NULL, NULL, '1988-11-15', '0', 'sincorreo@sincorreo.com', NULL, '-1188229589', '2007-05-16', 1, NULL, NULL),
(18573, 2, 1, '13241771', 'LUIS ANDELFO REYES CALDERON', NULL, NULL, '1951-05-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1080083031', '1972-08-24', 1, NULL, NULL),
(18574, 2, 1, '88136977', 'LUIS ANTONIO ARENAS PEREZ', NULL, NULL, '1963-10-04', NULL, 'arenasluisantonio63@gmail.com', NULL, '-1111342552', '1981-12-14', 1, NULL, NULL),
(18575, 2, 1, '1733814', 'LUIS ANTONIO CONTRERAS LOZANO', NULL, NULL, '1941-01-20', '0', 'sincorreo@sincorreo.com', NULL, '-1085966561', '1963-08-21', 1, NULL, NULL),
(18576, 2, 1, '88280071', 'LUIS ANTONIO GARCIA TORRES', NULL, NULL, '1974-11-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1156008644', '1993-02-02', 1, NULL, NULL),
(18577, 2, 1, '13371875', 'LUIS ANTONIO NAVARRO QUINTERO', NULL, NULL, '1955-07-30', '0', 'sincorreo@sincorreo.com', NULL, '-1176922938', '1977-05-16', 1, NULL, NULL),
(18578, 2, 1, '13362068', 'LUIS ANTONIO ORTEGA ORTIZ', NULL, NULL, '1956-07-19', '0', 'sincorreo@sincorreo.com', NULL, '-1072492165', '1977-08-03', 1, NULL, NULL),
(18579, 2, 1, '1733875', 'LUIS ANTONIO PEREZ GALVIZ', NULL, NULL, '1944-06-21', NULL, 'luisantonioperez12@hotmail.com', NULL, '-1065486318', '1967-03-20', 1, NULL, NULL),
(18580, 2, 1, '13370882', 'LUIS ANTONIO TORRES GARCIA', NULL, NULL, '1952-08-06', '0', 'sincorreo@sincorreo.com', NULL, '-1090873405', '1974-09-03', 1, NULL, NULL),
(18581, 2, 1, '1091674128', 'LUIS EDUARDO CASADIEGOS CONTRERAS', NULL, NULL, '1995-07-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1162492566', '2013-08-20', 1, NULL, NULL),
(18582, 2, 1, '1066062831', 'LUIS EDUARDO JACOME', NULL, NULL, '1992-11-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1151436816', '2011-03-08', 1, NULL, NULL),
(18583, 2, 1, '88278627', 'LUIS EDUARDO LEON AMAYA', NULL, NULL, '1973-04-19', '0', 'sincorreo@sincorreo.com', NULL, '-1128108426', '1991-09-05', 1, NULL, NULL),
(18584, 2, 1, '1066062406', 'LUIS EDUARDO MENDOZA DUARTE', NULL, NULL, '1989-06-23', '0', 'lalomendoza0623@hotmail.com', NULL, '-1135706307', '2007-07-19', 1, NULL, NULL),
(18585, 2, 1, '5035241', 'LUIS EDUARDO MENDOZA SANTIAGO', NULL, NULL, '1964-05-26', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1983-02-24', 1, NULL, NULL),
(18586, 2, 1, '13176459', 'LUIS EDUARDO TRIGOS VERJEL', NULL, NULL, '1984-03-01', '0', 'luiseduardotrigosvergel@gmail.com', NULL, '-1065665332', '2002-05-06', 1, NULL, NULL),
(18587, 2, 1, '88137616', 'LUIS EMEL RINCON QUINTERO', NULL, NULL, '1963-06-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1072261486', '1982-11-19', 1, NULL, NULL),
(18588, 2, 1, '13355898', 'LUIS EMILIO AVENDAÃ±O MORA', NULL, NULL, '1948-05-19', '0', 'sincorreo@sincorreo.com', NULL, '-1091878210', '1970-12-15', 1, NULL, NULL),
(18589, 2, 1, '1733746', 'LUIS EMILIO MANZANO RUEDAS', NULL, NULL, '1940-03-06', '-1081790250', 'sincorreo@sincorreo.com', NULL, NULL, '1961-06-22', 1, NULL, NULL),
(18590, 2, 1, '5453588', 'LUIS EMIRO CARRASCAL ROPERO', NULL, NULL, '1956-03-15', '0', 'sincorreo@sincorreo.com', NULL, '-1150638100', '1977-08-05', 1, NULL, NULL),
(18591, 2, 1, '5035242', 'LUIS EMIRO DUARTE QUINTERO', NULL, NULL, '1963-05-18', '0', 'sincorreo@sincorreo.com', NULL, '-1155981051', '1983-02-24', 1, NULL, NULL),
(18592, 2, 1, '5035200', 'LUIS ENRRIQUE NAVARRO BOHORQUEZ', NULL, NULL, '1963-02-03', '0', 'sincorreo@sincorreo.com', NULL, '-1169093406', '1981-12-14', 1, NULL, NULL),
(18593, 2, 1, '1066062056', 'LUIS FERNANDO AMAYA LOZANO', NULL, NULL, '1986-02-18', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2004-04-21', 1, NULL, NULL),
(18594, 2, 1, '88137783', 'LUIS FERNANDO LOZANO QUINTERO', NULL, NULL, '1963-12-07', '0', 'loquinsainde@outlook.com', NULL, '-1130036633', '1982-12-09', 1, NULL, NULL),
(18595, 2, 1, '1733755', 'LUIS FERNANDO OSORIO SANTIAGO', NULL, NULL, '1940-01-08', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1961-12-18', 1, NULL, NULL),
(18596, 2, 1, '5035051', 'LUIS FERNANDO QUINTERO DUARTE', NULL, NULL, '1958-10-07', '0', 'fedoquin@hotmail.com', NULL, '-1129642087', '1977-05-17', 1, NULL, NULL),
(18597, 2, 1, '1066062509', 'LUIS FERNANDO QUINTERO PICON', NULL, NULL, '1990-05-11', NULL, 'luisferquin11@hotmail.com', NULL, '-1150647544', '2008-08-13', 1, NULL, NULL),
(18598, 2, 1, '1091666677', 'LUIS FERNANDO TORO RUEDA', NULL, NULL, '1991-10-15', NULL, 'luifer@hotmail.com', NULL, '-1192871885', '2009-12-24', 1, NULL, NULL),
(18599, 2, 1, '1091661071', 'LUIS FERNANDO ZAPATA ARENAS', NULL, NULL, '1988-07-13', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2007-05-07', 1, NULL, NULL),
(18600, 2, 1, '5035402', 'LUIS GERMAN OSORIO OSORIO', NULL, NULL, '1969-11-13', '0', 'osorioosorioluisgerman@gmail.com', NULL, '-1126305008', '1987-11-17', 1, NULL, NULL),
(18601, 2, 1, '88138359', 'LUIS HUMBERTO QUINTERO', NULL, NULL, '1964-06-10', '0', 'sincorreo@sincorreo.com', NULL, '-1122505929', '1983-07-21', 1, NULL, NULL),
(18602, 2, 1, '1091163920', 'LUIS JOSE SANTIAGO MENESES', NULL, NULL, '1998-11-21', '0', 'luisjsantiago1@outlook.com', NULL, '-1151739599', '2016-11-23', 1, NULL, NULL),
(18603, 2, 1, '88268745', 'LUIS MAGNELIO CORREDOR RODRIGUEZ', NULL, NULL, '1983-11-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1150757475', '2001-11-23', 1, NULL, NULL),
(18604, 2, 1, '1735094', 'LUIS MARIN PAREDES SOTO', NULL, NULL, '1953-11-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1149071046', '1975-07-15', 1, NULL, NULL),
(18605, 1, 1, '1064086106', 'LUIS MARIO SOLANO LOZANO', NULL, NULL, '2004-12-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1086158622', '2018-01-02', 1, NULL, NULL),
(18606, 1, 1, '1092738139', 'LUIS MATEO ARIAS GAONA', NULL, NULL, '2006-05-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1161716600', '2013-11-22', 1, NULL, NULL),
(18607, 2, 1, '1091679365', 'LUIS MIGUEL AVENDAÃ‘O LOZANO', NULL, NULL, '1997-12-15', '0', 'lmavendano97@outlook.es', NULL, '-1168585052', '2015-12-22', 1, NULL, NULL),
(18608, 1, 1, '1064086071', 'LUIS MIGUEL BONILLA PEREZ', NULL, NULL, '2004-09-16', '0', 'bonillaluismiguel306@gmail.com', NULL, '-1062575491', '2018-09-21', 1, NULL, NULL),
(18609, 2, 1, '1000224989', 'LUIS MIGUEL GARCIA QUINTERO', NULL, NULL, '2000-01-02', '0', 'garciaquinteroluismi2702@hotmail.com', NULL, '-1160387452', '2018-02-05', 1, NULL, NULL),
(18610, 2, 1, '1091674447', 'LUIS MIGUEL MONTEJO SALAZAR', NULL, NULL, '1993-08-19', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2013-10-02', 1, NULL, NULL),
(18611, 2, 1, '13357604', 'LUIS OMAR BARBOSA NAVARRO', NULL, NULL, '1949-10-28', '0', 'sincorreo@sincorreo.com', NULL, '-1120050946', '1973-05-18', 1, NULL, NULL),
(18612, 2, 1, '1193153938', 'LUIS ORLANDO ANGARITA SANTIAGO', NULL, NULL, '2000-09-23', '0', 'luisorangsan@gmail.com', NULL, '-1138253495', '2018-09-28', 1, NULL, NULL),
(18613, 2, 1, '13168398', 'LUIS RAUL ARENAS DURAN', NULL, NULL, '1976-02-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1179020087', '1994-06-20', 1, NULL, NULL),
(18614, 2, 2, '5528823', 'LUIS SANIEL AFANADOR SUESCUN', NULL, NULL, '1962-01-21', '0', 'sincorreo@sincorreo.com', NULL, '-1150334900', '1981-11-26', 1, NULL, NULL),
(18615, 2, 1, '1003257505', 'LUISA FERNANDA AVENDAÃ‘O MORA', NULL, NULL, '2000-06-29', '0', 'avalbuenaavendano@gmail.com', NULL, '-1070571766', '2018-09-07', 1, NULL, NULL),
(18616, 1, 1, '1091652315', 'LUISA FERNANDA GRANADOS GRANADOS', NULL, NULL, '2003-07-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1169341634', '2017-11-16', 1, NULL, NULL),
(18617, 2, 1, '1003257429', 'LUISA FERNANDA HORLANDY OSORIO', NULL, NULL, '2002-07-29', NULL, 'chawiosorio@gmail.com', NULL, '-1108786792', '2020-08-06', 1, NULL, NULL),
(18618, 2, 1, '26777450', 'LUISA FERNANDA SANTANA LOZANO', NULL, NULL, '1984-12-04', NULL, 'lfsl0512@hotmail.com', NULL, '-1119838139', '2002-12-26', 1, NULL, NULL),
(18619, 1, 1, '-1673436652', 'LUISA MARIA BARBOSA CONTRERAS', NULL, NULL, '1997-11-08', NULL, 'luisita20101997@hotmail.es', NULL, NULL, '2012-01-20', 1, NULL, NULL),
(18620, 2, 1, '26774838', 'LUISA TORCOROMA OSORIO OSORIO', NULL, NULL, '1966-08-10', '0', 'luisaosorio1966@hotmail.com', NULL, '-1119843725', '1987-10-07', 1, NULL, NULL),
(18621, 2, 1, '1066062310', 'LUNID  GOMEZ', NULL, NULL, '1988-06-12', '0', 'lunidgomez1998@gmail.com', NULL, '-1187015338', '2006-11-21', 1, NULL, NULL),
(18622, 2, 1, '1116202376', 'LUZ DARY MESA ROPERO', NULL, NULL, '1987-04-18', '0', 'sincorreo@sincorreo.com', NULL, '-1170045883', '2006-05-24', 1, NULL, NULL),
(18623, 2, 1, '1007320986', 'LUZ DARY REYES QUINTERO', NULL, NULL, '1991-03-18', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2015-01-09', 1, NULL, NULL),
(18624, 2, 1, '49789684', 'LUZ DARYS BLANDON CLAVIJO', NULL, NULL, '1978-12-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1178232572', '1997-06-11', 1, NULL, NULL),
(18625, 2, 1, '1066062073', 'LUZ ENITH GOMEZ DUARTE', NULL, NULL, '1977-03-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1171557143', '2004-06-23', 1, NULL, NULL),
(18626, 2, 1, '1066062096', 'LUZ ESTELLA CONTRERAS LOBO', NULL, NULL, '1986-12-22', '0', 'sincorreo@sincorreo.com', NULL, '-1171533501', '2005-05-17', 1, NULL, NULL),
(18627, 2, 1, '27727852', 'LUZ ESTHER RINCON CARRASCAL', NULL, NULL, '1962-07-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1107862201', '1987-07-08', 1, NULL, NULL),
(18628, 2, 1, '37332977', 'LUZ MARIA CHINCHILLA REYES', NULL, NULL, '1971-03-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1066241762', '1997-04-08', 1, NULL, NULL),
(18629, 2, 1, '26777258', 'LUZ MARIA DUARTE GUTIERREZ', NULL, NULL, '1966-08-06', '0', 'sincorreo@sincorreo.com', NULL, '-1090752269', '1997-07-28', 1, NULL, NULL),
(18630, 2, 1, '26777201', 'LUZ MARIA NAVARRO SANTIAGO', NULL, NULL, '1968-05-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1107579246', '1996-10-31', 1, NULL, NULL),
(18631, 2, 1, '26777159', 'LUZ MARIA PAVA JACOME', NULL, NULL, '1957-07-08', '0', 'sincorreo@sincorreo.com', NULL, '-1086861048', '1981-02-13', 1, NULL, NULL),
(18632, 2, 1, '51836053', 'LUZ MARINA DAZA CLAVIJO', NULL, NULL, '1966-04-15', NULL, 'yelma1504@gmail.com', NULL, '-1187857358', '1984-12-31', 1, NULL, NULL),
(18633, 2, 1, '26775010', 'LUZ MARINA DUARTE GALVIS', NULL, NULL, '1974-11-05', '0', 'sincorreo@sincorreo.com', NULL, '-1180401548', '1993-03-29', 1, NULL, NULL),
(18634, 2, 1, '26774434', 'LUZ MARINA JACOME BOHORQUEZ', NULL, NULL, '1951-06-14', '0', 'sincorreo@sincorreo.com', NULL, '-1139484871', '1973-11-23', 1, NULL, NULL),
(18635, 2, 1, '26774989', 'LUZ MARINA MOLINA QUINTERO', NULL, NULL, '1974-04-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1082355092', '1992-05-28', 1, NULL, NULL),
(18636, 2, 1, '37320493', 'LUZ MARINA PACHECO PICON', NULL, NULL, '1968-12-24', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1986-12-26', 1, NULL, NULL),
(18637, 2, 1, '26777391', 'LUZ MARINA RIVERA SANTIAGO', NULL, NULL, '1983-04-21', NULL, 'luzaura09@hotmail.com', NULL, '-1162178417', '2001-08-14', 1, NULL, NULL),
(18638, 2, 1, '37366316', 'LUZ MARINA ROMERO DE CORONEL', NULL, NULL, '1961-12-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1170314965', '1981-12-14', 1, NULL, NULL),
(18639, 2, 1, '49660626', 'LUZ MARINA VEGA VERA', NULL, NULL, '1973-09-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1186269475', '1991-11-08', 1, NULL, NULL),
(18640, 2, 2, '66680310', 'LUZ MARY QUINTERO MARIN', NULL, NULL, '1976-02-03', '0', 'qmary387@gmail.com', NULL, '-1152836971', '1994-06-20', 1, NULL, NULL),
(18641, 2, 1, '37333930', 'LUZ MARY YARURO DELGADO', NULL, NULL, '1979-09-13', '0', 'sincorreo@sincorreo.com', NULL, '-1072445972', '1997-11-10', 1, NULL, NULL),
(18642, 2, 1, '1090983331', 'LUZ MERI DURAN ANGARITA', NULL, NULL, '1986-08-17', '0', 'sincorreo@sincorreo.com', NULL, '-1192677907', '2005-04-01', 1, NULL, NULL),
(18643, 2, 1, '26774931', 'LUZ MERY DURAN JACOME', NULL, NULL, '1971-03-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1168602353', '1990-10-24', 1, NULL, NULL),
(18644, 2, 1, '37369040', 'LUZ MERY NAVARRO RUEDAS', NULL, NULL, '1972-08-07', '0', 'sincorreo@sincorreo.com', NULL, '-1151240369', '1992-03-27', 1, NULL, NULL),
(18645, 2, 1, '27728202', 'LUZ MILA GUERRERO CASTILLA', NULL, NULL, '1973-12-11', '0', 'sincorreo@sincorreo.com', NULL, '-1082650795', '1992-09-13', 1, NULL, NULL),
(18646, 2, 1, '26777379', 'LUZ MILVIA MENESES MU?OZ', NULL, NULL, '1977-08-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1166911055', '2001-04-25', 1, NULL, NULL),
(18647, 2, 1, '1007953887', 'LUZ NEIDY QUINTERO GARCIA', NULL, NULL, '2000-04-05', '0', 'luz-neidyq@hotmail.com', NULL, '-1128628776', '2018-04-25', 1, NULL, NULL),
(18648, 2, 1, '26777431', 'LUZ NEYLA CHINCHILLA GALVIS', NULL, NULL, '1983-08-31', '0', 'sincorreo@sincorreo.com', NULL, '-1080337367', '2002-06-13', 1, NULL, NULL),
(18649, 2, 1, '37311959', 'LUZ STELLA MORENO BONILLA', NULL, NULL, '1957-10-21', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1978-03-03', 1, NULL, NULL),
(18650, 2, 1, '49755015', 'LUZMILA  ARDILA JAIMES', NULL, NULL, '1970-03-12', NULL, 'luzmilaardilajaim@hotmail.com', NULL, '-1188201280', '1988-04-29', 1, NULL, NULL),
(18651, 2, 1, '37370531', 'LUZMIRA  MANDON AYALA', NULL, NULL, '1972-12-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1156545289', '1997-05-02', 1, NULL, NULL),
(18652, 2, 2, '27887549', 'LYDA HAZEL RODRIGUEZ MORA', NULL, NULL, '1972-02-09', '0', 'ari2695@hotmail.com', NULL, '-1152162127', '1991-02-25', 1, NULL, NULL),
(18653, 2, 2, '27887585', 'LYDE AMPARO FLOREZ RODRIGUEZ', NULL, NULL, '1973-08-06', '0', 'lydeflorez5214@gmail.com', NULL, '-1186998682', '1991-10-07', 1, NULL, NULL),
(18654, 2, 1, '1066063104', 'MABEL YINETH SANTIAGO MOLINA', NULL, NULL, '1995-01-09', NULL, 'mabelcra0109@gmail.com', NULL, '-1062678432', '2013-01-15', 1, NULL, NULL),
(18655, 2, 1, '26777425', 'MADALEINE  PACHECO MOLINA', NULL, NULL, '1984-04-22', '0', 'madeyberny@gmail.com', NULL, '-1160494043', '2002-05-03', 1, NULL, NULL),
(18656, 2, 1, '1004866442', 'MAGALY  RANGEL SANGUINO', NULL, NULL, '1999-08-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1071281060', '2017-09-19', 1, NULL, NULL),
(18657, 2, 1, '37369226', 'MAGALY  SANGUINO JACOME', NULL, NULL, '1974-09-24', '0', 'magalisanguino87@hotmail.com', NULL, '-1088268936', '1992-12-09', 1, NULL, NULL),
(18658, 2, 1, '1091670719', 'MAGDA IBETH ANGARITA MENDOZA', NULL, NULL, '1993-08-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1088308782', '2012-01-03', 1, NULL, NULL),
(18659, 2, 1, '26775034', 'MAGDA INES MOLINA GALVIZ', NULL, NULL, '1975-04-21', NULL, 'magdismolgal75@hotmail.com', NULL, '-1172188100', '1993-09-12', 1, NULL, NULL),
(18660, 2, 1, '37324908', 'MAGDA LORENA LEBOLO LOZANO', NULL, NULL, '1972-01-15', '0', 'maglebolo@hotmail.com', NULL, '-1129744698', '1990-09-13', 1, NULL, NULL),
(18661, 2, 1, '1093914457', 'MAGDA LORENA NAVARRO RIVERA', NULL, NULL, '1992-03-07', '0', 'sincorreo@sincorreo.com', NULL, '-1142079732', '2011-04-29', 1, NULL, NULL),
(18662, 2, 1, '26775035', 'MAGDA SENIT MENDOZA RINCON', NULL, NULL, '1973-11-28', '0', 'sincorreo@sincorreo.com', NULL, '-1071279195', '1993-09-13', 1, NULL, NULL),
(18663, 2, 1, '37324586', 'MAGLOIRE  PAREDES GUERRERO', NULL, NULL, '1971-10-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1071278434', '1990-07-31', 1, NULL, NULL),
(18664, 2, 1, '37367871', 'MAGOLA  PAEZ SEPULVEDA', NULL, NULL, '1965-05-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1071708222', '1988-08-09', 1, NULL, NULL),
(18665, 2, 1, '26774752', 'MAGOLA  QUINTERO BOHORQUEZ', NULL, NULL, '1961-12-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1092920906', '1983-12-12', 1, NULL, NULL),
(18666, 2, 1, '26777316', 'MAHIDELY  SANTIAGO MOLINA', NULL, NULL, '1981-05-02', '0', 'sincorreo@sincorreo.com', NULL, '-1152098335', '1999-08-12', 1, NULL, NULL),
(18667, 2, 1, '26777423', 'MAIDA  VACA ANGARITA', NULL, NULL, '1982-12-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1059674837', '2002-04-30', 1, NULL, NULL),
(18668, 2, 1, '1091659516', 'MAIDA YOLIANA CARRASCAL SALAZAR', NULL, NULL, '1987-11-07', '0', 'maidacarrascal07@gmail.com', NULL, '-1158098932', '2006-10-12', 1, NULL, NULL),
(18669, 2, 1, '26777271', 'MAILE YULIETH LOZANO QUINTERO', NULL, NULL, '1979-10-06', '0', 'juanescervantes2010@gmail.com', NULL, '-1180127805', '1997-11-27', 1, NULL, NULL),
(18670, 2, 1, '1066063228', 'MAILY KATERINE SARABIA PAEZ', NULL, NULL, '1995-11-26', '0', 'sincorreo@sincorreo.com', NULL, '-1067731097', '2014-01-14', 1, NULL, NULL),
(18671, 2, 1, '1091664794', 'MAIRA ALEJANDRA ALVAREZ ORTEGA', NULL, NULL, '1990-09-29', '0', 'malejandra.1725@hotmail.com', NULL, '-787950120', '2008-11-28', 1, NULL, NULL),
(18672, 2, 1, '1066063043', 'MAIRA ALEJANDRA BARRERA MANDON', NULL, NULL, '1994-07-30', '0', 'malejabm@hotmail.com', NULL, '-1137195462', '2012-08-29', 1, NULL, NULL),
(18673, 2, 1, '1066062329', 'MAIRA ALEJANDRA SANTANA LOZANO', NULL, NULL, '1989-01-03', NULL, 'abogmsantana@gmail.com', NULL, '-1129617131', '2007-01-09', 1, NULL, NULL),
(18674, 2, 1, '26774733', 'MALELY  MOLINA NAVARRO', NULL, NULL, '1961-04-18', NULL, 'sincorreo@sincorreo.com', NULL, '-789643340', '1983-08-10', 1, NULL, NULL),
(18675, 2, 1, '37311479', 'MALELY  QUINN DE CLARO', NULL, NULL, '1949-03-03', '0', 'malyquinn@hotmail.com', NULL, '-1292842791', '1977-10-03', 1, NULL, NULL),
(18676, 2, 1, '1093787440', 'MANUEL  CARRASCAL BECERRA', NULL, NULL, '1996-08-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1169283210', '2014-10-20', 1, NULL, NULL),
(18677, 2, 1, '3803791', 'MANUEL DE JESUS NAVARRO RODELO', NULL, NULL, '1960-12-25', '0', 'sincorreo@sincorreo.com', NULL, '-1075083880', '1979-05-29', 1, NULL, NULL),
(18678, 2, 1, '5035067', 'MANUEL DE JESUS PORTILLO ANGARITA', NULL, NULL, '1957-01-29', '0', 'sincorreo@sincorreo.com', NULL, '-1086657023', '1977-10-21', 1, NULL, NULL),
(18679, 2, 1, '18923421', 'MANUEL JESUS DOMINGUEZ LOPEZ', NULL, NULL, '1968-12-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1152092480', '1989-05-09', 1, NULL, NULL),
(18680, 2, 1, '5035442', 'MANUEL JESUS GARCIA DUARTE', NULL, NULL, '1970-01-23', '0', 'sincorreo@sincorreo.com', NULL, '-1172187332', '1988-09-08', 1, NULL, NULL),
(18681, 2, 1, '1733784', 'MANUEL JESUS JACOME LEMUS', NULL, NULL, '1940-05-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1137075682', '1961-12-18', 1, NULL, NULL),
(18682, 2, 1, '5035610', 'MANUEL JESUS PACHECO ACOSTA', NULL, NULL, '1974-04-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1071341768', '1992-09-03', 1, NULL, NULL),
(18683, 2, 1, '5035088', 'MANUEL SALVADOR MANOSALVA MORA', NULL, NULL, '1960-11-09', '0', 'sincorreo@sincorreo.com', NULL, '-1160398013', '1979-02-27', 1, NULL, NULL),
(18684, 2, 1, '88284615', 'MANZUR  GRANADOS SILVA', NULL, NULL, '1978-03-09', NULL, 'mansuraerocivil@hotmail.com', NULL, '-1192709094', '1996-10-01', 1, NULL, NULL),
(18685, 2, 1, '26777393', 'MARCELINA  VEGA LOPEZ', NULL, NULL, '1962-04-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2001-09-10', 1, NULL, NULL),
(18686, 2, 1, '5453964', 'MARCO ELIAS QUINTERO QUINTERO', NULL, NULL, '1960-12-19', NULL, 'quinteromarcos1990@gmail.com', NULL, '-1152940312', '1981-05-25', 1, NULL, NULL),
(18687, 2, 1, '5458877', 'MARCO FIDEL BAYONA RUEDAS', NULL, NULL, '1961-07-26', '0', 'sincorreo@sincorreo.com', NULL, '-1108378249', '1980-10-29', 1, NULL, NULL),
(18688, 2, 1, '1064839223', 'MARGELIS  MELO YARURO', NULL, NULL, '1992-03-13', '0', 'sincorreo@sincorreo.com', NULL, '-1167671816', '2010-08-12', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(18689, 2, 1, '49797095', 'MARGELIS HORTENCIA VALBUENA PEREZ', NULL, NULL, '1979-12-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1142880198', '1999-03-10', 1, NULL, NULL),
(18690, 2, 1, '26774861', 'MARGOT  DUARTE GARCIA', NULL, NULL, '1969-02-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1167445410', '1988-08-01', 1, NULL, NULL),
(18691, 2, 1, '37370298', 'MARGOTH  MANDON MANDON', NULL, NULL, '1975-04-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1071088853', '1996-08-13', 1, NULL, NULL),
(18692, 2, 1, '1093748139', 'MARGOTH  MANDON QUINTERO', NULL, NULL, '1988-12-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1081839598', '2007-02-20', 1, NULL, NULL),
(18693, 2, 1, '27765075', 'MARIA AGRIPINA MOLINA DUARTE', NULL, NULL, '1949-04-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1119840763', '1974-01-21', 1, NULL, NULL),
(18694, 2, 1, '1003265414', 'MARIA ALEXANDRA SANTANA RIVERA', NULL, NULL, '2001-11-11', NULL, 'riverasantanamariaalexandra@gmail.com', NULL, '-1107007115', '2019-11-15', 1, NULL, NULL),
(18695, 2, 1, '27770666', 'MARIA AMINTA SUAREZ QUINTERO', NULL, NULL, '1959-09-16', '0', 'sincorreo@sincorreo.com', NULL, '-1136157718', '1979-02-13', 1, NULL, NULL),
(18696, 2, 2, '1090529739', 'MARIA ANDREINA MOLINA OCHOA', NULL, NULL, '1999-05-05', '0', 'andreitamolina05@gmail.com', NULL, '-1190303306', '2017-08-31', 1, NULL, NULL),
(18697, 1, 1, '1066062160', 'MARIA ANGELICA CONTRERAS ANGARITA', NULL, NULL, '2005-10-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1088691002', '2019-01-11', 1, NULL, NULL),
(18698, 2, 1, '1019091553', 'MARIA ANGELICA PEREZ RINCON', NULL, NULL, '1993-12-17', '0', 'mariangel1793@hotmail.com', NULL, '-1130413945', '2012-02-16', 1, NULL, NULL),
(18699, 2, 1, '1004944800', 'MARIA ANGELICA SALAZAR PRADO', NULL, NULL, '1997-03-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1081518118', '2015-07-24', 1, NULL, NULL),
(18700, 2, 1, '1005062859', 'MARIA ANYELA BECERRA CARRASCAL', NULL, NULL, '1988-11-26', NULL, '30643.ipk@gmail.com', NULL, '-1151102691', '2007-05-08', 1, NULL, NULL),
(18701, 2, 1, '26774495', 'MARIA CANDELARIA GARCIA DE ASCANIO', NULL, NULL, '1949-02-02', '0', 'sincorreo@sincorreo.com', NULL, '-1141001249', '1974-01-21', 1, NULL, NULL),
(18702, 2, 1, '1090406937', 'MARIA CLAUDIA ALVEAR PICON', NULL, NULL, '1989-03-04', NULL, 'claudia.alvear2214@gmail.com', NULL, '-1091604384', '2007-08-24', 1, NULL, NULL),
(18703, 2, 2, '37344967', 'MARIA CLAUDIA RODRIGUEZ RAMIREZ', NULL, NULL, '1978-08-18', '0', 'mariaclaudiarodriguezramirez1@gmail.com', NULL, '-1091274814', '1997-03-21', 1, NULL, NULL),
(18704, 2, 1, '26774395', 'MARIA CONCEPCION JACOME DE VANEGAS', NULL, NULL, '1942-01-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1086621443', '1969-10-23', 1, NULL, NULL),
(18705, 2, 1, '26777100', 'MARIA CONCEPCION OSORIO DE JACOME', NULL, NULL, '1936-12-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1185993302', '1960-03-02', 1, NULL, NULL),
(18706, 2, 2, '1093300864', 'MARIA CORINA CHACON SANCHEZ', NULL, NULL, '1969-05-08', '0', 'anyereca@gmail.com', NULL, '-1080073049', '2010-09-21', 1, NULL, NULL),
(18707, 2, 1, '1091668352', 'MARIA CRISTINA GUTIERREZ NAVARRO', NULL, NULL, '1992-04-01', '0', 'mariakgutierrez02@gmail.com', NULL, '-1101023472', '2010-10-06', 1, NULL, NULL),
(18708, 2, 1, '37372912', 'MARIA CRISTINA QUINTERO SANCHEZ', NULL, NULL, '1985-09-25', '0', 'chrristi10a@hotmail.com', NULL, '-1167708008', '2004-01-13', 1, NULL, NULL),
(18709, 2, 1, '26774897', 'MARIA DE LA CRUZ SANTIAGO RODRIGUEZ', NULL, NULL, '1968-05-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1082866124', '1989-05-04', 1, NULL, NULL),
(18710, 2, 1, '27744234', 'MARIA DEL CARMEN AMAYA MORA', NULL, NULL, '1955-07-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1129351504', '1983-04-20', 1, NULL, NULL),
(18711, 2, 1, '26774621', 'MARIA DEL CARMEN ARO MANDON', NULL, NULL, '1958-02-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1151213105', '1979-10-01', 1, NULL, NULL),
(18712, 2, 1, '26777285', 'MARIA DEL CARMEN CONTRERAS PORTILLO', NULL, NULL, '1980-01-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1118352011', '1998-05-29', 1, NULL, NULL),
(18713, 2, 1, '26774655', 'MARIA DEL CARMEN ECHAVEZ DE QUINTERO', NULL, NULL, '1961-04-21', '0', 'sincorreo@sincorreo.com', NULL, '-1191629016', '1981-01-15', 1, NULL, NULL),
(18714, 2, 1, '26774519', 'MARIA DEL CARMEN MENDOZA DE OSORIO', NULL, NULL, '1954-05-21', '0', 'mela210554@hotmail.com', NULL, '-1142406543', '1975-11-18', 1, NULL, NULL),
(18715, 2, 1, '26774333', 'MARIA DEL CARMEN QUINTERO DE QUINTERO', NULL, NULL, '1944-12-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1117601058', '1966-08-17', 1, NULL, NULL),
(18716, 2, 1, '26775073', 'MARIA DEL CARMEN RUEDAS CONTRERAS', NULL, NULL, '1969-12-19', '0', 'sincorreo@sincorreo.com', NULL, '-1079525421', '1994-10-31', 1, NULL, NULL),
(18717, 2, 1, '26775044', 'MARIA DEL CARMEN SOLANO RODRIGUEZ', NULL, NULL, '1969-05-02', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1993-11-30', 1, NULL, NULL),
(18718, 2, 1, '37330473', 'MARIA DEL CARMEN TORRES SANCHEZ', NULL, NULL, '1976-10-17', '0', 'sincorreo@sincorreo.com', NULL, '-1170135437', '1995-03-27', 1, NULL, NULL),
(18719, 2, 1, '26777218', 'MARIA DEL PILAR CONTRERAS MANZANO', NULL, NULL, '1977-03-07', '0', 'sincorreo@sincorreo.com', NULL, '-1062084566', '1997-06-11', 1, NULL, NULL),
(18720, 2, 1, '26774956', 'MARIA DEL ROSARIO ANGARITA PACHECO', NULL, NULL, '1971-07-11', '0', 'mangaritapacheco@gmail.com', NULL, '-1085115569', '1991-07-27', 1, NULL, NULL),
(18721, 2, 1, '26775037', 'MARIA DEL ROSARIO ARIAS MADARIAGA', NULL, NULL, '1972-05-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1131465845', '1993-09-18', 1, NULL, NULL),
(18722, 2, 1, '26774640', 'MARIA DEL SOCORRO OSORIO LEMUS', NULL, NULL, '1961-03-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1127985444', '1979-12-09', 1, NULL, NULL),
(18723, 2, 1, '36114274', 'MARIA DELCY MU?OZ MU?OZ', NULL, NULL, '1979-01-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1082274062', '1998-05-29', 1, NULL, NULL),
(18724, 2, 1, '26674948', 'MARIA DIOSELINA LOZANO DE QUINTERO', NULL, NULL, '1948-09-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1139481460', '1971-06-11', 1, NULL, NULL),
(18725, 2, 1, '27770678', 'MARIA DORA PRADO DE CASTRO', NULL, NULL, '1959-09-04', '0', 'sincorreo@sincorreo.com', NULL, '-1156687932', '1980-10-01', 1, NULL, NULL),
(18726, 2, 1, '26774829', 'MARIA DORINA GALVIS SANCHEZ', NULL, NULL, '1968-02-20', '0', 'mariadorinagalvizsanches@gmail.com', NULL, '-1141826139', '1987-09-09', 1, NULL, NULL),
(18727, 2, 1, '26774599', 'MARIA EDILIA PACHECO QUINTERO', NULL, NULL, '1953-12-10', '0', 'sincorreo@sincorreo.com', NULL, '-1137077231', '1977-10-25', 1, NULL, NULL),
(18728, 2, 1, '26774297', 'MARIA ELFA QUINTERO PAVA', NULL, NULL, '1942-09-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1179431514', '1963-12-10', 1, NULL, NULL),
(18729, 2, 1, '49640023', 'MARIA ELOINA DUARTE PORTILLO', NULL, NULL, '1965-04-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1128761501', '1985-11-28', 1, NULL, NULL),
(18730, 2, 1, '26774878', 'MARIA EMMA DURAN', NULL, NULL, '1942-01-13', '0', 'sincorreo@sincorreo.com', NULL, '-1179738029', '1988-12-12', 1, NULL, NULL),
(18731, 2, 1, '27764544', 'MARIA EMMA MORA DE CASTRO', NULL, NULL, '1951-02-20', '0', 'sincorreo@sincorreo.com', NULL, '-1182835313', '1974-01-21', 1, NULL, NULL),
(18732, 2, 1, '1091163485', 'MARIA ESPERANZA SANTIAGO MENESES', NULL, NULL, '1996-03-04', NULL, 'marialuna20141148@hotmail.com', NULL, '-1176903717', '2014-03-27', 1, NULL, NULL),
(18733, 2, 1, '26774710', 'MARIA ESTHELA ANGARITA HORLANDY', NULL, NULL, '1962-09-28', '0', 'haneste28@gmail.com', NULL, '-1132041639', '1982-12-02', 1, NULL, NULL),
(18734, 2, 1, '26774594', 'MARIA EUFEMIA MANOSALVA DUARTE', NULL, NULL, '1958-02-06', '0', 'sincorreo@sincorreo.com', NULL, '-1121113508', '1977-09-26', 1, NULL, NULL),
(18735, 2, 1, '26777257', 'MARIA EUGENIA PORTILLO ANGARITA', NULL, NULL, '1979-05-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1147941800', '1997-05-30', 1, NULL, NULL),
(18736, 2, 1, '26774942', 'MARIA EUGENIA QUINTERO BARBOSA', NULL, NULL, '1971-09-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1130066479', '1991-03-14', 1, NULL, NULL),
(18737, 2, 1, '37815546', 'MARIA EUGENIA SANTOS GIRALDO', NULL, NULL, '1950-06-27', NULL, 'idbfls99@hotmail.com', NULL, '-1112553653', '1974-01-21', 1, NULL, NULL),
(18738, 2, 1, '1066063605', 'MARIA FERNANDA CA?IZARES PE?UELA', NULL, NULL, '1998-11-22', NULL, 'mariafernandacanizarespenuela@gmail.com', NULL, '-1192299579', '2017-01-23', 1, NULL, NULL),
(18739, 2, 1, '1143394325', 'MARIA FERNANDA SIERRA PABA', NULL, NULL, '1996-08-22', NULL, 'mafesierra_1022@hotmail.com', NULL, '-1290225363', '2014-09-19', 1, NULL, NULL),
(18740, 2, 1, '37314429', 'MARIA GEORGINA MORA CASTRO', NULL, NULL, '1959-10-08', '0', 'sincorreo@sincorreo.com', NULL, '-1086436842', '1980-09-02', 1, NULL, NULL),
(18741, 2, 1, '26774866', 'MARIA GUADALUPE NAVARRO BOHORQUEZ', NULL, NULL, '1970-05-07', '0', 'mariagunavarro@gmail.com', NULL, '-1118215762', '1988-08-24', 1, NULL, NULL),
(18742, 2, 1, '26774922', 'MARIA IRENE JAIMES BONET', NULL, NULL, '1967-12-15', '0', 'sincorreo@sincorreo.com', NULL, '-1142276031', '1989-12-11', 1, NULL, NULL),
(18743, 1, 1, '1064086129', 'MARIA ISABEL ARIAS GARCIA', NULL, NULL, '2005-03-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1128965956', '2019-12-19', 1, NULL, NULL),
(18744, 2, 1, '37330942', 'MARIA ISABEL CARRILLO PEREZ', NULL, NULL, '1974-03-05', '0', 'sincorreo@sincorreo.com', NULL, '-1188190863', '1995-09-05', 1, NULL, NULL),
(18745, 2, 1, '37325234', 'MARIA ISABEL TORO', NULL, NULL, '1971-08-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1122652790', '1990-12-17', 1, NULL, NULL),
(18746, 2, 1, '26777290', 'MARIA JOHANA MOLINA LEMUS', NULL, NULL, '1980-07-23', '0', 'mariajohanaml@hotmail.es', NULL, '-1179637243', '1998-07-27', 1, NULL, NULL),
(18747, 1, 1, '1066062463', 'MARIA JOSE ALVAREZ HORLANDY', NULL, NULL, '2008-02-14', '0', 'sincorreo@gmail.com', NULL, '-1066950199', '2015-03-03', 1, NULL, NULL),
(18748, 1, 1, '1003257582', 'MARIA JOSE CALSADA OSORIO', NULL, NULL, '2002-05-05', NULL, 'mariajose110525@gmail.com', NULL, '-1106307015', '2016-06-24', 1, NULL, NULL),
(18749, 2, 1, '1003257648', 'MARIA JOSE CARRASCAL TRILLOS', NULL, NULL, '2003-10-05', '0', 'mcarrascaltrillos@gmail.com', NULL, '-1077259903', '2017-10-19', 1, NULL, NULL),
(18750, 2, 1, '37319179', 'MARIA JOSEFA CONTRERAS BECERRA', NULL, NULL, '1965-11-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1151685117', '1985-03-20', 1, NULL, NULL),
(18751, 2, 1, '1066063566', 'MARIA KAROLINA ROPERO RIOS', NULL, NULL, '1998-07-24', NULL, 'roperok4@gmail.com', NULL, '-1178530491', '2016-09-19', 1, NULL, NULL),
(18752, 2, 1, '27731636', 'MARIA LETICIA MALDONADO OCHOA', NULL, NULL, '1954-10-23', '0', 'sicorreo@sincorreo.com', NULL, '-1179361575', '1976-09-17', 1, NULL, NULL),
(18753, 2, 1, '37329946', 'MARIA LUGDY VEGA', NULL, NULL, '1976-03-02', '0', 'lugdyvega@gmail.com', NULL, '-1091035731', '1995-01-19', 1, NULL, NULL),
(18754, 1, 1, '1066062161', 'MARIA LUISA CONTRERAS ANGARITA', NULL, NULL, '2005-10-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1192047986', '2019-01-11', 1, NULL, NULL),
(18755, 2, 1, '1064086000', 'MARIA LUISA RIOS RUEDAS', NULL, NULL, '2003-06-03', NULL, 'ruedasluisa12@gmail.com', NULL, '-1106260505', '2021-07-02', 1, NULL, NULL),
(18756, 2, 1, '26780574', 'MARIA MAGDALENA CASTRO DUARTE', NULL, NULL, '1948-05-27', '0', 'sincorreo@sincorreo.com', NULL, '-1106041625', '1970-01-05', 1, NULL, NULL),
(18757, 2, 1, '37366750', 'MARIA MAGDALENA QUINTERO QUINTERO', NULL, NULL, '1965-03-27', '5610913', 'sincorreo@sincorreo.com', NULL, '-1171058088', '1984-05-24', 1, NULL, NULL),
(18758, 2, 1, '37318729', 'MARIA MAGDALENA RODRIGUEZ PICON', NULL, NULL, '1966-07-22', '0', 'sincorreo@sincorreo.com', NULL, '-1130573140', '1984-12-14', 1, NULL, NULL),
(18759, 2, 1, '37368610', 'MARIA MERCEDES QUINTERO QUINTERO', NULL, NULL, '1967-06-24', '0', 'sincorreo@sincorreo.com', NULL, '-1150928829', '1990-10-19', 1, NULL, NULL),
(18760, 2, 1, '1066063682', 'MARIA NATALIA BOHORQUEZ LOBO', NULL, NULL, '1999-10-14', '0', 'maria.natalia14@hotmail.com', NULL, '-1151039321', '2017-11-02', 1, NULL, NULL),
(18761, 2, 1, '26774663', 'MARIA NELLY BOHORQUEZ DE SANTIAGO', NULL, NULL, '1963-02-12', '0', 'manebosa@hotmail.com', NULL, '-1118765758', '1981-04-21', 1, NULL, NULL),
(18762, 2, 1, '37367827', 'MARIA NEREIDA PEREZ', NULL, NULL, '1969-10-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1170403781', '1988-05-24', 1, NULL, NULL),
(18763, 2, 1, '37327141', 'MARIA NORALVA DUARTE CHINCHILLA', NULL, NULL, '1974-03-07', '0', 'sincorreo@sincorreo.com', NULL, '-1082291177', '1992-10-29', 1, NULL, NULL),
(18764, 2, 1, '26777278', 'MARIA OLIVA MANDON MANDON', NULL, NULL, '1980-01-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1106042140', '1998-02-25', 1, NULL, NULL),
(18765, 2, 1, '26862404', 'MARIA OMAYDA SANTIAGO MORA', NULL, NULL, '1969-09-16', NULL, 'luzamomaira@hotmail.com', NULL, '-1137066939', '1988-09-29', 1, NULL, NULL),
(18766, 2, 1, '27852080', 'MARIA ORFELINA BAYONA MONTAGUT', NULL, NULL, '1961-07-13', '0', 'sincorreo@sincorreo.com', NULL, '-1062009818', '1982-11-22', 1, NULL, NULL),
(18767, 2, 2, '1090508166', 'MARIA PAULA SILVA FLOREZ', NULL, NULL, '1997-08-17', '0', 'mariasilva0817@gmail.com', NULL, '-1065728116', '2015-08-21', 1, NULL, NULL),
(18768, 2, 1, '27770641', 'MARIA SOFIA CONTRERAS DE SALAZAR', NULL, NULL, '1950-09-14', '0', 'sincorreo@sincorreo.com', NULL, '-1112839196', '1976-12-06', 1, NULL, NULL),
(18769, 2, 1, '60415149', 'MARIA SORFELINA RANJEL DURAN', NULL, NULL, '1974-01-20', '0', 'sincorreo@sincorreo.com', NULL, '-1092001448', '1992-07-28', 1, NULL, NULL),
(18770, 2, 1, '27727688', 'MARIA TERESA ACOSTA MELO', NULL, NULL, '1967-05-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1186759850', '1985-10-07', 1, NULL, NULL),
(18771, 2, 1, '26777253', 'MARIA TORCOROMA BARBOSA MORA', NULL, NULL, '1977-11-12', '0', 'barbosamaritat07@gmail.com', NULL, '-1176831593', '1996-05-30', 1, NULL, NULL),
(18772, 2, 1, '51783671', 'MARIA TORCOROMA CHINCHILLA PARDO', NULL, NULL, '1900-12-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1900-12-30', 1, NULL, NULL),
(18773, 2, 1, '1091671564', 'MARIA TORCOROMA CORDOBES MOLINA', NULL, NULL, '1994-01-31', NULL, 'mariacormo@hotmail.com', NULL, '-1116100232', '2012-06-01', 1, NULL, NULL),
(18774, 2, 1, '37330691', 'MARIA TORCOROMA JACOME MOLINA', NULL, NULL, '1977-03-17', '0', 'maria.torcoroma.jacome@outlook.es', NULL, '-1109544264', '1995-06-15', 1, NULL, NULL),
(18775, 2, 1, '1090989245', 'MARIA TORCOROMA MENESES VARGAS', NULL, NULL, '1995-12-17', NULL, 'mariatorcoroma12@gmail.com', NULL, '-1091121950', '2014-02-05', 1, NULL, NULL),
(18776, 2, 1, '37337281', 'MARIA TORCOROMA VEGA CARRASCAL', NULL, NULL, '1980-07-01', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2000-03-06', 1, NULL, NULL),
(18777, 2, 1, '37321837', 'MARIA YAQUELINE DUARTE MANOSALVA', NULL, NULL, '1969-11-18', '0', 'mayaky-1869@hotmail.com', NULL, '-1108142918', '1987-12-14', 1, NULL, NULL),
(18778, 2, 1, '37369398', 'MARIA YASMIN QUINTERO SANTIAGO', NULL, NULL, '1974-11-28', '0', 'sincorreo@sincorreo.com', NULL, '-1086705890', '1993-05-25', 1, NULL, NULL),
(18779, 2, 1, '63551116', 'MARIA YURLEI VEGA PAREDES', NULL, NULL, '1984-03-11', '0', 'yurley1103vega@gmail.com', NULL, '-1128592193', '2002-07-18', 1, NULL, NULL),
(18780, 2, 1, '1066063071', 'MARIANA  BALLESTEROS LOBO', NULL, NULL, '1994-04-02', '0', 'marianaballesteros914@gmail.com', NULL, '-1152036439', '2012-10-22', 1, NULL, NULL),
(18781, 1, 1, '1066062340', 'MARIANA  VEGA MANZANO', NULL, NULL, '2006-12-29', '0', 'marianavegamanzano6@gmail.com', NULL, '-1111966764', '2014-06-27', 1, NULL, NULL),
(18782, 2, 1, '1092730807', 'MARIANA ISABEL CERVANTES LOZANO', NULL, NULL, '2001-08-13', NULL, 'marianacerva1302@gmail.com', NULL, '-1088903639', '2019-10-04', 1, NULL, NULL),
(18783, 2, 1, '1003315170', 'MARIANGEL  QUINTERO OSORIO', NULL, NULL, '2003-10-22', '5880084', 'mariagelqo22@gmail.com', NULL, '-1150462201', '2021-11-04', 1, NULL, NULL),
(18784, 2, 1, '1091664284', 'MARIANO  GALVIS ECHAVES', NULL, NULL, '1990-06-28', '0', 'marianogalvisechaves@gmail.com', NULL, '-1151744547', '2008-08-12', 1, NULL, NULL),
(18785, 2, 1, '37170846', 'MARIBEL  BELTRAN SANCHEZ', NULL, NULL, '1980-05-17', '0', 'sincorreo@sincorreo.com', NULL, '-1070375090', '2000-07-24', 1, NULL, NULL),
(18786, 2, 1, '1003257480', 'MARIBEL  CARRILLO DUARTE', NULL, NULL, '2003-02-15', '0', 'maribelcarrilloduarte@gmail.com', NULL, '-1090382054', '2021-03-01', 1, NULL, NULL),
(18787, 2, 2, '1091182058', 'MARIBEL  PATI?O CORREDOR', NULL, NULL, '1986-04-11', '0', 'sincorreo@sincorreo.com', NULL, '-1086039040', '2004-05-27', 1, NULL, NULL),
(18788, 1, 1, '1091653819', 'MARIBELLA  PARADA SERRANO', NULL, NULL, '2004-05-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1186692959', '2017-12-06', 1, NULL, NULL),
(18789, 2, 1, '49776131', 'MARIBETH  ROJAS OSORIO', NULL, NULL, '1974-08-13', '0', 'mariros2513@hotmail.com', NULL, '-1141550432', '1993-11-18', 1, NULL, NULL),
(18790, 2, 1, '37180215', 'MARICELA  ASCANIO', NULL, NULL, '1983-06-12', NULL, 'maricelaascanio99@gmail.com', NULL, '-1072230948', '2001-10-17', 1, NULL, NULL),
(18791, 2, 1, '26777445', 'MARICELA  MENDOZA SANTIAGO', NULL, NULL, '1984-07-03', '0', 'maricelamendozasantiago1984@gmail.com', NULL, '-1121257721', '2002-09-10', 1, NULL, NULL),
(18792, 2, 1, '1090985297', 'MARICELA  PEÃ‘ARANDA GARNICA', NULL, NULL, '1989-02-09', '5955516', 'marypg09@hotmail.es', NULL, '-1160731627', '2008-01-08', 1, NULL, NULL),
(18793, 2, 1, '37345332', 'MARICELA  SANCHEZ PE?ARANDA', NULL, NULL, '1979-07-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1077262458', '1998-04-06', 1, NULL, NULL),
(18794, 2, 1, '26774884', 'MARIELA  ANGARITA DUARTE', NULL, NULL, '1969-04-12', '0', 'sincorreo@sincorreo.com', NULL, '-1091643290', '1989-02-24', 1, NULL, NULL),
(18795, 2, 1, '60416096', 'MARIELA  GOMEZ NAVARRO', NULL, NULL, '1975-04-07', '0', 'sincorreo@sincorreo.com', NULL, '-1171535372', '1996-05-13', 1, NULL, NULL),
(18796, 2, 1, '26777189', 'MARIELA  GUTIERREZ DUARTE', NULL, NULL, '1975-03-10', '0', 'sincorreo@sincorreo.com', NULL, '-1176698889', '1996-07-05', 1, NULL, NULL),
(18797, 2, 1, '36496609', 'MARIELA  NAVARRO BACCA', NULL, NULL, '1980-02-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1180587834', '2001-04-23', 1, NULL, NULL),
(18798, 2, 1, '37365251', 'MARIELA  REYES BOTELLO', NULL, NULL, '1959-04-19', '0', 'sincorreo@sincorreo.com', NULL, '-1072042416', '1977-12-22', 1, NULL, NULL),
(18799, 2, 1, '1091653887', 'MARIELCY  GALVIZ MANOSALVA', NULL, NULL, '1986-08-05', NULL, 'galvismarielcy@gmail.com', NULL, '-1082282473', '2004-08-18', 1, NULL, NULL),
(18800, 2, 1, '27741157', 'MARILCE  CARRASCAL NAVARRO', NULL, NULL, '1961-05-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1138085335', '1985-02-27', 1, NULL, NULL),
(18801, 2, 1, '60415379', 'MARILSE  RANGEL DURAN', NULL, NULL, '1974-12-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1151051951', '1993-06-22', 1, NULL, NULL),
(18802, 2, 1, '26777207', 'MARINA  CARDENAS CA?IZARES', NULL, NULL, '1973-09-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1170397831', '1997-01-23', 1, NULL, NULL),
(18803, 2, 1, '26780595', 'MARINA  CASTRO DUARTE', NULL, NULL, '1958-03-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1110374545', '1979-02-27', 1, NULL, NULL),
(18804, 2, 1, '26777255', 'MARINA  LOBO PEREZ', NULL, NULL, '1975-04-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1085489694', '1997-05-30', 1, NULL, NULL),
(18805, 2, 1, '37366513', 'MARINA  MARTINEZ SANTIAGO', NULL, NULL, '1962-07-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1192562447', '1983-03-15', 1, NULL, NULL),
(18806, 2, 1, '26774609', 'MARINA  MOLINA DE TRILLOS', NULL, NULL, '1954-01-09', '0', 'sincorreo@sincorreo.com', NULL, '-1077271285', '1977-12-22', 1, NULL, NULL),
(18807, 2, 1, '26774543', 'MARINA  NAVARRO BOHORQUEZ', NULL, NULL, '1956-10-07', '0', 'manabo2010@hotmail.com', NULL, '-1129639170', '1976-01-17', 1, NULL, NULL),
(18808, 2, 1, '37326812', 'MARINA  PLATA ARCINIEGAS', NULL, NULL, '1966-06-10', '0', 'sincorreo@sincorreo.com', NULL, '-1112200911', '1992-07-09', 1, NULL, NULL),
(18809, 2, 1, '26774626', 'MARINA  SANCHEZ DE PORTILLO', NULL, NULL, '1960-01-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1072271230', '1979-11-29', 1, NULL, NULL),
(18810, 2, 1, '23156855', 'MARINA  TORRADO DE GOMEZ', NULL, NULL, '1955-05-07', '-1151761141', 'sincorreo@sincorreo.com', NULL, NULL, '1977-07-26', 1, NULL, NULL),
(18811, 2, 1, '26774843', 'MARINA  VANEGAS PEREA', NULL, NULL, '1967-01-22', '0', 'sincorreo@sincorreo.com', NULL, '-1170697071', '1987-11-06', 1, NULL, NULL),
(18812, 2, 1, '88284300', 'MARIO  AMAYA AMAYA', NULL, NULL, '1978-05-22', '0', 'sincorreo@sincorreo.com', NULL, '-1168088870', '1996-07-02', 1, NULL, NULL),
(18813, 2, 1, '1091660532', 'MARIO  PRADO GUERRERO', NULL, NULL, '1988-08-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1151525931', '2007-02-21', 1, NULL, NULL),
(18814, 2, 1, '5035007', 'MARIO  RIVERA SANTIAGO', NULL, NULL, '1957-10-14', '0', 'sincorreo@sincorreo.com', NULL, '-1156637249', '1976-04-28', 1, NULL, NULL),
(18815, 2, 1, '1066062207', 'MARIO ALFONSO RIVERA SANTIAGO', NULL, NULL, '1987-09-12', NULL, 'manejoambiental123@hotmail.com', NULL, '-1112923236', '2006-02-27', 1, NULL, NULL),
(18816, 2, 1, '1066062328', 'MARISELA  LOZANO GUTIERREZ', NULL, NULL, '1988-12-24', NULL, 'mariloza88@hotmail.com', NULL, '-1086672525', '2007-01-09', 1, NULL, NULL),
(18817, 1, 1, '1064086029', 'MARISOL  PINZON QUINTERO', NULL, NULL, '2004-04-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1072769713', '2020-01-14', 1, NULL, NULL),
(18818, 2, 1, '26863104', 'MARITHZA  MANOSALVA PORTILLO', NULL, NULL, '1977-08-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1072253506', '1996-04-30', 1, NULL, NULL),
(18819, 2, 1, '37316458', 'MARITZA  ASCANIO DE LAZARO', NULL, NULL, '1960-06-07', NULL, 'maritzadelazaro@hotmail.com', NULL, '-1132588365', '1982-11-22', 1, NULL, NULL),
(18820, 2, 1, '26774967', 'MARITZA  GALVIZ DUARTE', NULL, NULL, '1971-02-04', '0', 'sincorreo@sincorreo.com', NULL, '-1179335192', '1991-08-13', 1, NULL, NULL),
(18821, 2, 1, '33213855', 'MARITZA  MOLINA CARABALLO', NULL, NULL, '1964-01-10', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1982-12-28', 1, NULL, NULL),
(18822, 2, 1, '1090983003', 'MARITZA  VARGAS SERRANO', NULL, NULL, '1986-03-18', '0', 'sincorreo@sincorreo.com', NULL, '-1192470838', '2004-11-22', 1, NULL, NULL),
(18823, 2, 1, '1127044447', 'MARITZA YAMILE CORREA GOMEZ', NULL, NULL, '1983-10-30', NULL, 'zayami@hotmail.com', NULL, '-1128939324', '2005-05-10', 1, NULL, NULL),
(18824, 1, 1, '1064086121', 'MARLEN TATIANA MANDON RIVERA', NULL, NULL, '2005-02-25', NULL, 'marlentatiana2501@hotmail.com', NULL, '-1088720979', '2018-06-06', 1, NULL, NULL),
(18825, 2, 1, '1066063310', 'MARLEN YULIETH DURAN ESPINEL', NULL, NULL, '1996-08-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1062681703', '2014-10-15', 1, NULL, NULL),
(18826, 2, 1, '26774923', 'MARLENE  BALLESTEROS SANTIAGO', NULL, NULL, '1968-07-18', '0', 'sincorreo@sincorreo.com', NULL, '-1137421954', '1989-12-11', 1, NULL, NULL),
(18827, 2, 1, '1005018455', 'MARLENE  RAMIREZ RIVERA', NULL, NULL, '1999-10-15', '0', 'ramirezmarlene78@yahoo.com', NULL, '-1171132818', '2017-10-24', 1, NULL, NULL),
(18828, 2, 1, '37319954', 'MARLENE  SANTANA RIOS', NULL, NULL, '1967-06-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1092610168', '1985-12-09', 1, NULL, NULL),
(18829, 2, 1, '26779730', 'MARLENE DE JESUS MOLINA RINCON', NULL, NULL, '1949-11-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1086691799', '1975-09-08', 1, NULL, NULL),
(18830, 2, 1, '26774795', 'MARLENY  JACOME MORA', NULL, NULL, '1966-08-22', '0', 'marlenyjacome_22@hotmail.com', NULL, '-1149276313', '1985-08-06', 1, NULL, NULL),
(18831, 2, 1, '1003257802', 'MARLON ANTONIO RINCON BELTRAN', NULL, NULL, '2000-04-28', NULL, 'marlonrincon2154@gmail.com', NULL, '-1085086604', '2018-05-03', 1, NULL, NULL),
(18832, 2, 1, '1193544560', 'MARLON FABIAN BOHORQUEZ CARVAJALINO', NULL, NULL, '2000-08-20', '0', 'marlonfabianbohorquez@gmail.com', NULL, '-1187818827', '2018-10-23', 1, NULL, NULL),
(18833, 2, 1, '1003257804', 'MARLON FABIAN RUEDAS BAYONA', NULL, NULL, '1999-04-23', '0', 'marlonrueda04@gmail.com', NULL, '-1062741328', '2017-07-25', 1, NULL, NULL),
(18834, 1, 1, '1066062916', 'MARLON GREGORIO DE ISNOTU MENDOZA ANGARITA', NULL, NULL, '1999-09-13', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2014-11-20', 1, NULL, NULL),
(18835, 2, 1, '1066063061', 'MARLON JOSE QUINTERO GARCIA', NULL, NULL, '1994-09-25', NULL, 'marlonquintero22@gmail.com', NULL, '-1112617866', '2012-10-03', 1, NULL, NULL),
(18836, 1, 1, '1064086119', 'MARLON SEBASTIAN SUAREZ MOLINA', NULL, NULL, '2005-02-27', '0', 'suarezmolinamarlonsebastian@gmail.com', NULL, '-1112296102', '2019-03-11', 1, NULL, NULL),
(18837, 2, 1, '1003257458', 'MARLY YESNITH LOZANO ECHAVEZ', NULL, NULL, '2001-07-19', '0', 'marlylozano19@gmail.com', NULL, '-1070314751', '2019-08-02', 1, NULL, NULL),
(18838, 2, 1, '26774833', 'MARTA  GUTIERREZ PALLAREZ', NULL, NULL, '1964-04-18', '0', 'sincorreo@sincorreo.com', NULL, '-1179025878', '1987-09-02', 1, NULL, NULL),
(18839, 2, 1, '37391002', 'MARTA CECILIA DELGADO CLARO', NULL, NULL, '1982-01-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1092948481', '2002-04-01', 1, NULL, NULL),
(18840, 2, 1, '1066062236', 'MARTA LILIANA MANOSALVA DUARTE', NULL, NULL, '1987-04-26', '0', 'liliamandu@hotmail.com', NULL, '-1182686558', '2007-02-08', 1, NULL, NULL),
(18841, 2, 1, '26775076', 'MARTA LUCIA TORO QUINTERO', NULL, NULL, '1976-10-27', NULL, 'martaluciatoroquintero@gmail.com', NULL, '-1090141046', '1994-12-08', 1, NULL, NULL),
(18842, 2, 1, '49747035', 'MARTHA CECILIA GALVIS GARCIA', NULL, NULL, '1969-09-30', '0', 'sincorreo@sincorreo.com', NULL, '-1075467868', '1990-12-19', 1, NULL, NULL),
(18843, 2, 1, '26777420', 'MARTHA CECILIA LOZANO NORIEGA', NULL, NULL, '1983-05-08', NULL, 'marthalozanori@gmail.com', NULL, '-1161060748', '2002-04-05', 1, NULL, NULL),
(18844, 2, 1, '26863986', 'MARTHA CECILIA TRILLOS TRILLOS', NULL, NULL, '1983-08-20', '0', 'sincorreo@sincorreo.com', NULL, '-1090578851', '2002-10-17', 1, NULL, NULL),
(18845, 2, 1, '1020752276', 'MARTHA LILIANA GARCIA OSORIO', NULL, NULL, '1990-03-17', NULL, 'maligaos@hotmail.com', NULL, '-1161038072', '2008-05-19', 1, NULL, NULL),
(18846, 2, 1, '1066062899', 'MARTHA LORENA AMAYA MOLINA', NULL, NULL, '1993-09-05', '0', 'mlamayam@ufpso.edu.co', NULL, '-1187878875', '2011-09-22', 1, NULL, NULL),
(18847, 2, 1, '26777312', 'MARTHA LUCIA RINCON PAREDES', NULL, NULL, '1980-12-12', '0', 'rubenandrey0497@gmail.com', NULL, '-1111045960', '1999-03-25', 1, NULL, NULL),
(18848, 2, 1, '37371139', 'MARTHA MILENA GARCIA DELGADO', NULL, NULL, '1981-02-12', '0', 'sincorreo@sincorreo.com', NULL, '-1187824359', '1999-03-09', 1, NULL, NULL),
(18849, 2, 1, '1065124120', 'MARTHA MILENA QUINTERO MENDOZA', NULL, NULL, '1986-11-27', '0', 'marthamilenaquintero@gmail.com', NULL, '-1066001408', '2005-02-14', 1, NULL, NULL),
(18850, 2, 1, '1091664474', 'MARTHA PATRICIA PEREZ ORTIZ', NULL, NULL, '1990-08-11', NULL, 'perezortizm722@gmail.com', NULL, '-1272527036', '2008-09-18', 1, NULL, NULL),
(18851, 2, 1, '49736349', 'MARTHA PATRICIA ROSADO MESTRE', NULL, NULL, '1966-03-22', NULL, 'marthip@hotmail.com', NULL, '-1130236256', '1984-06-07', 1, NULL, NULL),
(18852, 2, 1, '88150362', 'MARTIN  CASTILLA CASTILLA', NULL, NULL, '1973-11-11', '0', 'sincorreo@sincorreo.com', NULL, '-1160914420', '1992-07-17', 1, NULL, NULL),
(18853, 2, 1, '1090988324', 'MARTIN  SUTA GARCIA', NULL, NULL, '1994-04-28', NULL, 'martinsutagarcia@gmail.com', NULL, '-1122787886', '2012-05-23', 1, NULL, NULL),
(18854, 2, 1, '1004819439', 'MARTIN FERNANDO CHINCHILLA RODRIGUEZ', NULL, NULL, '2003-12-02', '0', 'martinfernandochinchila@gmail.com', NULL, '-1137509303', '2017-12-07', 1, NULL, NULL),
(18855, 2, 1, '1066063217', 'MARTIN FERNANDO MANDON QUINTERO', NULL, NULL, '1995-11-15', NULL, 'danilomandonado@gmail.com', NULL, '-1148536836', '2013-12-12', 1, NULL, NULL),
(18856, 2, 1, '26774815', 'MARTINA DEL CARMEN BOHORQUEZ MANOSALVA', NULL, NULL, '1965-12-22', '0', 'sincorreo@sincorreo.com', NULL, '-1157637169', '1985-12-09', 1, NULL, NULL),
(18857, 2, 1, '26777124', 'MARY  FELIZZOLA', NULL, NULL, '1942-12-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1086642934', '1966-10-21', 1, NULL, NULL),
(18858, 2, 1, '37838496', 'MARY CECILIA MENESES MENESES', NULL, NULL, '1959-02-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1190203001', '1977-05-23', 1, NULL, NULL),
(18859, 2, 1, '42499708', 'MARY DEL CARMEN ANGARITA MENDOZA', NULL, NULL, '1958-01-12', '0', 'marydelcarmenangaritamendoza@gmail.com', NULL, '-1131374568', '1980-07-29', 1, NULL, NULL),
(18860, 2, 1, '37334877', 'MARY JUDITH ORTIZ BOHORQUEZ', NULL, NULL, '1980-05-28', '0', 'maryjudith1980@gmail.com', NULL, '-1137992139', '1998-07-13', 1, NULL, NULL),
(18861, 2, 1, '37181076', 'MARY LUZ GAONA LOPEZ', NULL, NULL, '1984-04-27', '0', 'ingemary@hotmail.es', NULL, '-1107833666', '2002-05-03', 1, NULL, NULL),
(18862, 2, 1, '37338789', 'MARY NELDA ORTIZ GUERRERO', NULL, NULL, '1982-12-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1192642965', '2001-01-11', 1, NULL, NULL),
(18863, 2, 1, '26774248', 'MARY STELLA LOZANO DE LEBOLO', NULL, NULL, '1940-07-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1121147843', '1961-12-18', 1, NULL, NULL),
(18864, 2, 1, '1095809469', 'MARYID LORENA QUINTERO PRADA', NULL, NULL, '1991-07-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1179872360', '2009-08-05', 1, NULL, NULL),
(18865, 2, 1, '37181938', 'MARYULY TORCOROMA CASTRO SUAREZ', NULL, NULL, '1984-08-17', '0', 'sincorreo@sincorreo.com', NULL, '-1160355423', '2002-12-12', 1, NULL, NULL),
(18866, 2, 1, '37339772', 'MARYURI  MOLINA GAONA', NULL, NULL, '1983-07-06', '0', 'molinamaryury834@gmail.com', NULL, '-1150255884', '2001-07-23', 1, NULL, NULL),
(18867, 2, 1, '1003257519', 'MARYURY  PRADA TORRADO', NULL, NULL, '2001-11-02', '0', 'pradatorradom@gmail.com', NULL, '-1086685782', '2019-11-08', 1, NULL, NULL),
(18868, 2, 1, '1004966587', 'MARYURY MILENA PINEDA TORREZ', NULL, NULL, '2000-10-16', '0', 'marmilep16@hotmail.com', NULL, '-1142162998', '2018-11-02', 1, NULL, NULL),
(18869, 2, 1, '26774893', 'MATILDE  PAREDES SOTO', NULL, NULL, '1964-01-26', NULL, 'sincorreo@sincorreo.com', NULL, '-787106430', '1989-05-04', 1, NULL, NULL),
(18870, 2, 1, '1193577906', 'MAURICIO  HERRERA BARBOSA', NULL, NULL, '1998-07-16', '0', 'herreramauricio192@gmail.com', NULL, '-1188422119', '2016-08-26', 1, NULL, NULL),
(18871, 2, 1, '1004817804', 'MAXIMILIANO  CHONA PALLARES', NULL, NULL, '1985-03-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1077436617', '2004-06-24', 1, NULL, NULL),
(18872, 2, 1, '26777307', 'MAYDA ROSA RODRIGUEZ', NULL, NULL, '1980-07-10', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1999-02-23', 1, NULL, NULL),
(18873, 2, 1, '26777399', 'MAYERLI  CAÃ‘IZARES CASTRO', NULL, NULL, '1983-03-09', '0', 'mayeccastro11@outlook.es', NULL, '-1128714710', '2001-11-02', 1, NULL, NULL),
(18874, 2, 1, '1066062838', 'MAYERLI  RINCON BELTRAN', NULL, NULL, '1993-01-22', '0', 'mayerlirinconbeltran@gmail.com', NULL, '-1237682147', '2011-03-28', 1, NULL, NULL),
(18875, 2, 1, '26777418', 'MAYERLI SULAY BARBOSA MANOSALVA', NULL, NULL, '1984-03-18', '0', 'mallerlizulay@hotmail.com', NULL, '-1062670695', '2002-04-04', 1, NULL, NULL),
(18876, 2, 1, '1003257524', 'MAYERLY  DUARTE GALVIZ', NULL, NULL, '2001-08-20', NULL, 'mayerlyduarte761@gmail.com', NULL, '-1189747784', '2019-09-06', 1, NULL, NULL),
(18877, 2, 1, '1066062908', 'MAYERLY  DUARTE PINEDA', NULL, NULL, '1993-09-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1066387551', '2011-11-08', 1, NULL, NULL),
(18878, 2, 2, '1091858018', 'MAYERLY  MORA MORA', NULL, NULL, '1990-09-13', '0', 'mayerlymora69@gmail.com', NULL, '-1182480773', '2009-02-12', 1, NULL, NULL),
(18879, 2, 1, '1090989861', 'MAYERLY  PABA CONDE', NULL, NULL, '1997-03-23', NULL, 'mayerlypaba2017@outlook.com', NULL, '-1168741814', '2015-03-24', 1, NULL, NULL),
(18880, 2, 1, '28215781', 'MAYERLY  RODRIGUEZ RUEDA', NULL, NULL, '1984-02-24', '0', 'sincorreo@sincorreo.com', NULL, '-1067756917', '2002-05-08', 1, NULL, NULL),
(18881, 2, 1, '1091653295', 'MAYERLY  SANJUAN SANJUAN', NULL, NULL, '1986-03-30', '0', 'sincorreo@sincorreo.com', NULL, '-1182865926', '2004-05-14', 1, NULL, NULL),
(18882, 2, 1, '1066063384', 'MAYERLY  SANTIAGO SANTIAGO', NULL, NULL, '1997-04-02', NULL, 'mayesanti@gmail.com', NULL, '-1077898450', '2015-04-14', 1, NULL, NULL),
(18883, 2, 1, '37336952', 'MAYERLY  TORRES SANCHEZ', NULL, NULL, '1982-02-01', '0', 'nayelyarevalo11@gmail.com', NULL, '-1137985441', '2000-02-03', 1, NULL, NULL),
(18884, 1, 1, '1064086108', 'MAYLIN PATRICIA DUARTE GAIVIZ', NULL, NULL, '2004-12-21', '0', 'duartemailin2115@gmail.com', NULL, '-1152610541', '2021-09-07', 1, NULL, NULL),
(18885, 2, 1, '37181320', 'MAYLING TORCOROMA CONDE', NULL, NULL, '1984-05-19', NULL, 'ingenieraconde@gmail.com', NULL, '-1107880663', '2002-08-16', 1, NULL, NULL),
(18886, 2, 1, '1066062078', 'MAYRA ALEJANDRA MANZANO NAVARRO', NULL, NULL, '1987-03-13', '0', 'mmanzanonavarro@gmail.com', NULL, '-1180369350', '2005-03-14', 1, NULL, NULL),
(18887, 2, 1, '37336858', 'MAYRA LILIANA DUARTE SANCHEZ', NULL, NULL, '1982-01-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1182623345', '2000-01-24', 1, NULL, NULL),
(18888, 2, 1, '1090419622', 'MAYREDEZ  PORTILLO GALVIZ', NULL, NULL, '1990-03-23', '0', 'mportillog@hotmail.com', NULL, '-1082134699', '2008-06-23', 1, NULL, NULL),
(18889, 2, 1, '26774945', 'MELFY DEL CARMEN ORTIZ ANGARITA', NULL, NULL, '1972-07-28', '0', 'melfydelcarmenortizangarita@gmail.com', NULL, '-1072597971', '1991-03-14', 1, NULL, NULL),
(18890, 2, 1, '1004941648', 'MELIDA  CAMARON GOMEZ', NULL, NULL, '1993-04-28', NULL, 'melidacamaron2020@gmail.com', NULL, '-1082335573', '2011-05-24', 1, NULL, NULL),
(18891, 2, 1, '1064839719', 'MELISA ANDREA GUERRERO GUERRERO', NULL, NULL, '1993-03-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1167828440', '2011-06-08', 1, NULL, NULL),
(18892, 2, 1, '26774385', 'MERCEDES  GARCIA MADARIAGA', NULL, NULL, '1947-03-30', '0', 'sincorreo@sincorreo.com', NULL, '-1110833769', '1969-03-26', 1, NULL, NULL),
(18893, 2, 1, '26774544', 'MERCEDES  JACOME BOHORQUEZ', NULL, NULL, '1955-11-25', '0', 'sincorreo@sincorreo.com', NULL, '-1121603102', '1976-01-17', 1, NULL, NULL),
(18894, 1, 1, '1041693721', 'MICHAEL KALETH POLO RUEDA', NULL, NULL, '2005-12-05', '0', 'kalethpolo24@gmail.com', NULL, '-1129603679', '2017-11-17', 1, NULL, NULL),
(18895, 2, 1, '1733855', 'MIGUEL  MOLINA MANOSALVA', NULL, NULL, '1943-10-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1090869004', '1965-07-21', 1, NULL, NULL),
(18896, 1, 1, '1458276356', 'MIGUEL  TRIGOS PAEZ', NULL, NULL, '1983-06-23', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1900-12-30', 1, NULL, NULL),
(18897, 2, 1, '1065581288', 'MIGUEL ALVEIRO PORTILLO BOHORQUEZ', NULL, NULL, '1987-02-11', '0', 'miguportillo252@gmail.com', NULL, '-1152500973', '2005-03-18', 1, NULL, NULL),
(18898, 2, 1, '13363059', 'MIGUEL ANGEL BARBOSA QUINTERO', NULL, NULL, '1958-04-20', '0', 'sincorreo@sincorreo.com', NULL, '-1132692259', '1978-09-11', 1, NULL, NULL),
(18899, 2, 1, '18919984', 'MIGUEL ANGEL BAYONA RAMIREZ', NULL, NULL, '1965-09-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1191710319', '1985-02-17', 1, NULL, NULL),
(18900, 2, 1, '1066062885', 'MIGUEL ANGEL BAYONA RINCON', NULL, NULL, '1993-08-25', NULL, 'miguelangel.2593@hotmail.es', NULL, '-1090768110', '2011-08-26', 1, NULL, NULL),
(18901, 2, 1, '1733522', 'MIGUEL ANGEL CHINCHILLA BAYONA', NULL, NULL, '1931-08-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1138724615', '1956-05-24', 1, NULL, NULL),
(18902, 2, 1, '18939012', 'MIGUEL ANGEL CONDE MENESES', NULL, NULL, '1962-01-06', '0', 'sincorreo@sincorreo.com', NULL, '-1170467966', '1981-08-12', 1, NULL, NULL),
(18903, 2, 1, '88284904', 'MIGUEL ANGEL DELGADO BOHORQUEZ', NULL, NULL, '1978-09-19', '0', 'madb1129@hotmail.com', NULL, '-1129641134', '1997-01-27', 1, NULL, NULL),
(18904, 2, 1, '1091660630', 'MIGUEL ANGEL GALVIS GARCIA', NULL, NULL, '1988-06-03', '0', 'migue0388@hotmail.com', NULL, '-1178511578', '2007-03-06', 1, NULL, NULL),
(18905, 2, 1, '1007447397', 'MIGUEL ANGEL NAVARRO MOLINA', NULL, NULL, '2001-03-03', NULL, 'moguelife171@gmail.com', NULL, '-1138216141', '2019-03-07', 1, NULL, NULL),
(18906, 2, 1, '18914127', 'MIGUEL ANGEL RINCON SANTIAGO', NULL, NULL, '1957-07-03', '0', 'sincorreo@gmail.com', NULL, '-1170192183', '1977-03-07', 1, NULL, NULL),
(18907, 2, 1, '5427259', 'MIGUEL ANGEL ROPERO ARIAS', NULL, NULL, '1982-09-11', '0', 'sincorreo@sincorreo.com', NULL, '-1072852496', '2001-04-02', 1, NULL, NULL),
(18908, 2, 1, '88138036', 'MIGUEL ANGEL SANTIAGO SOLANO', NULL, NULL, '1964-11-22', '0', 'sincorreo@sincorreo.com', NULL, '-1121728033', '1983-02-08', 1, NULL, NULL),
(18909, 2, 1, '1091658606', 'MIGUEL ANTONIO CARRASCAL PEDROZA', NULL, NULL, '1988-04-29', '0', 'sincorreo@sincorreo.com', NULL, '-1082106612', '2006-05-12', 1, NULL, NULL),
(18910, 2, 1, '1733731', 'MIGUEL ANTONIO DUARTE', NULL, NULL, '1938-09-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1129812080', '1960-09-19', 1, NULL, NULL),
(18911, 2, 1, '1734023', 'MIGUEL ANTONIO GALVIS PACHECO', NULL, NULL, '1952-01-02', '0', 'sincorreo@sincorreo.com', NULL, '-1191058540', '1974-01-21', 1, NULL, NULL),
(18912, 2, 1, '5035066', 'MIGUEL ANTONIO NAVARRO BACCA', NULL, NULL, '1958-02-08', '0', 'sincorreo@sincorreo.com', NULL, '-1086621580', '1977-10-21', 1, NULL, NULL),
(18913, 2, 1, '13370597', 'MIGUEL ANTONIO RINCON GARCIA', NULL, NULL, '1950-06-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1086489164', '1973-09-18', 1, NULL, NULL),
(18914, 2, 1, '10779504', 'MIGUEL GIOVANNI DIAZ LARA', NULL, NULL, '1982-07-13', '0', 'silvimolqui11@hotmail.com', NULL, '-1081515358', '2002-05-08', 1, NULL, NULL),
(18915, 2, 1, '5471336', 'MIGUEL RICARDO LOBO DUARTE', NULL, NULL, '1982-06-27', '5611702', 'miguelricardo174@hotmail.com', NULL, '-1080293378', '2000-08-03', 1, NULL, NULL),
(18916, 2, 1, '36503889', 'MILADIS  DAZA QUINTERO', NULL, NULL, '1985-05-16', '0', 'miladisdaza98@gmail.com', NULL, '-1191312402', '2003-08-28', 1, NULL, NULL),
(18917, 2, 1, '1091657911', 'MILAIDA PAOLA BARBOSA MOLINA', NULL, NULL, '1987-10-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1138388150', '2005-12-25', 1, NULL, NULL),
(18918, 2, 1, '26774924', 'MILCE MARIA CHINCHILLA ARO', NULL, NULL, '1961-09-26', '0', 'sincorreo@sincorreo.com', NULL, '-1170636026', '1990-08-02', 1, NULL, NULL),
(18919, 2, 1, '37329687', 'MILDALIA  AREVALO BARRERA', NULL, NULL, '1973-10-22', NULL, 'mildalia.3@hotmail.com', NULL, '-1169994813', '1994-09-14', 1, NULL, NULL),
(18920, 2, 1, '26774847', 'MILDRED  BARBOSA OREJUELA', NULL, NULL, '1969-05-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1188933199', '1987-11-06', 1, NULL, NULL),
(18921, 2, 1, '1066063611', 'MILDRED  CARRASCAL ACOSTA', NULL, NULL, '1999-02-06', '0', 'mildredcarrascsl@gmail.com', NULL, '-1181110262', '2017-03-10', 1, NULL, NULL),
(18922, 2, 1, '42497329', 'MILDRED  QUINTERO ANGARITA', NULL, NULL, '1956-04-12', '0', 'sincorreo@sincorreo.com', NULL, '-1132047649', '1979-05-16', 1, NULL, NULL),
(18923, 2, 1, '88276664', 'MILED  CARRASCAL QUINTERO', NULL, NULL, '1969-09-16', '0', 'sincorreo@sincorreo.com', NULL, '-1179545619', '1989-11-09', 1, NULL, NULL),
(18924, 2, 1, '1090983229', 'MILEIDA  RODRIGUEZ GUTIERREZ', NULL, NULL, '1986-08-07', '0', 'sincorreo@sincorreo.com', NULL, '-1081307846', '2005-02-17', 1, NULL, NULL),
(18925, 2, 1, '37371399', 'MILEIDA  VERA CHINCHILLA', NULL, NULL, '1981-12-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1066800083', '2000-01-27', 1, NULL, NULL),
(18926, 2, 1, '1091655327', 'MILEIDE  AREVALO FRANCO', NULL, NULL, '1985-07-21', '0', 'mileidyarevalo73@gmail.com', NULL, '-1187168855', '2005-02-04', 1, NULL, NULL),
(18927, 2, 1, '1066063706', 'MILEIDIS  MADARRIAGA QUINTERO', NULL, NULL, '1999-07-02', '0', 'sincorreo@sincorreo.com', NULL, '-1070223870', '2018-01-09', 1, NULL, NULL),
(18928, 2, 1, '26777337', 'MILEIXA  RUEDAS CARRASCAL', NULL, NULL, '1981-04-15', '0', 'sincorreo@sincorreo.com', NULL, '-1168452745', '2000-04-10', 1, NULL, NULL),
(18929, 2, 1, '1092353064', 'MILENA  QUINTERO AMAYA', NULL, NULL, '1992-09-05', NULL, 'milenaquinteroamaya@hotmail.com', NULL, '-1171978117', '2011-05-12', 1, NULL, NULL),
(18930, 2, 1, '37334285', 'MIRELLA  SANTANA VEGA', NULL, NULL, '1968-07-07', '0', 'sincorreo@sincorreo.com', NULL, '-1066388952', '1998-01-30', 1, NULL, NULL),
(18931, 2, 1, '37368847', 'MIREYA  FRANCO MARTINEZ', NULL, NULL, '1964-03-17', '0', 'sincorreo@sincorreo.com', NULL, '-1161298119', '1991-07-11', 1, NULL, NULL),
(18932, 2, 1, '37321311', 'MIREYA  MOLINA MORA', NULL, NULL, '1968-11-26', '0', 'sincorreo@sincorreo.com', NULL, '-1071096864', '1987-07-16', 1, NULL, NULL),
(18933, 2, 1, '49640013', 'MIRIA ROSA GUTIERREZ QUINTERO', NULL, NULL, '1957-12-19', '0', 'sincorreo@sincorreo.com', NULL, '-1086672525', '1977-07-12', 1, NULL, NULL),
(18934, 2, 1, '26777264', 'MIRIAM  DURAN PEREZ', NULL, NULL, '1977-02-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1159565634', '1997-09-26', 1, NULL, NULL),
(18935, 2, 1, '26774607', 'MIRIAM  JACOME BOHORQUEZ', NULL, NULL, '1957-09-18', '5890282', 'miyitalinda@hotmail.com', NULL, '-1141804084', '1977-12-22', 1, NULL, NULL),
(18936, 2, 1, '37312745', 'MIRIAM  SANTIAGO CASTRO', NULL, NULL, '1960-10-13', '0', 'sincorreo@sincorreo.com', NULL, '-1160961971', '1979-03-12', 1, NULL, NULL),
(18937, 2, 1, '26863930', 'MIRIAM  SOLANO ANGARITA', NULL, NULL, '1981-11-08', '0', 'sincorreo@sincorreo.com', NULL, '-1062506561', '2002-05-08', 1, NULL, NULL),
(18938, 2, 1, '26777247', 'MIRIAM DAYANA CARRILLO PICON', NULL, NULL, '1978-11-19', '0', 'carrillopiconm@gmail.com', NULL, '-1122480144', '1997-05-30', 1, NULL, NULL),
(18939, 2, 1, '37323587', 'MIRIAM DEL CARMEN DUARTE QUINTERO', NULL, NULL, '1969-12-17', '0', 'sincorreo@sincorreo.com', NULL, '-1160514178', '1989-08-31', 1, NULL, NULL),
(18940, 2, 1, '37316560', 'MIRIAM ESTER ALVAREZ MENESES', NULL, NULL, '1961-03-25', '0', 'sincorreo@sincorreo.com', NULL, '-1162730313', '1982-11-30', 1, NULL, NULL),
(18941, 2, 1, '26774868', 'MIRIAM ROSA DUARTE CHINCHILLA', NULL, NULL, '1969-08-01', '-1066099854', 'sincorreo@sincorreo.com', NULL, NULL, '1988-09-09', 1, NULL, NULL),
(18942, 2, 1, '37322819', 'MIRIAM ROSA LEON LEON', NULL, NULL, '1967-08-05', '0', 'sincorreo@sincorreo.com', NULL, '-1182835313', '1988-12-21', 1, NULL, NULL),
(18943, 2, 1, '26777272', 'MIRIAN  JACOME PEREZ', NULL, NULL, '1975-07-19', '0', 'sincorreo@sincorreo.com', NULL, '-1149321126', '1997-12-26', 1, NULL, NULL),
(18944, 2, 1, '26774860', 'MIRYAM  ANGARITA BOHORQUEZ', NULL, NULL, '1965-08-14', NULL, 'myranga@hotmail.com', NULL, '-1166947224', '1988-04-25', 1, NULL, NULL),
(18945, 2, 1, '26777186', 'MIRYAM  ANGARITA DUARTE', NULL, NULL, '1977-11-22', '0', 'sincorreo@sincorreo.com', NULL, '-1147884930', '1996-07-05', 1, NULL, NULL),
(18946, 2, 1, '27765543', 'MIRYAN ROSA DUARTE', NULL, NULL, '1952-09-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1090828209', '1975-03-07', 1, NULL, NULL),
(18947, 2, 2, '60374986', 'MONGUI  SANCHEZ BUENABER', NULL, NULL, '1976-08-17', '99999999', 'monguisan2014@gmail.com', NULL, '-1156954504', '1994-10-31', 1, NULL, NULL),
(18948, 2, 1, '1066062522', 'MONICA  DUARTE DUARTE', NULL, NULL, '1990-05-07', NULL, 'geeseazul@gmail.com', NULL, '-1192122436', '2008-09-17', 1, NULL, NULL),
(18949, 2, 2, '1091182291', 'MONICA LILIANA MALDONADO OCHOA', NULL, NULL, '1987-12-14', '0', 'sincorreo@sincorreo.com', NULL, '-1062452371', '2006-08-10', 1, NULL, NULL),
(18950, 2, 1, '26777377', 'MONICA LUCIA VACCA VEGA', NULL, NULL, '1982-12-09', '0', 'sincorreo@sincorreo.com', NULL, '-1168682946', '2001-03-27', 1, NULL, NULL),
(18951, 2, 1, '1091665130', 'MONICA MARLEY VERGEL TRIGOS', NULL, NULL, '1990-12-29', '0', 'mvergelt@gmail.com', NULL, '-1116375615', '2009-02-16', 1, NULL, NULL),
(18952, 2, 1, '37915120', 'MYRIAM  MORALES DE FIGUEROA', NULL, NULL, '1954-09-29', '6203740', 'mimofi2010@hotmail.com', NULL, '-1126302508', '1976-01-17', 1, NULL, NULL),
(18953, 2, 1, '37316791', 'MYRIAM  QUINTERO SANABRIA', NULL, NULL, '1962-04-15', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1983-03-09', 1, NULL, NULL),
(18954, 2, 2, '27887393', 'MYRIAN  SANCHEZ BAYONA', NULL, NULL, '1970-03-19', '0', 'sincorreo@sincorreo.com', NULL, '-1091638846', '1988-08-09', 1, NULL, NULL),
(18955, 2, 1, '1977437', 'NAHIN  GARCIA GRANADOS', NULL, NULL, '1979-06-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1162045040', '1997-09-23', 1, NULL, NULL),
(18956, 2, 1, '1066062197', 'NAHUN  CASTILLA MOLINA', NULL, NULL, '1988-01-09', '0', 'nauncastilla@gmail.com', NULL, '-1126060640', '2006-02-22', 1, NULL, NULL),
(18957, 2, 1, '1003257583', 'NAIDALI  LOPEZ CARDENAS', NULL, NULL, '2001-10-07', '0', 'naiilopezc@gmail.com', NULL, '-1075148741', '2019-10-15', 1, NULL, NULL),
(18958, 2, 1, '1004925479', 'NAIDER  GALVIS MORA', NULL, NULL, '2002-08-25', '0', 'morab324@gmail.com', NULL, '-1091280070', '2020-09-09', 1, NULL, NULL),
(18959, 2, 1, '1091663180', 'NAIN ALONSO CARRASCAL SALAZAR', NULL, NULL, '1989-12-21', NULL, 'sincorreo@sincorreo.com', NULL, '-790344858', '2008-03-06', 1, NULL, NULL),
(18960, 2, 1, '1091667585', 'NAIN ANDREY BOHORQUEZ LOBO', NULL, NULL, '1992-06-10', '0', 'nabohorquezl@ufps.ed.com', NULL, '-1081721328', '2010-06-11', 1, NULL, NULL),
(18961, 2, 1, '5793651', 'NAIRO ALFONSO QUINTERO VEGA', NULL, NULL, '1979-04-16', '0', 'sincorreo@sincorreo.com', NULL, '-1179620420', '1997-05-08', 1, NULL, NULL),
(18962, 2, 1, '88281186', 'NALLIT  JACOME MENESES', NULL, NULL, '1975-11-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1172288914', '1993-12-13', 1, NULL, NULL),
(18963, 2, 1, '26777203', 'NANCY  ANGARITA DUARTE', NULL, NULL, '1976-06-18', '0', 'nancyangaritaduarte@gmail.com', NULL, '-1178185666', '1996-10-31', 1, NULL, NULL),
(18964, 2, 1, '26777300', 'NANCY  CARRASCAL NORIEGA', NULL, NULL, '1979-02-27', '0', 'ncarrascalnoriega@gmail.com', NULL, '-1108583358', '2002-03-08', 1, NULL, NULL),
(18965, 2, 1, '26775013', 'NANCY  CHINCHILLA DUARTE', NULL, NULL, '1974-07-04', '0', 'sincorreo@sincorreo.com', NULL, '-1071001964', '1993-03-29', 1, NULL, NULL),
(18966, 2, 1, '26775062', 'NANCY  GARCIA PALLARES', NULL, NULL, '1975-12-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1137303822', '1994-06-30', 1, NULL, NULL),
(18967, 2, 1, '1066063202', 'NANCY  LOPEZ CARDENAS', NULL, NULL, '1995-03-07', '0', 'sincorreo@sincorreo.com', NULL, '-1191645522', '2013-10-28', 1, NULL, NULL),
(18968, 2, 1, '27852568', 'NANCY  MENESES AMAYA', NULL, NULL, '1971-10-16', '0', 'sincorreo@sincorreo.com', NULL, '-1069880036', '1991-04-17', 1, NULL, NULL),
(18969, 2, 1, '26777346', 'NANCY  RUEDAS MANOSALVA', NULL, NULL, '1979-04-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1086678910', '2000-06-27', 1, NULL, NULL),
(18970, 2, 1, '37332890', 'NANCY  TARAZONA TARAZONA', NULL, NULL, '1977-08-21', '0', 'sincorreo@sincorreo.com', NULL, '-1080250124', '1997-03-17', 1, NULL, NULL),
(18971, 2, 1, '26952478', 'NANCY ELENA ROSADO MESTRE', NULL, NULL, '1954-01-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1107015842', '1976-12-16', 1, NULL, NULL),
(18972, 2, 1, '26676665', 'NANCY ESTER QUINTERO DE CUETO', NULL, NULL, '1953-07-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1186149260', '1976-09-10', 1, NULL, NULL),
(18973, 2, 1, '26774932', 'NANCY ESTER RUEDA BAYONA', NULL, NULL, '1972-03-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1088907030', '1990-10-24', 1, NULL, NULL),
(18974, 2, 1, '60380139', 'NANCY ESTHER CASADIEGOS PE?ARANDA', NULL, NULL, '1976-05-07', '0', 'sincorreo@sincorreo.com', NULL, '-1090403243', '1995-07-10', 1, NULL, NULL),
(18975, 2, 1, '37368039', 'NANCY MARIA VANEGAS JACOME', NULL, NULL, '1969-05-26', '5636215', 'nancymaria77@hotmail.com', NULL, '-1080428146', '1989-02-08', 1, NULL, NULL),
(18976, 2, 1, '26774554', 'NANCY SOFIA OSORIO DE GARCIA', NULL, NULL, '1956-11-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1182722892', '1976-01-17', 1, NULL, NULL),
(18977, 2, 1, '26777330', 'NANCY STHER NAVARRO AMAYA', NULL, NULL, '1981-11-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1066578937', '2000-02-14', 1, NULL, NULL),
(18978, 2, 1, '26774817', 'NANCY TRINIDAD GALVIS SANCHEZ', NULL, NULL, '1967-08-07', '0', 'sincorreo@sincorreo.com', NULL, '-1120178239', '1985-12-09', 1, NULL, NULL),
(18979, 2, 1, '37334909', 'NASLY JESURIS BERMUDEZ SILVA', NULL, NULL, '1980-07-16', NULL, 'najebesi@hotmail.com', NULL, '-1158000747', '1998-07-22', 1, NULL, NULL),
(18980, 2, 1, '1005019227', 'NASLY KARINA FLOREZ AYALA', NULL, NULL, '2003-01-20', '0', 'naslikarinafloresayala@gmail.com', NULL, '-1179529242', '2021-03-02', 1, NULL, NULL),
(18981, 2, 1, '1091661903', 'NASLY KATHERINE CAÃ‘IZARES CASTRO', NULL, NULL, '1989-05-21', '0', 'naslyk@hotmail.com', NULL, '-1118159191', '2007-09-06', 1, NULL, NULL),
(18982, 1, 1, '1092175690', 'NATALIA  RUEDAS RINCON', NULL, NULL, '2004-12-10', '0', 'nataliaruedasrincon@gmail.com', NULL, '-1130372186', '2019-01-11', 1, NULL, NULL),
(18983, 1, 1, '1064086028', 'NATHALIA  PINZON QUINTERO', NULL, NULL, '2004-04-26', '-1119185763', 'sincorreo@sincorreo.com', NULL, NULL, '2020-01-14', 1, NULL, NULL),
(18984, 1, 1, '1003257714', 'NATHALIA SOFIA OSORIO SANTIAGO', NULL, NULL, '2001-02-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1116381809', '2016-09-06', 1, NULL, NULL),
(18985, 2, 1, '88143184', 'NAUN ALEXANDER MOLINA RINCON', NULL, NULL, '1969-10-24', '0', 'naun.alex69@gmail.com', NULL, '-1181327252', '1987-12-14', 1, NULL, NULL),
(18986, 2, 1, '37319263', 'NAURA MARIA ALVAREZ QUINTANA', NULL, NULL, '1966-03-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1178592323', '1985-05-03', 1, NULL, NULL),
(18987, 2, 1, '91270093', 'NAYE  PINEDA AVENDA?O', NULL, NULL, '1970-02-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1085973562', '1988-05-02', 1, NULL, NULL),
(18988, 2, 1, '5425225', 'NEFTALI  ANGARITA ANGARITA', NULL, NULL, '1946-05-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1070223987', '1967-11-27', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(18989, 2, 1, '5035575', 'NEFTALI  SOLANO SUAREZ', NULL, NULL, '1972-03-22', '0', 'sincorreo@sincorreo.com', NULL, '-1149866202', '1991-09-30', 1, NULL, NULL),
(18990, 2, 1, '1003121910', 'NEIBER  TORO JACOME', NULL, NULL, '1999-11-30', NULL, 'netojas.123@gmail.com', NULL, '-1067310135', '2017-12-18', 1, NULL, NULL),
(18991, 2, 1, '27852582', 'NEIDA ROSA RAMIREZ', NULL, NULL, '1972-02-04', '0', 'sincorreo@sincorreo.com', NULL, '-1152200071', '1991-07-27', 1, NULL, NULL),
(18992, 2, 1, '1946321', 'NEIDER  CASTILLA CHINCHILLA', NULL, NULL, '1982-02-20', '0', 'sincorreo@sincorreo.com', NULL, '-1107392116', '2000-05-17', 1, NULL, NULL),
(18993, 2, 1, '37181501', 'NEIDY MARIA RINCON GONZALEZ', NULL, NULL, '1981-10-09', '0', 'sincorreo@sincorreo.com', NULL, '-1171492504', '2002-09-23', 1, NULL, NULL),
(18994, 2, 1, '88280073', 'NEIL  ORTIZ BAYONA', NULL, NULL, '1974-12-04', '0', 'nortizbayona4@htomail.com', NULL, '-1192652747', '1993-02-02', 1, NULL, NULL),
(18995, 2, 1, '5035684', 'NEIL DEL CARMEN ANGARITA GARCIA', NULL, NULL, '1975-07-08', '0', 'neilangaritag@gmail.com', NULL, '-1116422946', '1994-10-31', 1, NULL, NULL),
(18996, 2, 1, '37338417', 'NEILA DEL CARMEN BALLESTEROS AVENDA?O', NULL, NULL, '1982-06-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1170131169', '2000-09-13', 1, NULL, NULL),
(18997, 2, 1, '37333741', 'NEILY  SARABIA', NULL, NULL, '1979-06-28', '0', 'sarabianeily22@gmail.com', NULL, '-1139359933', '1997-09-11', 1, NULL, NULL),
(18998, 2, 1, '1003257554', 'NEILY MARYETH NAVARRO RAMIREZ', NULL, NULL, '2000-11-17', '0', 'neilymaryeth17@gmail.com', NULL, '-1270984062', '2018-11-19', 1, NULL, NULL),
(18999, 2, 1, '1091658389', 'NELBER  GALVIS QUINTERO', NULL, NULL, '1988-04-08', '0', 'sincorreo@sincorreo.com', NULL, '-1080321237', '2006-04-19', 1, NULL, NULL),
(19000, 2, 1, '26775084', 'NELCY ESTHER CASADIEGOS BAYONA', NULL, NULL, '1976-11-10', '0', 'nescabay1976@gmail.com', NULL, '-1111642277', '1995-08-29', 1, NULL, NULL),
(19001, 2, 1, '26775057', 'NELLIS MARIA PINEDA DUARTE', NULL, NULL, '1975-07-22', '0', 'sincorreo@sincorreo.com', NULL, '-1187025394', '1994-06-20', 1, NULL, NULL),
(19002, 2, 1, '60416175', 'NELLY  TORRADO TORRADO', NULL, NULL, '1975-09-01', '0', 'sincorreo@sincorreo.com', NULL, '-1082613568', '1996-08-01', 1, NULL, NULL),
(19003, 2, 1, '26777413', 'NELLY  VARGAS PEÃ‘ARANDA', NULL, NULL, '1984-02-06', '0', 'sincorreo@sincorreo.com', NULL, '-1177727499', '2002-03-02', 1, NULL, NULL),
(19004, 2, 1, '37321904', 'NELLY GERTRUDYS OSORIO DUARTE', NULL, NULL, '1967-05-29', NULL, 'abogada.nellyosorio@gmail.com', NULL, NULL, '1987-12-14', 1, NULL, NULL),
(19005, 2, 1, '26774950', 'NELLY ISABEL PLATA CASADIEGOS', NULL, NULL, '1971-12-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1281243383', '1991-04-18', 1, NULL, NULL),
(19006, 2, 2, '27888051', 'NELLY JOHANA REMOLINA REMOLINA', NULL, NULL, '1982-03-04', '0', '', NULL, '-1086652912', '2000-08-31', 1, NULL, NULL),
(19007, 2, 1, '26777161', 'NELLY MARIA RAMIREZ PABA', NULL, NULL, '1963-03-29', '0', 'sincorreo@sincorreo.com', NULL, '-1171686057', '1982-12-02', 1, NULL, NULL),
(19008, 2, 1, '26777284', 'NELLY TORCOROMA JAIME BONETH', NULL, NULL, '1980-03-21', '0', 'sincorreo@sincorreo.com', NULL, '-1107044356', '1998-05-29', 1, NULL, NULL),
(19009, 2, 1, '5035185', 'NELSO DE JESUS JACOME OSORIO', NULL, NULL, '1961-06-04', '0', 'sincorreo@sincorreo.com', NULL, '-1075109947', '1981-10-19', 1, NULL, NULL),
(19010, 2, 1, '5035330', 'NELSON  CHINCHILLA DUARTE', NULL, NULL, '1967-08-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1080201980', '1985-12-09', 1, NULL, NULL),
(19011, 2, 1, '5035452', 'NELSON  DUARTE SANGUINO', NULL, NULL, '1970-06-23', '0', 'sincorreo@sincorreo.com', NULL, '-1170045883', '1988-09-15', 1, NULL, NULL),
(19012, 2, 1, '1733915', 'NELSON  SUAREZ OREJUELA', NULL, NULL, '1945-02-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1085040174', '1969-03-04', 1, NULL, NULL),
(19013, 2, 1, '88138329', 'NELSON JOSE CARRASCAL AMAYA', NULL, NULL, '1963-12-21', '0', 'sincorreo@sincorreo.com', NULL, '-1069529709', '1983-09-07', 1, NULL, NULL),
(19014, 2, 1, '37367776', 'NELY DEL CARMEN BAYONA RINCON', NULL, NULL, '1967-03-11', NULL, 'nellybayona1967@gmail.com', NULL, '-1127249268', '1987-12-14', 1, NULL, NULL),
(19015, 2, 1, '88284195', 'NEVARDO  QUINTERO PALLARES', NULL, NULL, '1977-11-16', '0', 'sincorreo@sincorreo.com', NULL, '-1065511169', '1996-06-07', 1, NULL, NULL),
(19016, 2, 1, '1066062154', 'NEVARDO ALEXIS SANCHEZ BOHORQUEZ', NULL, NULL, '1987-09-17', '0', 'nevardo7@gmail.com', NULL, '-1150384702', '2005-10-14', 1, NULL, NULL),
(19017, 2, 1, '22810500', 'NEYLA JOHANA PORTILLO PABA', NULL, NULL, '1980-07-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1147472466', '1998-10-29', 1, NULL, NULL),
(19018, 2, 1, '1066063103', 'NEYLA YUSANDRI BELTRAN NAVARRO', NULL, NULL, '1994-06-19', '0', 'neyus_19@hotmail.com', NULL, '-1131192066', '2013-01-14', 1, NULL, NULL),
(19019, 2, 1, '1091594455', 'NEYLER  ALVAREZ BAYONA', NULL, NULL, '1991-11-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1072301258', '2009-11-28', 1, NULL, NULL),
(19020, 2, 1, '1007367557', 'NICOLAS  GALLARDO VELASQUEZ', NULL, NULL, '2000-07-16', NULL, 'nicolasg20112011@gmail.com', NULL, '-1131139197', '2018-07-17', 1, NULL, NULL),
(19021, 2, 1, '1066063628', 'NICOLAS  ORTEGA MENDOZA', NULL, NULL, '1999-04-11', NULL, 'niormen1104@gmail.com', NULL, '-1116088407', '2017-05-05', 1, NULL, NULL),
(19022, 2, 1, '1735118', 'NICOLAS  PRADO', NULL, NULL, '1969-06-25', '0', 'sincorreo@sincorreo.com', NULL, '-1169101326', '1987-08-12', 1, NULL, NULL),
(19023, 2, 1, '26774717', 'NIDIA DEL SOCORRO REYES MENDOZA', NULL, NULL, '1964-02-16', '0', 'niremen@hotmail.com', NULL, '-1126279538', '1983-02-16', 1, NULL, NULL),
(19024, 2, 1, '37335985', 'NIDIA MILENA ARENAS DURAN', NULL, NULL, '1979-04-06', '5696327', 'nidia0604111@gmail.com', NULL, '-1080993379', '1999-04-28', 1, NULL, NULL),
(19025, 2, 1, '1092670511', 'NIDIA YANID ACOSTA', NULL, NULL, '1986-10-07', '0', 'sincorreo@sincorreo.com', NULL, '-1176052413', '2005-04-20', 1, NULL, NULL),
(19026, 2, 1, '49669515', 'NIDIAN  DURAN CHINCHILLA', NULL, NULL, '1980-06-25', '0', 'nduran.ipk30646@gmail.com', NULL, '-1179093543', '2000-02-01', 1, NULL, NULL),
(19027, 2, 1, '77180049', 'NIEVES  LOPEZ CARDENAS', NULL, NULL, '1979-06-09', '0', 'sincorreo@sincorreo.com', NULL, '-1072770960', '1997-07-31', 1, NULL, NULL),
(19028, 1, 1, '-1742623200', 'NILSON JESUS DUARTE CHINCHILLA', NULL, NULL, '1997-04-16', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2007-03-20', 1, NULL, NULL),
(19029, 2, 1, '1066062229', 'NILVEIRO  ORTIZ JOYA', NULL, NULL, '1986-04-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1176097736', '2006-04-03', 1, NULL, NULL),
(19030, 2, 1, '27762581', 'NINFA ANTONIA MORA DE MOLINA', NULL, NULL, '1944-08-27', '0', 'sincorreo@sincorreo.com', NULL, '-1161555806', '1970-11-09', 1, NULL, NULL),
(19031, 2, 1, '27706258', 'NINFA ANTONIA SANCHEZ PIÃ‘UELA', NULL, NULL, '1954-12-05', '0', 'sincorreo@sincorreo.com', NULL, '-1189595900', '1989-12-11', 1, NULL, NULL),
(19032, 2, 1, '37339619', 'NIVE DEL CARMEN GUILLIN MORA', NULL, NULL, '1972-04-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1161511241', '2001-10-17', 1, NULL, NULL),
(19033, 2, 1, '1978753', 'NIXON  CHAVES ECHAVEZ', NULL, NULL, '1979-10-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1150624817', '1998-02-06', 1, NULL, NULL),
(19034, 2, 1, '1066063178', 'NIXON ROMARIO MENDOZA ANGARITA', NULL, NULL, '1995-06-22', '0', 'nrmendozaa@ufpso.edu.co', NULL, '-1111699624', '2013-08-20', 1, NULL, NULL),
(19035, 2, 1, '5036198', 'NOE  PACHECO ACOSTA', NULL, NULL, '1980-07-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1282412158', '1998-08-27', 1, NULL, NULL),
(19036, 2, 1, '88276131', 'NOEL  CASTRO AMAYA', NULL, NULL, '1971-01-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1089900777', '1989-07-24', 1, NULL, NULL),
(19037, 2, 1, '88144426', 'NOEL  TRIGOS VERGEL', NULL, NULL, '1969-10-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1077322444', '1988-11-04', 1, NULL, NULL),
(19038, 2, 1, '5427148', 'NOEL  VARGAS PEÃ‘ARANDA', NULL, NULL, '1982-02-11', '0', 'sincorreo@sincorreo.com', NULL, '-1178313783', '2001-01-05', 1, NULL, NULL),
(19039, 2, 1, '5035487', 'NOEL ANTONIO SANCHEZ SANTIAGO', NULL, NULL, '1971-02-02', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1900-12-30', 1, NULL, NULL),
(19040, 2, 1, '37323745', 'NOEMA  MOLINA MORA', NULL, NULL, '1970-11-26', '0', 'sincorreo@sincorreo.com', NULL, '-1156801726', '1989-10-02', 1, NULL, NULL),
(19041, 2, 1, '13372626', 'NOHE  FUENTES GONZALEZ', NULL, NULL, '1959-10-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1167369043', '1977-12-22', 1, NULL, NULL),
(19042, 2, 1, '42498814', 'NOHEMY  CARRILLO PICON', NULL, NULL, '1960-07-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1080266290', '1979-12-09', 1, NULL, NULL),
(19043, 2, 1, '37333794', 'NOHORA  ORTEGA GUILLIN', NULL, NULL, '1973-01-21', '0', 'sincorreo@sincorreo.com', NULL, '-1126087995', '1997-09-24', 1, NULL, NULL),
(19044, 2, 1, '26774990', 'NORA LISBETH DUARTE GALVIS', NULL, NULL, '1971-05-16', '0', 'sincorreo@sincorreo.com', NULL, '-1159836501', '1992-07-15', 1, NULL, NULL),
(19045, 2, 1, '37326019', 'NORALBA  MANZANO DURAN', NULL, NULL, '1972-04-08', '0', 'sincorreo@sincorreo.com', NULL, '-1091901756', '1991-07-27', 1, NULL, NULL),
(19046, 2, 1, '37182037', 'NORALBA  TRIGOS VERJEL', NULL, NULL, '1977-03-09', '0', 'sincorreo@sincorreo.com', NULL, '-1180234379', '2003-01-17', 1, NULL, NULL),
(19047, 2, 1, '1004819981', 'NORBERTO  TORRES VERA', NULL, NULL, '1986-03-10', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2006-10-17', 1, NULL, NULL),
(19048, 2, 1, '1066063623', 'NORBEY  MANDON RODRIGUEZ', NULL, NULL, '1999-04-13', NULL, 'norbey9904@gmail.com', NULL, '-1142420288', '2017-04-19', 1, NULL, NULL),
(19049, 2, 1, '26777456', 'NOREIDY  GOMEZ DUARTE', NULL, NULL, '1985-03-16', '0', 'sincorreo@sincorreo.com', NULL, '-1066376629', '2003-04-22', 1, NULL, NULL),
(19050, 2, 1, '1066063485', 'NOREYDI  PORTILLO ANGARITA', NULL, NULL, '1998-02-04', '0', 'portilloangarita@gmail.com', NULL, '-1152758236', '2016-02-16', 1, NULL, NULL),
(19051, 1, 1, '1066062244', 'NORIANA YISETH CHINCHILLA QUINTERO', NULL, NULL, '2006-04-27', '0', 'norianayiseth@gmail.com', NULL, '-1151521932', '2013-08-12', 1, NULL, NULL),
(19052, 2, 1, '60436478', 'NORIS  LIZARAZO VARGAS', NULL, NULL, '1980-10-15', '0', 'sincorreo@sincorreo.com', NULL, '-1080870942', '1998-10-28', 1, NULL, NULL),
(19053, 2, 1, '37320749', 'NORIS MARIA LAZARO PEREZ', NULL, NULL, '1966-05-28', '0', 'sincorreo@sincorreo.com', NULL, '-1150711910', '1987-02-13', 1, NULL, NULL),
(19054, 2, 1, '49671232', 'NORIS TORCOROMA GOMEZ PORTILLO', NULL, NULL, '1983-06-07', '0', 'sincorreo@sincorreo.com', NULL, '-1066797679', '2001-08-08', 1, NULL, NULL),
(19055, 2, 1, '1007470389', 'NORLEIBA  GUTIERREZ RODRIGUEZ', NULL, NULL, '1993-11-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1269824438', '2012-01-16', 1, NULL, NULL),
(19056, 2, 1, '37338786', 'NORMA RUTH BELTRAN SANCHEZ', NULL, NULL, '1982-07-06', '0', 'norubesa_05@hotmail.com', NULL, '-1192426449', '2001-01-10', 1, NULL, NULL),
(19057, 2, 1, '1091534027', 'NUBIA  RAMIREZ SERRANO', NULL, NULL, '1992-04-06', '0', 'sincorreo@sincorreo.com', NULL, '-1146333598', '2011-01-13', 1, NULL, NULL),
(19058, 2, 1, '37325246', 'NUBIA DEL CARMEN TORRES', NULL, NULL, '1965-05-28', '0', 'sincorreo@sincorreo.com', NULL, '-1151477906', '1991-01-16', 1, NULL, NULL),
(19059, 2, 1, '26774716', 'NUBIA MARIA MENDOZA RINCON', NULL, NULL, '1964-02-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1088335717', '1983-02-16', 1, NULL, NULL),
(19060, 2, 1, '26774769', 'NUBIA MARIA SANCHEZ SANTIAGO', NULL, NULL, '1962-03-17', '0', 'sincorreo@sincorreo.com', NULL, '-1180235616', '1984-06-13', 1, NULL, NULL),
(19061, 2, 1, '37370376', 'NUBIA STELLA QUINTERO ORTEGA', NULL, NULL, '1974-01-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1181140442', '1996-10-31', 1, NULL, NULL),
(19062, 2, 1, '63500850', 'NUBIA ZULIMA PINTO RODRIGUEZ', NULL, NULL, '1972-12-26', NULL, 'pintorodrigueznubia@gmail.com', NULL, '-1192009132', '1993-03-31', 1, NULL, NULL),
(19063, 2, 1, '5035202', 'NULFO  PORTILLO DUARTE', NULL, NULL, '1962-10-09', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1981-12-14', 1, NULL, NULL),
(19064, 2, 1, '88141898', 'NUMAR ANTONIO RINCON PAREDES', NULL, NULL, '1966-02-26', '0', 'sincorreo@sincorreo.com', NULL, '-1189915518', '1986-11-11', 1, NULL, NULL),
(19065, 2, 1, '1066063289', 'NUMAR EDUARDO ROPERO JOYA', NULL, NULL, '1996-06-26', '0', 'sincorreo@sincorreo.com', NULL, '-1122251769', '2014-08-08', 1, NULL, NULL),
(19066, 2, 1, '13176883', 'NUMAR JOHAN SALAZAR URQUIJO', NULL, NULL, '1984-08-25', '0', 'sincorreo@sincorreo.com', NULL, '-1149351886', '2002-09-10', 1, NULL, NULL),
(19067, 2, 1, '1003257465', 'NURY ROCIO PAREDES SANCHEZ', NULL, NULL, '1992-01-17', '0', 'nuryparedes1107@gmail.com', NULL, '-1071647120', '2010-02-03', 1, NULL, NULL),
(19068, 2, 1, '26774653', 'NUVIA DEL CARMEN RUEDA IBARRA', NULL, NULL, '1962-02-03', '0', 'sincorreo@sincorreo.com', NULL, '-1060216439', '1980-11-27', 1, NULL, NULL),
(19069, 2, 1, '37324049', 'NUVIA ESTHER CARRILLO BARBOSA', NULL, NULL, '1971-04-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1122403023', '1989-12-11', 1, NULL, NULL),
(19070, 2, 1, '9716491', 'OBEIMAR ALONSO GUERRERO CASTILLA', NULL, NULL, '1981-01-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1159693561', '2000-08-14', 1, NULL, NULL),
(19071, 2, 1, '27887741', 'OFELIA  OVALLES MALDONADO', NULL, NULL, '1966-05-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1150094095', '1993-11-30', 1, NULL, NULL),
(19072, 2, 1, '37331789', 'OFELIA  RUEDAS BAYONA', NULL, NULL, '1977-12-16', '0', 'ofeliaruedas77@gmail.com', NULL, '-1129603679', '1996-03-29', 1, NULL, NULL),
(19073, 2, 1, '27762241', 'OLGA  LANZIANO BOHORQUEZ', NULL, NULL, '1948-01-30', NULL, 'olgalanziano2018@gmail.com', NULL, '-1192770187', '1970-01-19', 1, NULL, NULL),
(19074, 2, 1, '37324937', 'OLGA CECILIA PEDROZA VILA', NULL, NULL, '1965-08-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1091246373', '1990-10-04', 1, NULL, NULL),
(19075, 2, 1, '1091681743', 'OLGA DAYANA ARIAS VARGAS', NULL, NULL, '1999-02-05', '0', 'dayanitasoto15@gmail.com', NULL, '-1187064200', '2017-03-02', 1, NULL, NULL),
(19076, 2, 1, '37182379', 'OLGA LUCIA QUINTERO LOPEZ', NULL, NULL, '1985-03-12', '0', 'sincorreo@sincorreo.com', NULL, '-1162123996', '2003-03-21', 1, NULL, NULL),
(19077, 2, 1, '26778110', 'OLGA MARIA VILLALBA SANTIAGO', NULL, NULL, '1942-01-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1116586721', '1963-02-11', 1, NULL, NULL),
(19078, 2, 1, '1066062993', 'OLGA TATIANA BOHORQUEZ LOBO', NULL, NULL, '1994-04-22', '0', 'tati.lobo22@hotmail.com', NULL, '-1191940184', '2012-04-30', 1, NULL, NULL),
(19079, 2, 1, '5469612', 'OLGER  CASTRO PRADO', NULL, NULL, '1981-05-15', '0', 'sincorreo@sincorreo.com', NULL, '-1067121720', '1999-07-23', 1, NULL, NULL),
(19080, 2, 1, '1066063296', 'OLGER  NAVARRO SEPULVEDA', NULL, NULL, '1996-03-18', '0', 'sincorreo@sincorreo.com', NULL, '-1189152295', '2014-09-04', 1, NULL, NULL),
(19081, 2, 1, '27745731', 'OLIMPIA  CONTRERAS BACCA', NULL, NULL, '1954-12-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1077831604', '1979-09-24', 1, NULL, NULL),
(19082, 2, 1, '26774728', 'OLIVA MARIA MOLINA DUARTE', NULL, NULL, '1964-07-16', NULL, 'oliva1607@hotmail.com', NULL, '-1129707192', '1983-03-17', 1, NULL, NULL),
(19083, 2, 1, '37334215', 'OLIVIA  REYES TRILLOS', NULL, NULL, '1979-11-07', '0', 'r.t.olivia@hotmail.com', NULL, '-1071583642', '1998-01-21', 1, NULL, NULL),
(19084, 2, 1, '37330147', 'OMAIDA  RINCON CARRILLO', NULL, NULL, '1973-11-14', '0', 'sincorreo@sincorreo.com', NULL, '-1169408128', '1995-02-18', 1, NULL, NULL),
(19085, 2, 1, '1091655651', 'OMAIDA  RINCON DURAN', NULL, NULL, '1987-01-25', '0', 'sincorreo@sincorreo.com', NULL, '-1161162283', '2005-03-04', 1, NULL, NULL),
(19086, 2, 1, '26775026', 'OMAIRA  LOZANO CHINCHILLA', NULL, NULL, '1973-10-27', '0', 'omayralozano_24@hotmail.com', NULL, '-1190529258', '1993-07-14', 1, NULL, NULL),
(19087, 2, 1, '49670681', 'OMAIRA  PABON SUAREZ', NULL, NULL, '1977-06-04', '0', 'sincorreo@sincorreo.com', NULL, '-1162384883', '2001-02-14', 1, NULL, NULL),
(19088, 2, 1, '5426733', 'OMAR  ANGARITA QUINTERO', NULL, NULL, '1980-11-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1131003202', '1999-05-06', 1, NULL, NULL),
(19089, 2, 1, '5036175', 'OMAR  GOMEZ PORTILLO', NULL, NULL, '1979-08-23', NULL, 'sincorreo@sincorreo.com', NULL, '-1126109355', '1997-09-26', 1, NULL, NULL),
(19090, 2, 1, '5036163', 'OMAR  PLATA CASADIEGOS', NULL, NULL, '1978-03-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1182477437', '1997-05-30', 1, NULL, NULL),
(19091, 2, 1, '10784341', 'OMAR LUIS CASTRO QUI?ONEZ', NULL, NULL, '1983-05-24', NULL, 'omarcas240583@gmail.com', NULL, '-1170853180', '2003-01-07', 1, NULL, NULL),
(19092, 2, 1, '26775004', 'OMAYDA  SANTIAGO QUINTERO', NULL, NULL, '1973-04-21', '0', 'liludaomafre@gmail.com', NULL, '-1112654542', '1992-12-01', 1, NULL, NULL),
(19093, 2, 1, '26777273', 'OMAYDA  TORREZ CARREÃ‘O', NULL, NULL, '1978-10-04', '0', 'omaydatoca04@gmail.com', NULL, '-1140144823', '2002-02-12', 1, NULL, NULL),
(19094, 2, 1, '26774927', 'ONEIDA  SANTIAGO MOLINA', NULL, NULL, '1971-12-18', '0', 'sincorreo@sincorreo.com', NULL, '-1077648839', '1990-09-24', 1, NULL, NULL),
(19095, 2, 1, '27741634', 'ORFEINA MARIA PEREZ PEREZ', NULL, NULL, '1973-08-14', '0', 'perezperezorfelinamaria@gmail.com', NULL, '-1086325527', '1993-08-30', 1, NULL, NULL),
(19096, 2, 1, '1003121919', 'ORFELINA  RODRIGUEZ QUINTANA', NULL, NULL, '1992-08-03', '0', 'sincorreo@sincorreo.com', NULL, '-1176131627', '2011-04-04', 1, NULL, NULL),
(19097, 2, 1, '5035657', 'ORIEL ALFONSO DUARTE PORTILLO', NULL, NULL, '1974-10-23', '0', 'sincorreo@sincorreo.com', NULL, '-1152494351', '1994-02-07', 1, NULL, NULL),
(19098, 2, 1, '19745010', 'ORIELSO  DUARTE GARCIA', NULL, NULL, '1956-04-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1078820171', '1976-01-17', 1, NULL, NULL),
(19099, 2, 1, '12668031', 'ORIELSO  LOZANO CHINCHILLA', NULL, NULL, '1966-10-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1086470993', '1985-08-13', 1, NULL, NULL),
(19100, 2, 1, '5035617', 'ORIELSO  RUEDAS BAYONA', NULL, NULL, '1973-05-25', '0', 'orielso.ruedas73@gmail.com', NULL, '-1075432726', '1992-09-30', 1, NULL, NULL),
(19101, 2, 1, '5035637', 'ORIELSON  RIOS NORIEGA', NULL, NULL, '1975-01-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1178320953', '1993-06-10', 1, NULL, NULL),
(19102, 2, 1, '5036356', 'ORIELSON ANTONIO ANGARITA RIOS', NULL, NULL, '1985-02-06', '0', 'oangaritarios@gmail.com', NULL, '-1151111188', '2003-05-27', 1, NULL, NULL),
(19103, 2, 1, '1064836011', 'ORIELSON ANTONIO CLARO DUARTE', NULL, NULL, '1985-07-19', NULL, 'orielclaro10@gmail.com', NULL, '-1112714671', '2004-01-09', 1, NULL, NULL),
(19104, 2, 1, '13360885', 'ORLANDO  CASTRO AMAYA', NULL, NULL, '1956-05-15', '0', 'sincorreo@sincorreo.com', NULL, '-1081431323', '1976-09-02', 1, NULL, NULL),
(19105, 2, 1, '13375848', 'ORLANDO ANTONIO LOPEZ', NULL, NULL, '1965-09-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1146847762', '1987-06-08', 1, NULL, NULL),
(19106, 2, 1, '13377906', 'ORLANDO ANTONIO PLATA ASCANIO', NULL, NULL, '1973-03-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1180040469', '1992-09-11', 1, NULL, NULL),
(19107, 2, 1, '13363098', 'OSCAR  SANCHEZ PEREZ', NULL, NULL, '1960-02-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1092740470', '1978-09-11', 1, NULL, NULL),
(19108, 2, 1, '1033729883', 'OSCAR ANDRES CASTAÃ‘EDA ORTIZ', NULL, NULL, '1990-12-19', '0', 'oscar12703@hotmail.com', NULL, '-1186423005', '2009-01-27', 1, NULL, NULL),
(19109, 2, 1, '88137839', 'OSCAR ANTONIO MENESES PINEDA', NULL, NULL, '1962-11-21', '-1168504878', 'sincorreo@sincorreo.com', NULL, '-1161856488', '1982-12-09', 1, NULL, NULL),
(19110, 2, 1, '1091655457', 'OSCAR EDUARDO ALVAREZ SANTIAGO', NULL, NULL, '1986-11-29', '0', 'sincorreo@sincorreo.com', NULL, '-1091574699', '2005-02-18', 1, NULL, NULL),
(19111, 2, 1, '1066063083', 'OSCAR EDUARDO DELGADO BOHORQUEZ', NULL, NULL, '1994-11-19', '0', 'delgadobohorquezoscareduardo19@gmail.com', NULL, '-1107827829', '2012-11-26', 1, NULL, NULL),
(19112, 2, 1, '1091671935', 'OSCAR EDUARDO MORA CA?IZAREZ', NULL, NULL, '1994-05-17', NULL, 'oscareduardo99@hotmail.es', NULL, '-1065939977', '2012-08-09', 1, NULL, NULL),
(19113, 2, 1, '1735108', 'OSCAR EMILIO ALVAREZ MENESES', NULL, NULL, '1956-11-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1169979785', '1977-09-07', 1, NULL, NULL),
(19114, 2, 1, '5035247', 'OSCAR EMILIO GALVIS SANCHEZ', NULL, NULL, '1964-04-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1169887855', '1983-03-21', 1, NULL, NULL),
(19115, 2, 1, '5035194', 'OSCAR EMILIO MANOSALVA DUARTE', NULL, NULL, '1962-09-04', '0', 'sincorreo@sincorreo.com', NULL, '-1138537135', '1981-11-23', 1, NULL, NULL),
(19116, 2, 1, '13358609', 'OSCAR EMILIO MORA ALVAREZ', NULL, NULL, '1952-01-27', NULL, 'oscares8394@gmail.com', NULL, '-1189219360', '1974-06-28', 1, NULL, NULL),
(19117, 2, 1, '1734092', 'OSCAR EMILIO PAREDES SOTO', NULL, NULL, '1957-10-10', '-1152537423', 'sincorreo@sincorreo.com', NULL, '-1152537423', '1976-01-17', 1, NULL, NULL),
(19118, 2, 1, '1733846', 'OSCAR EMILIO ROJAS', NULL, NULL, '1940-06-24', '0', 'sincorreo@sincorreo.com', NULL, '-1090848447', '1965-05-28', 1, NULL, NULL),
(19119, 2, 1, '88142978', 'OSCAR EMILIO SANTIAGO PEREZ', NULL, NULL, '1969-09-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1066407553', '1987-10-06', 1, NULL, NULL),
(19120, 2, 1, '88279710', 'OSCAR EMIRO OSORIO RIOS', NULL, NULL, '1974-07-29', '0', 'oscarosorio24@hotmail.com', NULL, '-1107025303', '1992-10-28', 1, NULL, NULL),
(19121, 2, 1, '1066062896', 'OSCAR MAURICIO OSORIO TORO', NULL, NULL, '1993-09-18', NULL, 'taos2904@hotmail.com', NULL, '-1129633756', '2011-09-21', 1, NULL, NULL),
(19122, 1, 1, '1065872494', 'OSNEIDER  CONTRERAS LOPEZ', NULL, NULL, '2006-01-03', '0', 'sincorreo@sincorreo.com', NULL, '-1080512988', '2013-09-11', 1, NULL, NULL),
(19123, 2, 1, '1066063010', 'OSNEIDER  CONTRERAS MENDOZA', NULL, NULL, '1994-05-10', '0', 'ocontrerasm@ufpso.edu.co', NULL, '-1152489799', '2012-06-01', 1, NULL, NULL),
(19124, 2, 1, '1066063073', 'OSNEIDER  DUARTE DUARTE', NULL, NULL, '1994-10-23', '0', 'osnymusic@hotmail.com', NULL, '-1156506116', '2012-11-06', 1, NULL, NULL),
(19125, 2, 1, '1003257675', 'OSNEIDER  LOBO JACOME', NULL, NULL, '1998-06-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1168772755', '2016-06-21', 1, NULL, NULL),
(19126, 2, 1, '1066062591', 'OSNEIDER  PACHECO BONETT', NULL, NULL, '1991-01-05', '0', 'osneiderpacheco541@gmail.com', NULL, '-1192086930', '2009-02-26', 1, NULL, NULL),
(19127, 2, 1, '5036337', 'OSWALDO  TRIGOS MARQUEZ', NULL, NULL, '1984-08-03', '0', 'trigososwaldo@gmail.com', NULL, '-1089140313', '2002-09-11', 1, NULL, NULL),
(19128, 2, 1, '26774485', 'OTILIA  GALVIS GALLARDO', NULL, NULL, '1952-06-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1110713964', '1974-01-21', 1, NULL, NULL),
(19129, 2, 1, '26775063', 'OTILIA  NAVARRO PICON', NULL, NULL, '1976-02-18', '0', 'otilianavarro97@gmail.com', NULL, '-1141762738', '1994-06-30', 1, NULL, NULL),
(19130, 2, 1, '5139331', 'OTILIO  QUINTERO CARREÃ‘O', NULL, NULL, '1953-10-06', '0', 'sincorreo@sincorreo.com', NULL, '-1086681378', '1975-10-28', 1, NULL, NULL),
(19131, 2, 1, '1091656135', 'OVEIMAR  PAREDES VEGA', NULL, NULL, '1987-05-01', NULL, 'oveimarparedesvega@gmail.com', NULL, '-1081293415', '2005-05-12', 1, NULL, NULL),
(19132, 2, 1, '37367733', 'OVIDIA  GUERRERO QUINTERO', NULL, NULL, '1963-03-27', '0', 'sincorreo@sincorreo.com', NULL, '-1176695420', '1987-12-14', 1, NULL, NULL),
(19133, 2, 1, '27659211', 'PABLA ROSA JACOME RINCON', NULL, NULL, '1951-03-26', '0', 'sincorreo@sincorreo.com', NULL, '-1180492040', '1972-09-15', 1, NULL, NULL),
(19134, 2, 1, '5035381', 'PABLO ELY ASCANIO GARCIA', NULL, NULL, '1969-06-29', '5840532', 'sincorreo@sincorreo.com', NULL, '-1130066363', '1987-09-02', 1, NULL, NULL),
(19135, 2, 1, '19745009', 'PABLO EMILIO DUARTE PORTILLO', NULL, NULL, '1956-09-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1150944426', '1976-01-17', 1, NULL, NULL),
(19136, 2, 1, '88139794', 'PABLO HELI PACHECO ACOSTA', NULL, NULL, '1965-12-24', '0', 'sincorreo@sincorreo.com', NULL, '-1110506293', '1984-09-07', 1, NULL, NULL),
(19137, 2, 1, '77030277', 'PABLO HELI QUINTERO GUERRERO', NULL, NULL, '1969-01-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1112310104', '1987-09-01', 1, NULL, NULL),
(19138, 2, 1, '1066063580', 'PAOLA ANDREA SANTIAGO GARCIA', NULL, NULL, '1998-08-23', NULL, 'paosanti_os@hotmail.com', NULL, '-1141642781', '2016-10-14', 1, NULL, NULL),
(19139, 2, 1, '1090988547', 'PAOLA FERNANDA PAYARES SANJUAN', NULL, NULL, '1994-09-16', '0', 'pfernandap94@gmail.com', NULL, '-1169276583', '2012-10-08', 1, NULL, NULL),
(19140, 2, 1, '5036189', 'PARMENIDES  GUTIERREZ QUINTERO', NULL, NULL, '1977-10-22', '0', 'sincorreo@sincorreo.com', NULL, '-1150039455', '1998-03-30', 1, NULL, NULL),
(19141, 2, 1, '5426930', 'PASTOR  ANGARITA LOPEZ', NULL, NULL, '1980-12-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1188156751', '1999-11-18', 1, NULL, NULL),
(19142, 2, 1, '37321589', 'PATRICIA  CARRASCAL PACHECO', NULL, NULL, '1968-04-04', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1987-10-27', 1, NULL, NULL),
(19143, 2, 1, '49556082', 'PATRICIA  CHINCHILLA ANDRADES', NULL, NULL, '1976-02-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1086758456', '1997-04-07', 1, NULL, NULL),
(19144, 2, 1, '1066062892', 'PATRICIA  NAVARRO SEPULVEDA', NULL, NULL, '1993-08-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1176921837', '2011-09-15', 1, NULL, NULL),
(19145, 2, 1, '37339760', 'PATRICIA  PICON PABA', NULL, NULL, '1983-05-07', '0', 'patriciapicon07@gmail.com', NULL, '-1072673783', '2001-07-19', 1, NULL, NULL),
(19146, 2, 1, '49761164', 'PATRICIA DEL ROSARIO GARCIA SANCHEZ', NULL, NULL, '1970-09-08', '0', 'patolyn29@hotmail.com', NULL, '-1170161703', '1989-01-10', 1, NULL, NULL),
(19147, 2, 1, '1007912767', 'PAULA ANDREA ARENAS MADARIAGA', NULL, NULL, '2001-02-26', NULL, 'paarenasm@ufpso.edu.co', NULL, '-1186510716', '2019-03-05', 1, NULL, NULL),
(19148, 1, 1, '1091657002', 'PAULA ANDREA AVENDAÃ‘O RANGEL', NULL, NULL, '2005-04-14', '0', 'paverangel123@gmail.com', NULL, '-1180541176', '2019-04-29', 1, NULL, NULL),
(19149, 2, 1, '1003257559', 'PAULA YERALDIN RUEDA DUARTE', NULL, NULL, '2000-07-23', '0', 'paulayruedad@gmail.com', NULL, '-1116466226', '2018-12-17', 1, NULL, NULL),
(19150, 2, 1, '18912532', 'PAULO  ABELLO GUERRERO', NULL, NULL, '1953-06-05', '5626030', 'sincorreo@sincorreo.com', NULL, NULL, '1990-10-10', 1, NULL, NULL),
(19151, 2, 1, '88167445', 'PEDRO  PEREZ PEREZ', NULL, NULL, '1968-01-28', '0', 'sincorreo@sincorreo.com', NULL, '-1066051779', '1989-06-23', 1, NULL, NULL),
(19152, 2, 1, '88135689', 'PEDRO  QUINTERO LOPEZ', NULL, NULL, '1956-12-31', '0', 'sincorreo@sincorreo.com', NULL, '-1151202040', '1980-11-19', 1, NULL, NULL),
(19153, 2, 2, '5529313', 'PEDRO  RODRIGUEZ RINCON', NULL, NULL, '1971-07-07', '0', 'sincorreo@sincorreo.com', NULL, '-1162654585', '1989-09-15', 1, NULL, NULL),
(19154, 2, 1, '5453908', 'PEDRO  ROPERO MAYORGA', NULL, NULL, '1958-06-29', '0', 'sincorreo@sincorreo.com', NULL, '-1156038821', '1979-12-09', 1, NULL, NULL),
(19155, 2, 1, '1733935', 'PEDRO ANTONIO GUTIERREZ DURAN', NULL, NULL, '1945-06-28', '0', 'sincorreo@sincorreo.com', NULL, '-1156863532', '1969-06-20', 1, NULL, NULL),
(19156, 2, 1, '13370893', 'PEDRO ANTONIO PABA JACOME', NULL, NULL, '1953-05-16', '0', 'sincorreo@sincorreo.com', NULL, '-1081103794', '1974-10-04', 1, NULL, NULL),
(19157, 2, 1, '1946318', 'PEDRO ELIAS DURAN ANGARITA', NULL, NULL, '1981-03-04', '0', 'sincorreo@sincorreo.com', NULL, '-1169431523', '2000-05-12', 1, NULL, NULL),
(19158, 2, 1, '13372716', 'PEDRO ELIAS OJEDA RINCON', NULL, NULL, '1960-03-29', '-1156417788', 'sincorreo@sincorreo.com', NULL, '-1156501614', '1978-08-10', 1, NULL, NULL),
(19159, 2, 1, '13355413', 'PEDRO ELIAS SANTIAGO', NULL, NULL, '1948-10-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1148536816', '1970-01-19', 1, NULL, NULL),
(19160, 2, 1, '1734097', 'PEDRO RAFAEL DAZA ANGARITA', NULL, NULL, '1959-02-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1129458597', '1976-01-17', 1, NULL, NULL),
(19161, 2, 1, '13360076', 'RAMIRO  CAÃ‘IZARES CUBIDES', NULL, NULL, '1955-07-12', '0', 'sincorreo@sincorreo.com', NULL, '-1122629161', '1976-01-17', 1, NULL, NULL),
(19162, 2, 1, '88215677', 'RAMIRO  CASTILLA MOLINA', NULL, NULL, '1975-08-25', '0', 'ramiro351@hotmail.es', NULL, '-1087171787', '1993-09-22', 1, NULL, NULL),
(19163, 2, 1, '1066062423', 'RAMIRO  SANTIAGO RODRIGUEZ', NULL, NULL, '1989-04-10', '0', 'ramirinsantiagor10@gmail.com', NULL, '-1086461165', '2009-10-02', 1, NULL, NULL),
(19164, 2, 1, '5427049', 'RAMIRO ALBERTO TRUJILLO', NULL, NULL, '1982-04-29', '0', 'sincorreo@sincorreo.com', NULL, '-1082680068', '2000-07-21', 1, NULL, NULL),
(19165, 2, 1, '5035620', 'RAMON  GALVIZ DUARTE', NULL, NULL, '1974-05-17', '0', 'sincorreo@sincorreo.com', NULL, '-1075041202', '1992-10-27', 1, NULL, NULL),
(19166, 2, 1, '5035267', 'RAMON  GOMEZ GARCIA', NULL, NULL, '1964-02-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1180732250', '1983-09-20', 1, NULL, NULL),
(19167, 2, 1, '5036347', 'RAMON  SANTIAGO QUINTERO', NULL, NULL, '1984-10-30', '0', 'rasaqui1984@gmail.com', NULL, '-1171516433', '2003-07-18', 1, NULL, NULL),
(19168, 2, 1, '1090985146', 'RAMON ADRIAN MADARIAGA QUINTERO', NULL, NULL, '1989-08-07', '0', 'sincorreo@sincorreo.com', NULL, '-1082540436', '2007-08-14', 1, NULL, NULL),
(19169, 2, 1, '5035515', 'RAMON ALBERTO CARRE?O RUEDAS', NULL, NULL, '1971-08-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1159354017', '1989-12-11', 1, NULL, NULL),
(19170, 2, 1, '1066062337', 'RAMON ALBERTO PORTILLO BOHORQUEZ', NULL, NULL, '1989-01-02', '0', 'sincorreo@sincorreo.com', NULL, '-1148728746', '2007-01-23', 1, NULL, NULL),
(19171, 2, 1, '5035395', 'RAMON ALFONSO PAREDES SOTO', NULL, NULL, '1969-07-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1171330049', '1987-10-06', 1, NULL, NULL),
(19172, 2, 1, '5035634', 'RAMON ANGEL NAVARRO CASTRO', NULL, NULL, '1971-09-01', '0', 'sincorreo@sincorreo.com', NULL, '-787933281', '1993-05-05', 1, NULL, NULL),
(19173, 2, 1, '5035584', 'RAMON ANTONIO DURAN ASCANIO', NULL, NULL, '1973-10-14', '0', 'sincorreo@sincorreo.com', NULL, '-1156801985', '1991-11-08', 1, NULL, NULL),
(19174, 2, 1, '1052571999', 'RAMON ANTONIO VEGA BORJA', NULL, NULL, '2000-04-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1088161501', '2018-07-06', 1, NULL, NULL),
(19175, 2, 1, '1066063363', 'RAMON DAVID LOBO JACOME', NULL, NULL, '1997-02-21', NULL, 'rlobojacome21@gmail.com', NULL, '-1071243807', '2015-02-25', 1, NULL, NULL),
(19176, 2, 1, '13177847', 'RAMON DAVID QUINTERO SANGUINO', NULL, NULL, '1984-12-10', '0', 'sincorreo@sincorreo.com', NULL, '-1067355285', '2003-04-08', 1, NULL, NULL),
(19177, 2, 1, '1978917', 'RAMON DAVID SALAZAR RINCON', NULL, NULL, '1979-08-29', '0', 'radasa10@hotmail.com', NULL, '3204018506', '1998-03-16', 1, NULL, NULL),
(19178, 2, 1, '1733939', 'RAMON ELFIDO JACOME CARRASCAL', NULL, NULL, '1946-04-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1082421690', '1969-10-23', 1, NULL, NULL),
(19179, 2, 1, '5036196', 'RAMON ELI GALVIZ PALLARES', NULL, NULL, '1978-05-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1089410607', '1998-07-30', 1, NULL, NULL),
(19180, 2, 1, '88136102', 'RAMON ELIAS CONTRERAS AMAYA', NULL, NULL, '1962-11-23', '0', 'sincorreo@sincorreo.com', NULL, '-1048870878', '1981-06-22', 1, NULL, NULL),
(19181, 2, 1, '88279773', 'RAMON ELIGIO GUERRERO RUEDAS', NULL, NULL, '1974-08-18', '0', 'sincorreo@sincorreo.com', NULL, '-1187304824', '1992-10-28', 1, NULL, NULL),
(19182, 2, 1, '88143770', 'RAMON HELI CONDE AMAYA', NULL, NULL, '1968-12-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1078190853', '1988-07-25', 1, NULL, NULL),
(19183, 2, 1, '88141824', 'RAMON HERNANDO IBA?EZ RUEDA', NULL, NULL, '1968-09-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1137609523', '1986-10-23', 1, NULL, NULL),
(19184, 2, 1, '5036331', 'RAMON IVAN PABA GUEVARA', NULL, NULL, '1983-01-18', '0', 'sincorreo@sincorreo.com', NULL, '-1190713840', '2002-08-16', 1, NULL, NULL),
(19185, 2, 1, '12673016', 'RAMON JESUS ARCINIEGAS SUAREZ', NULL, NULL, '1953-11-30', '0', 'sincorreo@sincorreo.com', NULL, '-1087346898', '1975-10-22', 1, NULL, NULL),
(19186, 2, 1, '19745013', 'RAMON JESUS CHINCHILLA DUARTE', NULL, NULL, '1958-03-29', '0', 'sincorreo@sincorreo.com', NULL, '-1129220278', '1977-07-11', 1, NULL, NULL),
(19187, 2, 1, '1734990', 'RAMON JESUS QUINTERO DUARTE', NULL, NULL, '1933-03-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1142317101', '1956-07-17', 1, NULL, NULL),
(19188, 2, 1, '13374454', 'RAMON MARIA AMAYA MARTINEZ', NULL, NULL, '1960-04-16', '0', 'sincorreo@sincorreo.com', NULL, '-1142010752', '1993-09-07', 1, NULL, NULL),
(19189, 2, 1, '12583711', 'RAMON NONATO PONTON BOHORQUEZ', NULL, NULL, '1960-09-01', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1981-02-17', 1, NULL, NULL),
(19190, 2, 1, '36605004', 'RAMONA  JACOME JACOME', NULL, NULL, '1940-10-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1149804436', '1963-10-26', 1, NULL, NULL),
(19191, 2, 1, '37322498', 'RAMONA  ORTIZ RODRIGUEZ', NULL, NULL, '1969-08-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1188972840', '1988-09-27', 1, NULL, NULL),
(19192, 2, 1, '26780599', 'RAMONA DEL CARMEN CASTILLA', NULL, NULL, '1962-03-20', '0', 'sincorreo@sincorreo.com', NULL, '-1118932051', '1982-12-02', 1, NULL, NULL),
(19193, 2, 1, '27659493', 'RAMONA ELENA MENESES LOZANO', NULL, NULL, '1947-10-07', '-1162387390', 'sincorreo@sincorreo.com', NULL, NULL, '1973-09-18', 1, NULL, NULL),
(19194, 2, 1, '26774377', 'RAMONA ELENA PORTILLO DE MANOSALVA', NULL, NULL, '1941-02-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1150137574', '1969-03-26', 1, NULL, NULL),
(19195, 2, 1, '26864981', 'RAMONA EMILCE MEJIA RINCON', NULL, NULL, '1952-09-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1176825718', '1974-12-09', 1, NULL, NULL),
(19196, 2, 1, '1065568937', 'RAQUEL  PEÃ‘UELA ECHAVEZ', NULL, NULL, '1985-12-22', '0', 'raquelpenuela80@gmail.com', NULL, '-1151459243', '2004-04-20', 1, NULL, NULL),
(19197, 2, 1, '27660479', 'RAQUEL  SANTIAGO BECERRA', NULL, NULL, '1958-03-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1161252850', '1977-08-05', 1, NULL, NULL),
(19198, 2, 2, '1091182499', 'RAQUEL ANDREA REMOLINA OVALLOS', NULL, NULL, '1989-09-10', '0', 'raquelandrearemolinaovallos@gmail.com', NULL, '-1090775064', '2008-02-28', 1, NULL, NULL),
(19199, 2, 2, '27888091', 'RAQUEL YURANY TORRADO FLOREZ', NULL, NULL, '1983-04-15', '0', 'raqueltorrado35@gmail.com', NULL, '-1179926603', '2001-07-03', 1, NULL, NULL),
(19200, 2, 1, '2001998', 'RAUL  CARRASCAL', NULL, NULL, '1939-05-02', '0', 'sincorreo@sincorreo.com', NULL, '-1071763459', '1961-06-19', 1, NULL, NULL),
(19201, 2, 1, '13379448', 'RAUL  CASTRO QUINTERO', NULL, NULL, '1979-04-25', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1997-06-06', 1, NULL, NULL),
(19202, 2, 1, '1734054', 'RAUL  JACOME', NULL, NULL, '1954-01-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1182610831', '1975-06-02', 1, NULL, NULL),
(19203, 2, 1, '13809864', 'RAUL  SANCHEZ SANCHEZ', NULL, NULL, '1949-07-27', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1971-04-07', 1, NULL, NULL),
(19204, 2, 1, '13375390', 'RAUL ANTONIO SALAZAR', NULL, NULL, '1966-01-14', '0', 'sincorreo@gmail.com', NULL, '-1092895939', '1986-07-25', 1, NULL, NULL),
(19205, 2, 1, '5036103', 'RAUMIR  BARBOSA ANGARITA', NULL, NULL, '1977-01-22', '0', 'rb23329@gmail.com', NULL, '-1108175261', '1996-06-19', 1, NULL, NULL),
(19206, 2, 1, '37331838', 'REINA DIOSMIRA CLARO AREVALO', NULL, NULL, '1977-04-30', '0', 'sincorreo@sincorreo.com', NULL, '-1112796578', '1996-06-07', 1, NULL, NULL),
(19207, 2, 2, '88289777', 'REINALDO  MALDONADO SERRANO', NULL, NULL, '1976-02-17', '0', 'sincorreo@sincorreo.com', NULL, '-1151420828', '1997-06-13', 1, NULL, NULL),
(19208, 2, 1, '18923865', 'REINEL  VEGA VERA', NULL, NULL, '1969-10-19', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1989-10-04', 1, NULL, NULL),
(19209, 2, 1, '12663012', 'REINEL JESUS SANTIAGO LOZANO', NULL, NULL, '1951-11-01', '0', 'sincorreo@sincorreo.com', NULL, '-1162045040', '1975-06-26', 1, NULL, NULL),
(19210, 2, 1, '5035358', 'REMIGIO  GALVIZ PACHECO', NULL, NULL, '1967-09-23', '0', 'sincorreo@sincorreo.com', NULL, '-1189939204', '1986-11-11', 1, NULL, NULL),
(19211, 2, 1, '1066062475', 'RENE ALEIXER PORTILLO GOMEZ', NULL, NULL, '1990-04-12', NULL, 'ALEXISPORTILLO91@HOTMAIL.COM', NULL, '-1150919359', '2008-04-24', 1, NULL, NULL),
(19212, 2, 1, '77189800', 'RICARDO ALBERTO PERAZA SUAREZ', NULL, NULL, '1977-03-09', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1995-12-19', 1, NULL, NULL),
(19213, 1, 1, '1066062049', 'RICARDO CELEDON GALVIS DUARTE', NULL, NULL, '2004-02-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1170346763', '2011-03-29', 1, NULL, NULL),
(19214, 2, 1, '18903512', 'RICHARD ADONIAS MIRANDA TORRES', NULL, NULL, '1976-05-10', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1994-10-31', 1, NULL, NULL),
(19215, 2, 1, '91261608', 'RICHARD DE JESUS CRUZ MARQUEZ', NULL, NULL, '1968-11-14', NULL, 'rjcm14@hotmail.com', NULL, '-1116021548', '1987-02-05', 1, NULL, NULL),
(19216, 2, 2, '1005085785', 'RITO ANTONIO OVALLOS OVALLOS', NULL, NULL, '2000-08-10', '0', 'sincorreo@sincorreo.com', NULL, '-1067353818', '2018-08-13', 1, NULL, NULL),
(19217, 2, 1, '1091656134', 'ROBBINSSON SALVADOR PAREDES SANCHEZ', NULL, NULL, '1987-04-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1160102001', '2005-05-12', 1, NULL, NULL),
(19218, 2, 1, '1003257538', 'ROBER  PICON CARRASCAL', NULL, NULL, '2000-08-09', '0', 'sincorreo@sincorreo.com', NULL, '-1069649032', '2018-08-23', 1, NULL, NULL),
(19219, 2, 1, '5084588', 'ROBERT  OSORIO RINCON', NULL, NULL, '1970-07-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1072870996', '1988-08-29', 1, NULL, NULL),
(19220, 1, 1, '1064086107', 'ROBERTH ALEXANDER BARBOSA DURAN', NULL, NULL, '2004-12-20', '0', 'sincorreo@sincorreo.com', NULL, '-1171407789', '2019-02-01', 1, NULL, NULL),
(19221, 2, 1, '12504179', 'ROBERTO  SERRANO ROPERO', NULL, NULL, '1982-10-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1158337378', '2002-02-14', 1, NULL, NULL),
(19222, 2, 1, '5047673', 'ROBINSON  GRIMALDO PASSO', NULL, NULL, '1977-12-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1139493451', '1996-03-26', 1, NULL, NULL),
(19223, 2, 1, '1066063555', 'ROBINSON  MADARIAGA OSORIO', NULL, NULL, '1998-08-18', '0', 'robin18osorio@gmail.com', NULL, '-1128747390', '2016-08-31', 1, NULL, NULL),
(19224, 2, 1, '5036322', 'ROBINSON  MANDON MANDON', NULL, NULL, '1984-12-17', '0', 'sincorreo@sincorreo.com', NULL, '-1180402977', '2002-12-17', 1, NULL, NULL),
(19225, 2, 1, '1004864112', 'ROCIO TORCOROMA MENESES SUAREZ', NULL, NULL, '1986-01-22', '0', 'rociomeneses221@gmail.com', NULL, '-1089394492', '2004-09-03', 1, NULL, NULL),
(19226, 2, 1, '1003121974', 'RONAL FRANKLY ANGARITA FRANCO', NULL, NULL, '2003-08-19', '0', 'angaritaronald140@gmail.com', NULL, '-1071037280', '2021-08-26', 1, NULL, NULL),
(19227, 2, 1, '1003257453', 'RONALD ALEXANDER GALVIZ GARCIA', NULL, NULL, '2002-08-04', '0', 'galvisronald41@gmail.com', NULL, '-1060228262', '2020-08-14', 1, NULL, NULL),
(19228, 2, 1, '1065818693', 'RONALD FERCHELY QUINTERO ARIAS', NULL, NULL, '1995-09-27', '0', 'quintero.rf3@gmail.com', NULL, '-1292792780', '2013-10-01', 1, NULL, NULL),
(19229, 2, 1, '1003121904', 'ROOZLIN YISELA CARRILLO PICON', NULL, NULL, '1999-12-07', '0', 'rooslincarrillo@gmail.com', NULL, '-1072833184', '2018-04-11', 1, NULL, NULL),
(19230, 2, 1, '88283608', 'ROQUE  AMAYA CASTRO', NULL, NULL, '1977-08-29', '0', 'sincorreo@sincorreo.com', NULL, '-1092123898', '1995-11-28', 1, NULL, NULL),
(19231, 2, 1, '5035627', 'ROQUE ALIRIS DUARTE PORTILLO', NULL, NULL, '1974-08-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1170081169', '1992-12-23', 1, NULL, NULL),
(19232, 2, 1, '1066062349', 'ROQUE ANTONIO PINEDA DUARTE', NULL, NULL, '1988-08-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1170636280', '2007-02-16', 1, NULL, NULL),
(19233, 2, 1, '26777400', 'ROQUE ELVIRA DUARTE GOMEZ', NULL, NULL, '1982-05-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1082635818', '2001-11-07', 1, NULL, NULL),
(19234, 2, 1, '88283086', 'ROQUE HELI AMAYA CASTRO', NULL, NULL, '1977-03-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1171462143', '1995-06-13', 1, NULL, NULL),
(19235, 2, 1, '26780594', 'ROQUELINA  RIOS RIOS', NULL, NULL, '1959-08-16', '0', 'sincorreo@sincorreo.com', NULL, '-1160491352', '1978-10-18', 1, NULL, NULL),
(19236, 2, 1, '26774256', 'ROSA  BOHORQUEZ DE ANGARITA', NULL, NULL, '1939-05-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1190309285', '1961-12-18', 1, NULL, NULL),
(19237, 2, 1, '26774622', 'ROSA AMINTA IBARRA RUEDAS', NULL, NULL, '1956-05-11', '0', 'sincorreo@sincorreo.com', NULL, '-1129279238', '1979-10-30', 1, NULL, NULL),
(19238, 1, 1, '1092734447', 'ROSA ANGELICA DUARTE GALVIZ', NULL, NULL, '2008-04-12', '0', 'rduartegalviz@gmail.com', NULL, '-1152296692', '2015-05-04', 1, NULL, NULL),
(19239, 2, 2, '1093776631', 'ROSA ANGELICA FLOREZ LLANES', NULL, NULL, '1994-12-19', '99999999', 'raflorez1994@gmail.com', NULL, '-1181324450', '2013-01-25', 1, NULL, NULL),
(19240, 2, 1, '26777359', 'ROSA CAROLINA MAESTRE IZQUIERDO', NULL, NULL, '1975-11-21', '0', 'sincorreo@sincorreo.com', NULL, '-1090355742', '2003-11-14', 1, NULL, NULL),
(19241, 2, 1, '26779716', 'ROSA DELIA SOTO LOPEZ', NULL, NULL, '1951-05-12', '0', 'sincorreo@sincorreo.com', NULL, '-1187826771', '1974-01-21', 1, NULL, NULL),
(19242, 2, 1, '37332532', 'ROSA ELENA ANGARITA SALAZAR', NULL, NULL, '1976-06-06', '0', 'sincorreo@sincorreo.com', NULL, '-1065601337', '1997-01-23', 1, NULL, NULL),
(19243, 2, 1, '37327297', 'ROSA ELENA CARRASCAL PRADO', NULL, NULL, '1971-05-05', '0', 'sincorreo@sincorreo.com', NULL, '-1091844335', '1992-12-03', 1, NULL, NULL),
(19244, 2, 1, '37337298', 'ROSA ELENA SANTANA CONTRERAS', NULL, NULL, '1978-10-10', '0', 'sincorreo@sincorreo.com', NULL, '-1152419246', '2000-03-07', 1, NULL, NULL),
(19245, 2, 1, '23630118', 'ROSA ELVIA PI?EROS ORJUELA', NULL, NULL, '1984-10-22', '0', 'sincorreo@sincorreo.com', NULL, '-1108671050', '2003-02-28', 1, NULL, NULL),
(19246, 2, 1, '26774928', 'ROSA EMID RUEDAS RINCON', NULL, NULL, '1972-07-16', '0', 'sincorreo@sincorreo.com', NULL, '-1148068118', '1990-10-24', 1, NULL, NULL),
(19247, 2, 1, '26774646', 'ROSA EMILIA DUARTE DE GARCIA', NULL, NULL, '1960-02-15', '0', 'red142008@hotmail.com', NULL, '-1138773912', '1980-07-29', 1, NULL, NULL),
(19248, 2, 1, '63548130', 'ROSA ENITH ESCOBAR DAZA', NULL, NULL, '1984-03-30', NULL, 'dios8myfamily1402@gmail.com', NULL, '-1087539143', '2002-04-04', 1, NULL, NULL),
(19249, 2, 1, '37322008', 'ROSA NEIDA GAONA PEÃ‘ARANDA', NULL, NULL, '1966-05-09', '0', 'gaonaneida@gmail.com', NULL, '-1142182555', '1988-04-14', 1, NULL, NULL),
(19250, 2, 1, '37369651', 'ROSABEL  SUAREZ', NULL, NULL, '1966-05-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1138269303', '1994-06-20', 1, NULL, NULL),
(19251, 2, 1, '37327214', 'ROSALBA  BACCA VEGA', NULL, NULL, '1974-09-23', NULL, 'linamailo125@gmail.com', NULL, '-1112270162', '1992-12-03', 1, NULL, NULL),
(19252, 2, 1, '37311814', 'ROSALBA  CARVAJALINO BAYONA', NULL, NULL, '1958-08-25', '0', 'sincorreo@sincorreo.com', NULL, '-1169848012', '1977-12-22', 1, NULL, NULL),
(19253, 2, 2, '63561896', 'ROSALBA  CORREDOR LOPEZ', NULL, NULL, '1983-10-06', '0', 'karitopalacios.16@hotmail.com', NULL, '-1081637154', '2003-07-30', 1, NULL, NULL),
(19254, 2, 1, '37371154', 'ROSALBA  GALVAN', NULL, NULL, '1978-06-11', '0', 'rosalvagalvan07@gmail.com', NULL, '-1079709364', '1999-03-18', 1, NULL, NULL),
(19255, 2, 1, '26777332', 'ROSALBA  LOPEZ PINZON', NULL, NULL, '1973-12-05', '0', 'sincorreo@sincorreo.com', NULL, '-1072314387', '2000-02-29', 1, NULL, NULL),
(19256, 2, 1, '37328086', 'ROSALBA  NAVARRO CONTRERAS', NULL, NULL, '1974-11-10', '0', 'rosalbanavarrocontreras@gmail.com', NULL, '-1111005861', '1993-07-28', 1, NULL, NULL),
(19257, 2, 1, '26774913', 'ROSALBA  PACHECO ORTEGA', NULL, NULL, '1971-09-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1191769784', '1989-11-08', 1, NULL, NULL),
(19258, 2, 1, '37321655', 'ROSALBA  PEREZ', NULL, NULL, '1966-12-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1112261233', '1987-11-20', 1, NULL, NULL),
(19259, 2, 1, '26775031', 'ROSALVA  CONTRERAS SOLANO', NULL, NULL, '1974-05-07', '0', 'rochyoro0619_@hotmail.com', NULL, '-1118091940', '1993-09-02', 1, NULL, NULL),
(19260, 2, 1, '26775023', 'ROSALVA  MENDOZA RINCON', NULL, NULL, '1971-05-29', '0', 'sincorreo@sincorreo.com', NULL, '-1127105827', '1993-06-08', 1, NULL, NULL),
(19261, 2, 1, '37326026', 'ROSELIA  CHINCHILLA CHINCHILLA', NULL, NULL, '1963-05-09', '0', 'sincorreo@sincorreo.com', NULL, '-1138724615', '1991-07-27', 1, NULL, NULL),
(19262, 2, 1, '26774702', 'ROSELIA  GALVIS PACHECO', NULL, NULL, '1963-07-15', '0', 'galvisroselia37@gmail.com', NULL, '-1142478676', '1982-09-20', 1, NULL, NULL),
(19263, 2, 1, '26774740', 'ROSELIA  SANTIAGO CONTRERAS', NULL, NULL, '1965-03-02', '0', 'sincorreo@sincorreo.com', NULL, '-1182347288', '1983-09-12', 1, NULL, NULL),
(19264, 2, 1, '26774324', 'ROSELINA  BALLESTEROS DE MOLINA', NULL, NULL, '1937-01-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1176220870', '1965-07-21', 1, NULL, NULL),
(19265, 2, 1, '1066062211', 'ROSIRIS  RUEDAS IBARRA', NULL, NULL, '1986-11-03', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2006-03-01', 1, NULL, NULL),
(19266, 2, 1, '5036343', 'ROSME FARID MOLINA GAONA', NULL, NULL, '1984-06-16', '0', 'rosmemolinagaona@gmail.com', NULL, '-1081437219', '2002-10-25', 1, NULL, NULL),
(19267, 2, 1, '37323806', 'ROSMIRA  VEGA SANJUAN', NULL, NULL, '1971-05-26', '0', 'sincorreo@sincorreo.com', NULL, '-1120251176', '1989-10-10', 1, NULL, NULL),
(19268, 2, 1, '1735095', 'RUBEN  QUINTERO LOPEZ', NULL, NULL, '1954-01-03', '0', 'sincorreo@sincorreo.com', NULL, '-1170697071', '1975-07-15', 1, NULL, NULL),
(19269, 2, 1, '1066063436', 'RUBEN ANDREY PABA RINCON', NULL, NULL, '1997-09-04', '0', 'sincorreo@sincorreo.com', NULL, '-1108072290', '2015-09-07', 1, NULL, NULL),
(19270, 2, 1, '5035308', 'RUBEN ANTONIO BALLESTEROS MOLINA', NULL, NULL, '1964-02-07', '0', 'sincorreo@sincorreo.com', NULL, '-1080112038', '1985-04-18', 1, NULL, NULL),
(19271, 2, 1, '13379612', 'RUBEN DARIO DUARTE RIOS', NULL, NULL, '1979-07-19', NULL, 'rubenduarte19@hotmail.com', NULL, '-1121390393', '1997-11-26', 1, NULL, NULL),
(19272, 2, 1, '1091682822', 'RUBEN DARIO JACOME FELIZZOLA', NULL, NULL, '1999-08-31', NULL, 'dario_1999_7@hotmail.com', NULL, '-1075038704', '2017-10-03', 1, NULL, NULL),
(19273, 2, 1, '1066062844', 'RUBEN EDUARDO BALLESTEROS PABA', NULL, NULL, '1993-01-03', '0', 'sincorreo@sincorreo.com', NULL, '-1161755892', '2011-04-08', 1, NULL, NULL),
(19274, 2, 1, '88135610', 'RUBEN EMIRO PALLARES PEREZ', NULL, NULL, '1962-09-15', '0', 'sincorreo@sincorreo.com', NULL, '-1186087927', '1980-10-28', 1, NULL, NULL),
(19275, 2, 1, '1003121947', 'RUBEN JOSE PEREZ QUINTERO', NULL, NULL, '2002-03-04', '0', 'rubenjoseperezquintero@gmail.com', NULL, '-1159993419', '2020-08-25', 1, NULL, NULL),
(19276, 2, 1, '88142566', 'RUBER  CARRASCAL QUINTERO', NULL, NULL, '1968-06-25', '0', 'sincorreo@sincorreo.com', NULL, '-1170624903', '1987-06-09', 1, NULL, NULL),
(19277, 2, 1, '37334443', 'RUBI ZENET GARCIA DUARTE', NULL, NULL, '1973-09-01', '0', 'sincorreo@sincorreo.com', NULL, '-1092122928', '1998-02-24', 1, NULL, NULL),
(19278, 2, 1, '1005063291', 'RUBIELA  BECERRA CARRASCAL', NULL, NULL, '1991-10-20', '0', 'rubybc11@gmail.com', NULL, '-1188869233', '2010-04-20', 1, NULL, NULL),
(19279, 2, 1, '27660230', 'RUBIELA DEL CARMEN BAUTISTA DE GARCIA', NULL, NULL, '1957-12-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1086429995', '1977-05-14', 1, NULL, NULL),
(19280, 2, 1, '26780596', 'RUMALDA  CASTRO DUARTE', NULL, NULL, '1958-03-06', '0', 'rumaldacastro@hotmail.com', NULL, '-1142370098', '1979-02-26', 1, NULL, NULL),
(19281, 2, 1, '88281157', 'RUMALDO  GUERRERO', NULL, NULL, '1974-10-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1179819998', '1993-12-12', 1, NULL, NULL),
(19282, 2, 1, '37322672', 'RUTH  MANZANO MANZANO', NULL, NULL, '1969-03-09', '-1122656812', 'ruthmanzanom03@gmail.com', NULL, NULL, '1988-11-08', 1, NULL, NULL),
(19283, 2, 1, '49772193', 'RUTH DARY TRESPALACIOS ESTRADA', NULL, NULL, '1973-10-31', '5819924', 'jacome012@gmail.com', NULL, '-1168750918', '1992-10-26', 1, NULL, NULL),
(19284, 2, 1, '53894398', 'RUTH ESTER GARCIA SANCHEZ', NULL, NULL, '1984-06-08', '0', 'ruthestergarciasanchez@gmail.com', NULL, '-1186093904', '2003-09-01', 1, NULL, NULL),
(19285, 2, 1, '26774550', 'RUTH MARINA CLARO ANGARITA', NULL, NULL, '1957-03-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1149484145', '1976-01-17', 1, NULL, NULL),
(19286, 2, 1, '88136701', 'SAEN ANTONIO MOLINA MORA', NULL, NULL, '1963-09-12', '0', 'sincorreo@sincorreo.com', NULL, '-1086436084', '1981-11-04', 1, NULL, NULL),
(19287, 2, 1, '88141814', 'SAID  AVENDA?O MORA', NULL, NULL, '1968-07-05', NULL, 'saidavendao@hotmail.com', NULL, '-1141374508', '1986-10-23', 1, NULL, NULL),
(19288, 2, 1, '5084441', 'SAID  BARBOSA SARAVIA', NULL, NULL, '1969-01-10', NULL, 'saidbarbosas@gmail.com', NULL, NULL, '1987-04-14', 1, NULL, NULL),
(19289, 2, 1, '88144995', 'SAID  BOHORQUEZ SERRANO', NULL, NULL, '1971-03-02', '0', 'bohorquezd480@gmail.com', NULL, '-1081619689', '1989-05-17', 1, NULL, NULL),
(19290, 2, 1, '88284151', 'SAID  MENESES PINEDA', NULL, NULL, '1977-02-13', '0', 'sincorreo@sincorreo.com', NULL, '-1067756922', '1996-06-07', 1, NULL, NULL),
(19291, 2, 1, '5035285', 'SAID  MOLINA MORA', NULL, NULL, '1965-12-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1178315596', '1984-08-23', 1, NULL, NULL),
(19292, 2, 1, '12668026', 'SAID  QUINTERO LOZANO', NULL, NULL, '1956-04-22', '0', 'sincorreo@sincorreo.com', NULL, '-1110226057', '1977-03-09', 1, NULL, NULL),
(19293, 2, 1, '5035632', 'SAID  RIVERA VARGAS', NULL, NULL, '1975-02-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1150767189', '1993-03-26', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(19294, 2, 1, '1098758579', 'SAID ANDRES AVENDA?O LOZANO', NULL, NULL, '1994-07-26', NULL, 'saidandresmix01@gmail.com', NULL, '-1086698246', '2012-08-15', 1, NULL, NULL),
(19295, 2, 1, '13373835', 'SAID DEL CARMEN PICON ROMERO', NULL, NULL, '1963-03-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1092876307', '1981-07-29', 1, NULL, NULL),
(19296, 2, 1, '18927109', 'SALVADOR  ANGARITA AGUILAR', NULL, NULL, '1973-04-10', '0', 'sincorreo@sincorreo.com', NULL, '-1180125893', '1993-02-05', 1, NULL, NULL),
(19297, 2, 1, '5036015', 'SAMUEL  GARZON SANCHEZ', NULL, NULL, '1937-06-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1082758659', '1959-09-10', 1, NULL, NULL),
(19298, 2, 1, '1066062455', 'SAMUEL ARCESIO GARZON RUEDA', NULL, NULL, '1990-02-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1141919397', '2008-02-21', 1, NULL, NULL),
(19299, 2, 1, '1003121933', 'SAMUEL EMIRO QUINTERO MANZANO', NULL, NULL, '2001-06-30', '0', 'samuelemiroquintero@gmail.com', NULL, '-1188319080', '2019-08-27', 1, NULL, NULL),
(19300, 1, 1, '1066062451', 'SAMUEL JOSE OSORIO RUEDAS', NULL, NULL, '2007-10-04', '0', 'samuelruedas44@gmail.com', NULL, '-1121971935', '2014-10-14', 1, NULL, NULL),
(19301, 1, 1, '1064086097', 'SAMUEL MAURICIO OSORIO NAVARRO', NULL, NULL, '2004-11-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1080233421', '2019-01-21', 1, NULL, NULL),
(19302, 2, 1, '26777308', 'SANDRA  ARCINIEGAS SANTIAGO', NULL, NULL, '1978-12-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1075406409', '1999-03-02', 1, NULL, NULL),
(19303, 2, 1, '1091672142', 'SANDRA  DURAN RODRIGUEZ', NULL, NULL, '1994-06-14', NULL, 'duransandra827@gmail.com', NULL, '-1146055498', '2012-09-13', 1, NULL, NULL),
(19304, 2, 1, '26777215', 'SANDRA  QUINTERO PALLARES', NULL, NULL, '1978-06-15', '0', 'sincorreo@sincorreo.com', NULL, '-1186798821', '1997-06-11', 1, NULL, NULL),
(19305, 2, 1, '1007283127', 'SANDRA  SUAREZ TARAZONA', NULL, NULL, '1986-05-03', '0', 'sincorreo@sincorreo.com', NULL, '-1092608927', '2006-05-03', 1, NULL, NULL),
(19306, 2, 1, '26777460', 'SANDRA  TORO TORO', NULL, NULL, '1983-05-23', '0', 'sincorreo@sincorreo.com', NULL, '-1081003584', '2003-05-05', 1, NULL, NULL),
(19307, 2, 1, '1090387712', 'SANDRA LILIANA CONTRERAS NAVARRO', NULL, NULL, '1987-11-12', '0', 'sandralilianacontreras12@hotmail.com', NULL, '-1120426994', '2005-11-21', 1, NULL, NULL),
(19308, 2, 1, '37328838', 'SANDRA LILIANA VERGEL', NULL, NULL, '1974-10-08', '0', 'vergelsandraliliana30@gmail.com', NULL, '-1112715093', '1994-02-07', 1, NULL, NULL),
(19309, 2, 1, '63449663', 'SANDRA MARCELA MEZA', NULL, NULL, '1977-07-25', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1996-02-20', 1, NULL, NULL),
(19310, 2, 1, '1091657708', 'SANDRA MARIA NIETO VEGA', NULL, NULL, '1987-07-22', '0', 'snieto876@gmail.com', NULL, '-1192370479', '2005-11-17', 1, NULL, NULL),
(19311, 2, 1, '37336307', 'SANDRA MILENA BARBOSA', NULL, NULL, '1981-02-19', NULL, 'misandra.lau@hotmail.com', NULL, '-1065840689', '1999-08-13', 1, NULL, NULL),
(19312, 2, 1, '1065580874', 'SANDRA MILENA CONTRERAS PRADO', NULL, NULL, '1986-06-13', '0', 'sincorreo@sincorreo.com', NULL, '-1091211489', '2005-03-08', 1, NULL, NULL),
(19313, 2, 1, '37336661', 'SANDRA MILENA LOBO BOHORQUEZ', NULL, NULL, '1981-10-22', '0', 'sandralobo2at@gmail.com', NULL, '-1120859537', '1999-11-23', 1, NULL, NULL),
(19314, 2, 1, '39045713', 'SANDRA MILENA LOBO QUINTERO', NULL, NULL, '1979-02-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1171042638', '1997-05-22', 1, NULL, NULL),
(19315, 2, 1, '26774979', 'SANDRA MILENA MANOSALVA DUARTE', NULL, NULL, '1971-03-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1176098887', '1992-03-09', 1, NULL, NULL),
(19316, 2, 1, '1066063004', 'SANDRA MILENA PEÃ‘ARANDA TORRADO', NULL, NULL, '1992-07-16', '0', 'sincorreo@sincorreo.com', NULL, '-1140799302', '2012-05-23', 1, NULL, NULL),
(19317, 2, 1, '1091658878', 'SANDRA MILENA PEREZ PEREZ', NULL, NULL, '1986-03-17', NULL, 'yelinysamay7@gmail.com', NULL, '-1151032029', '2006-08-08', 1, NULL, NULL),
(19318, 2, 1, '37321865', 'SANDRA PATRICIA QUINTERO MANOSALVA', NULL, NULL, '1969-05-16', '0', 'patiquinman@gmail.com', NULL, '-1170842792', '1987-12-14', 1, NULL, NULL),
(19319, 1, 1, '1003121983', 'SANDRITH LORENA CARRE?O RODRIGUEZ', NULL, NULL, '2001-11-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1170214159', '2016-02-09', 1, NULL, NULL),
(19320, 1, 1, '1064086101', 'SANTIAGO  REYES ORTEGA', NULL, NULL, '2004-11-20', NULL, 'santiagoreyesortega1@gmail.com', NULL, '-1112607221', '2019-01-14', 1, NULL, NULL),
(19321, 2, 1, '1733880', 'SANTIAGO DE JESUS CASADIEGOS MANZANO', NULL, NULL, '1945-06-02', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1967-05-18', 1, NULL, NULL),
(19322, 2, 1, '13178019', 'SANTOS DIONOR ANGARITA QUINTERO', NULL, NULL, '1984-11-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1149449272', '2003-05-27', 1, NULL, NULL),
(19323, 2, 1, '26774612', 'SARA EMILIA MOLINA DE CERVANTES', NULL, NULL, '1949-03-29', '0', 'sincorreo@sincorreo.com', NULL, '-1149044256', '1978-10-18', 1, NULL, NULL),
(19324, 2, 1, '37368389', 'SARAY  GARZON ZAMBRANO', NULL, NULL, '1953-07-15', '0', 'sincorreo@sincorreo.com', NULL, '-1131636299', '1989-10-27', 1, NULL, NULL),
(19325, 2, 1, '5035124', 'SAUL  DUARTE GARCIA', NULL, NULL, '1959-11-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1092908356', '1979-12-09', 1, NULL, NULL),
(19326, 2, 1, '88140800', 'SAUL  SERRANO ANGARITA', NULL, NULL, '1967-01-01', '0', 'sincorreo@sincorreo.com', NULL, '-1080727077', '1985-09-16', 1, NULL, NULL),
(19327, 2, 1, '5458798', 'SAUL ANTONIO GARCIA GARCIA', NULL, NULL, '1951-02-01', '0', 'sicorreo@sincorreo.com', NULL, '-1090558623', '1979-09-12', 1, NULL, NULL),
(19328, 2, 1, '1003257813', 'SEBASTIAN  LOBO CASTILLA', NULL, NULL, '2002-04-05', '0', 'sjpml12345@gmail.com', NULL, '-1140710762', '2020-07-22', 1, NULL, NULL),
(19329, 1, 1, '1066062054', 'SEBASTIAN  RUEDAS RINCON', NULL, NULL, '2003-10-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1190455505', '2017-08-11', 1, NULL, NULL),
(19330, 2, 1, '37372490', 'SEBASTIANA  MANDON QUINTERO', NULL, NULL, '1980-07-05', '0', 'sincorreo@sincorreo.com', NULL, '-1092698253', '2002-06-04', 1, NULL, NULL),
(19331, 2, 1, '1065905712', 'SERGIO  CORONEL CALLEJAS', NULL, NULL, '1995-07-30', '0', 'sincorreo@sincorreo.com', NULL, '-1077985900', '2013-12-11', 1, NULL, NULL),
(19332, 2, 1, '1066063229', 'SERGIO  SOLANO RUEDAS', NULL, NULL, '1995-12-25', NULL, 'sergiosolanoruedas@gmail.com', NULL, '-1142303782', '2014-01-16', 1, NULL, NULL),
(19333, 2, 1, '1066062298', 'SERGIO ANDRES BOHORQUEZ MENDOZA', NULL, NULL, '1988-09-10', '0', 'sergiobohorquez1@gmail.com', NULL, '-1140650324', '2006-09-22', 1, NULL, NULL),
(19334, 2, 1, '1091663016', 'SERGIO ANDRES LOPEZ LOPEZ', NULL, NULL, '1989-11-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2008-02-15', 1, NULL, NULL),
(19335, 2, 1, '1066062297', 'SERGIO ANDRES ROPERO DUARTE', NULL, NULL, '1988-05-10', '0', 'sergiorpdt@gmail.com', NULL, '-1116233784', '2006-09-22', 1, NULL, NULL),
(19336, 2, 1, '5035626', 'SERGIO ARMANDO ASCANIO GARCIA', NULL, NULL, '1974-10-25', '0', 'serasca125@gmail.com', NULL, '-1131980458', '1992-12-23', 1, NULL, NULL),
(19337, 2, 1, '1090989295', 'SERGIO DAVID TORRES PACHECO', NULL, NULL, '1995-12-04', '0', '', NULL, '-1188551175', '2014-03-18', 1, NULL, NULL),
(19338, 1, 1, '1066062331', 'SHAROLL VANESA ORTIZ DUARTE', NULL, NULL, '2006-12-22', '0', 'sincorreo@sincorreo.com', NULL, '-1075834535', '2014-01-07', 1, NULL, NULL),
(19339, 2, 1, '44191517', 'SHIRLEY  CORRO RODRIGUEZ', NULL, NULL, '1983-02-08', '0', 'sincorreo@sincorreo.com', NULL, '-1070336990', '2003-03-25', 1, NULL, NULL),
(19340, 1, 1, '1013102585', 'SHIRLEY VANESSA GARCIA QUINTERO', NULL, NULL, '2004-10-27', '0', 'shirleyvanessagarciaquintero@gmail.com', NULL, '-1125051400', '2012-11-29', 1, NULL, NULL),
(19341, 2, 1, '79789952', 'SIDNEY FRANKLIN MORA ROSADO', NULL, NULL, '1976-12-14', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1995-02-11', 1, NULL, NULL),
(19342, 2, 1, '1066063059', 'SIFRED  MANZANO BOHORQUEZ', NULL, NULL, '1994-09-30', '0', 'sincorreo@sincorreo.com', NULL, '-1167360783', '2012-10-03', 1, NULL, NULL),
(19343, 2, 1, '5035302', 'SIFRED  MENDOZA QUINTERO', NULL, NULL, '1966-11-28', '0', 'sifredmendoza@gmail.com', NULL, '-1171169014', '1985-01-22', 1, NULL, NULL),
(19344, 2, 1, '37335286', 'SILENNY  GALVIS QUINTERO', NULL, NULL, '1980-09-20', NULL, 'silennygq@hotmail.com', NULL, '-1151043234', '1998-11-11', 1, NULL, NULL),
(19345, 2, 1, '1003257495', 'SILENY  SOLANO NORIEGA', NULL, NULL, '1991-02-16', NULL, 'sileny1691@gmail.com', NULL, '-1170897805', '2009-05-07', 1, NULL, NULL),
(19346, 2, 1, '1066062674', 'SILVIA JOHANA MOLINA QUINTERO', NULL, NULL, '1991-06-11', '0', 'erickjoseph06@hotmail.com', NULL, '-1160443921', '2009-08-14', 1, NULL, NULL),
(19347, 2, 1, '1066062780', 'SILVIA PATRICIA VEGA MANZANO', NULL, NULL, '1992-08-29', '0', 'vegamanzano29@gmail.com', NULL, '-1190566847', '2010-09-08', 1, NULL, NULL),
(19348, 2, 1, '26774762', 'SILVIA ROSA GOMEZ ROPERO', NULL, NULL, '1961-08-30', '0', 'sincorreo@sincorreo.com', NULL, '-1070999580', '1983-12-12', 1, NULL, NULL),
(19349, 2, 1, '1066062687', 'SILVIA YOANA AMAYA LEMUS', NULL, NULL, '1991-08-15', '0', 'siyoamale23@gmail.com', NULL, '-1126579016', '2009-09-10', 1, NULL, NULL),
(19350, 2, 1, '37320289', 'SIMONA MARIA BARBOSA QUINTERO', NULL, NULL, '1949-02-24', '0', 'sincorreo@sincorreo.com', NULL, '-1128246417', '1986-08-22', 1, NULL, NULL),
(19351, 2, 1, '1066062525', 'SINDY LORENA QUINTERO JACOME', NULL, NULL, '1990-05-13', '0', 'sincorreo@sincorreo.com', NULL, '-1076134060', '2008-09-19', 1, NULL, NULL),
(19352, 2, 1, '1066063019', 'SINDY LORENA ROPERO JOYA', NULL, NULL, '1994-04-26', '0', 'roperojoya26@gmail.com', NULL, '-1066034411', '2012-07-05', 1, NULL, NULL),
(19353, 2, 1, '1098780413', 'SLENDY FERNANDA VEGA AREVALO', NULL, NULL, '1995-04-23', '0', 'slefe_230495@hotmail.es', NULL, '-1132701629', '2014-02-05', 1, NULL, NULL),
(19354, 2, 1, '37334077', 'SLENDY TORCOROMA GARCIA DUARTE', NULL, NULL, '1979-10-24', '5613839', 'sincorreo@sincorreo.com', NULL, '-1110720666', '1997-12-17', 1, NULL, NULL),
(19355, 2, 1, '52219515', 'SLENY  DE LA CRUZ PEREZ', NULL, NULL, '1974-02-03', '0', 'cruzsofia2008@hotmail.com', NULL, '-1169838355', '1992-03-16', 1, NULL, NULL),
(19356, 2, 1, '27764348', 'SOFIA  QUINTERO', NULL, NULL, '1950-08-02', '0', 'sincorreo@sincorreo.com', NULL, '-1139018870', '1974-01-03', 1, NULL, NULL),
(19357, 2, 1, '52497524', 'SOFIA  SANTANA OSORIO', NULL, NULL, '1979-06-28', NULL, 'sofiasantanao@hotmail.com', NULL, NULL, '1997-08-26', 1, NULL, NULL),
(19358, 2, 1, '1090985619', 'SOL MARY ANGARITA GALVIS', NULL, NULL, '1990-03-18', '0', 'solmariangarita@gmail.com', NULL, '-1076269503', '2008-06-04', 1, NULL, NULL),
(19359, 2, 1, '26774595', 'SOLANGEL  GALVIS BOHORQUEZ', NULL, NULL, '1954-08-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1138218048', '1977-09-26', 1, NULL, NULL),
(19360, 2, 2, '37330534', 'SONIA  FLOREZ CASTILLA', NULL, NULL, '1969-12-26', '0', 'sincorreo@sincorreo.com', NULL, '-1150508145', '1995-05-30', 1, NULL, NULL),
(19361, 2, 1, '26774938', 'SONIA  LOZANO CABRALES', NULL, NULL, '1972-09-29', '0', 'sonialc2972@gmail.com', NULL, '-1119685326', '1991-02-13', 1, NULL, NULL),
(19362, 2, 1, '26775067', 'SONIA  MANOSALVA DUARTE', NULL, NULL, '1973-08-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1086427040', '1994-10-31', 1, NULL, NULL),
(19363, 2, 1, '26777261', 'SONIA  RUEDAS CONTRERAS', NULL, NULL, '1977-09-05', '0', 'ruedassonia261@gmail.com', NULL, '-1070198215', '1997-08-25', 1, NULL, NULL),
(19364, 2, 1, '63360069', 'SONIA DEL CARMEN LOBO ARCINIEGAS', NULL, NULL, '1970-05-25', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1989-03-31', 1, NULL, NULL),
(19365, 2, 1, '26774951', 'SONIA ESTER SANTIAGO CASTILLA', NULL, NULL, '1971-06-10', '0', 'sonia_santiago2714@hotmail.com', NULL, '-1186267175', '1991-05-28', 1, NULL, NULL),
(19366, 2, 1, '26775045', 'SONIA MARIA MANZANO BARBOSA', NULL, NULL, '1974-10-06', '0', 'soniamanzano.6@hotmail.com', NULL, '-1141011187', '1993-11-30', 1, NULL, NULL),
(19367, 2, 1, '26774831', 'SONIA TORCOROMA ARIAS MADARIAGA', NULL, NULL, '1969-12-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1071370172', '1988-04-26', 1, NULL, NULL),
(19368, 2, 1, '37372425', 'SORAIDA  CARRASCAL SOLANO', NULL, NULL, '1984-02-28', '0', 'soraidacarrascal84@gmail.com', NULL, '-1192778958', '2002-03-20', 1, NULL, NULL),
(19369, 2, 1, '1065651755', 'SORAINES PAOLA GALVIS GARCIA', NULL, NULL, '1991-11-07', '0', 'paogalvis07@hotmail.com', NULL, '-787959391', '2011-04-25', 1, NULL, NULL),
(19370, 2, 1, '26777331', 'SORAYDA  DUARTE PORTILLO', NULL, NULL, '1979-07-21', '0', 'sincorreo@sincorreo.com', NULL, '-1079318800', '2000-02-29', 1, NULL, NULL),
(19371, 2, 1, '37312339', 'SORFELINA  SUAREZ MENESES', NULL, NULL, '1959-06-28', '0', 'sincorreo@sincorreo.com', NULL, '-1181432120', '1978-11-04', 1, NULL, NULL),
(19372, 1, 1, '1003257473', 'STEYBIN ARMANDO CARRILLO SANTIAGO', NULL, NULL, '2002-12-30', NULL, 'steybinc@gmail.com', NULL, '-1126540573', '2017-03-08', 1, NULL, NULL),
(19373, 2, 1, '1010062593', 'SULEIDY  RAMIREZ RIVERA', NULL, NULL, '1995-07-03', NULL, 'RAMIREZSULEIDI671@GMAIL.COM', NULL, '-1170658916', '2014-10-29', 1, NULL, NULL),
(19374, 2, 1, '26777301', 'SUREIDA  JACOME MENESES', NULL, NULL, '1977-07-04', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1999-02-05', 1, NULL, NULL),
(19375, 2, 1, '26777405', 'TANIA ISABEL SANTIAGO CASTRO', NULL, NULL, '1981-03-19', '0', 'huaweipsmart67@gmail.com', NULL, '-1118129007', '2001-12-14', 1, NULL, NULL),
(19376, 1, 1, '1064710936', 'TANIA LORENA DAVILA NORIEGA', NULL, NULL, '2006-08-08', '0', 'sicorreo@sincorreo.com', NULL, '-1072769748', '2014-01-10', 1, NULL, NULL),
(19377, 2, 1, '1018494491', 'TATIANA ALEJANDRA GARCIA TORO', NULL, NULL, '1997-04-30', '0', 'tatigarciat@hotmail.com', NULL, '-1076436937', '2015-06-02', 1, NULL, NULL),
(19378, 2, 1, '1091677605', 'TATIANA MARCELA CASTRO LEON', NULL, NULL, '1997-01-24', '0', 'tatis2401@hotmail.es', NULL, '-1169365716', '2015-01-27', 1, NULL, NULL),
(19379, 2, 1, '26774298', 'TELMIRA  DUARTE SANTIAGO', NULL, NULL, '1900-12-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1900-12-30', 1, NULL, NULL),
(19380, 2, 1, '19672104', 'TEODORO  SOLANO RODRIGUEZ', NULL, NULL, '1964-07-22', '0', 'sincorreo@sincorreo.com', NULL, '-1106037418', '1985-12-09', 1, NULL, NULL),
(19381, 2, 1, '26774380', 'TEODOSIA  JACOME LEMUS', NULL, NULL, '1944-03-22', NULL, 'sincorreo@sincorreo.com', NULL, '-1122197767', '1969-03-26', 1, NULL, NULL),
(19382, 2, 1, '26774477', 'TERESA  CONTRERAS DE NAVARRO', NULL, NULL, '1951-11-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1080312476', '1974-01-21', 1, NULL, NULL),
(19383, 2, 1, '26774344', 'TERESA DE JESUS CHINCHILLA DE DUARTE', NULL, NULL, '1942-12-18', '0', 'sincorreo@sincorreo.com', NULL, '-1159535515', '1967-03-21', 1, NULL, NULL),
(19384, 2, 1, '27761290', 'TERESA DE JESUS QUINTERO CASTILLA', NULL, NULL, '1943-01-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1070223991', '1967-12-17', 1, NULL, NULL),
(19385, 2, 1, '1091682606', 'THALIA MILDRED TRIGOS ORTIZ', NULL, NULL, '1999-07-19', '0', 'thali190@hotmail.com', NULL, '-1150498459', '2017-08-11', 1, NULL, NULL),
(19386, 2, 1, '26774994', 'TILSIA  CASTILLA MOLINA', NULL, NULL, '1974-05-17', NULL, 'tilciacastimol94@gmail.com', NULL, '-1139977006', '1992-08-20', 1, NULL, NULL),
(19387, 2, 1, '1733914', 'TOMAS ANTONIO MOLINA MANOSALVA', NULL, NULL, '1946-12-20', '0', 'sincorreo@sincorreo.com', NULL, '-1142020035', '1969-01-16', 1, NULL, NULL),
(19388, 2, 1, '13373804', 'TOMAS ANTONIO TORO QUINTERO', NULL, NULL, '1963-04-20', NULL, 'lebinsontoro@gmail.com', NULL, '-1089322685', '1981-06-16', 1, NULL, NULL),
(19389, 2, 1, '26777375', 'TORCOMA  ANGARITA DUARTE', NULL, NULL, '1983-03-29', '0', 'torcoromangarita@gmail.com', NULL, '-1118078029', '2001-03-29', 1, NULL, NULL),
(19390, 2, 1, '26777361', 'TORCOROMA  BONETH PABA', NULL, NULL, '1981-12-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1160115092', '2000-09-28', 1, NULL, NULL),
(19391, 2, 1, '37331454', 'TORCOROMA  CONTRERAS NAVARRO', NULL, NULL, '1976-09-14', '0', 'sincorreo@sincorreo.com', NULL, '-1182514186', '1996-01-24', 1, NULL, NULL),
(19392, 2, 1, '1090982037', 'TORCOROMA  DELGADO DUARTE', NULL, NULL, '1985-12-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1182084463', '2004-03-17', 1, NULL, NULL),
(19393, 2, 1, '1091653897', 'TORCOROMA  DUARTE PORTILLO', NULL, NULL, '1985-11-17', '0', 'sincorreo@sincorreo.com', NULL, '-1092579656', '2004-08-19', 1, NULL, NULL),
(19394, 2, 1, '26774708', 'TORCOROMA  GARCIA DUARTE', NULL, NULL, '1964-07-27', '0', 'torco64@gmail.com', NULL, '-1186259368', '1982-09-20', 1, NULL, NULL),
(19395, 2, 1, '37328614', 'TORCOROMA  GARCIA TORRES', NULL, NULL, '1975-10-22', '0', 'tandy1203@hotmail.com', NULL, '-1119436106', '1993-12-13', 1, NULL, NULL),
(19396, 2, 1, '26777426', 'TORCOROMA  NAVARRO SANTIAGO', NULL, NULL, '1981-12-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1182208052', '2002-05-03', 1, NULL, NULL),
(19397, 2, 1, '26775059', 'TORCOROMA  QUINTERO LOZANO', NULL, NULL, '1974-05-01', '0', 'torcoromaquintero376@gmail.com', NULL, '-1187033224', '1994-06-20', 1, NULL, NULL),
(19398, 2, 1, '26774881', 'TORCOROMA  RUEDAS IBARRA', NULL, NULL, '1970-10-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1117207451', '1989-01-30', 1, NULL, NULL),
(19399, 2, 1, '37314682', 'TORCOROMA  SANJUAN PEREZ', NULL, NULL, '1962-03-05', '0', 'torcoromasanjuanperez@gmail.com', NULL, '-1106048353', '1980-11-20', 1, NULL, NULL),
(19400, 2, 1, '26777172', 'TORCOROMA  SOLANO ANGARITA', NULL, NULL, '1977-04-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1126189849', '1996-07-05', 1, NULL, NULL),
(19401, 2, 1, '26777268', 'TORCOROMA  VERA CHINCHILLA', NULL, NULL, '1979-01-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1091927505', '1997-11-25', 1, NULL, NULL),
(19402, 2, 1, '5035237', 'TRINIDAD ANTONIO GALVIZ PALLARES', NULL, NULL, '1962-10-24', '-1156607509', 'sincorreo@sincorreo.com', NULL, NULL, '1983-01-11', 1, NULL, NULL),
(19403, 2, 1, '1733893', 'TRINO  JACOME LEMUS', NULL, NULL, '1945-05-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1159536019', '1967-12-17', 1, NULL, NULL),
(19404, 2, 1, '12673004', 'TRINO ANTONIO CONTRERAS NAVARRO', NULL, NULL, '1943-08-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1088218571', '1965-05-05', 1, NULL, NULL),
(19405, 2, 1, '12663006', 'TRINO ANTONIO SANCHEZ DUARTE', NULL, NULL, '1946-02-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1152376040', '1967-08-18', 1, NULL, NULL),
(19406, 2, 1, '26779576', 'TULIA  SOTO DE PAREDES', NULL, NULL, '1933-12-07', '0', 'sincorreo@sincorreo.com', NULL, '-1126738225', '1956-07-24', 1, NULL, NULL),
(19407, 2, 1, '88284070', 'UBER  ALVAREZ RODRIGUEZ', NULL, NULL, '1978-01-12', NULL, 'sincorreo@sincorreo.com', NULL, '-1120745632', '1996-03-12', 1, NULL, NULL),
(19408, 2, 1, '5471846', 'UBER ANTONIO DUARTE QUINTERO', NULL, NULL, '1980-12-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1150385210', '2000-12-14', 1, NULL, NULL),
(19409, 2, 1, '5036232', 'UBER JESUS MANDON HERNANDEZ', NULL, NULL, '1980-12-25', '0', 'ubermandon4@gmail.com', NULL, '-1068381844', '1999-10-22', 1, NULL, NULL),
(19410, 2, 1, '1064836138', 'URIEL  CARDENAS JIMENEZ', NULL, NULL, '1985-09-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2004-03-16', 1, NULL, NULL),
(19411, 2, 1, '13376457', 'URIEL ANGEL DURAN NAVARRO', NULL, NULL, '1969-02-03', '0', 'sincorreo@sincorreo.com', NULL, '-1087491590', '1988-10-07', 1, NULL, NULL),
(19412, 2, 1, '88143746', 'URIEL ANTONIO PEDROZA VILA', NULL, NULL, '1970-04-20', NULL, 'adrozepleirusac@hotmail.com', NULL, '-1061019399', '1988-06-07', 1, NULL, NULL),
(19413, 2, 1, '88284171', 'URIELSON  BOHORQUEZ SERRANO', NULL, NULL, '1977-12-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1191286521', '1996-06-07', 1, NULL, NULL),
(19414, 1, 1, '1064086133', 'VALENTINA  BOHORQUEZ SANTIAGO', NULL, NULL, '2005-03-31', NULL, 'bohorquezv03@gmail.com', NULL, '-789815221', '2012-06-21', 1, NULL, NULL),
(19415, 1, 1, '1092730231', 'VALENTINA  CARRASCAL CASTRO', NULL, NULL, '2004-03-06', NULL, 'carrascalcastrov@gmail.com', NULL, '-1160377548', '2018-03-20', 1, NULL, NULL),
(19416, 2, 1, '1003238878', 'VALERIA YALITH ASCANIO SANTANA', NULL, NULL, '2003-05-12', '0', 'ascaniovaleria12@gmail.com', NULL, '-1116828385', '2021-06-23', 1, NULL, NULL),
(19417, 1, 1, '1003121949', 'VANESSA ALEXANDRA SERRANO CHINCHILLA', NULL, NULL, '2001-10-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1062832645', '2015-11-25', 1, NULL, NULL),
(19418, 2, 1, '1091678077', 'VERONICA  GARZON RUEDA', NULL, NULL, '1996-12-25', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2015-04-27', 1, NULL, NULL),
(19419, 1, 1, '1064086136', 'VERONICA ISABEL VERA LEBOLO', NULL, NULL, '2005-07-26', '0', 'veronicaisabel2607@gmail.com', NULL, '-1118409954', '2012-10-16', 1, NULL, NULL),
(19420, 2, 1, '1066062332', 'VERONICA LILIANA CARRASCAL PABA', NULL, NULL, '1988-08-30', '0', 'sincorreo@sincorreo.com', NULL, '-1176091112', '2007-01-12', 1, NULL, NULL),
(19421, 2, 1, '26775028', 'VIANEY DEL SOCORRO CONTRERAS MANZANO', NULL, NULL, '1972-06-17', '0', 'sincorreo@sincorreo.com', NULL, '-1067316642', '1993-08-19', 1, NULL, NULL),
(19422, 2, 1, '37322483', 'VIANNY LORENA OSORIO DUARTE', NULL, NULL, '1970-01-16', '0', 'osodu1970@hotmail.com', NULL, '-1089306672', '1988-09-27', 1, NULL, NULL),
(19423, 2, 1, '5035230', 'VICENTE  PACHECO QUINTERO', NULL, NULL, '1963-01-18', '0', 'sincorreo@sincorreo.com', NULL, '-1129495549', '1982-11-08', 1, NULL, NULL),
(19424, 2, 1, '1066063323', 'VICTOR ALFONSO CONTRERAS LOBO', NULL, NULL, '1996-08-31', '0', 'sincorreo@sincorreo.com', NULL, '-1187173990', '2014-11-12', 1, NULL, NULL),
(19425, 2, 1, '5419570', 'VICTOR AUGUSTO UZCATEGUI CARRERO', NULL, NULL, '1978-12-06', '0', '', NULL, '-1071009816', '2021-12-27', 1, NULL, NULL),
(19426, 2, 1, '5035297', 'VICTOR JULIO DUARTE GALVIZ', NULL, NULL, '1963-02-03', '0', 'sincorreo@sincorreo.com', NULL, '-1126762158', '1985-01-10', 1, NULL, NULL),
(19427, 2, 1, '13373773', 'VICTOR JULIO LERECITH CASTRO', NULL, NULL, '1900-12-30', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1922-12-30', 1, NULL, NULL),
(19428, 2, 1, '5035048', 'VICTOR JULIO MOLINA DUARTE', NULL, NULL, '1958-05-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1082100373', '1977-03-09', 1, NULL, NULL),
(19429, 2, 1, '5035317', 'VICTOR MANUEL NAVARRO MENDOZA', NULL, NULL, '1965-06-04', '0', 'sincorreo@sincorreo.com', NULL, '-1071362189', '1985-08-30', 1, NULL, NULL),
(19430, 2, 1, '18903749', 'VICTOR MANUEL SANCHEZ BARBOSA', NULL, NULL, '1978-10-26', NULL, 'vimanuels@hotmail.com', NULL, NULL, '1997-03-26', 1, NULL, NULL),
(19431, 2, 1, '1091657472', 'VICTOR MANUEL SANTIAGO PALLARES', NULL, NULL, '1986-07-09', '0', 'sincorrreo@sincorreogmail.com', NULL, '-1092890965', '2005-10-20', 1, NULL, NULL),
(19432, 2, 1, '49650084', 'VICTORIA  MOLINA DUARTE', NULL, NULL, '1953-04-28', '5622242', 'toyitamolina@hotmail.com', NULL, '-1107238208', '1977-07-12', 1, NULL, NULL),
(19433, 2, 1, '1090462534', 'VICTORIANO  DOMINGUEZ LOPEZ', NULL, NULL, '1993-04-11', '0', 'sincorreo@sincorreo.com', NULL, '-1147220320', '2011-05-02', 1, NULL, NULL),
(19434, 2, 1, '1066062064', 'VILBRETH  QUINTERO CHINCHILLA', NULL, NULL, '1986-03-18', '0', 'sincorreo@sincorreo.com', NULL, '-1161714618', '2004-04-30', 1, NULL, NULL),
(19435, 2, 1, '37337372', 'VILMA ESTHER BARBOSA ROBLES', NULL, NULL, '1981-04-20', NULL, 'jayez2008@hotmail.com', NULL, '-1152289900', '2000-03-13', 1, NULL, NULL),
(19436, 2, 1, '26777235', 'VIRGELINA  BELTRAN SANCHEZ', NULL, NULL, '1971-02-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1176025445', '1997-05-28', 1, NULL, NULL),
(19437, 2, 1, '1091652284', 'VIRGELINA  GRANADOS GRANADOS', NULL, NULL, '1984-04-25', '0', 'sincorreo@sincorreo.com', NULL, '-1152789112', '2004-02-02', 1, NULL, NULL),
(19438, 2, 1, '49556274', 'VIRGELMA  CARDENAS CA?IZARES', NULL, NULL, '1970-04-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1187477514', '1997-07-23', 1, NULL, NULL),
(19439, 2, 1, '37369508', 'VIRGELMA  PABA JACOME', NULL, NULL, '1967-05-15', '0', 'sincorreo@sincorreo.com', NULL, '-1086913836', '1993-09-30', 1, NULL, NULL),
(19440, 2, 1, '36600010', 'VIRGINIA  QUINTERO DE MOLINA', NULL, NULL, '1949-12-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1086613854', '1975-06-26', 1, NULL, NULL),
(19441, 2, 1, '26777459', 'VIVIANA  MANOSALVA MANZANO', NULL, NULL, '1985-03-23', '0', 'vmanosalvam@yahoo.es', NULL, '-1128456235', '2003-05-05', 1, NULL, NULL),
(19442, 2, 1, '1090478337', 'VIVIANA ANDREA ANGARITA BARRERA', NULL, NULL, '1994-06-08', NULL, 'viandre0806@hotmail.com', NULL, '-1076958780', '2012-07-09', 1, NULL, NULL),
(19443, 2, 1, '88278004', 'VOLMAR  RINCON LEON', NULL, NULL, '1973-01-23', '0', 'volmarrinconleon@gmail.com', NULL, '-1182036739', '1991-02-12', 1, NULL, NULL),
(19444, 2, 1, '37180090', 'WBALDINA  CONTRERAS ROMERO', NULL, NULL, '1982-02-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1075483812', '2001-09-18', 1, NULL, NULL),
(19445, 2, 1, '5036340', 'WILBER  JACOME GUTIERREZ', NULL, NULL, '1984-04-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1150510966', '2002-10-01', 1, NULL, NULL),
(19446, 2, 1, '5035082', 'WILBERTH FRANCISCO GARCIA SANCHEZ', NULL, NULL, '1959-05-02', '0', 'wilberth_59@hotmail.com', NULL, '-1085514074', '1978-03-03', 1, NULL, NULL),
(19447, 2, 1, '5468703', 'WILFRED  BAYONA RUEDA', NULL, NULL, '1980-05-29', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1998-12-01', 1, NULL, NULL),
(19448, 2, 1, '1066062929', 'WILFREDO  ARCINIEGAS QUINTERO', NULL, NULL, '1993-11-27', NULL, 'sincorreo@sincorreo.com', NULL, '-1160188050', '2011-12-27', 1, NULL, NULL),
(19449, 2, 1, '1004981250', 'WILFREDO  PEREZ TORRADO', NULL, NULL, '1992-05-10', NULL, 'jaidemachado19@gmail.com', NULL, '-1169396080', '2010-05-12', 1, NULL, NULL),
(19450, 2, 1, '77097051', 'WILFREDO  RINCON VANEGAS', NULL, NULL, '1984-12-13', '0', 'sincorreo@sincorreo.com', NULL, '-1072549628', '2003-07-23', 1, NULL, NULL),
(19451, 2, 1, '5035698', 'WILFREDO  URIBE MOLINA', NULL, NULL, '1977-06-12', '0', 'wilurimol@gmail.com', NULL, '-1127553566', '1995-08-29', 1, NULL, NULL),
(19452, 2, 1, '1933055', 'WILFRIDO HUMBERTO SILVA HIGUERA', NULL, NULL, '1952-09-24', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1974-01-02', 1, NULL, NULL),
(19453, 2, 1, '88278747', 'WILIAN  BALLESTEROS NAVARRO', NULL, NULL, '1972-05-23', '0', 'wilianballesteros@gmail.com', NULL, '-1127919711', '1991-11-07', 1, NULL, NULL),
(19454, 2, 1, '13378976', 'WILLIAM  DURAN DURAN', NULL, NULL, '1975-10-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1160077198', '1996-02-20', 1, NULL, NULL),
(19455, 2, 1, '88143264', 'WILLIAM  PEREZ NAVARRO', NULL, NULL, '1969-11-08', '0', 'williampereznavarro5@gmail.com', NULL, '-1171143392', '1987-12-14', 1, NULL, NULL),
(19456, 2, 1, '88137977', 'WILLIAM  QUINTERO', NULL, NULL, '1964-10-25', '0', 'sincorreo@sincorreo.com', NULL, '-1140660849', '1983-01-17', 1, NULL, NULL),
(19457, 2, 1, '13379085', 'WILLIAM  SANTIAGO GUEVARA', NULL, NULL, '1978-02-24', '0', 'sincorreo@sincorreo.com', NULL, '-1070371665', '1996-06-07', 1, NULL, NULL),
(19458, 2, 1, '88143250', 'WILLIAM  VEGA SANJUAN', NULL, NULL, '1969-09-03', '0', 'sincorreo@sincorreo.com', NULL, '-1152450824', '1987-12-14', 1, NULL, NULL),
(19459, 2, 1, '5035043', 'WILLIAM DE JESUS RUEDA IBARRA', NULL, NULL, '1958-03-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1190081920', '1977-03-09', 1, NULL, NULL),
(19460, 2, 1, '13377411', 'WILLIAM DEL CARMEN BARBOSA RIOS', NULL, NULL, '1973-02-11', NULL, 'sincorreo@sincorreo.com', NULL, '-1106851756', '1991-11-08', 1, NULL, NULL),
(19461, 2, 1, '1066063599', 'WILLIAM JESUS LOBO LOBO', NULL, NULL, '1998-11-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1170183031', '2017-01-03', 1, NULL, NULL),
(19462, 2, 1, '5469610', 'WILLIAN  GOMEZ VANEGAS', NULL, NULL, '1979-09-29', NULL, 'sincorreo@sincorreo.com', NULL, '-1108390933', '1999-07-21', 1, NULL, NULL),
(19463, 2, 1, '1066062288', 'WILLIAN ANDRES RUEDAS ASCANIO', NULL, NULL, '1988-03-30', '0', 'andresruedas12345@gmail.com', NULL, '-1110615287', '2007-03-07', 1, NULL, NULL),
(19464, 2, 1, '5471437', 'WILLIAN FERNANDO RUEDAS RODRIGUEZ', NULL, NULL, '1982-08-11', '0', 'sincorreo@sincorreo.com', NULL, '-1111742793', '2000-08-25', 1, NULL, NULL),
(19465, 2, 1, '1091663377', 'WILLMAR ALFONSO CONTRERAS PORTILLO', NULL, NULL, '1989-09-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1061335173', '2008-04-07', 1, NULL, NULL),
(19466, 2, 1, '91352124', 'WILLYAM  CARRILLO BARBOSA', NULL, NULL, '1980-06-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1092070233', '1998-09-04', 1, NULL, NULL),
(19467, 2, 1, '13176808', 'WILMAR  NAVARRO CASTRO', NULL, NULL, '1983-06-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1080678694', '2002-08-28', 1, NULL, NULL),
(19468, 2, 1, '1066062590', 'WILMAR  QUINTERO PALLARES', NULL, NULL, '1990-11-02', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2009-02-25', 1, NULL, NULL),
(19469, 2, 1, '1066062265', 'WILMER  FRANCO CASADIEGO', NULL, NULL, '1988-05-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1080804077', '2007-02-16', 1, NULL, NULL),
(19470, 1, 1, '1092174162', 'WILNER ALEXIS ARIZA DUARTE', NULL, NULL, '2003-11-25', NULL, 'sincorreo@sincorreo.com', NULL, '-1286386808', '2013-07-27', 1, NULL, NULL),
(19471, 2, 1, '1090985978', 'WILSON  PE?ARANDA PE?ARANDA', NULL, NULL, '1990-08-11', NULL, 'wipe14@hotmail.com', NULL, '-1162704866', '2008-10-22', 1, NULL, NULL),
(19472, 2, 1, '13374692', 'WILSON SAUL SANGUINO FUENTES', NULL, NULL, '1966-01-25', '0', 'sincorreo@sincorreo.com', NULL, '-1170211346', '1984-07-04', 1, NULL, NULL),
(19473, 2, 1, '1091661519', 'WILSON YAMIT PACHECO CHINCHILLA', NULL, NULL, '1989-05-27', NULL, 'sonwil_pch@hotmail.com', NULL, '-1108566435', '2007-07-12', 1, NULL, NULL),
(19474, 2, 1, '88283614', 'WUALTER ALEXANDER PORTILLO BOHORQUEZ', NULL, NULL, '1977-11-10', '0', 'sincorreo@sincorreo.com', NULL, '-1079842586', '1995-11-29', 1, NULL, NULL),
(19475, 2, 1, '77192951', 'WUILBER EMIRO CARRASCAL GARCIA', NULL, NULL, '1978-11-19', NULL, 'wuilberecg@gmail.com', NULL, '-1129985504', '1996-12-14', 1, NULL, NULL),
(19476, 2, 1, '5036108', 'WUILSON  MANOSALVA FELIZZOLA', NULL, NULL, '1977-11-22', '0', 'sincorreo@sincorreo.com', NULL, '-1179531612', '1996-07-12', 1, NULL, NULL),
(19477, 1, 1, '1064086145', 'XIOMARA  ANGARITA FRANCO', NULL, NULL, '2005-10-03', '0', 'sincorreo@sincorreo.com', NULL, '-1151083391', '2012-11-29', 1, NULL, NULL),
(19478, 2, 1, '49640001', 'YADIRA  GARCIA SANCHEZ', NULL, NULL, '1955-04-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1136771867', '1976-01-17', 1, NULL, NULL),
(19479, 2, 1, '37330758', 'YADIRA  ORTEGA LOZANO', NULL, NULL, '1977-05-10', '0', 'yadiraortegalozano@gmail.com', NULL, '-1138323312', '1995-08-20', 1, NULL, NULL),
(19480, 2, 1, '37330717', 'YADIVE  ORTIZ SANCHEZ', NULL, NULL, '1974-12-10', '0', 'sincorreo@sincorreo.com', NULL, '-1089931499', '1995-08-28', 1, NULL, NULL),
(19481, 2, 1, '1004822214', 'YAIDER  ORTIZ BECERRA', NULL, NULL, '2001-06-27', '0', 'sicorreo@sincorreo.com', NULL, '-1082685149', '2020-03-11', 1, NULL, NULL),
(19482, 2, 1, '18973886', 'YAIR  CARRASCAL TORRES', NULL, NULL, '1978-01-19', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1998-02-13', 1, NULL, NULL),
(19483, 1, 1, '1091652272', 'YAIRA KATHERINE PAREDES VEGA', NULL, NULL, '2003-12-30', '0', 'sincorreo@sincorreo.com', NULL, '-1067317391', '2018-02-22', 1, NULL, NULL),
(19484, 2, 1, '1067590177', 'YAIRETH XILENA MARTINEZ CHINCHILLA', NULL, NULL, '2003-11-16', '0', 'martinezyaireth80@gmail.com', NULL, '-1062771377', '2021-11-18', 1, NULL, NULL),
(19485, 2, 1, '1066062574', 'YALEIDA  PACHECO VEGA', NULL, NULL, '1990-07-03', NULL, 'yalepave365@hotmail.com', NULL, '-1080217747', '2009-01-19', 1, NULL, NULL),
(19486, 2, 1, '1004943420', 'YALEXA  RINCON RINCON', NULL, NULL, '1994-06-02', NULL, 'yalexa0206@hotmail.com', NULL, '-1128750033', '2013-07-03', 1, NULL, NULL),
(19487, 2, 1, '1048270192', 'YAMID ENRIQUE BOHORQUEZ PACHECO', NULL, NULL, '1987-09-18', NULL, 'bohorquez.ye@hotmail.com', NULL, '-1179664149', '2005-10-05', 1, NULL, NULL),
(19488, 2, 1, '5470141', 'YAMID HERNANDO PEREZ MELO', NULL, NULL, '1981-10-02', '0', 'cargatu@hotmail.com', NULL, '-1109520969', '1999-11-05', 1, NULL, NULL),
(19489, 2, 1, '26774987', 'YAMILE  CASTILLA MOLINA', NULL, NULL, '1973-07-26', '0', 'sincorreo@sincorreo.com', NULL, '-1122795821', '1992-05-28', 1, NULL, NULL),
(19490, 2, 1, '1065890526', 'YAMILE  CONTRERAS PABON', NULL, NULL, '1995-04-09', NULL, 'yamii91995@gmail.com', NULL, '-1138550430', '2013-04-18', 1, NULL, NULL),
(19491, 2, 1, '37181794', 'YAMILE  DUARTE DUARTE', NULL, NULL, '1984-10-25', '0', 'sincorreo@sincorreo.com', NULL, '-788871877', '2002-11-18', 1, NULL, NULL),
(19492, 2, 1, '1091657126', 'YAMILE  GUERRERO PAEZ', NULL, NULL, '1987-03-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1118049055', '2005-09-06', 1, NULL, NULL),
(19493, 2, 1, '51715347', 'YAMILE  LANZIANO BOHORQUEZ', NULL, NULL, '1960-03-04', '5636020', 'sincorreo@sincorreo.com', NULL, '-1142848130', '1982-08-15', 1, NULL, NULL),
(19494, 2, 1, '37328661', 'YAMILE  MORA PICON', NULL, NULL, '1975-09-24', '0', 'yamopi74@hotmail.com', NULL, '-1109030676', '1993-12-13', 1, NULL, NULL),
(19495, 2, 1, '37322861', 'YAMILE  QUINTANA PITTA', NULL, NULL, '1970-01-16', NULL, 'yamileqp@hotmail.com', NULL, '-1111232044', '1989-01-12', 1, NULL, NULL),
(19496, 2, 1, '27741546', 'YAMILE  RODRIGUEZ RINCON', NULL, NULL, '1972-02-04', '0', 'sincorreo@sincorreo.com', NULL, '-1091455847', '1992-06-10', 1, NULL, NULL),
(19497, 2, 1, '1091654054', 'YAMILE  SOLANO CASTRO', NULL, NULL, '1986-06-12', '0', 'yamilesolanocastro12@gmail.com', NULL, '-1141885488', '2004-09-07', 1, NULL, NULL),
(19498, 2, 1, '26861020', 'YAMILE DEL SOCORRO FLOREZ DE CACERES', NULL, NULL, '1952-01-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1139565254', '1973-09-03', 1, NULL, NULL),
(19499, 2, 1, '1004859261', 'YAN CARLOS LAZARO PACHECO', NULL, NULL, '1995-09-02', NULL, 'jhacarloslazaro95@hotmail.com', NULL, '-1132495095', '2014-01-24', 1, NULL, NULL),
(19500, 2, 1, '37338954', 'YANED  AMAYA ROMERO', NULL, NULL, '1982-03-20', '0', 'yanedamayaromero@gmail.com', NULL, '-1119723286', '2001-02-01', 1, NULL, NULL),
(19501, 2, 1, '37370910', 'YANED ROCIO SANTIAGO BECERRA', NULL, NULL, '1980-02-12', '0', 'sincorreo@sincorreo.com', NULL, '-1081770859', '1998-05-05', 1, NULL, NULL),
(19502, 2, 1, '1007321133', 'YANEIDA  RAMIREZ SANTIAGO', NULL, NULL, '1997-04-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1150710326', '2015-05-08', 1, NULL, NULL),
(19503, 2, 1, '1003257543', 'YANEIDIS PATRICIA SERRANO MENDOZA', NULL, NULL, '2000-07-28', '0', 'yaneidisserrano9@gmail.com', NULL, '-1117239782', '2018-06-01', 1, NULL, NULL),
(19504, 2, 1, '37338713', 'YANEISY  SANTIAGO RUEDAS', NULL, NULL, '1982-02-19', NULL, 'yaneisysantiago@hotmail.com', NULL, '-1111074376', '2000-12-13', 1, NULL, NULL),
(19505, 2, 1, '60354513', 'YANETH  BAYONA RINCON', NULL, NULL, '1969-10-16', NULL, 'sincorreo@sincorreo.com', NULL, '-1189864744', '1991-05-27', 1, NULL, NULL),
(19506, 2, 1, '1091665892', 'YANETH  CASTRO AMAYA', NULL, NULL, '1991-07-15', '0', 'ycastroamaya@gmail.com', NULL, '-1156037600', '2009-07-17', 1, NULL, NULL),
(19507, 2, 1, '37391357', 'YANETH  DUARTE DUARTE', NULL, NULL, '1982-06-14', '0', 'yanethduarte357@gmail.com', NULL, '-1170900322', '2002-04-10', 1, NULL, NULL),
(19508, 2, 1, '1007324911', 'YANETH  LOPEZ CARDENAS', NULL, NULL, '1991-05-07', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2011-01-12', 1, NULL, NULL),
(19509, 2, 1, '37328003', 'YANETH  MADARIAGA MONTEJO', NULL, NULL, '1975-04-26', '-1182581684', 'ymadariaga@yahoo.es', NULL, '-1182581684', '1993-06-15', 1, NULL, NULL),
(19510, 2, 1, '37181274', 'YANETH  VEGA SANJUAN', NULL, NULL, '1981-09-24', '0', 'vegasanjuany@gmail.com', NULL, '-1112419263', '2002-07-26', 1, NULL, NULL),
(19511, 2, 1, '37367304', 'YANETH CECILIA MARTINEZ SOLANO', NULL, NULL, '1967-10-28', '0', 'yamaso1967@gmail.com', NULL, '-1111407393', '1986-09-23', 1, NULL, NULL),
(19512, 1, 1, '1092176624', 'YANIETH KATERIN ROMERO MANOSALVA', NULL, NULL, '2005-08-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1192294983', '2019-08-29', 1, NULL, NULL),
(19513, 2, 1, '26777448', 'YANIRA  SERRANO BASTOS', NULL, NULL, '1983-08-16', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2000-11-03', 1, NULL, NULL),
(19514, 2, 1, '26777303', 'YANIRY  DURAN PEREZ', NULL, NULL, '1979-12-29', '0', 'miniduranp@gmail.com', NULL, '-1138585391', '1999-02-09', 1, NULL, NULL),
(19515, 2, 1, '1066063169', 'YARINETH ELIANA VANEGAS QUINTERO', NULL, NULL, '1995-06-05', '0', 'yarinethvanegas5@gmail.com', NULL, '-1082575309', '2013-08-05', 1, NULL, NULL),
(19516, 2, 1, '1066062397', 'YARITZA MAYDARE MANOSALVA QUINTANA', NULL, NULL, '1989-06-17', NULL, 'yarxm@hotamial.com', NULL, '-1137267233', '2007-06-27', 1, NULL, NULL),
(19517, 2, 1, '1091656826', 'YARLYS JOHANNA GALVIS GARCIA', NULL, NULL, '1985-01-05', '0', 'yarlysj12@gmail.com', NULL, '-1062745123', '2005-08-02', 1, NULL, NULL),
(19518, 2, 1, '26777294', 'YASENIA  JOYA SANTIAGO', NULL, NULL, '1980-08-24', NULL, 'sincorreo@sincorreo.com', NULL, '-1092664156', '1998-08-27', 1, NULL, NULL),
(19519, 2, 1, '1018462958', 'YASMIEIDE  SOLANO RUEDAS', NULL, NULL, '1993-09-18', NULL, 'yasmeidesolano@gmail.com', NULL, '-1067034738', '2011-11-01', 1, NULL, NULL),
(19520, 2, 1, '37323568', 'YASMIN  ORTIZ ORTIZ', NULL, NULL, '1971-04-15', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1989-08-31', 1, NULL, NULL),
(19521, 2, 1, '37331011', 'YASMIN  QUINTERO RINCON', NULL, NULL, '1974-04-26', '0', 'sincorreo@sincorreo.com', NULL, '-1091181865', '1995-10-24', 1, NULL, NULL),
(19522, 2, 1, '26777197', 'YASMINE  RODRIGUEZ GUTIERREZ', NULL, NULL, '1978-05-12', '0', 'sincorreo@sincorreo.com', NULL, '-1080722639', '1996-07-05', 1, NULL, NULL),
(19523, 2, 1, '1003121988', 'YASNEIDY  CHINCHILLA GOMEZ', NULL, NULL, '2002-02-03', '0', 'yasneidychinchilla12@gmail.com', NULL, '-1075090438', '2020-07-16', 1, NULL, NULL),
(19524, 2, 1, '88136891', 'YEBRAIL  ALVAREZ PRADO', NULL, NULL, '1963-03-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1080736609', '1981-12-14', 1, NULL, NULL),
(19525, 2, 1, '1066062531', 'YECENIA  VERA CONTRERAS', NULL, NULL, '1990-01-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1088720037', '2008-09-29', 1, NULL, NULL),
(19526, 2, 1, '1066063032', 'YECSON  DUARTE ANGARITA', NULL, NULL, '1994-07-16', '0', 'sincorreo@sincorreo.com', NULL, '-1187143624', '2012-08-03', 1, NULL, NULL),
(19527, 2, 1, '1090988101', 'YECSON  VERA PORTILLO', NULL, NULL, '1993-03-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1066423824', '2012-02-06', 1, NULL, NULL),
(19528, 1, 1, '1066062456', 'YEFERSON  ROMERO LOZANO', NULL, NULL, '2008-01-22', '0', 'yefersonromero22rl@gmail.com', NULL, '-1186548010', '2015-06-18', 1, NULL, NULL),
(19529, 2, 1, '26777365', 'YEGNY BIBIANA LOZANO ANGARITA', NULL, NULL, '1982-11-09', '0', 'yeggny@gmail.com', NULL, '-1131381155', '2001-01-18', 1, NULL, NULL),
(19530, 2, 1, '1066062843', 'YEI JANDERSON JACOME JACOME', NULL, NULL, '1993-03-16', '0', 'sincorreo@sincorreo.com', NULL, '-1092888051', '2011-04-07', 1, NULL, NULL),
(19531, 2, 1, '1007320906', 'YEINE  TORO TORO', NULL, NULL, '1993-02-20', '0', 'sincorreo@sincorreo.com', NULL, '-1080614473', '2011-03-07', 1, NULL, NULL),
(19532, 2, 1, '37180453', 'YEINNY  MENESES', NULL, NULL, '1982-06-01', NULL, 'yeinizz@gmail.com', NULL, '-1152457944', '2001-12-10', 1, NULL, NULL),
(19533, 2, 1, '1091661875', 'YEINY AZTRITH GAONA MANOSALVA', NULL, NULL, '1989-02-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1182357196', '2007-09-04', 1, NULL, NULL),
(19534, 2, 1, '1090983318', 'YEINY DEL CARMEN BARRANCO CONTRERAS', NULL, NULL, '1997-06-18', NULL, 'sincorreo@sincorreo.com', NULL, '-1070802423', '2015-07-07', 1, NULL, NULL),
(19535, 2, 1, '37181942', 'YEINY JOHANNA ANGARITA CARVAJALINO', NULL, NULL, '1983-11-09', '0', 'johanna.8312@hotmail.com', NULL, '-1112515741', '2002-12-12', 1, NULL, NULL),
(19536, 2, 1, '1042454177', 'YEIRE PAOLA MENESES GARCIA', NULL, NULL, '1996-09-15', '0', 'yeipao1516@gmail.com', NULL, '-1069175532', '2014-10-22', 1, NULL, NULL),
(19537, 2, 1, '1006855199', 'YEISON  PICON LOPEZ', NULL, NULL, '1995-07-11', '0', 'sincorreo@sincorreo.com', NULL, '-1066119231', '2014-07-24', 1, NULL, NULL),
(19538, 2, 1, '5428582', 'YEISON  RODRIGUEZ PEREZ', NULL, NULL, '1984-05-16', '0', 'sincorreo@sincorreo.com', NULL, '-1167927471', '2003-02-21', 1, NULL, NULL),
(19539, 1, 1, '1064086011', 'YEISON ALEXANDER LOZANO SOLANO', NULL, NULL, '2003-11-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1148352113', '2011-04-01', 1, NULL, NULL),
(19540, 2, 1, '1066063301', 'YEISON JOSE SOLANO CASTRO', NULL, NULL, '1996-09-12', '0', 'yeisonjosesolanocastro@gmail.com', NULL, '-1121379345', '2014-09-15', 1, NULL, NULL),
(19541, 2, 1, '37339606', 'YELISSA ROCIO MENESES PINEDA', NULL, NULL, '1982-06-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1192434932', '2001-06-13', 1, NULL, NULL),
(19542, 2, 2, '1091183137', 'YENDY PAOLA CALDERON CHACON', NULL, NULL, '1996-05-31', '0', 'yendycalderon_31@hotmail.com', NULL, '-1162391436', '2014-06-26', 1, NULL, NULL),
(19543, 2, 1, '1066062957', 'YENY ALEJANDRA TORRES ANGARITA', NULL, NULL, '1994-01-05', NULL, 'ytorres.ipk30637@gmail.com', NULL, '-1152632679', '2012-02-27', 1, NULL, NULL),
(19544, 2, 1, '1091658552', 'YENY PAOLA PICON LOZANO', NULL, NULL, '1988-03-23', NULL, 'yenipao23@hotmail.com', NULL, '-1141833628', '2006-05-05', 1, NULL, NULL),
(19545, 2, 1, '1979206', 'YERAIR  GAONA MANOSALVA', NULL, NULL, '1980-01-02', '0', 'sincorreo@sincorreo.com', NULL, '-1072820604', '1998-04-20', 1, NULL, NULL),
(19546, 2, 2, '1007332435', 'YERALDIN  CHACON VEGA', NULL, NULL, '1993-11-16', '0', 'yj012011@gmail.com', NULL, '-1191992516', '2011-11-23', 1, NULL, NULL),
(19547, 2, 1, '1066062772', 'YERALDIN  MENDOZA GALVIZ', NULL, NULL, '1991-10-20', '0', 'gemega22.23@gmail.com', NULL, '-1086682205', '2010-08-04', 1, NULL, NULL),
(19548, 2, 1, '1066062315', 'YERALDIN  SEPULVEDA PEREZ', NULL, NULL, '1987-12-27', '0', 'yaraldinsepulveda13@gmail.com', NULL, '-1067495163', '2006-12-19', 1, NULL, NULL),
(19549, 2, 1, '1066063335', 'YERLI CATHERINE GARCIA PEREIRA', NULL, NULL, '1996-11-28', NULL, 'yerlicatherinegarciapereira@gmail.com', NULL, '-1151925968', '2014-12-16', 1, NULL, NULL),
(19550, 1, 1, '1003257528', 'YERLY KARELY RIOS SANTANA', NULL, NULL, '2000-05-09', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '2014-11-25', 1, NULL, NULL),
(19551, 2, 1, '1066063535', 'YERLY KATERINE CARRILLO ARIAS', NULL, NULL, '1998-06-15', NULL, 'kcarrilloarias98@gmail.com', NULL, '-1138668250', '2016-06-23', 1, NULL, NULL),
(19552, 2, 1, '1064838418', 'YERLY LIBETH VILA JAIME', NULL, NULL, '1990-11-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1150222732', '2009-02-11', 1, NULL, NULL),
(19553, 2, 1, '1005297482', 'YERSON ANDRES BACA GIL', NULL, NULL, '2002-12-04', '0', 'andresbaca1228@gmail.com', NULL, '-1151531494', '2020-12-16', 1, NULL, NULL),
(19554, 2, 1, '1090984715', 'YESICA  PEREZ ANGARITA', NULL, NULL, '1989-01-04', NULL, 'yangarita.ipk43155@gmail.com', NULL, '-1151504211', '2007-01-25', 1, NULL, NULL),
(19555, 2, 1, '1091661514', 'YESICA TORCOROMA ALVAREZ ASCANIO', NULL, NULL, '1989-03-09', '0', 'yesicatalvareza@outlook.es', NULL, '-1086719605', '2007-07-12', 1, NULL, NULL),
(19556, 2, 1, '5469003', 'YESID  CARRASCAL RINCON', NULL, NULL, '1983-02-26', '0', 'yean2621@gmail.com', NULL, '-1081377578', '2001-05-08', 1, NULL, NULL),
(19557, 2, 1, '91449986', 'YESID  GARCIA SANTOS', NULL, NULL, '1978-04-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1160375510', '1997-02-05', 1, NULL, NULL),
(19558, 2, 1, '1091656085', 'YESID  VEGA PAREDES', NULL, NULL, '1987-04-23', '0', 'yesidvega2304@gmail.com', NULL, '-1179330320', '2005-05-05', 1, NULL, NULL),
(19559, 2, 1, '49671616', 'YESMIR  SALAZAR', NULL, NULL, '1983-08-13', '0', 'yesmirsalazar56@gmail.com', NULL, '-1176018245', '2001-11-23', 1, NULL, NULL),
(19560, 2, 1, '1091660678', 'YESSICA BRILLIT CARRASCAL RINCON', NULL, NULL, '1989-03-06', '0', 'yessicacarrascal06@gmail.com', NULL, '-1150294765', '2007-03-13', 1, NULL, NULL),
(19561, 2, 1, '1066062306', 'YESSICA ROCIO MOLINA GAONA', NULL, NULL, '1988-10-25', '0', 'yessirocio@hotmail.com', NULL, '-1139914090', '2006-11-08', 1, NULL, NULL),
(19562, 2, 1, '1066062645', 'YEXEL  CUETO CARRASCAL', NULL, NULL, '1990-06-20', NULL, 'sincorreo@sincorreo.com', NULL, '-1070366766', '2009-06-16', 1, NULL, NULL),
(19563, 2, 1, '5035700', 'YHON ADOLFO BOHORQUEZ VILLALBA', NULL, NULL, '1978-03-07', NULL, 'yhon29@hotmail.com', NULL, '-1120668872', '1996-06-19', 1, NULL, NULL),
(19564, 2, 1, '88284845', 'YHON FREDY CASADIEGOS TELLEZ', NULL, NULL, '1977-12-06', '0', 'sincorreo@sincorreo.com', NULL, '-1070519166', '1996-12-13', 1, NULL, NULL),
(19565, 2, 1, '1003257672', 'YHON JAIRO JACOME JACOME', NULL, NULL, '1999-07-05', '0', 'jacomejacomejhonjairo04@gmail.com', NULL, '-1162481212', '2017-07-26', 1, NULL, NULL),
(19566, 2, 1, '1064839162', 'YHORLIN OSNEY BECERRA PEREZ', NULL, NULL, '1992-05-30', '0', 'elianys16.19@hotmail.com', NULL, '-1187728447', '2010-07-09', 1, NULL, NULL),
(19567, 2, 1, '1004819215', 'YIBELY ANDREINA MANDON RODRIGUEZ', NULL, NULL, '2002-10-18', '0', 'sincorreo@sincorreo.com', NULL, '-1172148506', '2020-10-30', 1, NULL, NULL),
(19568, 1, 1, '1003121969', 'YILFRED ANTONIO GALVIZ CHINCHILLA', NULL, NULL, '2003-04-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1161723568', '2018-02-21', 1, NULL, NULL),
(19569, 2, 1, '1064836731', 'YILMER  DUARTE PORTILLO', NULL, NULL, '1982-07-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1171982023', '2005-02-23', 1, NULL, NULL),
(19570, 2, 1, '1004820032', 'YILVER  BUENO DURAN', NULL, NULL, '1997-10-04', '0', 'sincorreo@sincorreo.com', NULL, '-1176931594', '2016-04-06', 1, NULL, NULL),
(19571, 2, 1, '1007957913', 'YIMMY ALEXANDER VANEGAS QUINTERO', NULL, NULL, '2001-11-24', '0', 'vanegasyimmy24@gmail.com', NULL, '-1071667557', '2019-11-25', 1, NULL, NULL),
(19572, 2, 1, '5036200', 'YIMMY REINEL SANTIAGO MOLINA', NULL, NULL, '1980-06-12', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1998-08-31', 1, NULL, NULL),
(19573, 2, 1, '1066063381', 'YIMY ANDREY VARGAS MANDON', NULL, NULL, '1997-04-03', NULL, 'yimyvargas2612@gmail.com', NULL, '-1090632182', '2015-04-13', 1, NULL, NULL),
(19574, 2, 1, '1065808903', 'YINED PAOLA SANTIAGO MANOSALVA', NULL, NULL, '1994-09-25', '0', 'yinpa94@hotmail.com', NULL, '-1140018534', '2012-10-25', 1, NULL, NULL),
(19575, 2, 1, '1082884645', 'YINEI  AVENDAÃ‘O PEREZ', NULL, NULL, '1987-01-05', '0', 'sincorreo@sincorreo.com', NULL, '-1062772695', '2006-10-05', 1, NULL, NULL),
(19576, 2, 1, '1066062864', 'YINETH  LOZANO ANGARITA', NULL, NULL, '1993-03-12', '0', 'ylozanoa@unicesar.edu.com', NULL, '-1119184626', '2011-06-13', 1, NULL, NULL),
(19577, 2, 1, '1003257445', 'YINIBETH  LOZANO CONTRERAS', NULL, NULL, '1996-02-26', '0', 'yinibethlozano@gmail.com', NULL, '-1076683790', '2014-04-07', 1, NULL, NULL),
(19578, 2, 1, '1066062542', 'YISLEN  PINZON QUINTERO', NULL, NULL, '1990-08-18', '0', 'cayita.18@hotmail.com', NULL, '-1108595836', '2008-10-31', 1, NULL, NULL),
(19579, 2, 1, '1193511224', 'YISLENY  RINCON RINCON', NULL, NULL, '1998-12-24', NULL, 'yiisleny@hotmail.com', NULL, '-1142148959', '2016-12-28', 1, NULL, NULL),
(19580, 2, 1, '1066063241', 'YISNEY  MANOSALVA AREVALO', NULL, NULL, '1996-02-21', NULL, 'Endertgath@hotmail.com', NULL, '-1066953406', '2014-02-27', 1, NULL, NULL),
(19581, 2, 1, '1003257464', 'YISNEY ALEXANDRA CANTILLO NORIEGA', NULL, NULL, '2002-11-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1090123190', '2020-12-15', 1, NULL, NULL),
(19582, 2, 1, '1066062681', 'YOBAN ESLEIDER CONTRERAS PORTILLO', NULL, NULL, '1991-04-01', NULL, 'sincorreo@sincorreo.com', NULL, '-1061734888', '2009-08-31', 1, NULL, NULL),
(19583, 2, 1, '5035593', 'YOBANY  PAVA NAVARRO', NULL, NULL, '1972-08-20', '0', 'yobanoty_72@hotmail.com', NULL, '-1126669141', '1992-03-18', 1, NULL, NULL),
(19584, 2, 1, '1066062553', 'YODY CONSTANZA SANTIAGO CASTRO', NULL, NULL, '1990-04-25', '0', 'yodycsc_25@hotmail.com', NULL, '-1109030684', '2008-11-21', 1, NULL, NULL),
(19585, 2, 1, '1066062143', 'YOHAN MANUEL OSORIO LOZANO', NULL, NULL, '1987-08-30', '0', 'yomaos87@gmail.com', NULL, '-1127558923', '2005-09-09', 1, NULL, NULL),
(19586, 2, 1, '1066062802', 'YOJAN ALEXIS PAVA DUARTE', NULL, NULL, '1992-10-17', '0', 'sincorreo@sincorreo.com', NULL, '-787696593', '2010-11-17', 1, NULL, NULL),
(19587, 2, 1, '5036181', 'YOJAN DANUIL URIBE MOLINA', NULL, NULL, '1980-01-02', '0', 'yojandanuil@gmail.com', NULL, '-1118473645', '1998-01-27', 1, NULL, NULL),
(19588, 2, 1, '37311498', 'YOLANDA  DELGADO DE ASCANIO', NULL, NULL, '1958-09-28', NULL, 'yolandita_958@hotmail.com', NULL, '-1138757984', '1977-10-28', 1, NULL, NULL),
(19589, 2, 1, '26774754', 'YOLANDA  MOLINA BALLESTEROS', NULL, NULL, '1960-07-01', '0', 'sincorreo@sincorreo.com', NULL, '-1090786653', '1983-12-12', 1, NULL, NULL),
(19590, 2, 1, '37320346', 'YOLANDA  QUINTERO MANOSALVA', NULL, NULL, '1967-10-21', '5612672', 'sincorreo@sincorreo.com', NULL, '-1108650910', '1986-09-24', 1, NULL, NULL),
(19591, 2, 1, '26863415', 'YOLEYDA  DUARTE PORTILLO', NULL, NULL, '1977-06-15', '0', 'yole2329hijo@gmail.com', NULL, '-1092560684', '1998-01-20', 1, NULL, NULL),
(19592, 2, 1, '1065890710', 'YOLFER  CONTRERAS PABON', NULL, NULL, '1999-01-21', '0', 'yolfer080808@gmail.com', NULL, '-1090656695', '2017-02-03', 1, NULL, NULL),
(19593, 2, 1, '37333257', 'YOLIMA  AMAYA LEON', NULL, NULL, '1978-10-14', '0', 'sincorreo@sincorreo.com', NULL, '-1162145053', '1997-05-29', 1, NULL, NULL),
(19594, 2, 1, '1091533895', 'YOLIMA  AVENDAÃ‘O MORA', NULL, NULL, '1989-03-03', '0', 'avendanoyolima80@gmail.com', NULL, '-1142119306', '2010-03-09', 1, NULL, NULL),
(19595, 2, 1, '1091653511', 'YOLIMA DEL CARMEN RINCON', NULL, NULL, '1985-11-02', '0', 'sincorreo@sincorreo.com', NULL, '-1106339833', '2004-07-13', 1, NULL, NULL),
(19596, 2, 1, '37369603', 'YOMAIRA  ANTELIZ SANCHEZ', NULL, NULL, '1976-01-17', NULL, 'yomis176@hotmail.com', NULL, '-1112451971', '1994-06-20', 1, NULL, NULL);
INSERT INTO `asociado` (`asocid`, `tipideid`, `agenid`, `asocnumerodocumento`, `asocnombrecompleto`, `asocfechaingreso`, `asocgenero`, `asocfechanacimiento`, `asoctelefono`, `asocemail`, `asocdescripcion`, `asoccelular`, `asocfechaexpedicion`, `asocactivo`, `created_at`, `updated_at`) VALUES
(19597, 2, 1, '37322518', 'YOMAIRA  LOPEZ MANZANO', NULL, NULL, '1969-11-16', '0', 'yomalopez105@gmail.com', NULL, '-1089172729', '1988-09-27', 1, NULL, NULL),
(19598, 2, 1, '1091653391', 'YOMAIRA MARIA PAREDES SANCHEZ', NULL, NULL, '1985-12-17', '0', 'yomairapasa@gmail.com', NULL, '-1192889894', '2004-05-25', 1, NULL, NULL),
(19599, 2, 1, '1979343', 'YONEISER  SANTIAGO SERRANO', NULL, NULL, '1980-05-17', NULL, 'sincorreo@sincorreo.com', NULL, '-1079461846', '1998-06-11', 1, NULL, NULL),
(19600, 2, 1, '1004864132', 'YONEISO  QUINTERO CASTRO', NULL, NULL, '1985-08-27', '0', 'sincorreo@sincorreo.com', NULL, '-1138934316', '2004-10-01', 1, NULL, NULL),
(19601, 2, 1, '13379284', 'YONERGE  ZAPARDIEL MANOSALVA', NULL, NULL, '1978-11-26', '0', 'yonergezaparduelmanozalva@gmail.com', NULL, '-1162183590', '1996-12-23', 1, NULL, NULL),
(19602, 2, 1, '1004819250', 'YONIER  ACOSTA MANDON', NULL, NULL, '2000-12-11', '-1092698253', 'sincorreo@sincorreo.com', NULL, NULL, '2019-03-05', 1, NULL, NULL),
(19603, 2, 1, '5469262', 'YONY  ARIAS JAIME', NULL, NULL, '1979-07-17', '0', 'sincorreo@gmail.com', NULL, '-1065509852', '1999-04-15', 1, NULL, NULL),
(19604, 1, 1, '1064086115', 'YORDI STIVEN PACHECO MOLINA', NULL, NULL, '2005-01-31', NULL, 'sincorreo@sincorreo.com', NULL, '-1178707689', '2012-11-26', 1, NULL, NULL),
(19605, 1, 1, '1004818809', 'YORFAN  CHINCHILLA VERA', NULL, NULL, '2002-07-02', NULL, 'sincorreo@sincorreo.com', NULL, '-1177949281', '2016-11-08', 1, NULL, NULL),
(19606, 2, 1, '1066063123', 'YORGAN ANDREI NAVARRO SEPULVEDA', NULL, NULL, '1994-12-25', '0', 'sincorreo@gmail.com', NULL, '-1160631635', '2013-04-08', 1, NULL, NULL),
(19607, 2, 1, '1066062013', 'YORGEN  JACOME PABA', NULL, NULL, '1984-04-12', '0', 'yorgenjacomepaba@gmail.com', NULL, '-1078207597', '2004-02-23', 1, NULL, NULL),
(19608, 2, 1, '1064086020', 'YORGEN ARLEY PACHECO CONTRERAS', NULL, NULL, '2004-03-11', '0', 'pachecoyorgen@gmail.com', NULL, '-1070336986', '2022-03-28', 1, NULL, NULL),
(19609, 2, 1, '1003122005', 'YORGEN URALDO DUARTE SANTIAGO', NULL, NULL, '2001-01-16', '0', 'yorduasan2210@gmail.com', NULL, '-1162652911', '2019-02-14', 1, NULL, NULL),
(19610, 2, 1, '1090985362', 'YORLENNY ROCIO QUINTERO PEREZ', NULL, NULL, '1989-11-05', '0', 'yoroquipe@gmail.com', NULL, '-1169529978', '2008-01-24', 1, NULL, NULL),
(19611, 1, 1, '1066062113', 'YORLIN DIOMIDES MENDOZA RINCON', NULL, NULL, '2005-05-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1167662577', '2017-05-24', 1, NULL, NULL),
(19612, 2, 1, '1007961102', 'YORMAN ANDRES ALVAREZ BAYONA', NULL, NULL, '2002-06-13', '0', 'yormanalvare@hotmail.com', NULL, '-1072773500', '2020-07-28', 1, NULL, NULL),
(19613, 2, 1, '12668034', 'YOVANI  LOZANO PORTILLO', NULL, NULL, '1967-05-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1170944952', '1985-09-24', 1, NULL, NULL),
(19614, 2, 1, '5036235', 'YOVANNY ALFONSO MENDOZA QUINTERO', NULL, NULL, '1981-11-06', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1999-11-16', 1, NULL, NULL),
(19615, 2, 1, '88278000', 'YOVANY  PORTILLO BOHORQUEZ', NULL, NULL, '1972-05-26', '0', 'yobanipb72@gmail.com', NULL, '-1092892187', '1991-02-12', 1, NULL, NULL),
(19616, 2, 1, '5035675', 'YOVANY  RODRIGUEZ GUTIERREZ', NULL, NULL, '1975-12-05', NULL, 'sincorreo@sincorreo.com', NULL, '-1148850681', '1994-10-31', 1, NULL, NULL),
(19617, 2, 1, '37338970', 'YUCELLY  SANTIAGO BOHORQUEZ', NULL, NULL, '1982-04-16', '0', 'ysantiago0@misena.edu.co', NULL, '-1192093005', '2001-02-05', 1, NULL, NULL),
(19618, 2, 1, '1066062499', 'YUDIFA  DUARTE GUTIERREZ', NULL, NULL, '1989-08-09', '0', 'sincorreo@sincorreo.com', NULL, '-1160295781', '2008-06-25', 1, NULL, NULL),
(19619, 2, 1, '26777474', 'YUDIRIA  RUEDAS IBARRA', NULL, NULL, '1985-08-10', NULL, 'sincorreo@sincorreo.com', NULL, '-1182830514', '2003-09-26', 1, NULL, NULL),
(19620, 2, 1, '1066062044', 'YUDITH TORCOROMA PRADO PACHECO', NULL, NULL, '1985-12-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1072710511', '2004-03-24', 1, NULL, NULL),
(19621, 2, 1, '1066063413', 'YUENDY DAYANA JACOME JACOME', NULL, NULL, '1997-06-18', '0', 'sincorreo@sincorreo.com', NULL, '-1071540340', '2015-06-24', 1, NULL, NULL),
(19622, 2, 1, '49788956', 'YULEDIZ  RIVERA DAZA', NULL, NULL, '1979-02-14', '0', 'madayu1479@gmail.com', NULL, '-1111509115', '1997-04-21', 1, NULL, NULL),
(19623, 2, 1, '37181043', 'YULEI  PEDROZA NAVARRO', NULL, NULL, '1983-12-25', '0', 'sincorreo@sincorreo.com', NULL, '-1071690830', '2002-04-25', 1, NULL, NULL),
(19624, 2, 1, '1091671218', 'YULEIDA  ACOSTA GUERRERO', NULL, NULL, '1994-01-20', '0', 'yuleidaacosta9@gmail.com', NULL, '-1162299453', '2012-04-12', 1, NULL, NULL),
(19625, 2, 1, '26777367', 'YULEIDA  FRANCO CASADIEGOS', NULL, NULL, '1982-08-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1179245367', '2001-01-22', 1, NULL, NULL),
(19626, 2, 1, '1066062923', 'YULEIDA  SERRANO MENDOZA', NULL, NULL, '1993-11-03', NULL, 'yuleidaserrano03@gmail.com', NULL, '-1182919657', '2011-12-14', 1, NULL, NULL),
(19627, 2, 1, '1091665570', 'YULEIDY  CORONEL CALLEJAS', NULL, NULL, '1991-02-15', '0', 'sincorreo@sincorreo.com', NULL, '-1182965817', '2009-05-13', 1, NULL, NULL),
(19628, 2, 1, '26777185', 'YULEIMA  CARRASCAL CARRASCAL', NULL, NULL, '1976-09-19', '-1148880018', 'sincorreo@sincorreo.com', NULL, '-1068885185', '1996-07-05', 1, NULL, NULL),
(19629, 2, 2, '1092645786', 'YULEIMA  CONTRERAS CONTRERAS', NULL, NULL, '1992-03-30', '0', 'yuleima300392@gmail.com', NULL, '-1160425129', '2011-02-17', 1, NULL, NULL),
(19630, 2, 1, '37372267', 'YULEIMA JIMENA DUARTE PEREZ', NULL, NULL, '1983-06-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1160052221', '2001-10-12', 1, NULL, NULL),
(19631, 2, 1, '1004819960', 'YULENA  SANCHEZ ARENAS', NULL, NULL, '1995-02-02', '0', 'notiene@notiene.com', NULL, '-1072781940', '2013-05-15', 1, NULL, NULL),
(19632, 2, 1, '1066062716', 'YULI  PABA PABA', NULL, NULL, '1991-11-26', NULL, 'sincorreo@sincorreo.com', NULL, '-1072016453', '2009-12-29', 1, NULL, NULL),
(19633, 1, 1, '1003257666', 'YULIAN SMITH MOLINA CONTRERAS', NULL, NULL, '2003-07-21', NULL, 'sincorreo@sincorreo.com', NULL, '-1161729006', '2017-09-20', 1, NULL, NULL),
(19634, 1, 1, '1064086146', 'YULIANA  HERNANDEZ BARBOSA', NULL, NULL, '2005-11-30', '0', 'yulianahernandez.3011@hotmail.com', NULL, '-1111471622', '2019-12-04', 1, NULL, NULL),
(19635, 1, 1, '1064086138', 'YULIANA  ORTEGA MENDOZA', NULL, NULL, '2005-08-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1137905889', '2012-12-20', 1, NULL, NULL),
(19636, 2, 1, '1007282793', 'YULIANA KATERINE MENESES SUAREZ', NULL, NULL, '1991-10-03', NULL, 'sincorreo@sincorreo.com', NULL, '-1152698489', '2009-11-05', 1, NULL, NULL),
(19637, 2, 1, '1193549633', 'YULIANA PAOLA REYES MOLINA', NULL, NULL, '2000-12-05', NULL, 'yulianareyesmolina2@gmail.com', NULL, '-1072932575', '2019-01-02', 1, NULL, NULL),
(19638, 2, 1, '1003257751', 'YULIANA STEFY LOZANO GARCIA', NULL, NULL, '2001-08-04', '0', 'yuyi042001@gmail.com', NULL, '-1106210092', '2019-08-05', 1, NULL, NULL),
(19639, 2, 1, '1193224947', 'YULIANI MARCELA BAYONA DURAN', NULL, NULL, '2000-09-07', '0', 'yuliany0709@gmail.com', NULL, '-1152224276', '2018-09-24', 1, NULL, NULL),
(19640, 1, 1, '1064086027', 'YULIANY  DUARTE PINEDA', NULL, NULL, '2004-04-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1066808221', '2019-04-20', 1, NULL, NULL),
(19641, 2, 1, '1091653150', 'YULIED DEL CARMEN JAIMES BONET', NULL, NULL, '1985-06-28', NULL, 'sincorreo@sincorreo.com', NULL, '-1062505366', '2004-05-04', 1, NULL, NULL),
(19642, 2, 1, '26774952', 'YULIED ZAMIRA SANTIAGO SOTO', NULL, NULL, '1972-11-08', NULL, 'yuliedsantiago@hotmail.com', NULL, '-1170179706', '1991-05-28', 1, NULL, NULL),
(19643, 2, 1, '26777407', 'YULIETH  BARRERA RODRIGUEZ', NULL, NULL, '1980-07-15', NULL, 'sincorreo@sincorreo.com', NULL, '-1072769564', '2002-01-18', 1, NULL, NULL),
(19644, 2, 1, '37372346', 'YULIETH  LEMUS ROPERO', NULL, NULL, '1983-06-13', NULL, 'sincorreo@sincorreo.com', NULL, '-1192905791', '2002-02-15', 1, NULL, NULL),
(19645, 2, 1, '37332874', 'YULIETH AMANDA MENESES AMAYA', NULL, NULL, '1978-12-06', '0', 'sincorreo@sincorreo.com', NULL, '-1162916249', '1997-03-14', 1, NULL, NULL),
(19646, 2, 1, '1003257642', 'YULIETH KARINA MANZANO CARRILLO', NULL, NULL, '2003-05-22', '0', 'ykmanzanoc@gmail.com', NULL, '-1117089700', '2021-05-25', 1, NULL, NULL),
(19647, 2, 1, '1065904355', 'YULIETH KARINA NORIEGA TORRES', NULL, NULL, '1995-08-05', '0', '4355karina@gmail.com', NULL, '-1089394469', '2013-08-12', 1, NULL, NULL),
(19648, 2, 1, '26777427', 'YULIETH PAHOLA MADARIAGA OSORIO', NULL, NULL, '1984-05-01', NULL, 'pahola8405@hotmail.com', NULL, '-1126182962', '2002-05-17', 1, NULL, NULL),
(19649, 2, 1, '1066062510', 'YULIETH PAOLA MANOSALVA ANGARITA', NULL, NULL, '1988-07-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1169690869', '2008-08-15', 1, NULL, NULL),
(19650, 2, 1, '1091653690', 'YULIETH PAOLA PINZON GRANADOS', NULL, NULL, '1986-07-26', '0', 'pinzongranados1986@outlook.com', NULL, '-1112223778', '2004-07-29', 1, NULL, NULL),
(19651, 2, 1, '1091666412', 'YULIETH TORCOROMA RIOS DUARTE', NULL, NULL, '1991-10-14', NULL, 'sincorreo@sincorreo.com', NULL, '-1170630622', '2009-10-28', 1, NULL, NULL),
(19652, 2, 1, '1066062691', 'YULMER IGNACIO LOZANO MENESES', NULL, NULL, '1991-09-10', NULL, 'lozanomenesesy@gmail.com', NULL, '-1170278655', '2009-10-01', 1, NULL, NULL),
(19653, 2, 1, '5036344', 'YUMER JESUS CHINCHILLA TORRES', NULL, NULL, '1984-09-16', '0', 'sincorreo@sincorreo.com', NULL, '-1182894224', '2002-11-05', 1, NULL, NULL),
(19654, 2, 1, '1134849120', 'YUNI  CONTRERAS ANDRADE', NULL, NULL, '1995-04-09', '0', 'yucont310@gmail.com', NULL, '-1072772265', '2017-10-17', 1, NULL, NULL),
(19655, 2, 1, '1091675092', 'YURAIMA  QUINTERO CARRILLO', NULL, NULL, '1995-12-20', NULL, 'yuraimaedil13@gmail.com', NULL, '-1071548534', '2013-12-30', 1, NULL, NULL),
(19656, 2, 1, '1091670498', 'YURANI CARINA DURAN ESPINEL', NULL, NULL, '1993-05-04', NULL, 'sincorreo@sincorreo.com', NULL, '-1136741124', '2011-10-10', 1, NULL, NULL),
(19657, 1, 1, '1066062662', 'YURANY  PABA TORRES', NULL, NULL, '2004-12-21', '0', 'sincorreo@sincorreo.com', NULL, '-1070295965', '2012-02-12', 1, NULL, NULL),
(19658, 2, 1, '1091654494', 'YURBEY  GAONA MANOSALVA', NULL, NULL, '1985-04-26', '0', 'sincorreo@sincorreo.com', NULL, '-1086762674', '2004-10-21', 1, NULL, NULL),
(19659, 2, 1, '5471273', 'YURGEN  PICON PABA', NULL, NULL, '1982-04-22', '0', 'sincorreo@sincorreo.com', NULL, '-1177112288', '2000-07-21', 1, NULL, NULL),
(19660, 2, 1, '1091660604', 'YURI CECILIA GALVIZ DUARTE', NULL, NULL, '1988-11-09', NULL, 'sincorreo@sincorreo.com', NULL, '-1066224176', '2007-03-01', 1, NULL, NULL),
(19661, 2, 1, '1066063047', 'YURIBEL  TORO JACOME', NULL, NULL, '1994-07-23', '0', 'lebiruy23@hotmail.com', NULL, '-1061872533', '2012-09-04', 1, NULL, NULL),
(19662, 3, 1, '19459316', 'YURIXA FERNANDA DUARTE LOZANO', NULL, NULL, '1993-02-01', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1993-06-17', 1, NULL, NULL),
(19663, 2, 2, '1010081622', 'YURLAN ALFREYD PEREZ SANTOS', NULL, NULL, '2000-09-27', '0', 'yperzsantos@gmail.com', NULL, '-1091209520', '2018-10-08', 1, NULL, NULL),
(19664, 2, 1, '1066062880', 'YURLEIDY  LOZANO ECHAVEZ', NULL, NULL, '1993-04-20', '0', 'ylozanoe@unicesar.edu.co', NULL, '-1158773638', '2011-07-22', 1, NULL, NULL),
(19665, 2, 1, '1066062722', 'YURLEY  CHINCHILLA ARO', NULL, NULL, '1991-11-30', NULL, 'sincorreo@sincorreo.com', NULL, '-1188508434', '2010-01-12', 1, NULL, NULL),
(19666, 2, 1, '88279059', 'YURLEY  RUEDAS ACOSTA', NULL, NULL, '1974-02-04', '0', 'yorley@gmail.com', NULL, '-1168513312', '1992-03-19', 1, NULL, NULL),
(19667, 2, 1, '1066063127', 'YURLEY  SANTIAGO SANTIAGO', NULL, NULL, '1995-04-19', NULL, 'yurleysantiago2019@gmail.com', NULL, '-1172692672', '2013-04-22', 1, NULL, NULL),
(19668, 2, 1, '1091660614', 'YURY SARINE AMAYA CARRASCAL', NULL, NULL, '1988-12-27', NULL, 'yuritza2719@hotmail.com', NULL, '-1081294632', '2007-03-02', 1, NULL, NULL),
(19669, 2, 1, '1091660851', 'YURY TATIANA RINCON RINCON', NULL, NULL, '1989-04-09', '5696381', 'yutarincon@gmail.com', NULL, '-1140070072', '2007-04-11', 1, NULL, NULL),
(19670, 2, 1, '1066062517', 'YUSANDRY KARINA OSORIO MANZANO', NULL, NULL, '1990-07-06', NULL, 'yukaosma@hotmail.com', NULL, '-1108935741', '2008-09-09', 1, NULL, NULL),
(19671, 2, 1, '26777373', 'YUVELY TORCOROMA SANTIAGO LOZANO', NULL, NULL, '1982-09-20', NULL, 'ysantiagolozano@gmail.com', NULL, '-1069735468', '2001-02-28', 1, NULL, NULL),
(19672, 2, 1, '37339744', 'ZAIDA  PICON CASTILLA', NULL, NULL, '1982-08-10', '0', 'zaidapicon@gmail.com', NULL, '-1086121153', '2001-07-17', 1, NULL, NULL),
(19673, 2, 1, '26774638', 'ZAIDA MYRIAM LOZANO CABRALES', NULL, NULL, '1959-11-01', '0', 'sincorreo@sincorreo.com', NULL, '-1130630554', '1979-12-09', 1, NULL, NULL),
(19674, 2, 1, '26775065', 'ZENAIDA  BAYONA AMAYA', NULL, NULL, '1975-02-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1126245725', '1994-10-31', 1, NULL, NULL),
(19675, 2, 1, '13375576', 'ZENEN  OJEDA GONZALEZ', NULL, NULL, '1967-03-27', '0', 'sincorreo@sincorreo.com', NULL, '-1156652278', '1987-01-09', 1, NULL, NULL),
(19676, 2, 1, '1066063263', 'ZINDY LORENA RINCON BELTRAN', NULL, NULL, '1996-04-24', '0', 'lorbeltran3@gmail.com', NULL, '-1136168826', '2014-05-19', 1, NULL, NULL),
(19677, 2, 1, '37334984', 'ZORAIDA  BAYONA AMAYA', NULL, NULL, '1980-06-07', NULL, 'sincorreo@sincorreo.com', NULL, '-1118136337', '1998-08-10', 1, NULL, NULL),
(19678, 2, 1, '1066062260', 'ZORAIDA  BAYONA MONTAGUT', NULL, NULL, '1987-02-16', '0', 'sincorreo@sincorreo.com', NULL, '-1168447927', '2007-03-15', 1, NULL, NULL),
(19679, 2, 1, '26774858', 'ZORAIDA  CONTRERAS MANZANO', NULL, NULL, '1968-12-12', '0', 'sarayacon@yahoo.es', NULL, '-1130063824', '1987-12-14', 1, NULL, NULL),
(19680, 2, 1, '26777183', 'ZORAIDA  MOLINA QUINTERO', NULL, NULL, '1977-06-08', NULL, 'sincorreo@sincorreo.com', NULL, '-1111093240', '1996-07-05', 1, NULL, NULL),
(19681, 2, 1, '26774971', 'ZORAIDA  SANCHEZ RINCON', NULL, NULL, '1973-09-03', '0', 'sincorreo@sincorreo.com', NULL, '-1147024403', '1991-11-08', 1, NULL, NULL),
(19682, 2, 1, '1004864114', 'ZORAY  BAYONA ALVAREZ', NULL, NULL, '1985-11-06', NULL, 'sincorreo@sincorreo.com', NULL, '-1078659066', '2005-02-15', 1, NULL, NULL),
(19683, 2, 1, '37331963', 'ZULEIDA  VEGA MARTINEZ', NULL, NULL, '1978-05-25', NULL, 'vegazuleida9@gmail.com', NULL, '-1091415720', '1996-07-02', 1, NULL, NULL),
(19684, 2, 1, '26777385', 'ZULEIMA  CHINCHILLA GOMEZ', NULL, NULL, '1980-10-16', '0', 'sincorreo@sincorreo.com', NULL, '-1172243861', '2001-07-04', 1, NULL, NULL),
(19685, 2, 1, '1066062356', 'ZULEIMA  NAVARRO CASTRO', NULL, NULL, '1988-10-28', '0', 'sincorreo@sincorreo.com', NULL, '-1071202831', '2007-03-08', 1, NULL, NULL),
(19686, 2, 1, '1007282951', 'ZULEIMA  QUINTERO CASTRO', NULL, NULL, '1989-09-27', '0', 'sincorreo@sincorreo.com', NULL, '-1129164262', '2009-08-04', 1, NULL, NULL),
(19687, 2, 1, '1066063260', 'ZULEINA  MANOSALVA GRANADOS', NULL, NULL, '1996-01-27', '0', 'sincorreo@sincorreo.com', NULL, '-1128484142', '2014-04-29', 1, NULL, NULL),
(19688, 2, 1, '26775053', 'ZULEMA DEL ROSARIO SANTIAGO MOLINA', NULL, NULL, '1975-11-19', NULL, 'sincorreo@sincorreo.com', NULL, '-1092205065', '1994-02-07', 1, NULL, NULL),
(19689, 2, 1, '37336683', 'ZULIME  AREVALO FRANCO', NULL, NULL, '1981-09-19', '0', 'zulimearevalo@gmail.com', NULL, '-1161047069', '1999-11-29', 1, NULL, NULL),
(19690, 2, 1, '66824168', 'ZULMA MARITZA RAMOS ARBOLEDA', NULL, NULL, '1969-11-22', NULL, 'sincorreo@sincorreo.com', NULL, NULL, '1989-06-30', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociadotemporal`
--

CREATE TABLE `asociadotemporal` (
  `asotemid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla asociado temporal',
  `asotemagencia` varchar(20) DEFAULT NULL COMMENT 'Agencia en la cual pertenece el asociado',
  `asotemtipodocumento` varchar(50) DEFAULT NULL COMMENT 'Tipo de documento del asociado',
  `asotemnumero` varchar(20) DEFAULT NULL COMMENT 'Número de documento del asociado',
  `asotemnombrecompleto` varchar(100) DEFAULT NULL COMMENT 'Nombre completo del asociado',
  `asotemfechaingreso` varchar(20) DEFAULT NULL COMMENT 'Fecha de ingreso del asociado a la cooperativa',
  `asotemgenero` varchar(20) DEFAULT NULL COMMENT 'Genero al que pertenece el asociado',
  `asotemfechanacimiento` varchar(20) DEFAULT NULL COMMENT 'Fecha de nacimiento del asociado',
  `asotemtelefono` varchar(20) DEFAULT NULL COMMENT 'Teléfono del asociado',
  `asotememail` varchar(80) DEFAULT NULL COMMENT 'Email del asociado',
  `asotemcelular` varchar(20) DEFAULT NULL COMMENT 'Celular del asociado',
  `asotemfechaexpedicion` varchar(20) DEFAULT NULL COMMENT 'Fecha expedición del asociado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-drincon|127.0.0.1', 'i:1;', 1790351633),
('laravel-cache-drincon|127.0.0.1:timer', 'i:1790351633;', 1790351633);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delegado`
--

CREATE TABLE `delegado` (
  `deleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla delegado',
  `agenid` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Identificador de la agencia',
  `deledocumento` varchar(15) NOT NULL COMMENT 'Documento del delegado',
  `deleprimernombre` varchar(50) NOT NULL COMMENT 'Primer nombre del delegado',
  `delesegundonombre` varchar(50) DEFAULT NULL COMMENT 'Segundo nombre del delegado',
  `deleprimerapellido` varchar(50) NOT NULL COMMENT 'Primer apellido del delegado',
  `delesegundoapellido` varchar(50) DEFAULT NULL COMMENT 'Segundo apellido del delegado',
  `delenumero` tinyint(4) NOT NULL COMMENT 'Número en el orden el cual fue asignado como delegado',
  `delecorreo` varchar(80) DEFAULT NULL COMMENT 'Correo del delegado',
  `deletelefono` varchar(20) DEFAULT NULL COMMENT 'Teléfono del delegado',
  `deleactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el delegado esta activo',
  `delefechaexpedicion` date DEFAULT NULL,
  `delenotificacion` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `delegado`
--

INSERT INTO `delegado` (`deleid`, `agenid`, `deledocumento`, `deleprimernombre`, `delesegundonombre`, `deleprimerapellido`, `delesegundoapellido`, `delenumero`, `delecorreo`, `deletelefono`, `deleactivo`, `delefechaexpedicion`, `delenotificacion`, `created_at`, `updated_at`) VALUES
(1, 1, '123456789', 'VOTO', NULL, 'BLANCO', NULL, 99, 'NULL', 'NULL', 1, NULL, NULL, '2026-09-23 19:30:42', '2026-09-23 19:30:42'),
(412, 1, '26774787', 'ADELINA ', NULL, 'NAVARRO BOHORQUEZ', NULL, 1, 'adenabo21@gmail.com', '3112535998', 1, NULL, NULL, '2026-09-23 19:30:42', '2026-09-23 19:30:42'),
(413, 1, '26777375', 'TORCOMA ', NULL, 'ANGARITA DUARTE', NULL, 2, 'torcoromangarita@gmail.com', '3176889267', 1, NULL, NULL, '2026-09-23 19:31:00', '2026-09-23 19:31:00'),
(414, 1, '26774702', 'ROSELIA ', NULL, 'GALVIS PACHECO', NULL, 3, 'galvisroselia37@gmail.com', '3152488620', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(415, 1, '1066063010', 'OSNEIDER ', NULL, 'CONTRERAS MENDOZA', NULL, 4, 'ocontrerasm@ufpso.edu.co', '3142744797', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(416, 1, '26777365', 'YEGNY BIBIANA', NULL, 'LOZANO ANGARITA', NULL, 5, 'yeggny@gmail.com', '3163586141', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(417, 1, '37182379', 'OLGA LUCIA', NULL, 'QUINTERO LOPEZ', NULL, 6, 'olga.sha@hotmail.com', '3132843300', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(418, 1, '1091654054', 'YAMILE ', NULL, 'SOLANO CASTRO', NULL, 7, 'yamilesolanocastro12@gmail.com', '3153081808', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(419, 1, '26777413', 'NELLY ', NULL, 'VARGAS PEÑARANDA', NULL, 8, 'adrianchinchilla2305@gmail.com', '3117239797', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(420, 1, '1733931', 'CARMEN ALONSO', NULL, 'TRILLOS SANCHEZ', NULL, 9, 'mcarrascaltrillos@hotmail.com', '3107929496', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(421, 1, '1007283563', 'DANIELA ', NULL, 'BOHORQUEZ MENESES', NULL, 10, 'bohorquezd480@gmail.com', '3138207516', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(422, 1, '26774858', 'ZORAIDA ', NULL, 'CONTRERAS MANZANO', NULL, 11, 'sarayacon@yahoo.es', '3164903472', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(423, 1, '77175658', 'CARMEN ANGEL', NULL, 'MADARIAGA MANZANO', NULL, 12, 'caanmama@yahoo.es', '3167250720', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(424, 1, '1003257534', 'CAROLINA ', NULL, 'GONZALES GUTIERREZ', NULL, 13, 'carogogu09@hotmail.com', '3125073770', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(425, 1, '26774951', 'SONIA ESTER', NULL, 'SANTIAGO CASTILLA', NULL, 14, 'sonia_santiago2714@hotmail.com', '3108700121', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(426, 1, '26777406', 'EDITH JOHANA', NULL, 'SANCHEZ BOHORQUEZ', NULL, 15, 'edithbohorquez543@gmail.com', '3124363200', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(427, 1, '1091653690', 'YULIETH PAOLA', NULL, 'PINZON GRANADOS', NULL, 16, 'pinzongranados1986@outlook.com', '3182743518', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(428, 1, '12435754', 'ALEJANDRO ', NULL, 'CARRASCAL GARCIA', NULL, 17, 'alejocarrascal@gmail.com', '3175910130', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(429, 1, '5035402', 'LUIS GERMAN', NULL, 'OSORIO OSORIO', NULL, 18, 'osorioosorioluisgerman@gmail.com', '3168662288', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(430, 1, '5458877', 'MARCO FIDEL', NULL, 'BAYONA RUEDAS', NULL, 19, 'marcobayonaru@gmail.com', '3186589047', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(431, 1, '26780600', 'DENIS MARIA', NULL, 'RUEDAS GARCIA', NULL, 20, 'denisruedas61@gmail.com', '3165033001', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(432, 1, '5035051', 'LUIS FERNANDO', NULL, 'QUINTERO DUARTE', NULL, 21, 'fedoquin@hotmail.com', '3165325209', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(433, 1, '13362393', 'JULIO HELI', NULL, 'GAONA MANZANO', NULL, 22, '22sincorreo@gmail.com', '3135399947', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(434, 1, '49761164', 'PATRICIA DEL ROSARIO', NULL, 'GARCIA SANCHEZ', NULL, 23, 'patolyn29@hotmail.com', '3124805593', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(435, 1, '1007959718', 'EIDER JOHAN', NULL, 'CARRILLO CACERES', NULL, 24, 'carrillo26eider@gmail.com', '3178681582', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(436, 1, '26774663', 'MARIA NELLY', NULL, 'BOHORQUEZ DE SANTIAGO', NULL, 25, 'manebosa@hotmail.com', '3176201538', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(437, 1, '26777211', 'DORIS MARIA', NULL, 'SANTIAGO QUINTERO', NULL, 26, 'dorissantiagoquintero@gmail.com', '3143940586', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(438, 1, '5036072', 'ELIECER ', NULL, 'REYES ARIAS', NULL, 27, 'eliecerreyesarias28@hotmail.com', '3185783651', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(439, 1, '5035699', 'ADRIAN FELIPE', NULL, 'HORLANDY RIOS', NULL, 28, 'adrianhorlandy1977@hotmail.com', '3167822042', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(440, 1, '1066062899', 'MARTHA LORENA', NULL, 'AMAYA MOLINA', NULL, 29, 'mlamayam@ufpso.edu.co', '3107088421', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(441, 1, '26777273', 'OMAYDA ', NULL, 'TORREZ CARREÑO', NULL, 30, 'omaydatoca04@gmail.com', '3154822473', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(442, 1, '1003257672', 'YHON JAIRO', NULL, 'JACOME JACOME', NULL, 31, 'jacomejacomejhonjairo04@gmail.com', '3132486084', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(443, 1, '1066062810', 'HERNEY ', NULL, 'MANDON NAVARRO', NULL, 32, 'hmandon92@gmail.com', '3107713160', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(444, 1, '49782615', 'LILIANA DE JESUS', NULL, 'SANTANA SAUMETH', NULL, 34, 'lilianasantanasaumeth1977@hotmail.com', '3162446480', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(445, 1, '88279205', 'HUBERTH ', NULL, 'MOLINA MORA', NULL, 35, 'sincorreo@hotmail.com', '3178176278', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(446, 1, '5035439', 'JOSE ENCARNACION', NULL, 'DUARTE PORTILLO', NULL, 36, 'joseeduarteportillo@gmail.com', '3224567848', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(447, 1, '1066062762', 'HECTOR MANUEL', NULL, 'SANTIAGO RUEDAS', NULL, 37, 'hmanuelsantiagor@gmail.com', '3184247186', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(448, 1, '1091654839', 'KARINA ROCIO', NULL, 'BARBOSA CASTRO', NULL, 38, 'karinarocca25@gmail.com', '3168662112', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(449, 1, '5035339', 'EDGAR ', NULL, 'ASCANIO PEREZ', NULL, 39, 'edgarascinio@gmail.com', '3186118893', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(450, 1, '26777300', 'NANCY ', NULL, 'CARRASCAL NORIEGA', NULL, 40, 'ncarrascalnoriega@gmail.com', '3186383938', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(451, 1, '26777372', 'GISELA IRINA', NULL, 'ORTIZ ANGARITA', NULL, 41, 'giselairina@hotmail.com', '3167808831', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(452, 1, '26775063', 'OTILIA ', NULL, 'NAVARRO PICON', NULL, 42, 'otilianavarro97@gmail.com', '3153204558', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(453, 1, '26774838', 'LUISA TORCOROMA', NULL, 'OSORIO OSORIO', NULL, 43, 'luisaosorio1966@hotmail.com', '3175123571', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(454, 1, '26774947', 'CECILIA ', NULL, 'VERA SANTIAGO', NULL, 44, 'ceciliavera71@hotmail.com', '3213177046', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(455, 1, '88143184', 'NAUN ALEXANDER', NULL, 'MOLINA RINCON', NULL, 45, 'naun.alex69@gmail.com', '3112640044', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(456, 1, '5035242', 'LUIS EMIRO', NULL, 'DUARTE QUINTERO', NULL, 46, 'ld6059439@gmail.com', '3213547370', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(457, 1, '37329114', 'LUCIA ', NULL, 'CHINCHILLA CHINCHILLA', NULL, 47, '47sincorreo@gmail.com', '3175061236', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(458, 1, '5036272', 'DEIMMAR ', NULL, 'DURAN PORTILLO', NULL, 48, 'deimarduran470@gmail.com', '3107036981', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(459, 1, '1978917', 'RAMON DAVID', NULL, 'SALAZAR RINCON', NULL, 49, 'radasa10@hotmail.com', '3204018506', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(460, 1, '26774708', 'TORCOROMA ', NULL, 'GARCIA DUARTE', NULL, 50, 'torco64@gmail.com', '3108707928', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(461, 1, '1091679273', 'INGRITH XIOMARA', NULL, 'MOLINA SANTIAGO', NULL, 51, 'ingrithmolina@hotmail.com', '3138774066', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(462, 1, '5036328', 'LIBARDO ALONSO', NULL, 'GALVIS SANCHEZ', NULL, 52, 'galvizlibardo19@gmail.com', '3172647928', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(463, 1, '1065124120', 'MARTHA MILENA', NULL, 'QUINTERO MENDOZA', NULL, 53, 'marthamilenaquintero@gmail.com', '3228965888', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10'),
(464, 1, '1066062638', 'ALBEIRO ', NULL, 'TORRES CHINCHILLA', NULL, 54, 'albeiro4@outlook.com', '3107727052', 1, NULL, NULL, '2026-09-23 19:31:10', '2026-09-23 19:31:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciondelegado`
--

CREATE TABLE `elecciondelegado` (
  `eledelid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla elección de delegado',
  `eledelanio` year(4) NOT NULL COMMENT 'Año en el cual se presenta la elección de delegado',
  `eledeltitulo` varchar(150) NOT NULL COMMENT 'Título general de la elección de delegado',
  `eledelperiodo` varchar(20) NOT NULL COMMENT 'Periodo en el cual va estar cumplir la elección de delegado',
  `eledelhorainicio` varchar(10) NOT NULL COMMENT 'Hora de inicio de la elección de delegado',
  `eledelhoracierre` varchar(10) NOT NULL COMMENT 'Hora de cierre de la elección de delegado',
  `eledelabrireleccion` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Determina si la elección se debe abrir',
  `eledelcerrareleccion` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Determina si la elección se debe cerrar',
  `eledelpublicareleccion` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Determina si la elección de delegado esta publicada',
  `eledelfechafinalpublicacion` date DEFAULT NULL COMMENT 'Fecha final de publicación de los resultados en el portal de elecciones',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `elecciondelegado`
--

INSERT INTO `elecciondelegado` (`eledelid`, `eledelanio`, `eledeltitulo`, `eledelperiodo`, `eledelhorainicio`, `eledelhoracierre`, `eledelabrireleccion`, `eledelcerrareleccion`, `eledelpublicareleccion`, `eledelfechafinalpublicacion`, `created_at`, `updated_at`) VALUES
(1, '2026', 'ELECCIONES DELEGADOS PARA EL PERÍODO', '2027 - 2030', '08:00', '16:00', 0, 0, 0, NULL, '2026-09-21 14:28:25', '2026-09-25 19:42:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciondelegadoagencia`
--

CREATE TABLE `elecciondelegadoagencia` (
  `eldeagid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla eleccion delegado agencia',
  `eledelid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la elección de delegado',
  `agenid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la agencia',
  `eldeaglugar` varchar(100) NOT NULL COMMENT 'Lugar en el cual se lleva a cabo la elección de delegado',
  `eldeagnumerodeleprincipal` varchar(3) NOT NULL COMMENT 'Número de delegado principales en la agencia',
  `eldeagnumerodelesuplente` varchar(3) NOT NULL COMMENT 'Número de delegado suplente en la agencia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `elecciondelegadoagencia`
--

INSERT INTO `elecciondelegadoagencia` (`eldeagid`, `eledelid`, `agenid`, `eldeaglugar`, `eldeagnumerodeleprincipal`, `eldeagnumerodelesuplente`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'auditorio', '66', '2', '2026-09-21 20:42:07', '2026-09-21 20:42:07'),
(2, 1, 2, 'Colegio', '1', '1', '2026-09-23 17:48:54', '2026-09-23 17:48:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciondelegadoagenciajurado`
--

CREATE TABLE `elecciondelegadoagenciajurado` (
  `eldeajid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla eleccion delegado agencia jurado',
  `eldeagid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla eleccion agencia',
  `eldeajdocumento` varchar(50) NOT NULL COMMENT 'Documento del jurado',
  `eldeajnombre` varchar(100) NOT NULL COMMENT 'Nombre del jurado',
  `eldeajcargo` varchar(50) DEFAULT NULL COMMENT 'Cargo del jurado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciondelegadoaspirante`
--

CREATE TABLE `elecciondelegadoaspirante` (
  `eldeasid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla inscripcion delegado',
  `eledelid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la elección de delegado',
  `tipideid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador del tipo de identificación de aspirante',
  `agenid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la agencia',
  `eldeasdocumento` varchar(15) NOT NULL COMMENT 'Documento de inscripción delegado',
  `eldeasnumero` tinyint(4) NOT NULL COMMENT 'Número en el orden el cual fue inscrito como delegado',
  `eldeasfechahora` datetime NOT NULL COMMENT 'Fecha y hora en la cual se registra el delegado',
  `eldeasprimernombre` varchar(50) NOT NULL COMMENT 'Primer nombre del delegado que se inscribe',
  `eldeassegundonombre` varchar(50) DEFAULT NULL COMMENT 'Segundo nombre del delegado que se inscribe',
  `eldeasprimerapellido` varchar(50) NOT NULL COMMENT 'Primer apellido del delegado que se inscribe',
  `eldeassegundoapellido` varchar(50) DEFAULT NULL COMMENT 'Segundo apellido del delegado que se inscribe',
  `eldeascorreo` varchar(80) DEFAULT NULL COMMENT 'Correo del delegado que se inscribe',
  `eldeastelefono` varchar(20) DEFAULT NULL COMMENT 'Teléfono del delegado que se inscribe',
  `eldeasimagen` varchar(100) DEFAULT NULL COMMENT 'Ruta de la imagen del delegado que se inscribe',
  `eldeasactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el delegado inscrito esta activo',
  `eldeasesvotoblanco` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Determina si el delegado es voto en blanco',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `elecciondelegadoaspirante`
--

INSERT INTO `elecciondelegadoaspirante` (`eldeasid`, `eledelid`, `tipideid`, `agenid`, `eldeasdocumento`, `eldeasnumero`, `eldeasfechahora`, `eldeasprimernombre`, `eldeassegundonombre`, `eldeasprimerapellido`, `eldeassegundoapellido`, `eldeascorreo`, `eldeastelefono`, `eldeasimagen`, `eldeasactivo`, `eldeasesvotoblanco`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '1', 0, '2022-10-01 22:15:27', 'Voto ', NULL, 'en blanco', NULL, NULL, NULL, NULL, 1, 1, '2022-11-03 18:30:01', '2022-11-03 18:30:01'),
(2, 1, 1, 2, '1', 0, '2022-10-01 22:15:27', 'voto', NULL, 'en blanco', NULL, NULL, NULL, NULL, 1, 1, '2022-11-03 18:30:01', '2022-11-03 18:30:01'),
(3, 1, 2, 1, '5458877', 1, '2022-10-03 16:56:57', 'MARCO', 'FIDEL', 'BAYONA', 'RUEDAS', 'marcobayonaru@gmail.com', '3186589047', '5471413_WIN_20230116_14_31_19_Pro.jpg', 1, 0, '2022-10-04 01:56:57', '2022-10-05 02:00:41'),
(4, 1, 2, 1, '26780600', 2, '2022-10-03 17:04:58', 'DENIS', 'MARIA', 'RUEDAS', 'GARCIA', 'denisruedas61@gmail.com', '3165033001', '27851410_LUCILA.PNG', 1, 0, '2022-10-04 02:04:58', '2022-10-05 20:31:57'),
(5, 1, 2, 1, '26774947', 3, '2022-10-03 17:06:37', 'CECILIA', '', 'VERA', 'SANTIAGO', 'ceciliavera71@hotmail.com', '3213177046', '27852037_MAGALY.PNG', 1, 0, '2022-10-04 02:06:37', '2022-10-04 02:06:37'),
(6, 1, 2, 1, '1066063083', 4, '2022-10-03 17:08:33', 'OSCAR', 'EDUARDO', 'DELGADO', 'BOHORQUEZ', 'oscar1994mariana@gmail.com', '3187139467', '5486885_WIN_20230126_15_03_31_Pro.jpg', 1, 0, '2022-10-04 02:08:33', '2022-10-04 02:08:33'),
(7, 1, 2, 1, '88143184', 5, '2022-10-03 17:10:21', 'NAUN', 'ALEXANDER', 'MOLINA', 'RINCON', 'naun.alex69@gmail.com', '3112640044', '5486978_WIN_20230116_09_54_24_Pro.jpg', 1, 0, '2022-10-04 02:10:21', '2022-10-04 02:10:21'),
(8, 1, 2, 1, '5035051', 6, '2022-10-03 17:11:46', 'LUIS', 'FERNANDO', 'QUINTERO', 'DUARTE', 'fedoquin@hotmail.com', '3165325209', '5487519_WIN_20230118_10_55_50_Pro.jpg', 1, 0, '2022-10-04 02:11:46', '2022-10-04 02:11:46'),
(9, 1, 2, 1, '26774708', 7, '2022-10-03 17:13:13', 'TORCOROMA', '', 'GARCIA', 'DUARTE', 'torco64@gmail.com', '3108707928', '27852373_ILVA ROSA.PNG', 1, 0, '2022-10-04 02:13:13', '2022-10-04 02:13:13'),
(10, 1, 2, 1, '26777300', 8, '2022-10-03 17:14:33', 'NANCY', '', 'CARRASCAL', 'NORIEGA', 'ncarrascalnoriega@gmail.com', '3186383938', '27852439_image_2023_01_27T14_03_57_766Z.png', 1, 0, '2022-10-04 02:14:33', '2022-10-04 02:14:33'),
(11, 1, 2, 1, '1007959718', 9, '2022-10-03 17:18:31', 'EIDER', 'JOHAN', 'CARRILLO', 'CACERES', 'carrillo26eider@gmail.com', '3178681582', '5505022_MANUEL.PNG', 1, 0, '2022-10-04 02:18:31', '2022-10-04 02:18:31'),
(12, 1, 2, 1, '12435754', 10, '2022-10-03 17:20:19', 'ALEJANDRO', '', 'CARRASCAL', 'GARCIA', 'alejocarrascal@gmail.com', '3175910130', '', 1, 0, '2022-10-04 02:20:19', '2022-10-04 02:20:19'),
(13, 1, 2, 1, '5035242', 11, '2022-10-03 17:23:25', 'LUIS', 'EMIRO', 'DUARTE', 'QUINTERO', 'ld6059439@gmail.com', '3213547370', '', 1, 0, '2022-10-04 02:23:25', '2022-10-04 02:23:25'),
(14, 1, 2, 1, '26774663', 12, '2022-10-03 17:26:03', 'MARIA', 'NELLY', 'BOHORQUEZ', 'DE SANTIAGO', 'manebosa@hotmail.com', '3176201538', '', 1, 0, '2022-10-04 02:26:03', '2022-10-04 02:26:03'),
(15, 1, 2, 1, '37329114', 13, '2022-10-03 17:27:27', 'LUCIA', '', 'CHINCHILLA', 'CHINCHILLA', 'sincorreo@gmail.com', '3175061236', '', 1, 0, '2022-10-04 02:27:27', '2022-10-04 02:27:27'),
(16, 1, 2, 1, '88279205', 14, '2022-10-03 17:29:10', 'HUBERTH', '', 'MOLINA', 'MORA', 'sincorreo@hotmail.com', '3178176278', '', 1, 0, '2022-10-04 02:29:10', '2022-10-04 02:29:10'),
(17, 1, 2, 1, '5036072', 15, '2022-10-03 17:31:27', 'ELIECER', '', 'REYES', 'ARIAS', 'eliecerreyesarias28@hotmail.com', '3185783651', '', 1, 0, '2022-10-04 02:31:27', '2022-10-04 02:31:27'),
(18, 1, 2, 1, '26774659', 16, '2022-10-03 17:33:02', 'DORALBA', '', 'MENDOZA', 'SANTIAGO', 'doralbamendoza16@gmail.com', '3175721712', NULL, 0, 0, '2022-10-04 02:33:02', '2022-10-19 01:30:44'),
(19, 1, 2, 1, '5035435', 17, '2022-10-03 17:34:55', 'LUIS', 'ALFONSO', 'RIOS', 'RIOS', 'blancaruedas75@gmail.com', '3168188542', NULL, 0, 0, '2022-10-04 02:34:55', '2022-10-19 01:31:58'),
(20, 1, 2, 1, '49782615', 18, '2022-10-04 11:50:51', 'LILIANA', 'DE JESUS', 'SANTANA', 'SAUMETH', 'lilianasantanasaumeth1977@hotmail.com', '3162446480', '27852353_MARTA.PNG', 1, 0, '2022-10-04 20:50:51', '2022-10-04 20:50:51'),
(21, 1, 2, 1, '5036272', 19, '2022-10-04 17:02:32', 'DEIMMAR', '', 'DURAN', 'PORTILLO', 'deimarduran470@gmail.com', '3107036981', NULL, 1, 0, '2022-10-05 02:02:32', '2022-10-15 01:59:55'),
(22, 1, 2, 1, '1007283563', 20, '2022-10-05 10:59:55', 'DANIELA', '', 'BOHORQUEZ', 'MENESES', 'bohorquezd480@gmail.com', '3138207516', '', 1, 0, '2022-10-05 19:59:55', '2022-10-05 19:59:55'),
(23, 1, 2, 1, '1091654839', 21, '2022-10-06 11:59:53', 'KARINA', 'ROCIO', 'BARBOSA', 'CASTRO', 'karinarocca25@gmail.com', '3168662112', '', 1, 0, '2022-10-06 20:59:53', '2022-10-06 20:59:53'),
(24, 1, 2, 1, '26774858', 22, '2022-10-06 12:04:33', 'ZORAIDA', '', 'CONTRERAS', 'MANZANO', 'sarayacon@yahoo.es', '3164903472', '', 1, 0, '2022-10-06 21:04:33', '2022-10-06 21:04:33'),
(25, 1, 2, 1, '5793651', 23, '2022-10-06 16:42:46', 'NAIRO', 'ALFONSO', 'QUINTERO', 'VEGA', 'sincorreo@gmail.com', '3115346876', NULL, 1, 0, '2022-10-07 01:42:46', '2022-10-15 20:02:11'),
(26, 1, 2, 1, '5035339', 24, '2022-10-06 16:45:29', 'EDGAR', '', 'ASCANIO', 'PEREZ', 'edgarascinio@gmail.com', '3186118893', '', 1, 0, '2022-10-07 01:45:29', '2022-10-07 01:45:29'),
(27, 1, 2, 1, '13362393', 25, '2022-10-06 16:46:57', 'JULIO', 'HELI', 'GAONA', 'MANZANO', 'sincorreo@gmail.com', '3135399947', '', 1, 0, '2022-10-07 01:46:57', '2022-10-07 01:46:57'),
(28, 1, 2, 1, '1091679273', 26, '2022-10-06 16:48:25', 'INGRITH', 'XIOMARA', 'MOLINA', 'SANTIAGO', 'ingrithmolina@hotmail.com', '3138774066', '', 1, 0, '2022-10-07 01:48:25', '2022-10-07 01:48:25'),
(29, 1, 2, 2, '13479975', 1, '2022-10-07 10:00:43', 'JESUS', 'AMADO', 'FLOREZ', 'ORDOÑEZ', 'jesamado1366@hotmail.com', '3118087977', '', 1, 0, '2022-10-07 19:00:43', '2022-10-07 19:00:43'),
(30, 1, 2, 1, '1066062899', 27, '2022-10-07 16:15:06', 'MARTHA', 'LORENA', 'AMAYA', 'MOLINA', 'mlamayam@ufpso.edu.co', '3107088421', '', 1, 0, '2022-10-08 01:15:06', '2022-10-08 01:15:06'),
(31, 1, 2, 1, '26777365', 28, '2022-10-07 16:19:24', 'YEGNY', 'BIBIANA', 'LOZANO', 'ANGARITA', 'yeggny@gmail.com', '3163586141', '', 1, 0, '2022-10-08 01:19:24', '2022-10-08 01:19:24'),
(32, 1, 2, 1, '1003257534', 29, '2022-10-10 08:35:00', 'CAROLINA', '', 'GONZALES', 'GUTIERREZ', 'carogogu09@hotmail.com', '3125073770', '', 1, 0, '2022-10-10 17:35:00', '2022-10-10 17:35:00'),
(33, 1, 2, 1, '26777273', 30, '2022-10-10 17:17:17', 'OMAYDA', '', 'TORREZ', 'CARREÑO', 'omaydatoca04@gmail.com', '3154822473', '', 1, 0, '2022-10-11 02:17:17', '2022-10-11 02:17:17'),
(34, 1, 2, 1, '1066063010', 31, '2022-10-10 17:19:38', 'OSNEIDER', '', 'CONTRERAS', 'MENDOZA', 'ocontrerasm@ufpso.edu.co', '3142744797', '', 1, 0, '2022-10-11 02:19:38', '2022-10-11 02:19:38'),
(35, 1, 2, 1, '1003257672', 32, '2022-10-10 17:22:45', 'YHON', 'JAIRO', 'JACOME', 'JACOME', 'jacomejacomejhonjairo04@gmail.com', '3132486084', '', 1, 0, '2022-10-11 02:22:45', '2022-10-11 02:22:45'),
(36, 1, 2, 1, '49761164', 33, '2022-10-10 17:24:32', 'PATRICIA', 'DEL ROSARIO', 'GARCIA', 'SANCHEZ', 'patolyn29@hotmail.com', '3124805593', '', 1, 0, '2022-10-11 02:24:32', '2022-10-11 02:24:32'),
(37, 1, 2, 1, '5035439', 34, '2022-10-10 17:26:40', 'JOSE', 'ENCARNACION', 'DUARTE', 'PORTILLO', 'joseeduarteportillo@gmail.com', '3224567848', '', 1, 0, '2022-10-11 02:26:40', '2022-10-11 02:26:40'),
(38, 1, 2, 1, '37182379', 35, '2022-10-11 16:55:16', 'OLGA', 'LUCIA', 'QUINTERO', 'LOPEZ', 'olga.sha@hotmail.com', '3132843300', '', 1, 0, '2022-10-12 01:55:16', '2022-10-12 01:55:16'),
(39, 1, 2, 1, '88142785', 36, '2022-10-11 16:59:13', 'JESUS', 'SALVADOR', 'RODRIGUEZ', 'PICON', 'esperanza123456com@gmail.com', '3108839425', '', 1, 0, '2022-10-12 01:59:13', '2022-10-12 01:59:13'),
(40, 1, 2, 1, '5035402', 37, '2022-10-11 17:06:59', 'LUIS', 'GERMAN', 'OSORIO', 'OSORIO', 'osorioosorioluisgerman@gmail.com', '3168662288', '', 1, 0, '2022-10-12 02:06:59', '2022-10-12 02:06:59'),
(41, 1, 2, 1, '26774951', 38, '2022-10-12 17:00:25', 'SONIA', 'ESTER', 'SANTIAGO', 'CASTILLA', 'sonia_santiago2714@hotmail.com', '3108700121', '', 1, 0, '2022-10-13 02:00:25', '2022-10-13 02:00:25'),
(42, 1, 2, 1, '1066062810', 39, '2022-10-12 17:02:19', 'HERNEY', '', 'MANDON', 'NAVARRO', 'hmandon92@gmail.com', '3107713160', '', 1, 0, '2022-10-13 02:02:19', '2022-10-13 02:02:19'),
(43, 1, 2, 1, '26777372', 40, '2022-10-12 17:12:39', 'GISELA', 'IRINA', 'ORTIZ', 'ANGARITA', 'giselairina@hotmail.com', '3167808831', '', 1, 0, '2022-10-13 02:12:39', '2022-10-13 02:12:39'),
(44, 1, 2, 1, '26777413', 41, '2022-10-12 17:14:45', 'NELLY', '', 'VARGAS', 'PEÑARANDA', 'adrianchinchilla2305@gmail.com', '3117239797', '', 1, 0, '2022-10-13 02:14:45', '2022-10-13 02:14:45'),
(45, 1, 2, 1, '37369226', 42, '2022-10-12 17:19:09', 'MAGALY', '', 'SANGUINO', 'JACOME', 'magalysanguino87@hotmail.com', '3206698360', NULL, 0, 0, '2022-10-13 02:19:09', '2022-10-19 01:32:26'),
(46, 1, 2, 1, '26774702', 43, '2022-10-12 17:20:43', 'ROSELIA', '', 'GALVIS', 'PACHECO', 'galvisroselia37@gmail.com', '3152488620', '', 1, 0, '2022-10-13 02:20:43', '2022-10-13 02:20:43'),
(47, 1, 2, 1, '1978917', 44, '2022-10-13 17:16:42', 'RAMON', 'DAVID', 'SALAZAR', 'RINCON', 'radasa10@hotmail.com', '3204018506', '1978917_Ramon.png', 1, 0, '2022-10-14 02:16:42', '2022-10-14 02:16:42'),
(48, 1, 2, 1, '26775063', 45, '2022-10-13 17:19:18', 'OTILIA', '', 'NAVARRO', 'PICON', 'otilianavarro97@gmail.com', '3153204558', '', 1, 0, '2022-10-14 02:19:18', '2022-10-14 02:19:18'),
(49, 1, 2, 1, '1733931', 46, '2022-10-13 17:24:04', 'CARMEN', 'ALONSO', 'TRILLOS', 'SANCHEZ', 'mcarrascaltrillos@hotmail.com', '3107929496', '', 1, 0, '2022-10-14 02:24:04', '2022-10-14 02:24:04'),
(50, 1, 2, 1, '1065124120', 47, '2022-10-13 17:27:11', 'MARTHA', 'MILENA', 'QUINTERO', 'MENDOZA', 'marthamilenaquintero@gmail.com', '3228965888', '', 1, 0, '2022-10-14 02:27:11', '2022-10-14 02:27:11'),
(51, 1, 2, 1, '1066062638', 48, '2022-10-13 17:29:44', 'ALBEIRO', '', 'TORRES', 'CHINCHILLA', 'albeiro4@outlook.com', '3107727052', '', 1, 0, '2022-10-14 02:29:44', '2022-10-14 02:29:44'),
(52, 1, 2, 1, '26777406', 49, '2022-10-13 17:38:53', 'EDITH', 'JOHANA', 'SANCHEZ', 'BOHORQUEZ', 'edithbohorquez543@gmail.com', '3124363200', NULL, 1, 0, '2022-10-14 02:38:53', '2022-10-21 01:16:00'),
(53, 1, 2, 1, '1066062762', 50, '2022-10-13 17:43:57', 'HECTOR', 'MANUEL', 'SANTIAGO', 'RUEDAS', 'hmanuelsantiagor@gmail.com', '3184247186', '', 1, 0, '2022-10-14 02:43:57', '2022-10-14 02:43:57'),
(54, 1, 2, 1, '26777211', 51, '2022-10-14 16:38:09', 'DORIS', 'MARIA', 'SANTIAGO', 'QUINTERO', 'dorissantiagoquintero@gmail.com', '3143940586', '', 1, 0, '2022-10-15 01:38:09', '2022-10-15 01:38:09'),
(55, 1, 2, 1, '26774787', 52, '2022-10-14 16:40:10', 'ADELINA', '', 'NAVARRO', 'BOHORQUEZ', 'adenabo21@gmail.com', '3112535998', '', 1, 0, '2022-10-15 01:40:10', '2022-10-15 01:40:10'),
(56, 1, 2, 1, '5035699', 53, '2022-10-14 16:42:03', 'ADRIAN', 'FELIPE', 'HORLANDY', 'RIOS', 'adrianhorlandy1977@hotmail.com', '3167822042', '', 1, 0, '2022-10-15 01:42:03', '2022-10-15 01:42:03'),
(57, 1, 2, 1, '1091654054', 54, '2022-10-14 16:44:02', 'YAMILE', '', 'SOLANO', 'CASTRO', 'yamilesolanocastro12@gmail.com', '3153081808', '', 1, 0, '2022-10-15 01:44:02', '2022-10-15 01:44:02'),
(58, 1, 2, 1, '5036328', 55, '2022-10-14 16:45:39', 'LIBARDO', 'ALONSO', 'GALVIS', 'SANCHEZ', 'galvizlibardo19@gmail.com', '3172647928', '', 1, 0, '2022-10-15 01:45:39', '2022-10-15 01:45:39'),
(59, 1, 2, 1, '26774838', 56, '2022-10-14 16:47:06', 'LUISA', 'TORCOROMA', 'OSORIO', 'OSORIO', 'luisaosorio1966@hotmail.com', '3175123571', '', 1, 0, '2022-10-15 01:47:06', '2022-10-15 01:47:06'),
(60, 1, 2, 1, '1091653690', 57, '2022-10-14 16:53:31', 'YULIETH', 'PAOLA', 'PINZON', 'GRANADOS', 'pinzongranados1986@outlook.com', '3182743518', NULL, 1, 0, '2022-10-15 01:53:31', '2022-10-15 01:54:10'),
(61, 1, 2, 1, '77175658', 58, '2022-10-14 16:55:41', 'CARMEN', 'ANGEL', 'MADARIAGA', 'MANZANO', 'caanmama@yahoo.es', '3167250720', '', 1, 0, '2022-10-15 01:55:41', '2022-10-15 01:55:41'),
(62, 1, 2, 1, '26777375', 59, '2022-10-14 16:59:01', 'TORCOMA', '', 'ANGARITA', 'DUARTE', 'torcoromangarita@gmail.com', '3176889267', '', 1, 0, '2022-10-15 01:59:01', '2022-10-15 01:59:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciondelegadoboletin`
--

CREATE TABLE `elecciondelegadoboletin` (
  `eldeboid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla eleccion delegado boletín',
  `eledelid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la elección de delegado',
  `usuaid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del usuario que genera el boletín',
  `eldebofechahora` datetime NOT NULL COMMENT 'Fecha y hora en la cual se registra el boletín',
  `eldebonumeroboletin` tinyint(4) NOT NULL COMMENT 'Número de boletín realizado',
  `eldebototalvotos` int(10) UNSIGNED NOT NULL COMMENT 'Número total de votos realizados hasta la fecha y hora del votación',
  `eldeborutaarchivo` varchar(80) NOT NULL COMMENT 'Ruta del archivo en el cual se encuentra el boletín generado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciondelegadoproceso`
--

CREATE TABLE `elecciondelegadoproceso` (
  `eldeprid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla inscripcion delegado proceso',
  `eledelid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la elección de delegado',
  `asocid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla asociado',
  `eldeprfecha` date NOT NULL COMMENT 'Fecha en la cual se registra el voto por el asociado',
  `eldeprhora` time NOT NULL COMMENT 'Hora en la cual se registra el voto por el asociado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `elecciondelegadoproceso`
--

INSERT INTO `elecciondelegadoproceso` (`eldeprid`, `eledelid`, `asocid`, `eldeprfecha`, `eldeprhora`, `created_at`, `updated_at`) VALUES
(1, 1, 19177, '2026-09-21', '10:09:33', '2026-09-22 03:10:33', '2026-09-22 03:10:33'),
(2, 1, 16875, '2026-09-21', '10:09:51', '2026-09-22 03:25:51', '2026-09-22 03:25:51'),
(3, 1, 16876, '2026-09-21', '10:09:50', '2026-09-22 03:33:50', '2026-09-22 03:33:50'),
(4, 1, 16878, '2026-09-22', '12:09:36', '2026-09-22 17:15:36', '2026-09-22 17:15:36'),
(5, 1, 16879, '2026-09-22', '12:09:59', '2026-09-22 17:19:59', '2026-09-22 17:19:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elecciondelegadovoto`
--

CREATE TABLE `elecciondelegadovoto` (
  `eldevoid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla inscripción delegado voto',
  `eledelid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la elección de delegado',
  `eldeasid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del aspirante a delegado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `elecciondelegadovoto`
--

INSERT INTO `elecciondelegadovoto` (`eldevoid`, `eledelid`, `eldeasid`, `created_at`, `updated_at`) VALUES
(1, 1, 47, '2026-09-22 03:10:33', '2026-09-22 03:10:33'),
(2, 1, 47, '2026-09-22 03:25:51', '2026-09-22 03:25:51'),
(3, 1, 1, '2026-09-22 03:33:50', '2026-09-22 03:33:50'),
(4, 1, 47, '2026-09-22 17:15:36', '2026-09-22 17:15:36'),
(5, 1, 47, '2026-09-22 17:19:59', '2026-09-22 17:19:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `emprid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla empresa',
  `emprnit` varchar(15) NOT NULL COMMENT 'Nit de la empresa',
  `emprnombre` varchar(100) NOT NULL COMMENT 'Nombre de la empresa',
  `emprsigla` varchar(20) DEFAULT NULL COMMENT 'Sigla de la empresa',
  `emprlema` varchar(100) DEFAULT NULL COMMENT 'Lema de la empresa',
  `emprdireccion` varchar(80) NOT NULL COMMENT 'Dirección de la empresa',
  `emprciudad` varchar(80) NOT NULL COMMENT 'Ciudad en donde se encuentra la empresa',
  `emprcorreo` varchar(80) DEFAULT NULL COMMENT 'Correo de la empresa',
  `emprtelefonofijo` varchar(20) DEFAULT NULL COMMENT 'Teléfono fijo de contacto con la empresa',
  `emprtelefonocelular` varchar(20) DEFAULT NULL COMMENT 'Teléfono celular de contacto con la empresa',
  `emprurl` varchar(100) DEFAULT NULL COMMENT 'Url de la páguina web institucional',
  `emprlogo` varchar(100) DEFAULT NULL COMMENT 'Favicon de la empresa en jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`emprid`, `emprnit`, `emprnombre`, `emprsigla`, `emprlema`, `emprdireccion`, `emprciudad`, `emprcorreo`, `emprtelefonofijo`, `emprtelefonocelular`, `emprurl`, `emprlogo`, `created_at`, `updated_at`) VALUES
(1, '800.145.149-3', 'COOPERATIVA ESPECIALIZADA DE AHORRO Y CRÉDITO', 'COOPIGON', 'Servicios financieros a su alcance', 'Calle 3 No.2-60 Barrio la villa González, Cesar', 'Gonzalez - Cesar', 'coopigon2@yahoo.es', '3158118152', '3158118153', 'www.coopigon.com', '1587855129_logo-coopigon.png', '2026-09-21 19:11:09', '2026-09-21 19:11:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionalidad`
--

CREATE TABLE `funcionalidad` (
  `funcid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla funcionalidad',
  `moduid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del módulo',
  `funcnombre` varchar(80) NOT NULL COMMENT 'Nombre de la funcionalidad',
  `functitulo` varchar(80) DEFAULT NULL COMMENT 'Título de la funcionalidad',
  `funcruta` varchar(60) DEFAULT NULL COMMENT 'Ruta de la funcionalidad',
  `funcicono` varchar(30) DEFAULT NULL COMMENT 'Clase de css para montar en el link del menú',
  `funcorden` smallint(6) NOT NULL COMMENT 'Orden del en el árbol del menú',
  `funcactiva` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si la funcionalidad encuentra activa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `funcionalidad`
--

INSERT INTO `funcionalidad` (`funcid`, `moduid`, `funcnombre`, `functitulo`, `funcruta`, `funcicono`, `funcorden`, `funcactiva`, `created_at`, `updated_at`) VALUES
(1, 1, 'Menú', 'Gestionar menú', 'admin/configurar/menu', 'menu', 1, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(2, 1, 'Roles', 'Gestionar roles', 'admin/configurar/roles', 'people', 2, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(3, 1, 'Correo', 'Gestionar correo', 'admin/configurar/correo', 'alternate_email', 3, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(4, 1, 'Empresa', 'Gestionar empresa', 'admin/configurar/empresa', 'business', 4, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(5, 1, 'Actas', 'Gestionar actas', 'admin/configurar/acta', 'menu_book', 5, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(6, 2, 'Usuario', 'Gestionar usuario', 'admin/gestionar/usuario', 'account_circle', 1, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(7, 2, 'Tipos de Órganos', 'Gestionar tipos de órganos', 'admin/gestionar/tipos', 'schema', 2, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(8, 2, 'Órganos de Elección', 'Gestionar órganos de elección', 'admin/gestionar/organosEleccion', 'account_box', 3, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(9, 2, 'Cargar Asociados', 'Cargar asociados', 'admin/gestionar/cargarAsociado', 'import_contacts', 4, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(10, 2, 'Asociados', 'Gestionar asociados', 'admin/gestionar/asociados', 'assignment', 5, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(11, 3, 'Gestión', 'Gestionar  gestión de elección de delegados', 'admin/eleccion/delegado/gestion', 'menu_book', 1, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(12, 3, 'Registrar Aspirantes', 'Registrar aspirantes', 'admin/eleccion/delegado/registrarAspirante', 'how_to_reg', 2, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(13, 3, 'Abrir Votación', 'Abrir votación', 'admin/eleccion/delegado/abrirVotacion', 'storage', 3, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(14, 3, 'Imprimir Actas', 'Imprimir actas', 'admin/eleccion/delegado/imprimirActas', 'announcement', 4, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(15, 3, 'Boletín de Votación', 'Boletín de votación', 'admin/eleccion/delegado/boletinVotacion', 'cloud_sync', 5, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(16, 4, 'Delegados', 'Gestionar delegados', 'admin/organos/eleccion/delegados', 'person', 1, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(17, 4, 'Generar Token', 'Generar token', 'admin/organos/eleccion/generarToken', 'token', 2, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(18, 4, 'Aspirantes', 'Gestionar aspirantes', 'admin/organos/eleccion/aspirantes', 'wc', 3, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(19, 4, 'Jurados', 'Gestionar jurados', 'admin/organos/eleccion/jurados', 'assignment_add', 4, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56'),
(20, 4, 'Generar Votación', 'Generar votación', 'admin/organos/eleccion/generarVotacion', 'how_to_vote', 5, 1, '2026-09-25 13:22:56', '2026-09-25 13:22:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialcontrasena`
--

CREATE TABLE `historialcontrasena` (
  `hisconid` bigint(20) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla historial de contrasena',
  `usuaid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del usuario',
  `hisconpassword` varchar(255) NOT NULL COMMENT 'Password del usuario utilizado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historialcontrasena`
--

INSERT INTO `historialcontrasena` (`hisconid`, `usuaid`, `hisconpassword`, `created_at`, `updated_at`) VALUES
(1, 2, '$2y$12$Pytoa3I/XHflqP08SjuU4.EIz6FGhzmDNx0Aalq.5soNBWBKOb.qO', '2026-09-25 20:52:25', '2026-09-25 20:52:25'),
(2, 2, '$2y$12$OPonN5Yufpr7vbv9AZ6AjeSnbcT5lrXz70TEUvBl8kYarzkOhHsPq', '2026-09-25 20:57:29', '2026-09-25 20:57:29'),
(3, 2, '$2y$12$liGViRM5jj6WJ/qSPapowO/uVJ9HhXE.hOLavt.Bk0EkGkMNR867u', '2026-09-25 20:59:39', '2026-09-25 20:59:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacionconfiguracioncorreo`
--

CREATE TABLE `informacionconfiguracioncorreo` (
  `incocoid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla información configuración del correo',
  `incocohost` varchar(50) NOT NULL COMMENT 'Host para el cual se permite enviar el correo',
  `incocousuario` varchar(80) NOT NULL COMMENT 'Usuario o correo con el cual se va autenticar para enviar los correos en el sistema',
  `incococlave` varchar(20) NOT NULL COMMENT 'Clave del correo para acceder a la plataforma',
  `incococlaveapi` varchar(20) NOT NULL COMMENT 'Clave de la api para autenticar y poder enviar el corro',
  `incocopuerto` varchar(4) NOT NULL COMMENT 'Puerto por el cual se envia el correo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `informacionconfiguracioncorreo`
--

INSERT INTO `informacionconfiguracioncorreo` (`incocoid`, `incocohost`, `incocousuario`, `incococlave`, `incococlaveapi`, `incocopuerto`, `created_at`, `updated_at`) VALUES
(1, 'smtp.gmail.com', 'notificacionpqrs@gmail.com', 'Notific@cionPqrs2022', 'tofgejwboupwysyf', '587', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacionnotificacioncorreo`
--

CREATE TABLE `informacionnotificacioncorreo` (
  `innocoid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla informacion notificación correo',
  `innoconombre` varchar(50) NOT NULL COMMENT 'Nombre con el cual se consulta desde el sistema',
  `innocoasunto` varchar(120) NOT NULL COMMENT 'Asunto de la información que lleva notificación del correo',
  `innococontenido` longtext NOT NULL COMMENT 'Contenido de la información que lleva notificación del correo',
  `innocoenviarpiepagina` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si se va incluir el contenido de pie de pagina',
  `innocoenviarcopia` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina se se desea enviar copia al administrador',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `informacionnotificacioncorreo`
--

INSERT INTO `informacionnotificacioncorreo` (`innocoid`, `innoconombre`, `innocoasunto`, `innococontenido`, `innocoenviarpiepagina`, `innocoenviarcopia`, `created_at`, `updated_at`) VALUES
(1, 'piePagina', 'Pie Página Correo', '<p style=\"text-align: justify;\"><strong>Para su inter&eacute;s</strong>:&nbsp;<br /><br /><span style=\"font-size: 10pt;\">1. Este correo fue generado autom&aacute;ticamente, por favor no responda a &eacute;l.</span><br /><span style=\"font-size: 10pt;\">2. La informaci&oacute;n contenida en esta comunicaci&oacute;n es confidencial y s&oacute;lo puede ser utilizada por la persona natural o jur&iacute;dica a la cual est&aacute; dirigida.</span><br /><span style=\"font-size: 10pt;\">3. Si no es el destinatario autorizado, cualquier retenci&oacute;n, difusi&oacute;n, distribuci&oacute;n o copia de este mensaje, se encuentra prohibida y sancionada por la ley.</span><br /><span style=\"font-size: 10pt;\">4. Si por error recibe este mensaje, favor reenviar y borrar el mensaje recibido inmediatamente\". (Resoluci&oacute;n No. 089 de 2003 - Reglamento para el uso de Internet y Correo Electr&oacute;nico en el AGN. Art&iacute;culo 3&deg; numeral 5.</span></p>', 0, 0, '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(2, 'notificarRegistroUsuario', 'Creación de usuario y acceso al sistema de Elecciones', '<p style=\"text-align: justify;\">Estimado(a) <strong>nombreUsuario</strong>:</p>\r\n<p style=\"text-align: justify;\">La Cooperativa especializada de ahorro y cr&eacute;dito <strong>nombreEmpresa </strong>se permite informar que ha sido registrado(a) como usuario del Sistema de Elecciones, plataforma destinada a apoyar la gesti&oacute;n, control y seguimiento de los procesos de elecci&oacute;n y toma de decisiones de nuestros asociados y delegados.</p>\r\n<p style=\"text-align: justify;\">En su calidad de empleado(a) o asistente, se ha creado su cuenta de usuario, mediante la cual podr&aacute; acceder al sistema y gestionar las solicitudes y actividades que le sean asignadas.</p>\r\n<p style=\"text-align: justify;\">Datos de acceso al sistema:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">Usuario: <strong>nickUsuario</strong></li>\r\n<li style=\"text-align: justify;\">Contrase&ntilde;a inicial: <strong>contrasenaUsuario</strong></li>\r\n<li style=\"text-align: justify;\">Direcci&oacute;n de acceso: <strong><a href=\"\\&quot;urlSistema\\&quot;\">urlSistema</a></strong></li>\r\n</ul>\r\n<p style=\"text-align: justify;\">Por seguridad, tenga en cuenta que la contrase&ntilde;a proporcionada es de uso inicial. Al ingresar por primera vez al sistema, se le solicitar&aacute; realizar el cambio de contrase&ntilde;a antes de continuar.</p>\r\n<p style=\"text-align: justify;\">Si presenta alguna dificultad para ingresar al sistema, comun&iacute;quese con el &aacute;rea encargada del soporte de la plataforma.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Cordialmente,</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><em><strong>nombreEmpresa</strong></em><br><em><strong>Sistema de Elecciones</strong></em></p>', 1, 0, '2026-09-21 14:14:39', '2026-09-21 14:14:39'),
(3, 'notificarRegistroAspiranteDelegado', 'ELECCIONES DE DELEGADOS PARA EL PERIODO 2027 - 2030', '<p style=\"text-align: justify;\">Apreciado(a) asociado(a) <strong>nombreAsociado</strong>:</p>\r\n<p style=\"text-align: justify;\">La Cooperativa especializada de ahorro y cr&eacute;dito<strong> nombreEmpresa&nbsp;</strong>se permite informar que, en su calidad de asociado(a) h&aacute;bil y candidato(a) aspirante a tituloEleccion, le ha sido asignado el siguiente n&uacute;mero de inscripci&oacute;n:</p>\r\n<p style=\"text-align: justify;\">N&uacute;mero de inscripci&oacute;n: <strong>numeroAsignado</strong><br>Agencia: <strong>nombreAgencia</strong></p>\r\n<p style=\"text-align: justify;\">Tenga en cuenta la siguiente informaci&oacute;n relacionada con el proceso electoral:</p>\r\n<ol>\r\n<li style=\"text-align: justify;\">Las elecciones se llevar&aacute;n a cabo el d&iacute;a 5 de noviembre de 2026.</li>\r\n<li style=\"text-align: justify;\">La jornada electoral se realizar&aacute; de manera virtual, a trav&eacute;s del siguiente enlace: https://elecciones.coopintegrate.com, y de manera presencial en lugarVotacion.</li>\r\n<li style=\"text-align: justify;\">Para participar en el proceso electoral, deber&aacute; mantener su condici&oacute;n de asociado(a) h&aacute;bil en todos los conceptos requeridos por la Cooperativa.</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">Agradecemos su participaci&oacute;n y compromiso con el proceso democr&aacute;tico de la Cooperativa.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Cordialmente,</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong><em>nombreEmpresa</em></strong><br><strong><em>Sistema de Elecciones</em></strong></p>', 1, 0, '2026-09-21 14:14:39', '2026-09-21 14:14:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresosistema`
--

CREATE TABLE `ingresosistema` (
  `ingsisid` bigint(20) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla ingreso sistema',
  `usuaid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del usuario',
  `ingsisipacceso` varchar(40) NOT NULL COMMENT 'Ip de la cual accede el usuario al sistema',
  `ingsisfechahoraingreso` datetime NOT NULL COMMENT 'Fecha y hora de ingreso al sistema',
  `ingsisfechahorasalida` datetime DEFAULT NULL COMMENT 'Fecha y hora de salida del sistema',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresosistema`
--

INSERT INTO `ingresosistema` (`ingsisid`, `usuaid`, `ingsisipacceso`, `ingsisfechahoraingreso`, `ingsisfechahorasalida`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2026-09-21 15:26:10', NULL, '2026-09-21 20:26:10', '2026-09-21 20:26:10'),
(2, 1, '127.0.0.1', '2026-09-21 15:37:16', NULL, '2026-09-21 20:37:16', '2026-09-21 20:37:16'),
(3, 1, '127.0.0.1', '2026-09-23 12:48:20', NULL, '2026-09-23 17:48:20', '2026-09-23 17:48:20'),
(4, 1, '127.0.0.1', '2026-09-24 20:11:07', '2026-09-24 22:18:47', '2026-09-25 01:11:07', '2026-09-25 03:18:47'),
(5, 1, '127.0.0.1', '2026-09-25 12:18:34', '2026-09-25 14:45:13', '2026-09-25 17:18:34', '2026-09-25 19:45:13'),
(6, 1, '127.0.0.1', '2026-09-25 14:45:28', '2026-09-25 16:07:46', '2026-09-25 19:45:28', '2026-09-25 21:07:46'),
(7, 2, '127.0.0.1', '2026-09-25 15:39:10', '2026-09-25 16:07:23', '2026-09-25 20:39:10', '2026-09-25 21:07:23'),
(8, 1, '127.0.0.1', '2026-09-25 16:10:44', '2026-09-25 16:12:47', '2026-09-25 21:10:44', '2026-09-25 21:12:47'),
(9, 1, '127.0.0.1', '2026-09-25 16:13:18', '2026-09-25 16:13:29', '2026-09-25 21:13:18', '2026-09-25 21:13:29'),
(10, 1, '127.0.0.1', '2026-09-25 16:14:31', NULL, '2026-09-25 21:14:31', '2026-09-25 21:14:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentosfallidos`
--

CREATE TABLE `intentosfallidos` (
  `intfalid` bigint(20) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla intentos fallidos',
  `intfalusurio` varchar(20) NOT NULL COMMENT 'Usuario que accede al sistema',
  `intfalipacceso` varchar(40) NOT NULL COMMENT 'Ip de la cual accede el usuario al sistema',
  `intfalfecha` datetime NOT NULL COMMENT 'Fecha y hora de registro del intento fallido',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `intentosfallidos`
--

INSERT INTO `intentosfallidos` (`intfalid`, `intfalusurio`, `intfalipacceso`, `intfalfecha`, `created_at`, `updated_at`) VALUES
(1, 'DRINCON', '127.0.0.1', '2026-09-25 15:38:53', '2026-09-25 20:38:53', '2026-09-25 20:38:53');

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
(1, '2026_08_20_153835_create_tipos', 1),
(2, '2026_08_20_154836_create_menu', 1),
(3, '2026_08_20_154837_create_usuario', 1),
(4, '2026_08_20_155923_create_notificacion', 1),
(5, '2026_08_20_155933_create_empresa', 1),
(6, '2026_08_20_160156_create_asociado', 1),
(7, '2026_08_20_160817_create_delegado', 1),
(8, '2026_08_20_163958_create_eleccion_delegado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `moduid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla módulo',
  `modunombre` varchar(30) NOT NULL COMMENT 'Nombre del módulo',
  `moduicono` varchar(30) DEFAULT NULL COMMENT 'Clase de css para montar en el link del módulo',
  `moduorden` smallint(6) NOT NULL COMMENT 'Orden del en el árbol del menú que se muestra el módulo',
  `moduactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el módulo encuentra activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`moduid`, `modunombre`, `moduicono`, `moduorden`, `moduactivo`, `created_at`, `updated_at`) VALUES
(1, 'Configurar', 'settings_applications', 1, 1, '2026-09-25 17:20:13', '2026-09-25 17:20:13'),
(2, 'Gestionar', 'content_paste_search', 2, 1, '2026-09-25 17:20:26', '2026-09-25 17:20:26'),
(3, 'Elección Delegados', 'analytics', 3, 1, '2026-09-25 17:20:40', '2026-09-25 17:20:40'),
(4, 'Órgano Elección', 'library_books', 4, 1, '2026-09-25 17:20:54', '2026-09-25 17:20:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organoeleccion`
--

CREATE TABLE `organoeleccion` (
  `orgeleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla órgano de elección',
  `orgeleanio` year(4) NOT NULL COMMENT 'Año en el cual se presenta la órgano de elección',
  `orgeletitulo` varchar(150) NOT NULL COMMENT 'Título de órgano de elección',
  `orgelelugar` varchar(100) NOT NULL COMMENT 'Lugar en el cual se lleva a cabo la órgano de elección',
  `orgeleperiodo` varchar(20) NOT NULL COMMENT 'Perido en el cual esta activa la órgano de elección',
  `orgeleactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el órgano de elección esta activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organoeleccion`
--

INSERT INTO `organoeleccion` (`orgeleid`, `orgeleanio`, `orgeletitulo`, `orgelelugar`, `orgeleperiodo`, `orgeleactivo`, `created_at`, `updated_at`) VALUES
(1, '2026', 'XXXVII Asamblea General de Delegados', 'Auditorio de COOPIGON', '2027-2030', 1, '2026-09-21 19:12:21', '2026-09-21 19:12:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organoeleccionjurado`
--

CREATE TABLE `organoeleccionjurado` (
  `oreljuid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla organo eleccion jurado',
  `orgeleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la elección',
  `deleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del delegado',
  `oreljuesjurado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si es un jurado o un testigo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organoeleccionjurado`
--

INSERT INTO `organoeleccionjurado` (`oreljuid`, `orgeleid`, `deleid`, `oreljuesjurado`, `created_at`, `updated_at`) VALUES
(1, 1, 464, 1, '2026-09-24 03:19:47', '2026-09-24 03:19:47'),
(2, 1, 463, 1, '2026-09-24 03:19:47', '2026-09-24 03:19:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organoeleccionparticipante`
--

CREATE TABLE `organoeleccionparticipante` (
  `orelpaid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla organo eleccion participante',
  `tiporgid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador del tipo de elección',
  `orgeleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la elección',
  `deleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del delegado',
  `orelpaordenparticipacion` tinyint(4) NOT NULL COMMENT 'Orden de participación del delegado',
  `orelpaesvotoblanco` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Determina si es para el voto en blanco',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organoeleccionparticipante`
--

INSERT INTO `organoeleccionparticipante` (`orelpaid`, `tiporgid`, `orgeleid`, `deleid`, `orelpaordenparticipacion`, `orelpaesvotoblanco`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 412, 1, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(2, 1, 1, 415, 2, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(3, 1, 1, 416, 3, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(4, 1, 1, 417, 4, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(5, 1, 1, 420, 5, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(6, 1, 1, 425, 6, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(7, 1, 1, 426, 7, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(8, 1, 1, 431, 8, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(9, 1, 1, 435, 9, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(10, 1, 1, 436, 10, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(11, 1, 1, 441, 11, 0, '2026-09-24 03:09:13', '2026-09-24 03:09:13'),
(14, 1, 1, 1, 100, 1, '2026-09-24 03:12:16', '2026-09-24 03:12:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organoeleccionparticipanteproceso`
--

CREATE TABLE `organoeleccionparticipanteproceso` (
  `orelprid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla organo elección participante proceso',
  `tiporgid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador del tipo de órgano de elección',
  `orgeleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del órgano de elección',
  `orelprtoken` varchar(20) DEFAULT NULL COMMENT 'Token registrado por el usuario en la elección',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organoeleccionparticipanteproceso`
--

INSERT INTO `organoeleccionparticipanteproceso` (`orelprid`, `tiporgid`, `orgeleid`, `orelprtoken`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '146', '2026-09-24 19:25:22', '2026-09-24 19:25:22'),
(2, 1, 1, '150', '2026-09-24 19:26:27', '2026-09-24 19:26:27'),
(3, 1, 1, '199', '2026-09-24 20:42:04', '2026-09-24 20:42:04'),
(4, 1, 1, '217', '2026-09-24 21:03:11', '2026-09-24 21:03:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organoeleccionparticipantevoto`
--

CREATE TABLE `organoeleccionparticipantevoto` (
  `orelpvid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla organo eleccion participante voto',
  `orelpaid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla eleccion participante',
  `orelpvfecha` datetime NOT NULL COMMENT 'Fecha y hora en la cual se registra el voto',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organoeleccionparticipantevoto`
--

INSERT INTO `organoeleccionparticipantevoto` (`orelpvid`, `orelpaid`, `orelpvfecha`, `created_at`, `updated_at`) VALUES
(1, 6, '2026-09-24 14:25:22', '2026-09-24 19:25:22', '2026-09-24 19:25:22'),
(2, 4, '2026-09-24 14:25:22', '2026-09-24 19:25:22', '2026-09-24 19:25:22'),
(3, 3, '2026-09-24 14:25:22', '2026-09-24 19:25:22', '2026-09-24 19:25:22'),
(4, 8, '2026-09-24 14:25:22', '2026-09-24 19:25:22', '2026-09-24 19:25:22'),
(5, 2, '2026-09-24 14:25:22', '2026-09-24 19:25:22', '2026-09-24 19:25:22'),
(6, 14, '2026-09-24 14:26:27', '2026-09-24 19:26:27', '2026-09-24 19:26:27'),
(7, 9, '2026-09-24 15:42:04', '2026-09-24 20:42:04', '2026-09-24 20:42:04'),
(8, 10, '2026-09-24 15:42:04', '2026-09-24 20:42:04', '2026-09-24 20:42:04'),
(9, 8, '2026-09-24 15:42:04', '2026-09-24 20:42:04', '2026-09-24 20:42:04'),
(10, 7, '2026-09-24 15:42:04', '2026-09-24 20:42:04', '2026-09-24 20:42:04'),
(11, 11, '2026-09-24 16:03:11', '2026-09-24 21:03:11', '2026-09-24 21:03:11'),
(12, 10, '2026-09-24 16:03:11', '2026-09-24 21:03:11', '2026-09-24 21:03:11'),
(13, 9, '2026-09-24 16:03:11', '2026-09-24 21:03:11', '2026-09-24 21:03:11'),
(14, 8, '2026-09-24 16:03:11', '2026-09-24 21:03:11', '2026-09-24 21:03:11'),
(15, 7, '2026-09-24 16:03:11', '2026-09-24 21:03:11', '2026-09-24 21:03:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organoelecciontipoorgano`
--

CREATE TABLE `organoelecciontipoorgano` (
  `oreltoid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla organo elección tipo órgano',
  `tiporgid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador del tipo de órgano de elección',
  `orgeleid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del órgano de elección',
  `oreltofechahorainicio` datetime DEFAULT NULL COMMENT 'Fecha y hora en la cual se da incio a la elección del tipo de órgano',
  `oreltofechahoracierre` datetime DEFAULT NULL COMMENT 'Fecha y hora en la cual se cierra a la elección del tipo de órgano',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organoelecciontipoorgano`
--

INSERT INTO `organoelecciontipoorgano` (`oreltoid`, `tiporgid`, `orgeleid`, `oreltofechahorainicio`, `oreltofechahoracierre`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, '2026-09-24 03:03:12', '2026-09-24 03:12:16'),
(2, 3, 1, NULL, NULL, '2026-09-24 03:03:12', '2026-09-24 03:03:12'),
(3, 2, 1, NULL, NULL, '2026-09-24 03:03:12', '2026-09-24 03:03:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rolid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla rol',
  `rolnombre` varchar(80) NOT NULL COMMENT 'Nombre del rol',
  `rolactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el rol encuentra activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rolid`, `rolnombre`, `rolactivo`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 1, '2026-09-25 17:45:06', '2026-09-25 17:45:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolfuncionalidad`
--

CREATE TABLE `rolfuncionalidad` (
  `rolfunid` mediumint(8) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla rol funcionalidad',
  `rolfunrolid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del rol',
  `rolfunfuncid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la funcionalidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rolfuncionalidad`
--

INSERT INTO `rolfuncionalidad` (`rolfunid`, `rolfunrolid`, `rolfunfuncid`) VALUES
(1, 1, 5),
(2, 1, 1),
(3, 1, 15),
(4, 1, 12),
(5, 1, 8),
(6, 1, 18),
(7, 1, 20),
(8, 1, 19),
(9, 1, 16),
(10, 1, 7),
(11, 1, 10),
(12, 1, 11),
(13, 1, 2),
(14, 1, 3),
(15, 1, 4),
(16, 1, 13),
(17, 1, 14),
(18, 1, 9),
(19, 1, 6),
(20, 1, 17);

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
('5DQous9feO9tJ7fq8O6XnBFHdfVmCRkmdSRVwY4x', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJPYWNQTDlrREVoQXRLZjVZNzVMZldOaTFYbHE4QUVnd0NmOWxoNGp2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvZWxlY2Npb25cL2RlbGVnYWRvXC9yZWdpc3RyYXJcL2FzcGlyYW50ZVwvbGlzdCIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MX0=', 1790373547);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoidentificacion`
--

CREATE TABLE `tipoidentificacion` (
  `tipideid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla tipo de identificación',
  `tipidesigla` varchar(4) NOT NULL COMMENT 'Sigla del tipo de identificación',
  `tipidenombre` varchar(50) NOT NULL COMMENT 'Nombre del tipo de identificación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipoidentificacion`
--

INSERT INTO `tipoidentificacion` (`tipideid`, `tipidesigla`, `tipidenombre`) VALUES
(1, 'TI', 'Tarjeta de identidad'),
(2, 'CC', 'Cédula de ciudadanía'),
(3, 'RC', 'Registro civil'),
(4, 'NIT', 'Número de identificación tributaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoorgano`
--

CREATE TABLE `tipoorgano` (
  `tiporgid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla tipo de órgano',
  `tiporgnombre` varchar(50) NOT NULL COMMENT 'Nombre del tipo de órgano',
  `tiporgvotosporpersona` tinyint(4) NOT NULL COMMENT 'Número de votos por persona para el tipo de órgano',
  `tiporgtotalprincipales` tinyint(4) NOT NULL COMMENT 'Total de persona principales para el tipo de órgano',
  `tiporgtotalsuplente` tinyint(4) NOT NULL COMMENT 'Total de persona suplente para el tipo de órgano',
  `tiporglogo` varchar(100) DEFAULT NULL COMMENT 'ruta del logo del tipo de órgano',
  `tiporgactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el tipo de órgano se encuentra activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipoorgano`
--

INSERT INTO `tipoorgano` (`tiporgid`, `tiporgnombre`, `tiporgvotosporpersona`, `tiporgtotalprincipales`, `tiporgtotalsuplente`, `tiporglogo`, `tiporgactivo`, `created_at`, `updated_at`) VALUES
(1, 'Consejo de Administración', 5, 3, 3, '1588782205_consejo_admon.jpg', 1, '2026-09-21 19:12:21', '2026-09-26 00:43:39'),
(2, 'Junta de Vigilancia', 3, 3, 3, '1588782226_junta-vigilancia.png', 0, '2026-09-21 19:12:21', '2026-09-26 00:43:39'),
(3, 'Comité de Apelación', 3, 3, 3, '1588782217_comite-apelacion.jpg', 0, '2026-09-21 19:12:21', '2026-09-26 00:43:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `tokeid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla token',
  `toketoken` varchar(20) NOT NULL COMMENT 'Token único genererado para controlar la elección',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`tokeid`, `toketoken`, `created_at`, `updated_at`) VALUES
(1, '386', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(2, '346', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(3, '853', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(4, '750', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(5, '772', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(6, '491', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(7, '553', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(8, '781', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(9, '146', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(10, '371', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(11, '724', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(12, '907', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(13, '739', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(14, '604', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(15, '492', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(16, '588', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(17, '480', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(18, '197', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(19, '323', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(20, '587', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(21, '910', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(22, '955', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(23, '896', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(24, '217', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(25, '524', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(26, '947', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(27, '275', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(28, '713', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(29, '373', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(30, '529', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(31, '354', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(32, '564', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(33, '920', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(34, '199', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(35, '983', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(36, '350', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(37, '997', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(38, '869', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(39, '807', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(40, '229', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(41, '929', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(42, '699', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(43, '253', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(44, '233', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(45, '908', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(46, '380', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(47, '312', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(48, '849', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(49, '618', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(50, '579', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(51, '368', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(52, '150', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(53, '691', '2026-09-24 02:59:25', '2026-09-24 02:59:25'),
(54, '977', '2026-09-24 02:59:25', '2026-09-24 02:59:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuaid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla usuario',
  `agenid` tinyint(3) UNSIGNED NOT NULL COMMENT 'Identificador de la agencia a la cual pertenece el usuario',
  `usuadocumento` varchar(15) NOT NULL COMMENT 'Documento del usuario',
  `usuanombre` varchar(50) NOT NULL COMMENT 'Nombre del usuario',
  `usuaapellidos` varchar(50) NOT NULL COMMENT 'Apellidos del usuario',
  `usuaemail` varchar(80) NOT NULL COMMENT 'Correo del usuario',
  `usuanick` varchar(20) NOT NULL COMMENT 'Nick del usuario',
  `password` varchar(255) NOT NULL COMMENT 'Password del usuario',
  `usuacambiarpassword` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el usuario debe cambar la contraseña para poder iniciar sesión',
  `usuabloqueado` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Determina si el usuario esta bloqueado',
  `usuaactivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Determina si el usuario esta activo',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuaid`, `agenid`, `usuadocumento`, `usuanombre`, `usuaapellidos`, `usuaemail`, `usuanick`, `password`, `usuacambiarpassword`, `usuabloqueado`, `usuaactivo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, '1978917', 'RAMÓN DAVID', 'SALAZAR RINCÓN', 'radasa10@hotmail.com', 'RSALAZAR', '$2y$12$G915dipnUFyUH/QVcE.Lf.GJtrnvHQIn7nL5W0FCj57KP04bqDhqy', 0, 0, 1, NULL, '2026-09-21 19:11:09', '2026-09-21 19:11:09'),
(2, 1, '19789178', 'DAVID', 'RINCÓN', 'rdsalazarr@ufpso.edu.co', 'DAVIDR', '$2y$12$HRrZ.xpMgZBEWcXthdVVpOImn7edxUFkvBa7WEvpfcvvvKVRbpMT.', 0, 0, 1, NULL, '2026-09-25 20:02:00', '2026-09-25 20:59:39'),
(3, 2, '8787878787', 'MARIA', 'DEL PILAR', 'prueba@hotmailc.om', 'MARIAD', '$2y$12$6qobe3uS5u0khSyEnwLqDOh0gcO6Cf/EyLcdFGAg6y3UddzbabYhq', 1, 0, 1, NULL, '2026-09-25 20:37:37', '2026-09-25 20:37:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariorol`
--

CREATE TABLE `usuariorol` (
  `usurolid` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la tabla usuario rol',
  `usurolusuaid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del usuario',
  `usurolrolid` smallint(5) UNSIGNED NOT NULL COMMENT 'Identificador del rol'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuariorol`
--

INSERT INTO `usuariorol` (`usurolid`, `usurolusuaid`, `usurolrolid`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acta`
--
ALTER TABLE `acta`
  ADD PRIMARY KEY (`actaid`);

--
-- Indices de la tabla `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`agenid`);

--
-- Indices de la tabla `asociado`
--
ALTER TABLE `asociado`
  ADD PRIMARY KEY (`asocid`),
  ADD UNIQUE KEY `uk_asociado` (`asocnumerodocumento`),
  ADD KEY `fk_tipideasoc` (`tipideid`),
  ADD KEY `fk_asocagen` (`agenid`);

--
-- Indices de la tabla `asociadotemporal`
--
ALTER TABLE `asociadotemporal`
  ADD PRIMARY KEY (`asotemid`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `delegado`
--
ALTER TABLE `delegado`
  ADD PRIMARY KEY (`deleid`),
  ADD UNIQUE KEY `uk_delegado` (`deledocumento`),
  ADD UNIQUE KEY `uk_delegadonumero` (`agenid`,`delenumero`);

--
-- Indices de la tabla `elecciondelegado`
--
ALTER TABLE `elecciondelegado`
  ADD PRIMARY KEY (`eledelid`),
  ADD UNIQUE KEY `uk_elecciondelegado` (`eledelanio`);

--
-- Indices de la tabla `elecciondelegadoagencia`
--
ALTER TABLE `elecciondelegadoagencia`
  ADD PRIMARY KEY (`eldeagid`),
  ADD UNIQUE KEY `uk_elecciondelegadoagencia` (`eledelid`,`agenid`),
  ADD KEY `fk_eldeagagen` (`agenid`);

--
-- Indices de la tabla `elecciondelegadoagenciajurado`
--
ALTER TABLE `elecciondelegadoagenciajurado`
  ADD PRIMARY KEY (`eldeajid`),
  ADD UNIQUE KEY `uk_elecciondelegadoagenciajurado` (`eldeagid`,`eldeajdocumento`);

--
-- Indices de la tabla `elecciondelegadoaspirante`
--
ALTER TABLE `elecciondelegadoaspirante`
  ADD PRIMARY KEY (`eldeasid`),
  ADD UNIQUE KEY `uk_inscripciondelegado` (`eledelid`,`agenid`,`eldeasnumero`),
  ADD KEY `fk_eldeastipide` (`tipideid`),
  ADD KEY `fk_eldeasagen` (`agenid`);

--
-- Indices de la tabla `elecciondelegadoboletin`
--
ALTER TABLE `elecciondelegadoboletin`
  ADD PRIMARY KEY (`eldeboid`),
  ADD KEY `fk_eldeboeledel` (`eledelid`),
  ADD KEY `fk_usuaeldebon` (`usuaid`);

--
-- Indices de la tabla `elecciondelegadoproceso`
--
ALTER TABLE `elecciondelegadoproceso`
  ADD PRIMARY KEY (`eldeprid`),
  ADD UNIQUE KEY `uk_elecciondelegadoproceso` (`eledelid`,`asocid`,`eldeprfecha`),
  ADD KEY `fk_eldeprasoc` (`asocid`);

--
-- Indices de la tabla `elecciondelegadovoto`
--
ALTER TABLE `elecciondelegadovoto`
  ADD PRIMARY KEY (`eldevoid`),
  ADD KEY `fk_eldevoeledel` (`eledelid`),
  ADD KEY `fk_eldevoeldeas` (`eldeasid`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`emprid`);

--
-- Indices de la tabla `funcionalidad`
--
ALTER TABLE `funcionalidad`
  ADD PRIMARY KEY (`funcid`),
  ADD KEY `fk_modufunc` (`moduid`);

--
-- Indices de la tabla `historialcontrasena`
--
ALTER TABLE `historialcontrasena`
  ADD PRIMARY KEY (`hisconid`),
  ADD KEY `fk_usuahiscon` (`usuaid`);

--
-- Indices de la tabla `informacionconfiguracioncorreo`
--
ALTER TABLE `informacionconfiguracioncorreo`
  ADD PRIMARY KEY (`incocoid`);

--
-- Indices de la tabla `informacionnotificacioncorreo`
--
ALTER TABLE `informacionnotificacioncorreo`
  ADD PRIMARY KEY (`innocoid`),
  ADD UNIQUE KEY `uk_infornotificacioncorreo` (`innoconombre`);

--
-- Indices de la tabla `ingresosistema`
--
ALTER TABLE `ingresosistema`
  ADD PRIMARY KEY (`ingsisid`),
  ADD KEY `fk_usuaingsis` (`usuaid`);

--
-- Indices de la tabla `intentosfallidos`
--
ALTER TABLE `intentosfallidos`
  ADD PRIMARY KEY (`intfalid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`moduid`);

--
-- Indices de la tabla `organoeleccion`
--
ALTER TABLE `organoeleccion`
  ADD PRIMARY KEY (`orgeleid`),
  ADD UNIQUE KEY `uk_organoeleccion` (`orgeleanio`);

--
-- Indices de la tabla `organoeleccionjurado`
--
ALTER TABLE `organoeleccionjurado`
  ADD PRIMARY KEY (`oreljuid`),
  ADD KEY `fk_oreljuelec` (`orgeleid`),
  ADD KEY `fk_oreljudele` (`deleid`);

--
-- Indices de la tabla `organoeleccionparticipante`
--
ALTER TABLE `organoeleccionparticipante`
  ADD PRIMARY KEY (`orelpaid`),
  ADD KEY `fk_orelpatiporg` (`tiporgid`),
  ADD KEY `fk_orelpaelec` (`orgeleid`),
  ADD KEY `fk_orelpadele` (`deleid`);

--
-- Indices de la tabla `organoeleccionparticipanteproceso`
--
ALTER TABLE `organoeleccionparticipanteproceso`
  ADD PRIMARY KEY (`orelprid`),
  ADD KEY `fk_orelprtiporg` (`tiporgid`),
  ADD KEY `fk_orelprorgele` (`orgeleid`);

--
-- Indices de la tabla `organoeleccionparticipantevoto`
--
ALTER TABLE `organoeleccionparticipantevoto`
  ADD PRIMARY KEY (`orelpvid`),
  ADD KEY `fk_orelpvorelpa` (`orelpaid`);

--
-- Indices de la tabla `organoelecciontipoorgano`
--
ALTER TABLE `organoelecciontipoorgano`
  ADD PRIMARY KEY (`oreltoid`),
  ADD KEY `fk_oreltotiporg` (`tiporgid`),
  ADD KEY `fk_oreltoorgele` (`orgeleid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rolid`);

--
-- Indices de la tabla `rolfuncionalidad`
--
ALTER TABLE `rolfuncionalidad`
  ADD PRIMARY KEY (`rolfunid`),
  ADD KEY `fk_rolfunrol` (`rolfunrolid`),
  ADD KEY `fk_rolfunfunc` (`rolfunfuncid`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tipoidentificacion`
--
ALTER TABLE `tipoidentificacion`
  ADD PRIMARY KEY (`tipideid`),
  ADD UNIQUE KEY `uk_tipoidentificacion` (`tipidesigla`);

--
-- Indices de la tabla `tipoorgano`
--
ALTER TABLE `tipoorgano`
  ADD PRIMARY KEY (`tiporgid`);

--
-- Indices de la tabla `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`tokeid`),
  ADD UNIQUE KEY `uk_token` (`toketoken`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuaid`),
  ADD UNIQUE KEY `uk_usuario` (`usuaemail`),
  ADD UNIQUE KEY `uk_usuario1` (`usuanick`),
  ADD KEY `fk_useragen` (`agenid`);

--
-- Indices de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD PRIMARY KEY (`usurolid`),
  ADD KEY `fk_usuausurol` (`usurolusuaid`),
  ADD KEY `fk_rolusurol` (`usurolrolid`),
  ADD KEY `pk_usurol` (`usurolid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acta`
--
ALTER TABLE `acta`
  MODIFY `actaid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla acta', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `asociado`
--
ALTER TABLE `asociado`
  MODIFY `asocid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla asociado', AUTO_INCREMENT=22508;

--
-- AUTO_INCREMENT de la tabla `asociadotemporal`
--
ALTER TABLE `asociadotemporal`
  MODIFY `asotemid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla asociado temporal';

--
-- AUTO_INCREMENT de la tabla `delegado`
--
ALTER TABLE `delegado`
  MODIFY `deleid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla delegado', AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT de la tabla `elecciondelegado`
--
ALTER TABLE `elecciondelegado`
  MODIFY `eledelid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla elección de delegado', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `elecciondelegadoagencia`
--
ALTER TABLE `elecciondelegadoagencia`
  MODIFY `eldeagid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla eleccion delegado agencia', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `elecciondelegadoagenciajurado`
--
ALTER TABLE `elecciondelegadoagenciajurado`
  MODIFY `eldeajid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla eleccion delegado agencia jurado';

--
-- AUTO_INCREMENT de la tabla `elecciondelegadoaspirante`
--
ALTER TABLE `elecciondelegadoaspirante`
  MODIFY `eldeasid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla inscripcion delegado', AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `elecciondelegadoboletin`
--
ALTER TABLE `elecciondelegadoboletin`
  MODIFY `eldeboid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla eleccion delegado boletín';

--
-- AUTO_INCREMENT de la tabla `elecciondelegadoproceso`
--
ALTER TABLE `elecciondelegadoproceso`
  MODIFY `eldeprid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla inscripcion delegado proceso', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `elecciondelegadovoto`
--
ALTER TABLE `elecciondelegadovoto`
  MODIFY `eldevoid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla inscripción delegado voto', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `emprid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla empresa', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `funcionalidad`
--
ALTER TABLE `funcionalidad`
  MODIFY `funcid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla funcionalidad', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `historialcontrasena`
--
ALTER TABLE `historialcontrasena`
  MODIFY `hisconid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla historial de contrasena', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `informacionconfiguracioncorreo`
--
ALTER TABLE `informacionconfiguracioncorreo`
  MODIFY `incocoid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla información configuración del correo', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `informacionnotificacioncorreo`
--
ALTER TABLE `informacionnotificacioncorreo`
  MODIFY `innocoid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla informacion notificación correo', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ingresosistema`
--
ALTER TABLE `ingresosistema`
  MODIFY `ingsisid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla ingreso sistema', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `intentosfallidos`
--
ALTER TABLE `intentosfallidos`
  MODIFY `intfalid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla intentos fallidos', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `moduid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla módulo', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `organoeleccion`
--
ALTER TABLE `organoeleccion`
  MODIFY `orgeleid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla órgano de elección', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `organoeleccionjurado`
--
ALTER TABLE `organoeleccionjurado`
  MODIFY `oreljuid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla organo eleccion jurado', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `organoeleccionparticipante`
--
ALTER TABLE `organoeleccionparticipante`
  MODIFY `orelpaid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla organo eleccion participante', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `organoeleccionparticipanteproceso`
--
ALTER TABLE `organoeleccionparticipanteproceso`
  MODIFY `orelprid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla organo elección participante proceso', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `organoeleccionparticipantevoto`
--
ALTER TABLE `organoeleccionparticipantevoto`
  MODIFY `orelpvid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla organo eleccion participante voto', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `organoelecciontipoorgano`
--
ALTER TABLE `organoelecciontipoorgano`
  MODIFY `oreltoid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla organo elección tipo órgano', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rolid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla rol', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rolfuncionalidad`
--
ALTER TABLE `rolfuncionalidad`
  MODIFY `rolfunid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla rol funcionalidad', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipoorgano`
--
ALTER TABLE `tipoorgano`
  MODIFY `tiporgid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla tipo de órgano', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `token`
--
ALTER TABLE `token`
  MODIFY `tokeid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla token', AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuaid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla usuario', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  MODIFY `usurolid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla usuario rol', AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asociado`
--
ALTER TABLE `asociado`
  ADD CONSTRAINT `fk_asocagen` FOREIGN KEY (`agenid`) REFERENCES `agencia` (`agenid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipideasoc` FOREIGN KEY (`tipideid`) REFERENCES `tipoidentificacion` (`tipideid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `delegado`
--
ALTER TABLE `delegado`
  ADD CONSTRAINT `fk_deleagen` FOREIGN KEY (`agenid`) REFERENCES `agencia` (`agenid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elecciondelegadoagencia`
--
ALTER TABLE `elecciondelegadoagencia`
  ADD CONSTRAINT `fk_eldeagagen` FOREIGN KEY (`agenid`) REFERENCES `agencia` (`agenid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_eldeageledel` FOREIGN KEY (`eledelid`) REFERENCES `elecciondelegado` (`eledelid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elecciondelegadoagenciajurado`
--
ALTER TABLE `elecciondelegadoagenciajurado`
  ADD CONSTRAINT `fk_eldeajeldeag` FOREIGN KEY (`eldeagid`) REFERENCES `elecciondelegadoagencia` (`eldeagid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elecciondelegadoaspirante`
--
ALTER TABLE `elecciondelegadoaspirante`
  ADD CONSTRAINT `fk_eldeasagen` FOREIGN KEY (`agenid`) REFERENCES `agencia` (`agenid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_eldeaseledel` FOREIGN KEY (`eledelid`) REFERENCES `elecciondelegado` (`eledelid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_eldeastipide` FOREIGN KEY (`tipideid`) REFERENCES `tipoidentificacion` (`tipideid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elecciondelegadoboletin`
--
ALTER TABLE `elecciondelegadoboletin`
  ADD CONSTRAINT `fk_eldeboeledel` FOREIGN KEY (`eledelid`) REFERENCES `elecciondelegado` (`eledelid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuaeldebon` FOREIGN KEY (`usuaid`) REFERENCES `usuario` (`usuaid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elecciondelegadoproceso`
--
ALTER TABLE `elecciondelegadoproceso`
  ADD CONSTRAINT `fk_eldeprasoc` FOREIGN KEY (`asocid`) REFERENCES `asociado` (`asocid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_eldepreledel` FOREIGN KEY (`eledelid`) REFERENCES `elecciondelegado` (`eledelid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elecciondelegadovoto`
--
ALTER TABLE `elecciondelegadovoto`
  ADD CONSTRAINT `fk_eldevoeldeas` FOREIGN KEY (`eldeasid`) REFERENCES `elecciondelegadoaspirante` (`eldeasid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_eldevoeledel` FOREIGN KEY (`eledelid`) REFERENCES `elecciondelegado` (`eledelid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `funcionalidad`
--
ALTER TABLE `funcionalidad`
  ADD CONSTRAINT `fk_modufunc` FOREIGN KEY (`moduid`) REFERENCES `modulo` (`moduid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `historialcontrasena`
--
ALTER TABLE `historialcontrasena`
  ADD CONSTRAINT `fk_usuahiscon` FOREIGN KEY (`usuaid`) REFERENCES `usuario` (`usuaid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingresosistema`
--
ALTER TABLE `ingresosistema`
  ADD CONSTRAINT `fk_usuaingsis` FOREIGN KEY (`usuaid`) REFERENCES `usuario` (`usuaid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `organoeleccionjurado`
--
ALTER TABLE `organoeleccionjurado`
  ADD CONSTRAINT `fk_oreljudele` FOREIGN KEY (`deleid`) REFERENCES `delegado` (`deleid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_oreljuelec` FOREIGN KEY (`orgeleid`) REFERENCES `organoeleccion` (`orgeleid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `organoeleccionparticipante`
--
ALTER TABLE `organoeleccionparticipante`
  ADD CONSTRAINT `fk_orelpadele` FOREIGN KEY (`deleid`) REFERENCES `delegado` (`deleid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orelpaelec` FOREIGN KEY (`orgeleid`) REFERENCES `organoeleccion` (`orgeleid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orelpatiporg` FOREIGN KEY (`tiporgid`) REFERENCES `tipoorgano` (`tiporgid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `organoeleccionparticipanteproceso`
--
ALTER TABLE `organoeleccionparticipanteproceso`
  ADD CONSTRAINT `fk_orelprorgele` FOREIGN KEY (`orgeleid`) REFERENCES `organoeleccion` (`orgeleid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orelprtiporg` FOREIGN KEY (`tiporgid`) REFERENCES `tipoorgano` (`tiporgid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `organoeleccionparticipantevoto`
--
ALTER TABLE `organoeleccionparticipantevoto`
  ADD CONSTRAINT `fk_orelpvorelpa` FOREIGN KEY (`orelpaid`) REFERENCES `organoeleccionparticipante` (`orelpaid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `organoelecciontipoorgano`
--
ALTER TABLE `organoelecciontipoorgano`
  ADD CONSTRAINT `fk_oreltoorgele` FOREIGN KEY (`orgeleid`) REFERENCES `organoeleccion` (`orgeleid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_oreltotiporg` FOREIGN KEY (`tiporgid`) REFERENCES `tipoorgano` (`tiporgid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rolfuncionalidad`
--
ALTER TABLE `rolfuncionalidad`
  ADD CONSTRAINT `fk_rolfunfunc` FOREIGN KEY (`rolfunfuncid`) REFERENCES `funcionalidad` (`funcid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rolfunrol` FOREIGN KEY (`rolfunrolid`) REFERENCES `rol` (`rolid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_useragen` FOREIGN KEY (`agenid`) REFERENCES `agencia` (`agenid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD CONSTRAINT `fk_rolusurol` FOREIGN KEY (`usurolrolid`) REFERENCES `rol` (`rolid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuausurol` FOREIGN KEY (`usurolusuaid`) REFERENCES `usuario` (`usuaid`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
