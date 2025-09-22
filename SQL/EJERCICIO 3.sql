-- Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).

CREATE TABLE IF NOT EXISTS productos (
id SERIAL PRIMARY KEY,
nombre varchar(255),
precio decimal
) ;

--Inserta al menos cinco registros en la tabla "Productos".

INSERT INTO public.productos(id,nombre,precio)
VALUES (1,'tomate',0.49),
       (2,'mango',1.09),
	   (3,'fresa',0.18),
	   (4,'melon',0.57),
	   (5,'lechuga',0.99);

-- Actualiza el precio de un producto en la tabla "Productos".

UPDATE public.productos
SET precio =0.69
where id=4;

--  Elimina un producto de la tabla "Productos".

DELETE FROM public.productos.
WHERE id = 5;

-- Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos")	

SELECT u.nombre,	
	   p.nombre
FROM public.usuarios AS u
INNER JOIN public.productos AS p
ON p.usuario_id = u.id;