-- EJERCICIO 5

-- 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).

CREATE TABLE IF NOT EXISTS clientes (
id SERIAL PRIMARY KEY,
nombre  varchar(255)
);

-- 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".

insert into public.clientes(id,nombre)
values (1,'john');

-- 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".

update public.clientes
set nombre ='john doe'
where id= 1;

-- 4. Elimina el cliente con id=1 de la tabla "Clientes".

delete from public.clientes
where id=1;

-- 5. Lee todos los clientes de la tabla "Clientes".

select * from public.clientes;

-- 6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero). 

create table if not exists pedidos(
id serial primary key,
cliente_id integer
);

-- 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos". 

insert into public.pedidos (id,cliente_id)
values (1,1);


-- 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".  

update public.pedidos
set cliente_id = 2
where id =1;


-- 9. Elimina el pedido con id=1 de la tabla "Pedidos".

delete from public.pedidos
where id=1;

-- 10. Lee todos los pedidos de la tabla "Pedidos".

select * from public.pedidos;


-- 11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto). 

create table if not exists productos(
id serial primary key,
nombre varchar(255)
);

-- 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos". 

insert into public.productos (id,nombre)
values (1,'camisa');


-- 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos". 

update public.productos
set nombre ='pantalon'
where id =1;

-- 14. Elimina el producto con id=1 de la tabla "Productos". 

delete from public.productos
where id =1;


-- 15. Lee todos los productos de la tabla "Productos". 

select * from public.productos

-- 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero). 

create table if not exists detallespedidos(
id serial primary key,
producto_id serial
);

alter table public.detallespedidos
rename id to pedidos_id;

-- 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".

insert into public.detallespedidos (pedidos_id,producto_id)
values(1,1);



-- 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".

update public.detallespedidos
set producto_id = 2
where pedidos_id =1;

-- 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".

delete from public.detallespedidos
where pedidos_id = 1;


-- 20. Lee todos los detalles de pedido de la tabla "DetallesPedido". 

select * from public.detallespedidos;


-- 21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join. 

select c.id, c.nombre, p.id as pedido_id -- para saber que id es de pedidos
from public.clientes as c
inner join public.pedidos as p on p.cliente_id = c.id;

-- 22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join. 

select c.id,c.nombre,p.id as pedido_id
from public.clientes as c
left join public.pedidos as p on c.id = p.cliente_id;



-- 23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.

SELECT pr.id, pr.nombre, dp.pedidos_id
FROM public.productos AS pr
INNER JOIN public.detallespedidos AS dp ON dp.producto_id = pr.id;


-- 24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.

SELECT pr.id, pr.nombre, dp.pedidos_id
FROM public.productos AS pr
LEFT JOIN public.detallespedidos AS dp ON dp.producto_id = pr.id;

-- 25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes". 

alter table public.clientes
 alter column telefono integer;
ALTER TABLE public.clientes
  ALTER COLUMN telefono TYPE varchar(255);

-- 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero. 

alter table public.clientes
 alter column telefono type integer
 USING telefono::integer;

-- 27. Elimina la columna "telefono" de la tabla "Clientes". 

ALTER TABLE public.clientes 
DROP COLUMN telefono;

-- 28. Cambia el nombre de la tabla "Clientes" a "Usuarios". 

alter table public.clientes
 rename to usuarios;


-- 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo". 

alter table public.usuarios
 rename column nombre to nombre_completo;

-- 30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".

ALTER TABLE public.usuarios
ADD CONSTRAINT pk_usuarios_id PRIMARY KEY (id);