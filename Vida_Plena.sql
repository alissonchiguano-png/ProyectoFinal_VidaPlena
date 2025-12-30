
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

-- 50 inserts adicionales para pacientes
INSERT INTO pacientes VALUES ('0102030411', 'Miguel Ángel Ruiz', '1975-05-14', '0991234567', 'miguel.ruiz@gmail.com', 'Av. Eloy Alfaro');
INSERT INTO pacientes VALUES ('0102030412', 'Valeria Castro', '1999-08-30', '0982345678', 'valeria.castro@hotmail.com', 'Calle Pichincha');
INSERT INTO pacientes VALUES ('0102030413', 'Roberto Morales', '1980-11-22', '0973456789', 'roberto.morales@yahoo.com', 'Sector Quitumbe');
INSERT INTO pacientes VALUES ('0102030414', 'Camila Ortega', '2004-03-17', '0994567890', 'camila.ortega@gmail.com', 'Urbanización Carcelén');
INSERT INTO pacientes VALUES ('0102030415', 'Felipe Navarro', '1968-07-09', '0985678901', 'felipe.navarro@outlook.com', 'Av. Mariscal Sucre');
INSERT INTO pacientes VALUES ('0102030416', 'Gabriela Silva', '1993-12-05', '0976789012', 'gabriela.silva@gmail.com', 'Calle Guayaquil');
INSERT INTO pacientes VALUES ('0102030417', 'Santiago López', '1987-01-28', '0997890123', 'santiago.lopez@hotmail.com', 'Barrio La Gasca');
INSERT INTO pacientes VALUES ('0102030418', 'Isabella Díaz', '2001-09-11', '0988901234', 'isabella.diaz@gmail.com', 'Sector Tumbaco');
INSERT INTO pacientes VALUES ('0102030419', 'Eduardo Ramos', '1972-04-03', '0979012345', 'eduardo.ramos@yahoo.com', 'Av. 6 de Diciembre');
INSERT INTO pacientes VALUES ('0102030420', 'Natalia Vargas', '1996-10-19', '0990123456', 'natalia.vargas@gmail.com', 'Calle Vargas Torres');
INSERT INTO pacientes VALUES ('0102030421', 'Javier Mendoza', '1983-06-25', '0981235678', 'javier.mendoza@outlook.com', 'Urbanización Calderón');
INSERT INTO pacientes VALUES ('0102030422', 'Martina Flores', '2005-02-14', '0972346789', 'martina.flores@gmail.com', 'Sector Conocoto');
INSERT INTO pacientes VALUES ('0102030423', 'Alejandro Paredes', '1978-08-08', '0993457890', 'alejandro.paredes@hotmail.com', 'Av. Occidental');
INSERT INTO pacientes VALUES ('0102030424', 'Lucía Jiménez', '1991-11-30', '0984568901', 'lucia.jimenez@gmail.com', 'Calle Espejo');
INSERT INTO pacientes VALUES ('0102030425', 'Daniel Salazar', '1986-03-21', '0975679012', 'daniel.salazar@yahoo.com', 'Barrio San Blas');
INSERT INTO pacientes VALUES ('0102030426', 'Emma Guerrero', '2000-07-16', '0996780123', 'emma.guerrero@gmail.com', 'Sector Cumbayá');
INSERT INTO pacientes VALUES ('0102030427', 'Mateo Rivera', '1965-12-02', '0987891234', 'mateo.rivera@outlook.com', 'Av. Patria');
INSERT INTO pacientes VALUES ('0102030428', 'Victoria Acosta', '1994-05-18', '0978902345', 'victoria.acosta@gmail.com', 'Calle Mejía');
INSERT INTO pacientes VALUES ('0102030429', 'Sebastián Bravo', '1981-09-04', '0999013456', 'sebastian.bravo@hotmail.com', 'Urbanización Iñaquito');
INSERT INTO pacientes VALUES ('0102030430', 'Olivia Herrera', '2002-01-27', '0980124567', 'olivia.herrera@gmail.com', 'Sector Valle de los Chillos');
INSERT INTO pacientes VALUES ('0102030431', 'Leonardo Fuentes', '1970-10-10', '0971235678', 'leonardo.fuentes@yahoo.com', 'Av. Colón');
INSERT INTO pacientes VALUES ('0102030432', 'Sofía Reyes', '1997-04-12', '0992346789', 'sofia.reyes@gmail.com', 'Calle Olmedo');
INSERT INTO pacientes VALUES ('0102030433', 'Benjamín Soto', '1989-08-26', '0983457890', 'benjamin.soto@outlook.com', 'Barrio Centro Histórico');
INSERT INTO pacientes VALUES ('0102030434', 'Amelia Castro', '2006-06-15', '0974568901', 'amelia.castro@gmail.com', 'Sector La Floresta');
INSERT INTO pacientes VALUES ('0102030435', 'Tomás Vega', '1976-02-28', '0995679012', 'tomas.vega@hotmail.com', 'Av. 12 de Octubre');
INSERT INTO pacientes VALUES ('0102030436', 'Julia Morales', '1990-11-07', '0986780123', 'julia.morales@gmail.com', 'Calle Rocafuerte');
INSERT INTO pacientes VALUES ('0102030437', 'Emiliano Ortiz', '1984-03-19', '0977891234', 'emiliano.ortiz@yahoo.com', 'Urbanización Kennedy');
INSERT INTO pacientes VALUES ('0102030438', 'Valentina Rojas', '2003-09-23', '0998902345', 'valentina.rojas@gmail.com', 'Sector Sangolquí');
INSERT INTO pacientes VALUES ('0102030439', 'Maximiliano Peña', '1969-07-31', '0989013456', 'maximiliano.pena@outlook.com', 'Av. Amazonas');
INSERT INTO pacientes VALUES ('0102030440', 'Renata Delgado', '1995-12-14', '0970124567', 'renata.delgado@gmail.com', 'Calle Montúfar');
INSERT INTO pacientes VALUES ('0102030441', 'Agustín Romero', '1982-05-06', '0991236789', 'agustin.romero@hotmail.com', 'Barrio La Libertad');
INSERT INTO pacientes VALUES ('0102030442', 'Catalina Navarro', '2001-10-29', '0982347890', 'catalina.navarro@gmail.com', 'Sector Puembo');
INSERT INTO pacientes VALUES ('0102030443', 'Lautaro Campos', '1974-01-11', '0973458901', 'lautaro.campos@yahoo.com', 'Av. De los Shyris');
INSERT INTO pacientes VALUES ('0102030444', 'Abril Medina', '1998-08-17', '0994569012', 'abril.medina@gmail.com', 'Calle Chile');
INSERT INTO pacientes VALUES ('0102030445', 'Joaquín Suarez', '1987-04-24', '0985670123', 'joaquin.suarez@outlook.com', 'Urbanización Cotocollao');
INSERT INTO pacientes VALUES ('0102030446', 'Zoe Castillo', '2004-12-03', '0976781234', 'zoe.castillo@gmail.com', 'Sector Nayón');
INSERT INTO pacientes VALUES ('0102030447', 'Thiago Dominguez', '1971-06-20', '0997892345', 'thiago.dominguez@hotmail.com', 'Av. República');
INSERT INTO pacientes VALUES ('0102030448', 'Luna Espinoza', '1992-02-09', '0988903456', 'luna.espinoza@gmail.com', 'Calle García Moreno');
INSERT INTO pacientes VALUES ('0102030449', 'Matías Rivas', '1985-09-15', '0979014567', 'matias.rivas@yahoo.com', 'Barrio San Juan');
INSERT INTO pacientes VALUES ('0102030450', 'Emilia Guzmán', '2000-03-28', '0990125678', 'emilia.guzman@gmail.com', 'Sector Pifo');
INSERT INTO pacientes VALUES ('0102030451', 'Dylan Blanco', '1977-11-12', '0981236789', 'dylan.blanco@outlook.com', 'Av. 10 de Agosto');
INSERT INTO pacientes VALUES ('0102030452', 'Florencia Ponce', '1994-07-04', '0972347890', 'florencia.ponce@gmail.com', 'Calle Benalcázar');
INSERT INTO pacientes VALUES ('0102030453', 'Ian Contreras', '1988-12-18', '0993458901', 'ian.contreras@hotmail.com', 'Urbanización Guápulo');
INSERT INTO pacientes VALUES ('0102030454', 'Sara Velázquez', '2005-05-22', '0984569012', 'sara.velazquez@gmail.com', 'Sector Amaguaña');
INSERT INTO pacientes VALUES ('0102030455', 'Bruno Acosta', '1966-10-05', '0975670123', 'bruno.acosta@yahoo.com', 'Av. Orellana');
INSERT INTO pacientes VALUES ('0102030456', 'Maite Santana', '1991-01-30', '0996781234', 'maite.santana@gmail.com', 'Calle Venezuela');
INSERT INTO pacientes VALUES ('0102030457', 'Álvaro Ferrer', '1983-08-13', '0987892345', 'alvaro.ferrer@outlook.com', 'Barrio Chillogallo');
INSERT INTO pacientes VALUES ('0102030458', 'Clara Hidalgo', '1999-04-07', '0978903456', 'clara.hidalgo@gmail.com', 'Sector Los Chillos');
INSERT INTO pacientes VALUES ('0102030459', 'Nicolás Pastor', '1973-09-26', '0999014567', 'nicolas.pastor@hotmail.com', 'Av. Naciones Unidas');
INSERT INTO pacientes VALUES ('0102030460', 'Elena Marcos', '1986-06-11', '0980125678', 'elena.marcos@gmail.com', 'Calle Junín');

