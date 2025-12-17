-- Crear la base de datos
CREATE DATABASE vidaplena;

-- Seleccionar la base de datos
USE vidaplena;

-- TABLA 1: pacientes
-- 1. Crear tabla
CREATE TABLE pacientes (
    cedula CHAR(10),
    nombre VARCHAR(100),
    fechanacimiento DATE,
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(150)
);

-- 3. ALTER TABLE para pacientes
ALTER TABLE pacientes
ADD PRIMARY KEY (cedula);

ALTER TABLE pacientes
MODIFY COLUMN nombre VARCHAR(100) NOT NULL;

ALTER TABLE pacientes
ADD CONSTRAINT pacientes_cedula_ck
CHECK (cedula REGEXP '^[0-9]{10}$');  -- Solo 10 dígitos numéricos

ALTER TABLE pacientes
ADD CONSTRAINT pacientes_telefono_ck
CHECK (telefono REGEXP '^[0-9]{10}$');  -- Teléfono ecuatoriano típico: 10 dígitos

ALTER TABLE pacientes
ADD CONSTRAINT pacientes_correo_ck
CHECK (correo LIKE '%@%.%');  -- Validación básica de correo

-- 4. INSERTS correctos de pacientes
INSERT INTO pacientes VALUES ('0102030401', 'Ana Pérez', '1995-06-12', '0987654321', 'ana.perez@gmail.com', 'Av. Central');
INSERT INTO pacientes VALUES ('0102030402', 'Luis Gómez', '1988-02-20', '0991122334', 'luis.gomez@hotmail.com', 'Calle Sucre');
INSERT INTO pacientes VALUES ('0102030403', 'María Torres', '2000-11-05', '0974455667', 'maria.t@gmail.com', 'Barrio Norte');
INSERT INTO pacientes VALUES ('0102030404', 'Carlos Molina', '1992-01-18', '0983344556', 'carlos.m@gmail.com', 'Cdla. Kennedy');
INSERT INTO pacientes VALUES ('0102030405', 'Sofía Andrade', '1998-07-30', '0967788990', 'sofia.a@gmail.com', 'Av. Quito');
INSERT INTO pacientes VALUES ('0102030406', 'José Castillo', '1985-03-14', '0956677889', 'jose.c@hotmail.com', 'Los Álamos');
INSERT INTO pacientes VALUES ('0102030407', 'Paola Rivas', '1999-09-22', '0945566778', 'paola.r@gmail.com', 'La Floresta');
INSERT INTO pacientes VALUES ('0102030408', 'Miguel Vera', '1979-12-01', '0934455667', 'miguel.v@gmail.com', 'Urdesa');
INSERT INTO pacientes VALUES ('0102030409', 'Andrea López', '1993-05-09', '0923344556', 'andrea.l@gmail.com', 'Cdla. España');
INSERT INTO pacientes VALUES ('0102030410', 'Fernando Cruz', '1987-08-17', '0912233445', 'fernando.c@gmail.com', 'Mapasingue');


-- TABLA 2: medicos
-- 1. Crear tabla
CREATE TABLE medicos (
    id INT,
    nombre VARCHAR(100),
    especialidad VARCHAR(100),
    consultorio VARCHAR(50),
    horario VARCHAR(50)
);

-- 3. ALTER TABLE para medicos
ALTER TABLE medicos
ADD PRIMARY KEY (id);

ALTER TABLE medicos
MODIFY COLUMN nombre VARCHAR(100) NOT NULL;

ALTER TABLE medicos
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE medicos
ADD CONSTRAINT medicos_nombre_especialidad_uk
UNIQUE (nombre, especialidad);


