-- consuiltas sobre 1 tabla

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina, ciudad 
FROM oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono 
FROM oficina 
WHERE pais = 'España';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre, apellido1, apellido2, email 
FROM empleado 
WHERE codigo_jefe = 7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto, nombre, apellido1, apellido2, email 
FROM empleado 
WHERE codigo_empleado = (SELECT codigo_jefe FROM empleado WHERE codigo_jefe IS NULL);

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre, apellido1, apellido2, puesto 
FROM empleado 
WHERE puesto != 'Representante de ventas';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_cliente 
FROM cliente 
WHERE pais = 'España';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado 
FROM pedido;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008.
-- a) Utilizando la función YEAR de MySQL:
SELECT DISTINCT codigo_cliente 
FROM pago 
WHERE YEAR(fecha_pago) = 2008;

-- b) Utilizando la función DATE_FORMAT de MySQL:
SELECT DISTINCT codigo_cliente 
FROM pago 
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

-- c) Sin utilizar ninguna de las funciones anteriores:
SELECT DISTINCT codigo_cliente 
FROM pago 
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE fecha_entrega > fecha_esperada;

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- a) Utilizando la función ADDDATE de MySQL:
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);

-- b) Utilizando la función DATEDIFF de MySQL:
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

-- c) Utilizando el operador de resta:
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE fecha_esperada - fecha_entrega >= 2;

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT codigo_pedido, fecha_pedido, estado 
FROM pedido 
WHERE estado = 'Rechazado' 
AND YEAR(fecha_pedido) = 2009;

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
SELECT codigo_pedido, codigo_cliente, fecha_entrega 
FROM pedido 
WHERE MONTH(fecha_entrega) = 1;

-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT * 
FROM pago 
WHERE YEAR(fecha_pago) = 2008 
AND forma_pago = 'Paypal' 
ORDER BY total DESC;

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
SELECT DISTINCT forma_pago 
FROM pago;

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT nombre, cantidad_en_stock, precio_venta 
FROM producto 
WHERE gama = 'Ornamentales' 
AND cantidad_en_stock > 100 
ORDER BY precio_venta DESC;

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
SELECT nombre_cliente 
FROM cliente 
WHERE ciudad = 'Madrid' 
AND codigo_empleado_rep_ventas IN (11, 30);


-- Consultas multitabla (Composición interna)
-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

-- SQL1:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, empleado.apellido2 
FROM cliente, empleado 
WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, empleado.apellido2 
FROM cliente 
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

-- SQL2 (NATURAL JOIN):
SELECT nombre_cliente, nombre, apellido1, apellido2 
FROM cliente 
NATURAL JOIN empleado;

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

-- SQL1:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 
FROM cliente, empleado, pago 
WHERE cliente.codigo_cliente = pago.codigo_cliente 
AND cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 
FROM cliente 
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente 
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

-- SQL2 (NATURAL JOIN):
SELECT nombre_cliente, nombre, apellido1 
FROM cliente 
NATURAL JOIN pago 
NATURAL JOIN empleado;

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

-- SQL1:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 
FROM cliente, empleado 
WHERE cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago) 
AND cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 
FROM cliente 
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
WHERE cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);

-- SQL2 (NATURAL JOIN):
SELECT nombre_cliente, nombre, apellido1 
FROM cliente 
NATURAL JOIN empleado 
WHERE codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

-- SQL1:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM cliente, empleado, oficina, pago 
WHERE cliente.codigo_cliente = pago.codigo_cliente 
AND cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
AND empleado.codigo_oficina = oficina.codigo_oficina;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM cliente 
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente 
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;

-- SQL2 (NATURAL JOIN):
SELECT nombre_cliente, nombre, apellido1, ciudad 
FROM cliente 
NATURAL JOIN pago 
NATURAL JOIN empleado 
NATURAL JOIN oficina;

-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

