CREATE DATABASE petshop_db;

USE petshop_db;

CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(120) NOT NULL
);

CREATE TABLE pets(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(120) NOT NULL,
    cliente_id INT NOT NULL,
    especie VARCHAR(120) NOT NULL,
    porte ENUM('Pequeno','Medio','Grande') NOT NULL,
    nascimento DATE NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE servicos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    duracao_min INT NULL
);

CREATE TABLE agendamentos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    servico_id INT NOT NULL,
    observacoes VARCHAR(200) NULL,
    status ENUM('Agendado','Concluido','Cancelado') NOT NULL,
    data_hora DATE NOT NULL,
    
    CONSTRAINT fk_pet FOREIGN KEY (pet_id) REFERENCES pets(id),
    CONSTRAINT fk_servico FOREIGN KEY (servico_id) REFERENCES servicos(id)
);