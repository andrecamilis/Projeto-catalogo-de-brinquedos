# <h1>Projeto-catalogo-de-brinquedos / Project Cadastring Toys</h1>

Project devolep in Java 
 <H2>Autores / Authors </H2>
👤 Rafael Saes Palaria</br>
👤 Rafael Silva Amorim</br>
👤 Ryan Soyza Pires</br>
👤 André Vinícius de Siqueira Camilis</br>

 <H2>Descrição / Description </H2>
 Este projeto foi desenvolvido para um trabalho de faculdade, em que tivemos que cadastrar brinquedos
 </br>
 This project has been done for a college assignment, and we to do a registration toys 


 <H2>Banco de Dados / Database </H2>
 create database if not exists catalogo;</br>

CREATE TABLE brinquedo (
    idBrinquedo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,</br>
    Nome VARCHAR(30) NOT NULL,</br>
    Preço FLOAT(30) NOT NULL,</br>
    Codigo INT NOT NULL UNIQUE,</br>
    categoria varchar (50) NOT NULL,</br>
    Descricao Varchar(100),</br>
    foto longblob NOT NULL</br>
)ENGINE=InnoDB;</br>
drop table if exists catalogo.brinquedo;

 <H2>Programas Usados / Program requeriment</H2>
 Eclipse IDE Java EE</br>
 WAMP SERVER </br>
 Apache Tomcat</br>
 MySQL Workbeanch


