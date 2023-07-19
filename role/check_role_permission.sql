-- Check permissions for Members
SELECT 
    obj.name AS table_name,
    perm.permission_name, 
    perm.state_desc
FROM 
    sys.database_permissions AS perm
JOIN 
    sys.database_principals AS pr
ON 
    perm.grantee_principal_id = pr.principal_id 
JOIN 
    sys.objects AS obj
ON 
    perm.major_id = obj.object_id
WHERE 
    pr.name = 'Members';

-- Check permissions for StoreClerks
SELECT 
    obj.name AS table_name,
    perm.permission_name, 
    perm.state_desc
FROM 
    sys.database_permissions AS perm
JOIN 
    sys.database_principals AS pr
ON 
    perm.grantee_principal_id = pr.principal_id 
JOIN 
    sys.objects AS obj
ON 
    perm.major_id = obj.object_id
WHERE 
    pr.name = 'StoreClerks';

-- Check permissions for DBA
SELECT 
    obj.name AS table_name,
    perm.permission_name, 
    perm.state_desc
FROM 
    sys.database_permissions AS perm
JOIN 
    sys.database_principals AS pr
ON 
    perm.grantee_principal_id = pr.principal_id 
JOIN 
    sys.objects AS obj
ON 
    perm.major_id = obj.object_id
WHERE 
    pr.name = 'DBA';

-- Check permissions for Management
SELECT 
    obj.name AS table_name,
    perm.permission_name, 
    perm.state_desc
FROM 
    sys.database_permissions AS perm
JOIN 
    sys.database_principals AS pr
ON 
    perm.grantee_principal_id = pr.principal_id 
JOIN 
    sys.objects AS obj
ON 
    perm.major_id = obj.object_id
WHERE 
    pr.name = 'Management';
