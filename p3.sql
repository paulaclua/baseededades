-- exemple de fitxer sql per a crear una mini base de dades

-- sobre l'exemple d'una prova curta exer 11 La cultura del vi
-- crearem la BD corresponent a les entitats VARIETAT, VI i la 
-- interrelació CUPATGE

-- exemple actualitzat per a obligar a treballar amb taules INNODB

drop database p3;

create database p3;
use p3;

create table paisos (
  nom varchar(20),
  pot_desenv varchar(10),
  tractat_signat varchar(10) check( tractat_signat = 'S' OR tractat_signat = 'N' OR tractat_signat = 'desconegut'),
  constraint pk_paisos primary key (nom)
) engine=innodb;


insert into paisos(nom, pot_desenv, tractat_signat) values ('Espanya', 'SI', 'S');
insert into paisos(nom, pot_desenv, tractat_signat)
insert into paisos(nom, pot_desenv, tractat_signat)
insert into paisos(nom, pot_desenv, tractat_signat)

create table laboratoris (
  codi int(15),
  nom varchar(20),
  pais varchar(20) NOT NULL,
  constraint pk_laboratoris primary key (codi),
  constraint fk_laboratoris foreign key (pais) references paisos(nom)
) engine=innodb;


create table zones_biocontencio (
  codi int(20),
  codiLab int(20),
  nivell varchar(10) check(nivell = 'A' or nivell= 'M' or nivell= 'B'),
  responsable varchar(10),
  constraint pk_zones_biocontencio primary key (codi, codiLab),
  constraint fk_zones_biocontencio foreign key (codiLab) references laboratoris(codi),
  constraint fk_zones_biocontencio2 foreign key (responsable) references qualificats(num_pass)
) engine=innodb;

create table armes_biologiques (
  nom varchar(20),
  fecha date(20), 
  potencial int check(potencial >= 1 AND potencial <= 10),
  zona int(20),
  lab int(20),
  constraint pk_armes_biologiques primary key (nom),
  constraint fk_armes_biologiques foreign key (zona) references zones_biocontencio(codi),
  constraint fk_armes_biologiques2 foreign key (lab) references zones_biocontencio(codiLab),
) engine=innodb;


create table empleats (
  num_pass int(20),
  nom varchar(20),
  constraint pk_empleats primary key (num_pass),
) engine=innodb;


create table ordinaris (
  num_pass int(20),
  constraint pk_ordinaris primary key (num_pass),
  constraint fk_ordinaris foreign key (num_pass) references empleats(num_pass)
) engine=innodb;

create table qualificats (
  num_pass int(20),
  titulacio varchar(20),
  zona_assignada int(20),
  lab int(20) NOT NULL ,
  constraint pk_empleats primary key (num_pass),
  constraint fk_ordinaris foreign key (num_pass) references empleats(num_pass),
  constraint fk_ordinaris1 foreign key (zona_assignada, lab) references zones_biocontencio(codi, codiLab)
) engine=innodb;

create table assignacions (
  fecha date(20)
  empl_ord varchar(20),
  zona int(20),
  Lab int(20),
  data_fi 
  constraint pk_ordinaris primary key (fecha),
  constraint pk_ordinaris1 primary key (empl_ord),
  constraint fk_ordinaris foreign key (empl_ord) references ordinaris(num_pass),
  constraint fk_ordinaris1 foreign key (zona,lab) references zones_biocontencio(codi, codiLab)
) engine=innodb;
