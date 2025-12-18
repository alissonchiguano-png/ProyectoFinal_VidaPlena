
-- CREAR BASE DE DATOS
CREATE DATABASE vidaplena;
-- usar la base de datos
USE vidaplena;


-- TABLA 1: pacientes
-- PK: cedula (identifica de forma única al paciente)

CREATE TABLE pacientes (
    cedula CHAR(10),
    nombre VARCHAR(100) NOT NULL,
    fechanacimiento DATE,
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(150)
);

-- validacion de clave primaria  para la cedula
ALTER TABLE pacientes
ADD PRIMARY KEY (cedula);

-- Validacion para ver que la cedula tenga exactamente 10 digitos
ALTER TABLE pacientes
ADD CONSTRAINT pacientes_cedula_ck CHECK (cedula REGEXP '^[0-9]{10}$');
-- validacion de check para ver que el telefono tiene 10 digitos 
ALTER TABLE pacientes
ADD CONSTRAINT pacientes_telefono_ck CHECK (telefono REGEXP '^[0-9]{10}$');
-- validacion de que el correo tiene que contener un @
ALTER TABLE pacientes
ADD CONSTRAINT pacientes_correo_ck CHECK (correo LIKE '%@%.%');

-- Inserts pacientes
INSERT INTO pacientes VALUES ('0102030401', 'Ana Pérez', '1995-06-12', '0987654321', 'ana@gmail.com', 'Av. Central');
INSERT INTO pacientes VALUES ('0102030402', 'Luis Gómez', '1988-02-20', '0991122334', 'luis@hotmail.com', 'Calle Sucre');
INSERT INTO pacientes VALUES ('0102030403', 'María Torres', '2000-11-05', '0974455667', 'maria@gmail.com', 'Barrio Norte');
INSERT INTO pacientes VALUES ('0102030404', 'Carlos Ramírez', '1992-09-18', '0981234567', 'carlos.ramirez@yahoo.com', 'Av. Amazonas');
INSERT INTO pacientes VALUES ('0102030405', 'Sofía Mendoza', '1985-03-30', '0998765432', 'sofia.mendoza@gmail.com', 'Calle Maldonado');
INSERT INTO pacientes VALUES ('0102030406', 'Diego Herrera', '1979-12-01', '0965432109', 'diego.herrera@outlook.com', 'Sector La Carolina');
INSERT INTO pacientes VALUES ('0102030407', 'Laura Fernández', '2003-07-22', '0988877665', 'laura.fernandez@gmail.com', 'Urbanización El Bosque');
INSERT INTO pacientes VALUES ('0102030408', 'José Vargas', '1990-04-15', '0993344556', 'jose.vargas@hotmail.com', 'Calle Bolívar');
INSERT INTO pacientes VALUES ('0102030409', 'Patricia Ortiz', '1982-10-08', '0976655443', 'patricia.ortiz@gmail.com', 'Av. 10 de Agosto');
INSERT INTO pacientes VALUES ('0102030410', 'Andrés Castillo', '1998-01-25', '0985566778', 'andres.castillo@yahoo.com', 'Barrio Sur');


-- TABLA 2: medicos
-- PK: id (identifica al médico)

CREATE TABLE medicos (
    id INT,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    consultorio VARCHAR(50),
    horario VARCHAR(50)
);

-- validacion de clave primaria para id
ALTER TABLE medicos
ADD PRIMARY KEY (id);

-- validacion de UNIQUE para verificar que un medico no puede tener la misma especialidad que otro
ALTER TABLE medicos
ADD CONSTRAINT medicos_nombre_especialidad_uk UNIQUE (nombre, especialidad);

-- Inserts medicos
INSERT INTO medicos VALUES (1, 'Dr. Carlos Ruiz', 'Medicina General', 'Consultorio 1', '08:00-12:00');
INSERT INTO medicos VALUES (2, 'Dra. Elena López', 'Cardiología', 'Consultorio 3', '09:00-13:00');
INSERT INTO medicos VALUES (3, 'Dr. Juan Andrade', 'Pediatría', 'Consultorio 2', '14:00-18:00');
INSERT INTO medicos VALUES (4, 'Dra. Patricia Morales', 'Dermatología', 'Consultorio 4', '10:00-14:00');
INSERT INTO medicos VALUES (5, 'Dr. Roberto Sánchez', 'Traumatología', 'Consultorio 5', '07:30-11:30');
INSERT INTO medicos VALUES (6, 'Dra. Isabel Vargas', 'Ginecología', 'Consultorio 6', '15:00-19:00');
INSERT INTO medicos VALUES (7, 'Dr. Miguel Torres', 'Oftalmología', 'Consultorio 7', '08:30-12:30');
INSERT INTO medicos VALUES (8, 'Dra. Laura Castillo', 'Neurología', 'Consultorio 8', '13:00-17:00');
INSERT INTO medicos VALUES (9, 'Dr. Andrés Herrera', 'Odontología', 'Consultorio 9', '09:00-13:00');
INSERT INTO medicos VALUES (10, 'Dra. Sofia Ramírez', 'Endocrinología', 'Consultorio 10', '14:00-18:00');


