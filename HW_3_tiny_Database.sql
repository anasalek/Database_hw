CREATE database Biblioteque;
USE Biblioteque;
# таблица с ароматами
CREATE table Perfumes (
 ID INT,
 Naming VARCHAR(50)
 );
 INSERT INTO Perfumes (ID, Naming) VALUES
 ('1', 'Fleur Narcotique'),
 ('2', 'Lost Cherry'),
 ('3', 'Sugar Daddy'),
 ('4', 'Chocolate Greedy'),
 ('5', 'Pure Gold'),
 ('6', 'Lucifero');

 SELECT * FROM Perfumes;

 # таблица с брендами
 CREATE TABLE Brands (
 ID INT,
 Brand VARCHAR(50)
 );
 
 INSERT INTO Brands (ID, Brand) VALUES
 ('1', 'Ex Nihilo'),
 ('2', 'Tom Ford'),
 ('3', 'Antoino Maretti'),
 ('4', 'Montale'),
 ('5', 'Montale'),
 ('6', 'Antonio Maretti');
 
 SELECT * FROM Brands;
# как я поняла, надо сделать третью таблицу, чтобы связать эти две

CREATE TABLE PerBrand (
PerfumeID INT,
BrandID INT
);
INSERT INTO PerBrand (PerfumeID, BrandID) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,4),
(6,3);

# создаю ключи
ALTER TABLE PerBrand ADD PRIMARY KEY (PerfumeID, BrandID);
ALTER TABLE Perfumes ADD PRIMARY KEY (ID);
ALTER TABLE Brands ADD PRIMARY KEY (ID);
ALTER TABLE PerBrand ADD FOREIGN KEY (PerfumeID) REFERENCES Perfumes(ID), ADD FOREIGN KEY (BrandID) REFERENCES Brands(ID);

# нам говорили соединить без join, но так не осуществить ту схему таблиц, которую я сделала.

SELECT p.Naming AS PerfumeName
FROM Perfumes p
JOIN perbrand pb ON p.ID = pb.PerfumeID
JOIN Brands b ON pb.BrandID = b.ID
WHERE b.Brand = 'Montale';
 