# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\frizerski.sql
drop database if exists frizerski;
create database frizerski;
use frizerski;

create table djelatnica(
     sifra int not null primary key auto_increment,
     ime varchar(50) not null,
     prezime varchar(50) not null,
     placa int,
     email varchar(100) not null,
     ugovor varchar(50),
     oib char(11),
     dob int
);

create table korisnik(
    sifra int not null primary key auto_increment,
    frizura varchar(50) not null,
    spol char(1) not null,
    dob int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena int not null
);

create table posjeta(
   sifra int not null primary key auto_increment,
   djelatnica int not null,
   korisnik int not null,
   usluga int not null
);



alter table posjeta add foreign key (djelatnica) references djelatnica(sifra);
alter table posjeta add foreign key (korisnik) references korisnik(sifra);
alter table posjeta add foreign key (usluga) references usluga(sifra);

# show tables;

select * from djelatnica;

insert into djelatnica (sifra, ime, prezime, placa, email, ugovor, oib, dob)values
(1, 'Ivana', 'Živić', 5000, 'marica.maric@gmail.com', null, 23567345241, 23),
(2, 'Ivana', 'Ivić', 5000, 'ivana.ivic@gmail.com', null, 76834567940, 38),
(3, 'Marta', 'Ivić', 5000, 'marta.ivic@gmail.com', null, 67353456692, 21);

select * from korisnik;

insert into korisnik (sifra, frizura, spol, dob)values
(1, 'kratka', 'm', 23),
(2, 'duga', 'z', 22),
(3, 'kratka', 'm', 35);

select * from usluga;

insert into usluga (sifra, naziv, cijena)values
(1, 'musko sisanje', 30),
(2, 'zensko bojanje', 120),
(3, 'sisanje i brijanje', 60);

select * from posjeta;

insert into posjeta (djelatnica, korisnik , usluga )values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

update djelatnica set prezime = 'Markovic' where sifra = 2;
update korisnik set frizura = 'duga' where sifra = 3;
update usluga set naziv = 'brijanje' where sifra = 3;

delete from posjeta where sifra = 2;
delete from usluga where sifra = 2;
delete from korisnik where sifra = 2;
delete from djelatnica where sifra = 2;