-- 25 inserts adicionales para pacientes (del 61 al 85)
INSERT INTO pacientes VALUES ('0102030461', 'Facundo Ríos', '1980-02-14', '0991237890', 'facundo.rios@gmail.com', 'Sector La Ferroviaria');
INSERT INTO pacientes VALUES ('0102030462', 'Agustina Molina', '1997-07-22', '0982348901', 'agustina.molina@hotmail.com', 'Av. Maldonado');
INSERT INTO pacientes VALUES ('0102030463', 'Gonzalo Ferreira', '1974-11-09', '0973459012', 'gonzalo.ferreira@yahoo.com', 'Calle Cuenca');
INSERT INTO pacientes VALUES ('0102030464', 'Julieta Cabrera', '2002-05-18', '0994560123', 'julieta.cabrera@gmail.com', 'Urbanización San Isidro');
INSERT INTO pacientes VALUES ('0102030465', 'Santana Vega', '1988-09-30', '0985671234', 'santana.vega@outlook.com', 'Barrio El Camal');
INSERT INTO pacientes VALUES ('0102030466', 'Lola Márquez', '1993-03-05', '0976782345', 'lola.marquez@gmail.com', 'Sector Guangopolo');
INSERT INTO pacientes VALUES ('0102030467', 'Franco Duarte', '1969-12-17', '0997893456', 'franco.duarte@hotmail.com', 'Av. Simón Bolívar');
INSERT INTO pacientes VALUES ('0102030468', 'Delfina Soto', '2000-08-26', '0988904567', 'delfina.soto@gmail.com', 'Calle Ambato');
INSERT INTO pacientes VALUES ('0102030469', 'Lisandro Prieto', '1985-04-11', '0979015678', 'lisandro.prieto@yahoo.com', 'Urbanización Comité del Pueblo');
INSERT INTO pacientes VALUES ('0102030470', 'Morena Gil', '1991-10-03', '0990126789', 'morena.gil@gmail.com', 'Sector Alangasí');
INSERT INTO pacientes VALUES ('0102030471', 'Elías Carrizo', '1977-06-29', '0981238901', 'elias.carrizo@outlook.com', 'Av. Interoceánica');
INSERT INTO pacientes VALUES ('0102030472', 'Paloma Nieves', '2004-01-15', '0972349012', 'paloma.nieves@gmail.com', 'Calle Loja');
INSERT INTO pacientes VALUES ('0102030473', 'Bautista Luna', '1982-07-08', '0993450123', 'bautista.luna@hotmail.com', 'Barrio La Magdalena');
INSERT INTO pacientes VALUES ('0102030474', 'Azul Roldán', '1996-12-21', '0984561234', 'azul.roldan@gmail.com', 'Sector Puéllaro');
INSERT INTO pacientes VALUES ('0102030475', 'Julián Vera', '1971-05-04', '0975672345', 'julian.vera@yahoo.com', 'Av. González Suárez');
INSERT INTO pacientes VALUES ('0102030476', 'Alma Figueroa', '1989-11-12', '0996783456', 'alma.figueroa@gmail.com', 'Calle Riobamba');
INSERT INTO pacientes VALUES ('0102030477', 'Tobías Ojeda', '2001-03-27', '0987894567', 'tobias.ojeda@outlook.com', 'Urbanización Miraflores');
INSERT INTO pacientes VALUES ('0102030478', 'India Pacheco', '1994-09-19', '0978905678', 'india.pacheco@gmail.com', 'Sector Yaruquí');
INSERT INTO pacientes VALUES ('0102030479', 'Benicio Gallardo', '1978-02-06', '0999016789', 'benicio.gallardo@hotmail.com', 'Av. Eloy Alfaro Norte');
INSERT INTO pacientes VALUES ('0102030480', 'Esmeralda Barrios', '2003-08-14', '0980128901', 'esmeralda.barrios@gmail.com', 'Calle Esmeraldas');
INSERT INTO pacientes VALUES ('0102030481', 'Lautaro Miranda', '1986-10-25', '0971239012', 'lautaro.miranda@yahoo.com', 'Barrio Solanda');
INSERT INTO pacientes VALUES ('0102030482', 'Selena Coronado', '1999-04-02', '0992340123', 'selena.coronado@gmail.com', 'Sector Tababela');
INSERT INTO pacientes VALUES ('0102030483', 'Ángel Calderón', '1975-12-30', '0983451234', 'angel.calderon@outlook.com', 'Av. De la Prensa');
INSERT INTO pacientes VALUES ('0102030484', 'Guadalupe Tapia', '1992-06-16', '0974562345', 'guadalupe.tapia@gmail.com', 'Calle Manabí');
INSERT INTO pacientes VALUES ('0102030485', 'Damián Escudero', '1981-01-09', '0995673456', 'damian.escudero@hotmail.com', 'Urbanización La Armenia');

