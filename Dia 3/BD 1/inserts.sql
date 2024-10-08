INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen)
VALUES
('Electrodomésticos', 'Electrodomésticos de última generación.', '<p>Electrodomésticos de última generación.</p>', 'electrodomesticos.jpg'),
('Muebles', 'Muebles para todo tipo de espacios.', '<p>Muebles para todo tipo de espacios.</p>', 'muebles.jpg'),
('Herramientas', 'Herramientas para profesionales y aficionados.', '<p>Herramientas para profesionales y aficionados.</p>', 'herramientas.jpg'),
('Electrónica', 'Dispositivos electrónicos de alta tecnología.', '<p>Dispositivos electrónicos de alta tecnología.</p>', 'electronica.jpg'),
('Ropa', 'Ropa de moda para todas las estaciones.', '<p>Ropa de moda para todas las estaciones.</p>', 'ropa.jpg'),
('Deportes', 'Equipos y accesorios deportivos.', '<p>Equipos y accesorios deportivos.</p>', 'deportes.jpg'),
('Juguetes', 'Juguetes para todas las edades.', '<p>Juguetes para todas las edades.</p>', 'juguetes.jpg'),
('Oficina', 'Mobiliario y suministros de oficina.', '<p>Mobiliario y suministros de oficina.</p>', 'oficina.jpg'),
('Cocina', 'Utensilios y electrodomésticos de cocina.', '<p>Utensilios y electrodomésticos de cocina.</p>', 'cocina.jpg'),
('Jardín', 'Artículos y herramientas para el jardín.', '<p>Artículos y herramientas para el jardín.</p>', 'jardin.jpg'),
('Salud', 'Productos para el bienestar y salud.', '<p>Productos para el bienestar y salud.</p>', 'salud.jpg'),
('Belleza', 'Productos de belleza y cuidado personal.', '<p>Productos de belleza y cuidado personal.</p>', 'belleza.jpg'),
('Automotriz', 'Accesorios y partes para automóviles.', '<p>Accesorios y partes para automóviles.</p>', 'automotriz.jpg'),
('Hogar', 'Artículos diversos para el hogar.', '<p>Artículos diversos para el hogar.</p>', 'hogar.jpg'),
('Decoración', 'Elementos decorativos para todos los gustos.', '<p>Elementos decorativos para todos los gustos.</p>', 'decoracion.jpg'),
('Cuidado Infantil', 'Productos para el cuidado de los más pequeños.', '<p>Productos para el cuidado de los más pequeños.</p>', 'cuidado_infantil.jpg'),
('Accesorios', 'Accesorios variados para diferentes usos.', '<p>Accesorios variados para diferentes usos.</p>', 'accesorios.jpg'),
('Hardware', 'Componentes y herramientas de hardware.', '<p>Componentes y herramientas de hardware.</p>', 'hardware.jpg'),
('Software', 'Programas y soluciones de software.', '<p>Programas y soluciones de software.</p>', 'software.jpg'),
('Libros', 'Libros de diversas categorías.', '<p>Libros de diversas categorías.</p>', 'libros.jpg'),
('Multimedia', 'Productos multimedia y entretenimiento.', '<p>Productos multimedia y entretenimiento.</p>', 'multimedia.jpg'),
('Relojes', 'Relojes de diferentes estilos y marcas.', '<p>Relojes de diferentes estilos y marcas.</p>', 'relojes.jpg'),
('Cámaras', 'Cámaras fotográficas y accesorios.', '<p>Cámaras fotográficas y accesorios.</p>', 'camaras.jpg'),
('Teléfonos', 'Teléfonos móviles y accesorios.', '<p>Teléfonos móviles y accesorios.</p>', 'telefonos.jpg'),
('Música', 'Instrumentos y equipos de música.', '<p>Instrumentos y equipos de música.</p>', 'musica.jpg'),
('Videojuegos', 'Videojuegos y consolas.', '<p>Videojuegos y consolas.</p>', 'videojuegos.jpg'),
('Cine', 'Productos relacionados con el cine y el entretenimiento.', '<p>Productos relacionados con el cine y el entretenimiento.</p>', 'cine.jpg'),
('Cultura', 'Artículos relacionados con la cultura.', '<p>Artículos relacionados con la cultura.</p>', 'cultura.jpg'),
('Fotografía', 'Equipos y accesorios de fotografía.', '<p>Equipos y accesorios de fotografía.</p>', 'fotografia.jpg'),
('Viajes', 'Artículos y equipamiento para viajar.', '<p>Artículos y equipamiento para viajar.</p>', 'viajes.jpg'),
('Aventura', 'Productos para actividades al aire libre.', '<p>Productos para actividades al aire libre.</p>', 'aventura.jpg'),
('Higiene', 'Productos para la higiene personal y del hogar.', '<p>Productos para la higiene personal y del hogar.</p>', 'higiene.jpg'),
('Electrodomésticos Pequeños', 'Electrodomésticos pequeños para el hogar.', '<p>Electrodomésticos pequeños para el hogar.</p>', 'electrodomesticos_pequenos.jpg'),
('Electrodomésticos Grandes', 'Electrodomésticos grandes para el hogar.', '<p>Electrodomésticos grandes para el hogar.</p>', 'electrodomesticos_grandes.jpg'),
('Productos para el Cuidado del Hogar', 'Artículos para mantener el hogar limpio y ordenado.', '<p>Artículos para mantener el hogar limpio y ordenado.</p>', 'cuidado_hogar.jpg'),
('Camping', 'Equipos y accesorios para acampar.', '<p>Equipos y accesorios para acampar.</p>', 'camping.jpg'),
('Outdoor', 'Productos para actividades al aire libre.', '<p>Productos para actividades al aire libre.</p>', 'outdoor.jpg'),
('Fitness', 'Equipos y accesorios para el fitness.', '<p>Equipos y accesorios para el fitness.</p>', 'fitness.jpg'),
('Hogar y Cocina', 'Artículos para el hogar y la cocina.', '<p>Artículos para el hogar y la cocina.</p>', 'hogar_cocina.jpg'),
('Deportes y Aire Libre', 'Equipos deportivos y de aire libre.', '<p>Equipos deportivos y de aire libre.</p>', 'deportes_aire_libre.jpg'),
('Herramientas y Jardín', 'Herramientas para el jardín y el hogar.', '<p>Herramientas para el jardín y el hogar.</p>', 'herramientas_jardin.jpg'),
('Electrónica y Computación', 'Productos electrónicos y computadoras.', '<p>Productos electrónicos y computadoras.</p>', 'electronica_computacion.jpg');


INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
VALUES
('P001', 'Aspiradora', 'Electrodomésticos', '30x30x100 cm', 'ElectroPro', 'Aspiradora potente para hogar.', 50, 150.00, 100.00),
('P002', 'Sofá', 'Muebles', '200x90x80 cm', 'MueblesMax', 'Sofá de 3 plazas, color gris.', 20, 450.00, 350.00),
('P003', 'Taladro', 'Herramientas', '20x20x10 cm', 'ToolKing', 'Taladro eléctrico con batería.', 100, 80.00, 60.00),
('P004', 'Televisor', 'Electrónica', '55x10x35 cm', 'ElectroPro', 'Televisor LED 4K de 55 pulgadas.', 30, 600.00, 500.00),
('P005', 'Silla de Oficina', 'Oficina', '50x50x100 cm', 'MueblesMax', 'Silla ergonómica con ruedas.', 40, 120.00, 90.00),
('P006', 'Batidora', 'Electrodomésticos', '20x20x30 cm', 'ElectroPro', 'Batidora de mano con varios accesorios.', 70, 70.00, 50.00),
('P007', 'Mesa de Comedor', 'Muebles', '150x90x75 cm', 'MueblesMax', 'Mesa de comedor de madera.', 15, 300.00, 250.00),
('P008', 'Destornillador', 'Herramientas', '15x5x5 cm', 'ToolKing', 'Destornillador con varias puntas.', 150, 15.00, 10.00),
('P009', 'Smartphone', 'Electrónica', '14x7x0.8 cm', 'TechWorld', 'Smartphone con pantalla de 6.5 pulgadas.', 60, 400.00, 350.00),
('P010', 'Frigorífico', 'Electrodomésticos', '70x60x200 cm', 'ElectroPro', 'Frigorífico con congelador integrado.', 25, 800.00, 650.00),
('P011', 'Sofá Cama', 'Muebles', '200x90x90 cm', 'MueblesMax', 'Sofá cama con estructura de metal.', 10, 500.00, 400.00),
('P012', 'Llave Inglesa', 'Herramientas', '30x10x5 cm', 'ToolKing', 'Llave inglesa ajustable de 30 cm.', 120, 25.00, 18.00),
('P013', 'Monitor', 'Electrónica', '60x40x5 cm', 'TechWorld', 'Monitor LED de 27 pulgadas.', 45, 250.00, 200.00),
('P014', 'Reproductor de DVD', 'Electrónica', '20x20x5 cm', 'TechWorld', 'Reproductor de DVD con HDMI.', 35, 60.00, 45.00),
('P015', 'Cama Individual', 'Muebles', '90x200 cm', 'MueblesMax', 'Cama individual con colchón incluido.', 20, 200.00, 180.00),
('P016', 'Cafetera', 'Electrodomésticos', '20x15x30 cm', 'ElectroPro', 'Cafetera de goteo con temporizador.', 80, 50.00, 35.00),
('P017', 'Escritorio', 'Oficina', '120x60x75 cm', 'MueblesMax', 'Escritorio de oficina con cajones.', 25, 180.00, 140.00),
('P018', 'Escalera', 'Herramientas', '200x50x10 cm', 'ToolKing', 'Escalera de aluminio plegable.', 60, 90.00, 70.00),
('P019', 'Impresora', 'Electrónica', '45x40x20 cm', 'TechWorld', 'Impresora multifuncional con WiFi.', 30, 150.00, 120.00),
('P020', 'Silla de Oficina Ergonomica', 'Oficina', '50x50x100 cm', 'MueblesMax', 'Silla ergonómica con soporte lumbar.', 25, 150.00, 110.00),
('P021', 'Cámara Digital', 'Electrónica', '12x8x6 cm', 'TechWorld', 'Cámara digital de 16 MP.', 50, 300.00, 250.00),
('P022', 'Cuna', 'Muebles', '70x140 cm', 'MueblesMax', 'Cuna de madera con barandillas ajustables.', 15, 180.00, 150.00),
('P023', 'Tostadora', 'Electrodomésticos', '20x15x15 cm', 'ElectroPro', 'Tostadora de 4 ranuras.', 60, 40.00, 30.00),
('P024', 'Lámpara de Escritorio', 'Oficina', '25x25x40 cm', 'MueblesMax', 'Lámpara LED ajustable para escritorio.', 45, 35.00, 25.00),
('P025', 'Caja de Herramientas', 'Herramientas', '40x30x20 cm', 'ToolKing', 'Caja de herramientas con múltiples compartimentos.', 80, 50.00, 40.00),
('P026', 'Refrigerador de Bebidas', 'Electrodomésticos', '50x40x100 cm', 'ElectroPro', 'Refrigerador compacto para bebidas.', 25, 220.00, 180.00),
('P027', 'Mueble de TV', 'Muebles', '120x40x60 cm', 'MueblesMax', 'Mueble para TV con almacenamiento.', 20, 250.00, 200.00),
('P028', 'Alicates', 'Herramientas', '20x10x5 cm', 'ToolKing', 'Alicates multiusos con mango antideslizante.', 100, 20.00, 15.00),
('P029', 'Altavoz Bluetooth', 'Electrónica', '10x10x10 cm', 'TechWorld', 'Altavoz Bluetooth portátil con alta calidad de sonido.', 70, 80.00, 60.00),
('P030', 'Horno Microondas', 'Electrodomésticos', '45x30x30 cm', 'ElectroPro', 'Horno microondas con función de grill.', 40, 130.00, 100.00),
('P031', 'Silla de Comedor', 'Muebles', '45x45x90 cm', 'MueblesMax', 'Silla de comedor con tapizado en cuero.', 25, 120.00, 90.00),
('P032', 'Cinta Métrica', 'Herramientas', '5x5x2 cm', 'ToolKing', 'Cinta métrica retráctil de 5 metros.', 150, 10.00, 7.00),
('P033', 'Plancha', 'Electrodomésticos', '30x12x15 cm', 'ElectroPro', 'Plancha de vapor con suela antiadherente.', 70, 60.00, 45.00),
('P034', 'Mesa de Centro', 'Muebles', '80x80x45 cm', 'MueblesMax', 'Mesa de centro de cristal.', 15, 150.00, 120.00),
('P035', 'Pistola de Calor', 'Herramientas', '25x20x10 cm', 'ToolKing', 'Pistola de calor con ajuste de temperatura.', 60, 40.00, 30.00),
('P036', 'Cargador Solar', 'Electrónica', '10x10x2 cm', 'TechWorld', 'Cargador solar para dispositivos móviles.', 45, 50.00, 40.00),
('P037', 'Cama Matrimonial', 'Muebles', '160x200 cm', 'MueblesMax', 'Cama matrimonial con colchón.', 20, 400.00, 350.00),
('P038', 'Espejo de Aumentos', 'Electrónica', '20x20x10 cm', 'TechWorld', 'Espejo de aumento con luz LED.', 30, 70.00, 55.00),
('P039', 'Cinturón de Seguridad', 'Automotriz', '10x10x5 cm', 'AutoPro', 'Cinturón de seguridad con ajuste rápido.', 80, 25.00, 20.00),
('P040', 'Estantería', 'Muebles', '80x30x180 cm', 'MueblesMax', 'Estantería de madera con 5 niveles.', 25, 200.00, 160.00),
('P041', 'Tijeras', 'Herramientas', '20x5x2 cm', 'ToolKing', 'Tijeras de acero inoxidable para uso general.', 120, 15.00, 10.00),
('P042', 'Juguete Educativo', 'Juguetes', '30x20x10 cm', 'ToyWorld', 'Juguete educativo para niños pequeños.', 100, 25.00, 18.00),
('P043', 'Cámara de Seguridad', 'Electrónica', '15x15x10 cm', 'TechWorld', 'Cámara de seguridad con visión nocturna.', 35, 150.00, 120.00),
('P044', 'Cuna Convertible', 'Muebles', '70x140 cm', 'MueblesMax', 'Cuna convertible en cama.', 10, 250.00, 200.00),
('P045', 'Refrigerador Portátil', 'Electrodomésticos', '30x30x30 cm', 'ElectroPro', 'Refrigerador portátil para coches.', 25, 90.00, 70.00),
('P046', 'Cámara de Acción', 'Electrónica', '10x5x5 cm', 'TechWorld', 'Cámara de acción con grabación en 4K.', 40, 200.00, 180.00),
('P047', 'Aspiradora Robot', 'Electrodomésticos', '30x30x10 cm', 'ElectroPro', 'Aspiradora robot con función de programación.', 15, 300.00, 250.00),
('P048', 'Mesa de Jardín', 'Jardín', '150x80x75 cm', 'GardenPro', 'Mesa de jardín de madera con sillas.', 20, 350.00, 300.00),
('P049', 'Barbacoa', 'Jardín', '80x60x40 cm', 'GardenPro', 'Barbacoa de carbón para exterior.', 10, 100.00, 80.00),
('P050', 'Raqueta de Tenis', 'Deportes', '70x30x5 cm', 'SportPro', 'Raqueta de tenis profesional.', 25, 90.00, 70.00);

INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
VALUES
('OF001', 'Madrid', 'España', 'Madrid', '28001', '910000000', 'Calle Mayor 1', 'Planta 2'),
('OF002', 'Barcelona', 'España', 'Cataluña', '08001', '930000000', 'Avinguda Diagonal 50', 'Oficina 5'),
('OF003', 'Lisboa', 'Portugal', 'Lisboa', '1000-001', '213000000', 'Rua da Liberdade 123', NULL),
('OF004', 'Valencia', 'España', 'Valencia', '46001', '960000000', 'Calle de la Paz 12', NULL),
('OF005', 'Sevilla', 'España', 'Andalucía', '41001', '954000000', 'Plaza de España 5', NULL),
('OF006', 'Oporto', 'Portugal', 'Oporto', '4000-001', '225000000', 'Rua de Cedofeita 45', NULL),
('OF007', 'Bilbao', 'España', 'País Vasco', '48001', '944000000', 'Gran Vía 1', NULL),
('OF008', 'San Sebastián', 'España', 'País Vasco', '20001', '943000000', 'Avenida de la Libertad 9', NULL),
('OF009', 'A Coruña', 'España', 'Galicia', '15001', '981000000', 'Calle Real 15', NULL),
('OF010', 'Granada', 'España', 'Andalucía', '18001', '958000000', 'Calle Reyes Católicos 10', NULL),
('OF011', 'Madrid', 'España', 'Madrid', '28002', '910000001', 'Calle de Atocha 50', NULL),
('OF012', 'Barcelona', 'España', 'Cataluña', '08002', '930000001', 'Calle de Aragón 30', NULL),
('OF013', 'Lisboa', 'Portugal', 'Lisboa', '1000-002', '213000001', 'Avenida da Liberdade 99', NULL),
('OF014', 'Valencia', 'España', 'Valencia', '46002', '960000001', 'Calle de Colón 15', NULL),
('OF015', 'Sevilla', 'España', 'Andalucía', '41002', '954000001', 'Calle Sierpes 22', NULL),
('OF016', 'Oporto', 'Portugal', 'Oporto', '4000-002', '225000001', 'Rua das Flores 50', NULL),
('OF017', 'Bilbao', 'España', 'País Vasco', '48002', '944000001', 'Calle Uribitarte 3', NULL),
('OF018', 'San Sebastián', 'España', 'País Vasco', '20002', '943000001', 'Calle de Mayor 1', NULL),
('OF019', 'A Coruña', 'España', 'Galicia', '15002', '981000001', 'Calle del Sol 20', NULL),
('OF020', 'Granada', 'España', 'Andalucía', '18002', '958000001', 'Calle de las Torres 12', NULL),
('OF021', 'Madrid', 'España', 'Madrid', '28003', '910000002', 'Calle de Vallehermoso 35', NULL),
('OF022', 'Barcelona', 'España', 'Cataluña', '08003', '930000002', 'Calle de Pau Claris 21', NULL),
('OF023', 'Lisboa', 'Portugal', 'Lisboa', '1000-003', '213000002', 'Rua Augusta 45', NULL),
('OF024', 'Valencia', 'España', 'Valencia', '46003', '960000002', 'Calle de la Paz 20', NULL),
('OF025', 'Sevilla', 'España', 'Andalucía', '41003', '954000002', 'Calle de la Feria 40', NULL),
('OF026', 'Oporto', 'Portugal', 'Oporto', '4000-003', '225000002', 'Rua de São João 60', NULL),
('OF027', 'Bilbao', 'España', 'País Vasco', '48003', '944000002', 'Calle de Bailén 7', NULL),
('OF028', 'San Sebastián', 'España', 'País Vasco', '20003', '943000002', 'Calle de la Zurriola 5', NULL),
('OF029', 'A Coruña', 'España', 'Galicia', '15003', '981000002', 'Calle de la Estrella 12', NULL),
('OF030', 'Granada', 'España', 'Andalucía', '18003', '958000002', 'Calle de la Virgen 9', NULL),
('OF031', 'Madrid', 'España', 'Madrid', '28004', '910000003', 'Calle de Fuencarral 27', NULL),
('OF032', 'Barcelona', 'España', 'Cataluña', '08004', '930000003', 'Calle de Valencia 23', NULL),
('OF033', 'Lisboa', 'Portugal', 'Lisboa', '1000-004', '213000003', 'Rua de Santa Marta 33', NULL),
('OF034', 'Valencia', 'España', 'Valencia', '46004', '960000003', 'Calle de Ruzafa 50', NULL),
('OF035', 'Sevilla', 'España', 'Andalucía', '41004', '954000003', 'Calle de San Jacinto 25', NULL),
('OF036', 'Oporto', 'Portugal', 'Oporto', '4000-004', '225000003', 'Rua de São Pedro 70', NULL),
('OF037', 'Bilbao', 'España', 'País Vasco', '48004', '944000003', 'Calle de Mazarredo 18', NULL),
('OF038', 'San Sebastián', 'España', 'País Vasco', '20004', '943000003', 'Calle de la Constitución 12', NULL),
('OF039', 'A Coruña', 'España', 'Galicia', '15004', '981000003', 'Calle del Orzán 14', NULL),
('OF040', 'Granada', 'España', 'Andalucía', '18004', '958000003', 'Calle de los Reyes Católicos 14', NULL),
('OF041', 'Madrid', 'España', 'Madrid', '28005', '910000004', 'Calle de Vallehermoso 55', NULL),
('OF042', 'Barcelona', 'España', 'Cataluña', '08005', '930000004', 'Calle de Aragón 50', NULL),
('OF043', 'Lisboa', 'Portugal', 'Lisboa', '1000-005', '213000004', 'Rua de São Bento 60', NULL),
('OF044', 'Valencia', 'España', 'Valencia', '46005', '960000004', 'Calle de la Paz 30', NULL),
('OF045', 'Sevilla', 'España', 'Andalucía', '41005', '954000004', 'Calle de la Plata 20', NULL),
('OF046', 'Oporto', 'Portugal', 'Oporto', '4000-005', '225000004', 'Rua das Carmelitas 50', NULL),
('OF047', 'Bilbao', 'España', 'País Vasco', '48005', '944000004', 'Calle de Iparraguirre 15', NULL),
('OF048', 'San Sebastián', 'España', 'País Vasco', '20005', '943000004', 'Calle de Zubieta 10', NULL),
('OF049', 'A Coruña', 'España', 'Galicia', '15005', '981000004', 'Calle de la Torre 5', NULL),
('OF050', 'Granada', 'España', 'Andalucía', '18005', '958000004', 'Calle de la Acera del Darro 7', NULL);


INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto)
VALUES
(1, 'Ana', 'García', 'Martínez', '123', 'ana.garcia@empresa.com', 'OF001', NULL, 'Directora'),
(2, 'Luis', 'Pérez', 'Fernández', '456', 'luis.perez@empresa.com', 'OF002', 1, 'Vendedor'),
(3, 'Marta', 'López', 'Sánchez', '789', 'marta.lopez@empresa.com', 'OF003', 1, 'Soporte Técnico'),
(4, 'Javier', 'Ruiz', 'González', '321', 'javier.ruiz@empresa.com', 'OF004', 2, 'Analista'),
(5, 'Laura', 'Morales', 'Torres', '654', 'laura.morales@empresa.com', 'OF005', 2, 'Gerente'),
(6, 'Carlos', 'Ramírez', 'Hidalgo', '987', 'carlos.ramirez@empresa.com', 'OF006', 3, 'Asistente'),
(7, 'Ana', 'Martín', 'Castro', '1234', 'ana.martin@empresa.com', 'OF007', 4, 'Coordinador'),
(8, 'David', 'Gómez', 'Jurado', '5678', 'david.gomez@empresa.com', 'OF008', 4, 'Desarrollador'),
(9, 'Eva', 'Cano', 'Alonso', '9101', 'eva.cano@empresa.com', 'OF009', 5, 'Especialista en Ventas'),
(10, 'Sergio', 'Molina', 'Paniagua', '1121', 'sergio.molina@empresa.com', 'OF010', 5, 'Consultor'),
(11, 'Patricia', 'Vázquez', 'Reyes', '3141', 'patricia.vazquez@empresa.com', 'OF011', 6, 'Analista Financiero'),
(12, 'Jorge', 'Silva', 'Aranda', '5161', 'jorge.silva@empresa.com', 'OF012', 6, 'Director de Marketing'),
(13, 'Claudia', 'Fernández', 'López', '7181', 'claudia.fernandez@empresa.com', 'OF013', 7, 'Jefa de Proyecto'),
(14, 'Martín', 'Gil', 'Mendoza', '9202', 'martin.gil@empresa.com', 'OF014', 7, 'Ingeniero de Sistemas'),
(15, 'Inés', 'García', 'Marín', '1222', 'ines.garcia@empresa.com', 'OF015', 8, 'Especialista en TI'),
(16, 'Alberto', 'Pérez', 'Núñez', '2233', 'alberto.perez@empresa.com', 'OF016', 8, 'Técnico'),
(17, 'Elena', 'Castro', 'Bravo', '3344', 'elena.castro@empresa.com', 'OF017', 9, 'Administrador'),
(18, 'Óscar', 'Vidal', 'Ortega', '4455', 'oscar.vidal@empresa.com', 'OF018', 9, 'Jefe de Ventas'),
(19, 'Sonia', 'Moreno', 'Jurado', '5566', 'sonia.moreno@empresa.com', 'OF019', 10, 'Contador'),
(20, 'Raúl', 'Jiménez', 'García', '6677', 'raul.jimenez@empresa.com', 'OF020', 10, 'Asesor Legal'),
(21, 'Nerea', 'Alonso', 'Moya', '7788', 'nerea.alonso@empresa.com', 'OF021', 11, 'Consultor'),
(22, 'Francisco', 'Álvarez', 'Bravo', '8899', 'francisco.alvarez@empresa.com', 'OF022', 11, 'Director de Operaciones'),
(23, 'Mónica', 'Pérez', 'Jiménez', '9900', 'monica.perez@empresa.com', 'OF023', 12, 'Técnico de Sistemas'),
(24, 'Miguel', 'García', 'Sanz', '1010', 'miguel.garcia@empresa.com', 'OF024', 12, 'Coordinador de Proyectos'),
(25, 'Raquel', 'Martín', 'Muñoz', '1111', 'raquel.martin@empresa.com', 'OF025', 13, 'Gerente de Ventas'),
(26, 'Antonio', 'Jiménez', 'Moreno', '1212', 'antonio.jimenez@empresa.com', 'OF026', 13, 'Analista de Marketing'),
(27, 'Silvia', 'Lozano', 'Ortega', '1313', 'silvia.lozano@empresa.com', 'OF027', 14, 'Jefa de Producto'),
(28, 'Luis', 'Torres', 'Reyes', '1414', 'luis.torres@empresa.com', 'OF028', 14, 'Diseñador'),
(29, 'Cristina', 'Gómez', 'Herrera', '1515', 'cristina.gomez@empresa.com', 'OF029', 15, 'Especialista en Finanzas'),
(30, 'Rafael', 'Hidalgo', 'Pérez', '1616', 'rafael.hidalgo@empresa.com', 'OF030', 15, 'Director de Finanzas'),
(31, 'María', 'González', 'Núñez', '1717', 'maria.gonzalez@empresa.com', 'OF031', 16, 'Jefa de Contabilidad'),
(32, 'José', 'Vega', 'Moreno', '1818', 'jose.vega@empresa.com', 'OF032', 16, 'Consultor de TI'),
(33, 'Estela', 'Paniagua', 'Sánchez', '1919', 'estela.paniagua@empresa.com', 'OF033', 17, 'Asistente Administrativo'),
(34, 'Fernando', 'García', 'López', '2020', 'fernando.garcia@empresa.com', 'OF034', 17, 'Director Comercial'),
(35, 'Beatriz', 'Romero', 'Reyes', '2121', 'beatriz.romero@empresa.com', 'OF035', 18, 'Gerente de Proyecto'),
(36, 'Víctor', 'López', 'Mora', '2222', 'victor.lopez@empresa.com', 'OF036', 18, 'Especialista en Producto'),
(37, 'Natalia', 'Ramírez', 'Cano', '2323', 'natalia.ramirez@empresa.com', 'OF037', 19, 'Director de Marketing'),
(38, 'Andrés', 'García', 'Jiménez', '2424', 'andres.garcia@empresa.com', 'OF038', 19, 'Analista de Mercado'),
(39, 'Rosa', 'Hernández', 'Méndez', '2525', 'rosa.hernandez@empresa.com', 'OF039', 20, 'Especialista en Recursos Humanos'),
(40, 'Guillermo', 'Morales', 'Torres', '2626', 'guillermo.morales@empresa.com', 'OF040', 20, 'Asesor de Marketing'),
(41, 'Ángela', 'Núñez', 'Cabrera', '2727', 'angela.nunez@empresa.com', 'OF041', 21, 'Jefa de Ventas'),
(42, 'Fernando', 'Castro', 'Suárez', '2828', 'fernando.castro@empresa.com', 'OF042', 21, 'Técnico de Ventas'),
(43, 'Gabriela', 'Méndez', 'Ríos', '2929', 'gabriela.mendez@empresa.com', 'OF043', 22, 'Asistente de Marketing'),
(44, 'Héctor', 'Ortiz', 'Alvarado', '3030', 'hector.ortiz@empresa.com', 'OF044', 22, 'Director de Ventas'),
(45, 'Lorena', 'García', 'Paredes', '3131', 'lorena.garcia@empresa.com', 'OF045', 23, 'Consultora'),
(46, 'Felipe', 'Sánchez', 'Cano', '3232', 'felipe.sanchez@empresa.com', 'OF046', 23, 'Especialista en TI'),
(47, 'Paula', 'Bravo', 'Hidalgo', '3333', 'paula.bravo@empresa.com', 'OF047', 24, 'Director de Operaciones'),
(48, 'Iván', 'Pérez', 'Martín', '3434', 'ivan.perez@empresa.com', 'OF048', 24, 'Coordinador'),
(49, 'Verónica', 'Sánchez', 'García', '3535', 'veronica.sanchez@empresa.com', 'OF049', 25, 'Jefa de Producto'),
(50, 'Ricardo', 'López', 'Romero', '3636', 'ricardo.lopez@empresa.com', 'OF050', 25, 'Especialista en Finanzas');


INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito)
VALUES
(101, 'Comercial S.A.', 'Ana', 'Pérez', '912345678', '912345679', 'Calle Falsa 123', 'Local 1', 'Madrid', 'Madrid', 'España', '28000', 1, 50000.00),
(102, 'Distribuciones López', 'Carlos', 'López', '934567890', '934567891', 'Avenida Libertad 45', NULL, 'Barcelona', 'Cataluña', 'España', '08010', 2, 30000.00),
(103, 'Tecnología y Más', 'Laura', 'García', '951234567', '951234568', 'Calle Industria 78', 'Oficina 2', 'Valencia', 'Valencia', 'España', '46010', 3, 40000.00),
(104, 'Muebles Deluxe', 'José', 'Martínez', '965432109', '965432110', 'Calle del Mueble 10', NULL, 'Sevilla', 'Andalucía', 'España', '41010', 4, 35000.00),
(105, 'Electrodomésticos Global', 'Sofía', 'Morales', '932345678', '932345679', 'Calle de la Tecnología 56', NULL, 'San Sebastián', 'País Vasco', 'España', '20010', 5, 25000.00);


INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total)
VALUES
(101, 'Tarjeta de Crédito', 'TX001', '2024-08-15', 3000.00),
(102, 'Transferencia Bancaria', 'TX002', '2024-08-16', 1500.00),
(103, 'Efectivo', 'TX003', '2024-08-17', 2500.00),
(104, 'Tarjeta de Crédito', 'TX004', '2024-08-18', 1800.00),
(105, 'Transferencia Bancaria', 'TX005', '2024-08-19', 2200.00);


INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente)
VALUES
(1001, '2024-08-10', '2024-08-20', '2024-08-18', 'Entregado', 'Pedido urgente', 101),
(1002, '2024-08-12', '2024-08-22', NULL, 'Pendiente', 'Esperando confirmación', 102),
(1003, '2024-08-14', '2024-08-24', NULL, 'En preparación', 'Requiere revisión de stock', 103),
(1004, '2024-08-16', '2024-08-26', NULL, 'Pendiente', 'Confirmar dirección', 104),
(1005, '2024-08-18', '2024-08-28', NULL, 'En preparación', 'Añadir accesorios', 105);



INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea)
VALUES
(1001, 'P001', 2, 150.00, 1),
(1001, 'P005', 1, 120.00, 2),
(1002, 'P007', 1, 300.00, 1),
(1002, 'P012', 3, 25.00, 2),
(1003, 'P013', 1, 250.00, 1),
(1003, 'P019', 2, 150.00, 2),
(1004, 'P027', 1, 250.00, 1),
(1004, 'P031', 2, 120.00, 2),
(1005, 'P047', 1, 300.00, 1),
(1005, 'P048', 1, 350.00, 2);







