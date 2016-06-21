--1
CREATE TABLE klient
(
customerID INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(25),
surname VARCHAR(35),
addr_street VARCHAR(45),
addr_zip CHAR(5),
addr_city VARCHAR(14),
login VARCHAR(14),
password VARCHAR(12)
);

CREATE TABLE zamowienia
(
orderID INTEGER NOT NULL PRIMARY KEY,
IDcstomer INTEGER,
crDATE DATE
);

ALTER TABLE zamowienia
ADD FOREIGN KEY (IDcstomer)
REFERENCES klient (customerID);

CREATE TABLE pozycja
(
IDproduct INTEGER ,
IDorder INTEGER,
quantity INTEGER
);

CREATE TABLE produkt
(
productID INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(35),
price_net FLOAT,
price_gross FLOAT,
description CLOB
);

ALTER TABLE pozycja
ADD FOREIGN KEY (IDproduct)
REFERENCES produkt (productID);

ALTER TABLE pozycja
ADD FOREIGN KEY (IDorder)
REFERENCES klient (customerID);

--2

  --1 
  ALTER TABLE klient ADD e_mail VARCHAR(30);

  --2
  ALTER TABLE klient RENAME COLUMN addr_zip TO addr_postalcode;
  ALTER TABLE klient MODIFY addr_postalcode VARCHAR(7);

  --3
  ALTER TABLE zamowienia MODIFY crdate VARCHAR(30);

  --4
  ALTER TABLE zamowienia ADD data_godzina TIMESTAMP;

  --5
  ALTER TABLE zamowienia ADD info VARCHAR(20);
  --trzeba utworzyæ now¹ kolumnê ktora przechowujê t¹ informacjê 
  
  --6
  ALTER TABLE produkt ADD vVAT FLOAT DEFAULT 1;
  UPDATE produkt SET price_gross=VAT*price_net;

  --7
  CREATE INDEX klientid ON klient (name, login, e_mail ASC);
  
  --8
  UNIQUE
 
  ALTER TABLE klient MODIFY login VARCHAR(30) UNIQUE; 