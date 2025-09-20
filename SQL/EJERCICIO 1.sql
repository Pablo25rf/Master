-- Ejercicio Nº1 



-- CREACIÓN DE TABLA CLIENTES

create table if not exists clientes(
id serial primary key,
name varchar(255) not null,
email varchar(255)not null
);

-- AÑADIR VALORES

insert into public.clientes  (id,name,email)
values (2, 'Pablo','pablo@gmail.com')


-- MODIFICAR VALORES

update public.clientes
set email= 'juan@gmail.com'
where id=1

-- ELIMINAR VALORES

DELETE FROM public.clientes
where id= 1

-- CREACIÓN TABLA PEDIDOS

create table if not exists pedidos(
id serial primary key,
producto varchar(255) not null,
cantidad integer not null,    -- integer es para decirle que es un numero
cliente_id integer not null, 
CONSTRAINT FK_cliente_id 
 FOREIGN KEY (cliente_id)
 REFERENCES clientes(id)
);

-- INSERTAR UN NUEVO PEDIDO

insert into public.pedidos(id,cliente_id,producto,cantidad)
values (2,2,'Sudadera',3)

-- MODIFICAR VALORES PEDIDOS

update public.pedidos
set producto = 'camiseta'
where id = 1

-- ELIMINAR VALORES PEDIDOS

delete from public.pedidos
where id=1

--CREACIÓN TABLA  PRODUCTOS

CREATE TABLE IF NOT EXISTS public.productos(
id serial primary key,
nombre varchar(255) not null,
precio numeric not null
);

-- INSERTAR VALORES

INSERT INTO public.productos(id,nombre,precio)
values 
  (1,'sudadera',19.99),
  (2,'calcetines',7.00),
  (3,'pantalon',24.99),
  (4,'camiseta',12.99);

-- CONSULTAR TODOS LOS CLIENTE DE LA TABLA CLIENTES

select * from public.clientes

-- CONSULTAR TODOS LOS PEDIDOS DE LA TABLA PEDIDOS JUNTO CON SU NOMBRE

SELECT pe.*,cl.name FROM public.pedidos as pe
inner join public.clientes as cl
on cl.id=pe.cliente_id

-- CONSULTAR LOS PRODUCTOS DE LA TABLA PRODUCTOS CUYO PRECIO SEA MAYOR A 10 

SELECT * from public.productos
where precio>10

-- CONSULTAR LOS PEDIDOS DE LA TABLA PEDIDOS QUE TENGA CANITDAD MAYOR A 1

SELECT * FROM PUBLIC.PEDIDOS
WHERE cantidad>1

-- CONSULTAR EN TABLA CLIENTES, QUE CLIENTES SU NOMBRE EMPIEZA POR A 

SELECT * from public.clientes       -- like es igual, tiene que ser igual a como lo ponemos. % marca por así decirlo x caracteres que nos dan igual
where name like 'A%'                 -- '% A %' -- que contuviera la letra A

-- CONSULTA QUE MUESTRE EL NOMBRE DEL CLIENTE Y TOTAL DE PEDIDOS POR CLIENTE

        
SELECT cl.name,cl.id,             -- AL PONER UN ALIAS HAY QUE USARLO CASI SIEMRE PARA REFERIRNOS A ESA COLUMNA
count(ped.id) as total_pedidos
from public.pedidos as ped
inner join clientes as cl
on cl.id = ped.cliente_id
group by cl.name, cl.id
order by total_pedidos desc

-- CONSULTA QUE MUESTRE EL NOMBRE DEL PRODUCTO Y LA CANTIDAD TOTAL DE PEDIDOS DE ESE PRODUCTO

SELECT ped.producto, 
count(ped.id) as total_pedidos
from public.pedidos as ped
group by ped.producto
order by total_pedidos desc

-- AGREGAR UNA COLUMNA DE TIPO FECHA A LA TABLA PEDIDOS

alter table public.pedidos
add column fecha date
update public.pedidos
set fecha = '04-01-2025'
where id =2

-- Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".
--      obligar a que cada valor de pedidos.producto exista en productos.nombre

ALTER TABLE public.productos 
ADD CONSTRAINT uq_productos_nombre UNIQUE (nombre); 
ALTER TABLE public.pedidos 
ADD CONSTRAINT fk_pedidos_producto_nombre 
FOREIGN KEY (producto) 
REFERENCES public.productos(nombre);

-- Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.

select clientes.name, productos.nombre,ped.cantidad
from public.pedidos as ped
inner join public.clientes on clientes.id = ped.cliente_id
inner join public.productos on productos.nombre = ped.producto
order by clientes.name,productos.nombre