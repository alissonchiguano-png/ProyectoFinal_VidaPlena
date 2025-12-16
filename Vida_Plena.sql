
-- CREACIÓN DE LA BASE DE DATOS DE LA CLÍNICA VIDA PLENA
CREATE DATABASE vidaplena;
-- SELECCIONAR LA BASE DE DATOS
USE vidaplena;

-- TABLA PACIENTES 
CREATE TABLE pacientes (
    cedula CHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(150),
    fechanacimiento DATE,
    tipo CHAR(3)
);

-- INSERTAR PACIENTES
INSERT INTO pacientes VALUES ('1725698741', 'Maria López', '0984521347', 'Quito, La Floresta', '1998-03-15', 'NAT');
INSERT INTO pacientes VALUES ('1758963214', 'Carlos Paredes', '0987564213', 'Quito, Carcelén', '1985-07-10', 'NAT');
INSERT INTO pacientes VALUES ('1714596320', 'Ana Chimbo', '0998456210', 'Quito, Guamaní', '2000-11-25', 'NAT');
INSERT INTO pacientes VALUES ('1701245789', 'Jorge Sánchez', '0978451203', 'Quito, Calderón', '1976-08-02', 'NAT');
INSERT INTO pacientes VALUES ('1765239845', 'Empresa SegurosVida', '023456879', 'Quito, Centro Norte', '2005-01-01', 'JUR');

-- TABLA MEDICOS
CREATE TABLE medicos (
    idmedico INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50),
    telefono VARCHAR(20),
    horario VARCHAR(50)
);

-- INSERTAR MÉDICOS
INSERT INTO medicos VALUES (1, 'Dr. José Medina', 'Medicina General', '0987412365', '08:00 - 16:00');
INSERT INTO medicos VALUES (2, 'Dra. Andrea Torres', 'Pediatría', '0985642314', '09:00 - 17:00');
INSERT INTO medicos VALUES (3, 'Dr. Luis Chávez', 'Cardiología', '0989654781', '07:00 - 15:00');
INSERT INTO medicos VALUES (4, 'Dra. Patricia Mena', 'Ginecología', '0997564123', '10:00 - 18:00');
INSERT INTO medicos VALUES (5, 'Dr. Eduardo Viteri', 'Dermatología', '0982145631', '08:00 - 14:00');


-- TABLA CITAS
CREATE TABLE citas (
    idcita INT PRIMARY KEY,
    cedula CHAR(10),
    nombremedico VARCHAR(100),
    fecha DATE,
    hora TIME,
    motivo VARCHAR(150),
    estado VARCHAR(20)
);

-- INSERTAR CITAS 
INSERT INTO citas VALUES (1, '1725698741', 'Dr. José Medina', '2025-01-15', '09:30:00', 'Control general', 'Pendiente');
INSERT INTO citas VALUES (2, '1758963214', 'Dr. Luis Chávez', '2025-01-16', '11:00:00', 'Dolor en el pecho', 'Pendiente');
INSERT INTO citas VALUES (3, '1714596320', 'Dra. Andrea Torres', '2025-01-17', '14:00:00', 'Fiebre en niño', 'Atendida');
INSERT INTO citas VALUES (4, '1701245789', 'Dra. Patricia Mena', '2025-01-18', '16:30:00', 'Dolor abdominal', 'Cancelada');
INSERT INTO citas VALUES (5, '1765239845', 'Dr. José Medina', '2025-01-20', '10:15:00', 'Evaluación empresa', 'Pendiente');

-- Tabla de expedientes
CREATE TABLE expedientes (
    idexpediente INT PRIMARY KEY,
    cedula CHAR(10),
    nombremedico VARCHAR(100),
    fecha DATE,
    diagnostico VARCHAR(200),
    tratamiento VARCHAR(200),
    observaciones VARCHAR(300)
);

-- INSERTAR EXPEDIENTES
INSERT INTO expedientes VALUES (100, '1725698741', 'Dr. José Medina', '2025-01-15', 'Gripe viral', 'Paracetamol 500mg cada 8 horas', 'Paciente estable');
INSERT INTO expedientes VALUES (101, '1758963214', 'Dr. Luis Chávez', '2025-01-16', 'Arritmia leve', 'Reposo, evitar cafeína', 'Se recomienda electrocardiograma');
INSERT INTO expedientes VALUES (102, '1714596320', 'Dra. Andrea Torres', '2025-01-17', 'Infección respiratoria', 'Amoxicilina por 7 días', 'Niño responde bien al tratamiento');
INSERT INTO expedientes VALUES (103, '1701245789', 'Dra. Patricia Mena', '2025-01-18', 'Dolor abdominal no específico', 'Omeprazol por 5 días', 'Se canceló la cita, no asistió');
INSERT INTO expedientes VALUES (104, '1765239845', 'Dr. José Medina', '2025-01-20', 'Chequeo corporativo', 'Análisis completos', 'Pendiente entrega de resultados');

-- tabla de recetas
CREATE TABLE recetas (
    idreceta INT PRIMARY KEY,
    idexpediente INT,
    medicamento VARCHAR(100),
    dosis VARCHAR(100),
    duracion VARCHAR(50)
);

-- INSERTAR RECETAS
INSERT INTO recetas VALUES (1, 100, 'Paracetamol 500mg', '1 tableta cada 8h', '5 días');
INSERT INTO recetas VALUES (2, 101, 'Atenolol 50mg', '1 tableta diaria', '30 días');
INSERT INTO recetas VALUES (3, 102, 'Amoxicilina 500mg', '1 cápsula cada 12h', '7 días');
INSERT INTO recetas VALUES (4, 103, 'Omeprazol 20mg', '1 cápsula diaria', '5 días');
INSERT INTO recetas VALUES (5, 104, 'Multivitamínico', '1 tableta diaria', '15 días');

-- ver tablas
SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM citas;
SELECT * FROM expedientes;
SELECT * FROM recetas;

-- VERIFICAR LAS TABLAS CREADAS
show TABLES;
--DESCRIPCION DE LAS TABÑAS 
DESC pacientes;
DESC medicos;
DESC citas;
DESC expedientes;
DESC recetas;

