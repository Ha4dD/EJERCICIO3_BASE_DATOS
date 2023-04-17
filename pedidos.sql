CREATE DATABASE pedidos;

CREATE TABLE cliente(
	id_cliente INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(15),
	apellido VARCHAR(15),
	edad VARCHAR(100)
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