-- SQL1:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM cliente, empleado, oficina 
WHERE cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago) 
AND cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
AND empleado.codigo_oficina = oficina.codigo_oficina;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM cliente 
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina 
WHERE cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);

-- SQL2 (NATURAL JOIN):
SELECT nombre_cliente, nombre, apellido1, ciudad 
FROM cliente 
NATURAL JOIN empleado 
NATURAL JOIN oficina 
WHERE codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);

-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

-- SQL1:
SELECT oficina.linea_direccion1 
FROM oficina, cliente 
WHERE cliente.ciudad = 'Fuenlabrada' 
AND cliente.codigo_empleado_rep_ventas = (SELECT codigo_empleado FROM empleado WHERE empleado.codigo_oficina = oficina.codigo_oficina);

-- SQL2 (INNER JOIN):
SELECT oficina.linea_direccion1 
FROM oficina 
INNER JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina 
INNER JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
WHERE cliente.ciudad = 'Fuenlabrada';

-- SQL2 (NATURAL JOIN):
SELECT linea_direccion1 
FROM oficina 
NATURAL JOIN empleado 
NATURAL JOIN cliente 
WHERE ciudad = 'Fuenlabrada';

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

-- SQL1:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM cliente, empleado, oficina 
WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
AND empleado.codigo_oficina = oficina.codigo_oficina;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM cliente 
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado 
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;

-- SQL2 (NATURAL JOIN):
SELECT nombre_cliente, nombre, apellido1, ciudad 
FROM cliente 
NATURAL JOIN empleado 
NATURAL JOIN oficina;

-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

-- SQL1:
SELECT e1.nombre AS empleado, e2.nombre AS jefe 
FROM empleado e1, empleado e2 
WHERE e1.codigo_jefe = e2.codigo_empleado;

-- SQL2 (INNER JOIN):
SELECT e1.nombre AS empleado, e2.nombre AS jefe 
FROM empleado e1 
INNER JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado;

-- SQL2 (NATURAL JOIN):
SELECT nombre, (SELECT nombre FROM empleado e2 WHERE e2.codigo_empleado = empleado.codigo_jefe) AS jefe 
FROM empleado;

-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

-- SQL1:
SELECT e1.nombre AS empleado, e2.nombre AS jefe, e3.nombre AS jefe_del_jefe 
FROM empleado e1, empleado e2, empleado e3 
WHERE e1.codigo_jefe = e2.codigo_empleado 
AND e2.codigo_jefe = e3.codigo_empleado;

-- SQL2 (INNER JOIN):
SELECT e1.nombre AS empleado, e2.nombre AS jefe, e3.nombre AS jefe_del_jefe 
FROM empleado e1 
INNER JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado 
INNER JOIN empleado e3 ON e2.codigo_jefe = e3.codigo_empleado;

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

-- SQL1:
SELECT cliente.nombre_cliente 
FROM cliente, pedido 
WHERE cliente.codigo_cliente = pedido.codigo_cliente 
AND pedido.fecha_entrega > pedido.fecha_esperada;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente 
FROM cliente 
INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
WHERE pedido.fecha_entrega > pedido.fecha_esperada;

-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

-- SQL1:
SELECT cliente.nombre_cliente, producto.gama 
FROM cliente, pedido, detalle_pedido, producto 
WHERE cliente.codigo_cliente = pedido.codigo_cliente 
AND pedido.codigo_pedido = detalle_pedido.codigo_pedido 
AND detalle_pedido.codigo_producto = producto.codigo_producto 
GROUP BY cliente.nombre_cliente, producto.gama;

-- SQL2 (INNER JOIN):
SELECT cliente.nombre_cliente, producto.gama 
FROM cliente 
INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
INNER JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido 
INNER JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto 
GROUP BY cliente.nombre_cliente, producto.gama;


-- Consultas multitabla (Composición externa)
-- 1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

-- LEFT JOIN:
SELECT cliente.nombre_cliente 
FROM cliente 
LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente 
WHERE pago.codigo_cliente IS NULL;

