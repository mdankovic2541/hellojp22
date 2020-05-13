# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\zivotinje.sql
drop database if exists zivotinje;
create database zivotinje;
use zivotinje;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null,
    spol varchar(50) not null,
    dob varchar(50) not null
);

create table sticenik(
     sifra int not null primary key auto_increment,
     vrsta varchar(50) not null,
     boja varchar(50) not null,
     opis text,
     dob int not null,
     spol varchar(50) not null
);

create table prostor(
    duzina int not null primary key,
    visina int not null,
    sirina int not null,
    opis text,
    namjena varchar(50)
);

create table zivotinja(
    dob int not null,
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null,
    boja varchar(50) not null,
    opis text,
    spol varchar(50) not null
);

alter table sticenik add foreign key (sifra) references osoba(sifra);
alter table zivotinja add foreign key (sifra) references osoba (sifra);