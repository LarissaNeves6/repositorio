-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Set-2023 às 00:19
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `herpetarium`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cards`
--

CREATE TABLE `cards` (
  `cod_card` int(11) NOT NULL,
  `info` text NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cards`
--

INSERT INTO `cards` (`cod_card`, `info`, `titulo`, `tipo`) VALUES
(1, 'Conheça a fascinante Piton Bola (Python regius), uma serpente originária da África Central, conhecida por sua coloração vibrante e padrões únicos.', 'Descubra a Piton Bola', NULL),
(2, 'A Piton Bola é uma exímia caçadora, alimentando-se principalmente de pequenos mamíferos e pássaros em seu habitat natural.', 'Habilidades de Caça', NULL),
(3, 'Com temperamento geralmente dócil, a Piton Bola é uma ótima opção para iniciantes em répteis e pode se tornar um pet exótico e amigável.', 'Temperamento Amigável', NULL),
(4, 'Em cativeiro, a Piton Bola pode viver, em média, entre 20 a 30 anos, proporcionando uma longa convivência com seus tutores.', 'Expectativa de Vida', NULL),
(5, 'As Pitons Bolas geralmente são bem tolerantes ao manuseio frequente, o que permite interações mais próximas com seus donos.', 'Tolerância ao Manuseio', NULL),
(6, 'Na natureza, as Pitons Bolas preferem viver em áreas secas, como savanas e florestas abertas, onde se camuflam habilmente para caçar suas presas.', 'Habitat Natural', NULL),
(7, 'As Pitons Bolas são serpentes ovíparas e depositam de 3 a 11 ovos em cada ninhada durante o período de reprodução.', 'Reprodução e Ovos', NULL),
(8, 'Quando se sentem ameaçadas, as Pitons Bolas têm o hábito de enrolar-se em uma bola, uma estratégia de autodefesa para proteger-se de predadores.', 'Comportamento de Autodefesa', NULL),
(9, 'Nas Pitons Bolas, é possível observar um dimorfismo sexual, sendo que as fêmeas geralmente são maiores que os machos.', 'Dimorfismo Sexual', NULL),
(10, 'Embora não estejam ameaçadas, a destruição do habitat é uma preocupação para a conservação das Pitons Bolas e de outras espécies.', 'Conservação e Preocupações', NULL),
(11, 'Além de sua beleza e temperamento amigável, a Piton Bola possui um órgão sensorial especial chamado \"fenda termossensorial\", que a ajuda a detectar calor ao seu redor.', 'Curiosidade', NULL),
(12, 'Para manter uma Piton Bola saudável, é necessário fornecer um ambiente aquecido e limpo, além de uma fonte de água fresca regular.', 'Cuidados Essenciais', NULL),
(13, 'As Pitons Bolas são animais noturnos, preferindo caçar e se mover durante a noite, o que as torna ainda mais fascinantes para os amantes de répteis.', 'Vida Noturna da Piton Bola', NULL),
(14, 'Caso decida adquirir uma Piton Bola, lembre-se de que soltá-la na natureza pode causar desequilíbrios no ecossistema. A soltura irresponsável não é recomendada!', 'A Soltura Responsável', NULL),
(15, 'A Piton Bola apresenta uma grande variedade de cores e padrões, tornando-a uma das serpentes mais atrativas e diversificadas do mundo dos répteis.', 'Piton Bola e suas Cores', NULL),
(16, 'Como qualquer animal de estimação, a Piton Bola precisa de tempo para se adaptar ao novo ambiente e aos donos. Respeitar seu ritmo é essencial para construir uma relação saudável', 'Respeitando Seu Ritmo', NULL),
(17, 'Através de uma abordagem calma e paciente, você pode conquistar a confiança da Piton Bola e estabelecer uma conexão especial com esse réptil incrível.', 'Conquiste sua Confiança', NULL),
(18, 'Uma característica fascinante das Pitons Bolas é a troca periódica de pele, um processo que permite a renovação e crescimento saudável de sua epiderme.', 'O Encanto da Mudança de Pele', NULL),
(19, 'A nutrição adequada é fundamental para a saúde da Piton Bola. Consulte um especialista para garantir uma dieta balanceada e saudável para seu pet.', 'A Importância da Alimentação Balanceada', NULL),
(20, 'Como todos os animais de estimação, as Pitons Bolas também precisam de cuidados veterinários regulares para garantir sua saúde e bem-estar.', 'Visitas ao Veterinário', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobras`
--

CREATE TABLE `cobras` (
  `codigo` int(11) NOT NULL,
  `cor` int(11) NOT NULL,
  `fome` int(11) NOT NULL,
  `sujeira` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cobras`
--

INSERT INTO `cobras` (`codigo`, `cor`, `fome`, `sujeira`) VALUES
(1, 1, 1, 100),
(2, 1, 100, 100),
(3, 1, 100, 100),
(4, 1, 100, 100),
(5, 1, 100, 100),
(6, 1, 100, 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores`
--

CREATE TABLE `jogadores` (
  `codigo` int(11) NOT NULL,
  `save` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jogadores`
--

INSERT INTO `jogadores` (`codigo`, `save`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `save`
--

CREATE TABLE `save` (
  `cod_jog` int(11) NOT NULL,
  `cod_cob` int(11) NOT NULL,
  `data_save` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `save`
--

INSERT INTO `save` (`cod_jog`, `cod_cob`, `data_save`) VALUES
(1, 1, '2023-07-20 00:24:20'),
(1, 2, '2023-07-20 00:24:20'),
(2, 1, '2023-09-22 04:43:14'),
(2, 2, '2023-09-22 05:03:46');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`cod_card`);

--
-- Índices para tabela `cobras`
--
ALTER TABLE `cobras`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `save`
--
ALTER TABLE `save`
  ADD PRIMARY KEY (`cod_jog`,`cod_cob`),
  ADD KEY `fk_cod_cob` (`cod_cob`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cards`
--
ALTER TABLE `cards`
  MODIFY `cod_card` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `cobras`
--
ALTER TABLE `cobras`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `jogadores`
--
ALTER TABLE `jogadores`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `save`
--
ALTER TABLE `save`
  ADD CONSTRAINT `fk_cod_cob` FOREIGN KEY (`cod_cob`) REFERENCES `cobras` (`codigo`),
  ADD CONSTRAINT `fk_cod_job` FOREIGN KEY (`cod_jog`) REFERENCES `jogadores` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
