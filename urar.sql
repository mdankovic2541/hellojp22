# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\urar.sql
drop database if exists urar;
create database urar;
use urar;

create table sat(
    sifra int not null primary key auto_increment,
    velicina varchar(50) not null,
    vrsta varchar(50) not null,
    boja varchar(50) not null,
    cijena int not null
);

create table popravak(
    vrsta varchar(50) not null,
    cijena int not null,
    trajanje int not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    dob int not null,
    spol varchar(50) not null
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    dob int not null
);

alter table sat add foreign key (cijena) references korisnik(sifra);
alter table korisnik add foreign key (dob) references sat (sifra);

alter table popravak add foreign key (cijena) references sat(sifra);
alter table popravak add foreign key (trajanje) references korisnik(sifra);
alter table popravak add foreign key (trajanje) references segrt(sifra);