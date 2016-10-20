
alter table game add check_table bool default false; 
alter table game add check_objectives bool default false; 
alter table game add check_zones bool default false; 
alter table game add check_forces bool default false; 
alter table game add check_players bool default false; 
insert into migration (name) values ('Add CheckList checks to the Game Table');

	