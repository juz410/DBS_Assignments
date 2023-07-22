USE master;
GO
RESTORE DATABASE DBS_Assignments
FROM DISK = 'C:\Users\User\Desktop\APUfolder\Year3 Sem 2\DBS\Assignments\backup\backup.bak'
WITH MOVE 'DBS_Assignments' TO 'C:\Users\User\Desktop\APUfolder\Year3 Sem 2\DBS\Assignments\backup\new_instance_db\database.mdf',
MOVE 'DBS_Assignments_log' TO 'C:\Users\User\Desktop\APUfolder\Year3 Sem 2\DBS\Assignments\backup\new_instance_db\database_log.ldf';
GO
