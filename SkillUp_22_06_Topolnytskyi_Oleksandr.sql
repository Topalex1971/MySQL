create database CHESS_TOURNAMENT;
use CHESS_TOURNAMENT;
create table PLAYERS (
player_id int auto_increment primary key,
first_name varchar (30) not null,
last_name varchar (30) not null,
email varchar (50) null,
age int(2) not null
);

insert into PLAYERS values
(null, 'Dwayne', 'Jonsons', 'Dwayn_Rock_Jonsons@gmail.com',  41),
(null, 'Joe', 'Biden', 'Joe_Biden_123@gmail.com',  56),
(null, 'Jeff', 'Bezos', 'Jeff_Amazon_Bezos@gmail.com',  43),
(null, 'Bill', 'Gates', 'Bill_WIN_95_Gates@gmail.com',  64),
(null, 'Kylie', 'Jener', 'Kylie_Pretty_Jener@gmail.com',  23),
(null, 'Robert', 'Downs', 'Rober_Downs@gmail.com',  49),
(null, 'Cristiano', 'Ronaldo', 'Cristiano_the_Gol@gmail.com',  36),
(null, 'Barack', 'Obama', 'Barack_Obama@gmail.com',  58),
(null, 'Justin', 'Beider', 'Justin_Beider@gmail.com',  22),
(null, 'Telor', 'Swift', 'Telor_Swift@gmail.com',  30);

insert into PLAYERS (first_name, last_name, age) values
('John', 'Snow', 31),
('Peter', 'Parker', 21);

select *
   from PLAYERS;

create table GAMES (
game_id int auto_increment primary key,
first_player_id int (2) not null,
second_player_id int (2) not null
);

insert into GAMES (first_player_id, second_player_id) values
(3, 6), (2, 1), (8, 5), (4, 8), (1, 7), (2, 5), (3, 10), (9, 8), (4, 7), (3, 10);

select *
   from GAMES;

create table GAME_RESULTS (
result_id int auto_increment primary key,
result_value varchar (10) not null
);

insert into GAME_RESULTS (result_value) values
('WIN'), ('LOSE'), ('DRAW');

select *
   from GAME_RESULTS;

create table ACHIEVEMENTS (
achiev_id int auto_increment primary key,
achiev_value varchar (20) not null
);

insert into ACHIEVEMENTS (achiev_value) values
('Newbie'), ('Amateur'), ('Professional'), ('Master'), ('Grand Master');

select *
   from ACHIEVEMENTS;
   
create table PLAYER_ACHIEVS (
pair_id int auto_increment primary key,
player_id int(2) not null,
achiev_id int(2) not null
);

insert into PLAYER_ACHIEVS (player_id, achiev_id) values
(2, 1), (2, 2), (2, 3), (7, 1), (5, 1), (5, 2), (1, 1), (9, 1), (10, 1), (3, 1), (7, 2), (8, 1), (8, 2), (8, 3), (3, 4);

select *
   from PLAYER_ACHIEVS;
   
create table PLAYER_RESULTS (
pair_id int auto_increment primary key,
game_id int(2) not null,
player_id int(2) not null,
result_id int(2) not null
);

insert into PLAYER_RESULTS (game_id, player_id, result_id) values
(1, 3, 1), (1, 6, 2), (2, 2, 3), (2, 1, 3), (3, 8, 2), (3, 5, 1), (4, 4, 3), (4, 8, 3), (5, 1, 2), (5, 7, 1), (6, 2, 1), (6, 5, 2), (7, 3, 3), (7, 10, 3), (8, 9, 3), (8, 8, 3), (9, 4, 2), (9, 7, 1), (10, 3, 1), (10, 10, 2);

select *
   from PLAYER_RESULTS;

   
delete
	from PLAYERS
    where player_id > 10;
    
select *
	from PLAYERS;

# Коментарій
/* Коментарій */
-- Коментарій

# int/decimail/date --> =, <>, !=, >, <, >=, <=
# varchar / char --> =, <>, !=

select *
	from PLAYERS;

update PLAYERS
	set first_name = 'Sofia',
		email = 'Sofia_Pretty_Jener@gmail.com'
    where player_id = 5;
    
alter table PLAYERS
add column nikname varchar (20);

update PLAYERS 
set nikname = 'Jack'
where player_id=1;

update PLAYERS 
set nikname = 'Ann'
where player_id=2;

update PLAYERS 
set nikname = 'Kale'
where player_id=3;

update PLAYERS 
set nikname = 'Bob'
where player_id=4;