SELECT * FROM pacientes;
SELECT COUNT (*) from pacientes;

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
-- del 11 al 85)
INSERT INTO citas VALUES (11, '0102030411', 1, '2025-02-03', '09:00:00', 'Chequeo anual general', 'Agendada');
INSERT INTO citas VALUES (12, '0102030412', 2, '2025-02-05', '10:00:00', 'Control de presión arterial', 'Agendada');
INSERT INTO citas VALUES (13, '0102030413', 3, '2025-02-07', '15:00:00', 'Vacunas infantiles', 'Atendida');
INSERT INTO citas VALUES (14, '0102030414', 4, '2025-02-10', '11:00:00', 'Tratamiento acné', 'Agendada');
INSERT INTO citas VALUES (15, '0102030415', 5, '2025-02-12', '08:30:00', 'Revisión de rodilla', 'Atendida');
INSERT INTO citas VALUES (16, '0102030416', 6, '2025-02-14', '16:00:00', 'Control prenatal', 'Agendada');
INSERT INTO citas VALUES (17, '0102030417', 7, '2025-02-17', '10:00:00', 'Control de miopía', 'Atendida');
INSERT INTO citas VALUES (18, '0102030418', 8, '2025-02-19', '14:30:00', 'Dolor de cabeza crónico', 'Agendada');
INSERT INTO citas VALUES (19, '0102030419', 9, '2025-02-21', '11:30:00', 'Extracción dental', 'Cancelada');
INSERT INTO citas VALUES (20, '0102030420', 10, '2025-02-24', '15:30:00', 'Control diabetes tipo 2', 'Agendada');

INSERT INTO citas VALUES (21, '0102030401', 3, '2025-03-01', '14:30:00', 'Control crecimiento niño', 'Atendida');
INSERT INTO citas VALUES (22, '0102030421', 1, '2025-03-03', '08:30:00', 'Dolor abdominal', 'Atendida');
INSERT INTO citas VALUES (23, '0102030422', 4, '2025-03-05', '12:00:00', 'Alergia en piel', 'Agendada');
INSERT INTO citas VALUES (24, '0102030423', 2, '2025-03-07', '11:00:00', 'Electrocardiograma de rutina', 'Agendada');
INSERT INTO citas VALUES (25, '0102030424', 6, '2025-03-10', '17:00:00', 'Papanicolaou anual', 'Agendada');
INSERT INTO citas VALUES (26, '0102030425', 5, '2025-03-12', '09:00:00', 'Rehabilitación hombro', 'Atendida');
INSERT INTO citas VALUES (27, '0102030426', 7, '2025-03-14', '09:30:00', 'Cambio de lentes', 'Atendida');
INSERT INTO citas VALUES (28, '0102030427', 8, '2025-03-17', '15:00:00', 'Estudio de migraña', 'Agendada');
INSERT INTO citas VALUES (29, '0102030428', 9, '2025-03-19', '10:30:00', 'Ortodoncia consulta', 'Agendada');
INSERT INTO citas VALUES (30, '0102030429', 10, '2025-03-21', '16:00:00', 'Ajuste de medicación tiroidea', 'Atendida');

