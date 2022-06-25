CREATE DATABASE `NBA`;

USE `NBA`;

-- criação de tabelas / modelagem

CREATE TABLE `jogos` (
    `jogo_ID` INT NOT NULL,
    `casa_ID` INT NOT NULL,
    `pontos_casa` INT,
    `LANC_LIV_PCT_CASA` DOUBLE,
    `ASSISTS_CASA` INT,
    `REBOTES_CASA` INT,
    `VISITANTE_ID` INT NOT NULL,
    `PONTOS_VISIT` INT,
    `LANC_LIV_PCT_VISIT` double,
    `ASSISTS_VISIT` int,
    `REBOTES_VISIT` int,
    `TIME_VENCEDOR` varchar(50),
    PRIMARY KEY (jogo_id)
)
;

CREATE TABLE `times` (
    `TIME_ID` INT not null,
    `NOME_TIME` VARCHAR(50),
    `APELIDO` VARCHAR(50),
    `ANO_FUNDACAO` YEAR,
    `ARENA` VARCHAR(50),
    `DONO_TIME` VARCHAR(50),
    PRIMARY KEY (TIME_ID)
)
;

CREATE TABLE `classificacao` (
    `TIME_ID` INT not null,
    `TEMPORADA` YEAR,
    `CONFERENCIA` VARCHAR(5),
    `TIME` VARCHAR(50),
    `JG` INT,
    `V` INT,
    `D` INT,
    `V_PCT` DOUBLE,
    FOREIGN KEY (TIME_ID)
        REFERENCES times (TIME_ID)
)
;

CREATE TABLE `jogadores` (
    `JOGADOR_ID` INT NOT NULL,
    `TIME_ID` INT NOT NULL,
    `JOGADOR_NOME` VARCHAR(50) NOT NULL,
    PRIMARY KEY (jogador_ID),
    FOREIGN KEY (time_ID)
        REFERENCES times (Time_ID)
)
;

CREATE TABLE `detalhes_jogos` (
    `JOGO_ID` INT NOT NULL,
    `TIME_ID` INT NOT NULL,
    `TIME_CIDADE` VARCHAR(20) NOT NULL,
    `JOGADOR_ID` INT NOT NULL,
    `JOGADOR_NOME` VARCHAR(50) NOT NULL,
    `REBOTE` INT,
    `ASSISTS` INT,
    `ROUBO` INT,
    `BLOQUEIO` INT,
    `PONTOS` INT,
    FOREIGN KEY (jogo_id)
        REFERENCES jogos (jogo_id),
    FOREIGN KEY (time_id)
        REFERENCES times (time_id),
    FOREIGN KEY (jogador_id)
        REFERENCES jogadores (jogador_id)
)
;