update PLAYERS 
set nikname = 'Pop'
where player_id=5;

update PLAYERS 
set nikname = 'Bask'
where player_id=6;

update PLAYERS 
set nikname = 'Sarah'
where player_id=7;

update PLAYERS 
set nikname = 'John'
where player_id=8;

# FOREIGN KEY

alter table GAMES
add constraint FK_GAMES_PLAYERS
foreign key (game_id)
references PLAYERS (player_id);

alter table GAMES
add constraint FK2_GAMES_PLAYERS
foreign key (first_player_id)
references PLAYERS (player_id);

alter table PLAYER_ACHIEVS
add constraint FK_PLAYER_ACHIEVS_PLAYERS
foreign key (player_id)
references PLAYERS (player_id);

alter table PLAYER_ACHIEVS
add constraint FK_PLAYER_ACHIEVS_ACHIEVEMENTS
foreign key (achiev_id)
references ACHIEVEMENTS (achiev_id);

alter table PLAYER_RESULTS
add constraint FK_PLAYER_RESULTS_PLAYERS
foreign key (player_id)
references PLAYERS (player_id);

alter table PLAYER_RESULTS
add constraint FK_PLAYER_RESULTS_GAMES
foreign key (game_id)
references GAMES (game_id);

alter table PLAYER_RESULTS
add constraint FK_PLAYER_RESULTS_GAME_RESULTS
foreign key (result_id)
references GAME_RESULTS (result_id);
       
select*
from GAMES;

select*
from  GAME_RESULTS;

select*
from  PLAYERS;    
select*
from  PLAYER_ACHIEVS;
select*
from  ACHIEVEMENTS;


ALTER TABLE PLAYERS DROP FOREIGN KEY FK_PLAYERS_GAMES;

ALTER TABLE PLAYERS DROP COLUMN game_id;

# --------------------------------
# ПРАКТИЧНА РОБОТА №2

use CHESS_TOURNAMENT;
# ВПРАВА 1
select PLAYERS.first_name, PLAYERS.last_name, PLAYERS.email
	from PLAYERS
	join GAMES on PLAYERS.player_id  = GAMES.game_id 
	where GAMES.first_player_id = 1;

# ВПРАВА 2
select t1.player_id, t1.first_name, t1.email, t3.achiev_value 
	from PLAYERS as t1 
	join PLAYER_ACHIEVS as t2 on t1.player_id  = t2.player_id 
    join ACHIEVEMENTS as t3 on t3.achiev_id  = t2.achiev_id 
	where t1.player_id <= 5;
    
select*
from  PLAYERS;    
select*
from  PLAYER_RESULTS;
select*
from  GAME_RESULTS;

# ВПРАВА 3
# PLAYERS,  PLAYER_RESULTS и GAME_RESULTS.**
select t1.player_id,  t1.first_name, t1.last_name, t1.email, t1.age, t3.result_value 
	from PLAYERS as t1 
	join PLAYER_RESULTS as t2 on t1.player_id  = t2.player_id 
    join GAME_RESULTS as t3 on t3.result_id  = t2.result_id 
	where t3.result_value = 'WIN';

# ВПРАВА 4
# PLAYER_ACHIEVS и ACHIEVEMENTS.
select t1.first_name, t1.last_name, count(t3.achiev_id) as 'К-ть досягнень' 
	from PLAYERS as t1 
	join PLAYER_ACHIEVS as t2 on t1.player_id  = t2.player_id 
    join ACHIEVEMENTS as t3 on t3.achiev_id  = t2.achiev_id
    group by t1.first_name;

select*
from  PLAYERS;    
select*
from  ACHIEVEMENTS;
select*
from  PLAYER_ACHIEVS;

# ВПРАВА 5
# PLAYERS, PLAYER_RESULTS, GAMES.
select t1.first_name, count(t3.second_player_id) as count_of_games 
	from PLAYERS as t1 
	join PLAYER_RESULTS as t2 on t1.player_id  = t2.player_id 
    join GAMES as t3 on t3.game_id  = t2.game_id
    group by t1.first_name
    order by count_of_games desc;

select*
from  PLAYERS;    
select*
from  GAMES;
select*
from  PLAYER_RESULTS;

# ВПРАВА 6
# PLAYERS, PLAYER_RESULTS, GAMES.
select t1.first_name, t1.email 
	from PLAYERS as t1 
    where player_id in (select first_player_id from GAMES);
    
select*
from  PLAYERS;    
select*
from  GAMES;
select*
from  PLAYER_RESULTS;