INSERT INTO citas VALUES (31, '0102030430', 1, '2025-04-01', '10:00:00', 'Gripe y fiebre', 'Atendida');
INSERT INTO citas VALUES (32, '0102030431', 2, '2025-04-03', '09:30:00', 'Arritmia cardíaca', 'Agendada');
INSERT INTO citas VALUES (33, '0102030432', 3, '2025-04-05', '16:00:00', 'Control desarrollo bebé', 'Agendada');
INSERT INTO citas VALUES (34, '0102030433', 4, '2025-04-08', '10:00:00', 'Psoriasis seguimiento', 'Atendida');
INSERT INTO citas VALUES (35, '0102030434', 5, '2025-04-10', '08:00:00', 'Esguince tobillo', 'Atendida');
INSERT INTO citas VALUES (36, '0102030435', 6, '2025-04-12', '15:30:00', 'Planificación familiar', 'Agendada');
INSERT INTO citas VALUES (37, '0102030436', 7, '2025-04-15', '11:00:00', 'Cataratas evaluación', 'Agendada');
INSERT INTO citas VALUES (38, '0102030437', 8, '2025-04-17', '13:30:00', 'Temblor en manos', 'Agendada');
INSERT INTO citas VALUES (39, '0102030438', 9, '2025-04-19', '09:30:00', 'Blanqueamiento dental', 'Cancelada');
INSERT INTO citas VALUES (40, '0102030439', 10, '2025-04-22', '14:30:00', 'Control hipoglucemia', 'Atendida');

INSERT INTO citas VALUES (41, '0102030440', 1, '2025-05-02', '09:30:00', 'Vacunas pendientes', 'Agendada');
INSERT INTO citas VALUES (42, '0102030441', 4, '2025-05-05', '11:30:00', 'Hongos en piel', 'Atendida');
INSERT INTO citas VALUES (43, '0102030442', 2, '2025-05-07', '10:30:00', 'Colesterol alto', 'Agendada');
INSERT INTO citas VALUES (44, '0102030443', 3, '2025-05-09', '14:00:00', 'Fiebre en niño', 'Atendida');
INSERT INTO citas VALUES (45, '0102030444', 6, '2025-05-12', '16:30:00', 'Menopausia síntomas', 'Agendada');
INSERT INTO citas VALUES (46, '0102030445', 5, '2025-05-14', '10:00:00', 'Dolor lumbar crónico', 'Atendida');
INSERT INTO citas VALUES (47, '0102030446', 7, '2025-05-16', '08:30:00', 'Glaucoma control', 'Agendada');
INSERT INTO citas VALUES (48, '0102030447', 8, '2025-05-19', '14:00:00', 'Pérdida de memoria', 'Agendada');
INSERT INTO citas VALUES (49, '0102030448', 9, '2025-05-21', '11:00:00', 'Carie profunda', 'Atendida');
INSERT INTO citas VALUES (50, '0102030449', 10, '2025-05-23', '15:00:00', 'Control tiroides', 'Agendada');

INSERT INTO citas VALUES (51, '0102030450', 1, '2025-06-02', '08:00:00', 'Certificado médico laboral', 'Atendida');
INSERT INTO citas VALUES (52, '0102030451', 2, '2025-06-04', '09:00:00', 'Palpitaciones', 'Agendada');
INSERT INTO citas VALUES (53, '0102030452', 4, '2025-06-06', '10:30:00', 'Eczema crónico', 'Atendida');
INSERT INTO citas VALUES (54, '0102030453', 3, '2025-06-09', '15:30:00', 'Alergias alimentarias', 'Agendada');
INSERT INTO citas VALUES (55, '0102030454', 5, '2025-06-11', '09:30:00', 'Fractura antigua control', 'Atendida');
INSERT INTO citas VALUES (56, '0102030455', 6, '2025-06-13', '17:00:00', 'Embarazo primer trimestre', 'Agendada');
INSERT INTO citas VALUES (57, '0102030456', 7, '2025-06-16', '10:30:00', 'Astigmatismo', 'Atendida');
INSERT INTO citas VALUES (58, '0102030457', 8, '2025-06-18', '16:00:00', 'Epilepsia seguimiento', 'Agendada');
INSERT INTO citas VALUES (59, '0102030458', 9, '2025-06-20', '09:00:00', 'Prótesis dental consulta', 'Agendada');
INSERT INTO citas VALUES (60, '0102030459', 10, '2025-06-23', '14:00:00', 'Resistencia a insulina', 'Atendida');

INSERT INTO citas VALUES (61, '0102030460', 1, '2025-07-01', '11:00:00', 'Dolor de garganta persistente', 'Agendada');
INSERT INTO citas VALUES (62, '0102030461', 2, '2025-07-03', '11:30:00', 'Insuficiencia cardíaca leve', 'Agendada');
INSERT INTO citas VALUES (63, '0102030462', 3, '2025-07-05', '14:30:00', 'Desarrollo psicomotor', 'Atendida');
INSERT INTO citas VALUES (64, '0102030463', 4, '2025-07-08', '12:00:00', 'Rosácea', 'Agendada');
INSERT INTO citas VALUES (65, '0102030464', 6, '2025-07-10', '15:00:00', 'Infección urinaria', 'Atendida');
INSERT INTO citas VALUES (66, '0102030465', 5, '2025-07-12', '08:00:00', 'Lesión menisco', 'Agendada');
INSERT INTO citas VALUES (67, '0102030466', 7, '2025-07-15', '09:00:00', 'Conjuntivitis crónica', 'Atendida');
INSERT INTO citas VALUES (68, '0102030467', 8, '2025-07-17', '13:00:00', 'Parkinson temprano', 'Agendada');
INSERT INTO citas VALUES (69, '0102030468', 9, '2025-07-19', '10:00:00', 'Implante dental', 'Cancelada');
INSERT INTO citas VALUES (70, '0102030469', 10, '2025-07-22', '16:30:00', 'Hipertiroidismo', 'Agendada');

