# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\taksi.sql
drop database if exists taksi;
create database taksi;
use taksi;

create table vozilo(
    sifra int not null primary key auto_increment,
    marka varchar(50) not null,
    boja varchar(50) not null,
    tablica varchar(20) not null
);

create table voznja(
	vozilo int not null,
	vozac int not null,
	putnik int not null,
    broj int not null,
    trajanje int not null,
    opis text
);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    dob int not null,
    spol varchar(50)
);

create table vozac(
    sifra int not null primary key auto_increment,
    dob int not null,
    ime varchar(50) not null,
    spol varchar(50)
);

alter table voznja add foreign key (vozac) references vozac(sifra);
alter table voznja add foreign key(putnik) references putnik(sifra);
alter table voznja add foreign key (vozilo) references vozilo(sifra);

select * from vozac;

insert into vozac(sifra,dob,ime,spol)values
(null,24,'Ivan','M'),
(null,22,'Marko','M'),
(null,24,'Terezija','Ž');

select *from putnik;
insert into putnik(sifra,ime,prezime,dob,spol)values
(null,'Petar','Ivić',24,'M'),
(null,'Mitar','Mirić',22,'M'),
(null,'Tena','Tekić',24,'Ž');

select * from vozilo;

insert into vozilo(sifra,marka,boja,tabLica)values
(null,'Dacia','Siva','OS 923 GD'),
(null,'BMW','Plava','SB 148 HJ'),
(null,'Audi','Crni','ZG 390 AL');

select * from voznja;

insert into voznja(vozilo,vozac,putnik,broj,trajanje,opis)values
(1,1,1,28,7,'Kolodvor - Stan'),
(2,2,2,36,10,'Stan- Bolnica'),
(3,3,3,109,15,'Škola - Stan');

update putnik set ime = 'Matej' where sifra = 1;

# delete mi ne radi
# delete from putnik where sifra =2;
# delete from vozilo where sifra = 2;
# delete from vozac where sifra=2;
# delete from voznja where sifra = 2;