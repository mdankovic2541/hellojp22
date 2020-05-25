drop database if exists taksisluzba;
create database taksisluzba;
use taksisluzba;

create table vozilo(
sifra int not null primary key auto_increment,
naziv varchar(40) not null,
boja varchar(40) not null,
tablica varchar(20) not null
);

create table vozac(
sifra int not null primary key auto_increment,
ime varchar(30) not null,
prezime varchar(30) not null,
dob int not null,
spol varchar(20) not null,
vozilo int
);

create table voznja(
sifra int not null primary key auto_increment,
vozac int not null,
broj_putnika int not null,
trajanje int not null,
cijena int not null,
odrediste varchar(50) not null,
polaziste varchar(50) not null
);

alter table vozac add foreign key (vozilo) references vozilo(sifra);

alter table voznja add foreign key (vozac) references vozac(sifra);

select * from vozilo;
insert into vozilo(sifra,naziv,boja,tablica)values 
(null,'BMW','SIVA','OS-934-GR'),
(null,'AUDI','CRNA','OS-234-OP'),
(null,'MERCEDES','CRVENA','SB-481-GG');

select * from vozac;
insert into vozac(sifra,ime,prezime,dob,spol,vozilo)values
(null,'Marko','Markić',21,'M',1),
(null,'Ivan','Ivić',27,'M',2),
(null,'Petra','Perić',25,'Z',3);

select * from voznja;
insert into voznja(sifra,vozac,broj_putnika,trajanje,cijena,odrediste,polaziste)values
(null,1,2,8,30,'Bolnica','Stan'),
(null,1,2,8,30,'Kolodvor','Stan'),
(null,1,2,8,30,'FERIT','Kolodvor');