INSERT INTO citas VALUES (71, '0102030470', 1, '2025-08-01', '10:30:00', 'Análisis de sangre interpretación', 'Atendida');
INSERT INTO citas VALUES (72, '0102030471', 4, '2025-08-04', '11:00:00', 'Caída de cabello', 'Agendada');
INSERT INTO citas VALUES (73, '0102030472', 2, '2025-08-06', '10:00:00', 'Marcapasos control', 'Atendida');
INSERT INTO citas VALUES (74, '0102030473', 3, '2025-08-08', '16:00:00', 'Bronquitis infantil', 'Atendida');
INSERT INTO citas VALUES (75, '0102030474', 6, '2025-08-11', '18:00:00', 'Quiste ovárico', 'Agendada');
INSERT INTO citas VALUES (76, '0102030475', 5, '2025-08-13', '10:30:00', 'Artrosis cadera', 'Atendida');
INSERT INTO citas VALUES (77, '0102030476', 7, '2025-08-15', '11:30:00', 'Retinopatía diabética', 'Agendada');
INSERT INTO citas VALUES (78, '0102030477', 8, '2025-08-18', '15:30:00', 'Esclerosis múltiple', 'Agendada');
INSERT INTO citas VALUES (79, '0102030478', 9, '2025-08-20', '12:00:00', 'Periodontitis', 'Atendida');
INSERT INTO citas VALUES (80, '0102030479', 10, '2025-08-22', '17:00:00', 'Síndrome metabólico', 'Agendada');

INSERT INTO citas VALUES (81, '0102030480', 1, '2025-09-01', '09:00:00', 'Dolor de espalda', 'Agendada');
INSERT INTO citas VALUES (82, '0102030481', 2, '2025-09-03', '09:30:00', 'Angina de pecho', 'Atendida');
INSERT INTO citas VALUES (83, '0102030482', 3, '2025-09-05', '15:00:00', 'Otitis recurrente', 'Agendada');
INSERT INTO citas VALUES (84, '0102030483', 4, '2025-09-08', '10:30:00', 'Urticaria crónica', 'Atendida');
INSERT INTO citas VALUES (85, '0102030484', 6, '2025-09-10', '16:00:00', 'Endometriosis', 'Agendada');

SELECT * FROM citas;
SELECT COUNT (*) from citas;

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

-- 50 INSERTs adicionales para expedientes_clinicos (id 11 al 60)
INSERT INTO expedientes_clinicos VALUES (11, '0102030411', 1, '2025-02-03', 'Faringitis aguda', 'Reposo vocal y líquidos abundantes', 'Amoxicilina 500mg cada 8 horas por 7 días', 'Evitar irritantes, control si persiste fiebre');
INSERT INTO expedientes_clinicos VALUES (12, '0102030413', 3, '2025-02-07', 'Otitis media aguda', 'Antibiótico y analgésico', 'Amoxicilina 40mg/kg/día + Ibuprofeno', 'Control en 10 días, evitar agua en oídos');
INSERT INTO expedientes_clinicos VALUES (13, '0102030415', 5, '2025-02-12', 'Tendinitis de hombro', 'Reposo relativo y fisioterapia', 'Diclofenaco gel + sesiones de rehab', 'Evitar movimientos repetitivos, control en 3 semanas');
INSERT INTO expedientes_clinicos VALUES (14, '0102030417', 7, '2025-02-17', 'Astigmatismo moderado', 'Corrección óptica', 'Lentes tóricos nuevos', 'Uso permanente, control anual');
INSERT INTO expedientes_clinicos VALUES (15, '0102030421', 1, '2025-03-03', 'Gastritis erosiva', 'Dieta blanda y protector gástrico', 'Omeprazol 20mg diario por 4 semanas', 'Evitar café, picante y alcohol');
INSERT INTO expedientes_clinicos VALUES (16, '0102030425', 5, '2025-03-12', 'Lumbalgia mecánica', 'Analgésicos y reposo relativo', 'Paracetamol 1g + relajante muscular', 'Fisioterapia recomendada, control en 15 días');
INSERT INTO expedientes_clinicos VALUES (17, '0102030426', 7, '2025-03-14', 'Presbicia inicial', 'Lentes progresivos', 'Gafas para cerca y lejos', 'Adaptación gradual, control en 6 meses');
INSERT INTO expedientes_clinicos VALUES (18, '0102030429', 10, '2025-03-21', 'Diabetes tipo 2 descompensada', 'Metformina y dieta', 'Metformina 850mg 2 veces al día', 'Educación diabetológica, control glucémico mensual');
INSERT INTO expedientes_clinicos VALUES (19, '0102030430', 1, '2025-04-01', 'Infección urinaria baja', 'Antibiótico oral', 'Fosfomicina 3g dosis única', 'Aumentar ingesta de líquidos, control síntomas');
INSERT INTO expedientes_clinicos VALUES (20, '0102030433', 4, '2025-04-08', 'Acné vulgar moderado', 'Tratamiento tópico y oral', 'Peróxido de benzoilo + doxiciclina', 'Evitar manipulación lesiones, control en 1 mes');

