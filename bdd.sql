CREATE DATABASE cinemas;

-- CINEMAS
CREATE TABLE dt_cinemalist(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, nom VARCHAR(30) NOT NULL, adresse VARCHAR(100));

INSERT INTO dt_cinemalist(nom, adresse) VALUES ('Pathe Plan', 'Plan de Campagne 13600 CABRIES');
INSERT INTO dt_cinemalist(nom, adresse) VALUES ('Pathe Gardanne', '6 route de l''olivier 13600 GARDANNE');
INSERT INTO dt_cinemalist(nom, adresse) VALUES ('Pathe Salon de Provence', '8 avenue des pietons 13600 SALON DE PROVENCE');
INSERT INTO dt_cinemalist(nom, adresse) VALUES ('Pathe Aix', '3 rue de la fontaine 13600 AIX EN PROVENCE');

SELECT * FROM dt_cinemalist;

-- SALLES
CREATE TABLE dt_salles(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    nb_seats INT(3) NOT NULL,
    id_cinema INT(3) NOT NULL,
    FOREIGN KEY (id_cinema) REFERENCES dt_cinemalist(id)
);

INSERT INTO dt_salles(name, nb_seats, id_cinema) VALUES
    ('Salle 1',80, 1),
    ('Salle 2',120, 1),
    ('Pathe +',200, 1),
    ('Imax',254, 1),
    ('Salle 1',85, 2),
    ('Salle 2',140, 2),
    ('Pathé +',198, 2),
    ('4DX',350, 2),
    ('Salle 1',95, 3),
    ('Salle 2',245, 3),
    ('Salle 3',168, 3),
    ('Salle 1',187, 4),
    ('Imax',354, 4),
    ('Pathé +',254, 4)
;

SELECT * FROM dt_salles;

SELECT * FROM dt_salles LEFT JOIN dt_cinemalist ON dt_salles.id_cinema = dt_cinemalist.id;

-- PRIX
CREATE TABLE dt_prices(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    id_cinema INT(3) NOT NULL,
    FOREIGN KEY (id_cinema) REFERENCES dt_cinemalist(id)
);

INSERT INTO dt_prices(name, price, id_cinema) VALUES
    ('enfant', 5.50, 1),
    ('adulte', 12.60, 1),
    ('etudiant', 7.20, 1),
    ('senior', 6.40, 1),
    ('enfant', 4.50, 2),
    ('adulte', 12.20, 2),
    ('etudiant', 6.90, 2),
    ('senior', 7.40, 2),
    ('enfant', 5.60, 3),
    ('adulte', 11.10, 3),
    ('enfant', 5.00, 4),
    ('adulte', 11.20, 4),
    ('senior', 6.15, 4)
;

SELECT * FROM dt_prices;

SELECT * FROM dt_prices LEFT JOIN dt_cinemalist ON dt_prices.id_cinema = dt_cinemalist.id;


-- MOVIES
CREATE TABLE dt_movies(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    type1 VARCHAR(20) NOT NULL,
    type2 VARCHAR(20),
    type3 VARCHAR(20),
    length TIME NOT NULL,
    infos TEXT, 
    release_date DATE 
);

INSERT INTO dt_movies(title, type1, type2, type3, length, infos, release_date) VALUES
    ('Fight Club', 'Drame', '', '', '02:19:00', 'Insomniaque, désillusionné par sa vie personnelle et professionnelle, un jeune cadre expert en assurances, mène une vie monotone et sans saveur. Face à la vacuité de son existence, son médecin lui conseille de suivre une thérapie afin de relativiser son mal-être. Lors d''un voyage d''affaires, il fait la connaissance de Tyler Durden, une sorte de gourou anarchiste et philosophe. Ensemble, ils fondent le Fight Club. Cercle très fermé, où ils organisent des combats clandestins et violents, destinés à évacuer l''ordre établi.', '1999-11-10'),
    ('Pulp Fiction', 'Gangster', 'Comédie', '', '02:34:00', 'L''odyssée sanglante, burlesque et cocasse de petits malfrats dans la jungle de Hollywood à travers trois histoires qui s''entremêlent.', '1994-10-26'),
    ('Interstellar', 'Science-fiction', 'Drame', 'Aventure', '02:49:00', 'Alors que la vie sur Terre touche à sa fin, un groupe d’explorateurs s’attelle à la mission la plus importante de l’histoire de l’humanité : franchir les limites de notre galaxie pour savoir si l’homme peut vivre sur une autre planète…', '2014-11-05'),
    ('2001 : L''Odyssée de l''espace', 'Science-fiction', 'Aventure', '', '02:40:00', 'A l''aube de l''Humanité, dans le désert africain, une tribu de primates subit les assauts répétés d''une bande rivale, qui lui dispute un point d''eau.', '1968-09-27'),
    ('Blade Runner', 'Science-fiction', 'Film Noir', 'Thriller', '01:57:00', '2019, Los Angeles. La Terre est surpeuplée et l’humanité est partie coloniser l’espace. Les nouveaux colons sont assistés de Replicants, androïdes que rien ne peut distinguer de l''être humain. Conçus comme de nouveaux esclaves, certains parmi les plus évolués s’affranchissent de leurs chaînes et s’enfuient. Rick Deckard, un ancien Blade Runner, catégorie spéciale de policiers chargés de "retirer" ces replicants, accepte une nouvelle mission consistant à retrouver quatre de ces individus qui viennent de regagner la Terre après avoir volé une navette spatiale. Ces replicants sont des Nexus 6, derniers nés de la technologie développée par la Tyrell Corporation.', '1982-09-15')