-- TABLA 3: citas
-- PK compuesta (id, cedula_paciente, id_medico)

CREATE TABLE citas (
    id INT,
    cedula_paciente CHAR(10),
    id_medico INT,
    fecha DATE,
    hora TIME,
    motivo VARCHAR(200),
    estado VARCHAR(50)
);

-- Primary Key compuesta
ALTER TABLE citas
ADD PRIMARY KEY (id, cedula_paciente, id_medico);

-- validacion de clave foranea para verificar qye la cedula del paciente exista en la tabla de pacientes
ALTER TABLE citas
ADD CONSTRAINT citas_paciente_fk
FOREIGN KEY (cedula_paciente) REFERENCES pacientes(cedula);

-- validacion de clave foranea para Verificar que el id del médico exista en la tabla medicos
ALTER TABLE citas
ADD CONSTRAINT citas_medico_fk
FOREIGN KEY (id_medico) REFERENCES medicos(id);

-- Inserts citas
INSERT INTO citas VALUES (1, '0102030401', 1, '2025-01-15', '08:00:00', 'Consulta general', 'Agendada');
INSERT INTO citas VALUES (2, '0102030402', 2, '2025-01-16', '09:00:00', 'Chequeo cardiaco', 'Agendada');
INSERT INTO citas VALUES (3, '0102030403', 3, '2025-01-17', '14:00:00', 'Control pediátrico', 'Atendida');
INSERT INTO citas VALUES (4, '0102030404', 4, '2025-01-20', '10:30:00', 'Revisión dermatológica', 'Agendada');
INSERT INTO citas VALUES (5, '0102030405', 5, '2025-01-21', '08:00:00', 'Control de fractura', 'Atendida');
INSERT INTO citas VALUES (6, '0102030406', 6, '2025-01-22', '15:30:00', 'Consulta ginecológica anual', 'Agendada');
INSERT INTO citas VALUES (7, '0102030407', 7, '2025-01-23', '09:00:00', 'Examen de vista', 'Atendida');
INSERT INTO citas VALUES (8, '0102030408', 8, '2025-01-24', '14:00:00', 'Evaluación neurológica', 'Agendada');
INSERT INTO citas VALUES (9, '0102030409', 9, '2025-01-27', '10:00:00', 'Limpieza dental', 'Cancelada');
INSERT INTO citas VALUES (10, '0102030410', 10, '2025-01-28', '15:00:00', 'Control endocrino', 'Agendada');


-- TABLA 4: expedientes_clinicos
-- PK compuesta (id, cedula_paciente, id_medico)

CREATE TABLE expedientes_clinicos (
    id INT,
    cedula_paciente CHAR(10),
    id_medico INT,
    fecha_consulta DATE,
    diagnostico TEXT,
    tratamiento TEXT,
    receta TEXT,
    observaciones TEXT
);

-- Primary Key compuesta
ALTER TABLE expedientes_clinicos
ADD PRIMARY KEY (id, cedula_paciente, id_medico);

-- validacion de clave foranea para verificar qye la cedula del paciente exista en la tabla de pacientes
ALTER TABLE expedientes_clinicos
ADD CONSTRAINT expedientes_paciente_fk
FOREIGN KEY (cedula_paciente) REFERENCES pacientes(cedula);

-- validacion de clave foranea para verifica que el médico exista
ALTER TABLE expedientes_clinicos
ADD CONSTRAINT expedientes_medico_fk
FOREIGN KEY (id_medico) REFERENCES medicos(id);

