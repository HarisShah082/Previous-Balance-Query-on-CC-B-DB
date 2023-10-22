select * from ci_bill; -- bill id , acct id , complete dttm , apay amt , 
select * from ci_bill_sa; -- bill id , sa id , cur amt , tot amt 
--select * from ci_bseg; -- bseg id , sa id , bill id , prem id 
select * from ci_pay; -- pay id , pay event id , acct id , pay amt 
select * from ci_pay_event; -- pay event id , pay dt , cre dttm

select 
bill.bill_id,
bsa.sa_id,
to_char(bill.complete_dttm,'DD-MM-YY HH12:MI:SS') Exact_time,
bsa.tot_amt Previous_Period_Balance
from ci_bill bill
join ci_bill_sa bsa on bsa.bill_id = bill.bill_id
where 
bsa.sa_id ='7663898745' 
and bill.acct_id='7664633442'
and complete_dttm =    
(select max(complete_dttm) from ci_bill
where acct_id = '7664633442' and complete_dttm < (select max(complete_dttm) from ci_bill where acct_id = '7664633442'))
;
