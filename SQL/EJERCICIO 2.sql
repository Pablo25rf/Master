-- EJERCICIO 2 

--Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).

CREATE TABLE IF NOT EXISTS usuarios(
id serial PRIMARY KEY,
nombre varchar(255) NOT NULL,
edad integer NOT NULL 
);

-- Inserta dos registros en la tabla "Usuarios".

INSERT INTO public.usuarios (id,nombre,edad)
values (1,'paco',24),
       (2,'manuel',77);

-- Actualiza la edad de un usuario en la tabla "Usuarios".

UPDATE public.usuarios
SET edad = 69
WHERE id = 1;

-- Elimina un usuario de la tabla "Usuarios".

DELETE FROM public.usuarios
WHERE id = 2

-- Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).

CREATE TABLE IF NOT EXISTS ciudades(
id SERIAL PRIMARY KEY,
nombre varchar(255),
pais varchar(255)
);

-- Inserta al menos tres registros en la tabla "Ciudades".

INSERT INTO public.ciudades(id,nombre,pais)
VALUES (1,'cadiz', 'españa'),
       (2,'londres','reino unido'),
	   (3,'berlin','alemania'),
	   (4,'miami','estados unidos');

-- Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".

ALTER TABLE public.usuarios
ADD COLUMN ciudades_id INTEGER,
ADD CONSTRAINT fk_ciudades_id
FOREIGN KEY (ciudades_id)
REFERENCES public.ciudades(id);

-- Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).

SELECT u.nombre AS usuario,
       c.nombre AS ciudad,
	   c.pais AS pais
FROM public.usuarios AS u
LEFT JOIN public.ciudades AS c
ON c.id = u.ciudades_id
ORDER BY u.id;

-- Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).

SELECT u.nombre,
       c.nombre
FROM public.usuarios as u
INNER JOIN public.ciudades as c
on u.ciudades_id=c.id
ORDER BY u.id;