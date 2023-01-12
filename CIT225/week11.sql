CREATE SCHEMA transaction;
USE transaction;

START TRANSACTION;

CREATE TABLE transaction (txn_id int PRIMARY KEY AUTO_INCREMENT NOT NULL, txn_date datetime DEFAULT NULL, account_id int DEFAULT NULL,txn_type_cd varchar(1) NOT NULL, amount double DEFAULT NULL);

-- DROP TABLE transaction;

INSERT INTO transaction 
 (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
 (1001, now(), 123, 'C', 500);
INSERT INTO transaction 
 (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
 (1002, now(), 789, 'C', 175);

CREATE TABLE account(account_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, avail_balance double NOT NULL, last_activity_date datetime NOT NULL);
-- DROP TABLE account;
-- SELECT * FROM account;

INSERT INTO account (account_id, avail_balance, last_activity_date)
VALUES (123, 500, now());
INSERT INTO account (account_id, avail_balance, last_activity_date)
VALUES (789, 75, now());

UPDATE account
SET avail_balance = avail_balance - 50,
  last_activity_date = now()
WHERE account_id = 123;

INSERT INTO transaction 
 (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
 (1003, now(), 123, 'D', 50);

UPDATE account
SET avail_balance = avail_balance + 50,
last_activity_date = now()
WHERE account_id = 789;

INSERT INTO transaction
 (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES
 (1004, now(), 789, 'C', 50);

COMMIT;

SELECT * FROM transaction;