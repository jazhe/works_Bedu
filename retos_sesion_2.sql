#Busqeda de patrones con LIKE
USE tienda;
SHOW TABLES;
SELECT * FROM puesto;
SELECT * FROM empleado WHERE nombre LIKE 'M%'; #que empiece con M
SELECT * FROM empleado WHERE nombre LIKE '%a'; #que acabe con a
SELECT * FROM empleado WHERE nombre LIKE 'M%a'; #que empiece con M y acabe con a
SELECT * FROM empleado WHERE nombre LIKE 'M_losa'; #el _ indica que puede ser cualquier caracter

#artículos incluyen la palabra Pasta en su nombre
SELECT * FROM articulo WHERE nombre LIKE 'Pasta%';
#artículos incluyen la palabra Cannelloni en su nombre
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';
#nombres están separados por un guión (-) por ejemplo Puree - Kiwi
SELECT * FROM articulo WHERE nombre LIKE '%-%';
#puestos que incluyen la palabra Designer
SELECT * FROM puesto WHERE nombre LIKE '%Designer%';
#puestos que incluyen la palabra Developer
SELECT * FROM puesto WHERE nombre LIKE '%Developer%';


#Funciones de agrupamiento
SELECT (1 + 7) * (10 / (6 - 4));	#Podemos realizar operaciones matenáticas
SELECT avg(precio) AS promedio_precio FROM articulo;
SELECT count(*) AS conteo_articulos FROM articulo;
SELECT max(precio) AS precio_maximo FROM articulo;
SELECT sum(precio) AS suma_precio FROM articulo;
#Reto_2
#promedio de salario de los puestos
SELECT avg(salario) AS salario_promedio FROM puesto;
#artículos que incluyen la palabra Pasta en su nombre
SELECT count(*) AS pasta FROM articulo WHERE nombre LIKE '%Pasta%';
#salario mínimo y máximo
SELECT min(salario) AS salario_minimo, max(salario) AS salario_maximo FROM puesto;
#suma del salario de los últimos cinco puestos agregados
SELECT sum(salario) FROM puesto ORDER BY id_puesto DESC LIMIT 5;


#GROUP BY
SELECT * FROM articulo;
SELECT nombre, sum(precio) AS precio_total FROM articulo GROUP BY nombre;
SELECT nombre, count(*) FROM articulo GROUP BY nombre;
SELECT nombre, count(*) AS cantidad FROM articulo GROUP BY nombre ORDER BY cantidad DESC;
SELECT nombre, min(salario) AS salario_minimo, max(salario) AS salario_maximo FROM puesto GROUP BY nombre;
#Reto 3
#registros que hay por cada uno de los puestos
SELECT nombre, count(*) FROM puesto GROUP BY nombre;
#dinero que se paga en total por puesto
SELECT nombre, sum(salario) AS salario_total FROM puesto GROUP BY nombre;
#número total de ventas por vendedor
SELECT id_empleado, count(id_venta) AS ventas_vendedor FROM venta GROUP BY id_empleado;
#número total de ventas por artículo
SELECT id_articulo, count(id_venta) AS ventas_articulo FROM venta GROUP BY id_articulo;