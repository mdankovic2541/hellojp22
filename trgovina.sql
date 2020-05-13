# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\trgovina.sql
drop database if exists trgovina;
create database trgovina;
use trgovina;

create table racun(
    sifra int not null primary key auto_increment,
    datum datetime,
    rednibroj int not null,
    operator varchar(50) not null,
);

create table stavka(
racun int not null primary key,
proizvod varchar(50) not null,
kolicina int not null
);

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2) not null
);

create table operater(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null
);

alter table stavka add foreign key (racun) references proizvod(sifra);

alter table stavka add foreign key (kolicina) references racun(sifra); 

alter table racun add foreign key (rednibroj) references operator(sifra);