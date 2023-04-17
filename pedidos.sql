CREATE DATABASE pedidos;

CREATE TABLE cliente(
	id_cliente INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(15),
	apellido VARCHAR(15),
	edad INT(10)
);

CREATE TABLE pedidos(
    id_pedidos INT(20)PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cliente INT,
	lugar_origen VARCHAR(50),
	lugar_destino VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ON DELETE CASCADE
);

CREATE TABLE pagos(
    id_pagos INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    monto_total INT(10),
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ON DELETE CASCADE
    
);

CREATE TABLE productos(
    id_productos INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_pagos INT,
    tipo_producto VARCHAR(50),
	precio Integer(20),
	nonmbre_producto VARCHAR(50),
	marca VARCHAR(50),
    FOREIGN KEY (id_pagos) REFERENCES pagos (id_pagos) ON DELETE CASCADE
);

CREATE TABLE productos_pago(
    id_productos_pago INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_productos INT,
    id_pagos INT,
    FOREIGN KEY (id_pagos) REFERENCES pagos (id_pagos) ON DELETE CASCADE,
    FOREIGN KEY (id_productos) REFERENCES productos (id_productos) ON DELETE CASCADE
);

CREATE TABLE pedidos_productos(
    id_pedido_productos INT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	id_productos INT,
	id_pedidos INT,
    FOREIGN KEY (id_productos) REFERENCES productos (id_productos) ON DELETE CASCADE,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos (id_pedidos) ON DELETE CASCADE
);

INSERT INTO cliente (nombre,apellido,edad) VALUES
('Cristian','Palta',18),
('Juan','Boli',19),
('David','Felipe',19),
('Raul','kiri',19),
('Camilo','Vitonco',19);

INSERT INTO pedidos (id_cliente,lugar_origen,lugar_destino) VALUES
(1,'POPAYAN','MEDELLIN'),
(2,'POPAYAN','MEDELLIN'),
(3,'POPAYAN','MEDELLIN'),
(4,'POPAYAN','MEDELLIN'),
(5,'POPAYAN','MEDELLIN');

INSERT INTO pagos (id_cliente,monto_total,metodo_pago) VALUES
(1,24500,'VISA'),
(2,88000,'MASTERCARD'),
(3,50234,'PAYPAL'),
(4,79349,'CONTRA ENTREGA'),
(5,35000,'PAYPAL');

UPDATE cliente SET nombre = 'ALDAIR' WHERE id_cliente = 1;
UPDATE cliente SET nombre = 'EZIO' WHERE id_cliente = 2;
UPDATE cliente SET nombre = 'DANTE' WHERE id_cliente = 3;
UPDATE cliente SET nombre = 'CAMILO' WHERE id_cliente = 4;
UPDATE cliente SET nombre = 'MINO' WHERE id_cliente = 5;


DELETE FROM pedidos WHERE id_pedidos = 1;
DELETE FROM pedidos WHERE id_pedidos = 2;
DELETE FROM pedidos WHERE id_pedidos = 3;
DELETE FROM pedidos WHERE id_pedidos = 4;
DELETE FROM pedidos WHERE id_pedidos = 5;

