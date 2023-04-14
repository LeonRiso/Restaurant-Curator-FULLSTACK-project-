
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
    menuID INT not NULL AUTO_INCREMENT PRIMARY KEY,
    restID int not null,
    nome varchar(250) not null
    descricao VARCHAR(300) not null,
    preco DECIMAL(6,2) NOT NULL,
    foreign key (restID) references restaurante (restID)
);

CREATE TABLE avaliacao (
    menuID INT not NULL
    restID int not null,
    clientid int not null,
    descricao VARCHAR(200) not null,
    Dia date not null, 
    nota VARCHAR(10),
    foreign key (restID) references restaurante (restID)
    foreign key (clientid) references clientes (clientid)
    foreign key (menuID) references cardapio (menuID)
);

INSERT INTO clientes (nome, telefone, senha, email) VALUES
('John Doe', '1234567890', 'password123', 'johndoe@example.com'),
('Jane Smith', '0987654321', 'password456', 'janesmith@example.com'),
('Bob Johnson', '5551234567', 'password789', 'bobjohnson@example.com'),
('Samantha Lee', '9995551234', 'passwordabc', 'samanthalee@example.com'),
('Tom Wilson', '1112223333', 'passworddef', 'tomwilson@example.com');

INSERT INTO categoria (nome) VALUES ('Chinese'), ('Italian'), ('Japanese');

INSERT INTO restaurantes (nome,catID, endereco) VALUES
('Golden Palace','1', '123 Main St'),
('Mamma Mia','2', '456 Broadway'),
('Sakura Sushi','3', '789 Elm St'),
('The Jade Garden','1', '321 Pine St'),
('Trattoria Bella', '2','654 Oak Ave');z

INSERT INTO cardapio (restID, nome, descricao, preco) VALUES
(1, 'Egg Rolls', 'Crispy rolls filled with veggies and pork', 8.99),
(1, 'General Tso Chicken', 'Spicy chicken dish with peppers and onions', 13.99),
(2, 'Margherita Pizza', 'Classic pizza with fresh mozzarella and basil', 11.99),
(2, 'Spaghetti Carbonara', 'Pasta with creamy egg sauce and pancetta', 14.99),
(3, 'California Roll', 'Sushi roll with crab, avocado, and cucumber', 9.99),
(3, 'Sashimi Platter', 'Assortment of raw fish served with rice and miso soup', 19.99),
(4, 'Hot and Sour Soup', 'Traditional soup with mushrooms and tofu', 5.99),
(4, 'Moo Shu Pork', 'Stir-fried pork and veggies with hoisin sauce', 12.99),
(5, 'Caprese Salad', 'Fresh tomato and mozzarella salad with balsamic dressing', 7.99),
(5, 'Veal Parmigiana', 'Breaded veal cutlets with tomato sauce and melted cheese', 18.99);


INSERT INTO avaliacao (menuID, restID, clientid, descricao, Dia, nota) VALUES
  -- Reviews for Golden Palace
  (1, 1, 1, 'The egg rolls were delicious!', '2023-04-10', '4.5'),
  (2, 1, 2, 'The General Tso chicken was too spicy for me.', '2023-04-11', '3.0'),
  (3, 1, 3, 'The pizza was okay, but nothing special.', '2023-04-12', '2.5'),
  (4, 1, 4, 'The spaghetti carbonara was amazing!', '2023-04-10', '5.0'),
  (5, 1, 5, 'The California roll was fresh and tasty.', '2023-04-11', '4.0'),

  -- Reviews for Mamma Mia
  (6, 2, 1, 'The pizza was incredible!', '2023-04-10', '5.0'),
  (7, 2, 2, 'The spaghetti carbonara was so creamy and delicious.', '2023-04-11', '4.5'),
  (8, 2, 3, 'The veal parmigiana was a bit too heavy for my taste.', '2023-04-12', '3.0'),
  (9, 2, 4, 'The caprese salad was fresh and flavorful.', '2023-04-10', '4.0'),
  (10, 2, 5, 'The egg rolls were an odd choice for an Italian restaurant, but they were good.', '2023-04-11', '3.5'),

  -- Reviews for Sakura Sushi
  (5, 3, 1, 'The sushi was fresh and delicious!', '2023-04-10', '4.5'),
  (6, 3, 2, 'The sashimi platter was amazing.', '2023-04-11', '5.0'),
  (7, 3, 3, 'The hot and sour soup was a bit too sour for my taste.', '2023-04-12', '3.5'),
  (8, 3, 4, 'The moo shu pork was good, but not great.', '2023-04-10', '3.0'),
  (9, 3, 5, 'The California roll was good, but not as good as at other sushi places.', '2023-04-11', '3.5'),

  -- Reviews for The Jade Garden
  (1, 4, 1, 'The egg rolls were good, but nothing special.', '2023-04-10', '3.5'),
  (2, 4, 2, 'The General Tso chicken was too salty for me.', '2023-04-11', '2.5'),
  (3, 4, 3, 'The pizza was an odd choice for a Chinese restaurant, but it was okay.', '2023-04-12', '3.0'),
  (4, 4, 4, 'The spaghetti carbonara was way too heavy for a Chinese restaurant.', '2023-04-10', '2.0'),
