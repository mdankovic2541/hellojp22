# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\samostan.sql
drop database if exists samostan;
create database samostan;
use samostan;

create table svecenik(
	sifra int not null primary key auto_increment,
	osoba int not null,
	posao int not null
);

create table posao(
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null,
    trajanje int not null,
    opis text
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datum datetime,
    dob int not null,
    vrsta_reda varchar(50) not null
);

create table nadredjeni(
	sifra int not null primary key auto_increment,
	osoba int not null,
	posao int not null,
	svecenik int not null
);

alter table nadredjeni add foreign key(osoba) references osoba(sifra);
alter table nadredjeni add foreign key(posao)references posao(sifra);
alter table nadredjeni add foreign key(svecenik)references svecenik(sifra);

select * from posao;

insert into posao(sifra,vrsta,trajanje,opis)values 
(null,'Ispovijed',10,'Ispovijed grijeha'),
(null,'Vjenčanje',60,'Crkveno sklapanje braka muža i žene'),
(null,'Sahrana',30,'Pokop preminule osobe');

select * from osoba;

insert into osoba(sifra,ime,prezime,dob, vrsta_reda)values
(null,'Ivan','Markotić',43,'isusovac'),
(null,'Marko','Josipović',37,'isusovac'),
(null,'Petar','Perić',51,'karmelićanin');

select * from svecenik;

insert into svecenik(osoba,posao,sifra)values
(2,2,null),
(1,3,null),
(3,1,null);

select * from nadredjeni;

insert into nadredjeni(sifra,osoba,posao,svecenik)values
(null,2,3,1),
(null,3,1,2),
(null,1,2,3);

update osoba set ime = 'Luka' where sifra= 1;
update posao set vrsta= 'Sveta Misa' where sifra = 3;

delete from svecenik where sifra = 3;
delete from nadredjeni where sifra  = 3;