INSERT INTO expedientes_clinicos VALUES (21, '0102030434', 5, '2025-04-10', 'Esguince de tobillo grado I', 'Protocolo RICE', 'Ibuprofeno 600mg + vendaje funcional', 'Carga progresiva, fisioterapia en 1 semana');
INSERT INTO expedientes_clinicos VALUES (22, '0102030439', 10, '2025-04-22', 'Hipercolesterolemia familiar', 'Estatinas y dieta', 'Atorvastatina 20mg nocturna', 'Control lipidico en 3 meses');
INSERT INTO expedientes_clinicos VALUES (23, '0102030441', 4, '2025-05-05', 'Dermatitis seborreica', 'Champú medicado', 'Ketoconazol 2% + loción corticoides', 'Aplicar 2 veces por semana');
INSERT INTO expedientes_clinicos VALUES (24, '0102030443', 3, '2025-05-09', 'Bronquiolitis', 'Soporte respiratorio', 'Salbutamol nebulizado + hidratación', 'Control evolutivo diario hasta mejoría');
INSERT INTO expedientes_clinicos VALUES (25, '0102030445', 5, '2025-05-14', 'Contractura cervical', 'Relajantes y calor local', 'CicLOBenzaprina + termoterapia', 'Ejercicios de estiramiento, control en 10 días');
INSERT INTO expedientes_clinicos VALUES (26, '0102030448', 9, '2025-05-21', 'Gingivitis crónica', 'Profilaxis y educación higiene', 'Enjuague clorhexidina 0.12%', 'Cepillado correcto, control en 3 meses');
INSERT INTO expedientes_clinicos VALUES (27, '0102030450', 1, '2025-06-02', 'Anemia ferropénica', 'Suplemento hierro oral', 'Sulfato ferroso 325mg diario', 'Dieta rica en hierro, control hemograma 1 mes');
INSERT INTO expedientes_clinicos VALUES (28, '0102030453', 4, '2025-06-06', 'Rosácea papulopustulosa', 'Metronidazol tópico', 'Crema metronidazol 0.75%', 'Evitar desencadenantes, protector solar diario');
INSERT INTO expedientes_clinicos VALUES (29, '0102030454', 5, '2025-06-11', 'Epicondilitis lateral', 'Reposo y antiinflamatorios', 'Ibuprofeno + inmovilización parcial', 'Fisioterapia con ondas de choque recomendada');
INSERT INTO expedientes_clinicos VALUES (30, '0102030456', 7, '2025-06-16', 'Conjuntivitis alérgica', 'Antihistamínicos oculares', 'Olopatadina gotas 2 veces al día', 'Evitar alérgenos, control en 2 semanas');

INSERT INTO expedientes_clinicos VALUES (31, '0102030459', 10, '2025-06-23', 'Hipotiroidismo subclínico', 'Levotiroxina inicial', 'Levotiroxina 25mcg diario', 'Control TSH en 6 semanas');
INSERT INTO expedientes_clinicos VALUES (32, '0102030462', 3, '2025-07-05', 'Reflujo gastroesofágico infantil', 'Medidas posturales y espesante', 'Raniditina + fórmula antirreflujo', 'Control peso y síntomas en 15 días');
INSERT INTO expedientes_clinicos VALUES (33, '0102030464', 6, '2025-07-10', 'Cervicitis', 'Antibiótico combinado', 'Azitromicina + cefixima', 'Pareja también tratarse, control en 7 días');
INSERT INTO expedientes_clinicos VALUES (34, '0102030466', 7, '2025-07-15', 'Blefaritis crónica', 'Higiene palpebral', 'Compresas cálidas + toallitas oculares', 'Diario mañana y noche');
INSERT INTO expedientes_clinicos VALUES (35, '0102030471', 4, '2025-08-04', 'Alopecia areata', 'Corticoides tópicos potentes', 'Clobetasol loción', 'Aplicar nocturno, control evolución 1 mes');
INSERT INTO expedientes_clinicos VALUES (36, '0102030472', 2, '2025-08-06', 'Fibrilación auricular paroxística', 'Anticoagulación y control ritmo', 'Apixaban 5mg 2 veces al día', 'Estudio Holter recomendado');
INSERT INTO expedientes_clinicos VALUES (37, '0102030473', 3, '2025-08-08', 'Dermatitis atópica infantil', 'Emolientes y corticoides', 'Crema hidrocortisona 1% + emoliente', 'Evitar lana y detergentes agresivos');
INSERT INTO expedientes_clinicos VALUES (38, '0102030475', 5, '2025-08-13', 'Gonartrosis bilateral', 'Condroprotectores y AINE', 'Glucosamina + ibuprofeno según dolor', 'Ejercicios acuáticos recomendados');
INSERT INTO expedientes_clinicos VALUES (39, '0102030478', 9, '2025-08-20', 'Bruxismo nocturno', 'Férula de descarga', 'Férula acrílica superior', 'Uso nocturno permanente');
INSERT INTO expedientes_clinicos VALUES (40, '0102030481', 2, '2025-09-03', 'Insuficiencia cardíaca clase II', 'IECAS y betabloqueadores', 'Enalapril 10mg + carvedilol 6.25mg', 'Control peso diario y edema');

