# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\vrtic.sql
drop database if exists vrtic;
create database vrtic;
use vrtic;

create table skupina(
    sifra int not null primary key auto_increment,
    brojucenika int not null,
    naziv varchar(50) not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    spol char(1) not null,
    skupina int not null,
    dob int not null
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    dob int not null,
    email varchar(50) not null,
    oib char(11),
    ugovor varchar(50),
    skupina int not null,
    placa int
);
create table strucnasprema(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    odgajateljica int not null
);

create table vrtic(
    sifra int not null primary key auto_increment,
    skupina int not null,
    dijete int not null,
    odgajateljica int not null,
    strucnasprema int not null
);

alter table vrtic add foreign key (skupina) references skupina(sifra);
alter table vrtic add foreign key (odgajateljica) references odgajateljica(sifra);
alter table vrtic add foreign key (dijete) references dijete(sifra);
alter table vrtic add foreign key (strucnasprema) references strucnasprema(sifra);

show tables;

select * from skupina;

insert into skupina (sifra, brojucenika, naziv)
values
(null, 17, 'Jaslice'),
(null, 20, 'Vrtic'),
(null, 25, 'Predskola');

select * from dijete;

insert into dijete(sifra, ime, prezime, spol,skupina, dob)values
(null, 'Marko', 'Danković', 'm', 1, 2),
(null, 'Ana', 'Anic', 'z', 1, 2),
(null, 'Marta', 'Martic', 'z', 2, 3),
(null, 'Petar', 'Peric', 'm', 2, 3),
(null, 'Ivan', 'Ivic', 'z', 3, 5),
(null, 'Mirna', 'Miric', 'm', 3, 6);

select * from odgajateljica;

insert into odgajateljica (sifra, ime, prezime, dob, email, oib, ugovor, skupina, placa)values
(null, 'Ivana', 'Štivić', 23, 'ivana.stivic@gmail.com', '98765432101', null, 1, 5500),
(null, 'Andrea', 'Casino', 25, 'andrea.casino@gmail.com', '12345678910', null, 2, 5500),
(null, 'Natalija', 'Gerkhan', 28, 'natalija.gerkhan@gmail.com', '67977501345', null, 3, 5500);

select * from strucnasprema;

insert into strucnasprema (sifra, naziv, odgajateljica)values
(null, 'Srednja škola', 1),
(null, 'Srednja škola', 2),
(null, 'Faks 5 godina', 3);

select * from vrtic;

insert into vrtic(sifra, skupina, dijete , odgajateljica , strucnasprema )values
(null, 1, 1, 1, 1),
(null, 1, 2, 1, 1),
(null, 2, 3, 2, 2),
(null, 2, 4, 2, 2),
(null, 3, 5, 3, 3),
(null, 3, 6, 3, 3);


update skupina set brojucenika = 22 where sifra = 1;

update strucnasprema set naziv = 'Faks 3 godine' where sifra = 2;

update odgajateljica set ime = 'Kristina' where sifra = 1;