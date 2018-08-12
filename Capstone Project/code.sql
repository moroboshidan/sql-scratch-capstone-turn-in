select * from survey limit 10;
 
select question, count(question) from survey group by question;

select * from quiz limit 5;
select * from home_try_on limit 5;
select * from purchase limit 5;

with left_join as (
  select distinct q.user_id as 'user_id', 
  h.user_id is not null as 'is_home_try_on', 
  h.number_of_pairs as 'number_of_pairs',
  p.user_id is not null as 'is_purchase'
  from quiz as 'q'
  left join home_try_on as 'h' 
  on h.user_id = q.user_id
  left join purchase as 'p' 
  on p.user_id = q.user_id
)
select * from left_join limit 10;

with left_join as (
  select distinct q.user_id as 'user_id', 
  h.user_id is not null as 'is_home_try_on', 
  h.number_of_pairs as 'number_of_pairs',
  p.user_id is not null as 'is_purchase'
  from quiz as 'q'
  left join home_try_on as 'h' 
  on h.user_id = q.user_id
  left join purchase as 'p' 
  on p.user_id = q.user_id
)
select sum(is_home_try_on), sum(is_purchase)
from left_join
where is_home_try_on = 1 and is_purchase = 1;

select number_of_pairs, count(distinct user_id) from home_try_on group by number_of_pairs;

select style, count(style) from quiz group by style;

select style, count(style) from purchase group by style;