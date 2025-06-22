-- CREACIÓN DE BASE DE DATOS Y TABLAS
CREATE DATABASE VETERINARIA;
USE VETERINARIA;

CREATE TABLE Mascota (
    id_mascota INT PRIMARY KEY,
        nombre VARCHAR(50),
            especie VARCHAR(30),
                raza VARCHAR(50),
                    edad INT,
                        peso DECIMAL(5,2)
                        );

                        CREATE TABLE Propietario (
                            id_propietario INT PRIMARY KEY,
                                nombre VARCHAR(50),
                                    telefono VARCHAR(15),
                                        email VARCHAR(50)
                                        );

                                        CREATE TABLE Veterinario (
                                            id_veterinario INT PRIMARY KEY,
                                                nombre VARCHAR(50),
                                                    especialidad VARCHAR(40)
                                                    );

                                                    CREATE TABLE Consulta (
                                                        id_consulta INT PRIMARY KEY,
                                                            id_mascota INT,
                                                                id_veterinario INT,
                                                                    fecha DATE,
                                                                        motivo VARCHAR(100),
                                                                            FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
                                                                                FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario)
                                                                                );

                                                                                CREATE TABLE Mascota_Propietario (
                                                                                    id_mascota INT,
                                                                                        id_propietario INT,
                                                                                            PRIMARY KEY (id_mascota, id_propietario),
                                                                                                FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
                                                                                                    FOREIGN KEY (id_propietario) REFERENCES Propietario(id_propietario)
                                                                                                    );

                                                                                                    VALUES (1, 'Max', 'Perro', 'Golden Retriever', 3, 25.50);
                                                                                                    INSERT INTO Mascota VALUES (2, 'Luna', 'Gato', 'Siamés', 2, 4.20);
                                                                                                    INSERT INTO Mascota VALUES (3, 'Rocky', 'Perro', 'Bulldog', 5, 18.75);

                                                                                                    INSERT INTO Propietario VALUES (1, 'María González', '3001234567', 'maria@email.com');
                                                                                                    INSERT INTO Propietario VALUES (2, 'Carlos López', '3109876543', 'carlos@email.com');

                                                                                                    INSERT INTO Veterinario VALUES (1, 'Dr. Ana Rodríguez', 'Medicina General');
                                                                                                    INSERT INTO Veterinario VALUES (2, 'Dr. Luis Martín', 'Cirugía');

                                                                                                    INSERT INTO Consulta VALUES (1, 1, 1, '2025-06-20', 'Vacunación anual');
                                                                                                    INSERT INTO Consulta VALUES (2, 2, 1, '2025-06-21', 'Control de peso');

                                                                                                    INSERT INTO Mascota_Propietario VALUES (1, 1);
                                                                                                    INSERT INTO Mascota_Propietario VALUES (2, 2);
                                                                                                    INSERT INTO Mascota_Propietario VALUES (3, 1);


                                                                                                    SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Mascota;
                                                                                                    SELECT nombre FROM Mascota WHERE nombre LIKE '%a';
                                                                                                    SELECT UPPER(nombre) AS nombre_mayuscula FROM Mascota;
                                                                                                    SELECT LOWER(especie) AS especie_minuscula FROM Mascota;
                                                                                                    SELECT CONCAT(nombre, ' es un ', especie) AS descripcion FROM Mascota;
                                                                                                    SELECT REPLACE(raza, 'Golden', 'Dorado') FROM Mascota;
                                                                                                    SELECT LEFT(nombre, 3) AS primeras_letras FROM Mascota;

                                                                                                     RegistrarConsulta (
                                                                                                         IN p_id_consulta INT,
                                                                                                             IN p_id_mascota INT,
                                                                                                                 IN p_id_veterinario INT,
                                                                                                                     IN p_fecha DATE,
                                                                                                                         IN p_motivo VARCHAR(100)
                                                                                                                         )
                                                                                                                         BEGIN
                                                                                                                             INSERT INTO Consulta (id_consulta, id_mascota, id_veterinario, fecha, motivo)
                                                                                                                                 VALUES (p_id_consulta, p_id_mascota, p_id_veterinario, p_fecha, p_motivo);
                                                                                                                                 END //
                                                                                                                                 DELIMITER ;

                                                                                                                                 (3, 3, 2, '2025-06-25', 'Revisión general');

                                                                                                                                  = 26.00 WHERE id_mascota = 1;
                                                                                                                                  UPDATE Veterinario SET especialidad = 'Dermatología' WHERE id_veterinario = 2;
                                                                                                                                  UPDATE Propietario SET telefono = '3201234567' WHERE id_propietario = 1;

                                                                                                                                  WHERE id_consulta = 3;
                                                                                                                                  DELETE FROM Mascota_Propietario WHERE id_mascota = 3;
                                                                                                                                  DELETE FROM Mascota WHERE id_mascota = 3;

                                                                                                                                  ALTER TABLE Mascota ADD color VARCHAR(20);
                                                                                                                                  ALTER TABLE Propietario ADD direccion VARCHAR(100);
                                                                                                                                  ALTER TABLE Veterinario ADD telefono VARCHAR(15);
                                                                                                                                  ALTER TABLE Consulta ADD precio DECIMAL(8,2);


                                                                                                                                  SELECT nombre FROM Propietario 
                                                                                                                                  WHERE id_propietario = (
                                                                                                                                      SELECT mp.id_propietario 
                                                                                                                                          FROM Mascota_Propietario mp 
                                                                                                                                              JOIN Mascota m ON mp.id_mascota = m.id_mascota
                                                                                                                                                  ORDER BY m.peso DESC 
                                                                                                                                                      LIMIT 1
                                                                                                                                                      );


                                                                                                                                                      SELECT nombre FROM Veterinario 
                                                                                                                                                      WHERE id_veterinario = (
                                                                                                                                                          SELECT id_veterinario 
                                                                                                                                                              FROM Consulta 
                                                                                                                                                                  GROUP BY id_veterinario 
                                                                                                                                                                      ORDER BY COUNT(*) DESC 
                                                                                                                                                                          LIMIT 1
                                                                                                                                                                          );


                                                                                                                                                                          TRUNCATE TABLE Consulta;
                                                                                                                                                                          TRUNCATE TABLE Mascota_Propietario;
                                                                                                                                                                          DROP TABLE IF EXISTS Consulta;
                                                                                                                                                                          DROP TABLE IF EXISTS Mascota_Propietario;
                                                                                                                                                                          DROP PROCEDURE IF EXISTS RegistrarConsulta;
                                                                                                                                                                          DROP TABLE Veterinario;
                                                                                                                                                                          DROP TABLE Mascota;
                                                                                                                                                                          DROP TABLE Propietario;
                                                                                                                                                                          DROP DATABASE VETERINARIA;
                                                                                                                                                                          