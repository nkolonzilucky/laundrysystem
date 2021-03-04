drop table user;
create table user (
	user_id BIGINT NOT NULL unique auto_increment,
    name varchar(10) NOT NULL,
    surname varchar(10) NOT NULL,
    cellphone varchar(10) NOT NULL unique,
    type enum("admin","customer") default "customer",
    time_stamp timestamp not null default current_timestamp,
    primary key(user_id)
);

alter table user auto_increment = 0;

alter table user modify time_stamp timestamp not null default current_timestamp;
update user set time_stamp = current_timestamp where user_id = 7;  

alter table user drop timestamp;
alter table user add time_stamp timestamp default current_timestamp;

insert into user (name,surname,cellphone,type) value("Vovo","Mbovu","0631234767","admin");
insert into user (name,surname,cellphone,type) value("Nosiphiwo","Mbovu","0631234757","admin");
select * from user;
delete from user where user_id = 1;
delete from user where user_id in (2,3,4,5);

create table item (
	item_id BIGINT NOT NULL unique auto_increment,
    name enum('WHITE_SHIRT','WHITE_TSHIRT','BLACK_TROUSER','BLACK_SOCKS_PAIR','BLACK_UNDERWEAR','BLACK_TIE') unique not null,
    price INT NOT NULL,
    time_stamp timestamp not null default current_timestamp,
    primary key(item_id)
);


drop table laundry;
alter table laundry drop timestamp;
describe laundry;
alter table laundry drop times_tamp;
alter table laundry add time_stamp timestamp not null default current_timestamp;
create table laundry (
	laundry_id BIGINT NOT NULL unique auto_increment,
    user_id BIGINT NOT NULL,
    laundry_status enum('WAITING','WASHING','IRONING','READY') default 'WAITING' not null,
    time_stamp timestamp not null default current_timestamp,
    primary key(laundry_id),
    foreign key(user_id) references user(user_id)
);

drop table laundry_item;
create table laundry_item (
    laundry_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    primary key(laundry_id,item_id),
    foreign key(laundry_id) references laundry(laundry_id),
    foreign key(item_id) references item(item_id)
);

describe hibernate_sequence;
select * from hibernate_sequence; where next_val=5;
update laundrySystem.hibernate_sequence set next_val=0; where next_val=5;
SET SQL_SAFE_UPDATES=0;
