-- connectar:

-- \connect --mysql root@localhost
-- \sql
-- use ejercicio02_01_optica;



# Create schemas

# Create tables
CREATE TABLE IF NOT EXISTS proveedor
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    calle VARCHAR(40),
    numero VARCHAR(0),
    piso VARCHAR(20),
    puerta VARCHAR(20),
    ciudad VARCHAR(40),
    cp VARCHAR(20),
    pais VARCHAR(40),
    telefono VARCHAR(20),
    fax VARCHAR(20),
    nif VARCHAR(20),
    marca_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS gafas
(
    id INT NOT NULL AUTO_INCREMENT,
    graduacion_izquierda FLOAT(20),
    graduacion_derecha FLOAT(20),
    tipo_montura VARCHAR(20),
    color_montura VARCHAR(20),
    color_cristales VARCHAR(20),
    precio FLOAT(10),
    fecha_venta TIMESTAMP,
    cliente_id INT,
    marca_id INT,
    empleado_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS cliente
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(60),
    telefono VARCHAR(40),
    mail VARCHAR(40),
    fecha_registro TIMESTAMP NOT NULL DEFAULT NOW(),
    cliente_id_recomendado INT,
    empleado_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS empleado
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS marca
(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);


# Create FKs
ALTER TABLE cliente
    ADD    FOREIGN KEY (empleado_id)
    REFERENCES empleado(id)
;
    
ALTER TABLE cliente
    ADD    FOREIGN KEY (cliente_id_recomendado)
    REFERENCES cliente(id)
;
    
ALTER TABLE gafas
    ADD    FOREIGN KEY (cliente_id)
    REFERENCES cliente(id)
;
    
ALTER TABLE gafas
    ADD    FOREIGN KEY (marca_id)
    REFERENCES marca(id)
;
    
ALTER TABLE proveedor
    ADD    FOREIGN KEY (marca_id)
    REFERENCES marca(id)
;
    
ALTER TABLE gafas
    ADD    FOREIGN KEY (empleado_id)
    REFERENCES empleado(id)
;
    

# ******************************************************************************************************
#PRUEBAS: 

#Ventas a cliente desde el 1 de enero de 2020 hasta el 1 de Octubre 2021:

SELECT * FROM ejercicio02_01_optica.gafas
WHERE cliente_id = 6
and fecha_venta between '2020-1-1' and '2021-10-1';


#Listado de diferentes modelo que ha vendido un empleado durante el año 2021:


SELECT * FROM ejercicio02_01_optica.gafas
WHERE empleado_id = 1
AND fecha_venta between '2021-1-1' and '2021-12-31';


#Proveedor del modelo más vendido:

SELECT count(id) , marca_id, proveedor
FROM ejercicio02_01_optica.gafas
group by proveedor;