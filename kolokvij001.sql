drop database if exists kolokvij001;
create database kolokvij001;
use kolokvij001;

create table punac (
	sifra int not null primary key auto_increment,
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null

);

create table cura (
	sifra int not null primary key auto_increment,
	novcica decimal(16,5) not null,
	gustoca decimal(18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar(36),
	punac int 
);

create table sestra(
sifra int not null primary key auto_increment,
introvertno bit ,
haljina varchar(31) not null,
maraka decimal(16,6),
hlace varchar(46) not null,
narukvica int not null
);


create table zena(
sifra int not null primary key auto_increment,
treciputa datetime,
hlace varchar(46),
kratkamajica varchar(31) not null,
jmbag char(11) not null,
bojaociju varchar(39) not null,
haljina varchar(44),
sestra int not null
);

create table muskarac(
sifra int not null primary key auto_increment,
bojaociju varchar(50) not null,
hlace varchar(50) ,
modelnaocala varchar(43),
maraka decimal(14,5) not null,
zena int not null
);

create table  mladic(
sifra int not null primary key auto_increment,
suknja varchar(50) not null,
kuna decimal(16,8) not null,
drugiputa datetime ,
asocijalno bit ,
ekstroventno bit not null,
dukserica varchar(48) not null,
muskarac int
);

create table svekar (
sifra int not null primary key auto_increment,
bojaociju varchar(40) not null,
prstena int ,
dukserica varchar(41),
lipa decimal(13,8),
eura decimal(12,7),
majica varchar(35)
);

create table sestra_svekar(
sifra int not null primary key auto_increment,
sestra int not null,
svekar int not null
);

alter table cura add foreign key(punac) references punac(sifra);
alter table zena add foreign key(sestra) references sestra(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table mladic add foreign key(muskarac) references muskarac(sifra);
alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

select * from sestra;
insert into sestra(sifra,introvertno ,haljina ,maraka ,hlace ,narukvica )values
(null,1,'Plava',100,'Nema',1),
(null,0,'Crvena',300,'Nema',2),
(null,1,'Roza',200,'Nema',3);

select * from zena;
insert into zena(sifra,treciputa ,hlace ,kratkamajica ,jmbag ,bojaociju ,haljina ,sestra )values
(null,'2020-04-10','Plave','Plava','09765321','Plava','Plava',1),
(null,'2020-05-12','Crvena','Crvena','1234781','Crvena','Crvena',2),
(null,'2020-12-12','Crna','Crna','7654341','Crna','Crna',3);

select * from muskarac;
insert into muskarac(sifra,bojaociju,hlace,modelnaocala,maraka,zena)values
(null,'Plava','Plave','Plave okrugle',100,1),
(null,'Crvene','Crvene','Crvene okrugle',300,2),
(null,'Crne','Crne','Crne okrugle',200,3);

select * from svekar;
insert into svekar(sifra,bojaociju,prstena,dukserica,lipa,eura,majica)values
(null,'Plava',1,'Plava',1,100,'Plava'),
(null,'Crvena',2,'Crvena',2,200,'Crvena'),
(null,'Crna',3,'Crna',3,300,'Crna');

select * from sestra_svekar;
insert into sestra_svekar (sifra,sestra,svekar)values
(null,1,1),
(null,2,2),
(null,3,3);

update cura set gustoca = '15,77';

delete from mladic where kuna > '15,78';

select kratkamajica from zena where hlace like '%ana%'; 

select a.dukserica, f.asocijalno , e.hlace , d.hlace 
from svekar a
inner join sestra_svekar b on b.svekar = a.sifra
inner join sestra c on c.sifra = b.sestra 
inner join zena d on d.sestra = c.sifra 
inner join muskarac e on e.zena = d.sifra 
inner join mladic f on f.muskarac = e.sifra 
where d.hlace like 'A%' and c.haljina like '%Ba%'
order by e.hlace desc;


select a.haljina, a.maraka
from sestra a
left join sestra_svekar b on a.sifra = b.sifra;