-- RIGHT JOIN:
SELECT cliente.nombre_cliente 
FROM pago 
RIGHT JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente 
WHERE pago.codigo_cliente IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

-- LEFT JOIN:
SELECT cliente.nombre_cliente 
FROM cliente 
LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
WHERE pedido.codigo_pedido IS NULL;

-- RIGHT JOIN:
SELECT cliente.nombre_cliente 
FROM pedido 
RIGHT JOIN cliente ON cliente.codigo_cliente = pedido.codigo_cliente 
WHERE pedido.codigo_pedido IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

-- LEFT JOIN:
SELECT cliente.nombre_cliente 
FROM cliente 
LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente 
LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
WHERE pago.codigo_cliente IS NULL AND pedido.codigo_pedido IS NULL;

-- RIGHT JOIN:
SELECT cliente.nombre_cliente 
FROM pago 
RIGHT JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente 
RIGHT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
WHERE pago.codigo_cliente IS NULL AND pedido.codigo_pedido IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

-- LEFT JOIN:
SELECT empleado.nombre, empleado.apellido1 
FROM empleado 
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina 
WHERE oficina.codigo_oficina IS NULL;

-- RIGHT JOIN:
SELECT empleado.nombre, empleado.apellido1 
FROM oficina 
RIGHT JOIN empleado ON empleado.codigo_oficina = oficina.codigo_oficina 
WHERE oficina.codigo_oficina IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

-- LEFT JOIN:
SELECT empleado.nombre, empleado.apellido1 
FROM empleado 
LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
WHERE cliente.codigo_cliente IS NULL;

-- RIGHT JOIN:
SELECT empleado.nombre, empleado.apellido1 
FROM cliente 
RIGHT JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
WHERE cliente.codigo_cliente IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

-- LEFT JOIN:
SELECT empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM empleado 
LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina 
WHERE cliente.codigo_cliente IS NULL;

-- RIGHT JOIN:
SELECT empleado.nombre, empleado.apellido1, oficina.ciudad 
FROM cliente 
RIGHT JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
RIGHT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina 
WHERE cliente.codigo_cliente IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

-- LEFT JOIN:
SELECT empleado.nombre, empleado.apellido1 
FROM empleado 
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina 
LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
WHERE oficina.codigo_oficina IS NULL OR cliente.codigo_cliente IS NULL;

-- RIGHT JOIN:
SELECT empleado.nombre, empleado.apellido1 
FROM oficina 
RIGHT JOIN empleado ON empleado.codigo_oficina = oficina.codigo_oficina 
RIGHT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
WHERE oficina.codigo_oficina IS NULL OR cliente.codigo_cliente IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

-- LEFT JOIN:
SELECT producto.nombre 
FROM producto 
LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto 
WHERE detalle_pedido.codigo_producto IS NULL;

-- RIGHT JOIN:
SELECT producto.nombre 
FROM detalle_pedido 
RIGHT JOIN producto ON producto.codigo_producto = detalle_pedido.codigo_producto 
WHERE detalle_pedido.codigo_producto IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

-- LEFT JOIN:
SELECT producto.nombre, producto.descripcion, producto.imagen 
FROM producto 
LEFT JOIN detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto 
WHERE detalle_pedido.codigo_producto IS NULL;

-- RIGHT JOIN:
SELECT producto.nombre, producto.descripcion, producto.imagen 
FROM detalle_pedido 
RIGHT JOIN producto ON producto.codigo_producto = detalle_pedido.codigo_producto 
WHERE detalle_pedido.codigo_producto IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

-- LEFT JOIN:
SELECT oficina.ciudad 
FROM oficina 
LEFT JOIN empleado ON oficina.codigo_oficina = empleado.codigo_oficina 
LEFT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
LEFT JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido 
LEFT JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto 
WHERE producto.gama = 'Frutales' AND empleado.codigo_empleado IS NULL;