INSERT INTO expedientes_clinicos VALUES (41, '0102030482', 4, '2025-09-08', 'Psoriasis en placas', 'Calcipotriol + betametasona', 'Ungüento combinado diario', 'Fototerapia considerar si no mejora');
INSERT INTO expedientes_clinicos VALUES (42, '0102030485', 5, '2025-09-12', 'Fractura por estrés metatarsiano', 'Inmovilización', 'Bota walker 6 semanas', 'Reposo carga, control radiológico 1 mes');
INSERT INTO expedientes_clinicos VALUES (43, '0102030401', 7, '2025-09-15', 'Queratitis punctata', 'Lubricantes oculares', 'Lágrimas artificiales frecuentes', 'Evitar lentes de contacto hasta resolución');
INSERT INTO expedientes_clinicos VALUES (44, '0102030421', 9, '2025-09-19', 'Absceso dental', 'Drenaje y antibiótico', 'Amoxicilina-clavulánico 875mg', 'Derivación a cirugía oral');
INSERT INTO expedientes_clinicos VALUES (45, '0102030451', 2, '2025-10-03', 'Hipertensión resistente', 'Triple terapia antihipertensiva', 'Amlodipino + losartán + hidroclorotiazida', 'Monitoreo ambulatorio presión recomendado');
INSERT INTO expedientes_clinicos VALUES (46, '0102030471', 4, '2025-10-08', 'Micosis fungoide cutánea', 'Corticoides tópicos altos', 'Mometasona crema', 'Biopsia confirmatoria ya realizada');
INSERT INTO expedientes_clinicos VALUES (47, '0102030403', 6, '2025-11-12', 'Embarazo 38 semanas normal', 'Control prenatal rutinario', 'Ácido fólico + hierro', 'Programar cesárea electiva si desea');
INSERT INTO expedientes_clinicos VALUES (48, '0102030412', 7, '2025-10-15', 'Glaucoma de ángulo abierto', 'Prostaglandinas', 'Latanoprost gotas nocturnas', 'Control campo visual anual');
INSERT INTO expedientes_clinicos VALUES (49, '0102030472', 3, '2025-11-07', 'Asma bronquial persistente leve', 'Corticoides inhalados', 'Budesonida 200mcg 2 puff 2 veces al día', 'Educación uso inhalador');
INSERT INTO expedientes_clinicos VALUES (50, '0102030402', 5, '2025-10-13', 'Rotura parcial ligamento cruzado', 'Rehabilitación conservadora', 'Fisioterapia intensiva 3 meses', 'RMN confirma no cirugía por ahora');
INSERT INTO expedientes_clinicos VALUES (51, '0102030413', 5, '2025-11-14', 'Luxación recurrente hombro', 'Refuerzo muscular', 'Ejercicios proprioceptivos', 'Cirugía considerar si persiste inestabilidad');
INSERT INTO expedientes_clinicos VALUES (52, '0102030423', 7, '2025-11-17', 'Retinopatía hipertensiva grado II', 'Control presión arterial estricto', 'Sin medicación ocular específica', 'Derivación a cardiología');
INSERT INTO expedientes_clinicos VALUES (53, '0102030443', 9, '2025-11-21', 'Periodontitis avanzada', 'Raspado y alisado radicular', 'Antibiótico local + sistémico', 'Mantenimiento cada 3 meses');
INSERT INTO expedientes_clinicos VALUES (54, '0102030462', 3, '2025-07-05', 'Síndrome febril prolongado', 'Estudio etiológico pendiente', 'Paracetamol según fiebre', 'Hemocultivos y serologías en curso');
INSERT INTO expedientes_clinicos VALUES (55, '0102030482', 3, '2025-11-07', 'Varicela complicada', 'Aciclovir oral', 'Aciclovir 800mg 5 veces al día', 'Aislamiento hasta costras');
INSERT INTO expedientes_clinicos VALUES (56, '0102030411', 8, '2025-09-17', 'Cefalea tensional crónica', 'Amitriptilina profiláctica', 'Amitriptilina 25mg nocturna', 'Técnicas de relajación recomendadas');
INSERT INTO expedientes_clinicos VALUES (57, '0102030432', 9, '2025-10-20', 'Trauma dental con avulsión', 'Reimplante fallido', 'Prótesis provisional', 'Implante futuro en 3 meses');
INSERT INTO expedientes_clinicos VALUES (58, '0102030453', 10, '2025-11-24', 'Síndrome de Cushing iatrogénico', 'Reducción gradual corticoides', 'Hidrocortisona disminución progresiva', 'Seguimiento cortisol matutino');
INSERT INTO expedientes_clinicos VALUES (59, '0102030401', 1, '2025-11-03', 'Ansiedad generalizada', 'Sertralina inicial', 'Sertralina 50mg diario', 'Derivación a psicología');
INSERT INTO expedientes_clinicos VALUES (60, '0102030473', 2, '2025-08-06', 'Infarto agudo miocardio antiguo', 'Doble antiagregación', 'AAS 100mg + clopidogrel 75mg', 'Rehabilitación cardíaca en curso');

SELECT * FROM expedientes_clinicos;
SELECT COUNT (*) from expedientes_clinicos;

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

