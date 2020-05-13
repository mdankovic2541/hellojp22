# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22nova\muzej.sql
drop database if exists muzej;
create database muzej;
use muzej;

create table izlozba(
    naziv varchar(50) not null,
    sifra int not null primary key auto_increment,
    trajanje int not null,
    broj int not null,
    kustos int not null,
    djelo int not null,
    sponzor int not null,
    opis text
);

create table djelo(
    broj int not null,
    kustos int not null,
    naziv varchar(50) not null,
    sifra int not null primary key auto_increment,
    opis text,
    datum datetime
);

create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    naziv varchar(50) not null,
    datum datetime
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    oib char(11) not null,
    ugovor varchar(50)
);

alter table izlozba add foreign key (djelo) references djelo(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);
ALTER TABLE izlozba ADD FOREIGN KEY (kustos) REFERENCES kustos(sifra);

alter table djelo add foreign key (kustos) references kustos(sifra);


# show tables;

# select * from kustos;
#describe kustos;

insert into kustos(sifra,ime,prezime,placa,oib,ugovor)values
(null,'Ivan','Ivić',4999.99,'12345678910','234rtt6787654'),
(null,'Petar','Pan',4999.99,'44326778910','2346gh654'),
(null,'Pavle','Sam',4999.99,'12876578910','234ddf4654');

# select * from sponzor;

insert into sponzor(sifra,ime,prezime,naziv)values
(null,'Josipa','Jović','Bla bla'),
(null,'Luka','Lukić','Buu BUU'),
(null,'Mateo','Matic','guu gu');

#select * from djelo;
insert into djelo (broj,kustos,naziv,sifra,opis)values
(2,1,'Neki covjek sjedi',null,'covjek sjedi'),
(67,2,'Neki covjek place',null,'covjek place'),
(89,3,'Neki covjek trci',null,'covjek trci');

# select * from izlozba;
insert into izlozba(naziv,sifra,trajanje,broj,kustos,djelo,sponzor,opis)values
('Izlozba 1',null,30,28,1,1,1,'neki opis'),
('Izlozba 2',null,30,75,2,2,2,'neki opis'),
('Izlozba 3',null,30,109,3,3,3,'neki opis');

update kustos set ime= 'Marko' where sifra=1;
update djelo set broj = 8 where sifra= 3;
update izlozba set trajanje= 28;


