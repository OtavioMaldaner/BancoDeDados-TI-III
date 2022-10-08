-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Out-2022 às 12:08
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empresa`
--
CREATE DATABASE IF NOT EXISTS `empresa2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `empresa2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

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
('Matriz', 1, 12345678966, '1981-06-19'),
('Administração', 4, 99988777767, '1995-01-01'),
('Pesquisa', 5, 33344555587, '1988-05-22'),
('Vendas', 22, 12345678966, '2022-07-04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

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
-- Estrutura da tabela `folha_ponto`
--

CREATE TABLE `folha_ponto` (
  `cpf` bigint(20) NOT NULL,
  `entrada` datetime NOT NULL,
  `saida` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `folha_ponto`
--

INSERT INTO `folha_ponto` (`cpf`, `entrada`, `saida`) VALUES
(99988777767, '2022-08-01 08:00:00', '2022-08-01 17:03:00'),
(99988777767, '2022-08-02 08:00:00', '2022-08-02 17:03:00'),
(99988777767, '2022-08-03 08:00:00', '2022-08-03 17:03:00'),
(99988777767, '2022-08-04 08:00:00', '2022-08-04 16:00:00'),
(99988777767, '2022-08-05 08:00:00', '2022-08-05 21:45:00'),
(99988777767, '2022-08-06 08:10:00', '2022-08-06 17:03:00'),
(99988777767, '2022-08-07 08:00:00', '2022-08-07 19:10:00'),
(99988777767, '2022-08-08 08:00:00', '2022-08-08 17:03:00'),
(99988777767, '2022-08-09 08:30:00', '2022-08-09 18:03:00'),
(99988777767, '2022-08-10 08:00:00', '2022-08-10 17:03:00'),
(66688444476, '2022-08-01 08:00:00', '2022-08-01 17:15:00'),
(66688444476, '2022-08-02 08:30:00', '2022-08-02 17:15:00'),
(66688444476, '2022-08-03 08:00:00', '2022-08-03 17:15:00'),
(66688444476, '2022-08-04 08:00:00', '2022-08-04 16:00:00'),
(66688444476, '2022-08-05 08:45:00', '2022-08-05 21:45:00'),
(66688444476, '2022-08-06 08:10:00', '2022-08-06 17:15:00'),
(66688444476, '2022-08-07 08:00:00', '2022-08-07 19:10:00'),
(66688444476, '2022-08-08 08:00:00', '2022-08-08 17:15:00'),
(66688444476, '2022-08-09 08:30:00', '2022-08-09 18:03:00'),
(66688444476, '2022-08-10 07:45:00', '2022-08-10 17:15:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `Pnome` varchar(20) NOT NULL,
  `Unome` varchar(20) NOT NULL,
  `Cpf` bigint(11) NOT NULL,
  `Datanasc` date NOT NULL,
  `Endereco` varchar(50) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(10,0) NOT NULL,
  `Cpf_supervisor` bigint(11) DEFAULT NULL,
  `Dnr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`Pnome`, `Unome`, `Cpf`, `Datanasc`, `Endereco`, `Sexo`, `Salario`, `Cpf_supervisor`, `Dnr`) VALUES
('Marcelo', 'Lima Bastos', 123123, '1945-09-06', 'Feliz', 'M', '25000', NULL, NULL),
('João', 'Silva dos Santos', 12345678966, '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', '30000', 33344555587, 5),
('Fernando', 'Wong Xu', 33344555587, '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', '40000', 88866555576, 5),
('Joice', 'Leite Silva', 45345345376, '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', '25000', 33344555587, 5),
('Ronaldo', 'Lima Duarte', 66688444476, '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', '38000', 33344555587, 5),
('Jorge', 'Brito Macedo', 88866555576, '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', '55000', NULL, 1),
('Jennifer', 'Souza ', 98765432168, '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', '43000', 88866555576, 4),
('André', 'Pereira', 98798798733, '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', '35000', 98765432168, 4),
('Alice', 'Zelaya', 99988777767, '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', '25000', 98765432168, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios_projetos`
--

CREATE TABLE `funcionarios_projetos` (
  `funcionario` varchar(30) NOT NULL,
  `num_projetos` int(11) DEFAULT NULL,
  `num_horas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionarios_projetos`
--

INSERT INTO `funcionarios_projetos` (`funcionario`, `num_projetos`, `num_horas`) VALUES
('Alice Zelaya', 2, 40),
('André Pereira', 2, 40),
('Fernando Wong', 4, 40),
('Jennifer Souza', 2, 35),
('João Silva', 2, 40),
('Joice Leite', 2, 40),
('Jorge Brito', 1, NULL),
('Ronaldo Lima', 1, 40);

-- --------------------------------------------------------

--
-- Estrutura da tabela `localizacao_dep`
--

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
('Novosbenefícios', 30, 'Mauá', 4),
('Proj_Q3Av2', 33, 'Feliz', 22);

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalha_em`
--

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
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Dnumero`),
  ADD KEY `Cpf_gerente` (`Cpf_gerente`);

--
-- Índices para tabela `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`Fcpf`,`Nome_dependente`),
  ADD KEY `Fcpf` (`Fcpf`),
  ADD KEY `Fcpf_2` (`Fcpf`);

--
-- Índices para tabela `folha_ponto`
--
ALTER TABLE `folha_ponto`
  ADD KEY `cpf` (`cpf`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`Cpf`),
  ADD KEY `Dnr` (`Dnr`);

--
-- Índices para tabela `localizacao_dep`
--
ALTER TABLE `localizacao_dep`
  ADD PRIMARY KEY (`Dnumero`,`Dlocal`);

--
-- Índices para tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`Projnumero`),
  ADD KEY `Dnum` (`Dnum`);

--
-- Índices para tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD PRIMARY KEY (`Fcpf`,`Pnr`),
  ADD KEY `Pnr` (`Pnr`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`Fcpf`) REFERENCES `funcionario` (`Cpf`);

--
-- Limitadores para a tabela `folha_ponto`
--
ALTER TABLE `folha_ponto`
  ADD CONSTRAINT `folha_ponto_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `funcionario` (`Cpf`);

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
