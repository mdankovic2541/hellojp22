# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\postolar.sql
drop database if exists postolar;
create database postolar;
use postolar;

create table obuca(
     sifra int not null primary key auto_increment,
     vrsta varchar(50) not null,
     boja varchar(50) not null,
     velicina int not null
);

create table korisnik(
     sifra int not null primary key auto_increment,
     ime varchar(50) not null,
     prezime varchar(50) not null,
    spol varchar(50) not null,
    dob int not null
);

create table popravak(
	sifra int not null primary key auto_increment,
	korisnik int not null,
	obuca int not null,
	segrt int null,
    trajanje int not null,
    cijena decimal(18,2) not null,
    vrsta varchar(50) not null
);

create table segrt(
     sifra int not null primary key auto_increment,
     ime varchar(50) not null,
     prezime varchar(50) not null,
     dob int not null
);

alter table popravak add foreign key (segrt) references segrt (sifra);
alter table popravak add foreign key (obuca) references obuca (sifra);
alter table popravak add foreign key (korisnik) references korisnik(sifra);


select *from korisnik;
insert into korisnik(sifra,ime,prezime,spol,dob)values
(null,'Marko','Danković','M',19),
(null,'Matej','Živić','M',24),
(null,'Iva','Bičić','Ž',15);

select *from segrt;
insert into segrt(sifra,ime,prezime,dob)values
(null,'Ivan','Ivić',19),
(null,'Petra','Perić',24),
(null,'Andrej','Kikić',27);


select *from obuca;
insert into obuca(sifra,vrsta,boja,velicina)values
(null,'Cipele','Crna',42),
(null,'Cipele','Smeđe',39),
(null,'Cipele','Sive',45);

select *from popravak;
insert into popravak(sifra,korisnik,obuca,segrt,trajanje,cijena,vrsta)values
(null,1,2,3,120,150,'Mijenjanje Džona'),
(null,2,1,3,10,20,'Umetanje vezica'),
(null,3,3,1,60,80,'Lakiranje');


update segrt set ime = 'Casio' where sifra = 3;

delete from popravak where sifra = 2;
delete from segrt where sifra = 2;
delete from korisnik where sifra = 2;