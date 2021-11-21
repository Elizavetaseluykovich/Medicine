create database polyclinicsDB;

use polyclinicsDB;

create table doctors 
(
	id_doctor int auto_increment primary key, 
    Full_name varchar(100), 
    id_specialty int , 
    room_nmbr int, 
    phone_nmbr varchar(20),
    foreign key(id_specialty) references specialty (id_specialty)
);

create table patients 
(
	id_patient int auto_increment primary key,
    surname varchar(30), 
    name varchar(30), 
    patronymic varchar(30),
    gender varchar(1),
    adress text,
    phone varchar(50)
);

create table specialty 
(
	id_specialty int auto_increment primary key,
    specialty varchar(100)
);

create table registrations
(
	id_registration int auto_increment primary key,
    id_doctor int, 
    date datetime,
    foreign key(id_doctor) references doctors(id_doctor)
);

create table examinations
(
	id_examination int auto_increment primary key,
    description text
);

create table complaints
(
	id_complaint int auto_increment primary key,
    description text
);

create table visits
(
	id_visit int auto_increment primary key,
    id_patient int, 
    id_registration int, 
    id_examination int, 
    id_complaint int,
    foreign key(id_patient) references patients (id_patient),
    foreign key(id_registration) references registrations(id_registration),
    foreign key(id_examination) references examinations(id_examination),
    foreign key(id_complaint) references complaints(id_complaint)
);


select * from visits;
select * from complaints;
select * from examinations;
select * from registrations;
select * from specialty;
select * from patients;
select * from doctors ;

drop database polyclinicsDB;