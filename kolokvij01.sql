drop database if exists kolokvij01;
create database kolokvij01;
use kolokvij01;

create table sestra(
sifra int not null primary key auto_increment,
jmbag char(11),
hlace varchar(42) not null,
vesta varchar(41),
prviputa datetime not null,
modelnaocala varchar(33),
becar int 
);

create table becar(
sifra int not null primary key auto_increment,
drugiputa datetime not null,
carape varchar(36),
bojaociju varchar(46),
haljina varchar(32)
);

create table ostavljena(
sifra int not null primary key auto_increment,
jmbag char(11),
bojaociju varchar(46),
suknja varchar(31) not null,
bojakose varchar(35) not null,
prviputa datetime,
carape varchar(41)
);

create table mladic(
sifra int not null primary key auto_increment,
prstena int not null,
maraka decimal(15,9) not null,
suknja varchar(30) null,
narukvica int not null,
ostavljena int not null
);

create table ostavljena_snasa(
sifra int not null primary key auto_increment,
ostavljena int not null,
snasa int not null
);

create table snasa(
sifra int not null primary key auto_increment,
eura decimal(14,5),
narukvica int,
drugiputa datetime not null,
carape varchar(41)
);

create table cura(
sifra int not null primary key auto_increment,
bojakose varchar(36),
jmbag char(11) not null,
prstena int not null,
dukserica varchar(38),
mladic int not null
);

create table punac(
sifra int not null primary key auto_increment,
ekstroventno bit not null,
vesta varchar(31),
asocijalno bit not null,
prviputa datetime,
eura decimal(15,6) not null,
cura int
);

alter table sestra add foreign key (becar) references becar(sifra);

alter table mladic add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena_snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table cura add foreign key(mladic) references mladic(sifra);

alter table ostavljena_snasa add foreign key (snasa) references snasa(sifra);

alter table punac add foreign key (cura) references cura (sifra);

select * from cura;
insert into cura(sifra,bojakose,jmbag,prstena,dukserica,mladic)values
(null,'plava','0987615434',1,'Plava duksa',1),
(null,'crna','09871265434',2,'Nema',2),
(null,'smeđa','0984576421',3,'Crvena duksa',3);

select * from mladic;
insert into mladic(sifra,prstena,maraka ,suknja,narukvica,ostavljena)values
(null,1,200,'Zelena',1,1),
(null,2,1000,'Plava',2,2),
(null,3,500,'Crvena',3,3);

select * from ostavljena;
insert into ostavljena(sifra,jmbag,bojaociju,suknja,bojakose,prviputa,carape)values
(null,'99774433771','Plava','Plava','Plava','2020-05-01','Plave'),
(null,'11886644331','Crvena','Crvena','Crvena','2020-08-20','Crvena'),
(null,'00553311774','Crna','Crna','Crna','2010-09-23','Crna');

select * from snasa;
insert into snasa (sifra,eura,narukvica,drugiputa,carape)values
(null,100,1,14,'Plave'),
(null,200,2,13,'Crne'),
(null,300,3,12,'Crvene');

select * from ostavljena_snasa;
insert into ostavljena_snasa (sifra,ostavljena,snasa)values
(null,1,1),
(null,2,2),
(null,3,3);