USE tienda;
SELECT * FROM puesto;

SELECT max(id_puesto) -5 FROM puesto;

#Ejemplo de una subconsulta en WHERE
SELECT sum(salario)
FROM puesto
WHERE id_puesto > 
(SELECT max(id_puesto) -5 FROM puesto);

#WHERE in
SELECT id_puesto
FROM puesto
WHERE nombre = 'Junior Executive';

SELECT *
FROM empleado
WHERE id_puesto in (
SELECT id_puesto
FROM puesto
WHERE nombre = 'Junior Executive');

#FROM
#Para saber la menor y mayor cantidad de ventas de un artículo

SELECT * FROM venta;

SELECT clave, id_articulo, count(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY cantidad DESC;

SELECT id_articulo, min (cantidad) AS cant_min, max(cantidad) AS cant_max
FROM
(SELECT clave, id_articulo, count(*) AS cantidad
FROM venta
GROUP BY clave, id_articulo
ORDER BY cantidad DESC AS subconsulta)
GROUP BY id_articulo;


#******************** Reto 1 ***********************

#nombre de los empleados cuyo sueldo es menor a $10,000
SHOW tables;
DESCRIBE venta;
#SELECT * FROM puesto WHERE nombre in (SELECT salario FROM puesto WHERE salario < 100000);

#cantidad mínima y máxima de ventas de cada empleado
SELECT id_empleado, min(total_ventas), max(total_ventas) 
FROM  (
    SELECT id_empleado, count(*) total_ventas       
    FROM venta       
    GROUP BY id_empleado
    ) AS g GROUP BY id_empleado;

#claves de venta que incluyen artículos cuyos precios son mayores a $5,000
SELECT id_venta FROM venta 
WHERE id_articulo in(
SELECT id_articulo 
FROM articulo WHERE precio > 5000) ;

#joins
SHOW KEYS FROM venta;

SELECT * FROM puesto;
SELECT * FROM empleado;

SELECT *
FROM empleado AS e
JOIN puesto AS p
ON e.id_puesto = p.id_puesto;

SELECT *
FROM puesto AS p LEFT JOIN empleado AS e
ON p.id_puesto = e.id_puesto;

SELECT *
FROM empleado AS e RIGHT JOIN puesto AS p
ON p.id_puesto = e.id_puesto;

#*********************Reto 2*******************
#nombre de los empleados que realizaron cada venta
SELECT nombre, apellido_paterno
FROM empleado AS e LEFT JOIN venta AS v
ON e.id_empleado = v.id_empleado;

#nombre de los artículos que se han vendido
SELECT nombre
FROM articulo AS a RIGHT JOIN venta AS v
ON a.id_articulo = v.id_articulo;

#total de cada venta
SELECT clave, sum(precio) AS total_venta
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo
GROUP BY clave;


#Vistas
CREATE VIEW tickets7 AS
SELECT v.clave, v.fecha, a.nombre AS producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) AS empleado
FROM venta AS v
JOIN empleado AS e
ON v.id_empleado = e.id_empleado
JOIN articulo AS a
ON v.id_articulo = a.id_articulo;

SELECT * FROM tickets7;

SELECT clave, round(sum(precio), 2) AS total
FROM tickets7;