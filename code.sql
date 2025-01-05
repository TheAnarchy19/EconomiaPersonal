-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS db_finanzas;

-- Seleccionar la base de datos
USE db_finanzas;

-- Establecer la codificación de caracteres
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Crear la tabla categorias primero ya que otras tablas tienen claves foráneas que dependen de esta tabla
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(50)
);

-- Crear la tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100),
    password VARCHAR(50),
    foto_perfil VARCHAR(100)
);

-- Crear la tabla gastos
CREATE TABLE IF NOT EXISTS gastos (
    id_gasto INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    monto DECIMAL(10, 2),
    forma_pago VARCHAR(50),
    fecha DATE,
    id_categoria INT,
    nota VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Crear la tabla ingresos
CREATE TABLE IF NOT EXISTS ingresos (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    monto DECIMAL(10, 2),
    forma_pago VARCHAR(50),
    fecha DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Insertar datos en la tabla categorias
INSERT INTO categorias (categoria)
VALUES ('Otros');

