
-- CONSULTAS DEBER
-- Una condición de igualdad aplicada a un atributo de tipo entero
SELECT * FROM medicos WHERE id = 5;

-- Una condición de igualdad aplicada a un atributo de tipo cadena de caracteres
SELECT * FROM pacientes WHERE nombre = 'Ana Pérez';

-- Condición de mayor igual que aplicada a un atributo de tipo decimal
SELECT * FROM facturas WHERE total >= 50.00;

-- Condición de distinto aplicada a un atributo de tipo cadena de caracteres
SELECT * FROM pacientes WHERE correo NOT LIKE '%@gmail.com';

-- Condición de pertenencia a una lista de valores (IN) aplicada a un atributo de tipo cadena
SELECT * FROM medicos WHERE especialidad IN ('Cardiología', 'Pediatría', 'Ginecología');

-- Dos condiciones a su elección, unidas con AND
SELECT * FROM citas 
WHERE estado = 'Atendida' AND fecha < '2025-01-20';

-- Dos condiciones similares a la anterior, proyecta en tres columnas y crea una vista
SELECT
    cedula_paciente,
    id_medico,
    fecha
FROM citas
WHERE estado = 'Atendida'
  AND fecha >= '2025-01-01';

-- Dos condiciones a su elección, unidas con OR
SELECT * FROM citas 
WHERE estado = 'Cancelada' OR estado = 'Atendida';

-- Una condición a su elección y el operador NOT
SELECT * FROM citas 
WHERE NOT estado = 'Agendada';

-- Operación JOIN con dos tablas relacionadas por FK
SELECT citas.*, pacientes.*
FROM citas
JOIN pacientes ON citas.cedula_paciente = pacientes.cedula;

-- JOIN como la anterior, proyecta en tres columnas y crea una vista
SELECT
    citas.id,
    citas.fecha,
    citas.estado,
    pacientes.cedula,
    pacientes.nombre
FROM citas
JOIN pacientes
    ON citas.cedula_paciente = pacientes.cedula;


-- La operación LEFT JOIN en base de dos tablas que dispongan de la restricción de clave foránea
SELECT pacientes.cedula, pacientes.nombre, citas.id, citas.fecha
FROM pacientes
LEFT JOIN citas ON pacientes.cedula = citas.cedula_paciente;

-- La operación RIGHT JOIN en base de dos tablas que dispongan de la restricción de clave foránea
SELECT citas.id, citas.fecha, citas.estado, pacientes.nombre
FROM citas
RIGHT JOIN pacientes ON citas.cedula_paciente = pacientes.cedula;

-- La operación LEFT JOIN en base de una tabla que disponga de una auto-referencia
SELECT citas.id, citas.fecha, citas.estado, historial_citas.accion, historial_citas.estado_nuevo
FROM citas
LEFT JOIN historial_citas 
ON citas.id = historial_citas.id_cita 
AND citas.cedula_paciente = historial_citas.cedula_paciente 
AND citas.id_medico = historial_citas.id_medico;

-- Un ordenamiento sobre un atributo de forma descendente
SELECT * 
FROM facturas 
ORDER BY total DESC;

-- Un ordenamiento sobre dos atributos, el primero ascendente y el segundo descendente
SELECT * 
FROM citas 
ORDER BY fecha ASC, hora DESC;

-- Un agrupamiento sobre un atributo que no posee una restricción de unicidad y una operación de conteo
SELECT estado, COUNT(*) AS cantidad_citas
FROM citas
GROUP BY estado;

-- Una proyección con tres columnas, una de ellas calculada, con operadores matemáticos
SELECT facturanumero, cantidad, precio, 
       cantidad * precio AS subtotal
FROM facturadetalle;

-- Una proyección con tres columnas, una de ellas calculada, con concatenación de caracteres
SELECT cedula, nombre, 
       CONCAT(nombre, ' (Cédula: ', cedula, ')') AS informacion_paciente
FROM pacientes;

-- Una proyección con tres columnas similar a la anterior y crea una vista para contenerla
SELECT
    cedula,
    nombre,
    CONCAT('Paciente: ', nombre, ' - Dirección: ', direccion) AS datos_completos
FROM pacientes;

-- Una subconsulta que retorne un valor, basada en una restricción de clave foránea
SELECT nombre
FROM pacientes
WHERE cedula = (
    SELECT cedula_paciente 
    FROM facturas 
    WHERE facturanumero = '0000000002'
);