-- Inserts expedientes
INSERT INTO expedientes_clinicos VALUES (1, '0102030401', 1, '2025-01-15', 'Resfriado común', 'Reposo y hidratación', 'Paracetamol 500mg cada 8 horas', 'Control en 7 días si no mejora');
INSERT INTO expedientes_clinicos VALUES (2, '0102030402', 2, '2025-01-16', 'Hipertensión arterial', 'Dieta baja en sal y ejercicio', 'Losartán 50mg diario', 'Seguimiento mensual y control de presión');
INSERT INTO expedientes_clinicos VALUES (3, '0102030403', 3, '2025-01-17', 'Gripe estacional', 'Reposo absoluto', 'Ibuprofeno 400mg y antigripal', 'Mejoría leve, control en 5 días');
INSERT INTO expedientes_clinicos VALUES (4, '0102030404', 4, '2025-01-20', 'Dermatitis atópica', 'Evitar alérgenos', 'Crema con hidrocortisona', 'Aplicar 2 veces al día, revisión en 15 días');
INSERT INTO expedientes_clinicos VALUES (5, '0102030405', 5, '2025-01-21', 'Esguince de tobillo grado II', 'Inmovilización y hielo', 'Antiinflamatorios y reposo', 'Rehabilitación en 2 semanas');
INSERT INTO expedientes_clinicos VALUES (6, '0102030406', 6, '2025-01-22', 'Control ginecológico anual normal', 'Mantener hábitos saludables', 'Ninguno', 'Próximo control en 1 año');
INSERT INTO expedientes_clinicos VALUES (7, '0102030407', 7, '2025-01-23', 'Miopía progresiva', 'Uso de lentes correctivos', 'Lentes graduados nuevos', 'Control en 6 meses');
INSERT INTO expedientes_clinicos VALUES (8, '0102030408', 8, '2025-01-24', 'Migraña crónica', 'Evitar desencadenantes', 'Sumatriptán según necesidad', 'Estudio adicional recomendado');
INSERT INTO expedientes_clinicos VALUES (9, '0102030409', 9, '2025-01-27', 'Caries dental múltiple', 'Tratamiento odontológico', 'Obturaciones y profilaxis', 'Continuar tratamiento en próxima visita');
INSERT INTO expedientes_clinicos VALUES (10, '0102030410', 10, '2025-01-28', 'Hipotiroidismo', 'Tratamiento hormonal', 'Levotiroxina 50mcg diario', 'Control hormonal en 6 semanas');

-- TABLA 5: historial_citas
-- PK compuesta (id_historial, id_cita)

CREATE TABLE historial_citas (
    id_historial INT,
    id_cita INT,
    cedula_paciente CHAR(10),
    id_medico INT,
    fecha_cambio DATETIME,
    accion VARCHAR(50),
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    usuario_modificacion VARCHAR(100)
);

-- PK compuesta 
ALTER TABLE historial_citas
ADD PRIMARY KEY (id_historial, id_cita, cedula_paciente, id_medico);

-- validacion de clave foranea que Verifica que la combinación (id_cita, cedula_paciente, id_medico) exista en la tabla citasALTER TABLE historial_citas
ALTER TABLE historial_citas
ADD CONSTRAINT historial_cita_fk
FOREIGN KEY (id_cita, cedula_paciente, id_medico)
REFERENCES citas(id, cedula_paciente, id_medico);


-- Inserts historial
INSERT INTO historial_citas VALUES (1, 1, '0102030401', 1, '2025-12-25 16:15:25', 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (2, 2, '0102030402', 2, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (3, 3, '0102030403', 3, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Juan Andrade');
INSERT INTO historial_citas VALUES (4, 4, '0102030404', 4, '2025-12-10 09:45:00', 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (5, 5, '0102030405', 5, '2025-12-12 11:20:30', 'Atención', 'Agendada', 'Atendida', 'Dr. Roberto Sánchez');
INSERT INTO historial_citas VALUES (6, 6, '0102030406', 6, '2025-12-15 14:00:00', 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (7, 9, '0102030409', 9, '2025-12-16 10:30:00', 'Cancelación', 'Agendada', 'Cancelada', 'Sistema');
INSERT INTO historial_citas VALUES (8, 7, '0102030407', 7, '2025-12-17 09:15:45', 'Atención', 'Agendada', 'Atendida', 'Dr. Miguel Torres');
INSERT INTO historial_citas VALUES (9, 8, '0102030408', 8, '2025-12-17 13:50:00', 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (10, 10, '0102030410', 10, '2025-12-17 15:20:10', 'Creación', NULL, 'Agendada', 'Sistema');


SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM citas;
SELECT * FROM expedientes_clinicos;
SELECT * FROM historial_citas;

