--Problem: Show all the values in a column in a single cell separated by comma

Declare @name varchar(max);
Declare @i varchar(max);

create table #temp (Id int, CName Varchar(max))
insert into #temp values (1,'India'), (2,'Australia'), (3,'Srilanka'), (4,'England')

select * from #temp

declare c cursor for 
select CName from #temp

open c
fetch next from c into @i

while @@FETCH_STATUS=0
begin
set @name = concat_ws(',',@name,@i)
fetch next from c into @i
end

select @name

CLOSE c
DEALLOCATE c
drop table #temp
