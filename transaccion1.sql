\c ludovico
DROP DATABASE pizzeria;
CREATE DATABASE pizzeria;
\c pizzeria
-- creamos la tabla pizzas
CREATE TABLE pizzas(
    id INT,
    stock INT CHECK (stock >= 0.00),
    costo DECIMAL,
    nombre VARCHAR(30),
    PRIMARY KEY (id)
);
SELECT * FROM pizzas;
-- creamos la tabla ventas
CREATE TABLE ventas(
    cliente VARCHAR(20),
    fecha DATE,
    monto DECIMAL,
    pizza INT,
    FOREIGN KEY (pizza) REFERENCES pizzas(id)
);

SELECT * FROM ventas;

INSERT INTO pizzas (id, stock, costo, nombre)
VALUES (1, 0, 12000, 'Uhlalá');

SELECT * FROM pizzas;
-- INICIAREMOS UNA TRANSACCIÓN.
BEGIN; 
INSERT INTO pizzas (id, stock, costo, nombre)
VALUES (2, 2, 15000, 'jamón a todo dar');
COMMIT;

SELECT * FROM pizzas;

BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza)
VALUES ('Dexter Gonzalez', '2020-02-02', 12000, 1);
UPDATE pizzas SET stock = stock - 1 WHERE id = 1;
COMMIT;

SELECT * FROM pizzas;
SELECT * FROM ventas;

BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza)
VALUES ('Juan Bravo', '2020-02-02', 15000, 2);

UPDATE pizzas SET stock = stock - 1 WHERE id = 2;
SAVEPOINT checkpoint;

INSERT INTO ventas (cliente, fecha, monto, pizza)
VALUES ('Utonio Ramirez', '2020-02-02', 12000, 1);

UPDATE pizzas SET stock = stock - 1 WHERE id = 1;

-- Acá recibirás un error por intentar rebajar el stock de una pizza
--cuyo stock es 0
ROLLBACK TO checkpoint;

SELECT * FROM pizzas;
SELECT * FROM ventas;

