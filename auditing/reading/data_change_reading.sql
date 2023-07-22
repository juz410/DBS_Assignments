USE DBS_Assignments;
DECLARE @AuditFilePath VARCHAR(8000);

SELECT @AuditFilePath = audit_file_path
FROM sys.dm_server_audit_status
WHERE audit_id = (SELECT audit_id FROM sys.server_audits WHERE name = 'AllTables_DML_AUDIT')

SELECT action_id, event_time, database_name, database_principal_name, object_name, statement
FROM sys.fn_get_audit_file(@AuditFilePath, default, default)
WHERE database_name = 'DBS_Assignments'
ORDER BY event_time DESC;