-- RIGHT JOIN:
SELECT oficina.ciudad 
FROM empleado 
RIGHT JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina 
RIGHT JOIN cliente ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas 
RIGHT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
RIGHT JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido 
RIGHT JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto 
WHERE producto.gama = 'Frutales' AND empleado.codigo_empleado IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

-- LEFT JOIN:
SELECT cliente.nombre_cliente 
FROM cliente 
LEFT JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente 
LEFT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente 
WHERE pedido.codigo_pedido IS NOT NULL AND pago.codigo_cliente IS NULL;

-- RIGHT JOIN:
SELECT cliente.nombre_cliente 
FROM pedido 
RIGHT JOIN cliente ON cliente.codigo_cliente = pedido.codigo_cliente 
RIGHT JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente 
WHERE pedido.codigo_pedido IS NOT NULL AND pago.codigo_cliente IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- 12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

-- LEFT JOIN:
SELECT e.nombre, e.apellido1, jefe.nombre AS nombre_jefe, jefe.apellido1 AS apellido_jefe 
FROM empleado e 
LEFT JOIN cliente ON e.codigo_empleado = cliente.codigo_empleado_rep_ventas 
LEFT JOIN empleado jefe ON e.codigo_jefe = jefe.codigo_empleado 
WHERE cliente.codigo_cliente IS NULL;

-- RIGHT JOIN:
SELECT e.nombre, e.apellido1, jefe.nombre AS nombre_jefe, jefe.apellido1 AS apellido_jefe 
FROM cliente 
RIGHT JOIN empleado e ON e.codigo_empleado = cliente.codigo_empleado_rep_ventas 
RIGHT JOIN empleado jefe ON e.codigo_jefe = jefe.codigo_empleado 
WHERE cliente.codigo_cliente IS NULL;

-- NATURAL LEFT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre

-- NATURAL RIGHT JOIN:
-- No aplicable porque las tablas no tienen columnas con el mismo nombre


-- Consultas resumen
-- 1. ¿Cuántos empleados hay en la compañía?

SELECT COUNT(*) AS numero_empleados 
FROM empleado;

-- 2. ¿Cuántos clientes tiene cada país?

SELECT cliente.pais, COUNT(*) AS numero_clientes 
FROM cliente 
GROUP BY cliente.pais;

-- 3. ¿Cuál fue el pago medio en 2009?

SELECT AVG(total) AS pago_medio_2009 
FROM pago 
WHERE YEAR(fecha_pago) = 2009;

-- 4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

SELECT estado, COUNT(*) AS numero_pedidos 
FROM pedido 
GROUP BY estado 
ORDER BY numero_pedidos DESC;

-- 5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

SELECT 
    MAX(precio_venta) AS precio_maximo,
    MIN(precio_venta) AS precio_minimo 
FROM producto;

-- 6. Calcula el número de clientes que tiene la empresa.

SELECT COUNT(*) AS numero_clientes 
FROM cliente;

-- 7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

SELECT COUNT(*) AS numero_clientes_madrid 
FROM cliente 
WHERE ciudad = 'Madrid';

-- 8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

SELECT ciudad, COUNT(*) AS numero_clientes 
FROM cliente 
WHERE ciudad LIKE 'M%' 
GROUP BY ciudad;

-- 9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

SELECT e.nombre, e.apellido1, COUNT(c.codigo_cliente) AS numero_clientes 
FROM empleado e 
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas 
GROUP BY e.codigo_empleado;

-- 10. Calcula el número de clientes que no tiene asignado representante de ventas.

SELECT COUNT(*) AS numero_clientes_sin_representante 
FROM cliente 
WHERE codigo_empleado_rep_ventas IS NULL;

-- 11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

SELECT 
    c.nombre_cliente, 
    c.nombre_contacto, 
    c.apellido_contacto, 
    MIN(p.fecha_pago) AS primer_pago, 
    MAX(p.fecha_pago) AS ultimo_pago 
