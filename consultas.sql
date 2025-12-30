
-- CONSULTAS DEBER
-- Una condición de igualdad aplicada a un atributo de tipo entero
SELECT * FROM medicos WHERE id = 5;

-- Una condición de igualdad aplicada a un atributo de tipo cadena de caracteres
SELECT * FROM pacientes WHERE nombre = 'Ana Pérez';

-- Condición de mayor igual que aplicada a un atributo de tipo decimal
SELECT
    id_pago,
    id_cita,
    cedula_paciente,
    monto
FROM pagos
WHERE monto >= 40.00;

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
SELECT
    id,
    cedula_paciente,
    id_medico,
    fecha,
    estado
FROM citas
ORDER BY fecha DESC;


-- Un ordenamiento sobre dos atributos, el primero ascendente y el segundo descendente
SELECT * 
FROM citas 
ORDER BY fecha ASC, hora DESC;

-- Un agrupamiento sobre un atributo que no posee una restricción de unicidad y una operación de conteo
SELECT estado, COUNT(*) AS cantidad_citas
FROM citas
GROUP BY estado;

-- Una proyección con tres columnas, una de ellas calculada, con operadores matemáticos
SELECT
    id_pago,
    monto,
    monto * 0.12 AS iva
FROM pagos;


-- Una proyección con tres columnas, una de ellas calculada, con concatenación de caracteres y el uso de la función CONCAT
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
-- obtener el nombre del médico de una cita específica
SELECT
    nombre
FROM medicos
WHERE id = (
    SELECT id_medico
    FROM citas
    WHERE id = 1
);

-- proyecto f
-- Consulta con atributo tipo fecha + campo calculado usando CURDATE()
-- la edad de los pacientes calculada a partir de la fecha de nacimiento.
SELECT
    cedula,
    nombre,
    fechanacimiento,
    TIMESTAMPDIFF(YEAR, fechanacimiento, CURDATE()) AS edad
FROM pacientes;

-- Consulta con atributo tipo fecha usando BETWEEN
-- Citas agendadas en un rango de fechas.
SELECT
    id,
    cedula_paciente,
    fecha,
    estado
FROM citas
WHERE fecha BETWEEN '2025-01-15' AND '2025-01-22';

-- Consulta que use IS NULL y IS NOT NULL
-- los cambios donde la cita no tenía un estado anterior, porque recién fue creada (de null)
SELECT
    id_historial,
    id_cita,
    accion,
    estado_anterior,
    estado_nuevo
FROM historial_citas
WHERE estado_anterior IS NULL;

-- se muestra los cambios donde la cita ya tenía un estado previo y luego fue modificada. (agendada-cancelada)
SELECT
    id_historial,
    id_cita,
    accion,
    estado_anterior,
    estado_nuevo
FROM historial_citas
WHERE estado_anterior IS NOT NULL;

-- Consulta con DISTINCT sobre datos repetidos
-- Médicos que realmente tienen citas, sin repetir médicos
SELECT DISTINCT
    m.id,
    m.nombre,
    m.especialidad
FROM citas c
JOIN medicos m ON c.id_medico = m.id;

-- Consulta con CASE WHEN THEN ELSE END
SELECT
    id,
    cedula_paciente,
    fecha,
    estado,
    CASE
        WHEN estado = 'Agendada' THEN 'Pendiente de atención'
        WHEN estado = 'Atendida' THEN 'Consulta realizada'
        WHEN estado = 'Cancelada' THEN 'Consulta cancelada'
        ELSE 'Estado desconocido'
    END AS descripcion_estado
FROM citas;

-- Consulta con UNION entre dos consultas similares
-- Citas Agendadas y Atendidas en una sola lista.
SELECT
    id,
    cedula_paciente,
    fecha,
    estado
FROM citas
WHERE estado = 'Agendada'

UNION

SELECT
    id,
    cedula_paciente,
    fecha,
    estado
FROM citas
WHERE estado = 'Atendida';

-- Consulta con EXISTS y subconsulta
-- Pacientes que sí tienen citas registradas.
SELECT
    cedula,
    nombre
FROM pacientes p
WHERE EXISTS (
    SELECT 1
    FROM citas c
    WHERE c.cedula_paciente = p.cedula
);