;


SELECT * FROM dt_movies;

-- SESSIONS
CREATE TABLE dt_session(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_salles INT(5) NOT NULL,
    id_movies INT(10) NOT NULL,
    date DATETIME,
    FOREIGN KEY (id_salles) REFERENCES dt_salles(id),
    FOREIGN KEY (id_movies) REFERENCES dt_movies(id)
);

INSERT INTO dt_session(id_salles, id_movies, date) VALUES
    (1, 2, '2021-12-25 14:30:00'),
    (3, 2, '2021-12-25 17:30:00'),
    (4, 1, '2021-12-25 14:30:00'),
    (1, 2, '2021-12-26 10:30:00'),
    (3, 4, '2021-12-27 14:30:00'),
    (2, 2, '2021-12-27 09:45:00')
;

SELECT * FROM dt_session;

SELECT * FROM dt_session LEFT JOIN dt_salles ON dt_session.id_salles = dt_salles.id LEFT JOIN dt_movies ON dt_session.id_movies = dt_movies.id;


-- USERS
CREATE TABLE dt_users(
    user_id_uuid VARCHAR(36) NOT NULL NOT NULL UNIQUE PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(150) NOT NULL,
    birthday DATE,
    password VARCHAR(60) NOT NULL,     
    creation_date DATETIME
);

INSERT INTO dt_users(user_id_uuid, first_name, last_name, email, birthday, password, creation_date) VALUES 
    (UUID(), 'Jérémy', 'Grestom', 'j.grestom@gmail.com', '1990-06-02', '$2a$04$ZyUAvnGZvuSn3epYPoAAHuRGoR1G7ovuce1dacB1MWPD7Jq9Ho83q', NOW()),
    (UUID(), 'Florian', 'Moni', 'flo.moni@gmail.com', '1995-11-18', '$2a$12$7NnJUmJ.6AXbUnYvOBx29.9iaI6bXUUYZvl.pcfK4EokJM8w6wi9.', NOW()),
    (UUID(), 'Nathalie', 'Provin', 'nathalie.provin@yahoo.com', '1974-04-14', '$2a$12$0qultHdZzSLVGSTt3LqPWup9z3PhFiX/11claR5b1QF6fUX6YGwZK', NOW()),
    (UUID(), 'Pierrine', 'Onila', 'p.onila@hotmail.fr', '1990-06-02', '$2a$12$Nx2DH2lMTqQ6JpTFkzFHxeueQeDAPQXhDFzViSeAAn4vBfayma5Yq', NOW()),
    (UUID(), 'Karine', 'Nivel', 'karine.nivel@outlook.com', '1985-03-25', '$2a$12$ZSrRRmJO03XsrjMK6X7hzew0eZw3SDeAxFZOOix.qMQa4Iv3Kh202', NOW());

SELECT * FROM dt_users;

-- STAFF
CREATE TABLE dt_staff(
    staff_id_uuid VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    login VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(60) NOT NULL, 
    role VARCHAR(5) NOT NULL DEFAULT "staff",
    id_cinema INT(3) NOT NULL,
    creation_date DATETIME,
    FOREIGN KEY (id_cinema) REFERENCES dt_cinemalist(id)
);

INSERT INTO dt_staff(staff_id_uuid, first_name, last_name, login, password, id_cinema, creation_date) VALUES 
    (UUID(), 'Paul', 'Lewis', 'PaulLewis', '$2a$12$6H6g2WmTqwqOFAdPw/XGBeaxj3XJyR.yi2eZlgkRDIewJA0bPzoR2', 2, NOW()),
    (UUID(), 'Jack', 'Gutierrez', 'JackJJ', '$2a$12$tZQCvKVobYLKedrB6rhI2OtcGToIPh0lOglfbpf9SVD2UEclOBGya', 1, NOW()),
    (UUID(), 'Sharon', 'Richmond', 'RichSha', '$2a$12$yKuQUm584UgqrrlWO0yF4ujSlIeyGGtMXvD4X0SlqI3MODxJS4Ku.', 4, NOW()),
    (UUID(), 'Judy', 'McCary', 'JudyMc', '$2a$12$sUPqf3HSlVT97OtvRRN0m.hhS1jSeb3Zp09422hZ0CJM63QS/mzES', 1, NOW()),
    (UUID(), 'Julie', 'Nash', 'JNash', '$2a$12$2ZELOGla4UaS.IiDHFUf5.rCHQfR9ALZkw7FBeyEoFd/x4DRhz3TK', 3, NOW());