FROM cliente c 
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente 
GROUP BY c.codigo_cliente;

-- 12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

SELECT 
    d.codigo_pedido, 
    COUNT(DISTINCT d.codigo_producto) AS numero_productos 
FROM detalle_pedido d 
GROUP BY d.codigo_pedido;

-- 13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

SELECT 
    d.codigo_pedido, 
    SUM(d.cantidad) AS cantidad_total 
FROM detalle_pedido d 
GROUP BY d.codigo_pedido;

-- 14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

SELECT 
    p.nombre, 
    SUM(d.cantidad) AS unidades_vendidas 
FROM detalle_pedido d 
JOIN producto p ON d.codigo_producto = p.codigo_producto 
GROUP BY p.codigo_producto 
ORDER BY unidades_vendidas DESC 
LIMIT 20;

-- 15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

SELECT 
    SUM(d.precio_unidad * d.cantidad) AS base_imponible,
    SUM(d.precio_unidad * d.cantidad * 0.21) AS IVA,
    SUM(d.precio_unidad * d.cantidad * 1.21) AS total_facturado
FROM detalle_pedido d;

-- 16. La misma información que en la pregunta anterior, pero agrupada por código de producto.

SELECT 
    d.codigo_producto,
    SUM(d.precio_unidad * d.cantidad) AS base_imponible,
    SUM(d.precio_unidad * d.cantidad * 0.21) AS IVA,
    SUM(d.precio_unidad * d.cantidad * 1.21) AS total_facturado
FROM detalle_pedido d
GROUP BY d.codigo_producto;

-- 17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

SELECT 
    d.codigo_producto,
    SUM(d.precio_unidad * d.cantidad) AS base_imponible,
    SUM(d.precio_unidad * d.cantidad * 0.21) AS IVA,
    SUM(d.precio_unidad * d.cantidad * 1.21) AS total_facturado
FROM detalle_pedido d
JOIN producto p ON d.codigo_producto = p.codigo_producto
WHERE p.codigo_producto LIKE 'OR%'
GROUP BY d.codigo_producto;

-- 18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

SELECT 
    p.nombre,
    SUM(d.cantidad) AS unidades_vendidas,
    SUM(d.precio_unidad * d.cantidad) AS total_facturado,
    SUM(d.precio_unidad * d.cantidad * 1.21) AS total_facturado_con_impuestos
FROM detalle_pedido d
JOIN producto p ON d.codigo_producto = p.codigo_producto
GROUP BY p.codigo_producto
HAVING SUM(d.precio_unidad * d.cantidad) > 3000;

-- 19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

SELECT 
    YEAR(fecha_pago) AS año, 
    SUM(total) AS suma_pagos 
FROM pago 
GROUP BY YEAR(fecha_pago);

-- Subconsultas
-- 1. Devuelve el nombre del cliente con mayor límite de crédito.

SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente);

-- 2. Devuelve el nombre del producto que tenga el precio de venta más caro.

SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto);

-- 3. Devuelve el nombre del producto del que se han vendido más unidades.

SELECT p.nombre
FROM producto p
JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
GROUP BY p.codigo_producto
ORDER BY SUM(dp.cantidad) DESC
LIMIT 1;

-- 4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

SELECT nombre_cliente
FROM cliente
WHERE limite_credito > (
    SELECT COALESCE(SUM(total), 0)
    FROM pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente
);

-- 5. Devuelve el producto que más unidades tiene en stock.

SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock) FROM producto);

-- 6. Devuelve el producto que menos unidades tiene en stock.

SELECT nombre
FROM producto
WHERE cantidad_en_stock = (SELECT MIN(cantidad_en_stock) FROM producto);

-- 7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

SELECT e.nombre, e.apellido1, e.email
FROM empleado e
JOIN empleado e2 ON e.codigo_jefe = e2.codigo_empleado
WHERE e2.nombre = 'Alberto' AND e2.apellido1 = 'Soria';

-- 8. Devuelve el nombre del cliente con mayor límite de crédito.