-- 4. INSERTS correctos de médicos (sin especificar ID si usas AUTO_INCREMENT, pero para coincidir con datos, especificamos)
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (1, 'Dr. Carlos Ruiz', 'Medicina General', 'Consultorio 1', '08:00-12:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (2, 'Dra. Elena López', 'Cardiología', 'Consultorio 3', '09:00-13:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (3, 'Dr. Juan Andrade', 'Pediatría', 'Consultorio 2', '14:00-18:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (4, 'Dra. Paula Sánchez', 'Ginecología', 'Consultorio 4', '08:00-12:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (5, 'Dr. Marco León', 'Traumatología', 'Consultorio 5', '10:00-14:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (6, 'Dra. Diana Ortiz', 'Dermatología', 'Consultorio 6', '09:00-13:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (7, 'Dr. Andrés Paredes', 'Neurología', 'Consultorio 7', '15:00-19:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (8, 'Dra. Verónica Peña', 'Endocrinología', 'Consultorio 8', '08:00-12:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (9, 'Dr. Pablo Herrera', 'Oftalmología', 'Consultorio 9', '14:00-18:00');
INSERT INTO medicos (id, nombre, especialidad, consultorio, horario) VALUES (10, 'Dra. Lucía Méndez', 'Medicina Interna', 'Consultorio 10', '09:00-13:00');


-- TABLA 3: citas
-- 1. Crear tabla
CREATE TABLE citas (
    id INT,
    fecha DATE,
    hora TIME,
    cedula_paciente CHAR(10),
    id_medico INT,
    motivo VARCHAR(200),
    estado VARCHAR(50) DEFAULT 'Agendada'  -- Valor por defecto: Agendada
);

-- 3. ALTER TABLE para citas
ALTER TABLE citas
ADD PRIMARY KEY (id);

ALTER TABLE citas
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE citas
MODIFY COLUMN motivo VARCHAR(200) NOT NULL;

ALTER TABLE citas
ADD CONSTRAINT citas_paciente_fk
FOREIGN KEY (cedula_paciente) REFERENCES pacientes(cedula);

ALTER TABLE citas
ADD CONSTRAINT citas_medico_fk
FOREIGN KEY (id_medico) REFERENCES medicos(id);

-- Restricción para evitar conflictos de horario (misma fecha, hora y médico)
ALTER TABLE citas
ADD CONSTRAINT citas_unique_horario
UNIQUE (fecha, hora, id_medico);

-- Check para estados permitidos
ALTER TABLE citas
ADD CONSTRAINT citas_estado_ck
CHECK (estado IN ('Agendada', 'Atendida', 'Cancelada'));

-- Check para hora válida (ejemplo: entre 08:00 y 19:00)
ALTER TABLE citas
ADD CONSTRAINT citas_hora_ck
CHECK (hora BETWEEN '08:00:00' AND '19:00:00');

-- 4. INSERTS correctos de citas
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (1, '2025-01-15', '08:00:00', '0102030401', 1, 'Consulta general', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (2, '2025-01-15', '09:00:00', '0102030402', 2, 'Chequeo cardiaco', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (3, '2025-01-15', '10:00:00', '0102030403', 3, 'Control pediátrico', 'Atendida');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (4, '2025-01-16', '08:00:00', '0102030404', 4, 'Control ginecológico', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (5, '2025-01-16', '09:00:00', '0102030405', 5, 'Dolor de rodilla', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (6, '2025-01-16', '10:00:00', '0102030406', 6, 'Alergia en la piel', 'Cancelada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (7, '2025-01-17', '15:00:00', '0102030407', 7, 'Dolor de cabeza', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (8, '2025-01-17', '08:00:00', '0102030408', 8, 'Control hormonal', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (9, '2025-01-17', '14:00:00', '0102030409', 9, 'Revisión visual', 'Atendida');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (10, '2025-01-18', '09:00:00', '0102030410', 10, 'Chequeo general', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (11, '2025-01-18', '10:00:00', '0102030401', 1, 'Fiebre', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (12, '2025-01-18', '11:00:00', '0102030402', 2, 'Hipertensión', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (13, '2025-01-19', '08:00:00', '0102030403', 3, 'Vacunación', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (14, '2025-01-19', '09:00:00', '0102030404', 4, 'Consulta prenatal', 'Agendada');
INSERT INTO citas (id, fecha, hora, cedula_paciente, id_medico, motivo, estado) VALUES (15, '2025-01-19', '10:00:00', '0102030405', 5, 'Dolor lumbar', 'Agendada');

CREATE TABLE expedientes_clinicos (
    id INT,
    cedula_paciente CHAR(10),
    fecha_consulta DATE,
    id_medico INT,
    diagnostico TEXT,
    tratamiento TEXT,
    receta TEXT,
    observaciones TEXT
);

-- 3. ALTER TABLE para expedientes_clinicos
ALTER TABLE expedientes_clinicos
ADD PRIMARY KEY (id);

ALTER TABLE expedientes_clinicos
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE expedientes_clinicos
MODIFY COLUMN cedula_paciente CHAR(10) NOT NULL;

ALTER TABLE expedientes_clinicos
MODIFY COLUMN fecha_consulta DATE NOT NULL;

ALTER TABLE expedientes_clinicos
ADD CONSTRAINT expedientes_paciente_fk
FOREIGN KEY (cedula_paciente) REFERENCES pacientes(cedula);

ALTER TABLE expedientes_clinicos
ADD CONSTRAINT expedientes_medico_fk
FOREIGN KEY (id_medico) REFERENCES medicos(id);

-- Índice para búsquedas rápidas por paciente
ALTER TABLE expedientes_clinicos
ADD INDEX idx_cedula (cedula_paciente);

-- 4. INSERTS de ejemplo (basados en algunas citas atendidas)
INSERT INTO expedientes_clinicos (cedula_paciente, fecha_consulta, id_medico, diagnostico, tratamiento, receta, observaciones)
VALUES ('0102030403', '2025-01-15', 3, 'Resfriado común', 'Reposo y líquidos', 'Paracetamol 500mg cada 8 horas', 'Control en 1 semana si no mejora');

INSERT INTO expedientes_clinicos (cedula_paciente, fecha_consulta, id_medico, diagnostico, tratamiento, receta, observaciones)
VALUES ('0102030409', '2025-01-17', 9, 'Miopía leve', 'Uso de lentes', 'Lentes correctivos -2.00', 'Revisión anual');

INSERT INTO expedientes_clinicos (cedula_paciente, fecha_consulta, id_medico, diagnostico, tratamiento, receta, observaciones)
VALUES ('0102030401', '2025-01-18', 1, 'Fiebre viral', 'Hidratación y antitérmicos', 'Ibuprofeno 400mg si fiebre >38.5°C', 'Reposo 3 días');


-- TABLA 5: historial_citas
-- Para cumplir el requisito 7: Registrar reprogramaciones y cancelaciones de citas,
-- guardando un historial de cambios (auditoría de modificaciones en citas).

-- 1. Crear tabla
CREATE TABLE historial_citas (
    id_historial INT,
    id_cita INT,
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    accion VARCHAR(50),  -- 'Creación', 'Reprogramación', 'Cancelación', 'Atención'
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    usuario_modificacion VARCHAR(100)  -- Podría ser el nombre del usuario que realizó el cambio
);

-- 3. ALTER TABLE para historial_citas
ALTER TABLE historial_citas
ADD PRIMARY KEY (id_historial);

ALTER TABLE historial_citas
MODIFY id_historial INT AUTO_INCREMENT;

ALTER TABLE historial_citas
MODIFY COLUMN id_cita INT NOT NULL;

ALTER TABLE historial_citas
MODIFY COLUMN accion VARCHAR(50) NOT NULL;

ALTER TABLE historial_citas
ADD CONSTRAINT historial_cita_fk
FOREIGN KEY (id_cita) REFERENCES citas(id);

ALTER TABLE historial_citas
ADD CONSTRAINT historial_accion_ck
CHECK (accion IN ('Creación', 'Reprogramación', 'Cancelación', 'Atención', 'Modificación'));

-- 4. INSERTS de ejemplo (historial para algunas citas)
-- Ejemplo: creación automática al agendar
INSERT INTO historial_citas (id_cita, accion, estado_anterior, estado_nuevo, usuario_modificacion)
VALUES (1, 'Creación', NULL, 'Agendada', 'Sistema');

INSERT INTO historial_citas (id_cita, accion, estado_anterior, estado_nuevo, usuario_modificacion)
VALUES (6, 'Creación', NULL, 'Agendada', 'Sistema');

INSERT INTO historial_citas (id_cita, accion, estado_anterior, estado_nuevo, usuario_modificacion)
VALUES (6, 'Cancelación', 'Agendada', 'Cancelada', 'Recepcionista Ana');

INSERT INTO historial_citas (id_cita, accion, estado_anterior, estado_nuevo, usuario_modificacion)
VALUES (3, 'Atención', 'Agendada', 'Atendida', 'Dr. Juan Andrade');

INSERT INTO historial_citas (id_cita, accion, estado_anterior, estado_nuevo, usuario_modificacion)
VALUES (9, 'Atención', 'Agendada', 'Atendida', 'Dr. Pablo Herrera');

-- CONSULTAS DE VERIFICACIÓN (opcional, para probar)
SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM citas;

drop DATABASE vidaplena;