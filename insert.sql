use mydb;
set foreign_key_checks = 0;
truncate table item;
truncate table scat;
truncate table mcat;
truncate table payment;
set foreign_key_checks = 1;

insert into mcat(name) values ('수입');
insert into mcat(name) values ('저축/연금');
insert into mcat(name) values ('카드대금');
insert into mcat(name) values ('식비');
insert into mcat(name) values ('생활용품');
insert into mcat(name) values ('공과금');
insert into mcat(name) values ('통신비');
insert into mcat(name) values ('교통비');
insert into mcat(name) values ('문화생활');
insert into mcat(name) values ('경조사');
insert into mcat(name) values ('건강미용');
insert into mcat(name) values ('기타');

insert into scat(name, mcat_id) select '월급', m.id from mcat m where m.name = '수입';
insert into scat(name, mcat_id) select '상여금', m.id from mcat m where m.name = '수입';
insert into scat(name, mcat_id) select '저축이자', m.id from mcat m where m.name = '수입';
insert into scat(name, mcat_id) select '수익금', m.id from mcat m where m.name = '수입';
insert into scat(name, mcat_id) select '기타수입', m.id from mcat m where m.name = '수입';
insert into scat(name, mcat_id) select '적금', m.id from mcat m where m.name = '저축/연금';
insert into scat(name, mcat_id) select '보험', m.id from mcat m where m.name = '저축/연금';
insert into scat(name, mcat_id) select '펀드', m.id from mcat m where m.name = '저축/연금';
insert into scat(name, mcat_id) select '연금', m.id from mcat m where m.name = '저축/연금';
insert into scat(name, mcat_id) select '카드대금', m.id from mcat m where m.name = '카드대금';
insert into scat(name, mcat_id) select '주식', m.id from mcat m where m.name = '식비';
insert into scat(name, mcat_id) select '간식', m.id from mcat m where m.name = '식비';
insert into scat(name, mcat_id) select '재료', m.id from mcat m where m.name = '식비';
insert into scat(name, mcat_id) select '술/음료', m.id from mcat m where m.name = '식비';
insert into scat(name, mcat_id) select '생활잡화', m.id from mcat m where m.name = '생활용품';
insert into scat(name, mcat_id) select '의류비', m.id from mcat m where m.name = '생활용품';
insert into scat(name, mcat_id) select '화장품', m.id from mcat m where m.name = '생활용품';
insert into scat(name, mcat_id) select '세탁비', m.id from mcat m where m.name = '생활용품';
insert into scat(name, mcat_id) select '주방용품', m.id from mcat m where m.name = '생활용품';
insert into scat(name, mcat_id) select '가구가전', m.id from mcat m where m.name = '생활용품';
insert into scat(name, mcat_id) select '기타', m.id from mcat m where m.name = '생활용품';
insert into scat(name, mcat_id) select '관리비', m.id from mcat m where m.name = '공과금';
insert into scat(name, mcat_id) select '가스료', m.id from mcat m where m.name = '공과금';
insert into scat(name, mcat_id) select '전기료', m.id from mcat m where m.name = '공과금';
insert into scat(name, mcat_id) select '기타', m.id from mcat m where m.name = '공과금';
insert into scat(name, mcat_id) select '인터넷', m.id from mcat m where m.name = '통신비';
insert into scat(name, mcat_id) select '휴대폰', m.id from mcat m where m.name = '통신비';
insert into scat(name, mcat_id) select '기차/버스비', m.id from mcat m where m.name = '교통비';
insert into scat(name, mcat_id) select '대중교통비', m.id from mcat m where m.name = '교통비';
insert into scat(name, mcat_id) select '택시비', m.id from mcat m where m.name = '교통비';
insert into scat(name, mcat_id) select '기타', m.id from mcat m where m.name = '교통비';
insert into scat(name, mcat_id) select '관람', m.id from mcat m where m.name = '문화생활';
insert into scat(name, mcat_id) select '도서', m.id from mcat m where m.name = '문화생활';
insert into scat(name, mcat_id) select '여행', m.id from mcat m where m.name = '문화생활';
insert into scat(name, mcat_id) select '운동', m.id from mcat m where m.name = '문화생활';
insert into scat(name, mcat_id) select '취미', m.id from mcat m where m.name = '문화생활';
insert into scat(name, mcat_id) select '기타', m.id from mcat m where m.name = '문화생활';
insert into scat(name, mcat_id) select '축의금', m.id from mcat m where m.name = '경조사';
insert into scat(name, mcat_id) select '부의금', m.id from mcat m where m.name = '경조사';
insert into scat(name, mcat_id) select '용돈', m.id from mcat m where m.name = '경조사';
insert into scat(name, mcat_id) select '선물', m.id from mcat m where m.name = '경조사';
insert into scat(name, mcat_id) select '식사대접', m.id from mcat m where m.name = '경조사';
insert into scat(name, mcat_id) select '모임회비', m.id from mcat m where m.name = '경조사';
insert into scat(name, mcat_id) select '기타', m.id from mcat m where m.name = '경조사';
insert into scat(name, mcat_id) select '약제비', m.id from mcat m where m.name = '건강미용';
insert into scat(name, mcat_id) select '병원비', m.id from mcat m where m.name = '건강미용';
insert into scat(name, mcat_id) select '미용', m.id from mcat m where m.name = '건강미용';
insert into scat(name, mcat_id) select '기타', m.id from mcat m where m.name = '건강미용';
insert into scat(name, mcat_id) select '대출상환', m.id from mcat m where m.name = '기타';
insert into scat(name, mcat_id) select '대출이자', m.id from mcat m where m.name = '기타';
insert into scat(name, mcat_id) select '기타', m.id from mcat m where m.name = '기타';

insert into payment(name) values ('현금');
insert into payment(name) values ('종헌씨티');
insert into payment(name) values ('종헌체크');
insert into payment(name) values ('윤희신한');
insert into payment(name) values ('윤희롯데');
insert into payment(name) values ('윤희삼성');
insert into payment(name) values ('종헌우리');
insert into payment(name) values ('종헌롯데');
insert into payment(name) values ('종헌신한');

insert into item(item_date, mcat_id, scat_id, contents, payment_id, income, outcome) values 
    ('2017-03-01', 1, 1, '점심 (순대국)', 2, 0, 6000);
-- or
insert into item(item_date, mcat_id, scat_id, contents, payment_id, income, outcome)
    select '2017-02-28', m.id, s.id, '결혼식', p.id, 0, 50000
    from   mcat m, scat s, payment p
    where m.name = '경조사' and s.name = '축의금' and m.id = s.mcat_id and p.name = '현금';

    