-- 50 INSERTs adicionales para historial_citas (id_historial 11 al 60)
INSERT INTO historial_citas VALUES (11, 11, '0102030411', 1, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (12, 12, '0102030412', 2, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (13, 13, '0102030413', 3, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Juan Andrade');
INSERT INTO historial_citas VALUES (14, 14, '0102030414', 4, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (15, 15, '0102030415', 5, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Roberto Sánchez');

INSERT INTO historial_citas VALUES (16, 16, '0102030416', 6, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (17, 17, '0102030417', 7, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Miguel Torres');
INSERT INTO historial_citas VALUES (18, 18, '0102030418', 8, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (19, 19, '0102030419', 9, NOW(), 'Cancelación', 'Agendada', 'Cancelada', 'Sistema');
INSERT INTO historial_citas VALUES (20, 20, '0102030420', 10, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');

INSERT INTO historial_citas VALUES (21, 21, '0102030401', 3, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Juan Andrade');
INSERT INTO historial_citas VALUES (22, 22, '0102030421', 1, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Carlos Ruiz');
INSERT INTO historial_citas VALUES (23, 23, '0102030422', 4, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (24, 24, '0102030423', 2, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (25, 25, '0102030424', 6, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');

INSERT INTO historial_citas VALUES (26, 26, '0102030425', 5, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Roberto Sánchez');
INSERT INTO historial_citas VALUES (27, 27, '0102030426', 7, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Miguel Torres');
INSERT INTO historial_citas VALUES (28, 28, '0102030427', 8, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (29, 29, '0102030428', 9, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (30, 30, '0102030429', 10, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dra. Sofia Ramírez');

INSERT INTO historial_citas VALUES (31, 31, '0102030430', 1, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Carlos Ruiz');
INSERT INTO historial_citas VALUES (32, 32, '0102030431', 2, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (33, 33, '0102030432', 3, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (34, 34, '0102030433', 4, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dra. Patricia Morales');
INSERT INTO historial_citas VALUES (35, 35, '0102030434', 5, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Roberto Sánchez');

INSERT INTO historial_citas VALUES (36, 36, '0102030435', 6, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (37, 37, '0102030436', 7, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (38, 38, '0102030437', 8, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (39, 39, '0102030438', 9, NOW(), 'Cancelación', 'Agendada', 'Cancelada', 'Sistema');
INSERT INTO historial_citas VALUES (40, 40, '0102030439', 10, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dra. Sofia Ramírez');

INSERT INTO historial_citas VALUES (41, 41, '0102030440', 1, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (42, 42, '0102030441', 4, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dra. Patricia Morales');
INSERT INTO historial_citas VALUES (43, 43, '0102030442', 2, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (44, 44, '0102030443', 3, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Juan Andrade');
INSERT INTO historial_citas VALUES (45, 45, '0102030444', 6, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');

INSERT INTO historial_citas VALUES (46, 46, '0102030445', 5, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Roberto Sánchez');
INSERT INTO historial_citas VALUES (47, 47, '0102030446', 7, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (48, 48, '0102030447', 8, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (49, 49, '0102030448', 9, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Andrés Herrera');
INSERT INTO historial_citas VALUES (50, 50, '0102030449', 10, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');

INSERT INTO historial_citas VALUES (51, 51, '0102030450', 1, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Carlos Ruiz');
INSERT INTO historial_citas VALUES (52, 52, '0102030451', 2, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (53, 53, '0102030452', 4, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dra. Patricia Morales');
INSERT INTO historial_citas VALUES (54, 54, '0102030453', 3, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (55, 55, '0102030454', 5, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Roberto Sánchez');

INSERT INTO historial_citas VALUES (56, 56, '0102030455', 6, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (57, 57, '0102030456', 7, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dr. Miguel Torres');
INSERT INTO historial_citas VALUES (58, 58, '0102030457', 8, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (59, 59, '0102030458', 9, NOW(), 'Creación', NULL, 'Agendada', 'Sistema');
INSERT INTO historial_citas VALUES (60, 60, '0102030459', 10, NOW(), 'Atención', 'Agendada', 'Atendida', 'Dra. Sofia Ramírez');

SELECT * FROM historial_citas;
SELECT COUNT (*) from historial_citas;
DROP DATABASE vidaplena;
-- tabla de pagos 
CREATE TABLE pagos (
    id_pago INT,
    id_cita INT,
    cedula_paciente CHAR(10),
    id_medico INT,
    monto DECIMAL(8,2),
    fecha_pago DATE
);

-- Primary Key compuesta
ALTER TABLE pagos
ADD PRIMARY KEY (id_pago, cedula_paciente, id_medico);

-- validacion de clave foranea para verificar qye la cedula del paciente exista en la tabla de pacientes
ALTER TABLE pagos
ADD CONSTRAINT pago_citas_fk
FOREIGN KEY (cedula_paciente) REFERENCES pacientes(cedula);

-- validacion de clave foranea para Verificar que el id del médico exista en la tabla medicos
ALTER TABLE pagos
ADD CONSTRAINT pago_citas_medico_fk
FOREIGN KEY (id_medico) REFERENCES medicos(id);


INSERT INTO pagos VALUES (1, 1, '0102030401', 1, 25.00, '2025-01-15');
INSERT INTO pagos VALUES (2, 2, '0102030402', 2, 40.50, '2025-01-16');
INSERT INTO pagos VALUES (3, 3, '0102030403', 3, 15.00, '2025-01-17');
INSERT INTO pagos VALUES (4, 4, '0102030404', 4, 60.00, '2025-01-20');
INSERT INTO pagos VALUES (5, 5, '0102030405', 5, 80.00, '2025-01-21');
INSERT INTO pagos VALUES (6, 6, '0102030406', 6, 30.00, '2025-01-22');
INSERT INTO pagos VALUES (7, 7, '0102030407', 7, 45.00, '2025-01-23');
INSERT INTO pagos VALUES (8, 8, '0102030408', 8, 55.50, '2025-01-24');
INSERT INTO pagos VALUES (9, 9, '0102030409', 9, 20.00, '2025-01-25');
INSERT INTO pagos VALUES (10, 10, '0102030410', 10, 35.00, '2025-01-26');
INSERT INTO pagos VALUES (11, 11, '0102030411', 1, 75.00, '2025-01-27');
INSERT INTO pagos VALUES (12, 12, '0102030412', 2, 90.00, '2025-01-28');
INSERT INTO pagos VALUES (13, 13, '0102030413', 3, 28.50, '2025-01-29');
INSERT INTO pagos VALUES (14, 14, '0102030414', 4, 65.00, '2025-01-30');
INSERT INTO pagos VALUES (15, 15, '0102030415', 5, 100.00, '2025-01-31');
INSERT INTO pagos VALUES (16, 16, '0102030416', 6, 22.00, '2025-02-01');

INSERT INTO pagos VALUES (17, 17, '0102030417', 7, 48.00, '2025-02-02');
INSERT INTO pagos VALUES (18, 18, '0102030418', 8, 70.00, '2025-02-03');
INSERT INTO pagos VALUES (19, 19, '0102030419', 9, 33.00, '2025-02-04');
INSERT INTO pagos VALUES (20, 20, '0102030420', 10, 85.00, '2025-02-05');
INSERT INTO pagos VALUES (21, 21, '0102030421', 1, 55.00, '2025-02-06');
INSERT INTO pagos VALUES (22, 22, '0102030422', 2, 40.00, '2025-02-07');
INSERT INTO pagos VALUES (23, 23, '0102030423', 3, 95.00, '2025-02-08');
INSERT INTO pagos VALUES (24, 24, '0102030424', 4, 60.00, '2025-02-09');
INSERT INTO pagos VALUES (25, 25, '0102030425', 5, 27.00, '2025-02-10');
INSERT INTO pagos VALUES (26, 26, '0102030426', 6, 50.00, '2025-02-11');

INSERT INTO pagos VALUES (27, 27, '0102030427', 7, 72.00, '2025-02-12');
INSERT INTO pagos VALUES (28, 28, '0102030428', 8, 18.00, '2025-02-13');
INSERT INTO pagos VALUES (29, 29, '0102030429', 9, 44.00, '2025-02-14');
INSERT INTO pagos VALUES (30, 30, '0102030430', 10, 88.00, '2025-02-15');




