CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY,
        titulo VARCHAR(100),
            autor VARCHAR(50),
                genero VARCHAR(30),
                    año_publicacion INT
                    );

                    CREATE TABLE Usuario (
                        id_usuario INT PRIMARY KEY,
                            nombre VARCHAR(50),
                                telefono VARCHAR(15),
                                    email VARCHAR(50)
                                    );

                                    CREATE TABLE Bibliotecario (
                                        id_bibliotecario INT PRIMARY KEY,
                                            nombre VARCHAR(50),
                                                turno VARCHAR(20)
                                                );

                                                CREATE TABLE Prestamo (
                                                    id_prestamo INT PRIMARY KEY,
                                                        id_libro INT,
                                                            id_usuario INT,
                                                                id_bibliotecario INT,
                                                                    fecha_prestamo DATE,
                                                                        fecha_devolucion DATE,
                                                                            FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
                                                                                FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
                                                                                    FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecario(id_bibliotecario)
                                                                                    );


                                                                                    INSERT INTO Libro VALUES (1, 'Cien Años de Soledad', 'Gabriel García Márquez', 'Realismo Mágico', 1967);
                                                                                    INSERT INTO Libro VALUES (2, 'El Quijote', 'Miguel de Cervantes', 'Clásico', 1605);
                                                                                    INSERT INTO Libro VALUES (3, 'Rayuela', 'Julio Cortázar', 'Ficción', 1963);

                                                                                    INSERT INTO Usuario VALUES (1, 'Ana Torres', '3001111111', 'ana@email.com');
                                                                                    INSERT INTO Usuario VALUES (2, 'Pedro Ruiz', '3002222222', 'pedro@email.com');

                                                                                    INSERT INTO Bibliotecario VALUES (1, 'Lucía Morales', 'Mañana');
                                                                                    INSERT INTO Bibliotecario VALUES (2, 'Diego Silva', 'Tarde');

                                                                                    INSERT INTO Prestamo VALUES (1, 1, 1, 1, '2025-06-15', '2025-06-29');
                                                                                    INSERT INTO Prestamo VALUES (2, 2, 2, 2, '2025-06-20', NULL);

                                                                                    -- CONSULTAS CON FUNCIONES DE CADENA
                                                                                    SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM Libro;
                                                                                    SELECT titulo FROM Libro WHERE autor LIKE '%García%';
                                                                                    SELECT UPPER(genero) AS genero_mayuscula FROM Libro;
                                                                                    SELECT LOWER(autor) AS autor_minuscula FROM Libro;
                                                                                    SELECT CONCAT(titulo, ' - ', autor) AS libro_completo FROM Libro;
                                                                                    SELECT REPLACE(genero, 'Realismo', 'Neo-realismo') FROM Libro;
                                                                                    SELECT LEFT(titulo, 5) AS primeras_letras FROM Libro;

                                                                                    DELIMITER //
                                                                                    CREATE PROCEDURE RegistrarPrestamo (
                                                                                        IN p_id_prestamo INT,
                                                                                            IN p_id_libro INT,
                                                                                                IN p_id_usuario INT,
                                                                                                    IN p_id_bibliotecario INT,
                                                                                                        IN p_fecha_prestamo DATE
                                                                                                        )
                                                                                                        BEGIN
                                                                                                            INSERT INTO Prestamo (id_prestamo, id_libro, id_usuario, id_bibliotecario, fecha_prestamo)
                                                                                                                VALUES (p_id_prestamo, p_id_libro, p_id_usuario, p_id_bibliotecario, p_fecha_prestamo);
                                                                                                                END //
                                                                                                                DELIMITER ;

                                                                                                                CALL RegistrarPrestamo(3, 3, 1, 1, '2025-06-22');


                                                                                                                UPDATE Libro SET año_publicacion = 1968 WHERE id_libro = 1;
                                                                                                                UPDATE Usuario SET email = 'ana.torres@email.com' WHERE id_usuario = 1;
                                                                                                                DELETE FROM Prestamo WHERE id_prestamo = 3;


                                                                                                                ALTER TABLE Libro ADD editorial VARCHAR(50);
                                                                                                                ALTER TABLE Usuario ADD direccion VARCHAR(100);
                                                                                                                ALTER TABLE Prestamo ADD multa DECIMAL(6,2)