# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\doktorska_ord.sql
drop database if exists doktorska_ord;
create database doktorska_ord;
use doktorska_ord;

create table doktor(
    ime varchar(50) not null,
    prezime varchar(50) not null,
    strucna_sprema varchar(50) not null,
    sifra int not null primary key auto_increment,
    oib char(11) not null,
    placa decimal(18,2)
);

create table pacijent(
     sifra int not null primary key auto_increment,
     ime varchar(50) not null,
    prezime varchar(50) not null,
    dob int not null,
    spol varchar(50) not null,
    bolest varchar(50) not null
);


create table med_sestra(
    sifra int not null primary key auto_increment,
     ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    strucna_sprema varchar(50) not null
);

create table lijecenje(
    broj int not null primary key,
    trajanje int not null,
    vrsta varchar(50) not null,
    opis text
);

alter table pacijent add foreign key (dob) references doktor (sifra);

alter table med_sestra add foreign key (sifra) references doktor (sifra);
alter table med_sestra add foreign key (sifra) references lijecenje(broj);

alter table lijecenje add foreign key (trajanje) references med_sestra(sifra);
alter table lijecenje add foreign key (trajanje) references pacijent (sifra);