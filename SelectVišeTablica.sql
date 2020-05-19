select * from grupa;

select * from smjer;

# pravilo dodjeljivanja zamjenskih imena prvim slovom imena 
select 
s.naziv 					 as smjer,
g.naziv 					 as grupa,
concat(o.ime, ' ', o.prezime)as predavac
from grupa g 
inner join smjer s     on s.sifra = g.smjer
inner join predavac p  on p.sifra = g.predavac
inner join osoba o     on o.sifra = p.osoba;

# pravilo dodjeljivanja zamjenskih imena a,b,c,...
#Izlistajte sve polaznike na grupi JP22
select d.ime, d.prezime 
from grupa a 
inner join clan b on a.sifra= b.grupa 
inner join polaznik c on b.polaznik = c.sifra
inner join osoba d on c.osoba = d.sifra
where a.naziv  = 'JP22';

# pravilo bez zamjenskih imena - ne preporučuju se

# right join se ne koristi tako cesto
select b.naziv as smjer, a.naziv as grupa
from grupa a
right join smjer b on a.smjer = b.sifra;

# left join -> KORISTITI
select a.naziv as smjer, b.naziv as grupa
from smjer a
left join grupa b on a.sifra=b.smjer;

# baza knjiznica

# Prikazati sve autore koji su objavili
# knjigu u gradu Osijek

select a.ime, a.prezime
from autor a 
inner join katalog b on a.sifra = b.autor 
inner join mjesto c on b.mjesto = c.sifra
where c.naziv = 'Osijek';
