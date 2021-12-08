# Create schemas

# Create tables
CREATE TABLE IF NOT EXISTS cliente
(
    id INT NOT NULL AUTO_INCREMENT,
    telefono VARCHAR(40),
    nombre VARCHAR(40),
    apellido VARCHAR(40),
    direccion VARCHAR(40),
    codigo_postal VARCHAR(40),
    localidad_id INT,
    provincia_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS localidad
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS provincia
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS pedido
(
    id INT NOT NULL AUTO_INCREMENT,
    fecha_hora DATETIME,
    pedido_reparto VARCHAR(10),
    pedio_recoger VARCHAR(10),
    numero_productos INT,
    precio_total FLOAT(10),
    pizza_id INT,
    hamburguesa_id INT,
    bebida_id INT,
    cliente_id INT,
    tienda_id INT,
    empleado_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS pizza
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40),
    descripcion VARCHAR(40),
    imagen VARCHAR(40),
    precio FLOAT(10),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS hamburguesa
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40),
    descripcion VARCHAR(40),
    imagen VARCHAR(40),
    precio FLOAT(10),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS bebida
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40),
    descripcion VARCHAR(40),
    imagen VARCHAR(40),
    precio FLOAT(10),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tienda
(
    id INT NOT NULL AUTO_INCREMENT,
    direccion VARCHAR(40),
    codigo_postal VARCHAR(40),
    localidad VARCHAR(40),
    provincia VARCHAR(40),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS empleado
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40),
    apellido VARCHAR(40),
    dni VARCHAR(40),
    telefono VARCHAR(40),
    PRIMARY KEY(id)
);


# Create FKs
ALTER TABLE cliente
    ADD    FOREIGN KEY (localidad_id)
    REFERENCES localidad(id)
;
    
ALTER TABLE cliente
    ADD    FOREIGN KEY (provincia_id)
    REFERENCES provincia(id)
;
    
ALTER TABLE pedido
    ADD    FOREIGN KEY (pizza_id)
    REFERENCES pizza(id)
;
    
ALTER TABLE pedido
    ADD    FOREIGN KEY (hamburguesa_id)
    REFERENCES hamburguesa(id)
;
    
ALTER TABLE pedido
    ADD    FOREIGN KEY (bebida_id)
    REFERENCES bebida(id)
;
    
ALTER TABLE pedido
    ADD    FOREIGN KEY (cliente_id)
    REFERENCES cliente(id)
;
    
ALTER TABLE pedido
    ADD    FOREIGN KEY (tienda_id)
    REFERENCES tienda(id)
;
    
ALTER TABLE pedido
    ADD    FOREIGN KEY (empleado_id)
    REFERENCES empleado(id)
;

# ******************************************************************************************************
#PRUEBAS: 

#Listar cuantas bebidas se han vendido en una determinada localidad. 

#En esta ocasión sacaremos las bebidas vendidas en la localidad de Barcelona, donde hay dos tiendas, la tienda 
# con ID 1 y la tienda con ID 2:

SELECT bebida_id,tienda_id FROM pedido
where tienda_id = 1 or tienda_id = 2;


#Listar cuantos pedidos ha efectuado un empleado. 

#Sacamos los pedidos del empleado con ID 2:

SELECT * FROM pedido
where empleado_id = 2;