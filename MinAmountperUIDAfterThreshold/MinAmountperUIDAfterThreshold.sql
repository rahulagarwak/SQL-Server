declare @threshold int;
set @threshold = 500;

create table #Transactions (UID int, TrID Int, TrAmount int)
insert into #Transactions values (100,1	,100),(100,2,150),(100,3,120),(100,4,200),(100,5,100),(100,6,140);
insert into #Transactions values (101,1	,100),(101,2,150),(101,3,120),(101,4,200),(101,5,100),(101,6,140);

with cte as (
select *, sum(TrAmount) over(partition by UID order by TrID) CumSum from #Transactions
),
cte1 as (
select *, ROW_NUMBER() over(partition by UID order by TrID) [R_num] from cte
where CumSUm>@threshold
)

select UID, TrID from cte1 where R_num=1

select * from #Transactions

drop table #Transactions