SELECT * FROM dt_staff;

SELECT * FROM dt_staff LEFT JOIN dt_cinemalist ON dt_staff.id_cinema = dt_cinemalist.id;

-- BOOKING
CREATE TABLE dt_bookings(
    booking_id_uuid VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY,
    id_session INT NOT NULL,  
    id_users CHAR(36), 
    id_staff CHAR(36), 
    FOREIGN KEY (id_session) REFERENCES dt_session(id),
    FOREIGN KEY (id_users) REFERENCES dt_users(user_id_uuid),
    FOREIGN KEY (id_staff) REFERENCES dt_staff(staff_id_uuid)
);

INSERT INTO dt_bookings(booking_id_uuid, id_session, id_users, id_staff) VALUES 
    (UUID(), 1, NULL, '71101f90-669d-11ec-a1fc-708bcd8a895a'),
    (UUID(), 1, '67a25da7-669d-11ec-a1fc-708bcd8a895a', NULL),
    (UUID(), 5, NULL, '71102111-669d-11ec-a1fc-708bcd8a895a'),
    (UUID(), 4, '67a2675d-669d-11ec-a1fc-708bcd8a895a' , NULL),
    (UUID(), 3,  NULL, '71102111-669d-11ec-a1fc-708bcd8a895a');

SELECT * FROM dt_bookings;

SELECT * FROM dt_bookings 
    LEFT JOIN dt_session ON dt_bookings.id_session = dt_session.id 
    LEFT JOIN dt_users ON dt_bookings.id_users = dt_users.user_id_uuid
    LEFT JOIN dt_staff ON dt_bookings.id_staff = dt_staff.staff_id_uuid;



-- BOOKING PRICES
CREATE TABLE dt_booking_prices(
    nb_place INT(3) NOT NULL,
    total_price INT(10) NOT NULL,
    id_prices INT(5) NOT NULL,
    id_booking CHAR(36) NOT NULL,
    FOREIGN KEY (id_prices) REFERENCES dt_prices(id),
    FOREIGN KEY (id_booking) REFERENCES dt_bookings(booking_id_uuid)
);

INSERT INTO dt_booking_prices(nb_place, total_price, id_prices, id_booking) VALUES 
    (1, 5.50, 1, '6bd24c99-669f-11ec-a1fc-708bcd8a895a'),
    (2, 12.80 ,4, '6bd24c99-669f-11ec-a1fc-708bcd8a895a'),
    (2, 14.40 ,3, '6bd25156-669f-11ec-a1fc-708bcd8a895a'),
    (2, 11 ,1, '6bd24765-669f-11ec-a1fc-708bcd8a895a'),
    (1, 7.20 ,3, '6bd24765-669f-11ec-a1fc-708bcd8a895a');

SELECT * FROM dt_booking_prices;

SELECT * FROM dt_booking_prices 
    LEFT JOIN dt_prices ON dt_booking_prices.id_prices = dt_prices.id
    LEFT JOIN dt_bookings ON dt_booking_prices.id_booking = dt_bookings.booking_id_uuid;


-- BOOKING PRICES
CREATE TABLE dt_payment(
    payment_id_uuid VARCHAR(36) NOT NULL UNIQUE PRIMARY KEY,
    id_booking VARCHAR(36) NOT NULL,
    type VARCHAR(20),
    date DATETIME, 
    FOREIGN KEY (id_booking) REFERENCES dt_booking_prices(id_booking)
);

INSERT INTO dt_payment(payment_id_uuid, id_booking, type, date) VALUES 
    (UUID(),'6bd24c99-669f-11ec-a1fc-708bcd8a895a', 'Carte Bancaire', NOW());

SELECT * FROM dt_payment;

SELECT * FROM dt_payment
    LEFT JOIN dt_booking_prices ON dt_payment.id_booking = dt_booking_prices.id_booking;


-- New User

CREATE USER 'admin_cinema'@'localhost' IDENTIFIED BY 'cinema';

SHOW GRANTS FOR 'admin_cinema'@'localhost';

GRANT INSERT ON cinema.* TO 'admin_cinema'@'localhost';

SHOW GRANTS FOR 'admin_cinema'@'localhost';


-- mysqldump -uroot -p cinema > export_**.sql