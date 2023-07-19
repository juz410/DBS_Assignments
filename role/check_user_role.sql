SELECT
    u.name AS UserName,
    r.name AS RoleName
FROM
    sys.database_principals AS u
JOIN 
    sys.database_role_members AS rm ON u.principal_id = rm.member_principal_id
JOIN 
    sys.database_principals AS r ON rm.role_principal_id = r.principal_id;
