
DROP DATABASE IF EXISTS restaurantes;
CREATE DATABASE restaurantes;

USE restaurantes;

CREATE TABLE clientes (
    clientid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(153) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    senha VARCHAR(10) NOT NULL,
    email varchar(150) NOT NULL
);

CREATE TABLE categoria (
    catID INT not NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(153) NOT NULL,
);

CREATE TABLE restaurante (
    restID INT not NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) not NULL,
    catID INT not NULL,
    endereco VARCHAR(150) not NULL,
    foreign KEY (catID) references categoria (catID)
);

CREATE TABLE cardapio (
    restID int not null,
    nome varchar(250) not null,
    descricao VARCHAR(300) not null,
    preco DECIMAL(6,2) NOT NULL,
    foreign key (restID) references restaurante (restID)
);

CREATE TABLE avaliacao (
    restID int not null,
    clientid int not null,
    descricao VARCHAR(200) not null,
    Dia date not null, 
    nota VARCHAR(10),
    foreign key (restID) references restaurante (restID),
    foreign key (clientid) references clientes (clientid),
);

INSERT INTO clientes (nome, telefone, senha, email) VALUES
('John Doe', '1234567890', 'password123', 'johndoe@example.com'),
('Jane Smith', '0987654321', 'password456', 'janesmith@example.com'),
('Bob Johnson', '5551234567', 'password789', 'bobjohnson@example.com'),
('Samantha Lee', '9995551234', 'passwordabc', 'samanthalee@example.com'),
('Tom Wilson', '1112223333', 'passworddef', 'tomwilson@example.com');

INSERT INTO categoria (nome) VALUES ('Chinese'), ('Italian'), ('Japanese');

INSERT INTO restaurantes (nome,catID, endereco) VALUES
('Golden Palace'1, '123 Main St'),
('Mamma Mia',2, '456 Broadway'),
('Sakura Sushi',3, '789 Elm St'),
('The Jade Garden',1, '321 Pine St'),
('Trattoria Bella', 2,'654 Oak Ave');

    INSERT INTO cardapio (restID, nome, descricao, preco) VALUES
    -- Golden Palace
    (1, 'Egg Rolls', 'Crispy rolls filled with veggies and pork', 8.99),
    (1, 'General Tso Chicken', 'Spicy chicken dish with peppers and onions', 13.99),
    -- Mamma Mia
    (2, 'Margherita Pizza', 'Classic pizza with fresh mozzarella and basil', 11.99),
    (2, 'Spaghetti Carbonara', 'Pasta with creamy egg sauce and pancetta', 14.99),
    -- Sakura Sushi
    (3, 'California Roll', 'Sushi roll with crab, avocado, and cucumber', 9.99),
    (3, 'Sashimi Platter', 'Assortment of raw fish served with rice and miso soup', 19.99),
    -- Jade Garden
    (4, 'Hot and Sour Soup', 'Traditional soup with mushrooms and tofu', 5.99),
    (4, 'Moo Shu Pork', 'Stir-fried pork and veggies with hoisin sauce', 12.99),
    -- Trattoria Bella
    (5, 'Caprese Salad', 'Fresh tomato and mozzarella salad with balsamic dressing', 7.99),
    (5, 'Veal Parmigiana', 'Breaded veal cutlets with tomato sauce and melted cheese', 18.99);


INSERT INTO avaliacao (restID, clientid, descricao, Dia, nota) VALUES

    -- Golden Palace
    (1,1, 'Crispy rolls filled with veggies and pork banging', '2023-04-12', 5),
    (1,2, 'Spicy chicken dish with peppers and onions absolute based','2023-02-12',5),

        -- Mamma Mia
    (2,1 'Margherita Pizza Classic pizza with fresh mozzarella and basil', '2023-04-12', 5),
    (2,2 'Spaghetti Carbonara Pasta with creamy egg sauce and pancetta', '2023-04-12', 5),
    
        -- Sakura Sushi
    (3, 'California Roll Sushi roll with crab, avocado, and cucumber','2023-02-11' 4),
    (3, 'Sashimi Platter Assortment of raw fish served with rice and miso soup', 3),
    
        -- Jade Garden
    (4,1 'Hot and Sour Soup Traditional soup with mushrooms and tofu', '2023-04-12', 5),
    (4,2 'Moo Shu Pork Stir-fried pork and veggies with hoisin sauce', '2023-04-12', 5),
    
    -- Trattoria Bella
    (5,1 'Caprese Salad Fresh tomato and mozzarella salad with balsamic dressing', '2023-04-12', 5),
    (5,2 'Veal Parmigiana Breaded veal cutlets with tomato sauce and melted cheese', '2023-04-12', 5);