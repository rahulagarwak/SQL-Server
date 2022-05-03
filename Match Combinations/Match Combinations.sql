create table #temp (Id int, CName Varchar(max))
insert into #temp values (1,'India'), (2,'Australia'), (3,'Srilanka'), (4,'England')

select * from #temp

select distinct
case when unicode(t1.CName)<unicode(t2.CName) then t1.CName + ' VS ' + t2.CName else t2.CName + ' VS ' + t1.CName end [match]
from #temp as t1 cross join #temp as t2
where  t1.CName<>t2.CName

drop table #temp