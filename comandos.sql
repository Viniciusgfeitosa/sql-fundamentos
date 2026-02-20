-- =========================================
-- CRIAR BANCO DE DADOS
-- =========================================
CREATE DATABASE sistema_exemplo;

-- USAR BANCO
USE sistema_exemplo;

-- =========================================
-- CRIAR TABELA CLIENTES
-- =========================================
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- INSERIR DADOS
-- =========================================
INSERT INTO clientes (nome, email, telefone)
VALUES 
('João Silva', 'joao@email.com', '31999990000'),
('Maria Souza', 'maria@email.com', '31988880000');

-- =========================================
-- CONSULTAR DADOS
-- =========================================
SELECT * FROM clientes;

-- =========================================
-- ATUALIZAR DADOS
-- =========================================
UPDATE clientes
SET telefone = '31977770000'
WHERE id = 1;

-- =========================================
-- DELETAR REGISTRO
-- =========================================
DELETE FROM clientes
WHERE id = 2;

-- =========================================
-- CRIAR TABELA PEDIDOS
-- =========================================
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10,2),
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- =========================================
-- INSERIR PEDIDO
-- =========================================
INSERT INTO pedidos (cliente_id, valor)
VALUES (1, 250.00);

-- =========================================
-- CONSULTAR COM JOIN
-- =========================================
SELECT p.id, c.nome, p.valor, p.data_pedido
FROM pedidos p
INNER JOIN clientes c ON c.id = p.cliente_id;