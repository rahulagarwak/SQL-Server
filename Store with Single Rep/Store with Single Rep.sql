create table #store (StoreID int, Location varchar(max), StoreName varchar(max))
create table #salesman (SalesmanID int, StoreID int)

insert into #store values (1,'New York','A'),(2,'New Jersey','B'),(3,'New York','C'),(4,'Los Angeles','D')
insert into #salesman values (1,1),(2,1),(3,2),(4,3)

select * from #store
select * from #salesman

select st.StoreName, count(sa.StoreID) [Counter] from #store st left join #salesman sa on st.StoreID=sa.StoreID
where st.Location = 'New York'
group by st.StoreName
having count(sa.StoreID)=1

drop table #store
drop table #salesman