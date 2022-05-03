create table #SeatStatus (SeatNo Int, Status varchar(1))
insert into #SeatStatus values (1	,'O'),(2	,'O'),(3	,'A'),(4	,'A'),(5	,'A'),(6	,'O'),(7	,'A'),(8	,'O'),(9	,'O'),
(10	,'O'),(11	,'O'),(12	,'A'),(13	,'A'),(14	,'O'),(15	,'O'),(16	,'A'),(17	,'O'),(18	,'A'),(19	,'A'),(20	,'A')

create table #visual (RowA Int, RowB Int)
insert into #visual values (1,2),(3,4),(5,6),(7,8),(9,10),(11,12),(13,14),(15,16),(17,18),(19,20)

--#SeatStatus shows the current status of the seats
select * from #SeatStatus
--#visual shows the two columns in a bus and seat numbers
select * from #visual

--finding the row with consecutive seats with status 'A' [available]

select ss1.SeatNo, ss2.SeatNo, ss1.Status, ss2.Status from #SeatStatus ss1 cross join #SeatStatus ss2
where ss1.Status = ss2.Status and ss1.Status = 'A' and ss2.SeatNo-ss1.SeatNo=1 and ss1.SeatNo%2=1

drop table #SeatStatus
drop table #visual