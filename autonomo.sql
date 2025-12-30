-- crear la tabla de empleados 
CREATE TABLE empleados (
    cedula INT,
    nombre VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    cedula_jefe INT
);
ALTER TABLE empleados
ADD PRIMARY KEY (cedula);
ALTER TABLE empleados
ADD CONSTRAINT empleados_jefe_fk
FOREIGN KEY (cedula_jefe)
REFERENCES empleados(cedula);

-- Jefes principales
INSERT INTO empleados VALUES (7777777, 'Ana', 'Dirección General', NULL);
INSERT INTO empleados VALUES (5555555, 'Susana', 'Ventas', 7777777);
INSERT INTO empleados VALUES (4444444, 'Marco', 'Contabilidad', 7777777);

-- Empleados con jefe
INSERT INTO empleados VALUES (1111111, 'Juan', 'Ventas', 5555555);
INSERT INTO empleados VALUES (3333333, 'María', 'Contabilidad', 4444444);
INSERT INTO empleados VALUES (6666666, 'Marcelo', 'Ventas', 5555555);

-- Empleado sin jefe
INSERT INTO empleados VALUES (2222222, 'Pedro', 'Almacenes', NULL);
SELECT 
    e.cedula,
    e.nombre,
    e.departamento,
    j.nombre AS jefe
FROM empleados e
LEFT JOIN empleados j
    ON e.cedula_jefe = j.cedula
ORDER BY e.cedula;