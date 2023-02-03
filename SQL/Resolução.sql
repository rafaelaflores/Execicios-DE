--Criando as Tabelas--
CREATE TABLE Aluno (
    Id int,
    Nome varchar(255) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Responsavel (
    Id int,
    Nome varchar(255) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Parentesco (
    IdResponsavel int NOT NULL,
    IdAluno int NOT NULL,
    Parentesco varchar(255) NOT NULL,
    CONSTRAINT fk_IdResponsavel FOREIGN KEY(IdResponsavel) REFERENCES Responsavel(Id),
    CONSTRAINT fk_IdAluno FOREIGN KEY(IdAluno) REFERENCES Aluno(Id)
);

-- 1) Escreva comandos SQL para inserir os dados abaixo conforme o diagrama apresentado. --
INSERT INTO `aluno`(`Id`, `Nome`) VALUES ('1','Lucas')

-- a) Pablo é Pai de Lucas --
INSERT INTO `responsavel`(`Id`, `Nome`) VALUES ('1','Pablo')
INSERT INTO `parentesco`(`IdResponsavel`, `IdAluno`, `Parentesco`) VALUES ('1','1','Pai')

-- b) Brenda é Mãe de Lucas --
INSERT INTO `responsavel`(`Id`, `Nome`) VALUES ('2','Brenda')
INSERT INTO `parentesco`(`IdResponsavel`, `IdAluno`, `Parentesco`) VALUES ('2','1','Mãe')

-- 2) Escreva uma consulta SQL para retornar dados únicos conforme tabela abaixo. Caso o aluno tenha mais de dois responsáveis, traga apenas os dois primeiros responsáveis encontrados na tabela. --
SELECT Aluno.Nome as Aluno, 
(SELECT Responsavel.Nome FROM Responsavel as Responsavel INNER JOIN Parentesco as Parentesco ON Parentesco.IdResponsavel = Responsavel.Id WHERE Parentesco.IdAluno = Aluno.Id LIMIT 1) as Responsável, 
(SELECT Parentesco.Parentesco FROM Parentesco as Parentesco WHERE Parentesco.IdAluno = Aluno.Id LIMIT 1) as Parentesco, 
(SELECT Responsavel.Nome FROM Responsavel as Responsavel INNER JOIN Parentesco as Parentesco ON Parentesco.IdResponsavel = Responsavel.Id WHERE Parentesco.IdAluno = Aluno.Id LIMIT 1, 2) as Responsável,
(SELECT Parentesco.Parentesco FROM Parentesco as Parentesco WHERE Parentesco.IdAluno = Aluno.Id LIMIT 1, 2) as Parentesco 
FROM Aluno GROUP BY Aluno.Id;

-- Bônus --
SELECT Aluno.Nome as Aluno,
GROUP_CONCAT(' ', Responsavel.Nome) as Responsável, GROUP_CONCAT(' ', Parentesco.Parentesco) as Parentesco
FROM Aluno
INNER JOIN Parentesco ON Aluno.Id = Parentesco.idAluno
INNER JOIN Responsavel ON Responsavel.Id = Parentesco.idResponsavel
GROUP BY Aluno.Id
ORDER BY Aluno.Nome ASC;