4CREATE DATABASE TIENDA;
USE TIENDA;

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
        nombre VARCHAR(50),
            categoria VARCHAR(30),
                precio DECIMAL(8,2),
                    stock INT
                    );

                    CREATE TABLE Cliente (
                        id_cliente INT PRIMARY KEY,
                            nombre VARCHAR(50),
                                cedula VARCHAR(15),
                                    direccion VARCHAR(100)
                                    );
                                    - TIENDA: Cliente con mayor compra
USE TIENDA;
SELECT nombre FROM Cliente 
WHERE id_cliente = (
    SELECT id_cliente 
    FROM Venta 
    ORDER BY total DESC 
    LIMIT 1
);

                                    CREATE TABLE Empleado (
                                        id_empleado INT PRIMARY KEY,
                                            nombre VARCHAR(50),
                                                cargo VARCHAR(30),
                                                    salario DECIMAL(10,2)
                                                    );

                                                    CREATE TABLE Venta (
                                                        id_venta INT PRIMARY KEY,
                                                            id_cliente INT,
                                                                id_empleado INT,
                                                                    fecha DATE,
                                                                        total DECIMAL(10,2),
                                                                            FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
                                                                                FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
                                                                                );

                                                                                CREATE TABLE Venta_Producto (
                                                                                    id_venta INT,
                                                                                        id_producto INT,
                                                                                            cantidad INT,
                                                                                                precio_unitario DECIMAL(8,2),
                                                                                                    PRIMARY KEY (id_venta, id_producto),
                                                                                                        FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
                                                                                                            FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
                                                                                                            );

                                                                                                            -- INSERCIÓN DE DATOS
                                                                                                            INSERT INTO Producto VALUES (1, 'Televisor Samsung', 'Electrónicos', 1200000.00, 15);
                                                                                                            INSERT INTO Producto VALUES (2, 'Sofá Cama', 'Muebles', 800000.00, 8);
                                                                                                            INSERT INTO Producto VALUES (3, 'Licuadora Oster', 'Electrodomésticos', 150000.00, 25);

                                                                                                            INSERT INTO Cliente VALUES (1, 'María Rodríguez', '12345678', 'Calle 10 #20-30');
                                                                                                            INSERT INTO Cliente VALUES (2, 'Juan Pérez', '87654321', 'Carrera 15 #25-40');

                                                                                                            INSERT INTO Empleado VALUES (1, 'Andrea López', 'Vendedora', 1200000.00);
                                                                                                            INSERT INTO Empleado VALUES (2, 'Miguel Torres', 'Supervisor', 1800000.00);

                                                                                                            INSERT INTO Venta VALUES (1, 1, 1, '2025-06-20', 1350000.00);
                                                                                                            INSERT INTO Venta VALUES (2, 2, 2, '2025-06-21', 800000.00);

                                                                                                            INSERT INTO Venta_Producto VALUES (1, 1, 1, 1200000.00);
                                                                                                            INSERT INTO Venta_Producto VALUES (1, 3, 1, 150000.00);
                                                                                                            INSERT INTO Venta_Producto VALUES (2, 2, 1, 800000.00);


                                                                                                            SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Producto;
                                                                                                            SELECT nombre FROM Producto WHERE categoria LIKE '%Electr%';
                                                                                                            SELECT UPPER(categoria) AS categoria_mayuscula FROM Producto;
                                                                                                            SELECT LOWER(cargo) AS cargo_minuscula FROM Empleado;
                                                                                                            SELECT CONCAT(nombre, ' - $', precio) AS producto_precio FROM Producto;
                                                                                                            SELECT REPLACE(categoria, 'Electrónicos', 'Tecnología') FROM Producto;
                                                                                                            SELECT LEFT(nombre, 8) AS nombre_corto FROM Producto;


                                                                                                            CREATE PROCEDURE RegistrarVenta (
                                                                                                                IN p_id_venta INT,
                                                                                                                    IN p_id_cliente INT,
                                                                                                                        IN p_id_empleado INT,
                                                                                                                            IN p_fecha DATE,
                                                                                                                                IN p_total DECIMAL(10,2)
                                                                                                                                )
                                                                                                                                BEGIN
                                                                                                                                    INSERT INTO Venta (id_venta, id_cliente, id_empleado, fecha, total)
                                                                                                                                        VALUES (p_id_venta, p_id_cliente, p_id_empleado, p_fecha, p_total);
                                                                                                                                        END //
                                                                                                                                        DELIMITER ;

                                                                                                                                        CALL RegistrarVenta(3, 1, 2, '2025-06-22', 150000.00);

                                                                                                                                        -- ACTUALIZACIONES Y ELIMINACIONES
                                                                                                                                        UPDATE Producto SET precio = 1250000.00 WHERE id_producto = 1;
                                                                                                                                        UPDATE Empleado SET salario = 1300000.00 WHERE id_empleado = 1;
                                                                                                                                        DELETE FROM Venta_Producto WHERE id_venta = 3;
                                                                                                                                        DELETE FROM Venta WHERE id_venta = 3;

                                                                                                                                        -- MODIFICACIONES DE ESTRUCTURA
                                                                                                                                        ALTER TABLE Producto ADD marca VARCHAR(30);
                                                                                                                                        ALTER TABLE Cliente ADD telefono VARCHAR(15);
                                                                                                                                        ALTER TABLE Venta ADD descuento DECIMAL(5,2);
                                                                                                                                    
                                                                                                                        
                                                                                                                                    
                                                                                                                                    
                                                                                                                                
                                                                                                                                        
                                                                                                                                                
                                                                                                                                                        
                                                                                            