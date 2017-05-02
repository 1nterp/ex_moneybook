use mydb;

select DATE_FORMAT(i.datetime, '%Y/%m/%d'), m.name, s.name, i.contents, p.name, i.income, i.outcome 
from   item i, mcat m, scat s, payment p 
where i.mcat_id = m.id and i.scat_id = s.id and i.payment_id = p.id;
