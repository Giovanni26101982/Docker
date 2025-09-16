CREATE TABLE IF NOT EXISTS Parques (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    coordx DECIMAL(10,6) NOT NULL,
    coordy DECIMAL(10,6) NOT NULL,
    area_hectareas DECIMAL(10,2) NULL,          
    tipo VARCHAR(100) NULL,                     
    estado VARCHAR(50) DEFAULT 'ACTIVO',        

    -- Auditoría
    creado_por VARCHAR(100) DEFAULT 'system',
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_por VARCHAR(100) NULL,
    actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertar registros iniciales
INSERT INTO Parques (nombre, ubicacion, coordx, coordy, area_hectareas, tipo, estado, creado_por)
VALUES
('Parque La Carolina', 'Quito, Ecuador', -78.491111, -0.182500, 67.00, 'Urbano', 'ACTIVO', 'init'),
('Parque El Ejido', 'Quito, Ecuador', -78.497500, -0.213056, 12.00, 'Urbano', 'ACTIVO', 'init'),
('Parque Metropolitano Guanguiltagua', 'Quito, Ecuador', -78.466944, -0.157222, 557.00, 'Ecologico', 'ACTIVO', 'init'),
('Parque Itchimbia', 'Quito, Ecuador', -78.502222, -0.229722, 54.00, 'Recreativo', 'ACTIVO', 'init'),
('Parque Bicentenario', 'Quito, Ecuador', -78.488611, -0.120556, 200.00, 'Recreativo', 'ACTIVO', 'init');
