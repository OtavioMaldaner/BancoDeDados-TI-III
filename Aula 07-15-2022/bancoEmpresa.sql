-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Maio-2019 às 02:28
-- Versão do servidor: 10.1.35-MariaDB
-- versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empresa`
--
CREATE DATABASE IF NOT EXISTS `empresa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `empresa`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `Dnome` varchar(25) NOT NULL,
  `Dnumero` int(11) NOT NULL,
  `Cpf_gerente` bigint(11) NOT NULL,
  `Data_inicio_gerente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`Dnome`, `Dnumero`, `Cpf_gerente`, `Data_inicio_gerente`) VALUES
('Matriz', 1, 2147483647, '1981-06-19'),
('Administração', 4, 99988777767, '1995-01-01'),
('Pesquisa', 5, 33344555587, '1988-05-22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

DROP TABLE IF EXISTS `dependente`;
CREATE TABLE `dependente` (
  `Fcpf` bigint(11) NOT NULL,
  `Nome_dependente` varchar(30) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Datanasc` date NOT NULL,
  `Parentesco` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dependente`
--

INSERT INTO `dependente` (`Fcpf`, `Nome_dependente`, `Sexo`, `Datanasc`, `Parentesco`) VALUES
(12345678966, 'Alicia', 'F', '1988-12-30', 'Filha'),
(12345678966, 'Elizabeth', 'F', '1967-05-05', 'Esposa'),
(12345678966, 'Michael', 'M', '1988-01-04', 'Filho'),
(33344555587, 'Alicia', 'F', '1986-04-05', 'Filha'),
(33344555587, 'Janaína', 'F', '1958-05-03', 'Esposa'),
(33344555587, 'Tiago', 'M', '1983-10-25', 'Filho'),
(98765432168, 'Antonio', 'M', '1942-02-28', 'Marido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `Pnome` varchar(20) NOT NULL,
  `Unome` varchar(20) NOT NULL,
  `Cpf` bigint(11) NOT NULL,
  `Datanasc` date NOT NULL,
  `Endereco` varchar(50) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(10,0) NOT NULL,
  `Cpf_supervisor` bigint(11) DEFAULT NULL,
  `Dnr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`Pnome`, `Unome`, `Cpf`, `Datanasc`, `Endereco`, `Sexo`, `Salario`, `Cpf_supervisor`, `Dnr`) VALUES
('João', 'Silva', 12345678966, '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', '30000', 33344555587, 5),
('Fernando', 'Wong', 33344555587, '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', '40000', 88866555576, 5),
('Joice', 'Leite', 45345345376, '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', '25000', 33344555587, 5),
('Ronaldo', 'Lima', 66688444476, '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', '38000', 33344555587, 5),
('Jorge', 'Brito', 88866555576, '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', '55000', NULL, 1),
('Jennifer', 'Souza', 98765432168, '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', '43000', 88866555576, 4),
('André', 'Pereira', 98798798733, '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', '25000', 98765432168, 4),
('Alice', 'Zelaya', 99988777767, '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', '25000', 98765432168, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `localizacao_dep`
--

DROP TABLE IF EXISTS `localizacao_dep`;
CREATE TABLE `localizacao_dep` (
  `Dnumero` int(11) NOT NULL,
  `Dlocal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `localizacao_dep`
--

INSERT INTO `localizacao_dep` (`Dnumero`, `Dlocal`) VALUES
(1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Itu'),
(5, 'Santo André'),
(5, 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

DROP TABLE IF EXISTS `projeto`;
CREATE TABLE `projeto` (
  `Projnome` varchar(20) NOT NULL,
  `Projnumero` int(11) NOT NULL,
  `Projlocal` varchar(20) NOT NULL,
  `Dnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`Projnome`, `Projnumero`, `Projlocal`, `Dnum`) VALUES
('ProdutoX', 1, 'Santo André', 5),
('ProdutoY', 2, 'Itu', 5),
('ProdutoZ', 3, 'São Paulo', 5),
('Informatização', 10, 'Mauá', 4),
('Reorganização', 20, 'São Paulo', 1),
('Novosbenefícios', 30, 'Mauá', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalha_em`
--

DROP TABLE IF EXISTS `trabalha_em`;
CREATE TABLE `trabalha_em` (
  `Fcpf` bigint(20) NOT NULL,
  `Pnr` int(11) NOT NULL,
  `Horas` decimal(10,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `trabalha_em`
--

INSERT INTO `trabalha_em` (`Fcpf`, `Pnr`, `Horas`) VALUES
(12345678966, 1, '32.5'),
(12345678966, 2, '7.5'),
(33344555587, 2, '10.0'),
(33344555587, 3, '10.0'),
(33344555587, 10, '10.0'),
(33344555587, 20, '10.0'),
(45345345376, 1, '20.0'),
(45345345376, 2, '20.0'),
(66688444476, 3, '40.0'),
(88866555576, 20, NULL),
(98765432168, 20, '15.0'),
(98765432168, 30, '20.0'),
(98798798733, 10, '35.0'),
(98798798733, 30, '5.0'),
(99988777767, 10, '10.0'),
(99988777767, 30, '30.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Dnumero`),
  ADD KEY `Cpf_gerente` (`Cpf_gerente`);

--
-- Indexes for table `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`Fcpf`,`Nome_dependente`),
  ADD KEY `Fcpf` (`Fcpf`),
  ADD KEY `Fcpf_2` (`Fcpf`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`Cpf`),
  ADD KEY `Dnr` (`Dnr`);

--
-- Indexes for table `localizacao_dep`
--
ALTER TABLE `localizacao_dep`
  ADD PRIMARY KEY (`Dnumero`,`Dlocal`);

--
-- Indexes for table `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`Projnumero`),
  ADD KEY `Dnum` (`Dnum`);

--
-- Indexes for table `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD PRIMARY KEY (`Fcpf`,`Pnr`),
  ADD KEY `Pnr` (`Pnr`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`Fcpf`) REFERENCES `funcionario` (`Cpf`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`Dnr`) REFERENCES `departamento` (`Dnumero`);

--
-- Limitadores para a tabela `localizacao_dep`
--
ALTER TABLE `localizacao_dep`
  ADD CONSTRAINT `localizacao_dep_ibfk_1` FOREIGN KEY (`Dnumero`) REFERENCES `departamento` (`Dnumero`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `departamento` (`Dnumero`);

--
-- Limitadores para a tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`Fcpf`) REFERENCES `funcionario` (`Cpf`),
  ADD CONSTRAINT `trabalha_em_ibfk_2` FOREIGN KEY (`Pnr`) REFERENCES `projeto` (`Projnumero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
