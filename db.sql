CREATE DATABASE petshop_db;

USE petshop_db;

CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(11) NULL,
    email VARCHAR(120) NULL
);

CREATE TABLE pets(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(120) NOT NULL,
    cliente_id INT NOT NULL,
    especie ENUM('Shih Tzu', 'Labrador Retriever', 'Golden Retriever', 'Bulldog Francês', 'Pastor Alemão', 'Poodle', 'Yorkshire Terrier', 'Beagle', 'Chihuahua', 'Husky Siberiano', 'Pug', 'Border Collie', 'Rottweiler', 'Dálmata', 'Lhasa Apso') NOT NULL,
    porte ENUM('Pequeno','Medio','Grande') NOT NULL,
    nascimento DATE NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE servicos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL UNIQUE,
    preco DECIMAL(6,2) CHECK(preco >= 0) NOT NULL,
    duracao_min INT CHECK(duracao_min > 0) NULL
);

CREATE TABLE agendamentos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    servico_id INT NOT NULL,
    observacoes VARCHAR(200) NULL,
    status ENUM('Agendado','Concluido','Cancelado') NOT NULL,
    
    CONSTRAINT fk_pet FOREIGN KEY (pet_id) REFERENCES pets(id),
    CONSTRAINT fk_servico FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

INSERT INTO clientes(nome, cpf)
VALUE
('Giovana', 12345678910),
('Joice', 11111111111),
('Maria', 22222222222);

INSERT INTO pets(nome, cliente_id, especie, porte)
VALUE
('Flor', 1, 'Shih Tzu', 'Pequeno'),
('Cacau', 2, 'Golden Retriever', 'Medio'),
('Kira', 3, 'Yorkshire Terrier', 'Grande');

INSERT INTO servicos(nome, preco)
VALUE
('Banho', 20),
('Tosa', 40),
('Vacina', 0);