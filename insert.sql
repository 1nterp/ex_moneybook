use mydb;
set foreign_key_checks = 0;
truncate table item;
truncate table scat;
truncate table mcat;
truncate table payment;
set foreign_key_checks = 1;

insert into mcat(name) values ('식비');
insert into scat(name, mcat_id) select '주식', m.id from mcat m where m.name = '식비';

insert into mcat(name) values ('경조사');
insert into scat(name, mcat_id) select '축의금', m.id from mcat m where m.name = '경조사';

insert into mcat(name) values ('생활잡화');
insert into scat(name, mcat_id) select '기타잡화', m.id from mcat m where m.name = '생활잡화';

insert into mcat(name) values ('수입');
insert into scat(name, mcat_id) select '주급', m.id from mcat m where m.name = '수입';

insert into payment(name) values ('현금');
insert into payment(name) values ('우리카드');
insert into payment(name) values ('신한카드');

insert into item(datetime, mcat_id, scat_id, contents, payment_id, income, outcome) values 
    ('2017-03-01', 1, 1, '점심 (순대국)', 2, 0, 6000);
-- or
insert into item(datetime, mcat_id, scat_id, contents, payment_id, income, outcome)
    select '2017-02-28', m.id, s.id, '결혼식', p.id, 0, 50000
    from   mcat m, scat s, payment p
    where m.name = '경조사' and s.name = '축의금' and m.id = s.mcat_id and p.name = '현금';
