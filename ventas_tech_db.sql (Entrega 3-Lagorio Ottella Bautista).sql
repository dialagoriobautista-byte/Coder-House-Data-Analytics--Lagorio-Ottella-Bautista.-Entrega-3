IF DB_ID('Ventas_Tech_DB') IS NULL
    CREATE DATABASE Ventas_Tech_DB;
GO
USE Ventas_Tech_DB;
GO
---SECCIÓN 1--  DROP-TABLES

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;

---SECCIÓN 2-- CREATE-TABLES

CREATE TABLE Categorias(
ID_Categoria INT  PRIMARY KEY,
Nombre_Categoria VARCHAR(50) NOT NULL,
Descripcion VARCHAR(200)
);

CREATE TABLE Clientes(
ID_Cliente INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Ciudad VARCHAR(50),
Fecha_Registro DATE NOT NULL
);

CREATE TABLE Productos(
ID_Producto INT PRIMARY KEY,
Nombre_Producto VARCHAR(100) NOT NULL,
ID_Categoria INT FOREIGN KEY REFERENCES  Categorias(ID_Categoria),
Precio DECIMAL(10,2) NOT NULL,
Stock INT DEFAULT 0,
Activo BIT DEFAULT 1
);

CREATE TABLE Ventas(
ID_Venta INT PRIMARY KEY,
ID_Cliente INT FOREIGN KEY REFERENCES Clientes(ID_Cliente),
ID_Producto INT FOREIGN KEY REFERENCES Productos(ID_Producto),
Cantidad INT NOT NULL,
Precio_Unitario DECIMAL(10,2) NOT NULL,
Fecha_Venta DATE NOT NULL
);

--SECCION 3-INSERT DATA (25 REGISTROS) Categorias (4);Clientes(5);Productos(6);Ventas(10)

INSERT INTO Categorias (ID_Categoria,Nombre_Categoria,Descripcion) VALUES
(1, 'Computación',    'Laptops, PCs y monitores'),
(2, 'Accesorios',     'Periféricos y complementos'),
(3, 'Audio',          'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO Clientes (ID_Cliente,Nombre,Email,Ciudad,Fecha_Registro) VALUES
(1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
(2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
(3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
(4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
(5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');

INSERT INTO Productos (ID_Producto,Nombre_Producto,ID_Categoria,Precio,Stock,Activo) VALUES
(1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
(2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
(3, 'Monitor 4K 27',      1,  450.00, 12, 1),
(4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
(5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
(6, 'Teclado Mecánico',   2,   95.00, 40, 1);

INSERT INTO Ventas(ID_Venta,ID_Cliente,ID_Producto,Cantidad,Precio_Unitario,Fecha_Venta) VALUES
( 1, 1, 1, 2, 1200.00, '2024-03-05'),
( 2, 2, 2, 5,   28.00, '2024-03-06'),
( 3, 3, 3, 1,  450.00, '2024-03-07'),
( 4, 1, 4, 2,  120.00, '2024-03-08'),
( 5, 4, 5, 3,  130.00, '2024-03-10'),
( 6, 2, 6, 4,   95.00, '2024-03-11'),
( 7, 5, 1, 1, 1200.00, '2024-03-12'),
( 8, 3, 2, 8,   28.00, '2024-03-13'),
( 9, 4, 4, 1,  120.00, '2024-03-14'),
(10, 5, 3, 2,  450.00, '2024-03-15');

--SECCION 4---VALIDACION

SELECT * FROM categorias;  
SELECT * FROM clientes;    
SELECT * FROM productos;   
SELECT * FROM ventas;      