SELECT nombre_cliente
FROM cliente
WHERE limite_credito >= ALL (SELECT limite_credito FROM cliente);

-- 9. Devuelve el nombre del producto que tenga el precio de venta más caro.

SELECT nombre
FROM producto
WHERE precio_venta >= ALL (SELECT precio_venta FROM producto);

-- 10. Devuelve el producto que menos unidades tiene en stock.

SELECT nombre
FROM producto
WHERE cantidad_en_stock <= ALL (SELECT cantidad_en_stock FROM producto);

-- 11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

SELECT nombre, apellido1, puesto
FROM empleado
WHERE codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente WHERE codigo_empleado_rep_ventas IS NOT NULL);

-- 12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);

-- 13. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

SELECT nombre_cliente
FROM cliente
WHERE codigo_cliente IN (SELECT DISTINCT codigo_cliente FROM pago);

-- 14. Devuelve un listado de los productos que nunca han aparecido en un pedido.

SELECT nombre
FROM producto
WHERE codigo_producto NOT IN (SELECT DISTINCT codigo_producto FROM detalle_pedido);

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

SELECT e.nombre, e.apellido1, e.puesto, o.telefono
FROM empleado e
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE e.codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente WHERE codigo_empleado_rep_ventas IS NOT NULL);

-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

SELECT DISTINCT o.*
FROM oficina o
WHERE o.codigo_oficina NOT IN (
    SELECT e.codigo_oficina
    FROM empleado e
    JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
    JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
    WHERE pr.gama = 'Frutales'
);

-- 17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

SELECT DISTINCT c.nombre_cliente
FROM cliente c
WHERE c.codigo_cliente IN (
    SELECT codigo_cliente FROM pedido
) AND c.codigo_cliente NOT IN (
    SELECT codigo_cliente FROM pago
);


-- 18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

SELECT nombre_cliente
FROM cliente c
WHERE NOT EXISTS (
    SELECT 1
    FROM pago p
    WHERE p.codigo_cliente = c.codigo_cliente
);

-- 19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

SELECT nombre_cliente
FROM cliente c
WHERE EXISTS (
    SELECT 1
    FROM pago p
    WHERE p.codigo_cliente = c.codigo_cliente
);

-- 20. Devuelve un listado de los productos que nunca han aparecido en un pedido.

SELECT nombre
FROM producto p
WHERE NOT EXISTS (
    SELECT 1
    FROM detalle_pedido dp
    WHERE dp.codigo_producto = p.codigo_producto
);

-- 21. Devuelve un listado de los productos (La consulta es similar a la 14).

SELECT nombre
FROM producto
WHERE NOT EXISTS (
    SELECT 1
    FROM detalle_pedido
    WHERE detalle_pedido.codigo_producto = producto.codigo_producto
);


-- Consultas Variadas

-- 1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

SELECT c.nombre_cliente, COUNT(p.codigo_pedido) AS num_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre_cliente;

-- 2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

SELECT c.nombre_cliente, COALESCE(SUM(p.total), 0) AS total_pagado
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre_cliente;

-- 3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

SELECT DISTINCT c.nombre_cliente
FROM cliente c
JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE YEAR(p.fecha_pedido) = 2008
ORDER BY c.nombre_cliente;

-- 4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

SELECT c.nombre_cliente, e.nombre, e.apellido1, o.telefono
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

-- 5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

SELECT c.nombre_cliente, e.nombre, e.apellido1, o.ciudad AS ciudad_oficina
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

-- 6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

SELECT e.nombre, e.apellido1, e.puesto, o.telefono
FROM empleado e
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE e.codigo_empleado NOT IN (
    SELECT codigo_empleado_rep_ventas
    FROM cliente
    WHERE codigo_empleado_rep_ventas IS NOT NULL
);

-- 7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

SELECT o.ciudad, COUNT(e.codigo_empleado) AS num_empleados
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
GROUP BY o.ciudad;



