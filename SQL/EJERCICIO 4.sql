-- EJERCICIO 4


-- Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").

CREATE TABLE IF NOT EXISTS public.pedidos (
id serial PRIMARY KEY,
id_usuario integer NOT NULL,
id_producto integer NOT NULL,
CONSTRAINT fk_pedidos_usuario
FOREIGN KEY (id_usuario)
REFERENCES public.usuarios(id),
CONSTRAINT fk_pedidos_producto
FOREIGN KEY (id_producto)
REFERENCES public.productos(id)
);

-- Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.

insert into public.usuarios (id,nombre,edad)
values (2,'jacobo',43),
	   (3,'pedro',37);

UPDATE public.usuarios u
SET ciudades_id = c.id
FROM public.ciudades c
WHERE u.nombre = 'pedro' AND c.nombre = 'londres';



INSERT INTO public.pedidos (id_usuario, id_producto)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);

-- Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).

SELECT
u.nombre AS usuario,
COALESCE(pr.nombre, '(sin pedido)') AS producto
FROM public.usuarios AS u
LEFT JOIN public.pedidos AS pe ON pe.id_usuario = u.id
LEFT JOIN public.productos AS pr ON pr.id = pe.id_producto
ORDER BY u.nombre, producto;


-- Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).

SELECT u.nombre
FROM public.usuarios u
LEFT JOIN public.pedidos pe ON pe.id_usuario = u.id
ORDER BY u.nombre;

-- Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)	   

ALTER TABLE public.pedidos
ADD COLUMN IF NOT EXISTS cantidad integer

UPDATE public.pedidos
SET cantidad = 1 
WHERE id=2;
UPDATE public.pedidos
SET cantidad = 2
WHERE id IN (1,3);