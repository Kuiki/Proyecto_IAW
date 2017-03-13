-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CATEGORIAS`
--

DROP TABLE IF EXISTS `CATEGORIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIAS` (
  `CodCategoria` char(6) NOT NULL,
  `NombreCategoria` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CodCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIAS`
--

LOCK TABLES `CATEGORIAS` WRITE;
/*!40000 ALTER TABLE `CATEGORIAS` DISABLE KEYS */;
INSERT INTO `CATEGORIAS` VALUES ('AND004','Android'),('LIN001','GNU/Linux'),('PCS005','PCs'),('RAS003','Raspberry'),('SIN000','Sin Categoria'),('WIN002','Windows');
/*!40000 ALTER TABLE `CATEGORIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMENTARIOS`
--

DROP TABLE IF EXISTS `COMENTARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMENTARIOS` (
  `IdComentario` int(11) NOT NULL AUTO_INCREMENT,
  `CodUsuario` char(7) NOT NULL,
  `IdEntrada` char(7) NOT NULL,
  `Comentario` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`IdComentario`,`CodUsuario`,`IdEntrada`),
  CONSTRAINT `en_co` FOREIGN KEY (`IdEntrada`) REFERENCES `ENTRADAS` (`IdEntrada`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `us_co` FOREIGN KEY (`CodUsuario`) REFERENCES `USUARIOS` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMENTARIOS`
--

LOCK TABLES `COMENTARIOS` WRITE;
/*!40000 ALTER TABLE `COMENTARIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMENTARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENTRADAS`
--

DROP TABLE IF EXISTS `ENTRADAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENTRADAS` (
  `IdEntrada` char(7) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `ImagenEntrada` varchar(100) DEFAULT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Contenido` blob,
  `Publicado` char(1) DEFAULT 'N',
  `FechaPublicacion` datetime DEFAULT NULL,
  `UltimaModificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Visitas` int(5) DEFAULT '0',
  `CodUsuario` char(7) NOT NULL,
  PRIMARY KEY (`IdEntrada`,`CodUsuario`),
  KEY `us_en` (`CodUsuario`),
  CONSTRAINT `us_en` FOREIGN KEY (`CodUsuario`) REFERENCES `USUARIOS` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENTRADAS`
--

LOCK TABLES `ENTRADAS` WRITE;
/*!40000 ALTER TABLE `ENTRADAS` DISABLE KEYS */;
INSERT INTO `ENTRADAS` VALUES ('ALPA177','Kim Dotcom podrÃ­a ser extraditado, pero no por piraterÃ­a','sinimagen.png','2017-02-23 11:17:39','\r\n					<p>El Tribunal Superior de Nueva Zelanda ha confirmado que Kim Dotcom podría ser extraditado, pero en contra de todo pronóstico no por las violaciones de derechos de autor que se asocian a su etapa al frente de Megaupload, sino por los delitos de fraude y blanqueo de dinero que Estados Unidos le imputa.</p><p><br></p><p>No hay duda de que “el país de la libertad” tiene ganas de echarle el guante al fundador de Megaupload, y tampoco admite discusión el hecho de que supieron lanzar una ofensiva legal y de presión mediática para conseguir la extradición del mismo.</p><p><br></p><p>Según Estados Unidos el enorme desarrollo de la piratería que permitió Megaupload provocó pérdidas de varios cientos de millones a la industria cinematográfica, pero la comunicación al público a través de Internet de obras protegidas por copyright no es considerado como un delito criminal (penal) en Nueva Zelanda, por lo que no puede sostener una extradición.</p><p><br></p><p>Sin embargo el fraude y el blanqueo de dinero sí tienen la consideración de acto doloso, y por tanto sirven para sustentar esa petición de extradición que mantiene Estados Unidos, como anticipamos al inicio del artículo.</p><p><br></p><p>¿Quiere esto decir que Kim Dotcom va a ser finalmente extraditado? Pues no, pero algunos medios se han colado y lo han dado por hecho. Estamos ante una respuesta judicial que aunque importante no supone una decisión final, ya que cabe recurso contra ella.</p><p><br></p><p>Kim Dotcom se ha mostrado satisfecho en parte con esta decisión y es comprensible, puesto que ha conseguido zafarse de todo lo relacionado con los derechos de autor en la solicitud de extradición. También ha confirmado que tiene pensado recurrir esa posible extradición por los delitos de fraude y blanqueo ante la Corte de Apelaciones de Nueva Zelanda.</p><p>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('ALPA255','Windows 10 RedStone 3 version 1711','sinimagen.png','2017-02-23 08:55:09','\r\n					<p style=\"text-align: justify;\">Microsoft ya está trabajando en una version de su sistema operativo, Windows 10 Redstone 3, para el lazamiento programado en el mes de noviembe como versión 1711.</p><p style=\"text-align: justify;\">Una vez cerrado el grueso del código de la version Redstone 2, cuyo desarrollo concluirá de forma oficial con el cercano lanzamiento de la edición creators Update, Microsoft está trabajando en la próxima versión lo que confirmará las dos actualizacion mayores anuales además de los parches de seguridad.</p><p style=\"text-align: justify;\">Recordemos que con Windows 10, microsoft estrenó un programa de desarrollo contínuo para el sistema operativo que &nbsp;dejó atrás todo lo que se venía haciendo hasta la fecha, al abrir varias lineas de desarrolo en diferentes etapas, desde versiones preliminares alpha en las que se trabaja internamente a compilaciones públicas que se prueban por los usuarios en el canal de prueba Insider.</p><p style=\"text-align: justify;\">Windows 10 Redstone 3 publicará bajo la version 1711 siguiendo la nomenclatura empleada por microsoft, aunque todavia no se ha informado del nombre comercial. El lanzamiento en noviembre celebraría los dos años de la primera actualizacion de Windows 10, la 1511. Se espera que las primeras compilaciones de Windows 10 Redstone 3 se publiquen en el canal insider bastante antes, en el mes de abril.</p><p style=\"text-align: justify;\">Microsoft tendria abierta otra linea de desarrolo, Windows 10 Redstone 4, cuarta actualizacion mayor del sistema que llegaría en la primavera de 2018. Por lo prometido por microsoft hasta ahoram todas las nuevas versiones/actualizaciones de Windows 10 serán gratuitas para los clientes del Sistema.</p><p><br></p><p><br></p><p><br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('ALPA347','Como crear un pendrive booteable de Linux en Windows','sinimagen.png','2017-02-23 08:41:36','\r\n					<p style=\"text-align: center;\"><b>\"Hoy en dia formatear un ordenador es tan facil que hasta un niño de ocho años (o menos) puede hacerlo. Hace unos años, cuando queria formatear mi ordenador a causa de los dichosos virus de Windows, llamabamos al vecino que tenia un locutorio. En ese entonces, creía que era todo un erudito con el ordenador, formateaba e instalaba los drives de manera muy facil, cosa que para mi era toda una odisea. Lo llegué a admirar (es que tenia 7 años) &nbsp;y creo que ese fue mi impulso para querer aprender informatica (bueno, en realidad solo queria aprender a formatear, porque era lo que mas veía). Sinembargo, cuando inicie en el mundillo que la informática, me dió un gran golpe en la cara ...\"</b></p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\"><b>Cosas a necesitar para crear un pendrive booteable:</b></p><p style=\"text-align: justify;\">a) Pendrive mínimo de 8Gb (puede ser 4 si la iso pesa menos de 2,5Gb)</p><p style=\"text-align: justify;\">b) ISO de la distribución a grabar.</p><p style=\"text-align: justify;\">c) LiliUSB. Un programa (una de las mejores) para grabar la ISO en el pendrive.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Con estas tres cosas ya podemos iniciar con nuestro tutorial. <b>¡Comencemos!</b></p><p style=\"text-align: justify;\">1.- Iniciamos el programa LiliUSB y habrá 4 ventanas en donde cada una tendremos que elegir una opcion.</p><p style=\"text-align: justify;\"><br></p><p><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('ALPA567','Windows 10 por fin supera a Windows 7','sinimagen.png','2017-02-23 09:15:18','\r\n					<p>Los últimos numero que ha ofrecido StatCounter indican que Windows 10 ha logrado superar a windows 7 en USA, unos de los mercados tecnológicos mas importantes que existen actualmente.</p><p>Echando un vistaso a las cifras concretas nos encontramos con que Windows 10 registró una cuota de mercado al cierre de diciembre del pasado año del 26,90% mientras que Windows 7 experimentó una pequeña bajada al 26,56%.</p><p>hay una diferencia mínima pero los números son claros, ponen en manifiesto que el nuevo sistema operativo de Microsoft ha necesitado alrededor de un año y medio para superar a Windows 7 en Estados Unidos, alguno que muchos no se habrían atrevido ni siuiera a pensar cuando llegó al mercad en julio del 2015.</p><p>Es evidente que Microsoft no ha hecho algunas cosas bien con Windows 10 el sistema operativo ha gustado, y mucho. Prueba clara de ello la tenemos en los números que maneja Steam, por ejemplo, donde se ha convertido también en la plataforma más utilizada, o en la cuota de mercado que mantiene en paises como Noruega y Dinamarca, algo que ya os contamos en su momento en MuyWindows.</p><p>Con sus luces y sus sombras Windows 10 es en general un buen sistema operativo, y gracias a actualizaciones como la Creatos Uopdate seguirá mejorando de forma gradual, así que no es para nada extraña la buena acogida que ha tenido en muchos mercados y sectores.</p><p>Hablando de nivel global, si revisamos la cuota de mercado de Windows 7 y Windows 10 en todo el mundo vemos que el primero lidera con un 48,34% mientras que el segundo mantiene un 24,36%, una diferencia muy grande que pone en evidencia la enorme popularidad del veterano sistema operativo de microsoft, que para muchos está llamando a convertirse en el nuevo Windows XP.</p><p><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('ALPA774','Citas y smartphones: Â¿Android o iOS? A la mayorÃ­a no le importa','sinimagen.png','2017-02-23 11:24:06','\r\n					<p>Cuando hablamos de smartphones no todo el mundo lo tiene claro a la hora de elegir. ¿Android o iOS? Es una buena pregunta y la respuesta desde luego es complicada, aunque podríamos decir que todo depende de tu presupuesto y de lo que valores la posibilidad de personalizar y configurar tu terminal.<br></p><p><br></p><p>Si quieres gastar lo mínimo posible y tener una mayor libertad en todo lo relacionado con tu smartphone Android es tu mejor opción. Por contra si el presupuesto no es problema y prefieres una mayor seguridad y actualizaciones estables a cambio de estar más limitado deberías poner el ojo en iOS.</p><p><br></p><p>Con ese resumen en mente tenemos una base sencilla sobre la que podemos construir una decisión, pero no hemos hecho este artículo con ese objetivo, sino para analizar los datos que nos deja un interesante estudio relacionado con Android, iOS y “l´amore”.</p><p><br></p><p>Dicho estudio ha sido realizado con personas de ambos sexos y de todas las edades, aunque la mayoría tenía entre 18 y 35 años. Por supuesto no se diferenció por orientación sexual, lo que añade un mayor valor a los resultados del mismo, ya que se ha construido sobre una base realista.</p><p><br></p><p>¿Android o iOS?</p><p><br></p><p>Echando un vistazo a las conclusiones que arroja este estudio podemos sacar dos datos muy interesantes que os resumimos a continuación:</p><p><br></p><p>Los usuarios de Android son hasta 15 veces más propensos a prejuzgar negativamente a alguien por tener un iPhone.</p><p>Los usuarios de iOS son has 21 veces más propensos a prejuzgar negativamente a alguien por tener un Android.</p><p>La rivalidad entre marcas se traslada a los propios usuarios y puede llegar a afectar incluso a sus relaciones con otras personas, aunque por suerte si profundizamos en los resultados generales nos encontramos que a la gran mayoría de los encuestados no les importa el terminal que utilice la otra persona.</p><p><br></p><p>Tanto es así que un 89,90% de los que participaron en el estudio aseguraron que no juzgan a las personas de forma negativa porque éstas tengan un teléfono antiguo.</p><p><br></p><p>Muy interesante, sin duda, pero y vosotros, ¿tendéis a juzgar a la gente por su smartphone?</p><p><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('ALPA836','PC Linux con Raspberry Pi, en tamaÃ±o Nintendo DS','sinimagen.png','2017-02-23 09:44:07','\r\n					<p>Crear un PC Linux con Raspberry Pi 2 en un tamaño de consola portátil, es el último proyecto de Chris Robinson publicado en NODE, un entusiasta que ha creado verdaderas virguerías sobre el desarrollo que lidera el segmento de miniordenadores de placa única.</p><p>Los fabricantes de equipos originales están construyendo algunos equipos impresionantemente pequeños, pero no muchos de ellos son capaces de crear un PC con el tamaño de una consola portátil, una pantalla LCD a todo color, teclado QWERTY y batería.&nbsp;</p><p>Parece una Nintendo DS modificada pero está construido en un chasis a partir de dos cajas de plástico de discos duros externos de 2,5 pulgadas compradas en Amazon por unos cuantos dólares. Robinson tuvo que dejar la Raspberry Pi pelada, tirando de soldador para retirar el puerto USB, HDMI, Ethernet y otros, insertarlos después de hacer los huecos correspondientes en el chasis.</p><p>El teclado tuvo que ser modificado, así como la batería original, añadiendo un convertidor de manera que el teclado y la placa pudieran obtener energía a partir de la misma fuente.<br></p><p>El producto final costó unos 120 dólares. Corre Raspbian y cualquier aplicación ARM soportada. Todo un PC Linux con Raspberry Pi 2 en un tamaño de consola portátil con varios usos, el último emular una Gameboy u otros como verás en los vídeos. Si te animas, tienes todo el proceso con información e imágenes en imgur.<br></p><p>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('ALPA895','Slimbook-KDE','sinimagen.png','2017-02-23 10:11:02','\r\n					<p>Slimbook KDE es el resultado de la asociación de los desarrolladores del entorno de escritorio KDE con el integrador español de equipos informáticos.</p><p><br></p><p>Slimbook KDE monta una pantalla de 13,3 pulgadas de diagonal con resolución Full HD (1920 x 1080 píxeles), en un chasis de aluminio ligero y delgado que deja su peso en 1,36 kilogramos.</p><p><br></p><p>Puede equipar procesadores Intel Core i5 o Core i7 “Skylake”, con una base (ampliable) de 4 Gbytes de memoria RAM y una SSD de 120 Gbytes. Wi-Fi, Bluetooth 4.0, salida HDMI o USB 3.0, se cuentan entre sus elementos de conectividad.<br></p><p><br></p><p>El hardware no está mal aunque lo que hace especial a este Slimbook KDE es el apartado del software. Primero porque no se comercializan demasiados equipos con Linux preinstalado y menos con un entorno de escritorio determinado, aunque en este caso sea uno de los más valorados.</p><p><br></p><p>Hablamos de un KDE neon que ha sido optimizado buscando la mejor experiencia en este equipo. Los responsables dicen que el KDE Slimbook es “un ordenador portátil que ha sido probado directamente por los desarrolladores de KDE, exactamente con la misma configuración de hardware y software que los usuarios obtienen”.</p><p><br></p><p>Aunque KDE es software libre y puede instalarse gratuitamente en otros equipos, el hecho que haya sido probado por el mismo desarrollador garantiza su completa compatibilidad. No es la primera vez que el equipo de KDE se ha aventurado en el hardware. La compañía trató de lanzar una tableta hace unos años, pero el proyecto ha pasado bastante desapercibido.</p><p><br></p><p>Slimbook KDE está disponible en la página web del integrador español, con precio desde 729 euros.</p><p><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('ALPA975','Pinebook, un portÃ¡til Linux por 89 euros','sinimagen.png','2017-02-23 10:04:27','\r\n					<p style=\"text-align: justify;\">Pinebook es un portátil Linux con base ARM que se venderá a un precio tan bajo como 89 euros.</p><p style=\"text-align: justify;\">Está fabricado por los creadores de PINE64, el mini-PC de placa única que llegó al mercado aprovechando el tirón de dispositivos como Raspberry Pi y por tan solo 15 dólares.</p><p style=\"text-align: justify;\">Pinebook se comercializará en dos tamaños de pantalla, IPS de 11,6 y 14 pulgadas, con resolución nativa de 1280 x 720 píxeles. &nbsp;Monta un SoC ARM Allwinner de 64 bits, con cuatro núcleos de procesamiento Cortex A53 a 1,2 GHz y gráfica Mali-400MP2. Añade 2 Gbytes de RAM y 16 Gbytes de almacenamiento eMMC 5.0.</p><p style=\"text-align: justify;\">Cuenta con Wi-Fi y Bluetooth, puertos USB 2.0, dos puertos USB 2.0, una ranura para tarjetas microSD, un puerto mini HDMI y un conector para auriculares. Su peso es de 1,2 kilogramos con batería de 10.000mAh.</p><p style=\"text-align: justify;\">El Pinebook puede ejecutar Android 5.1/7.0, Remix OS, Debian, Ubuntu y otros sistemas GNU/Linux. Estará disponible próximamente (si te interesa te puedes registrar para que te anuncien el lanzamiento) por 89 euros en el modelo de 11,6 pulgadas. La versión de 14 pulgadas costará 99 dólares.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Portátil básico pero interesante y a un precio para todos los bolsillos en un desarrollo que no deja de ser un “mini-PC con pantalla”, en este caso basado en uno de los desarrollos de placa única más interesantes y alternativos a la misma Raspberry Pi.</p><p><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004'),('FELI496','â€œWindows domina el escritorio, pero Linux gana el mundoâ€','sinimagen.png','2017-02-23 19:51:09','\r\n					<p>Así titula el editor jefe de ZDNet, Steve Ranger, un artículo en el que analiza la situación de Linux y Windows en distintos ámbitos computacionales, con el telón de fondo del posible regreso de Windows a la infraestructura TI de la ciudad de Múnich, terminando con una etapa Linux de la que fue pionera y ejemplo del uso de software libre en la administración.</p><p><br></p><p>Ranger -como cualquier analista- dice desconocer cuales son las causas de la propuesta de regreso a soluciones propietarias de Microsoft. Si se trata de una valoración técnica o de “otras cuestiones no relacionadas” que no tienen que ver con la calidad del código y el funcionamiento del sistema. En todo caso, relativiza su importancia más allá del ejemplo.</p><p><br></p><p>Si bien Múnich es una muestra y su pérdida sería un golpe para los que defienden el software libre en la administración, “el destino de Linux no va a ser decidido en el escritorio”, asegura el editor, recordando que hace 15 o 20 años que se viene discutiendo cuando va a ser “el año de Linux”, el momento de acercarse o incluso superar a Windows en escritorios informáticos, como era el objetivo de proyectos como Ubuntu.</p><p><br></p><p>La realidad de asunto según el periodista es que “Linux perdió hace años la guerra del escritorio” y cita el 2 por ciento de cuota de mercado que tiene el sistema libre en el segmento, frente al 91 por ciento de Windows.</p><p><br></p><p>¡Linux domina el mundo!</p><p><br></p><p>Steve Ranger intenta poner lo anterior en su contexto justo: “Los giros y vueltas del caso Munich y las aventuras de Linux en el escritorio son fascinantes, pero no cuentan la historia completa“.</p><p><br></p><p>“El dominio del escritorio no es lo que era, ahora es sólo una plataforma de computación entre muchas. De hecho, el software sobre el PC se está convirtiendo cada vez en menos relevante a medida que más aplicaciones se vuelven independientes del dispositivo y el sistema operativo, con domicilio en la nube en su lugar”, recuerda.</p><p><br></p><p>El editor repasa algunos de los sectores más allá del escritorio donde Linux es imprescindible en la computación mundial. Por aquí los hemos repasado en varias ocasiones. Linux arrasa en supercomputación con una cuota de mercado superior a la que tiene Windows en el escritorio. Lo mismo podemos decir en móviles inteligentes, donde los Linux móviles encabezados por Android superan el 80% de cuota de mercado.</p><p><br></p><p>Linux tiene también una cuota destacada en el segmento de servidores, en estaciones de trabajo profesionales, en equipos científicos, en domótica, en la Internet de las Cosas, en automoción, en productos para redes o en el gran segmento de embebidos. Gran parte de las nubes públicas se ejecutan en Linux de una forma u otra, incluyendo el soporte de Microsoft a distribuciones Linux en su servicio Azure, en un acercamiento que hemos visto en otros apartados y hubiera sido imposible hasta hace muy poco.</p><p><br></p><p>Todo ello lleva al editor a concluir que Linux “está tomando el mundo” y que el caso de Múnich (aunque es un importante ejemplo) no es tan relevante. ¿Windows ha ganado la batalla del escritorio pero Linux está ganando la guerra de la computación? ¿Y en el futuro? Te toca aportar tu punto de vista.</p><p><br></p><p><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'FEMO004'),('FELI556','EstÃ¡ confirmado, NVIDIA anunciarÃ¡ la GTX 1080 TI el 28 de febrero','sinimagen.png','2017-02-23 19:36:50','\r\n					<p>Ya lo habíamos adelantado en noticias anteriores y hoy finalmente podemos confirmarlo, NVIDIA anunciará la GTX 1080 TI en un evento especial que se celebrará el próximo 28 de febrero, un movimiento que podemos considerar casi de “contraataque” para desviar la atención sobre otro que tiene pensado celebrar AMD ese mismo día, y que estará dedicado a VEGA y las nuevas Radeon RX 500.</p><p><br></p><p>A nivel de especificaciones la GTX 1080 TI se presenta como una GTX TITAN X P recortada, aunque mantiene como base el mismo núcleo gráfico (GP102). Esto nos dejaría el siguiente cuadro de especificaciones:</p><p><br></p><p><b>- 3.328 shaders a 1.607 MHz-1.733 MHz.</b></p><p><b>- 206 unidades de textura.</b></p><p><b>- 96 unidades de rasterizado.</b></p><p><b>- Bus de 320 bits.</b></p><p><b>- 10 GB de GDDR5X a 10 GHz efectivos.</b></p><p><b>- TDP de 250W, con un conector de alimentación de 8 pines y otro de 6 pines.</b></p><p><br></p><p>Las diferencias que presenta frente a la GTX TITAN X P son bastante pequeñas y la GTX 1080 TI vendría con mayores frecuencias de reloj, lo que significa que es muy probable que el rendimiento de ambas en juegos acabe siendo muy parecido, cosa que ya ocurrió por ejemplo con las GTX 980 TI y las GTX TITAN X.</p><p><br></p><p>Es importante tener en cuenta que aunque el anuncio se espera para el 28 de febrero no tendrá disponibilidad real hasta dentro de unas 2 o 3 semanas, lo que nos lleva a mediados de marzo.</p><p><br></p><p>Con respecto al precio todavía no hay nada oficial, pero tirando de antecedentes y del precio que tiene la GTX TITAN X P imaginamos que rondará los 1.000 euros, aproximadamente.</p><p><br></p><p>¿A quién va dirigida esta tarjeta gráfica? Obviamente a jugadores con presupuestos muy altos que quieran disfrutar de títulos en 4K o tengan monitores con tasas de refresco muy altas. En todo caso debéis tener en cuenta que la relación calidad-precio de este tipo de soluciones suele ser muy baja, ya que no rinden mucho más que otras inferiores pero llegan a costar el doble.</p><p><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					<br><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'FEMO004'),('FELI574','LibreELEC 8.0 ya estÃ¡ aquÃ­ con Kodi 17','sinimagen.png','2017-02-23 19:41:57','\r\n					<p style=\"text-align: justify;\">Hace unas semanas que se lanzó la nueva y esperada versión de Kodi, el popular centro multimedia Open Source, y ahora le sigue, como suele ser o será habitual, una nueva versión de LibreELEC, una distribución Linux hecha por y para Kodi y una de las alternativas más interesantes actualmente para montarse un home cinema casero con todas las de la ley.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Por si alguien anda perdido, vamos a repasar un poco los últimos acontecimientos en torno a ambos proyectos, pues a Kodi solemos seguirle la pista, pero de LibreELEC es la primera vez que hablamos en MuyLinux. Sin embargo, LibreELEC 8.0 es en realidad la segunda versión del sistema, después de que gran parte del equipo de desarrollo de OpenELEC se desligase para crear, en efecto, una bifurcación del mismo.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Las razones del fork se podría decir que pertenecen al socorrido apartado de las diferencias irreconciliables: se lee por ahí que si el líder de OpenELEC era un tirano, que si LibreELEC es más democrático para con los desarrolladores y la comunidad… Para más datos, el acerca de LibreELEC, este hilo en los foros oficiales y para representar a la otra parte, este hilo en Reddit y muy especialmente, esta conversación, donde el fundador y todavía líder de OpenELEC (sraue) aporta ciertos comentarios en respuesta a uno de los desarrolladores de Kodi que interviene (todo un lío; las malas lenguas dirían que Ubuntu rompió OpenELEC…).</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Sea como fuere, lo que importa es que ambos proyectos siguen adelante y mientras que OpenELEC parece ser algo más comedido a la hora de lanzar nuevas versiones, LibreELEC parece ser más dinámico en ese aspecto, tal y como acaba de demostrar con la novedad que nos ocupa. Pero decimos muy adrede lo de parece, porque hay opiniones para todos los gustos.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">¿Y qué trae de nuevo LibreELEC 8.0? Kodi 17 ‘Krypton’, por supuesto, cuya principal novedad, valgan las redundancias, es el “rediseño por todo lo alto” del que os dimos cuenta en su momento. Os recordamos que Kodi funciona como una aplicación independiente, pero distribuciones como OpenELEC o LibreELEC facilitan su despliegue como solución en dispositivos como Raspberri Pi. Más información y las descargas, en el anuncio oficial de LibreELEC 8.0.</p><p><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'FEMO004'),('FELI721','EstÃ¡ confirmado, NVIDIA anunciarÃ¡ la GTX 1080 TI el 28 de febrero','sinimagen.png','2017-02-23 19:24:16','\r\n					<p style=\"text-align: justify;\">Ya lo habíamos adelantado en noticias anteriores y hoy finalmente podemos confirmarlo, NVIDIA anunciará la GTX 1080 TI en un evento especial que se celebrará el próximo 28 de febrero, un movimiento que podemos considerar casi de “contraataque” para desviar la atención sobre otro que tiene pensado celebrar AMD ese mismo día, y que estará dedicado a VEGA y las nuevas Radeon RX 500.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">A nivel de especificaciones la GTX 1080 TI se presenta como una GTX TITAN X P recortada, aunque mantiene como base el mismo núcleo gráfico (GP102). Esto nos dejaría el siguiente cuadro de especificaciones:</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">- 3.328 shaders a 1.607 MHz-1.733 MHz.</p><p style=\"text-align: justify;\">- 206 unidades de textura.</p><p style=\"text-align: justify;\">- 96 unidades de rasterizado.</p><p style=\"text-align: justify;\">- Bus de 320 bits.</p><p style=\"text-align: justify;\">- 10 GB de GDDR5X a 10 GHz efectivos.</p><p style=\"text-align: justify;\">- TDP de 250W, con un conector de alimentación de 8 pines y otro de 6 pines.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Las diferencias que presenta frente a la GTX TITAN X P son bastante pequeñas y la GTX 1080 TI vendría con mayores frecuencias de reloj, lo que significa que es muy probable que el rendimiento de ambas en juegos acabe siendo muy parecido, cosa que ya ocurrió por ejemplo con las GTX 980 TI y las GTX TITAN X.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Es importante tener en cuenta que aunque el anuncio se espera para el 28 de febrero no tendrá disponibilidad real hasta dentro de unas 2 o 3 semanas, lo que nos lleva a mediados de marzo.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Con respecto al precio todavía no hay nada oficial, pero tirando de antecedentes y del precio que tiene la GTX TITAN X P imaginamos que rondará los 1.000 euros, aproximadamente.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">¿A quién va dirigida esta tarjeta gráfica? Obviamente a jugadores con presupuestos muy altos que quieran disfrutar de títulos en 4K o tengan monitores con tasas de refresco muy altas. En todo caso debéis tener en cuenta que la relación calidad-precio de este tipo de soluciones suele ser muy baja, ya que no rinden mucho más que otras inferiores pero llegan a costar el doble.</p><p><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><div style=\"text-align: justify;\"><br></div>\r\n					<div style=\"text-align: justify;\"><br></div><br>\r\n					</p>\r\n				','N',NULL,'2017-03-01 11:43:45',0,'MACA004');
/*!40000 ALTER TABLE `ENTRADAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERTENECE`
--

DROP TABLE IF EXISTS `PERTENECE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERTENECE` (
  `IdEntrada` char(7) NOT NULL,
  `CodCategoria` char(6) NOT NULL,
  PRIMARY KEY (`IdEntrada`,`CodCategoria`),
  KEY `ca_pe` (`CodCategoria`),
  CONSTRAINT `ca_pe` FOREIGN KEY (`CodCategoria`) REFERENCES `CATEGORIAS` (`CodCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `en_pe` FOREIGN KEY (`IdEntrada`) REFERENCES `ENTRADAS` (`IdEntrada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERTENECE`
--

LOCK TABLES `PERTENECE` WRITE;
/*!40000 ALTER TABLE `PERTENECE` DISABLE KEYS */;
INSERT INTO `PERTENECE` VALUES ('ALPA774','AND004'),('ALPA895','LIN001'),('FELI496','LIN001'),('FELI574','LIN001'),('ALPA177','PCS005'),('FELI556','PCS005'),('FELI721','PCS005'),('ALPA836','RAS003'),('ALPA347','SIN000'),('ALPA975','SIN000'),('ALPA255','WIN002'),('ALPA567','WIN002');
/*!40000 ALTER TABLE `PERTENECE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIOS`
--

DROP TABLE IF EXISTS `USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIOS` (
  `CodUsuario` char(7) NOT NULL,
  `Usuario` varchar(25) DEFAULT NULL,
  `ImgUsuario` varchar(50) DEFAULT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  `TipoUsuario` varchar(13) DEFAULT NULL,
  `Contraseña` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CodUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIOS`
--

LOCK TABLES `USUARIOS` WRITE;
/*!40000 ALTER TABLE `USUARIOS` DISABLE KEYS */;
INSERT INTO `USUARIOS` VALUES ('ANME002','anita96','user.png','Ana','Meleiro Sanchez','M','1997-03-04','ana97@gmail.com','Estandar','786d67fd42a7c49d159cba262f3ddb75'),('ASAS419','asd','user.png','Asd','Asd','H','2017-02-11','asd@asd.com','Estandar','7815696ecbf1c96e6894b779456d330e'),('FEMO004','Felipe','user.png','Felipe','Montes Sierra','H','1996-06-01','feli91@hotmail.com','Estandar','81dc9bdb52d04dc20036dbd8313ed055'),('LUAL001','kuiki','user.png','Luigui','Alvarez Ramirez','H','1995-07-28','luigui916@gmail.com','Administrador','81dc9bdb52d04dc20036dbd8313ed055'),('MACA004','alpachilo','user.png','Manuel','Carrasco Gomez','H','2017-02-17','alpachilo12@gmail.com','Estandar','81dc9bdb52d04dc20036dbd8313ed055');
/*!40000 ALTER TABLE `USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'blog'
--

--
-- Dumping routines for database 'blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-01 23:36:54