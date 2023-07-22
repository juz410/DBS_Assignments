USE master;
DECLARE @AuditFilePath VARCHAR(8000);

SELECT @AuditFilePath = audit_file_path
FROM sys.dm_server_audit_status
WHERE audit_id = (SELECT audit_id FROM sys.server_audits WHERE name = 'LoginLogout_AUDIT')

SELECT action_id, event_time, server_principal_name, server_principal_id, statement
FROM sys.fn_get_audit_file(@AuditFilePath, default, default)
ORDER BY event_time DESC;
